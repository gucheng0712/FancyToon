

Shader "UnityChan/UCTS_Standard_StencilEye" {
	Properties{
		_StencilNo("Stencil No", int) = 1
		_StencilNoHl("Stencil No", int) = 5

		_EnvTex("EnvTex (CubeMap)", Cube) = "_SkyBox" {}
        _EnvFactor("EnvStrength", Range(0,1)) = 0.8
		_EnvFactor2("EnvStrength2", Range(0,1)) = 0.8

		_BaseCustomDir("BaseCustomDir", Vector) = (0,0,0,0)
		_CustomDirWeight("CustomDirWeight", Vector) = (0,0,0,0)

		[Enum(OFF,0,FRONT,1,BACK,2)] _CullMode("Cull Mode", int) = 2  //OFF/FRONT/BACK
		_BaseMap("BaseMap", 2D) = "white" {}
	_BaseColor("BaseColor", Color) = (1,1,1,1)
		[MaterialToggle] _Is_LightColor_Base("Is_LightColor_Base", Float) = 1
		_1st_ShadeMap("1st_ShadeMap", 2D) = "white" {}
	_1st_ShadeColor("1st_ShadeColor", Color) = (1,1,1,1)
		[MaterialToggle] _Is_LightColor_1st_Shade("Is_LightColor_1st_Shade", Float) = 1
		_2nd_ShadeMap("2nd_ShadeMap", 2D) = "white" {}
	_2nd_ShadeColor("2nd_ShadeColor", Color) = (1,1,1,1)
		[MaterialToggle] _Is_LightColor_2nd_Shade("Is_LightColor_2nd_Shade", Float) = 1
		_NormalMap("NormalMap", 2D) = "bump" {}
	[MaterialToggle] _Is_NormalMapToBase("Is_NormalMapToBase", Float) = 0
		[MaterialToggle] _Set_SystemShadowsToBase("Set_SystemShadowsToBase", Float) = 1
		_Tweak_SystemShadowsLevel("Tweak_SystemShadowsLevel", Range(-0.5, 0.5)) = 0
		_BaseColor_Step("BaseColor_Step", Range(0, 1)) = 0.6
		_BaseShade_Feather("Base/Shade_Feather", Range(0.0001, 1)) = 0.0001
		_Set_1st_ShadePosition("Set_1st_ShadePosition", 2D) = "white" {}
	_ShadeColor_Step("ShadeColor_Step", Range(0, 1)) = 0.4
		_1st2nd_Shades_Feather("1st/2nd_Shades_Feather", Range(0.0001, 1)) = 0.0001
		_Set_2nd_ShadePosition("Set_2nd_ShadePosition", 2D) = "white" {}
	_HighColor("HighColor", Color) = (1,1,1,1)
		[MaterialToggle] _Is_LightColor_HighColor("Is_LightColor_HighColor", Float) = 1
		[MaterialToggle] _Is_NormalMapToHighColor("Is_NormalMapToHighColor", Float) = 0
		_HighColor_Power("HighColor_Power", Range(0.08, 0.12)) = 0.1
		_HighFeather("HighFeather", Range(0, 0.1)) = 0

		[MaterialToggle] _Is_SpecularToHighColor("Is_SpecularToHighColor", Float) = 0
		[MaterialToggle] _Is_BlendAddToHiColor("Is_BlendAddToHiColor", Float) = 0
		[MaterialToggle] _Is_UseTweakHighColorOnShadow("Is_UseTweakHighColorOnShadow", Float) = 0
		_TweakHighColorOnShadow("TweakHighColorOnShadow", Range(0, 1)) = 0

		_HighClrDir("HighClrDir", Vector) = (0,0,0,0)
		_ViewDirWeight("ViewDirWeight", Vector) = (0,0,0,0)

		//�n�C�J���[�}�X�N.
		_Set_HighColorMask("Set_HighColorMask", 2D) = "white" {}
	_Tweak_HighColorMaskLevel("Tweak_HighColorMaskLevel", Range(-1, 1)) = 0
		[MaterialToggle] _RimLight("RimLight", Float) = 0
		_RimLightColor("RimLightColor", Color) = (1,1,1,1)
		[MaterialToggle] _Is_LightColor_RimLight("Is_LightColor_RimLight", Float) = 1
		[MaterialToggle] _Is_NormalMapToRimLight("Is_NormalMapToRimLight", Float) = 0
		_RimLight_Power("RimLight_Power", Range(0, 1)) = 0.1
		_RimLight_InsideMask("RimLight_InsideMask", Range(0.0001, 1)) = 0.0001
		[MaterialToggle] _RimLight_FeatherOff("RimLight_FeatherOff", Float) = 0
		//�������C�g�ǉ��v���p�e�B.
		[MaterialToggle] _LightDirection_MaskOn("LightDirection_MaskOn", Float) = 0
		_Tweak_LightDirection_MaskLevel("Tweak_LightDirection_MaskLevel", Range(0, 0.5)) = 0
		[MaterialToggle] _Add_Antipodean_RimLight("Add_Antipodean_RimLight", Float) = 0
		_Ap_RimLightColor("Ap_RimLightColor", Color) = (1,1,1,1)
		[MaterialToggle] _Is_LightColor_Ap_RimLight("Is_LightColor_Ap_RimLight", Float) = 1
		_Ap_RimLight_Power("Ap_RimLight_Power", Range(0, 1)) = 0.1
		[MaterialToggle] _Ap_RimLight_FeatherOff("Ap_RimLight_FeatherOff", Float) = 0
		//�������C�g�}�X�N.
		_Set_RimLightMask("Set_RimLightMask", 2D) = "white" {}
	_Tweak_RimLightMaskLevel("Tweak_RimLightMaskLevel", Range(-1, 1)) = 0

		//�����܂�.
		[MaterialToggle] _MatCap("MatCap", Float) = 0
		_MatCap_Sampler("MatCap_Sampler", 2D) = "black" {}
	_MatCapColor("MatCapColor", Color) = (1,1,1,1)
		[MaterialToggle] _Is_LightColor_MatCap("Is_LightColor_MatCap", Float) = 1
		[MaterialToggle] _Is_BlendAddToMatCap("Is_BlendAddToMatCap", Float) = 1
		_Tweak_MatCapUV("Tweak_MatCapUV", Range(-0.5, 0.5)) = 0
		_Rotate_MatCapUV("Rotate_MatCapUV", Range(-1, 1)) = 0
		[MaterialToggle] _Is_NormalMapForMatCap("Is_NormalMapForMatCap", Float) = 0
		_NormalMapForMatCap("NormalMapForMatCap", 2D) = "bump" {}
	_Rotate_NormalMapForMatCapUV("Rotate_NormalMapForMatCapUV", Range(-1, 1)) = 0
		[MaterialToggle] _Is_UseTweakMatCapOnShadow("Is_UseTweakMatCapOnShadow", Float) = 0
		_TweakMatCapOnShadow("TweakMatCapOnShadow", Range(0, 1)) = 0
		_Outline_Width("Outline_Width", Float) = 1
		_Farthest_Distance("Farthest_Distance", Float) = 10
		_Nearest_Distance("Nearest_Distance", Float) = 0.5
		_Outline_Sampler("Outline_Sampler", 2D) = "white" {}
	_Outline_Color("Outline_Color", Color) = (0.5,0.5,0.5,1)
		[MaterialToggle] _Is_BlendBaseColor("Is_BlendBaseColor", Float) = 0
		//Offset parameter
		_Offset_Z("Offset_Camera_Z", Float) = 0
		_GI_Intensity("GI_Intensity", Range(0, 1)) = 0
	}
	SubShader{
		Tags{
			"Queue" = "AlphaTest-1"    //StencilMask Opaque and _Clipping
			"RenderType" = "Opaque"
		}
		Pass {
			Name "Outline"
			Tags {
			}
			Cull Front
			ZTest On
			ZWrite On
			Stencil {
				Ref[_StencilNo]
				Comp Greater
				Pass Replace //keep
				Fail keep
			}
			
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#include "UnityCG.cginc"
			//#pragma fragmentoption ARB_precision_hint_fastest
			//#pragma multi_compile_shadowcaster
			//#pragma multi_compile_fog
			#pragma only_renderers d3d9 d3d11 glcore gles gles3 metal xboxone ps4 switch
			#pragma target 3.0
		
			#include "UCTS_Outline.cginc"
			ENDCG
		}
		//ToonCoreStart
		Pass{
			Name "FORWARD"
			Tags{
				"LightMode" = "ForwardBase"
			}
			Cull[_CullMode]

			Stencil{
				Ref[_StencilNo]
				Comp GEqual
				Pass Replace
				Fail Keep
			}

			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#define UNITY_PASS_FORWARDBASE
			#include "UnityCG.cginc"
			#include "AutoLight.cginc"
			#include "Lighting.cginc"
			#pragma multi_compile_fwdbase_fullshadows
			#pragma multi_compile_fog
			#pragma only_renderers d3d9 d3d11 glcore gles gles3 metal xboxone ps4 switch
			#pragma target 3.0
			uniform float _ShadeColor_Step;
			uniform float4 _1st_ShadeColor;
			uniform float4 _2nd_ShadeColor;
			uniform float _BaseColor_Step;
			uniform float4 _BaseColor;
			uniform fixed _Set_SystemShadowsToBase;
			uniform float4 _HighColor;
			uniform float _HighColor_Power;
			uniform fixed _Is_BlendAddToHiColor;
			uniform fixed _Is_UseTweakHighColorOnShadow;
			uniform fixed _Is_SpecularToHighColor;
			uniform float _1st2nd_Shades_Feather;
			uniform float _BaseShade_Feather;
			uniform fixed _RimLight;
			uniform float _RimLight_Power;
			uniform float4 _RimLightColor;
			uniform sampler2D _NormalMap; uniform float4 _NormalMap_ST;
			uniform fixed _Is_NormalMapToBase;
			uniform fixed _Is_NormalMapToHighColor;
			uniform fixed _Is_NormalMapToRimLight;
			uniform fixed _Is_NormalMapForMatCap;
			uniform float _Tweak_MatCapUV;
			uniform sampler2D _MatCap_Sampler; uniform float4 _MatCap_Sampler_ST;
			uniform fixed _MatCap;
			uniform sampler2D _NormalMapForMatCap; uniform float4 _NormalMapForMatCap_ST;
			uniform fixed _Is_BlendAddToMatCap;
			uniform sampler2D _Set_2nd_ShadePosition; uniform float4 _Set_2nd_ShadePosition_ST;
			uniform sampler2D _Set_1st_ShadePosition; uniform float4 _Set_1st_ShadePosition_ST;
			uniform sampler2D _BaseMap; uniform float4 _BaseMap_ST;
			uniform sampler2D _1st_ShadeMap; uniform float4 _1st_ShadeMap_ST;
			uniform sampler2D _2nd_ShadeMap; uniform float4 _2nd_ShadeMap_ST;

			uniform samplerCUBE _EnvTex;
			uniform fixed _EnvFactor;
			uniform fixed _EnvFactor2;

			uniform float4 _MatCapColor;
			uniform float _Rotate_MatCapUV;
			uniform float _Rotate_NormalMapForMatCapUV;
			uniform fixed _Is_UseTweakMatCapOnShadow;
			uniform float _TweakMatCapOnShadow;
			uniform float _TweakHighColorOnShadow;
			fixed3 DecodeLightProbe(fixed3 N) {
				return ShadeSH9(float4(N,1));
			}

			uniform float _GI_Intensity;
			uniform fixed _Is_LightColor_Base;
			uniform fixed _Is_LightColor_1st_Shade;
			uniform fixed _Is_LightColor_2nd_Shade;
			uniform fixed _Is_LightColor_HighColor;
			uniform fixed _Is_LightColor_RimLight;
			uniform fixed _Is_LightColor_MatCap;
			uniform float _Tweak_SystemShadowsLevel;
			uniform float _RimLight_InsideMask;
			uniform fixed _RimLight_FeatherOff;
			uniform fixed _LightDirection_MaskOn;
			uniform fixed _Add_Antipodean_RimLight;
			uniform float _Ap_RimLight_Power;
			uniform fixed _Ap_RimLight_FeatherOff;
			uniform float4 _Ap_RimLightColor;
			uniform fixed _Is_LightColor_Ap_RimLight;
			uniform float _Tweak_LightDirection_MaskLevel;
			uniform sampler2D _Set_HighColorMask; uniform float4 _Set_HighColorMask_ST;
			uniform sampler2D _Set_RimLightMask; uniform float4 _Set_RimLightMask_ST;
			uniform float _Tweak_HighColorMaskLevel;
			uniform float _Tweak_RimLightMaskLevel;
			uniform float _Offset_Z;


			uniform float4 _BaseCustomDir;
			uniform float4 _CustomDirWeight;

			uniform float3 _HighClrDir;
			uniform float3 _ViewDirWeight;
			uniform float _HighFeather;


			struct VertexInput {
				float4 vertex : POSITION;
				float3 normal : NORMAL;
				float4 tangent : TANGENT;
				float2 texcoord0 : TEXCOORD0;
			};
			struct VertexOutput {
				float4 pos : SV_POSITION;
				float2 uv0 : TEXCOORD0;
				float4 posWorld : TEXCOORD1;
				float3 normalDir : TEXCOORD2;
				float3 tangentDir : TEXCOORD3;
				float3 bitangentDir : TEXCOORD4;
				LIGHTING_COORDS(5,6)
				UNITY_FOG_COORDS(7)
				float3 RefDir : TEXCOORD8;
			};
			VertexOutput vert(VertexInput v) {
				VertexOutput o = (VertexOutput)0;
				o.uv0 = v.texcoord0;
				o.normalDir = UnityObjectToWorldNormal(v.normal);
				o.tangentDir = normalize(mul(unity_ObjectToWorld, float4(v.tangent.xyz, 0.0)).xyz);
				o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
				o.posWorld = mul(unity_ObjectToWorld, v.vertex);
				float3 lightColor = _LightColor0.rgb;
				o.pos = UnityObjectToClipPos(v.vertex);

				// wjk
				float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - o.pos.xyz);
				float4 viewDirectionVP = mul(UNITY_MATRIX_VP, float4(viewDirection.xyz, 1));
				_Offset_Z = _Offset_Z * -0.1;
				o.pos.z = o.pos.z + _Offset_Z*viewDirectionVP.z;
				//

				//float3 wolrdN = UnityObjectToWorldNormal(v.normal);
				o.RefDir = reflect(-WorldSpaceViewDir(v.vertex), o.normalDir);

				UNITY_TRANSFER_FOG(o,o.pos);
				TRANSFER_VERTEX_TO_FRAGMENT(o)
					return o;
			}
			float4 frag(VertexOutput i, float facing : VFACE) : COLOR{
				float isFrontFace = (facing >= 0 ? 1 : 0);
				float faceSign = (facing >= 0 ? 1 : -1);
				i.normalDir = normalize(i.normalDir);
				i.normalDir *= faceSign;
				float3x3 tangentTransform = float3x3(i.tangentDir, i.bitangentDir, i.normalDir);
				float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);

				// highlight
				float3 highDir = normalize(_HighClrDir.xyz);
				float3 highHalfDir = viewDirection + highDir;
				float3 direction;
				direction.x = lerp(highDir.x, highHalfDir.x, _ViewDirWeight.x);
				direction.y = lerp(highDir.y, highHalfDir.y, _ViewDirWeight.y);
				direction.z = lerp(highDir.z, highHalfDir.z, _ViewDirWeight.z);
				float3 directionN = normalize(direction);
				float3 lightColor = _LightColor0.rgb;

				float proj = 0.5 + 0.5 * dot(directionN, i.normalDir); //  proj
				float mask = saturate((1 + _Tweak_HighColorMaskLevel));
				float highStep = _HighColor_Power;
				//float spec = 1.0 - step(proj, (1.0 - highStep));
				highStep = pow(highStep, exp2(lerp(10,1, highStep * 10)));
				float spec = saturate(1 - ((1 - proj) - highStep) / _HighFeather);

				float high = pow(proj, exp2(lerp(11, 1, _HighColor_Power)));
				float highSample = mask * lerp(spec, high, _Is_SpecularToHighColor);
				fixed3 highClr = lerp(_HighColor.rgb, (_HighColor.rgb * lightColor), _Is_LightColor_HighColor);
				//highColor += lerp(saturate(0 - sample), 0, _Is_BlendAddToHiColor); 混合
				//

				float3 _NormalMap_var = UnpackNormal(tex2D(_NormalMap,TRANSFORM_TEX(i.uv0, _NormalMap)));
				float3 normalLocal = _NormalMap_var.rgb;
				float3 normalDirection = normalize(mul(normalLocal, tangentTransform)); // Perturbed normals
				float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
				lightDirection.x = lerp(lightDirection.x, _BaseCustomDir.x, _CustomDirWeight.x);
				lightDirection.y = lerp(lightDirection.y, _BaseCustomDir.y, _CustomDirWeight.y);
				lightDirection.z = lerp(lightDirection.z, _BaseCustomDir.z, _CustomDirWeight.z);
				lightDirection = normalize(lightDirection);

				float3 halfDirection = normalize(viewDirection + lightDirection);
				////// Lighting:
				float attenuation = LIGHT_ATTENUATION(i);

				float4 _BaseMap_var = tex2D(_BaseMap,TRANSFORM_TEX(i.uv0, _BaseMap));
				float3 node_9970 = (_BaseColor.rgb*_BaseMap_var.rgb);
				float3 Set_LightColor = _LightColor0.rgb;
				float3 Set_BaseColor = lerp(node_9970, (node_9970*Set_LightColor), _Is_LightColor_Base);
				float2 node_8098 = i.uv0;
				float4 _1st_ShadeMap_var = tex2D(_1st_ShadeMap,TRANSFORM_TEX(node_8098, _1st_ShadeMap));
				float3 node_6918 = (_1st_ShadeColor.rgb*_1st_ShadeMap_var.rgb);
				float3 Set_1st_ShadeColor = lerp(node_6918, (node_6918*Set_LightColor), _Is_LightColor_1st_Shade);
				float2 node_5380 = i.uv0;
				float4 _2nd_ShadeMap_var = tex2D(_2nd_ShadeMap,TRANSFORM_TEX(node_5380, _2nd_ShadeMap));
				float3 node_8559 = (_2nd_ShadeColor.rgb*_2nd_ShadeMap_var.rgb);
				float3 Set_2nd_ShadeColor = lerp(node_8559, (node_8559*Set_LightColor), _Is_LightColor_2nd_Shade);
				float node_4315 = 0.5*dot(lerp(i.normalDir, normalDirection, _Is_NormalMapToBase),lightDirection) + 0.5;
				float node_2294 = (_ShadeColor_Step - _1st2nd_Shades_Feather);
				float node_9309 = 1.0;
				float2 node_1071 = i.uv0;
				float4 _Set_2nd_ShadePosition_var = tex2D(_Set_2nd_ShadePosition,TRANSFORM_TEX(node_1071, _Set_2nd_ShadePosition));
				float node_3494 = 0.5;
				float node_583 = (_BaseColor_Step - _BaseShade_Feather);
				float node_8323 = 1.0;
				float2 node_1237 = i.uv0;
				float4 _Set_1st_ShadePosition_var = tex2D(_Set_1st_ShadePosition,TRANSFORM_TEX(node_1237, _Set_1st_ShadePosition));
				float Set_FinalShadowSample = saturate((node_8323 + ((lerp(node_4315, (node_4315*saturate(((attenuation*node_3494) + node_3494 + _Tweak_SystemShadowsLevel))), _Set_SystemShadowsToBase) - node_583) * ((1.0 - _Set_1st_ShadePosition_var.rgb).r - node_8323)) / (_BaseColor_Step - node_583)));
				float3 node_1702 = lerp(Set_BaseColor,lerp(Set_1st_ShadeColor,Set_2nd_ShadeColor,saturate((node_9309 + ((node_4315 - node_2294) * ((1.0 - _Set_2nd_ShadePosition_var.rgb).r - node_9309)) / (_ShadeColor_Step - node_2294)))),Set_FinalShadowSample); // Final Color
				float2 node_5701 = i.uv0;
				float4 _Set_HighColorMask_var = tex2D(_Set_HighColorMask,TRANSFORM_TEX(node_5701, _Set_HighColorMask)); // HighColorMask
				float node_1331 = 0.5*dot(halfDirection,lerp(i.normalDir, normalDirection, _Is_NormalMapToHighColor)) + 0.5; //  proj
				_HighColor_Power = 0;
				float sample = (saturate((_Set_HighColorMask_var.g + _Tweak_HighColorMaskLevel))*lerp((1.0 - step(node_1331,(1.0 - _HighColor_Power))), pow(node_1331,exp2(lerp(11,1,_HighColor_Power))), _Is_SpecularToHighColor));
				float3 node_5205 = (lerp(_HighColor.rgb, (_HighColor.rgb*Set_LightColor), _Is_LightColor_HighColor)*sample);
				float node_2595 = Set_FinalShadowSample;
				float3 highColor = (lerp(saturate((node_1702 - sample)), node_1702, _Is_BlendAddToHiColor) + lerp(node_5205, (node_5205*((1.0 - node_2595) + (node_2595*_TweakHighColorOnShadow))), _Is_UseTweakHighColorOnShadow));
				float2 node_4781 = i.uv0;
				float4 _Set_RimLightMask_var = tex2D(_Set_RimLightMask,TRANSFORM_TEX(node_4781, _Set_RimLightMask)); // RimLightMask
				float3 _Is_LightColor_RimLight_var = lerp(_RimLightColor.rgb, (_RimLightColor.rgb*Set_LightColor), _Is_LightColor_RimLight);
				float node_2652 = (1.0 - dot(lerp(i.normalDir, normalDirection, _Is_NormalMapToRimLight),viewDirection));
				float node_7879 = pow(node_2652,exp2(lerp(3,0,_RimLight_Power)));
				float node_4535 = 1.0;
				float node_2699 = 0.0;
				float node_8305 = saturate(lerp((node_2699 + ((node_7879 - _RimLight_InsideMask) * (node_4535 - node_2699)) / (node_4535 - _RimLight_InsideMask)), step(_RimLight_InsideMask,node_7879), _RimLight_FeatherOff));
				float node_8429 = 0.5*dot(i.normalDir,lightDirection) + 0.5;
				float3 _LightDirection_MaskOn_var = lerp((_Is_LightColor_RimLight_var*node_8305), (_Is_LightColor_RimLight_var*saturate((node_8305 - ((1.0 - node_8429) + _Tweak_LightDirection_MaskLevel)))), _LightDirection_MaskOn);
				float node_8113 = pow(node_2652,exp2(lerp(3,0,_Ap_RimLight_Power)));
				float3 Set_RimLight = (saturate((_Set_RimLightMask_var.g + _Tweak_RimLightMaskLevel))*lerp(_LightDirection_MaskOn_var, (_LightDirection_MaskOn_var + (lerp(_Ap_RimLightColor.rgb, (_Ap_RimLightColor.rgb*Set_LightColor), _Is_LightColor_Ap_RimLight)*saturate((lerp((node_2699 + ((node_8113 - _RimLight_InsideMask) * (node_4535 - node_2699)) / (node_4535 - _RimLight_InsideMask)), step(_RimLight_InsideMask,node_8113), _Ap_RimLight_FeatherOff) - (saturate(node_8429) + _Tweak_LightDirection_MaskLevel))))), _Add_Antipodean_RimLight));
				float3 _RimLight_var = lerp(highColor, (highColor + Set_RimLight), _RimLight);

				float node_2829 = Set_FinalShadowSample;
				fixed3 finalColor = saturate((1.0 - (1.0 - saturate(_RimLight_var))*(1.0 - (DecodeLightProbe(normalDirection)*_GI_Intensity))));



				finalColor += lerp(0, highClr, highSample * _HighColor.a);

				fixed4 reflection = texCUBE(_EnvTex, i.RefDir);	
				
				finalColor += lerp(0, reflection.rgb, _EnvFactor);


				fixed4 finalRGBA = fixed4(finalColor,1);
				UNITY_APPLY_FOG(i.fogCoord, finalRGBA);

				return finalRGBA;
			}
			ENDCG
		}	
        GrabPass {
            "_BackgroundTexture"
        }
		Pass {
			// 反射部分
			//Blend One Zero 
			//Blend SrcAlpha OneMinusSrcAlpha
			Blend SrcAlpha One
			Cull Back
				
			Stencil{
			Ref[_StencilNoHl]
				Comp GEqual
				Pass Replace
				Fail Keep
			}
				
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#define UNITY_PASS_FORWARDADD
			#include "UnityCG.cginc"
			#include "AutoLight.cginc"
			#include "Lighting.cginc"
			#pragma multi_compile_fwdadd_fullshadows
			#pragma multi_compile_fog
			#pragma only_renderers d3d9 d3d11 glcore gles gles3 metal xboxone ps4 switch
			#pragma target 3.0

			uniform fixed _Is_NormalMapToHighColor;
			uniform sampler2D _NormalMap; uniform float4 _NormalMap_ST;
			uniform float _Tweak_HighColorMaskLevel;
			uniform float4 _HighColor;
			uniform float _HighColor_Power;
			uniform fixed _Is_SpecularToHighColor;
			uniform fixed _Is_LightColor_HighColor;
			uniform fixed _Is_BlendAddToHiColor;
			uniform fixed _Is_UseTweakHighColorOnShadow;
			uniform float _TweakHighColorOnShadow;
			uniform float3 _HighClrDir;
			uniform float3 _ViewDirWeight;
			uniform float _HighFeather;
			uniform samplerCUBE _EnvTex;
			uniform fixed _EnvFactor2;			

			struct VertexInput {
				float4 vertex : POSITION;
				float3 normal : NORMAL;
				float4 tangent : TANGENT;
				float2 texcoord0 : TEXCOORD0;
			};
			struct VertexOutput {
				float4 pos : SV_POSITION;
				float2 uv0 : TEXCOORD0;
				float4 posWorld : TEXCOORD1;
				float3 normalDir : TEXCOORD2;
				float3 tangentDir : TEXCOORD3;
				float3 bitangentDir : TEXCOORD4;
				LIGHTING_COORDS(5,6)
				UNITY_FOG_COORDS(7)
				float3 RefDir : TEXCOORD8;
				float4 grabPos : TEXCOORD9;
			};
			VertexOutput vert (VertexInput v) {
				VertexOutput o = (VertexOutput)0;
				o.uv0 = v.texcoord0;
				o.normalDir = UnityObjectToWorldNormal(v.normal);
				o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
				o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
				o.posWorld = mul(unity_ObjectToWorld, v.vertex);
				float3 lightColor = _LightColor0.rgb;
				o.pos = UnityObjectToClipPos(v.vertex );
				
				o.grabPos = ComputeGrabScreenPos(o.pos);

				UNITY_TRANSFER_FOG(o,o.pos);
				TRANSFER_VERTEX_TO_FRAGMENT(o)
				
				o.RefDir = reflect(-WorldSpaceViewDir(v.vertex), o.normalDir);
				return o;
			}
			sampler2D _BackgroundTexture;

			float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
				float isFrontFace = (facing >= 0 ? 1 : 0);
				float faceSign = (facing >= 0 ? 1 : -1);
				i.normalDir = normalize(i.normalDir);
				i.normalDir *= faceSign;
				float3x3 tangentTransform = float3x3(i.tangentDir, i.bitangentDir, i.normalDir);
				float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
				float2 Set_UV0 = i.uv0;
				float2 node_6830 = Set_UV0;
				float3 lightDirection = normalize(_HighClrDir.xyz);
				float3 lightColor = _LightColor0.rgb;
				float3 halfDirection = viewDirection + lightDirection;
				float3 direction;
				direction.x = lerp(lightDirection.x, halfDirection.x, _ViewDirWeight.x);
				direction.y = lerp(lightDirection.y, halfDirection.y, _ViewDirWeight.y);
				direction.z = lerp(lightDirection.z, halfDirection.z, _ViewDirWeight.z);
				float3 directionN = normalize(direction);
				//discard;

				float proj = 0.5 + 0.5 * dot(directionN, i.normalDir); //  proj
				float mask = saturate((1 + _Tweak_HighColorMaskLevel));
				float highStep = _HighColor_Power;
				//float spec = 1.0 - step(proj, (1.0 - highStep));
				highStep = pow(highStep, exp2(lerp(10,1, highStep * 10)));
				float spec = saturate(1 - ((1 - proj) - highStep) / _HighFeather);

				float high = pow(proj, exp2(lerp(11, 1, _HighColor_Power)));
				float highSample = mask * lerp(spec, high, _Is_SpecularToHighColor);
				highSample *= _HighColor.a;
				fixed3 highClr = lerp(_HighColor.rgb, (_HighColor.rgb * lightColor), _Is_LightColor_HighColor);
				//highClr += lerp(saturate(0 - sample), 0, _Is_BlendAddToHiColor); 混合

				// fixed stepOverlay = step(0.5, base);
				// float3 OverlayLight = 1 - 2 * (1 - base)*(1 - blend);
				// float3 OverlayDark = 2 * base * blend;
				// float3 Overlay = lerp(OverlayDark, OverlayLight, stepOverlay);

				fixed4 reflection = texCUBE(_EnvTex, i.RefDir);	
				fixed3 finalColor = 0;
				finalColor += lerp(0, highClr, highSample);

				fixed3 bgColor = tex2Dproj(_BackgroundTexture, i.grabPos);

				fixed4 finalRGBA = fixed4(reflection.rgb, _EnvFactor2);

				
				//finalColor += bgColor;// + highClr * highSample;
				finalColor = lerp(finalColor, finalColor + reflection.rgb, _EnvFactor2);

				finalRGBA = fixed4(finalColor, 1);

				finalRGBA = fixed4(finalColor, highSample);

				UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
				return finalRGBA;
			}
			ENDCG
		}

		Pass{
			Name "ShadowCaster"
			Tags{
				"LightMode" = "ShadowCaster"
			}
			Offset 1, 1
			Cull Off

			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#define UNITY_PASS_SHADOWCASTER
			#include "UnityCG.cginc"
			#include "Lighting.cginc"
			#pragma fragmentoption ARB_precision_hint_fastest
			#pragma multi_compile_shadowcaster
			#pragma multi_compile_fog
			#pragma only_renderers d3d9 d3d11 glcore gles gles3 metal xboxone ps4 switch
			#pragma target 3.0
			struct VertexInput {
				float4 vertex : POSITION;
			};
			struct VertexOutput {
				V2F_SHADOW_CASTER;
			};
			VertexOutput vert(VertexInput v) {
				VertexOutput o = (VertexOutput)0;
				o.pos = UnityObjectToClipPos(v.vertex);
				TRANSFER_SHADOW_CASTER(o)
				return o;
			}
			float4 frag(VertexOutput i, float facing : VFACE) : COLOR{
				float isFrontFace = (facing >= 0 ? 1 : 0);
				float faceSign = (facing >= 0 ? 1 : -1);
				SHADOW_CASTER_FRAGMENT(i)
			}
			ENDCG
		}
		//ToonCoreEnd
	}
	FallBack "Legacy Shaders/VertexLit"
}
