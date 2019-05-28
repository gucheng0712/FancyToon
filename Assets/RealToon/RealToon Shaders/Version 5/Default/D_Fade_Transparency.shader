//RealToon V5.0.3
//MJQStudioWorks
//2019

Shader "RealToon/Version 5/Default/Fade Transparency" {
    Properties {

		[Enum(Off,2,On,0)] _DoubleSided("Double Sided", int) = 2

        _MainTex ("Texture", 2D) = "white" {}
        [MaterialToggle] _TexturePatternStyle ("Texture Pattern Style", Float ) = 0
        [HDR] _MainColor ("Main Color", Color) = (0.7843137,0.7843137,0.7843137,1)

		[HDR] _HighlightColor ("Highlight Color", Color) = (1,1,1,1)
        _HighlightColorPower ("Highlight Color Power", Float ) = 1

        _Opacity ("Opacity", Range(0, 1)) = 1
		_TransparentThreshold ("Transparent Threshold", Float ) = 0
        _MaskTransparency ("Mask Transparency", 2D) = "black" {}

        _NormalMap ("Normal Map", 2D) = "bump" {}
        _NormalMapIntensity ("Normal Map Intensity", Float ) = 1

        _Saturation ("Saturation", Range(0, 2)) = 1

        _OutlineWidth ("Width", Float ) = 0.5
        _OutlineWidthControl ("Width Control", 2D) = "white" {}

		[Enum(Normal,0,Origin,1)] _OutlineExtrudeMethod("Outline Extrude Method", int) = 0

		_ReduceOutlineBackFace ("Reduce Outline Backface", Range(0, 1)) = 0

		_OutlineOffset ("Outline Offset", Vector) = (0,0,0)
		_OutlineZPostionInCamera ("Outline Z Position In Camera", Float) = 0

		[Enum(Off,1,On,0)] _DoubleSidedOutline("Double Sided Outline", int) = 1

        [HDR] _OutlineColor ("Color", Color) = (0,0,0,1)
        _NoisyOutlineIntensity ("Noisy Outline Intensity", Range(0, 1)) = 0
        [MaterialToggle] _DynamicNoisyOutline ("Dynamic Noisy Outline", Float ) = 0
        [MaterialToggle] _LightAffectOutlineColor ("Light Affect Outline Color", Float ) = 0

        [MaterialToggle] _OutlineWidthAffectedByViewDistance ("Outline Width Affected By View Distance", Float ) = 0
		_FarDistanceMaxWidth ("Far Distance Max Width", Float ) = 1

        [MaterialToggle] _VertexColorRedAffectOutlineWitdh ("Vertex Color Red Affect Outline Witdh", Float ) = 0

        _SelfLitIntensity ("Intensity", Range(0, 1)) = 0
        [HDR] _SelfLitColor ("Color", Color) = (1,1,1,1)
        _SelfLitPower ("Power", Float ) = 2
        [MaterialToggle] _SelfLitHighContrast ("High Contrast", Float ) = 1
        _MaskSelfLit ("Mask Self Lit", 2D) = "white" {}

        _GlossIntensity ("Intensity", Range(0, 1)) = 1
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

        _SelfShadowIntensity ("Self Shadow Intensity", Range(0, 1)) = 1
        _SelfShadowThreshold ("Threshold", Range(0, 1)) = 0.85
        [MaterialToggle] _VertexColorGreenControlSelfShadowThreshold ("Vertex Color Green Control Self Shadow Threshold", Float ) = 0
        _SelfShadowHardness ("Hardness", Range(0, 1)) = 1
        [HDR] _SelfShadowColor ("Color", Color) = (1,1,1,1)
        _SelfShadowColorPower ("Color Power", Float ) = 1
        [MaterialToggle] _SelfShadowAffectedByLightShadowStrength ("Self Shadow Affected By Light Shadow Strength", Float ) = 0

        _SmoothObjectNormal ("Smooth Object Normal", Range(0, 1)) = 0
        [MaterialToggle] _VertexColorBlueControlSmoothObjectNormal ("Vertex Color Blue Control Smooth Object Normal", Float ) = 0
        _XYZPosition ("XYZ Position", Vector) = (0,0,0,0)
        _XYZHardness ("XYZ Hardness", Float ) = 14
        [MaterialToggle] _ShowNormal ("Show Normal", Float ) = 0

        _ShadowColorTexture ("Shadow Color Texture", 2D) = "white" {}
        _ShadowColorTexturePower ("Shadow Color Texture (Power)", Float ) = 0

        _ShadowTIntensity ("Intensity", Range(0, 1)) = 1
        _ShadowT ("ShadowT", 2D) = "white" {}
        _ShadowTLightThreshold ("Light Threshold", Float ) = 50
        _ShadowTShadowThreshold ("Shadow Threshold", Float ) = 0
        [HDR] _ShadowTColor ("Color", Color) = (1,1,1,1)
        _ShadowTColorPower ("Color Power", Float ) = 1
        _ShadowTHardness ("Hardness", Range(0, 1)) = 1

		[Toggle(N_F_STIS_ON)] _N_F_STIS ("Show In Shadow", Float ) = 0
		[Toggle(N_F_STIAL_ON)] _N_F_STIAL ("Show In Ambient Light", Float ) = 0

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
		[Toggle(N_F_O_ON)] _N_F_O ("Outline", Float ) = 0
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
		[Toggle(N_F_R_ON)] _N_F_R ("Reflection", Float ) = 0
		[Toggle(N_F_FR_ON)] _N_F_FR ("FReflection", Float ) = 0
		[Toggle(N_F_RL_ON)] _N_F_RL ("Rim Light", Float ) = 0
		[Enum(On,1,Off,0)] _ZWrite("ZWrite", int) = 1

		[Toggle(N_F_HCS_ON)] _N_F_HCS ("Hide Cast Shadow", Float ) = 0

		[Toggle(N_F_NLASOBF_ON)] _N_F_NLASOBF ("No Light On BackFace", Float ) = 0

    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
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
            uniform sampler2D _MaskTransparency; uniform float4 _MaskTransparency_ST;
            uniform half _Opacity;
            uniform fixed _TexturePatternStyle;
            uniform half _OutlineWidth;
            uniform half4 _OutlineColor;
            uniform fixed _LightAffectOutlineColor;
            uniform fixed _VertexColorRedAffectOutlineWitdh;
            uniform sampler2D _OutlineWidthControl; uniform float4 _OutlineWidthControl_ST;
            uniform fixed _OutlineWidthAffectedByViewDistance;
            uniform fixed _DynamicNoisyOutline;
            uniform half _NoisyOutlineIntensity;
			uniform half _ReduceOutlineBackFace;
			uniform half3 _OutlineOffset;
			uniform float3 _OEM;
            uniform int _OutlineExtrudeMethod;
			uniform half _OutlineZPostionInCamera;
			uniform half _FarDistanceMaxWidth;

			uniform half _TransparentThreshold;

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
				float4 posWorld : TEXCOORD4;
                float3 normalDir : TEXCOORD3;
                float4 vertexColor : COLOR;
                float4 projPos : TEXCOORD1;
                UNITY_FOG_COORDS(2)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;

				UNITY_SETUP_INSTANCE_ID (v);

                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;

				o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);

                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );
                float3 lightColor = _LightColor0.rgb;
                half _VertexColorRedAffectOutlineWitdh_var = lerp( _OutlineWidth, (_OutlineWidth*(1.0 - o.vertexColor.r)), _VertexColorRedAffectOutlineWitdh );
                half node_1229 = distance(objPos.rgb,_WorldSpaceCameraPos);
                half4 _OutlineWidthControl_var = tex2Dlod(_OutlineWidthControl,float4(TRANSFORM_TEX(o.uv0, _OutlineWidthControl),0.0,0));
                float4 node_427 = _Time;
                float node_4658_ang = node_427.g;
                float node_4658_spd = 0.002;
                float node_4658_cos = cos(node_4658_spd*node_4658_ang);
                float node_4658_sin = sin(node_4658_spd*node_4658_ang);
                float2 node_4658_piv = float2(0.5,0.5);
                half2 node_4658 = (mul(o.uv0-node_4658_piv,float2x2( node_4658_cos, -node_4658_sin, node_4658_sin, node_4658_cos))+node_4658_piv);
                half2 _DynamicNoisyOutline_var = lerp( o.uv0, node_4658, _DynamicNoisyOutline );
                float2 node_9863_skew = _DynamicNoisyOutline_var + 0.2127+_DynamicNoisyOutline_var.x*0.3713*_DynamicNoisyOutline_var.y;
                float2 node_9863_rnd = 4.789*sin(489.123*(node_9863_skew));
                half node_9863 = frac(node_9863_rnd.x*node_9863_rnd.y*(1+node_9863_skew.x));

				_OEM = lerp(v.normal,normalize(v.vertex),_OutlineExtrudeMethod);

                o.pos = UnityObjectToClipPos( float4((v.vertex.xyz + _OutlineOffset.xyz * 0.01) + _OEM*((lerp( _VertexColorRedAffectOutlineWitdh_var, ( clamp(_VertexColorRedAffectOutlineWitdh_var*node_1229, _VertexColorRedAffectOutlineWitdh_var, _FarDistanceMaxWidth) ), _OutlineWidthAffectedByViewDistance )*0.01)*_OutlineWidthControl_var.r*lerp(1.0,node_9863,_NoisyOutlineIntensity)),1) );
                
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

				i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
				float3 normalDirection = i.normalDir;

                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );
                float2 sceneUVs = (i.projPos.xy / i.projPos.w);
                half node_1229 = distance(objPos.rgb,_WorldSpaceCameraPos);
                half2 node_9146 = (float2((sceneUVs.x * 2 - 1)*(_ScreenParams.r/_ScreenParams.g), sceneUVs.y * 2 - 1).rg*node_1229);
                half2 _TexturePatternStyle_var = lerp( i.uv0, node_9146, _TexturePatternStyle );
                half4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(_TexturePatternStyle_var, _MainTex));
                half4 _MaskTransparency_var = tex2D(_MaskTransparency,TRANSFORM_TEX(i.uv0, _MaskTransparency));

                half node_7861 = lerp(( smoothstep(clamp(-20,1,_TransparentThreshold),1,_MainTex_var.a) *_MaskTransparency_var.r), smoothstep(clamp(-20,1,_TransparentThreshold) , 1, _MainTex_var.a) ,_Opacity);

                clip(saturate(( 0.74 > 0.5 ? (1.0-(1.0-2.0*(0.74-0.5))*(1.0-node_7861)) : (2.0*0.74*node_7861) )) - 0.5);
                
				float oc = (1.0-dot(normalDirection, viewDirection));
                clip(smoothstep( lerp(4,1.7,_ReduceOutlineBackFace), 0, oc ) - 0.5);
				
				float3 lightColor = _LightColor0.rgb;
                float node_3413 = 0.0;

                fixed4 finalRGBA = fixed4(lerp( _OutlineColor.rgb, lerp(float3(node_3413,node_3413,node_3413),_OutlineColor.rgb,_LightColor0.rgb), _LightAffectOutlineColor ),0);
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
            Blend SrcAlpha OneMinusSrcAlpha
            ZWrite [_ZWrite]

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
            #include "Lighting.cginc"
            #pragma multi_compile_fwdbase
            #pragma multi_compile_fog

			#pragma multi_compile_instancing

            #pragma only_renderers d3d9 d3d11 vulkan glcore gles3 metal xboxone ps4 wiiu switch
            #pragma target 3.0

			#pragma shader_feature N_F_NM_ON
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
			#pragma shader_feature N_F_NLASOBF_ON

            uniform half _SelfShadowHardness;
            uniform half _SelfShadowThreshold;
            uniform half4 _HighlightColor;
            uniform half4 _SelfShadowColor;
            uniform half _SelfShadowColorPower;
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
            uniform half _LightIntensity;
            uniform fixed _LightAffectShadow;
            uniform sampler2D _MaskTransparency; uniform float4 _MaskTransparency_ST;
            uniform half _Opacity;
            uniform fixed _TexturePatternStyle;
            half3 N_F_FR( half3 A , half3 B ){
            #ifdef N_F_FR_ON
            
            return A;
            
            #else
            
            return B;
            
            #endif
            }
            
            uniform half _Saturation;
            half3 N_F_CA( half3 A , half3 B ){
            #ifdef N_F_CA_ON
            
            return A;
            
            #else
            
            return B;
            
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
            
            uniform half _ShowInAmbientLightShadowIntensity;
            uniform half _EnvironmentalLightingIntensity;
            uniform half _ShadowTIntensity;
            uniform half _ShowInAmbientLightShadowThreshold;
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
            
            uniform half _SelfShadowIntensity;
            uniform fixed _SelfShadowAffectedByLightShadowStrength;
            fixed C_SS(){
            return _LightShadowData.x;
            }
            
            uniform half _GlossIntensity;
			uniform half _RefMetallic;

			uniform half _TransparentThreshold;

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
                UNITY_FOG_COORDS(6)
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
                half4 _MaskTransparency_var = tex2D(_MaskTransparency,TRANSFORM_TEX(i.uv0, _MaskTransparency));

                half node_7861 = lerp(( smoothstep(clamp(-20,1,_TransparentThreshold),1,_MainTex_var.a) *_MaskTransparency_var.r), smoothstep(clamp(-20,1,_TransparentThreshold) , 1, _MainTex_var.a) ,_Opacity);

                clip(saturate(( 0.74 > 0.5 ? (1.0-(1.0-2.0*(0.74-0.5))*(1.0-node_7861)) : (2.0*0.74*node_7861) )) - 0.5);
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);

                #ifdef N_F_NLASOBF_ON
					float3 lightColor = lerp(0,_LightColor0.rgb,isFrontFace);
				#else
					float3 lightColor = _LightColor0.rgb;
				#endif

                float3 halfDirection = normalize(viewDirection+lightDirection);
                float attenuation = 1;
                half3 node_7946 = (_MainTex_var.rgb*_MainColor.rgb);
                float node_3622 = 0.0;
				float node_491 = 1.0;
                float3 node_76 = mul( unity_WorldToObject, float4((i.posWorld.rgb-objPos.rgb),0) ).xyz.rgb.rgb;
                half3 node_5206 = lerp(normalDirection,mul( unity_ObjectToWorld, float4(float3((_XYZPosition.r+(_XYZHardness*node_76.r)),(_XYZPosition.g+(_XYZHardness*node_76.g)),(_XYZPosition.b+(_XYZHardness*node_76.b))),0) ).xyz.rgb,lerp( _SmoothObjectNormal, (_SmoothObjectNormal*(1.0 - i.vertexColor.b)), _VertexColorBlueControlSmoothObjectNormal ));
                half3 node_3134 = N_F_SON( node_5206 , normalDirection );
                float node_2183 = 0;
                float node_8383 = 0.01;
                half3 node_9546 = (AL_GI( lerp(float3(node_3622,node_3622,node_3622),float3(node_491,node_491,node_491),lerp( (node_3134*_GIShadeThreshold), float3(smoothstep( float2(node_2183,node_2183), float2(node_8383,node_8383), (node_3134.rb*_GIShadeThreshold) ),0.0), _GIFlatShade )) )*_EnvironmentalLightingIntensity);
                half4 _MaskSelfLit_var = tex2D(_MaskSelfLit,TRANSFORM_TEX(i.uv0, _MaskSelfLit));
                float node_3456 = 1.0;
                half node_4736 = 1.0;
                half4 _ShadowColorTexture_var = tex2D(_ShadowColorTexture,TRANSFORM_TEX(i.uv0, _ShadowColorTexture));
                half3 node_9600 = N_F_SCT( lerp(_ShadowColorTexture_var.rgb,(_ShadowColorTexture_var.rgb*_ShadowColorTexture_var.rgb),_ShadowColorTexturePower) );
                half4 _PTexture_var = tex2D(_PTexture,TRANSFORM_TEX(node_9146, _PTexture));
                half node_8910 = N_F_PT( lerp((1.0 - _PTexturePower),1.0,_PTexture_var.r) );
                half3 node_7102 = (_OverallShadowColor.rgb*_OverallShadowColorPower);
                half3 node_338 = ((_ShadowTColor.rgb*_ShadowTColorPower)*node_9600*node_8910*node_7102);
                float node_7121 = 1.0;
                float node_6045 = lerp(0.0,0.22,_ShadowTHardness);
                float node_3187 = 0.22;
                half4 _ShadowT_var = tex2D(_ShadowT,TRANSFORM_TEX(i.uv0, _ShadowT));
                float3 node_5343 = lerp(float3(node_4736,node_4736,node_4736),lerp(node_338,float3(node_7121,node_7121,node_7121),smoothstep( node_6045, node_3187, (_ShowInAmbientLightShadowThreshold*_ShadowT_var.r) )),_ShadowTIntensity);
                float node_4824 = 1.0;
                float4 node_6613_k = float4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
                float4 node_6613_p = lerp(float4(float4(lightColor.rgb,0.0).zy, node_6613_k.wz), float4(float4(lightColor.rgb,0.0).yz, node_6613_k.xy), step(float4(lightColor.rgb,0.0).z, float4(lightColor.rgb,0.0).y));
                float4 node_6613_q = lerp(float4(node_6613_p.xyw, float4(lightColor.rgb,0.0).x), float4(float4(lightColor.rgb,0.0).x, node_6613_p.yzx), step(node_6613_p.x, float4(lightColor.rgb,0.0).x));
                float node_6613_d = node_6613_q.x - min(node_6613_q.w, node_6613_q.y);
                float node_6613_e = 1.0e-10;
                half3 node_6613 = float3(abs(node_6613_q.z + (node_6613_q.w - node_6613_q.y) / (6.0 * node_6613_d + node_6613_e)), node_6613_d / (node_6613_q.x + node_6613_e), node_6613_q.x);;
                half node_938 = saturate(node_6613.b);
                half3 node_1860 = ((_SelfShadowColor.rgb*_SelfShadowColorPower)*node_7102*node_9600*node_8910);
                half3 node_6694 = (_LightIntensity+lightColor.rgb);
                half3 node_2779 = (_HighlightColor.rgb*_HighlightColorPower+_DirectionalLightIntensity);
                float node_49 = 0.0;
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
                half3 node_2687 = N_F_GLO( lerp(node_2779,lerp(node_2779,(_GlossColor.rgb*_GlossColorPower),lerp(float3(node_49,node_49,node_49),N_F_GLOT( _GlossTexture_var.r , smoothstep( 0.1, lerp(0.1,1.0,_GlossSoftness), pow(max(0,dot(halfDirection,normalDirection)),exp2(lerp(-2,15,_Glossiness))) ) ),_GlossIntensity)),_MaskGloss_var.r) , node_2779 );
                float node_4353 = 0.0;
                float node_3687 = 0.0;
                half3 node_4858 = lerp(float3(node_4353,node_4353,node_4353),(lerp( _RimLightColor.rgb, lerp(float3(node_3687,node_3687,node_3687),_RimLightColor.rgb,lightColor.rgb), _LightAffectRimLightColor )*_RimLightColorPower),smoothstep( 1.71, lerp(1.70,0.29,_RimLightSoftness), pow(1.0-max(0,dot(normalDirection, viewDirection)),(1.0 - _RimLightUnfill)) ));
                half3 node_2500 = (N_F_RL_1( lerp(node_2687,(node_2687+node_4858),_RimLightInLight) , node_2687 )*N_F_SON_1( lerp( 1.0, node_5206, _ShowNormal ) )*lightColor.rgb);
                half node_573 = 0.5*dot(lerp( N_F_CLD( lerp(lightDirection,lerp( _CustomLightDirection.rgb, mul( unity_ObjectToWorld, float4(_CustomLightDirection.rgb,0) ).xyz.rgb, _CustomLightDirectionFollowObjectRotation ),_CustomLightDirectionIntensity) , lightDirection ), viewDirection, _SelfShadowShadowTAtViewDirection ),node_3134)+0.5;
                half node_5901 = 1.0;
                half node_9545 = smoothstep( lerp(0.3,1.0,_SelfShadowHardness), 1.0, (node_573*lerp(7,lerp( _SelfShadowThreshold, (_SelfShadowThreshold*(1.0 - i.vertexColor.g)), _VertexColorGreenControlSelfShadowSize ),_SelfShadowThreshold)) );
                
				half3 node_2388 = (node_7946*lerp((lerp(node_1860,(node_1860+node_6694),_LightAffectShadow)*node_938*N_F_STIS( lerp(1,node_5343,_ShowInAmbientLightShadowIntensity) )),N_F_ST( lerp((lerp(node_338,(node_338+node_6694),_LightAffectShadow)*node_938),node_2500,lerp(node_4736,smoothstep( node_6045, node_3187, ((_ShadowT_var.r*(1.0 - _ShadowTShadowThreshold))*(lerp( node_573, (attenuation*node_573), _LightFalloffAffectShadowT )*_ShadowTLightThreshold*0.01)) ),_ShadowTIntensity)) , node_2500 ),N_F_SS( lerp(node_5901,(lerp( node_9545, lerp(node_9545,node_5901,C_SS()), _SelfShadowAffectedByLightShadowStrength )*attenuation),_SelfShadowIntensity) , lerp(node_5901,attenuation,_SelfShadowIntensity) )));
                
				float3 node_9694 = Ref( viewReflectDirection , _ReflectionRoughtness );
                half2 node_8431 = reflect(viewDirection,normalDirection).rg;
                half2 node_4207 = (float2(node_8431.r,(-1*node_8431.g))*0.5+0.5);
                half4 _FReflection_var = tex2Dlod(_FReflection,float4(TRANSFORM_TEX(node_4207, _FReflection),0.0,_ReflectionRoughtness));
                half4 _MaskReflection_var = tex2D(_MaskReflection,TRANSFORM_TEX(i.uv0, _MaskReflection));
                half3 node_2704 = N_F_R( lerp(node_2388,lerp(node_2388,N_F_FR( lerp( node_9694, _FReflection_var.rgb, _UseFReflection ) , node_9694 ) * lerp(1,(9 * (node_7946 - (9 * 0.005) ) ) , _RefMetallic) ,_MaskReflection_var.r),_ReflectionIntensity) , node_2388 );
                half3 node_7395 = N_F_SL_1( lerp(node_2704,lerp(node_2704,node_7946,_MaskSelfLit_var.r),_SelfLitIntensity) , node_2704 );
                half3 node_5922 = ((node_7946*N_F_SL( lerp(node_9546,lerp(node_9546,((_SelfLitColor.rgb*node_7946*lerp( 1.0, node_7946, _SelfLitHighContrast ))*_SelfLitPower),_MaskSelfLit_var.r),_SelfLitIntensity) , node_9546 )*N_F_STIAL( lerp(lerp(float3(node_3456,node_3456,node_3456),node_5343,_ShowInAmbientLightShadowIntensity),float3(node_4824,node_4824,node_4824),clamp((node_938*8.0),0,1)) ))+N_F_RL( lerp((node_7395+node_4858),node_7395,_RimLightInLight) , node_7395 ));
                float3 finalColor = N_F_CA( lerp(node_5922,dot(node_5922,float3(0.3,0.59,0.11)),(1.0 - _Saturation)) , node_5922 );
                fixed4 finalRGBA = fixed4(finalColor,node_7861);
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
			Cull [_DoubleSided]
            BlendOp Max
            ZWrite [_ZWrite]
            
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
            #pragma multi_compile_fwdadd
            #pragma multi_compile_fog
			#pragma multi_compile_instancing

            #pragma only_renderers d3d9 d3d11 vulkan glcore gles3 metal xboxone ps4 wiiu switch
            #pragma target 3.0

			#pragma shader_feature N_F_NM_ON
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
			#pragma shader_feature N_F_NLASOBF_ON

            uniform half _SelfShadowHardness;
            uniform half _SelfShadowThreshold;
            uniform half4 _HighlightColor;
            uniform half4 _SelfShadowColor;
            uniform half _SelfShadowColorPower;
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
            uniform half _LightIntensity;
            uniform fixed _LightAffectShadow;
            uniform sampler2D _MaskTransparency; uniform float4 _MaskTransparency_ST;
            uniform half _Opacity;
            uniform fixed _TexturePatternStyle;
            half3 N_F_FR( half3 A , half3 B ){
            #ifdef N_F_FR_ON
            
            return A;
            
            #else
            
            return B;
            
            #endif
            }
            
            uniform half _Saturation;
            half3 N_F_CA( half3 A , half3 B ){
            #ifdef N_F_CA_ON
            
            return A;
            
            #else
            
            return B;
            
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
            
            uniform half _ShowInAmbientLightShadowIntensity;
            uniform half _EnvironmentalLightingIntensity;
            uniform half _ShadowTIntensity;
            uniform half _ShowInAmbientLightShadowThreshold;
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
            
            uniform half _SelfShadowIntensity;
            uniform fixed _SelfShadowAffectedByLightShadowStrength;

			uniform half _PointSpotlightIntensity;
			uniform half _LightFalloffSoftness;

            fixed C_SS(){
            return _LightShadowData.x;
            }
            
            uniform half _GlossIntensity;
			uniform half _RefMetallic;

			uniform half _TransparentThreshold;

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
                half4 _MaskTransparency_var = tex2D(_MaskTransparency,TRANSFORM_TEX(i.uv0, _MaskTransparency));

                half node_7861 = lerp(( smoothstep(clamp(-20,1,_TransparentThreshold),1,_MainTex_var.a) *_MaskTransparency_var.r), smoothstep(clamp(-20,1,_TransparentThreshold) , 1, _MainTex_var.a) ,_Opacity);

                clip(saturate(( 0.74 > 0.5 ? (1.0-(1.0-2.0*(0.74-0.5))*(1.0-node_7861)) : (2.0*0.74*node_7861) )) - 0.5);
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
				fixed attenuation = 1; 
				fixed lightfos = smoothstep(0, _LightFalloffSoftness ,lightfo);

                half3 node_7946 = (_MainTex_var.rgb*_MainColor.rgb);
                float node_3622 = 0.0;
				float node_491 = 1.0;
                float3 node_76 = mul( unity_WorldToObject, float4((i.posWorld.rgb-objPos.rgb),0) ).xyz.rgb.rgb;
                half3 node_5206 = lerp(normalDirection,mul( unity_ObjectToWorld, float4(float3((_XYZPosition.r+(_XYZHardness*node_76.r)),(_XYZPosition.g+(_XYZHardness*node_76.g)),(_XYZPosition.b+(_XYZHardness*node_76.b))),0) ).xyz.rgb,lerp( _SmoothObjectNormal, (_SmoothObjectNormal*(1.0 - i.vertexColor.b)), _VertexColorBlueControlSmoothObjectNormal ));
                half3 node_3134 = N_F_SON( node_5206 , normalDirection );
                float node_2183 = 0;
                float node_8383 = 0.01;
                half3 node_9546 = (AL_GI( lerp(float3(node_3622,node_3622,node_3622),float3(node_491,node_491,node_491),lerp( (node_3134*_GIShadeThreshold), float3(smoothstep( float2(node_2183,node_2183), float2(node_8383,node_8383), (node_3134.rb*_GIShadeThreshold) ),0.0), _GIFlatShade )) )*_EnvironmentalLightingIntensity);
                half4 _MaskSelfLit_var = tex2D(_MaskSelfLit,TRANSFORM_TEX(i.uv0, _MaskSelfLit));
                float node_3456 = 1.0;
                half node_4736 = 1.0;
                half4 _ShadowColorTexture_var = tex2D(_ShadowColorTexture,TRANSFORM_TEX(i.uv0, _ShadowColorTexture));
                half3 node_9600 = N_F_SCT( lerp(_ShadowColorTexture_var.rgb,(_ShadowColorTexture_var.rgb*_ShadowColorTexture_var.rgb),_ShadowColorTexturePower) );
                half4 _PTexture_var = tex2D(_PTexture,TRANSFORM_TEX(node_9146, _PTexture));
                half node_8910 = N_F_PT( lerp((1.0 - _PTexturePower),1.0,_PTexture_var.r) );
                half3 node_7102 = (_OverallShadowColor.rgb*_OverallShadowColorPower);
                half3 node_338 = ((_ShadowTColor.rgb*_ShadowTColorPower)*node_9600*node_8910*node_7102);
                float node_7121 = 1.0;
                float node_6045 = lerp(0.0,0.22,_ShadowTHardness);
                float node_3187 = 0.22;
                half4 _ShadowT_var = tex2D(_ShadowT,TRANSFORM_TEX(i.uv0, _ShadowT));
                float3 node_5343 = lerp(float3(node_4736,node_4736,node_4736),lerp(node_338,float3(node_7121,node_7121,node_7121),smoothstep( node_6045, node_3187, (_ShowInAmbientLightShadowThreshold*_ShadowT_var.r) )),_ShadowTIntensity);
                float node_4824 = 1.0;
                float4 node_6613_k = float4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
                float4 node_6613_p = lerp(float4(float4(lightColor.rgb,0.0).zy, node_6613_k.wz), float4(float4(lightColor.rgb,0.0).yz, node_6613_k.xy), step(float4(lightColor.rgb,0.0).z, float4(lightColor.rgb,0.0).y));
                float4 node_6613_q = lerp(float4(node_6613_p.xyw, float4(lightColor.rgb,0.0).x), float4(float4(lightColor.rgb,0.0).x, node_6613_p.yzx), step(node_6613_p.x, float4(lightColor.rgb,0.0).x));
                float node_6613_d = node_6613_q.x - min(node_6613_q.w, node_6613_q.y);
                float node_6613_e = 1.0e-10;
                half3 node_6613 = float3(abs(node_6613_q.z + (node_6613_q.w - node_6613_q.y) / (6.0 * node_6613_d + node_6613_e)), node_6613_d / (node_6613_q.x + node_6613_e), node_6613_q.x);;
                half node_938 = saturate(node_6613.b);
                half3 node_1860 = ((_SelfShadowColor.rgb*_SelfShadowColorPower)*node_7102*node_9600*node_8910);
                half3 node_6694 = (_LightIntensity+lightColor.rgb);
                half3 node_2779 = (_HighlightColor.rgb*_HighlightColorPower+_PointSpotlightIntensity);
                float node_49 = 0.0;
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
                half3 node_2687 = N_F_GLO( lerp(node_2779,lerp(node_2779,(_GlossColor.rgb*_GlossColorPower),lerp(float3(node_49,node_49,node_49),N_F_GLOT( _GlossTexture_var.r , smoothstep( 0.1, lerp(0.1,1.0,_GlossSoftness), pow(max(0,dot(halfDirection,normalDirection)),exp2(lerp(-2,15,_Glossiness))) ) ),_GlossIntensity)),_MaskGloss_var.r) , node_2779 );
                float node_4353 = 0.0;
                float node_3687 = 0.0;
                half3 node_4858 = lerp(float3(node_4353,node_4353,node_4353),(lerp( _RimLightColor.rgb, lerp(float3(node_3687,node_3687,node_3687),_RimLightColor.rgb,lightColor.rgb), _LightAffectRimLightColor )*_RimLightColorPower),smoothstep( 1.71, lerp(1.70,0.29,_RimLightSoftness), pow(1.0-max(0,dot(normalDirection, viewDirection)),(1.0 - _RimLightUnfill)) ));
                half3 node_2500 = (N_F_RL_1( lerp(node_2687,(node_2687+node_4858),_RimLightInLight) , node_2687 )*N_F_SON_1( lerp( 1.0, node_5206, _ShowNormal ) )*lightColor.rgb);
                half node_573 = 0.5*dot(lerp( N_F_CLD( lerp(lightDirection,lerp( _CustomLightDirection.rgb, mul( unity_ObjectToWorld, float4(_CustomLightDirection.rgb,0) ).xyz.rgb, _CustomLightDirectionFollowObjectRotation ),_CustomLightDirectionIntensity) , lightDirection ), viewDirection, _SelfShadowShadowTAtViewDirection ),node_3134)+0.5;
                half node_5901 = 1.0;
                half node_9545 = smoothstep( lerp(0.3,1.0,_SelfShadowHardness), 1.0, (node_573*lerp(7,lerp( _SelfShadowThreshold, (_SelfShadowThreshold*(1.0 - i.vertexColor.g)), _VertexColorGreenControlSelfShadowSize ),_SelfShadowThreshold)) );
                
				half3 node_2388 = (node_7946*lerp((lerp(node_1860,(node_1860+node_6694),_LightAffectShadow)*node_938*N_F_STIS( lerp(1,node_5343,_ShowInAmbientLightShadowIntensity) )),N_F_ST( lerp((lerp(node_338,(node_338+node_6694),_LightAffectShadow)*node_938),node_2500,lerp(node_4736,smoothstep( node_6045, node_3187, ((_ShadowT_var.r*(1.0 - _ShadowTShadowThreshold))*(lerp( node_573, (lightfos*node_573), _LightFalloffAffectShadowT )*_ShadowTLightThreshold*0.01)) ),_ShadowTIntensity)) , node_2500 ),N_F_SS( lerp(node_5901,(lerp( node_9545, lerp(node_9545,node_5901,C_SS()), _SelfShadowAffectedByLightShadowStrength )*attenuation),_SelfShadowIntensity) , lerp(node_5901,attenuation,_SelfShadowIntensity) ))*lightfos);
                
				float3 node_9694 = Ref( viewReflectDirection , _ReflectionRoughtness );
                half2 node_8431 = reflect(viewDirection,normalDirection).rg;
                half2 node_4207 = (float2(node_8431.r,(-1*node_8431.g))*0.5+0.5);
                half4 _FReflection_var = tex2Dlod(_FReflection,float4(TRANSFORM_TEX(node_4207, _FReflection),0.0,_ReflectionRoughtness));
                half4 _MaskReflection_var = tex2D(_MaskReflection,TRANSFORM_TEX(i.uv0, _MaskReflection));
                half3 node_2704 = N_F_R( lerp(node_2388,lerp(node_2388,N_F_FR( lerp( node_9694, _FReflection_var.rgb, _UseFReflection ) , node_9694 ) * lerp(1,(9 * (node_7946 - (9 * 0.005) ) ) , _RefMetallic) ,_MaskReflection_var.r)*lightfos,_ReflectionIntensity) , node_2388 );
                half3 node_7395 = N_F_SL_1( lerp(node_2704,lerp(node_2704,node_7946,_MaskSelfLit_var.r),_SelfLitIntensity) , node_2704 );
                half3 node_5922 = ((node_7946*N_F_SL( lerp(node_9546,lerp(node_9546,((_SelfLitColor.rgb*node_7946*lerp( 1.0, node_7946, _SelfLitHighContrast ))*_SelfLitPower),_MaskSelfLit_var.r),_SelfLitIntensity) , node_9546 )*N_F_STIAL( lerp(lerp(float3(node_3456,node_3456,node_3456),node_5343,_ShowInAmbientLightShadowIntensity),float3(node_4824,node_4824,node_4824),clamp((node_938*8.0),0,1)) ))+N_F_RL( lerp((node_7395+node_4858)*lightfos,node_7395,_RimLightInLight) , node_7395 ));
                float3 finalColor = N_F_CA( lerp(node_5922,dot(node_5922,float3(0.3,0.59,0.11)),(1.0 - _Saturation)) , node_5922 );
                fixed4 finalRGBA = fixed4(finalColor * node_7861,0);
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

			#pragma shader_feature N_F_HCS_ON

            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform sampler2D _MaskTransparency; uniform float4 _MaskTransparency_ST;
            uniform half _Opacity;
            uniform fixed _TexturePatternStyle;

			uniform half _TransparentThreshold;

			uniform sampler3D _DitherMaskLOD;

            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
                float4 projPos : TEXCOORD2;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID (v);
                o.uv0 = v.texcoord0;
                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );
                o.pos = UnityObjectToClipPos( v.vertex );
                o.projPos = ComputeScreenPos (o.pos);
                COMPUTE_EYEDEPTH(o.projPos.z);
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );
                float2 sceneUVs = (i.projPos.xy / i.projPos.w);
                half node_1229 = distance(objPos.rgb,_WorldSpaceCameraPos);
                half2 node_9146 = (float2((sceneUVs.x * 2 - 1)*(_ScreenParams.r/_ScreenParams.g), sceneUVs.y * 2 - 1).rg*node_1229);
                half2 _TexturePatternStyle_var = lerp( i.uv0, node_9146, _TexturePatternStyle );
                half4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(_TexturePatternStyle_var, _MainTex));
                half4 _MaskTransparency_var = tex2D(_MaskTransparency,TRANSFORM_TEX(i.uv0, _MaskTransparency));

                half node_7861 = lerp(( smoothstep(clamp(-20,1,_TransparentThreshold),1,_MainTex_var.a) *_MaskTransparency_var.r), smoothstep(clamp(-20,1,_TransparentThreshold) , 1, _MainTex_var.a) ,_Opacity);

				float dither = tex3D(_DitherMaskLOD, float3(i.pos.xy * 0.25, node_7861 * 0.99)).a;

				#ifdef N_F_HCS_ON
					clip(-1);
				#else
					clip(saturate(( 0.74 > 0.5 ? (1.0-(1.0-2.0*(0.74-0.5))*(1.0-dither)) : (2.0*0.74*dither) )) - 0.5);
				#endif

                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
		CustomEditor "RealToonShaderGUI"
}