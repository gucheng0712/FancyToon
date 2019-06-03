//RealToon V5.0.3
//MJQStudioWorks
//2019

Shader "RealToon/Version 5/Default/Default" {
    Properties {

		[Enum(Off,2,On,0)] _DoubleSided("Double Sided", int) = 2

        _MainTex ("Texture", 2D) = "white" {}
        [MaterialToggle] _TexturePatternStyle ("Texture Pattern Style", Float ) = 0
        [HDR] _MainColor ("Main Color", Color) = (0.7843137,0.7843137,0.7843137,1)

		[HDR] _HighlightColor ("Highlight Color", Color) = (1,1,1,1)
        _HighlightColorPower ("Highlight Color Power", Float ) = 1

        [MaterialToggle] _EnableTextureTransparent ("Enable Texture Transparent", Float ) = 0

        _Cutout ("Cutout", Range(0, 1)) = 0
		[MaterialToggle] _AlphaBaseCutout ("Alpha Base Cutout", Float ) = 1
        [MaterialToggle] _UseSecondaryCutout ("Use Secondary Cutout", Float ) = 0
        _SecondaryCutout ("Secondary Cutout", 2D) = "white" {}

        _NormalMap ("Normal Map", 2D) = "bump" {}
        _NormalMapIntensity ("Normal Map Intensity", Float ) = 1

        _Saturation ("Saturation", Range(0, 2)) = 1

        _OutlineWidth ("Width", Float ) = 0.5
        _OutlineWidthControl ("Width Control", 2D) = "white" {}

		[Enum(Normal,0,Origin,1)] _OutlineExtrudeMethod("Outline Extrude Method", int) = 0

		_OutlineOffset ("Outline Offset", Vector) = (0,0,0)
		_OutlineZPostionInCamera ("Outline Z Position In Camera", Float) = 0

		[Enum(Off,1,On,0)] _DoubleSidedOutline("Double Sided Outline", int) = 1

        [HDR] _OutlineColor ("Color", Color) = (0,0,0,1)
        _NoisyOutlineIntensity ("Noisy Outline Intensity", Range(0, 1)) = 0
        [MaterialToggle] _DynamicNoisyOutline ("Dynamic Noisy Outline", Float ) = 0

        [MaterialToggle] _LightAffectOutlineColor ("Light Affect Outline Color", Float ) = 0

        [MaterialToggle] _OutlineWidthAffectedByViewDistance ("Outline Width Affected By View Distance", Float ) = 0
		_FarDistanceMaxWidth ("Far Distance Max Width", Float ) = 10

        [MaterialToggle] _VertexColorRedAffectOutlineWitdh ("Vertex Color Red Affect Outline Witdh", Float ) = 0

        _SelfLitIntensity ("Intensity", Range(0, 1)) = 0
        [HDR] _SelfLitColor ("Color", Color) = (1,1,1,1)
        _SelfLitPower ("Power", Float ) = 2
        [MaterialToggle] _SelfLitHighContrast ("High Contrast", Float ) = 1
        _MaskSelfLit ("Mask Self Lit", 2D) = "white" {}

        _GlossIntensity ("Gloss Intensity", Range(0, 1)) = 1
        _Glossiness ("Glossiness", Range(0, 1)) = 0.6
        _GlossSoftness ("Softness", Range(0, 1)) = 0
        [HDR] _GlossColor ("Color", Color) = (1,1,1,1)
        _GlossColorPower ("Color Power", Float ) = 10
        _MaskGloss ("Mask Gloss", 2D) = "white" {}

        _GlossTexture ("Gloss Texture", 2D) = "black" {}
        _GlossTextureSoftness ("Softness", Float ) = 0
        _GlossTextureRotate ("Rotate", Float ) = 0
        [MaterialToggle] _GlossTextureFollowObjectRotation ("Follow Object Rotation", Float ) = 0
        _GlossTextureFollowLight ("Follow Light", Range(0, 1)) = 0

        [HDR] _OverallShadowColor ("Overall Shadow Color", Color) = (0,0,0,1)
        _OverallShadowColorPower ("Overall Shadow Color Power", Float ) = 1

        [MaterialToggle] _SelfShadowShadowTAtViewDirection ("Self Shadow & ShadowT At View Direction", Float ) = 0

		_ReduceShadowPointLight ("Reduce Shadow (Point Light)", float ) = 0
		_ReduceShadowSpotDirectionalLight ("Reduce Shadow (Spot & Directional Light)", float ) = 10

		_ShadowHardness ("Shadow Hardness", Range(0, 1)) = 0

        _SelfShadowRealtimeShadowIntensity ("Self Shadow & Realtime Shadow Intensity", Range(0, 1)) = 1
        _SelfShadowThreshold ("Threshold", Range(0, 1)) = 0.85
        [MaterialToggle] _VertexColorGreenControlSelfShadowThreshold ("Vertex Color Green Control Self Shadow Threshold", Float ) = 0
        _SelfShadowHardness ("Hardness", Range(0, 1)) = 1
        [HDR] _SelfShadowRealTimeShadowColor ("Self Shadow & Real Time Shadow Color", Color) = (1,1,1,1)
        _SelfShadowRealTimeShadowColorPower ("Self Shadow & Real Time Shadow Color Power", Float ) = 1
		[MaterialToggle] _SelfShadowAffectedByLightShadowStrength ("Self Shadow Affected By Light Shadow Strength", Float ) = 0

        _SmoothObjectNormal ("Smooth Object Normal", Range(0, 1)) = 0
        [MaterialToggle] _VertexColorBlueControlSmoothObjectNormal ("Vertex Color Blue Control Smooth Object Normal", Float ) = 0
        _XYZPosition ("XYZ Position", Vector) = (0,0,0,0)
        _XYZHardness ("XYZ Hardness", Float ) = 14
        [MaterialToggle] _ShowNormal ("Show Normal", Float ) = 0

        _ShadowColorTexture ("Shadow Color Texture", 2D) = "white" {}
        _ShadowColorTexturePower ("Power", Float ) = 0

        _ShadowTIntensity ("ShadowT Intensity", Range(0, 1)) = 1
        _ShadowT ("ShadowT", 2D) = "white" {}
        _ShadowTLightThreshold ("Light Threshold", Float ) = 50
        _ShadowTShadowThreshold ("Shadow Threshold", Float ) = 0
        [HDR] _ShadowTColor ("Color", Color) = (1,1,1,1)
        _ShadowTColorPower ("Color Power", Float ) = 1
        _ShadowTHardness ("Hardness", Range(0, 1)) = 1

		[Toggle(N_F_STIS_ON)] _N_F_STIS ("Show In Shadow", Float ) = 0
		[Toggle(N_F_STIAL_ON )] _N_F_STIAL ("Show In Ambient Light", Float ) = 0

        _ShowInAmbientLightShadowIntensity ("Show In Ambient Light & Shadow Intensity", Range(0, 1)) = 1
        _ShowInAmbientLightShadowThreshold ("Show In Ambient Light & Shadow Threshold", Float ) = 0.4

        [MaterialToggle] _LightFalloffAffectShadowT ("Light Falloff Affect ShadowT", Float ) = 0

        _PTexture ("PTexture", 2D) = "white" {}
        _PTexturePower ("Power", Float ) = 1

        [MaterialToggle] _GIFlatShade ("GI Flat Shade", Float ) = 0
        _GIShadeThreshold ("GI Shade Threshold", Range(0, 1)) = 0

        [MaterialToggle] _LightAffectShadow ("Light Affect Shadow", Float ) = 0
        _LightIntensity ("Light Intensity", Float ) = -1

        _EnvironmentalLightingIntensity ("Environmental Lighting Intensity", Float ) = 1

		_DirectionalLightIntensity ("Directional Light Intensity", Float ) = 0
		_PointSpotlightIntensity ("Point and Spot Light Intensity", Float ) = 0
		_LightFalloffSoftness ("Light Falloff Softness", Range(0, 1)) = 1

        _CustomLightDirectionIntensity ("Intensity", Range(0, 1)) = 0
        [MaterialToggle] _CustomLightDirectionFollowObjectRotation ("Follow Object Rotation", Float ) = 0
        _CustomLightDirection ("Custom Light Direction", Vector) = (0,0,10,0)

        _ReflectionIntensity ("Intensity", Range(0, 1)) = 0
        _ReflectionRoughtness ("Roughtness", Float ) = 0

		_RefMetallic ("Metallic", Range(0, 1) ) = 0

        _MaskReflection ("Mask Reflection", 2D) = "white" {}

        [MaterialToggle] _UseFReflection ("Use FReflection", Float ) = 0
        _FReflection ("FReflection", 2D) = "black" {}

        _RimLightUnfill ("Unfill", Float ) = 1.5
        [HDR] _RimLightColor ("Color", Color) = (1,1,1,1)
        _RimLightColorPower ("Color Power", Float ) = 10
        _RimLightSoftness ("Softness", Range(0, 1)) = 1
        [MaterialToggle] _RimLightInLight ("Rim Light In Light", Float ) = 1
        [MaterialToggle] _LightAffectRimLightColor ("Light Affect Rim Light Color", Float ) = 0

		_RefVal ("ID", int ) = 0
        [Enum(None,8,A,0,B,2)] _Oper("Set 1", int) = 8
        [Enum(None,8,A,6,B,7)] _Compa("Set 2", int) = 8

		[Toggle(N_F_NM_ON)] _N_F_NM ("Normal Map", Float ) = 0
		[Toggle(N_F_CO_ON)] _N_F_CO ("Cutout", Float ) = 0
		[Toggle(N_F_O_ON)] _N_F_O ("Outline", Float ) = 1
		[Toggle(N_F_CA_ON)] _N_F_CA ("Color Adjustment", Float ) = 0
		[Toggle(N_F_SL_ON)] _N_F_SL ("Self Lit", Float ) = 0
		[Toggle(N_F_GLO_ON)] _N_F_GLO ("Gloss", Float ) = 0
		[Toggle(N_F_GLOT_ON)] _N_F_GLOT ("Gloss Texture", Float ) = 0
		[Toggle(N_F_SS_ON)] _N_F_SS ("Self Shadow", Float ) = 1
		[Toggle(N_F_SON_ON)] _N_F_SON ("Smooth Object Normal", Float ) = 0
		[Toggle(N_F_SCT_ON)] _N_F_SCT ("Shadow Color Texture", Float ) = 0
		[Toggle(N_F_ST_ON)] _N_F_ST ("ShadowT", Float ) = 0
		[Toggle(N_F_PT_ON)] _N_F_PT ("PTexture", Float ) = 0
		[Toggle(N_F_CLD_ON)] _N_F_CLD ("Custom Light Direction", Float ) = 0
		[Toggle(N_F_R_ON)] _N_F_R ("Relfection", Float ) = 0
		[Toggle(N_F_FR_ON)] _N_F_FR ("FRelfection", Float ) = 0
		[Toggle(N_F_RL_ON)] _N_F_RL ("Rim Light", Float ) = 0

		[Toggle(N_F_HDLS_ON)] _N_F_HDLS ("Hide Directional Light Shadow", Float ) = 0
		[Toggle(N_F_HPSS_ON)] _N_F_HPSS ("Hide Point & Spot Light Shadow", Float ) = 0

		[Toggle(N_F_NLASOBF_ON)] _N_F_NLASOBF ("No Light and Shadow On BackFace", Float ) = 0

    }
    SubShader {
        Tags {
            "Queue"="Geometry"
            "RenderType"="Opaque"
        }
        Pass {
            Name "Outline"
            Tags {
					"LightMode" = "Always"
            }
            Cull [_DoubleSidedOutline]

			Stencil {
            	Ref[_RefVal]
            	Comp [_Compa]
            	Pass [_Oper]
            	Fail [_Oper]
            }
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile_fog

			#pragma multi_compile_instancing

            #pragma only_renderers d3d9 d3d11 vulkan glcore gles3 metal xboxone ps4 wiiu switch 
            #pragma target 3.0

			#pragma shader_feature N_F_O_ON
			#pragma shader_feature N_F_CO_ON

            uniform float4 _LightColor0;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform fixed _EnableTextureTransparent;
            uniform half _OutlineWidth;
            uniform half4 _OutlineColor;
            uniform fixed _LightAffectOutlineColor;
            uniform fixed _VertexColorRedAffectOutlineWitdh;
            uniform sampler2D _OutlineWidthControl; uniform float4 _OutlineWidthControl_ST;
            uniform fixed _OutlineWidthAffectedByViewDistance;
            uniform fixed _DynamicNoisyOutline;
            uniform half _NoisyOutlineIntensity;
            uniform half _Cutout;
            uniform fixed _UseSecondaryCutout;
            uniform sampler2D _SecondaryCutout; uniform float4 _SecondaryCutout_ST;
            uniform fixed _AlphaBaseCutout;
			uniform half3 _OutlineOffset;
			uniform float3 _OEM;
            uniform int _OutlineExtrudeMethod;
			uniform half _OutlineZPostionInCamera;
			uniform half _FarDistanceMaxWidth;

            half N_F_CO( half A , half B ){
            #ifdef N_F_CO_ON
            
            return A;
            
            #else
            
            return B;
            
            #endif
            }
            
            uniform fixed _TexturePatternStyle;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 vertexColor : COLOR;
                float4 projPos : TEXCOORD1;
                UNITY_FOG_COORDS(2)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;

				UNITY_SETUP_INSTANCE_ID (v);

                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;

                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );
                float3 lightColor = _LightColor0.rgb;
                half _VertexColorRedAffectOutlineWitdh_var = lerp( _OutlineWidth, (_OutlineWidth*(1.0 - o.vertexColor.r)), _VertexColorRedAffectOutlineWitdh );
                half node_1229 = distance(objPos.rgb,_WorldSpaceCameraPos);
                half4 _OutlineWidthControl_var = tex2Dlod(_OutlineWidthControl,float4(TRANSFORM_TEX(o.uv0, _OutlineWidthControl),0.0,0));
                float4 node_3726 = _Time;
                float node_8530_ang = node_3726.g;
                float node_8530_spd = 0.002;
                float node_8530_cos = cos(node_8530_spd*node_8530_ang);
                float node_8530_sin = sin(node_8530_spd*node_8530_ang);
                float2 node_8530_piv = float2(0.5,0.5);
                half2 node_8530 = (mul(o.uv0-node_8530_piv,float2x2( node_8530_cos, -node_8530_sin, node_8530_sin, node_8530_cos))+node_8530_piv);
                half2 _DynamicNoisyOutline_var = lerp( o.uv0, node_8530, _DynamicNoisyOutline );
                float2 node_1283_skew = _DynamicNoisyOutline_var + 0.2127+_DynamicNoisyOutline_var.x*0.3713*_DynamicNoisyOutline_var.y;
                float2 node_1283_rnd = 4.789*sin(489.123*(node_1283_skew));
                half node_1283 = frac(node_1283_rnd.x*node_1283_rnd.y*(1+node_1283_skew.x));

				_OEM = lerp(v.normal,normalize(v.vertex),_OutlineExtrudeMethod);

                o.pos = UnityObjectToClipPos( float4((v.vertex.xyz + _OutlineOffset.xyz * 0.01) + _OEM*((lerp( _VertexColorRedAffectOutlineWitdh_var, ( clamp(_VertexColorRedAffectOutlineWitdh_var*node_1229, _VertexColorRedAffectOutlineWitdh_var, _FarDistanceMaxWidth) ), _OutlineWidthAffectedByViewDistance )*0.01)*_OutlineWidthControl_var.r*lerp(1.0,node_1283,_NoisyOutlineIntensity)),1) );
               
				#if defined(SHADER_API_GLCORE) || defined(SHADER_API_GLES) || defined(SHADER_API_GLES3)
					o.pos.z = o.pos.z + _OutlineZPostionInCamera * 0.0005;
				#else
					o.pos.z = o.pos.z - _OutlineZPostionInCamera * 0.0005;
				#endif

				UNITY_TRANSFER_FOG(o,o.pos);
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );
                float2 sceneUVs = (i.projPos.xy / i.projPos.w);
                half node_1229 = distance(objPos.rgb,_WorldSpaceCameraPos);
                half2 node_9146 = (float2((sceneUVs.x * 2 - 1)*(_ScreenParams.r/_ScreenParams.g), sceneUVs.y * 2 - 1).rg*node_1229);
                half2 _TexturePatternStyle_var = lerp( i.uv0, node_9146, _TexturePatternStyle );
                half4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(_TexturePatternStyle_var, _MainTex));
                half4 _SecondaryCutout_var = tex2D(_SecondaryCutout,TRANSFORM_TEX(i.uv0, _SecondaryCutout));
                clip(N_F_CO( lerp( (lerp((_MainTex_var.r*_SecondaryCutout_var.r),_SecondaryCutout_var.r,_UseSecondaryCutout)+lerp(0.5,(-1.0),_Cutout)), saturate(( (1.0 - _Cutout) > 0.5 ? (1.0-(1.0-2.0*((1.0 - _Cutout)-0.5))*(1.0-lerp((_MainTex_var.a*_SecondaryCutout_var.r),_SecondaryCutout_var.a,_UseSecondaryCutout))) : (2.0*(1.0 - _Cutout)*lerp((_MainTex_var.a*_SecondaryCutout_var.r),_SecondaryCutout_var.a,_UseSecondaryCutout)) )), _AlphaBaseCutout ) , lerp( 1.0, _MainTex_var.a, _EnableTextureTransparent ) ) - 0.5);
				float3 lightColor = _LightColor0.rgb;
                float node_6587 = 0.0;

                fixed4 finalRGBA = fixed4(lerp( _OutlineColor.rgb, lerp(float3(node_6587,node_6587,node_6587),_OutlineColor.rgb,_LightColor0.rgb), _LightAffectOutlineColor ),0);
				UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
				return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
			Cull [_DoubleSided]
            
			Stencil {
            	Ref[_RefVal]
            	Comp [_Compa]
            	Pass [_Oper]
            	Fail [_Oper]
            }
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog

			#pragma multi_compile_instancing

            #pragma only_renderers d3d9 d3d11 vulkan glcore gles3 metal xboxone ps4 wiiu switch
            #pragma target 3.0

			#pragma shader_feature N_F_NM_ON
			#pragma shader_feature N_F_CO_ON
			#pragma shader_feature N_F_SL_ON
			#pragma shader_feature N_F_CA_ON
			#pragma shader_feature N_F_GLO_ON
			#pragma shader_feature N_F_GLOT_ON
			#pragma shader_feature N_F_SS_ON
			#pragma shader_feature N_F_SCT_ON
			#pragma shader_feature N_F_ST_ON
			#pragma shader_feature N_F_STIS_ON
			#pragma shader_feature N_F_STIAL_ON 
			#pragma shader_feature N_F_SON_ON
			#pragma shader_feature N_F_PT_ON
			#pragma shader_feature N_F_CLD_ON
			#pragma shader_feature N_F_R_ON
			#pragma shader_feature N_F_FR_ON
			#pragma shader_feature N_F_RL_ON
			#pragma shader_feature N_F_HDLS_ON
			#pragma shader_feature N_F_NLASOBF_ON

            uniform half _SelfShadowHardness;
            uniform half _SelfShadowThreshold;
            uniform half4 _HighlightColor;
            uniform half4 _SelfShadowRealTimeShadowColor;
            uniform half _SelfShadowRealTimeShadowColorPower;
            uniform half _HighlightColorPower;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform half4 _MainColor;
            uniform sampler2D _ShadowColorTexture; uniform float4 _ShadowColorTexture_ST;
            uniform half _ShadowColorTexturePower;
            uniform sampler2D _ShadowT; uniform float4 _ShadowT_ST;
            uniform half _ShadowTShadowThreshold;
            uniform fixed _LightFalloffAffectShadowT;
            uniform half _ShadowTLightThreshold;
            uniform half _ShadowTHardness;
            uniform half4 _ShadowTColor;
            uniform half _ShadowTColorPower;
            uniform half4 _OverallShadowColor;
            uniform half _OverallShadowColorPower;
            uniform half _Glossiness;
            uniform half _GlossSoftness;
            uniform half4 _GlossColor;
            uniform half _GlossColorPower;
            uniform sampler2D _GlossTexture; uniform float4 _GlossTexture_ST;
            uniform half _GlossTextureFollowLight;
            uniform fixed _GlossTextureFollowObjectRotation;
            uniform sampler2D _MaskGloss; uniform float4 _MaskGloss_ST;
            uniform sampler2D _FReflection; uniform float4 _FReflection_ST;
            uniform half _ReflectionIntensity;
            uniform sampler2D _MaskReflection; uniform float4 _MaskReflection_ST;
            uniform half _GlossTextureSoftness;
            uniform half4 _SelfLitColor;
            uniform fixed _SelfLitHighContrast;
            uniform half _SelfLitPower;
            uniform half _SelfLitIntensity;
            uniform sampler2D _MaskSelfLit; uniform float4 _MaskSelfLit_ST;
            uniform sampler2D _PTexture; uniform float4 _PTexture_ST;
            uniform half _PTexturePower;
			uniform half _DirectionalLightIntensity;
            half3 AL_GI( float3 N ){
            return ShadeSH9(float4(N,1));
            }
            
            uniform fixed _RimLightInLight;
            uniform half _RimLightUnfill;
            uniform half4 _RimLightColor;
            uniform half _RimLightColorPower;
            uniform half _RimLightSoftness;
            half N_F_SS( half A , half B ){
            #ifdef N_F_SS_ON
            
            return A;
            
            #else
            
            return B;
            
            #endif
            }
            
            half3 N_F_SCT( half3 A ){
            #ifdef N_F_SCT_ON
            
            return A;
            
            #else
            
            return 1;
            
            #endif
            }
            
            half N_F_PT( half A ){
            #ifdef N_F_PT_ON
            
            return A;
            
            #else
            
            return 1;
            
            #endif
            }
            
            half3 N_F_ST( half3 A , half3 B ){
            #ifdef N_F_ST_ON
            
            return A;
            
            #else
            
            return B;
            
            #endif
            }
            
            half3 N_F_GLO( half3 A , half3 B ){
            #ifdef N_F_GLO_ON
            
            return A;
            
            #else
            
            return B;
            
            #endif
            }
            
            half3 N_F_GLOT( half A , half B ){
            #ifdef N_F_GLOT_ON
            
            return A;
            
            #else
            
            return B;
            
            #endif
            }
            
            half3 N_F_R( half3 A , half3 B ){
            #ifdef N_F_R_ON
            
            return A;
            
            #else
            
            return B;
            
            #endif
            }
            
            half3 N_F_SL( half3 A , half3 B ){
            #ifdef N_F_SL_ON
            
            return A;
            
            #else
            
            return B;
            
            #endif
            }
            
            half3 N_F_RL( half3 A , half3 B ){
            #ifdef N_F_RL_ON
            
            return A;
            
            #else
            
            return B;
            
            #endif
            }
            
            half3 N_F_SL_1( half3 A , half3 B ){
            #ifdef N_F_SL_ON
            
            return A;
            
            #else
            
            return B;
            
            #endif
            }
            
            half3 N_F_RL_1( half3 A , half3 B ){
            #ifdef N_F_RL_ON
            
            return A;
            
            #else
            
            return B;
            
            #endif
            }
            
            uniform fixed _SelfShadowShadowTAtViewDirection;
            uniform half _XYZHardness;
            uniform float4 _XYZPosition;
            uniform half _SmoothObjectNormal;
            uniform fixed _ShowNormal;
            half3 N_F_SON( half3 A , half3 B ){
            #ifdef N_F_SON_ON
            
            return A;
            
            #else
            
            return B;
            
            #endif
            }
            
            half3 N_F_SON_1( half3 A ){
            #ifdef N_F_SON_ON
            
            return A;
            
            #else
            
            return 1;
            
            #endif
            }
            
            uniform half4 _CustomLightDirection;
            uniform fixed _CustomLightDirectionFollowObjectRotation;
            uniform half _CustomLightDirectionIntensity;
            half3 N_F_CLD( half3 A , half3 B ){
            #ifdef N_F_CLD_ON
            
            return A;
            
            #else
            
            return B;
            
            #endif
            }
            
            uniform fixed _EnableTextureTransparent;
            uniform fixed _VertexColorGreenControlSelfShadowSize;
            uniform fixed _VertexColorBlueControlSmoothObjectNormal;
            uniform fixed _LightAffectRimLightColor;
            uniform sampler2D _NormalMap; uniform float4 _NormalMap_ST;
            uniform half _NormalMapIntensity;
            uniform fixed _UseFReflection;
            float3 Ref( half3 VR , half Mip ){
            float4 skyData = UNITY_SAMPLE_TEXCUBE_LOD(unity_SpecCube0, VR, Mip);
            return DecodeHDR (skyData, unity_SpecCube0_HDR);
            }
            
            uniform half _ReflectionRoughtness;
            uniform fixed _GIFlatShade;
            uniform half _GIShadeThreshold;
            uniform half _GlossTextureRotate;
            uniform half _Cutout;
            uniform fixed _UseSecondaryCutout;
            uniform sampler2D _SecondaryCutout; uniform float4 _SecondaryCutout_ST;
            uniform fixed _AlphaBaseCutout;
            half N_F_CO( half A , half B ){
            #ifdef N_F_CO_ON
            
            return A;
            
            #else
            
            return B;
            
            #endif
            }
            
            uniform half _LightIntensity;
            uniform fixed _TexturePatternStyle;
            half3 N_F_FR( half3 A , half3 B ){
            #ifdef N_F_FR_ON
            
            return A;
            
            #else
            
            return B;
            
            #endif
            }
            
            uniform half _SelfShadowRealtimeShadowIntensity;
            uniform half _EnvironmentalLightingIntensity;
            fixed C_SS(){
            return _LightShadowData.x;
            }
            
            uniform fixed _SelfShadowAffectedByLightShadowStrength;
            uniform half _Saturation;
            half3 N_F_CA( half3 A , half3 B ){
            #ifdef N_F_CA_ON
            
            return A;
            
            #else
            
            return B;
            
            #endif
            }
            
            uniform fixed _LightAffectShadow;
            uniform half _ShadowTIntensity;
            uniform half _ShowInAmbientLightShadowThreshold;

			uniform half _ShadowHardness;

            half3 N_F_STIS( half3 A ){
            #ifdef N_F_ST_ON
            
            	#ifdef N_F_STIS_ON
            
            	return A;
            
            	#else
            
            	return 1;
            
            	#endif
            
            #else
            
            return 1;
            
            #endif
            }
            
            half3 N_F_STIAL( half3 A ){
            #ifdef N_F_ST_ON
            
            	#ifdef N_F_STIAL_ON
            
            	return A;
            
            	#else
            
            	return 1;
            
            	#endif
            
            #else
            
            return 1;
            
            #endif
            }
            
            uniform half _GlossIntensity;
            uniform half _ShowInAmbientLightShadowIntensity;
			uniform half _RefMetallic;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 bitangentDir : TEXCOORD4;
                float4 vertexColor : COLOR;
                float4 projPos : TEXCOORD5;
                LIGHTING_COORDS(6,7)
                UNITY_FOG_COORDS(8)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID (v);
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
				half isFrontFace = ( facing >= 0 ? 1 : 0 );
                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);

				#ifdef N_F_NM_ON
					half3 _NormalMap_var = UnpackNormal(tex2D(_NormalMap,TRANSFORM_TEX(i.uv0, _NormalMap)));
					float3 normalLocal = lerp(half3(0,0,1),_NormalMap_var.rgb,_NormalMapIntensity);
				#else
					float3 normalLocal = half3(0,0,1);
				#endif

                float3 normalDirection = normalize(mul( normalLocal, tangentTransform ));
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                float2 sceneUVs = (i.projPos.xy / i.projPos.w);
                half node_1229 = distance(objPos.rgb,_WorldSpaceCameraPos);
                half2 node_9146 = (float2((sceneUVs.x * 2 - 1)*(_ScreenParams.r/_ScreenParams.g), sceneUVs.y * 2 - 1).rg*node_1229);
                half2 _TexturePatternStyle_var = lerp( i.uv0, node_9146, _TexturePatternStyle );
                half4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(_TexturePatternStyle_var, _MainTex));
                half4 _SecondaryCutout_var = tex2D(_SecondaryCutout,TRANSFORM_TEX(i.uv0, _SecondaryCutout));
                clip(N_F_CO( lerp( (lerp((_MainTex_var.r*_SecondaryCutout_var.r),_SecondaryCutout_var.r,_UseSecondaryCutout)+lerp(0.5,(-1.0),_Cutout)), saturate(( (1.0 - _Cutout) > 0.5 ? (1.0-(1.0-2.0*((1.0 - _Cutout)-0.5))*(1.0-lerp((_MainTex_var.a*_SecondaryCutout_var.r),_SecondaryCutout_var.a,_UseSecondaryCutout))) : (2.0*(1.0 - _Cutout)*lerp((_MainTex_var.a*_SecondaryCutout_var.r),_SecondaryCutout_var.a,_UseSecondaryCutout)) )), _AlphaBaseCutout ) , lerp( 1.0, _MainTex_var.a, _EnableTextureTransparent ) ) - 0.5);
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);

				#ifdef N_F_NLASOBF_ON
					float3 lightColor = lerp(0,_LightColor0.rgb,isFrontFace);
				#else
					float3 lightColor = _LightColor0.rgb;
				#endif

                float3 halfDirection = normalize(viewDirection+lightDirection);

				#ifdef N_F_HDLS_ON
					float attenuation = 1; 
				#else
					half dlshmin = lerp(0,0.6,_ShadowHardness);
					half dlshmax = lerp(1,0.6,_ShadowHardness);
				#ifdef N_F_NLASOBF_ON
					UNITY_LIGHT_ATTENUATION(sha, i, i.posWorld.xyz);
					half FB_Check = lerp(1,sha,isFrontFace);
				#else
					UNITY_LIGHT_ATTENUATION(sha, i, i.posWorld.xyz);
					half FB_Check = sha;
				#endif
					float attenuation = smoothstep(dlshmin,dlshmax,FB_Check);
				#endif
                
                half3 node_7946 = (_MainTex_var.rgb*_MainColor.rgb);
                float node_3622 = 0.0;
				float node_1766 = 1.0;
                float3 node_76 = mul( unity_WorldToObject, float4((i.posWorld.rgb-objPos.rgb),0) ).xyz.rgb.rgb;
                half3 node_5206 = lerp(normalDirection,mul( unity_ObjectToWorld, float4(float3((_XYZPosition.r+(_XYZHardness*node_76.r)),(_XYZPosition.g+(_XYZHardness*node_76.g)),(_XYZPosition.b+(_XYZHardness*node_76.b))),0) ).xyz.rgb,lerp( _SmoothObjectNormal, (_SmoothObjectNormal*(1.0 - i.vertexColor.b)), _VertexColorBlueControlSmoothObjectNormal ));
                half3 node_3134 = N_F_SON( node_5206 , normalDirection );
                float node_2183 = 0;
                float node_8383 = 0.01;
                half3 node_81 = (AL_GI( lerp(float3(node_3622,node_3622,node_3622),float3(node_1766,node_1766,node_1766),lerp( (node_3134*_GIShadeThreshold), float3(smoothstep( float2(node_2183,node_2183), float2(node_8383,node_8383), (node_3134.rb*_GIShadeThreshold) ),0.0), _GIFlatShade )) )*_EnvironmentalLightingIntensity);
                half4 _MaskSelfLit_var = tex2D(_MaskSelfLit,TRANSFORM_TEX(i.uv0, _MaskSelfLit));
                float node_8675 = 1.0;
                half node_949 = 1.0;
                half4 _ShadowColorTexture_var = tex2D(_ShadowColorTexture,TRANSFORM_TEX(i.uv0, _ShadowColorTexture));
                half3 node_9600 = N_F_SCT( lerp(_ShadowColorTexture_var.rgb,(_ShadowColorTexture_var.rgb*_ShadowColorTexture_var.rgb),_ShadowColorTexturePower) );
                half4 _PTexture_var = tex2D(_PTexture,TRANSFORM_TEX(node_9146, _PTexture));
                half node_8910 = N_F_PT( lerp((1.0 - _PTexturePower),1.0,_PTexture_var.r) );
                half3 node_7102 = (_OverallShadowColor.rgb*_OverallShadowColorPower);
                half3 node_338 = ((_ShadowTColor.rgb*_ShadowTColorPower)*node_9600*node_8910*node_7102);
                float node_5738 = 1.0;
                half node_6045 = lerp(0.0,0.22,_ShadowTHardness);
                half node_3187 = 0.22;
                half4 _ShadowT_var = tex2D(_ShadowT,TRANSFORM_TEX(i.uv0, _ShadowT));
                half3 node_4285 = lerp(float3(node_949,node_949,node_949),lerp(node_338,float3(node_5738,node_5738,node_5738),smoothstep( node_6045, node_3187, (_ShowInAmbientLightShadowThreshold*_ShadowT_var.r) )),_ShadowTIntensity);
                float node_2346 = 1.0;
                float4 node_3149_k = float4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
                float4 node_3149_p = lerp(float4(float4(lightColor.rgb,0.0).zy, node_3149_k.wz), float4(float4(lightColor.rgb,0.0).yz, node_3149_k.xy), step(float4(lightColor.rgb,0.0).z, float4(lightColor.rgb,0.0).y));
                float4 node_3149_q = lerp(float4(node_3149_p.xyw, float4(lightColor.rgb,0.0).x), float4(float4(lightColor.rgb,0.0).x, node_3149_p.yzx), step(node_3149_p.x, float4(lightColor.rgb,0.0).x));
                float node_3149_d = node_3149_q.x - min(node_3149_q.w, node_3149_q.y);
                float node_3149_e = 1.0e-10;
                half3 node_3149 = float3(abs(node_3149_q.z + (node_3149_q.w - node_3149_q.y) / (6.0 * node_3149_d + node_3149_e)), node_3149_d / (node_3149_q.x + node_3149_e), node_3149_q.x);;
                half node_938 = saturate(node_3149.b);
                half3 node_1860 = ((_SelfShadowRealTimeShadowColor.rgb*_SelfShadowRealTimeShadowColorPower)*node_7102*node_9600*node_8910);
                half3 node_6588 = (_LightIntensity+lightColor.rgb);
                half3 node_2779 = (_HighlightColor.rgb*_HighlightColorPower+_DirectionalLightIntensity);
                float node_1533 = 0.0;
                float node_5992_ang = _GlossTextureRotate;
                float node_5992_spd = 1.0;
                float node_5992_cos = cos(node_5992_spd*node_5992_ang);
                float node_5992_sin = sin(node_5992_spd*node_5992_ang);
                float2 node_5992_piv = float2(0.5,0.5);
                half3 node_2832 = reflect(lerp(viewDirection,halfDirection,_GlossTextureFollowLight),normalDirection);
                half2 node_9280 = lerp( node_2832, mul( unity_WorldToObject, float4(node_2832,0) ).xyz.rgb, _GlossTextureFollowObjectRotation ).rg;
                half2 node_5992 = (mul(float2((-1*node_9280.r),node_9280.g)-node_5992_piv,float2x2( node_5992_cos, -node_5992_sin, node_5992_sin, node_5992_cos))+node_5992_piv);
                half2 node_8759 = (node_5992*0.5+0.5);
                half4 _GlossTexture_var = tex2Dlod(_GlossTexture,float4(TRANSFORM_TEX(node_8759, _GlossTexture),0.0,_GlossTextureSoftness));
                half4 _MaskGloss_var = tex2D(_MaskGloss,TRANSFORM_TEX(i.uv0, _MaskGloss));
                half3 node_2687 = N_F_GLO( lerp(node_2779,lerp(node_2779,(_GlossColor.rgb*_GlossColorPower),lerp(float3(node_1533,node_1533,node_1533),N_F_GLOT( _GlossTexture_var.r , smoothstep( 0.1, lerp(0.1,1.0,_GlossSoftness), pow(max(0,dot(halfDirection,normalDirection)),exp2(lerp(-2,15,_Glossiness))) ) ),_GlossIntensity)),_MaskGloss_var.r) , node_2779 );
                float node_4353 = 0.0;
                float node_3687 = 0.0;
                half3 node_4858 = lerp(float3(node_4353,node_4353,node_4353),(lerp( _RimLightColor.rgb, lerp(float3(node_3687,node_3687,node_3687),_RimLightColor.rgb,lightColor.rgb), _LightAffectRimLightColor )*_RimLightColorPower),smoothstep( 1.71, lerp(1.70,0.29,_RimLightSoftness), pow(1.0-max(0,dot(normalDirection, viewDirection)),(1.0 - _RimLightUnfill)) ));
                half3 node_2500 = (N_F_RL_1( lerp(node_2687,(node_2687+node_4858),_RimLightInLight) , node_2687 )*N_F_SON_1( lerp( 1.0, node_5206, _ShowNormal ) )*lightColor.rgb);
                half node_573 = 0.5*dot(lerp( N_F_CLD( lerp(lightDirection,lerp( _CustomLightDirection.rgb, mul( unity_ObjectToWorld, float4(_CustomLightDirection.rgb,0) ).xyz.rgb, _CustomLightDirectionFollowObjectRotation ),_CustomLightDirectionIntensity) , lightDirection ), viewDirection, _SelfShadowShadowTAtViewDirection ),node_3134)+0.5;
                half node_5573 = 1.0;
                half node_9545 = smoothstep( lerp(0.3,1.0,_SelfShadowHardness), 1.0, (node_573*lerp(7,lerp( _SelfShadowThreshold, (_SelfShadowThreshold*(1.0 - i.vertexColor.g)), _VertexColorGreenControlSelfShadowSize ),_SelfShadowThreshold)) );
                
				half3 node_2388 = (node_7946*lerp((lerp(node_1860,(node_1860+node_6588),_LightAffectShadow)*node_938*N_F_STIS( lerp(1,node_4285,_ShowInAmbientLightShadowIntensity) )),N_F_ST( lerp((lerp(node_338,(node_338+node_6588),_LightAffectShadow)*node_938),node_2500,lerp(node_949,smoothstep( node_6045, node_3187, ((_ShadowT_var.r*(1.0 - _ShadowTShadowThreshold))*(lerp( node_573, (attenuation*node_573), _LightFalloffAffectShadowT )*_ShadowTLightThreshold*0.01)) ),_ShadowTIntensity)) , node_2500 ),N_F_SS( lerp(node_5573,(lerp( node_9545, lerp(node_9545,node_5573,C_SS()), _SelfShadowAffectedByLightShadowStrength )*attenuation),_SelfShadowRealtimeShadowIntensity) , lerp(node_5573,attenuation,_SelfShadowRealtimeShadowIntensity) )));
                
				float3 node_9694 = Ref( viewReflectDirection , _ReflectionRoughtness );
                half2 node_8431 = reflect(viewDirection,normalDirection).rg;
                half2 node_4207 = (float2(node_8431.r,(-1*node_8431.g))*0.5+0.5);
                half4 _FReflection_var = tex2Dlod(_FReflection,float4(TRANSFORM_TEX(node_4207, _FReflection),0.0,_ReflectionRoughtness));
                half4 _MaskReflection_var = tex2D(_MaskReflection,TRANSFORM_TEX(i.uv0, _MaskReflection));
                half3 node_2704 = N_F_R( lerp(node_2388,lerp(node_2388,N_F_FR( lerp( node_9694, _FReflection_var.rgb, _UseFReflection ) , node_9694 ) * lerp(1,(9 * (node_7946 - (9 * 0.005) ) ) , _RefMetallic) ,_MaskReflection_var.r),_ReflectionIntensity) , node_2388 );
                half3 node_7395 = N_F_SL_1( lerp(node_2704,lerp(node_2704,node_7946,_MaskSelfLit_var.r),_SelfLitIntensity) , node_2704 );
                half3 node_1956 = ((node_7946*N_F_SL( lerp(node_81,lerp(node_81,((_SelfLitColor.rgb*node_7946*lerp( 1.0, node_7946, _SelfLitHighContrast ))*_SelfLitPower),_MaskSelfLit_var.r),_SelfLitIntensity) , node_81 )*N_F_STIAL( lerp(lerp(float3(node_8675,node_8675,node_8675),node_4285,_ShowInAmbientLightShadowIntensity),float3(node_2346,node_2346,node_2346),clamp((node_938*8.0),0,1)) ))+N_F_RL( lerp((node_7395+node_4858),node_7395,_RimLightInLight) , node_7395 ));
                float3 finalColor = N_F_CA( lerp(node_1956,dot(node_1956,float3(0.3,0.59,0.11)),(1.0 - _Saturation)) , node_1956 );
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }

            BlendOp Max
			Cull [_DoubleSided]

			Stencil {
            	Ref[_RefVal]
            	Comp [_Compa]
            	Pass [_Oper]
            	Fail [_Oper]
            }

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile_fog

			#pragma multi_compile_instancing

            #pragma only_renderers d3d9 d3d11 vulkan glcore gles3 metal xboxone ps4 wiiu switch
            #pragma target 3.0

			#pragma shader_feature N_F_NM_ON
			#pragma shader_feature N_F_CO_ON
			#pragma shader_feature N_F_SL_ON
			#pragma shader_feature N_F_CA_ON
			#pragma shader_feature N_F_GLO_ON
			#pragma shader_feature N_F_GLOT_ON
			#pragma shader_feature N_F_SS_ON
			#pragma shader_feature N_F_SCT_ON
			#pragma shader_feature N_F_ST_ON
			#pragma shader_feature N_F_STIS_ON
			#pragma shader_feature N_F_STIAL_ON 
			#pragma shader_feature N_F_SON_ON
			#pragma shader_feature N_F_PT_ON
			#pragma shader_feature N_F_CLD_ON
			#pragma shader_feature N_F_R_ON
			#pragma shader_feature N_F_FR_ON
			#pragma shader_feature N_F_RL_ON
			#pragma shader_feature N_F_HPSS_ON
			#pragma shader_feature N_F_NLASOBF_ON

            uniform half _SelfShadowHardness;
            uniform half _SelfShadowThreshold;
            uniform half4 _HighlightColor;
            uniform half4 _SelfShadowRealTimeShadowColor;
            uniform half _SelfShadowRealTimeShadowColorPower;
            uniform half _HighlightColorPower;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform half4 _MainColor;
            uniform sampler2D _ShadowColorTexture; uniform float4 _ShadowColorTexture_ST;
            uniform half _ShadowColorTexturePower;
            uniform sampler2D _ShadowT; uniform float4 _ShadowT_ST;
            uniform half _ShadowTShadowThreshold;
            uniform fixed _LightFalloffAffectShadowT;
            uniform half _ShadowTLightThreshold;
            uniform half _ShadowTHardness;
            uniform half4 _ShadowTColor;
            uniform half _ShadowTColorPower;
            uniform half4 _OverallShadowColor;
            uniform half _OverallShadowColorPower;
            uniform half _Glossiness;
            uniform half _GlossSoftness;
            uniform half4 _GlossColor;
            uniform half _GlossColorPower;
            uniform sampler2D _GlossTexture; uniform float4 _GlossTexture_ST;
            uniform half _GlossTextureFollowLight;
            uniform fixed _GlossTextureFollowObjectRotation;
            uniform sampler2D _MaskGloss; uniform float4 _MaskGloss_ST;
            uniform sampler2D _FReflection; uniform float4 _FReflection_ST;
            uniform half _ReflectionIntensity;
            uniform sampler2D _MaskReflection; uniform float4 _MaskReflection_ST;
            uniform half _GlossTextureSoftness;
            uniform half4 _SelfLitColor;
            uniform fixed _SelfLitHighContrast;
            uniform half _SelfLitPower;
            uniform half _SelfLitIntensity;
            uniform sampler2D _MaskSelfLit; uniform float4 _MaskSelfLit_ST;
            uniform sampler2D _PTexture; uniform float4 _PTexture_ST;
            uniform half _PTexturePower;
            half3 AL_GI( float3 N ){
            return ShadeSH9(float4(N,1));
            }
            
            uniform fixed _RimLightInLight;
            uniform half _RimLightUnfill;
            uniform half4 _RimLightColor;
            uniform half _RimLightColorPower;
            uniform half _RimLightSoftness;
            half N_F_SS( half A , half B ){
            #ifdef N_F_SS_ON
            
            return A;
            
            #else
            
            return B;
            
            #endif
            }
            
            half3 N_F_SCT( half3 A ){
            #ifdef N_F_SCT_ON
            
            return A;
            
            #else
            
            return 1;
            
            #endif
            }
            
            half N_F_PT( half A ){
            #ifdef N_F_PT_ON
            
            return A;
            
            #else
            
            return 1;
            
            #endif
            }
            
            half3 N_F_ST( half3 A , half3 B ){
            #ifdef N_F_ST_ON
            
            return A;
            
            #else
            
            return B;
            
            #endif
            }
            
            half3 N_F_GLO( half3 A , half3 B ){
            #ifdef N_F_GLO_ON
            
            return A;
            
            #else
            
            return B;
            
            #endif
            }
            
            half3 N_F_GLOT( half A , half B ){
            #ifdef N_F_GLOT_ON
            
            return A;
            
            #else
            
            return B;
            
            #endif
            }
            
            half3 N_F_R( half3 A , half3 B ){
            #ifdef N_F_R_ON
            
            return A;
            
            #else
            
            return B;
            
            #endif
            }
            
            half3 N_F_SL( half3 A , half3 B ){
            #ifdef N_F_SL_ON
            
            return A;
            
            #else
            
            return B;
            
            #endif
            }
            
            half3 N_F_RL( half3 A , half3 B ){
            #ifdef N_F_RL_ON
            
            return A;
            
            #else
            
            return B;
            
            #endif
            }
            
            half3 N_F_SL_1( half3 A , half3 B ){
            #ifdef N_F_SL_ON
            
            return A;
            
            #else
            
            return B;
            
            #endif
            }
            
            half3 N_F_RL_1( half3 A , half3 B ){
            #ifdef N_F_RL_ON
            
            return A;
            
            #else
            
            return B;
            
            #endif
            }
            
            uniform fixed _SelfShadowShadowTAtViewDirection;
            uniform half _XYZHardness;
            uniform float4 _XYZPosition;
            uniform half _SmoothObjectNormal;
            uniform fixed _ShowNormal;
            half3 N_F_SON( half3 A , half3 B ){
            #ifdef N_F_SON_ON
            
            return A;
            
            #else
            
            return B;
            
            #endif
            }
            
            half3 N_F_SON_1( half3 A ){
            #ifdef N_F_SON_ON
            
            return A;
            
            #else
            
            return 1;
            
            #endif
            }
            
            uniform half4 _CustomLightDirection;
            uniform fixed _CustomLightDirectionFollowObjectRotation;
            uniform half _CustomLightDirectionIntensity;
            half3 N_F_CLD( half3 A , half3 B ){
            #ifdef N_F_CLD_ON
            
            return A;
            
            #else
            
            return B;
            
            #endif
            }
            
            uniform fixed _EnableTextureTransparent;
            uniform fixed _VertexColorGreenControlSelfShadowSize;
            uniform fixed _VertexColorBlueControlSmoothObjectNormal;
            uniform fixed _LightAffectRimLightColor;
            uniform sampler2D _NormalMap; uniform float4 _NormalMap_ST;
            uniform half _NormalMapIntensity;
            uniform fixed _UseFReflection;
            float3 Ref( half3 VR , half Mip ){
            float4 skyData = UNITY_SAMPLE_TEXCUBE_LOD(unity_SpecCube0, VR, Mip);
            return DecodeHDR (skyData, unity_SpecCube0_HDR);
            }
            
            uniform half _ReflectionRoughtness;
            uniform fixed _GIFlatShade;
            uniform half _GIShadeThreshold;
            uniform half _GlossTextureRotate;
            uniform half _Cutout;
            uniform fixed _UseSecondaryCutout;
            uniform sampler2D _SecondaryCutout; uniform float4 _SecondaryCutout_ST;
            uniform fixed _AlphaBaseCutout;
            half N_F_CO( half A , half B ){
            #ifdef N_F_CO_ON
            
            return A;
            
            #else
            
            return B;
            
            #endif
            }
            
            uniform half _LightIntensity;
            uniform fixed _TexturePatternStyle;
            half3 N_F_FR( half3 A , half3 B ){
            #ifdef N_F_FR_ON
            
            return A;
            
            #else
            
            return B;
            
            #endif
            }
            
            uniform half _SelfShadowRealtimeShadowIntensity;
            uniform half _EnvironmentalLightingIntensity;
            fixed C_SS(){
            return _LightShadowData.x;
            }
            
            uniform fixed _SelfShadowAffectedByLightShadowStrength;
            uniform half _Saturation;
            half3 N_F_CA( half3 A , half3 B ){
            #ifdef N_F_CA_ON
            
            return A;
            
            #else
            
            return B;
            
            #endif
            }
            
            uniform fixed _LightAffectShadow;
            uniform half _ShadowTIntensity;
            uniform half _ShowInAmbientLightShadowThreshold;

			uniform half _PointSpotlightIntensity;
			uniform half _LightFalloffSoftness;

            half3 N_F_STIS( half3 A ){
            #ifdef N_F_ST_ON
            
            	#ifdef N_F_STIS_ON
            
            	return A;
            
            	#else
            
            	return 1;
            
            	#endif
            
            #else
            
            return 1;
            
            #endif
            }
            
            half3 N_F_STIAL( half3 A ){
            #ifdef N_F_ST_ON
            
            	#ifdef N_F_STIAL_ON
            
            	return A;
            
            	#else
            
            	return 1;
            
            	#endif
            
            #else
            
            return 1;
            
            #endif
            }
            
            uniform half _GlossIntensity;
            uniform half _ShowInAmbientLightShadowIntensity;

			uniform half _ShadowHardness;

			uniform half _RefMetallic;

            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 bitangentDir : TEXCOORD4;
                float4 vertexColor : COLOR;
                float4 projPos : TEXCOORD5;
                LIGHTING_COORDS(6,7)
                UNITY_FOG_COORDS(8)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID (v);
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
				half isFrontFace = ( facing >= 0 ? 1 : 0 );
                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);

				#ifdef N_F_NM_ON
					half3 _NormalMap_var = UnpackNormal(tex2D(_NormalMap,TRANSFORM_TEX(i.uv0, _NormalMap)));
					float3 normalLocal = lerp(half3(0,0,1),_NormalMap_var.rgb,_NormalMapIntensity);
				#else
					float3 normalLocal = half3(0,0,1);
				#endif

                float3 normalDirection = normalize(mul( normalLocal, tangentTransform ));
                float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
                float2 sceneUVs = (i.projPos.xy / i.projPos.w);
                half node_1229 = distance(objPos.rgb,_WorldSpaceCameraPos);
                half2 node_9146 = (float2((sceneUVs.x * 2 - 1)*(_ScreenParams.r/_ScreenParams.g), sceneUVs.y * 2 - 1).rg*node_1229);
                half2 _TexturePatternStyle_var = lerp( i.uv0, node_9146, _TexturePatternStyle );
                half4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(_TexturePatternStyle_var, _MainTex));
                half4 _SecondaryCutout_var = tex2D(_SecondaryCutout,TRANSFORM_TEX(i.uv0, _SecondaryCutout));
                clip(N_F_CO( lerp( (lerp((_MainTex_var.r*_SecondaryCutout_var.r),_SecondaryCutout_var.r,_UseSecondaryCutout)+lerp(0.5,(-1.0),_Cutout)), saturate(( (1.0 - _Cutout) > 0.5 ? (1.0-(1.0-2.0*((1.0 - _Cutout)-0.5))*(1.0-lerp((_MainTex_var.a*_SecondaryCutout_var.r),_SecondaryCutout_var.a,_UseSecondaryCutout))) : (2.0*(1.0 - _Cutout)*lerp((_MainTex_var.a*_SecondaryCutout_var.r),_SecondaryCutout_var.a,_UseSecondaryCutout)) )), _AlphaBaseCutout ) , lerp( 1.0, _MainTex_var.a, _EnableTextureTransparent ) ) - 0.5);
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                
				#ifdef N_F_NLASOBF_ON
					float3 lightColor = lerp(0,_LightColor0.rgb,isFrontFace);
				#else
					float3 lightColor = _LightColor0.rgb;
				#endif

                float3 halfDirection = normalize(viewDirection+lightDirection);

				fixed lightfo = 0;
				#ifdef POINT
					unityShadowCoord3 lightCoord = mul(unity_WorldToLight, unityShadowCoord4(i.posWorld.xyz, 1)).xyz; 
					lightfo = tex2D(_LightTexture0, dot(lightCoord, lightCoord).rr).UNITY_ATTEN_CHANNEL;
				#else
					lightfo;
				#endif
				#ifdef POINT_COOKIE
					#if !defined(UNITY_HALF_PRECISION_FRAGMENT_SHADER_REGISTERS)
					#define DLCOO(input, worldPos) unityShadowCoord3 lightCoord = mul(unity_WorldToLight, unityShadowCoord4(worldPos, 1)).xyz
				#else
					#define DLCOO(input, worldPos) unityShadowCoord3 lightCoord = i._LightCoord
				#endif
					DLCOO(i, i.posWorld.xyz);
					lightfo = tex2D(_LightTextureB0, dot(lightCoord, lightCoord).rr).UNITY_ATTEN_CHANNEL * texCUBE(_LightTexture0, lightCoord).w;
				#else
					lightfo;
				#endif
				#ifdef DIRECTIONAL
					lightfo = UNITY_SHADOW_ATTENUATION(i, i.posWorld.xyz);
				#endif
				#ifdef DIRECTIONAL_COOKIE
					#if !defined(UNITY_HALF_PRECISION_FRAGMENT_SHADER_REGISTERS)
					#define DLCOO(input, worldPos) unityShadowCoord2 lightCoord = mul(unity_WorldToLight, unityShadowCoord4(worldPos, 1)).xy
				#else
					#define DLCOO(input, worldPos) unityShadowCoord2 lightCoord = input._LightCoord
				#endif
					DLCOO(i, i.posWorld.xyz);
					lightfo = tex2D(_LightTexture0, lightCoord).w;
				#endif
				#ifdef SPOT
					#if !defined(UNITY_HALF_PRECISION_FRAGMENT_SHADER_REGISTERS)
					#define DLCOO(input, worldPos) unityShadowCoord4 lightCoord = mul(unity_WorldToLight, unityShadowCoord4(worldPos, 1))
				#else
					#define DLCOO(input, worldPos) unityShadowCoord4 lightCoord = input._LightCoord
				#endif
					DLCOO(i, i.posWorld.xyz);
					lightfo = (lightCoord.z > 0) * tex2D(_LightTexture0, lightCoord.xy / lightCoord.w + 0.5).w * tex2D(_LightTextureB0, dot(lightCoord, lightCoord).xx).UNITY_ATTEN_CHANNEL;
				#else
					lightfo;
				#endif
				#ifdef N_F_HPSS_ON
					fixed attenuation = 1; 
				#else
					half dlshmin = lerp(0,0.6,_ShadowHardness);
					half dlshmax = lerp(1,0.6,_ShadowHardness);
				#ifdef N_F_NLASOBF_ON
					half FB_Check = lerp(0,UNITY_SHADOW_ATTENUATION(i, i.posWorld.xyz),isFrontFace);
				#else
					half FB_Check = UNITY_SHADOW_ATTENUATION(i, i.posWorld.xyz);
				#endif
					fixed attenuation = smoothstep(dlshmin, dlshmax ,FB_Check);
				#endif
				fixed lightfos = smoothstep(0, _LightFalloffSoftness ,lightfo);

                half3 node_7946 = (_MainTex_var.rgb*_MainColor.rgb);
                float node_3622 = 0.0;
                float node_1766 = 1.0;
                float3 node_76 = mul( unity_WorldToObject, float4((i.posWorld.rgb-objPos.rgb),0) ).xyz.rgb.rgb;
                half3 node_5206 = lerp(normalDirection,mul( unity_ObjectToWorld, float4(float3((_XYZPosition.r+(_XYZHardness*node_76.r)),(_XYZPosition.g+(_XYZHardness*node_76.g)),(_XYZPosition.b+(_XYZHardness*node_76.b))),0) ).xyz.rgb,lerp( _SmoothObjectNormal, (_SmoothObjectNormal*(1.0 - i.vertexColor.b)), _VertexColorBlueControlSmoothObjectNormal ));
                half3 node_3134 = N_F_SON( node_5206 , normalDirection );
                float node_2183 = 0;
                float node_8383 = 0.01;
                half3 node_81 = (AL_GI( lerp(float3(node_3622,node_3622,node_3622),float3(node_1766,node_1766,node_1766),lerp( (node_3134*_GIShadeThreshold), float3(smoothstep( float2(node_2183,node_2183), float2(node_8383,node_8383), (node_3134.rb*_GIShadeThreshold) ),0.0), _GIFlatShade )) )*_EnvironmentalLightingIntensity);
                half4 _MaskSelfLit_var = tex2D(_MaskSelfLit,TRANSFORM_TEX(i.uv0, _MaskSelfLit));
                float node_8675 = 1.0;
                half node_949 = 1.0;
                half4 _ShadowColorTexture_var = tex2D(_ShadowColorTexture,TRANSFORM_TEX(i.uv0, _ShadowColorTexture));
                half3 node_9600 = N_F_SCT( lerp(_ShadowColorTexture_var.rgb,(_ShadowColorTexture_var.rgb*_ShadowColorTexture_var.rgb),_ShadowColorTexturePower) );
                half4 _PTexture_var = tex2D(_PTexture,TRANSFORM_TEX(node_9146, _PTexture));
                half node_8910 = N_F_PT( lerp((1.0 - _PTexturePower),1.0,_PTexture_var.r) );
                half3 node_7102 = (_OverallShadowColor.rgb*_OverallShadowColorPower);
                half3 node_338 = ((_ShadowTColor.rgb*_ShadowTColorPower)*node_9600*node_8910*node_7102);
                float node_5738 = 1.0;
                half node_6045 = lerp(0.0,0.22,_ShadowTHardness);
                half node_3187 = 0.22;
                half4 _ShadowT_var = tex2D(_ShadowT,TRANSFORM_TEX(i.uv0, _ShadowT));
                half3 node_4285 = lerp(float3(node_949,node_949,node_949),lerp(node_338,float3(node_5738,node_5738,node_5738),smoothstep( node_6045, node_3187, (_ShowInAmbientLightShadowThreshold*_ShadowT_var.r) )),_ShadowTIntensity);
                float node_2346 = 1.0;
                float4 node_3149_k = float4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
                float4 node_3149_p = lerp(float4(float4(lightColor.rgb,0.0).zy, node_3149_k.wz), float4(float4(lightColor.rgb,0.0).yz, node_3149_k.xy), step(float4(lightColor.rgb,0.0).z, float4(lightColor.rgb,0.0).y));
                float4 node_3149_q = lerp(float4(node_3149_p.xyw, float4(lightColor.rgb,0.0).x), float4(float4(lightColor.rgb,0.0).x, node_3149_p.yzx), step(node_3149_p.x, float4(lightColor.rgb,0.0).x));
                float node_3149_d = node_3149_q.x - min(node_3149_q.w, node_3149_q.y);
                float node_3149_e = 1.0e-10;
                half3 node_3149 = float3(abs(node_3149_q.z + (node_3149_q.w - node_3149_q.y) / (6.0 * node_3149_d + node_3149_e)), node_3149_d / (node_3149_q.x + node_3149_e), node_3149_q.x);;
                half node_938 = saturate(node_3149.b);
                half3 node_1860 = ((_SelfShadowRealTimeShadowColor.rgb*_SelfShadowRealTimeShadowColorPower)*node_7102*node_9600*node_8910);
                half3 node_6588 = (_LightIntensity+lightColor.rgb);
                half3 node_2779 = (_HighlightColor.rgb*_HighlightColorPower+_PointSpotlightIntensity);
                float node_1533 = 0.0;
                float node_5992_ang = _GlossTextureRotate;
                float node_5992_spd = 1.0;
                float node_5992_cos = cos(node_5992_spd*node_5992_ang);
                float node_5992_sin = sin(node_5992_spd*node_5992_ang);
                float2 node_5992_piv = float2(0.5,0.5);
                half3 node_2832 = reflect(lerp(viewDirection,halfDirection,_GlossTextureFollowLight),normalDirection);
                half2 node_9280 = lerp( node_2832, mul( unity_WorldToObject, float4(node_2832,0) ).xyz.rgb, _GlossTextureFollowObjectRotation ).rg;
                half2 node_5992 = (mul(float2((-1*node_9280.r),node_9280.g)-node_5992_piv,float2x2( node_5992_cos, -node_5992_sin, node_5992_sin, node_5992_cos))+node_5992_piv);
                half2 node_8759 = (node_5992*0.5+0.5);
                half4 _GlossTexture_var = tex2Dlod(_GlossTexture,float4(TRANSFORM_TEX(node_8759, _GlossTexture),0.0,_GlossTextureSoftness));
                half4 _MaskGloss_var = tex2D(_MaskGloss,TRANSFORM_TEX(i.uv0, _MaskGloss));
                half3 node_2687 = N_F_GLO( lerp(node_2779,lerp(node_2779,(_GlossColor.rgb*_GlossColorPower),lerp(float3(node_1533,node_1533,node_1533),N_F_GLOT( _GlossTexture_var.r , smoothstep( 0.1, lerp(0.1,1.0,_GlossSoftness), pow(max(0,dot(halfDirection,normalDirection)),exp2(lerp(-2,15,_Glossiness))) ) ),_GlossIntensity)),_MaskGloss_var.r) , node_2779 );
                float node_4353 = 0.0;
                float node_3687 = 0.0;
                half3 node_4858 = lerp(float3(node_4353,node_4353,node_4353),(lerp( _RimLightColor.rgb, lerp(float3(node_3687,node_3687,node_3687),_RimLightColor.rgb,lightColor.rgb), _LightAffectRimLightColor )*_RimLightColorPower),smoothstep( 1.71, lerp(1.70,0.29,_RimLightSoftness), pow(1.0-max(0,dot(normalDirection, viewDirection)),(1.0 - _RimLightUnfill)) ));
                half3 node_2500 = (N_F_RL_1( lerp(node_2687,(node_2687+node_4858),_RimLightInLight) , node_2687 )*N_F_SON_1( lerp( 1.0, node_5206, _ShowNormal ) )*lightColor.rgb);
                half node_573 = 0.5*dot(lerp( N_F_CLD( lerp(lightDirection,lerp( _CustomLightDirection.rgb, mul( unity_ObjectToWorld, float4(_CustomLightDirection.rgb,0) ).xyz.rgb, _CustomLightDirectionFollowObjectRotation ),_CustomLightDirectionIntensity) , lightDirection ), viewDirection, _SelfShadowShadowTAtViewDirection ),node_3134)+0.5;
                half node_5573 = 1.0;
                half node_9545 = smoothstep( lerp(0.3,1.0,_SelfShadowHardness), 1.0, (node_573*lerp(7,lerp( _SelfShadowThreshold, (_SelfShadowThreshold*(1.0 - i.vertexColor.g)), _VertexColorGreenControlSelfShadowSize ),_SelfShadowThreshold)) );
                half3 node_2388 = (node_7946*lerp((lerp(node_1860,(node_1860+node_6588),_LightAffectShadow)*node_938*N_F_STIS( lerp(1,node_4285,_ShowInAmbientLightShadowIntensity) )),N_F_ST( lerp((lerp(node_338,(node_338+node_6588),_LightAffectShadow)*node_938),node_2500,lerp(node_949,smoothstep( node_6045, node_3187, ((_ShadowT_var.r*(1.0 - _ShadowTShadowThreshold))*(lerp( node_573, (lightfos*node_573), _LightFalloffAffectShadowT )*_ShadowTLightThreshold*0.01)) ),_ShadowTIntensity)) , node_2500 ),N_F_SS( lerp(node_5573,(lerp( node_9545, lerp(node_9545,node_5573,C_SS()), _SelfShadowAffectedByLightShadowStrength )*attenuation),_SelfShadowRealtimeShadowIntensity) , lerp(node_5573,attenuation,_SelfShadowRealtimeShadowIntensity) ))*lightfos);
                float3 node_9694 = Ref( viewReflectDirection , _ReflectionRoughtness );
                half2 node_8431 = reflect(viewDirection,normalDirection).rg;
                half2 node_4207 = (float2(node_8431.r,(-1*node_8431.g))*0.5+0.5);
                half4 _FReflection_var = tex2Dlod(_FReflection,float4(TRANSFORM_TEX(node_4207, _FReflection),0.0,_ReflectionRoughtness));
                half4 _MaskReflection_var = tex2D(_MaskReflection,TRANSFORM_TEX(i.uv0, _MaskReflection));
                half3 node_2704 = N_F_R( lerp(node_2388,lerp(node_2388,N_F_FR( lerp( node_9694, _FReflection_var.rgb, _UseFReflection ) , node_9694 ) * lerp(1,(9 * (node_7946 - (9 * 0.005) ) ) , _RefMetallic) ,_MaskReflection_var.r)*lightfos,_ReflectionIntensity) , node_2388 );
                half3 node_7395 = N_F_SL_1( lerp(node_2704,lerp(node_2704,node_7946,_MaskSelfLit_var.r),_SelfLitIntensity) , node_2704 );
                half3 node_1956 = ((node_7946*N_F_SL( lerp(node_81,lerp(node_81,((_SelfLitColor.rgb*node_7946*lerp( 1.0, node_7946, _SelfLitHighContrast ))*_SelfLitPower),_MaskSelfLit_var.r),_SelfLitIntensity) , node_81 )*N_F_STIAL( lerp(lerp(float3(node_8675,node_8675,node_8675),node_4285,_ShowInAmbientLightShadowIntensity),float3(node_2346,node_2346,node_2346),clamp((node_938*8.0),0,1)) ))+N_F_RL( lerp((node_7395+node_4858)*lightfos,node_7395,_RimLightInLight) , node_7395 ));
                float3 finalColor = N_F_CA( lerp(node_1956,dot(node_1956,float3(0.3,0.59,0.11)),(1.0 - _Saturation)) , node_1956 );
                fixed4 finalRGBA = fixed4(finalColor * 1,0);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "ShadowCaster"
            Tags {
                "LightMode"="ShadowCaster"
            }
            Offset 1, 1
            Cull [_DoubleSided]
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile_fog

			#pragma multi_compile_instancing

            #pragma only_renderers d3d9 d3d11 vulkan glcore gles3 metal xboxone ps4 wiiu switch 
            #pragma target 3.0

			#pragma shader_feature N_F_CO_ON

            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform fixed _EnableTextureTransparent;
            uniform half _Cutout;
            uniform fixed _UseSecondaryCutout;
            uniform sampler2D _SecondaryCutout; uniform float4 _SecondaryCutout_ST;
            uniform fixed _AlphaBaseCutout;

			uniform half _ReduceShadowPointLight;
			uniform half _ReduceShadowSpotDirectionalLight;

            half N_F_CO( half A , half B ){
            #ifdef N_F_CO_ON
            
            return A;
            
            #else
            
            return B;
            
            #endif
            }
            
            uniform fixed _TexturePatternStyle;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID (v);
                o.uv0 = v.texcoord0;
                
				#if defined(SHADOWS_CUBE)
					o.pos = UnityObjectToClipPos( v.vertex ); 
					o.pos.z *= (1.0 - _ReduceShadowPointLight * 0.01);
					#define S_C_F(i) return 0;
				#else

				o.pos = UnityObjectToClipPos( v.vertex.xyz );

				#if defined(SHADOWS_CUBE_IN_DEPTH_TEX)
					#if defined(UNITY_REVERSED_Z)
						o.pos.z += max(-1, min(unity_LightShadowBias.x / o.pos.w, 0)) * (_ReduceShadowSpotDirectionalLight * 0.1);
					#else
						o.pos.z += saturate(unity_LightShadowBias.x/o.pos.w)  * (_ReduceShadowSpotDirectionalLight * 0.1);
					#endif
				#endif

				#if defined(UNITY_REVERSED_Z)
					float clamped = min(o.pos.z, o.pos.w * UNITY_NEAR_CLIP_VALUE);
				#else
					float clamped = max(o.pos.z, o.pos.w * UNITY_NEAR_CLIP_VALUE);
				#endif

					o.pos.z = lerp(o.pos.z, clamped, unity_LightShadowBias.y);

					#define S_C_F(i) return 0;

				#endif

                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                half2 _TexturePatternStyle_var = lerp( i.uv0, 0, _TexturePatternStyle );
                half4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(_TexturePatternStyle_var, _MainTex));
                half4 _SecondaryCutout_var = tex2D(_SecondaryCutout,TRANSFORM_TEX(i.uv0, _SecondaryCutout));
                clip(N_F_CO( lerp( (lerp((_MainTex_var.r*_SecondaryCutout_var.r),_SecondaryCutout_var.r,_UseSecondaryCutout)+lerp(0.5,(-1.0),_Cutout)), 
				saturate(( (1.0 - _Cutout) > 0.5 ? (1.0-(1.0-2.0*((1.0 - _Cutout)-0.5))*(1.0-lerp((_MainTex_var.a*_SecondaryCutout_var.r),_SecondaryCutout_var.a,_UseSecondaryCutout))) : (2.0*(1.0 - _Cutout)*lerp((_MainTex_var.a*_SecondaryCutout_var.r),_SecondaryCutout_var.a,_UseSecondaryCutout)) )), _AlphaBaseCutout ) , lerp( 1.0, _MainTex_var.a, _EnableTextureTransparent ) ) - 0.5);
				S_C_F(i)
            }
            ENDCG
        }
    }
		CustomEditor "RealToonShaderGUI"
}