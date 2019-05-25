Shader "Skin Shader" 
{
	Properties
	{
		_MainTex("Diffuse (RGB)", 2D) = "white" {}
		_SpecularTex("Specular (R) Gloss (G) SSS Mask (B)", 2D) = "yellow" {}
		_BumpMap("Normal (Normal)", 2D) = "bump" {}
		_BRDFTex("BRDF Lookup (RGB)", 2D) = "gray" {}
		_CurvatureScale("Curvature Scale", Float) = 0.005
		_Fresnel("Fresnel Value", Float) = 0.2
		_BumpBias("Normal Map Blur Bias", Float) = 1.5
	}

	SubShader
	{
		Tags { "Queue" = "Geometry" "RenderType" = "Opaque" }

		CGPROGRAM

		#pragma surface surf SkinShader fullforwardshadows
		#pragma target 3.0

		struct SurfaceOutputSkinShader 
		{
			fixed3 Albedo;
			fixed3 Normal;
			fixed3 NormalBlur;
			fixed3 Emission;
			fixed3 Specular;
			fixed Alpha;
		};

		struct Input
		{
			float2 uv_MainTex;
			INTERNAL_DATA
		};

		sampler2D _MainTex, _SpecularTex, _BumpMap, _BRDFTex;
		float _BumpBias, _CurvatureScale, _Fresnel;

		void surf(Input IN, inout SurfaceOutputSkinShader o)
		{
			float4 albedo = tex2D(_MainTex, IN.uv_MainTex);
			o.Albedo = albedo.rgb;
			o.Normal = UnpackNormal(tex2D(_BumpMap, IN.uv_MainTex));
			o.Specular = tex2D(_SpecularTex, IN.uv_MainTex).rgb;

			o.NormalBlur = UnpackNormal(tex2Dlod(_BumpMap, float4 (IN.uv_MainTex, 0.0, _BumpBias)));
		}

		inline fixed4 LightingSkinShader(SurfaceOutputSkinShader s, fixed3 lightDir, fixed3 viewDir, fixed atten)
		{
			s.Normal = normalize(s.Normal);
			s.NormalBlur = normalize(s.NormalBlur);

			float NdotL = dot(s.Normal, lightDir);
			float3 h = normalize(lightDir + viewDir);

			float specBase = saturate(dot(s.Normal, h));

			float fresnel = pow(1.0 - dot(viewDir, h), 5.0);
			fresnel += _Fresnel * (1.0 - fresnel);

			float spec = pow(specBase, s.Specular.g * 128) * s.Specular.r * fresnel;

			float2 brdfUV;
			float NdotLBlur = dot(s.NormalBlur, lightDir);
			brdfUV.x = NdotLBlur * 0.5 + 0.5;
			brdfUV.y = _CurvatureScale * dot(_LightColor0.rgb, fixed3(0.22, 0.707, 0.071));
			float3 brdf = tex2D(_BRDFTex, brdfUV).rgb;

			float m = atten; // Multiplier for spec and brdf.
			m *= saturate(((NdotLBlur * 0.5 + 0.5) * 2.0) * 2.0 - 1.0);

			fixed4 c;
			c.rgb = (saturate(s.Albedo * lerp(saturate(NdotL) * atten, brdf * m, s.Specular.b)) + spec * m) * _LightColor0.rgb * 2;
			c.a = 1;
			return c;
		}
		ENDCG
	}
	FallBack "VertexLit"
}