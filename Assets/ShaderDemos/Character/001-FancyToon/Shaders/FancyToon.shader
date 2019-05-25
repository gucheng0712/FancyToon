
Shader "Toon/FancyToon"
{
	Properties
	{
		[Enum(UnityEngine.Rendering.CullMode)]
		_Cull("Cull Mode", Float) = 2

		[Toggle(RECEIVE_SHADOW)]
		_ReceiveShadow("Receive Shadow?", Float) = 0

		[Space(20)]

		[Header(Main Settings)]
		_MainTex("Texture", 2D) = "white" {}
		_MainColor("MainColor", Color) = (1,1,1,1)
		_Smoothness("Smoothness", Range(0.01,5)) = 0.2
		_Shininess("Shininess", Range(0,1)) = 0.7
		_RampColor("RampColor", Color) = (0.5,0.5,0.5,1)

		[Space(20)]

		[Header(Specular Settings)]
		_SpecularColor("Specular Color",Color) = (1,1,1,1)
		_SpecularIntensity("Specular Intensity",Range(0, 1)) = 0.01
		_SpecularOffset("Specular Offset",Range(0.5,1)) = 0.6

		[Space(20)]

		[Header(Outline Settings)]
		_OutlineWidth("Outline Width", Range(0,0.1)) = 0.002
		_OutlineColor("OutlineColor", Color) = (0,0,0,0)
		_Farthest_Distance("Farthest_Distance", Float) = 10
		_Nearest_Distance("Nearest_Distance", Float) = 0.5
		_Outline_Sampler("Outline_Sampler", 2D) = "white" {}

		[Space(20)]

		[Header(Shadow Settings)]
		_ShadowIntensity("Shadow Intensity", Range(0,1))=0.5

		_ID("Mask ID", Int) = 1

		[Header(Other Settings)]
		_Saturation("Color Saturation",Range(0.5,3)) = 1.0
	}
	SubShader
	{
		Tags { "RenderType" = "Opaque" "Queue" = "Geometry"}

		// This Pass is more used to make the outline of the character
		Pass
		{
			Name "Outline"
			Tags{ "LightMode" = "Always" }
			Cull Front
			CGPROGRAM
			#include "Assets/ShaderLib/OutlineLib.cginc"
			#pragma vertex outline_vert
			#pragma fragment outline_frag
			#pragma target 3.0
			ENDCG
		}

		Pass
		{
			Tags{ "LightMode" = "ForwardBase" }
			Cull[_Cull]
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			//#pragma shader_feature RECEIVE_SHADOW
			//#pragma multi_compile_fwdbase
			#pragma target 3.0

			#include "Lighting.cginc"
			#include "UnityCG.cginc"
			#include "AutoLight.cginc"

			sampler2D _MainTex; float4 _MainTex_ST;
			float _Smoothness;
			float _Shininess;
			float4 _RampColor;
			float4 _MainColor;
			fixed4 _SpecularColor;
			fixed _SpecularIntensity;
			fixed _SpecularOffset;
			fixed _ShadowIntensity;
			float _Saturation;

			struct a2v
			{
				float4 vertex : POSITION;
				float3 normal: NORMAL;
				float4 texcoord : TEXCOORD0;
				float4 color : COLOR;
			};


			struct v2f
			{
				float4 pos : POSITION;
				float2 uv : TEXCOORD0;
				float3 worldNormal : TEXCOORD1;
				float3 viewDir : TEXCOORD2;
				float3 worldPos : TEXCOORD3;
				float4 vertColor : COLOR;
				//SHADOW_COORDS(4)
			};

			v2f vert(a2v v)
			{
				v2f f;
				f.pos = UnityObjectToClipPos(v.vertex);
				f.uv = TRANSFORM_TEX(v.texcoord, _MainTex);
				f.worldNormal =UnityObjectToWorldNormal(v.normal);
				f.viewDir = WorldSpaceViewDir(v.vertex);
				f.worldPos = mul(unity_ObjectToWorld, v.vertex);
				f.vertColor = v.color;
				//#if RECEIVE_SHADOW
				//	TRANSFER_SHADOW(f);
				//#endif
				return f;
			}

			float4 frag(v2f f) : SV_Target
			{
				float3 worldViewDir = normalize(_WorldSpaceCameraPos.xyz - f.worldPos.xyz);
				float3 worldNormalDir = normalize(f.worldNormal.xyz);
				float3 worldLightDir = normalize(UnityWorldSpaceLightDir(f.worldPos));
				float3 worldHalfDir = normalize(worldLightDir + worldViewDir);

				float3 albedo = tex2D(_MainTex, f.uv).rgb* _MainColor.rgb;
				float3 ambient = UNITY_LIGHTMODEL_AMBIENT.xyz*albedo;

				float NdotL = dot(worldNormalDir, worldLightDir);
				// 使用vertex color 的 R 通道作为漫反射遮罩
				float diffuseMask = f.vertColor.r;
	
				float3 rim = _Shininess * pow(saturate(NdotL), _Smoothness);
				// 使用邻域像素之间的近似导数值来对smoothstep实现抗锯齿的效果 
				float ramp = smoothstep(0, 0.1, NdotL)*_LightColor0;

		
	

				float3 diffuse = rim * _RampColor.rgb +  albedo * (ramp + _ShadowIntensity);

				float oneMinusVdotN = 1 - dot(worldViewDir, worldNormalDir);
				float specRange = oneMinusVdotN * pow(NdotL, 0.1);

				// 使用邻域像素之间的近似导数值来对smoothstep实现抗锯齿的效果 
				fixed w = fwidth(specRange)*2.0;
				float3 specular = smoothstep(_SpecularOffset - w, _SpecularOffset + w, specRange)*_SpecularIntensity*_SpecularColor.rgb;

				float3 color = diffuse + specular + ambient;

				// Saturation
				float luminance = 0.2125*color.r + 0.7154*color.g + 0.0721*color.b;
				float3 luminanceColor = float3(luminance, luminance, luminance);
				color = lerp(luminanceColor, color, _Saturation);

				return float4(color, 1);
			}
			ENDCG
		}
	}
	Fallback "Diffuse"
}