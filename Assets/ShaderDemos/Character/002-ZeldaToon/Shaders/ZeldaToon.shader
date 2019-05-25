Shader "Toon/ZeldaToon"
{
    Properties
    {
		_Color("Aldobe",Color) = (1,1,1,1)
        _MainTex ("Texture", 2D) = "white" {}
		[HDR]_AmbientColor("Ambient Color",Color) = (0.4,0.4,0.4,1)
		_ToonOffset("Toon Offset", Range(-1,1)) = 0

		
		[HDR]_RimColor("Rim Color", Color) = (1,1,1,1)
		_RimAmount("Rim Amount", Range(0, 1)) = 0.716
			
		[HDR]_SpecularColor("Specular Color", Color) = (0.9,0.9,0.9,1)
		_Glossiness("Glossiness", Float) = 32
		_RimThreshold("Rim Threshold", Range(0, 1)) = 0.1
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 100

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            // make fog work
            #pragma multi_compile_fog
			#pragma multi_compile_fwdbase

            #include "UnityCG.cginc"
			#include "Lighting.cginc"
			#include "AutoLight.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
				float3 normal : NORMAL;
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                UNITY_FOG_COORDS(2)
                float4 pos : SV_POSITION;
				float3 worldNormal : NORMAL;
				float3 viewDir : TEXCOORD1;
				SHADOW_COORDS(3)
            };

            sampler2D _MainTex;
            float4 _MainTex_ST;
			float4 _Color;
			float4 _AmbientColor;
			float _ToonOffset;
			float _Glossiness;
			float4 _SpecularColor;
			float4 _RimColor;
			float _RimAmount;
			float _RimThreshold;

            v2f vert (appdata v)
            {
                v2f o;
                o.pos = UnityObjectToClipPos(v.vertex);
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);
				o.worldNormal = UnityObjectToWorldNormal(v.normal);
				o.viewDir = WorldSpaceViewDir(v.vertex);
                UNITY_TRANSFER_FOG(o,o.pos);
				TRANSFER_SHADOW(o)
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
				float3 viewDir = normalize(i.viewDir);
				float3 halfDir = normalize(viewDir + _WorldSpaceLightPos0);

				fixed3 normal = normalize(i.worldNormal);
				fixed NdotL = dot(_WorldSpaceLightPos0, normal);
				fixed NdotH = dot(normal, halfDir);
				float shadow = SHADOW_ATTENUATION(i);
				float ramp = smoothstep(_ToonOffset, _ToonOffset + 0.01, NdotL*shadow) * _LightColor0;
				float specularIntensity = pow(NdotH * ramp, _Glossiness * _Glossiness);
				float specularIntensitySmooth = smoothstep(0.005, 0.01, specularIntensity);
				float4 specular = specularIntensitySmooth * _SpecularColor;

				float4 rimDot = 1 - dot(viewDir, normal);
				float rimIntensity = rimDot * pow(NdotL, _RimThreshold);
				rimIntensity = smoothstep(_RimAmount - 0.01, _RimAmount + 0.01, rimIntensity);
				float4 rim = rimIntensity * _RimColor;

				
				fixed4 mainTex = tex2D(_MainTex, i.uv);
                // apply fog
                UNITY_APPLY_FOG(i.fogCoord, col);
                return _Color * mainTex * (rim+ramp + specular + _AmbientColor)*0.5;
            }
            ENDCG
        }
		UsePass "Legacy Shaders/VertexLit/SHADOWCASTER"
    }
}
