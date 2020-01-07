Shader "Custom/ProcEye"
{
	Properties
	{
		[Header(Main)]
		_Color("Color", Color) = (1,1,1,1)

		[Header(Iris)]
		_IrisTex("Iris Texture (RGB)", 2D) = "white" {}
		_IrisTexColor("Iris Texture Tint", Color) = (1,0,0,1)
		_Radius("Iris Radius", Range(0,1)) = 0.4
		_IrisColor("Iris Color", Color) = (0,1,1,1)
		_IrisColorOut("Iris Color Out", Color) = (0,1,0,1)
		_IrisScaleX("Iris Scale X", Range(0,2)) = 1
		_IrisScaleY("Iris Scale Y", Range(0,2)) = 1
		_Speed("Iris Scroll Speed", Range(-10,10)) = 0
		_Scale("Iris Texture Scale", Range(0.1,10)) = 10
		[Toggle(TEXTURE)] _TEXTURE("Circlular Texture", Float) = 0
		_Distort("Iris Texture Distortion", Range(0,1)) = 0.5

		[Header(Pupil)]
		_RadiusPupil("Pupil Radius", Range(0,0.5)) = 0.1
		_PupilColor("Pupil Color", Color) = (0,0,0,1)
		_PupilColorOut("Pupil Color Out", Color) = (0,0,1,1)
		_PupilScaleX("Pupil Scale X", Range(0,1)) = 0.5
		_PupilScaleY("Pupil Scale Y", Range(0,1)) = 0.5

		[Header(Specular and Iris Edge)]
		_Edgewidth("Iris Edge Width", Range(0,2)) = 0.1
		_SpecSize("Specular Size", Range(0.2,0.5)) = 0.47
		_IrisEdgeColor("Iris Edge Color", Color) = (0,0,0,1)


	}
		SubShader
		{
			Tags { "RenderType" = "Opaque" }
			LOD 200
		  CGPROGRAM
			// Physically based Standard lighting model, and enable shadows on all light types
			#pragma surface surf  Standard fullforwardshadows vertex:vert
			#pragma target 3.5

			#pragma shader_feature TEXTURE

			sampler2D _MainTex, _IrisTex;
			struct Input
			{
				float2 uv_MainTex;
				float3 objPos;
				float3 lightDir;
				float3 viewDir;
			};


			float _Radius, _RadiusPupil;
			fixed4 _Color, _IrisColor, _PupilColor, _PupilColorOut, _IrisColorOut, _IrisTexColor, _IrisEdgeColor;
			float _PupilScaleX, _PupilScaleY, _Edgewidth, _SpecSize, _IrisScaleX, _IrisScaleY, _Scale, _Speed, _Distort;


			void vert(inout appdata_full v, out Input o) {
				UNITY_INITIALIZE_OUTPUT(Input, o);
				o.objPos = v.vertex;
				o.lightDir = WorldSpaceLightDir(v.vertex); // get the worldspace lighting direction
			}

			// Add instancing support for this shader. You need to check 'Enable Instancing' on materials that use the shader.
			// See https://docs.unity3d.com/Manual/GPUInstancing.html for more information about instancing.
			// #pragma instancing_options assumeuniformscaling
			UNITY_INSTANCING_BUFFER_START(Props)
				// put more per-instance properties here
			UNITY_INSTANCING_BUFFER_END(Props)

			void surf(Input IN, inout SurfaceOutputStandard o)
			{

				// circles
				float dis = distance(0, float3(IN.objPos.x * _IrisScaleX, IN.objPos.y * _IrisScaleY, IN.objPos.z - 0.5));
				float disPup = (distance(0, float3(IN.objPos.x * _PupilScaleX, IN.objPos.y * _PupilScaleY , IN.objPos.z - 0.5)));
				float irisRadius = 1 - saturate(dis / _Radius);
				float pupilRadius = 1 - saturate(disPup / _RadiusPupil);
				float irisEdge = 1 - saturate(dis / _Radius - _Edgewidth);

				// specular
				half d = dot(o.Normal, normalize(IN.lightDir + IN.viewDir)) * 0.5;
				d = step(_SpecSize, d);


				// Iris texture
				float4 i = tex2D(_IrisTex, IN.uv_MainTex);

				float speed = _Time.x * _Speed + (_Distort * i);

	#if TEXTURE
				// circular
				i = tex2D(_IrisTex, float2((irisRadius * IN.uv_MainTex + speed) * _Scale));
	#else
				// normal
				i = tex2D(_IrisTex, (float2(IN.uv_MainTex.x, IN.uv_MainTex.y + speed) * _Scale)) * _Color;
	#endif
				// add extra tint
				i *= _IrisTexColor;


				// increase strength then clamp it for a smooth circle
				float irisCircle = saturate(irisRadius * 20);
				float pupilCircle = saturate(pupilRadius * 20);
				float irisEdgeCircle = saturate(irisEdge * 20);

				// eyewhite is everything but the iris 
				float4 eyeWhite = _Color * (1 - irisEdgeCircle);

				// subract to avoid bleeding through of colors
				irisEdgeCircle -= irisCircle;
				irisCircle -= pupilCircle;

				// lerp colors
				float4 irisLerp = lerp(_IrisColorOut,_IrisColor, irisRadius) + i;
				float4 irisColored = irisCircle * irisLerp;

				float4 pupilLerp = lerp(_PupilColorOut,_PupilColor, pupilRadius);
				float4 pupilColored = pupilCircle * pupilLerp;

				float4 irisEdgeColored = irisEdgeCircle * _IrisEdgeColor;

				// all together
				o.Albedo = eyeWhite + irisColored + pupilColored + irisEdgeColored;

				// specular in emission
				o.Emission = d;

			}
			ENDCG
		}
			FallBack "Diffuse"
}