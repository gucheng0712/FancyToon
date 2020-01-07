Shader "WaterColor/Base" {
    Properties{
        _MainTex("Main Tex", 2D) = "white" {}
        _Outline("Outline", Range(0,1)) = 0.1
        _OutlineColor("Outline Color", Color) = (0, 0, 0, 1)
        _DiffuseColor("Diffuse Color", Color) = (1, 1, 1, 1)
        _EdgeColor("EdgeColor", Color) = (1, 1, 1, 1)
    }
        SubShader{
            Tags { "RenderType" = "Opaque" }
            LOD 200

            Pass {
                NAME "OUTLINE"

                Cull Front

                CGPROGRAM

                #pragma vertex vert
                #pragma fragment frag
                #pragma multi_compile_fog
                #include "UnityCG.cginc"

                float _Outline;
                fixed4 _OutlineColor;


                struct a2v {
                    float4 vertex : POSITION;
                    float3 normal : NORMAL;
                };

                struct v2f {
                    float4 pos : SV_POSITION;
                    float3 worldPos : TEXCOORD2;
                    UNITY_FOG_COORDS(3)
                };

                v2f vert(a2v v) {
                    v2f o;
                    float4 pos = mul(UNITY_MATRIX_MV, v.vertex);
                    float3 normal = mul((float3x3)UNITY_MATRIX_IT_MV, v.normal);
                    pos = pos + float4(normalize(normal), 0) * _Outline;
                    o.pos = mul(UNITY_MATRIX_P, pos);
                    o.worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
                    UNITY_TRANSFER_FOG(o, o.pos);
                    return o;
                }
                    float4 frag(v2f i) : SV_Target {
                    float3 ColorTemp = _OutlineColor.rgb;
                    UNITY_APPLY_FOG(i.fogCoord, ColorTemp);
                    return float4(ColorTemp, 1);
                    }
                    ENDCG
                }

                Pass {
                    Tags { "LightMode" = "ForwardBase" }

                    CGPROGRAM

                    #pragma vertex vert
                    #pragma fragment frag

                    #pragma multi_compile_fwdbase
                    #pragma multi_compile_fog


                    #include "UnityCG.cginc"
                    #include "Lighting.cginc"
                    #include "AutoLight.cginc"
                    #include "UnityShaderVariables.cginc"

                    fixed4 _DiffuseColor;
                    sampler2D _MainTex;
                    float4 _MainTex_ST, _EdgeColor, _ColorTop, _ColorBot;
                    uniform float4 _ShadowColor;

                    struct a2v {
                        float4 vertex : POSITION;
                        float3 normal : NORMAL;
                        float4 texcoord : TEXCOORD0;
                    };

                    struct v2f {
                        float4 pos : SV_POSITION;
                        float2 uv : TEXCOORD0;
                        fixed3 worldNormal : TEXCOORD1;
                        float3 worldPos : TEXCOORD2;
                        SHADOW_COORDS(3)
                        UNITY_FOG_COORDS(5)
                    };

                    v2f vert(a2v v) {
                        v2f o;
                        o.pos = UnityObjectToClipPos(v.vertex);
                        o.uv = TRANSFORM_TEX(v.texcoord, _MainTex);
                        o.worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
                        TRANSFER_SHADOW(o);
                        UNITY_TRANSFER_FOG(o, o.pos);
                        return o;
                    }

                        fixed4 frag(v2f i) : SV_Target {
                        float2 uv = i.uv;
                        UNITY_LIGHT_ATTENUATION(atten, i, i.worldPos);
                        fixed3 ambient = UNITY_LIGHTMODEL_AMBIENT;
                        atten = smoothstep(0.7, 1.5, atten * 2);
                        atten = smoothstep(0.2, 0.8, atten);
                        fixed3 texColor = lerp(tex2D(_MainTex, uv).rgb, _ShadowColor + ambient, 0);
                        texColor = lerp(texColor, 1, 1 - tex2D(_MainTex, uv).a);
                        fixed3 diffuse = _DiffuseColor.rgb * smoothstep(0.35, 0.4, texColor)*texColor;
                        fixed3 DiffuseTemp = ambient + (diffuse)-((1 - atten)*(1 - _ShadowColor))*_ShadowColor.a;
                        UNITY_APPLY_FOG(i.fogCoord, DiffuseTemp);
                        return fixed4(DiffuseTemp, 1);
                    }

                        ENDCG
                }
        }
            FallBack "Diffuse"
}