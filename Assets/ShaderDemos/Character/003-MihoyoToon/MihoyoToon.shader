Shader "Toon/MihoyoToon"
{
    Properties
    {
        _Color ("Color",Color) = (1,1,1,1)
        _MainTex ("Texture", 2D) = "white" {}
        _ILMTex("ILM Texture", 2D) = "white"{}
        _OutlineColor("Outline Color",Color) = (0,0,0,1)
        _Outline("Outline Width",Range(0,2))=0.5
        _ShadowContrast("ShadowContrast",Range(0,1)) = 0.5
        _SkinShadowColor("SkinShadowColor",Color) = (0.8,0.6,0.6,1)
        _UnSkinShadowColor("UnSkinShadowColor",Color) = (0.6,0.6,0.8,1)
    }
    
    CGINCLUDE
    #include "UnityCG.cginc"
        sampler2D _MainTex;
        sampler2D _ILMTex;
            
        float _Outline;
        float4 _OutlineColor;
            
        float4 _Color;
        float4 _SkinShadowColor;
        float4 _UnSkinShadowColor;
        float _ShadowContrast;  
        struct a2v
        {
            float4 vertex : POSITION;
            float3 normal : NORMAL;
            float4 texcoord:TEXCOORD0;
			float4 color:COLOR;
        };

        struct v2f
        {
            float4 pos : SV_POSITION;
            float4 color : COLOR;
            float4 tex : TEXCOORD0;
        };
           
        v2f vert (a2v v)
        {
            v2f o;
            o.pos = UnityObjectToClipPos(v.vertex);
            //float3 worldNormal = normalize(UnityObjectToWorldNormal(v.normal));
            
           //float3 N = mul(UNITY_MATRIX_MV,v.normal);
            float3 N = UnityObjectToViewPos(v.normal);
            float2 offset = TransformViewToProjection(N.xy);
            o.pos.xy +=offset * _Outline *0.005;
            o.tex = v.texcoord;    
                
			o.color = v.color;
            return o;
        }       
    ENDCG
    
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 100

        CGPROGRAM
        #pragma surface surf CelShadingForward vertex:vertB
        #pragma target 3.0
        
        struct Input
        {
            float2 uv_MainTex;
            float3 vertexColor;
        };
        
        struct v2fB
        {
            float4 pos:SV_POSITION;
        };
        
        void vertB(inout appdata_full v, out Input o)
        {
            UNITY_INITIALIZE_OUTPUT(Input,o);
            o.vertexColor = v.color;
        }
        
        struct SurfaceOutputCustom
        {
            fixed3 Albedo;
            fixed3 Normal;
            fixed3 Emission;
            fixed Alpha;
            half3 BrightColor;
            half3 ShadowColor;
            half SpecShadow;
            half SpecularIntensity;
            half SpecularSize;
        };
        
        half4 LightingCelShadingForward(SurfaceOutputCustom s, half3 lightDir, half3 viewDir,half atten)
        {
            half4 c = half4(0,0,0,1);
            half NdotL = saturate(dot(lightDir,s.Normal));
            half NdotV = saturate(dot(viewDir,s.Normal));
            half specStrength = s.SpecularIntensity;
			NdotL = NdotL;
            c.rgb = NdotL<_ShadowContrast?s.ShadowColor:s.BrightColor+s.SpecularSize*(NdotV+0.4);
            return c;
        }
        
        void surf(Input IN, inout SurfaceOutputCustom o)
        {
            fixed4 c = tex2D(_MainTex, IN.uv_MainTex)*_Color;
            fixed4 cILM = tex2D(_ILMTex,IN.uv_MainTex);
			
            o.BrightColor = c.rgb;
            
            o.ShadowColor = (cILM.r<0.05)?c.rgb *_SkinShadowColor:c.rgb *_UnSkinShadowColor;
            o.SpecularIntensity = cILM.r;
            o.SpecularSize = cILM.b;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
