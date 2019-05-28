//RealToon V5.0.3
//MJQStudioWorks
//2019

Shader "RealToon/Version 5/Lite/Default" {
    Properties {

		[Enum(Off,2,On,0)] _DoubleSided("Double Sided", int) = 2

        _MainTex ("Texture", 2D) = "white" {}
        [HDR] _MainColor ("Main Color", Color) = (0.7843137,0.7843137,0.7843137,1)

		[HDR] _HighlightColor ("Highlight Color", Color) = (1,1,1,1)
        _HighlightColorPower ("Highlight Color Power", Float ) = 1

        [MaterialToggle] _EnableTextureTransparent ("Enable Texture Transparent", Float ) = 0

        _NormalMap ("Normal Map", 2D) = "bump" {}
        _NormalMapIntensity ("Intensity", Float ) = 1

        _OutlineWidth ("Width", Float ) = 0.5
        _OutlineWidthControl ("Width Control", 2D) = "white" {}

		[Enum(Normal,0,Origin,1)] _OutlineExtrudeMethod("Outline Extrude Method", int) = 0

		_OutlineOffset ("Outline Offset", Vector) = (0,0,0)
		_OutlineZPostionInCamera ("Outline Z Position In Camera", Float) = 0

		[Enum(Off,1,On,0)] _DoubleSidedOutline("Double Sided Outline", int) = 1

        [MaterialToggle] _OutlineWidthAffectedByViewDistance ("Outline Width Affected By View Distance", Float ) = 0
		_FarDistanceMaxWidth ("Far Distance Max Width", Float ) = 10

        [MaterialToggle] _VertexColorRedAffectOutlineWitdh ("Vertex Color Red Affect Outline Witdh", Float ) = 0
        [HDR] _OutlineColor ("Color", Color) = (0,0,0,1)
        [MaterialToggle] _LightAffectOutlineColor ("Light Affect Outline Color", Float ) = 0

        _SelfLitIntensity ("Intensity", Range(0, 1)) = 0
        [HDR] _SelfLitColor ("Color", Color) = (1,1,1,1)
        _SelfLitPower ("Power", Float ) = 2
        [MaterialToggle] _SelfLitHighContrast ("High Contrast", Float ) = 1
        _MaskSelfLit ("Mask Self Lit", 2D) = "white" {}

        _Glossiness ("Glossiness", Range(0, 1)) = 0.6
        _GlossSoftness ("Softness", Range(0, 1)) = 0
        [HDR] _GlossColor ("Color", Color) = (1,1,1,1)
        _GlossColorPower ("Color Power", Float ) = 10
        _MaskGloss ("Mask Gloss", 2D) = "white" {}

        _GlossTexture ("Gloss Texture", 2D) = "black" {}
        _GlossTextureSoftness ("Softness", Float ) = 0
        [MaterialToggle] _GlossTextureFollowObjectRotation ("Follow Object Rotation", Float ) = 0
        _GlossTextureFollowLight ("Follow Light", Range(0, 1)) = 0

        [HDR] _OverallShadowColor ("Overall Shadow Color", Color) = (0,0,0,1)
        _OverallShadowColorPower ("Overall Shadow Color Power", Float ) = 1
        [MaterialToggle] _SelfShadowShadowTAtViewDirection ("Self Shadow & ShadowT At View Direction", Float ) = 0

        _SelfShadowThreshold ("Threshold", Range(0, 1)) = 0.85
        _SelfShadowHardness ("Hardness", Range(0, 1)) = 1
        [MaterialToggle] _VertexColorGreenControlSelfShadowThreshold ("Vertex Color Green Control Self Shadow Threshold", Float ) = 0
        [HDR] _SelfShadowRealTimeShadowColor ("Self Shadow & Real Time Shadow Color", Color) = (1,1,1,1)
        _SelfShadowRealTimeShadowColorPower ("Self Shadow & Real Time Shadow Color Power", Float ) = 1

        _SmoothObjectNormal ("Smooth Object Normal", Range(0, 1)) = 0
        [MaterialToggle] _VertexColorBlueControlSmoothObjectNormal ("Vertex Color Blue Control Smooth Object Normal", Float ) = 0
        _XYZPosition ("XYZ Position", Vector) = (0,0,0,0)
        _XYZHardness ("XYZ Hardness", Float ) = 14
        [MaterialToggle] _ShowNormal ("Show Normal", Float ) = 0

        _ShadowColorTexture ("Shadow Color Texture", 2D) = "white" {}
        _ShadowColorTexturePower ("Power", Float ) = 0

        _ShadowT ("ShadowT", 2D) = "white" {}
        _ShadowTLightThreshold ("Light Threshold", Float ) = 50
        _ShadowTShadowThreshold ("Shadow Threshold", Float ) = 0
        _ShadowTHardness ("Hardness", Range(0, 1)) = 1
        [HDR] _ShadowTColor ("Color", Color) = (1,1,1,1)
        _ShadowTColorPower ("Color Power", Float ) = 1
        [MaterialToggle] _LightFalloffAffectShadowT ("Light Falloff Affect ShadowT", Float ) = 0

        _PTexture ("PTexture", 2D) = "white" {}
        _PTexturePower ("Power", Float ) = 0

		_DirectionalLightIntensity ("Directional Light Intensity", Float ) = 0
		_PointSpotlightIntensity ("Point and Spot Light Intensity", Float ) = 0
		_LightFalloffSoftness ("Light Falloff Softness", Range(0, 1)) = 1

        _CustomLightDirectionIntensity ("Intensity", Range(0, 1)) = 0
        [MaterialToggle] _CustomLightDirectionFollowObjectRotation ("Custom Light Direction Follow Object Rotation", Float ) = 0
        _CustomLightDirection ("Custom Light Direction", Vector) = (0,0,10,0)

        _FReflectionIntensity ("Intensity", Range(0, 1)) = 0
        _FReflection ("FReflection", 2D) = "black" {}
        _FReflectionRoughtness ("Roughtness", Float ) = 0

		_RefMetallic ("Metallic", Range(0, 1) ) = 0

		_MaskFReflection ("Mask FReflection", 2D) = "white" {}

        _RimLightUnfill ("Unfill", Float ) = 1.5
        _RimLighSoftness ("Softness", Range(0, 1)) = 1
        [HDR] _RimLightColor ("Color", Color) = (1,1,1,1)
        _RimLightColorPower ("Color Power", Float ) = 10
		[MaterialToggle] _RimLightInLight ("Rim Light In Light", Float ) = 1
        [MaterialToggle] _LightAffectRimLightColor ("Light Affect Rim Light Color", Float ) = 0

		_RefVal ("ID", int ) = 0
        [Enum(None,8,A,0,B,2)] _Oper("Set 1", int) = 8
        [Enum(None,8,A,6,B,7)] _Compa("Set 2", int) = 8

		[Toggle(L_F_NM_ON)] _L_F_NM ("Normal Map", Float ) = 0
		[Toggle(L_F_O_ON)] _L_F_O ("Outline", Float ) = 1
		[Toggle(L_F_SL_ON)] _L_F_SL ("Self Lit", Float ) = 0
		[Toggle(L_F_GLO_ON)] _L_F_GLO ("Gloss", Float ) = 0
		[Toggle(L_F_GLOT_ON)] _L_F_GLOT ("Gloss Texture", Float ) = 0
		[Toggle(L_F_SS_ON)] _L_F_SS ("Self Shadow", Float ) = 1
		[Toggle(L_F_SON_ON)] _L_F_SON ("Smooth Object Normal", Float ) = 0
		[Toggle(L_F_SCT_ON)] _L_F_SCT ("Shadow Color Texture", Float ) = 0
		[Toggle(L_F_ST_ON)] _L_F_ST ("ShadowT", Float ) = 0
		[Toggle(L_F_PT_ON)] _L_F_PT ("PTexture", Float ) = 0
		[Toggle(L_F_UOAL_ON)] _L_F_UOAL ("Use Old Ambient Light", Float ) = 0
		[Toggle(L_F_CLD_ON)] _L_F_CLD ("Custom Light Direction", Float ) = 0
		[Toggle(L_F_FR_ON)] _L_F_FR ("FRelfection", Float ) = 0
		[Toggle(L_F_RL_ON)] _L_F_RL ("Rim Light", Float ) = 0
		[Toggle(L_F_HPSS_ON)] _L_F_HPSS ("Hide Point & Spot Light Shadow", Float ) = 0

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
            #pragma only_renderers d3d9 d3d11 vulkan glcore gles3 gles metal xboxone ps4 wiiu switch
            #pragma target 3.0

			#pragma shader_feature L_F_O_ON

            uniform float4 _LightColor0;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform fixed _EnableTextureTransparent;
            uniform half _OutlineWidth;
            uniform half4 _OutlineColor;
            uniform fixed _LightAffectOutlineColor;
            uniform fixed _VertexColorRedAffectOutlineWitdh;
            uniform sampler2D _OutlineWidthControl; uniform float4 _OutlineWidthControl_ST;
            uniform fixed _OutlineWidthAffectedByViewDistance;
			uniform half3 _OutlineOffset;
			uniform float3 _OEM;
            uniform int _OutlineExtrudeMethod;
			uniform half _OutlineZPostionInCamera;
			uniform half _FarDistanceMaxWidth;

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
                UNITY_FOG_COORDS(1)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID (v);
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );
                float3 lightColor = _LightColor0.rgb;
                half _VertexColorRedAffectOutlineWitdh_var = lerp( _OutlineWidth, (_OutlineWidth*(1.0 - o.vertexColor.r)), _VertexColorRedAffectOutlineWitdh );
                half node_2746 = distance(objPos.rgb,_WorldSpaceCameraPos);
                half4 _OutlineWidthControl_var = tex2Dlod(_OutlineWidthControl,float4(TRANSFORM_TEX(o.uv0, _OutlineWidthControl),0.0,0));
                
				_OEM = lerp(v.normal,normalize(v.vertex),_OutlineExtrudeMethod);
				
				o.pos = UnityObjectToClipPos( float4((v.vertex.xyz + _OutlineOffset.xyz * 0.01) + _OEM*((lerp( _VertexColorRedAffectOutlineWitdh_var, ( clamp(_VertexColorRedAffectOutlineWitdh_var*node_2746, _VertexColorRedAffectOutlineWitdh_var, _FarDistanceMaxWidth) ), _OutlineWidthAffectedByViewDistance )*0.01)*_OutlineWidthControl_var.r),1) );
                
				#if defined(SHADER_API_GLCORE) || defined(SHADER_API_GLES) || defined(SHADER_API_GLES3)
					o.pos.z = o.pos.z + _OutlineZPostionInCamera * 0.0005;
				#else
					o.pos.z = o.pos.z - _OutlineZPostionInCamera * 0.0005;
				#endif
				
				UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );
                half4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                clip(lerp( 1.0, _MainTex_var.a, _EnableTextureTransparent ) - 0.5);
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
            #pragma only_renderers d3d9 d3d11 vulkan glcore gles3 gles metal xboxone ps4 wiiu switch
            #pragma target 3.0

			#pragma shader_feature L_F_NM_ON
			#pragma shader_feature L_F_SL_ON
			#pragma shader_feature L_F_GLO_ON
			#pragma shader_feature L_F_GLOT_ON
			#pragma shader_feature L_F_SS_ON
			#pragma shader_feature L_F_SON_ON
			#pragma shader_feature L_F_SCT_ON
			#pragma shader_feature L_F_ST_ON
			#pragma shader_feature L_F_PT_ON
			#pragma shader_feature L_F_FR_ON
			#pragma shader_feature L_F_RL_ON
			#pragma shader_feature L_F_UOAL_ON
			#pragma shader_feature L_F_CLD_ON

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
            uniform half _FReflectionIntensity;
            uniform sampler2D _MaskFReflection; uniform float4 _MaskFReflection_ST;
            uniform half _FReflectionRoughtness;
            uniform half _GlossTextureSoftness;
            uniform half4 _SelfLitColor;
            uniform fixed _SelfLitHighContrast;
            uniform half _SelfLitPower;
            uniform half _SelfLitIntensity;
            uniform sampler2D _MaskSelfLit; uniform float4 _MaskSelfLit_ST;
            uniform sampler2D _PTexture; uniform float4 _PTexture_ST;
            uniform half _PTexturePower;
			uniform half _DirectionalLightIntensity;
            half3 AL_GI(){
            return ShadeSH9(float4(0,0,0,1));
            }
            
            uniform fixed _RimLightInLight;
            uniform half _RimLightUnfill;
            uniform half4 _RimLightColor;
            uniform half _RimLightColorPower;
            uniform half _RimLighSoftness;
            half L_F_SS( half A , half B ){
            #ifdef L_F_SS_ON
            
            return A;
            
            #else
            
            return B;
            
            #endif
            }
            
            half3 L_F_SCT( half3 A ){
            #ifdef L_F_SCT_ON
            
            return A;
            
            #else
            
            return 1;
            
            #endif
            }
            
            half L_F_PT( half A ){
            #ifdef L_F_PT_ON
            
            return A;
            
            #else
            
            return 1;
            
            #endif
            }
            
            half3 L_F_ST( half3 A ){
            #ifdef L_F_ST_ON
            
            return A;
            
            #else
            
            return 1;
            
            #endif
            }
            
            half3 L_F_GLO( half3 A , half3 B ){
            #ifdef L_F_GLO_ON
            
            return A;
            
            #else
            
            return B;
            
            #endif
            }
            
            half3 LL_F_GLOT( half A , half B ){
            #ifdef L_F_GLOT_ON
            
            return A;
            
            #else
            
            return B;
            
            #endif
            }
            
            half3 L_F_FR( half3 A , half3 B ){
            #ifdef L_F_FR_ON
            
            return A;
            
            #else
            
            return B;
            
            #endif
            }
            
            half3 L_F_SL( half3 A , half3 B ){
            #ifdef L_F_SL_ON
            
            return A;
            
            #else
            
            return B;
            
            #endif
            }
            
            half3 L_F_RL( half3 A , half3 B ){
            #ifdef L_F_RL_ON
            
            return A;
            
            #else
            
            return B;
            
            #endif
            }
            
            half3 L_F_SL_1( half3 A , half3 B ){
            #ifdef L_F_SL_ON
            
            return A;
            
            #else
            
            return B;
            
            #endif
            }
            
            half3 L_F_RL_1( half3 A , half3 B ){
            #ifdef L_F_RL_ON
            
            return A;
            
            #else
            
            return B;
            
            #endif
            }
            
            uniform fixed _SelfShadowShadowTAtViewDirection;
            half3 L_F_UOAL( half3 A , half3 B ){
            #ifdef L_F_UOAL_ON
            
            return A;
            
            #else
            
            return B;
            
            #endif
            }
            
            uniform half _XYZHardness;
            uniform float4 _XYZPosition;
            uniform half _SmoothObjectNormal;
            uniform fixed _ShowNormal;
            half3 L_F_SON( half3 A , half3 B ){
            #ifdef L_F_SON_ON
            
            return A;
            
            #else
            
            return B;
            
            #endif
            }
            
            half3 L_F_SON_1( half3 A ){
            #ifdef L_F_SON_ON
            
            return A;
            
            #else
            
            return 1;
            
            #endif
            }
            
            uniform half4 _CustomLightDirection;
            uniform fixed _CustomLightDirectionFollowObjectRotation;
            uniform half _CustomLightDirectionIntensity;
            half3 L_F_CLD( half3 A , half3 B ){
            #ifdef L_F_CLD_ON
            
            return A;
            
            #else
            
            return B;
            
            #endif
            }
            
            uniform fixed _EnableTextureTransparent;
            uniform fixed _VertexColorGreenControlSelfShadowThreshold;
            uniform fixed _VertexColorBlueControlSmoothObjectNormal;
            uniform fixed _LightAffectRimLightColor;
            uniform sampler2D _NormalMap; uniform float4 _NormalMap_ST;
            uniform half _NormalMapIntensity;
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
            float4 frag(VertexOutput i) : COLOR {
                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);

				#ifdef L_F_NM_ON
					half3 _NormalMap_var = UnpackNormal(tex2D(_NormalMap,TRANSFORM_TEX(i.uv0, _NormalMap)));
					float3 normalLocal = lerp(half3(0,0,1),_NormalMap_var.rgb,_NormalMapIntensity);
				#else
					float3 normalLocal = half3(0,0,1);
				#endif

                float3 normalDirection = normalize(mul( normalLocal, tangentTransform ));
                float2 sceneUVs = (i.projPos.xy / i.projPos.w);
                half4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                clip(lerp( 1.0, _MainTex_var.a, _EnableTextureTransparent ) - 0.5);
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
                float attenuation = LIGHT_ATTENUATION(i);
                half3 node_7946 = (_MainTex_var.rgb*_MainColor.rgb);
                half3 node_1756 = L_F_UOAL( UNITY_LIGHTMODEL_AMBIENT.rgb , AL_GI() );
                half4 _MaskSelfLit_var = tex2D(_MaskSelfLit,TRANSFORM_TEX(i.uv0, _MaskSelfLit));
                float3 emissive = (node_7946*L_F_SL( lerp(node_1756,lerp(node_1756,((_SelfLitColor.rgb*node_7946*lerp( 1.0, node_7946, _SelfLitHighContrast ))*_SelfLitPower),_MaskSelfLit_var.r),_SelfLitIntensity) , node_1756 ));
                half3 node_7102 = (_OverallShadowColor.rgb*_OverallShadowColorPower);
                half4 _ShadowColorTexture_var = tex2D(_ShadowColorTexture,TRANSFORM_TEX(i.uv0, _ShadowColorTexture));
                half3 node_9600 = L_F_SCT( lerp(_ShadowColorTexture_var.rgb,(_ShadowColorTexture_var.rgb*_ShadowColorTexture_var.rgb),_ShadowColorTexturePower) );
                half node_2746 = distance(objPos.rgb,_WorldSpaceCameraPos);
                half2 node_4440 = (float2((sceneUVs.x * 2 - 1)*(_ScreenParams.r/_ScreenParams.g), sceneUVs.y * 2 - 1).rg*node_2746);
                half4 _PTexture_var = tex2D(_PTexture,TRANSFORM_TEX(node_4440, _PTexture));
                half node_8910 = L_F_PT( lerp((1.0 - _PTexturePower),1.0,_PTexture_var.r) );
                float4 node_6613_k = float4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
                float4 node_6613_p = lerp(float4(float4(_LightColor0.rgb,0.0).zy, node_6613_k.wz), float4(float4(_LightColor0.rgb,0.0).yz, node_6613_k.xy), step(float4(_LightColor0.rgb,0.0).z, float4(_LightColor0.rgb,0.0).y));
                float4 node_6613_q = lerp(float4(node_6613_p.xyw, float4(_LightColor0.rgb,0.0).x), float4(float4(_LightColor0.rgb,0.0).x, node_6613_p.yzx), step(node_6613_p.x, float4(_LightColor0.rgb,0.0).x));
                float node_6613_d = node_6613_q.x - min(node_6613_q.w, node_6613_q.y);
                float node_6613_e = 1.0e-10;
                half3 node_6613 = float3(abs(node_6613_q.z + (node_6613_q.w - node_6613_q.y) / (6.0 * node_6613_d + node_6613_e)), node_6613_d / (node_6613_q.x + node_6613_e), node_6613_q.x);;
                half3 node_2779 = (_HighlightColor.rgb*_HighlightColorPower+_DirectionalLightIntensity);
                half3 node_2832 = reflect(lerp(viewDirection,halfDirection,_GlossTextureFollowLight),normalDirection);
                half2 node_9280 = lerp( node_2832, mul( unity_WorldToObject, float4(node_2832,0) ).xyz.rgb, _GlossTextureFollowObjectRotation ).rg;
                half2 node_8759 = (float2((-1*node_9280.r),node_9280.g)*0.5+0.5);
                half4 _GlossTexture_var = tex2Dlod(_GlossTexture,float4(TRANSFORM_TEX(node_8759, _GlossTexture),0.0,_GlossTextureSoftness));
                half4 _MaskGloss_var = tex2D(_MaskGloss,TRANSFORM_TEX(i.uv0, _MaskGloss));
                half3 node_2687 = L_F_GLO( lerp(node_2779,lerp(node_2779,(_GlossColor.rgb*_GlossColorPower),LL_F_GLOT( _GlossTexture_var.r , smoothstep( 0.1, lerp(0.1,1.0,_GlossSoftness), pow(max(0,dot(halfDirection,normalDirection)),exp2(lerp(-2,15,_Glossiness))) ) )),_MaskGloss_var.r) , node_2779 );
                float node_4353 = 0.0;
                float node_3687 = 0.0;
                half3 node_4858 = lerp(float3(node_4353,node_4353,node_4353),(lerp( _RimLightColor.rgb, lerp(float3(node_3687,node_3687,node_3687),_RimLightColor.rgb,_LightColor0.rgb), _LightAffectRimLightColor )*_RimLightColorPower),smoothstep( 1.71, lerp(1.70,0.29,_RimLighSoftness), pow(1.0-max(0,dot(normalDirection, viewDirection)),(1.0 - _RimLightUnfill)) ));
                float node_4736 = 1.0;
                half4 _ShadowT_var = tex2D(_ShadowT,TRANSFORM_TEX(i.uv0, _ShadowT));
                float3 node_76 = mul( unity_WorldToObject, float4((i.posWorld.rgb-objPos.rgb),0) ).xyz.rgb.rgb;
                half3 node_5206 = lerp(normalDirection,mul( unity_ObjectToWorld, float4(float3((_XYZPosition.r+(_XYZHardness*node_76.r)),(_XYZPosition.g+(_XYZHardness*node_76.g)),(_XYZPosition.b+(_XYZHardness*node_76.b))),0) ).xyz.rgb,lerp( _SmoothObjectNormal, (_SmoothObjectNormal*(1.0 - i.vertexColor.b)), _VertexColorBlueControlSmoothObjectNormal ));
                half node_573 = 0.5*dot(lerp( L_F_CLD( lerp(lightDirection,lerp( _CustomLightDirection.rgb, mul( unity_ObjectToWorld, float4(_CustomLightDirection.rgb,0) ).xyz.rgb, _CustomLightDirectionFollowObjectRotation ),_CustomLightDirectionIntensity) , lightDirection ), viewDirection, _SelfShadowShadowTAtViewDirection ),L_F_SON( node_5206 , normalDirection ))+0.5;
                half3 node_2388 = (node_7946*lerp((((_SelfShadowRealTimeShadowColor.rgb*_SelfShadowRealTimeShadowColorPower)*node_7102*node_9600*node_8910)*saturate(node_6613.b)),(L_F_RL_1( lerp(node_2687,(node_2687+node_4858),_RimLightInLight) , node_2687 )*L_F_ST( lerp(((_ShadowTColor.rgb*_ShadowTColorPower)*node_9600*node_8910*node_7102),float3(node_4736,node_4736,node_4736),smoothstep( lerp(0.0,0.22,_ShadowTHardness), 0.22, ((_ShadowT_var.r*(1.0 - _ShadowTShadowThreshold))*(lerp( node_573, (attenuation*node_573), _LightFalloffAffectShadowT )*_ShadowTLightThreshold*0.01)) )) )*L_F_SON_1( lerp( 1.0, node_5206, _ShowNormal ) )*_LightColor0.rgb),L_F_SS( (smoothstep( lerp(0.3,1.0,_SelfShadowHardness), 1.0, (node_573*lerp(7,lerp( _SelfShadowThreshold, (_SelfShadowThreshold*(1.0 - i.vertexColor.g)), _VertexColorGreenControlSelfShadowThreshold ),_SelfShadowThreshold)) )*attenuation) , attenuation )));
                half2 node_8431 = reflect(viewDirection,normalDirection).rg;
                half2 node_4207 = (float2(node_8431.r,(-1*node_8431.g))*0.5+0.5);
                half4 _FReflection_var = tex2Dlod(_FReflection,float4(TRANSFORM_TEX(node_4207, _FReflection),0.0,_FReflectionRoughtness));
                half4 _MaskFReflection_var = tex2D(_MaskFReflection,TRANSFORM_TEX(i.uv0, _MaskFReflection));
                half3 node_2704 = L_F_FR( lerp(node_2388,lerp(node_2388,_FReflection_var.rgb * lerp(1,(node_7946 * 2), _RefMetallic) ,_MaskFReflection_var.r),_FReflectionIntensity) , node_2388 );
                half3 node_7395 = L_F_SL_1( lerp(node_2704,lerp(node_2704,node_7946,_MaskSelfLit_var.r),_SelfLitIntensity) , node_2704 );
                float3 finalColor = emissive + L_F_RL( lerp((node_7395+node_4858),node_7395,_RimLightInLight) , node_7395 );
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
			Cull [_DoubleSided]
			Blend One One
            
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
            #pragma only_renderers d3d9 d3d11 vulkan glcore gles3 gles metal xboxone ps4 wiiu switch
            #pragma target 3.0

			#pragma shader_feature L_F_NM_ON
			#pragma shader_feature L_F_SL_ON
			#pragma shader_feature L_F_GLO_ON
			#pragma shader_feature L_F_GLOT_ON
			#pragma shader_feature L_F_SS_ON
			#pragma shader_feature L_F_SON_ON
			#pragma shader_feature L_F_SCT_ON
			#pragma shader_feature L_F_ST_ON
			#pragma shader_feature L_F_PT_ON
			#pragma shader_feature L_F_FR_ON
			#pragma shader_feature L_F_RL_ON
			#pragma shader_feature L_F_UOAL_ON
			#pragma shader_feature L_F_CLD_ON
			#pragma shader_feature L_F_HPSS_ON

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
            uniform half _FReflectionIntensity;
            uniform sampler2D _MaskFReflection; uniform float4 _MaskFReflection_ST;
            uniform half _FReflectionRoughtness;
            uniform half _GlossTextureSoftness;
            uniform half4 _SelfLitColor;
            uniform fixed _SelfLitHighContrast;
            uniform half _SelfLitPower;
            uniform half _SelfLitIntensity;
            uniform sampler2D _MaskSelfLit; uniform float4 _MaskSelfLit_ST;
            uniform sampler2D _PTexture; uniform float4 _PTexture_ST;
            uniform half _PTexturePower;
            half3 AL_GI(){
            return ShadeSH9(float4(0,0,0,1));
            }
            
            uniform fixed _RimLightInLight;
            uniform half _RimLightUnfill;
            uniform half4 _RimLightColor;
            uniform half _RimLightColorPower;
            uniform half _RimLighSoftness;
            half L_F_SS( half A , half B ){
            #ifdef L_F_SS_ON
            
            return A;
            
            #else
            
            return B;
            
            #endif
            }
            
            half3 L_F_SCT( half3 A ){
            #ifdef L_F_SCT_ON
            
            return A;
            
            #else
            
            return 1;
            
            #endif
            }
            
            half L_F_PT( half A ){
            #ifdef L_F_PT_ON
            
            return A;
            
            #else
            
            return 1;
            
            #endif
            }
            
            half3 L_F_ST( half3 A ){
            #ifdef L_F_ST_ON
            
            return A;
            
            #else
            
            return 1;
            
            #endif
            }
            
            half3 L_F_GLO( half3 A , half3 B ){
            #ifdef L_F_GLO_ON
            
            return A;
            
            #else
            
            return B;
            
            #endif
            }
            
            half3 LL_F_GLOT( half A , half B ){
            #ifdef L_F_GLOT_ON
            
            return A;
            
            #else
            
            return B;
            
            #endif
            }
            
            half3 L_F_FR( half3 A , half3 B ){
            #ifdef L_F_FR_ON
            
            return A;
            
            #else
            
            return B;
            
            #endif
            }
            
            half3 L_F_SL( half3 A , half3 B ){
            #ifdef L_F_SL_ON
            
            return A;
            
            #else
            
            return B;
            
            #endif
            }
            
            half3 L_F_RL( half3 A , half3 B ){
            #ifdef L_F_RL_ON
            
            return A;
            
            #else
            
            return B;
            
            #endif
            }
            
            half3 L_F_SL_1( half3 A , half3 B ){
            #ifdef L_F_SL_ON
            
            return A;
            
            #else
            
            return B;
            
            #endif
            }
            
            half3 L_F_RL_1( half3 A , half3 B ){
            #ifdef L_F_RL_ON
            
            return A;
            
            #else
            
            return B;
            
            #endif
            }
            
            uniform fixed _SelfShadowShadowTAtViewDirection;
            half3 L_F_UOAL( half3 A , half3 B ){
            #ifdef L_F_UOAL_ON
            
            return A;
            
            #else
            
            return B;
            
            #endif
            }
            
            uniform half _XYZHardness;
            uniform float4 _XYZPosition;
            uniform half _SmoothObjectNormal;
            uniform fixed _ShowNormal;
            half3 L_F_SON( half3 A , half3 B ){
            #ifdef L_F_SON_ON
            
            return A;
            
            #else
            
            return B;
            
            #endif
            }
            
            half3 L_F_SON_1( half3 A ){
            #ifdef L_F_SON_ON
            
            return A;
            
            #else
            
            return 1;
            
            #endif
            }
            
            uniform half4 _CustomLightDirection;
            uniform fixed _CustomLightDirectionFollowObjectRotation;
            uniform half _CustomLightDirectionIntensity;
            half3 L_F_CLD( half3 A , half3 B ){
            #ifdef L_F_CLD_ON
            
            return A;
            
            #else
            
            return B;
            
            #endif
            }
            
            uniform fixed _EnableTextureTransparent;
            uniform fixed _VertexColorGreenControlSelfShadowThreshold;
            uniform fixed _VertexColorBlueControlSmoothObjectNormal;
            uniform fixed _LightAffectRimLightColor;
            uniform sampler2D _NormalMap; uniform float4 _NormalMap_ST;
            uniform half _NormalMapIntensity;
			uniform half _PointSpotlightIntensity;
			uniform half _LightFalloffSoftness;
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
            float4 frag(VertexOutput i) : COLOR {
                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);

				#ifdef L_F_NM_ON
					half3 _NormalMap_var = UnpackNormal(tex2D(_NormalMap,TRANSFORM_TEX(i.uv0, _NormalMap)));
					float3 normalLocal = lerp(half3(0,0,1),_NormalMap_var.rgb,_NormalMapIntensity);
				#else
					float3 normalLocal = half3(0,0,1);
				#endif

                float3 normalDirection = normalize(mul( normalLocal, tangentTransform ));
                float2 sceneUVs = (i.projPos.xy / i.projPos.w);
                half4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                clip(lerp( 1.0, _MainTex_var.a, _EnableTextureTransparent ) - 0.5);
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
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
				#ifdef L_F_HPSS_ON
					fixed attenuation = 1; 
				#else
					fixed attenuation = UNITY_SHADOW_ATTENUATION(i, i.posWorld.xyz);
				#endif

				fixed lightfos = smoothstep(0, _LightFalloffSoftness ,lightfo);
                half3 node_7946 = (_MainTex_var.rgb*_MainColor.rgb);
                half3 node_7102 = (_OverallShadowColor.rgb*_OverallShadowColorPower);
                half4 _ShadowColorTexture_var = tex2D(_ShadowColorTexture,TRANSFORM_TEX(i.uv0, _ShadowColorTexture));
                half3 node_9600 = L_F_SCT( lerp(_ShadowColorTexture_var.rgb,(_ShadowColorTexture_var.rgb*_ShadowColorTexture_var.rgb),_ShadowColorTexturePower) );
                half node_2746 = distance(objPos.rgb,_WorldSpaceCameraPos);
                half2 node_4440 = (float2((sceneUVs.x * 2 - 1)*(_ScreenParams.r/_ScreenParams.g), sceneUVs.y * 2 - 1).rg*node_2746);
                half4 _PTexture_var = tex2D(_PTexture,TRANSFORM_TEX(node_4440, _PTexture));
                half node_8910 = L_F_PT( lerp((1.0 - _PTexturePower),1.0,_PTexture_var.r) );
                float4 node_6613_k = float4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
                float4 node_6613_p = lerp(float4(float4(_LightColor0.rgb,0.0).zy, node_6613_k.wz), float4(float4(_LightColor0.rgb,0.0).yz, node_6613_k.xy), step(float4(_LightColor0.rgb,0.0).z, float4(_LightColor0.rgb,0.0).y));
                float4 node_6613_q = lerp(float4(node_6613_p.xyw, float4(_LightColor0.rgb,0.0).x), float4(float4(_LightColor0.rgb,0.0).x, node_6613_p.yzx), step(node_6613_p.x, float4(_LightColor0.rgb,0.0).x));
                float node_6613_d = node_6613_q.x - min(node_6613_q.w, node_6613_q.y);
                float node_6613_e = 1.0e-10;
                half3 node_6613 = float3(abs(node_6613_q.z + (node_6613_q.w - node_6613_q.y) / (6.0 * node_6613_d + node_6613_e)), node_6613_d / (node_6613_q.x + node_6613_e), node_6613_q.x);;
                half3 node_2779 = (_HighlightColor.rgb*_HighlightColorPower + _PointSpotlightIntensity);
                half3 node_2832 = reflect(lerp(viewDirection,halfDirection,_GlossTextureFollowLight),normalDirection);
                half2 node_9280 = lerp( node_2832, mul( unity_WorldToObject, float4(node_2832,0) ).xyz.rgb, _GlossTextureFollowObjectRotation ).rg;
                half2 node_8759 = (float2((-1*node_9280.r),node_9280.g)*0.5+0.5);
                half4 _GlossTexture_var = tex2Dlod(_GlossTexture,float4(TRANSFORM_TEX(node_8759, _GlossTexture),0.0,_GlossTextureSoftness));
                half4 _MaskGloss_var = tex2D(_MaskGloss,TRANSFORM_TEX(i.uv0, _MaskGloss));
                half3 node_2687 = L_F_GLO( lerp(node_2779,lerp(node_2779,(_GlossColor.rgb*_GlossColorPower),LL_F_GLOT( _GlossTexture_var.r , smoothstep( 0.1, lerp(0.1,1.0,_GlossSoftness), pow(max(0,dot(halfDirection,normalDirection)),exp2(lerp(-2,15,_Glossiness))) ) )),_MaskGloss_var.r) , node_2779 );
                float node_4353 = 0.0;
                float node_3687 = 0.0;
                half3 node_4858 = lerp(float3(node_4353,node_4353,node_4353),(lerp( _RimLightColor.rgb, lerp(float3(node_3687,node_3687,node_3687),_RimLightColor.rgb,_LightColor0.rgb), _LightAffectRimLightColor )*_RimLightColorPower),smoothstep( 1.71, lerp(1.70,0.29,_RimLighSoftness), pow(1.0-max(0,dot(normalDirection, viewDirection)),(1.0 - _RimLightUnfill)) ));
                float node_4736 = 1.0;
                half4 _ShadowT_var = tex2D(_ShadowT,TRANSFORM_TEX(i.uv0, _ShadowT));
                float3 node_76 = mul( unity_WorldToObject, float4((i.posWorld.rgb-objPos.rgb),0) ).xyz.rgb.rgb;
                half3 node_5206 = lerp(normalDirection,mul( unity_ObjectToWorld, float4(float3((_XYZPosition.r+(_XYZHardness*node_76.r)),(_XYZPosition.g+(_XYZHardness*node_76.g)),(_XYZPosition.b+(_XYZHardness*node_76.b))),0) ).xyz.rgb,lerp( _SmoothObjectNormal, (_SmoothObjectNormal*(1.0 - i.vertexColor.b)), _VertexColorBlueControlSmoothObjectNormal ));
                half node_573 = 0.5*dot(lerp( L_F_CLD( lerp(lightDirection,lerp( _CustomLightDirection.rgb, mul( unity_ObjectToWorld, float4(_CustomLightDirection.rgb,0) ).xyz.rgb, _CustomLightDirectionFollowObjectRotation ),_CustomLightDirectionIntensity) , lightDirection ), viewDirection, _SelfShadowShadowTAtViewDirection ),L_F_SON( node_5206 , normalDirection ))+0.5;
                half3 node_2388 = (node_7946*lerp((((_SelfShadowRealTimeShadowColor.rgb*_SelfShadowRealTimeShadowColorPower)*node_7102*node_9600*node_8910)*saturate(node_6613.b)),(L_F_RL_1( lerp(node_2687,(node_2687+node_4858),_RimLightInLight) , node_2687 )*L_F_ST( lerp(((_ShadowTColor.rgb*_ShadowTColorPower)*node_9600*node_8910*node_7102),float3(node_4736,node_4736,node_4736),smoothstep( lerp(0.0,0.22,_ShadowTHardness), 0.22, ((_ShadowT_var.r*(1.0 - _ShadowTShadowThreshold))*(lerp( node_573, (attenuation*node_573), _LightFalloffAffectShadowT )*_ShadowTLightThreshold*0.01)) )) )*L_F_SON_1( lerp( 1.0, node_5206, _ShowNormal ) )*_LightColor0.rgb),L_F_SS( (smoothstep( lerp(0.3,1.0,_SelfShadowHardness), 1.0, (node_573*lerp(7,lerp( _SelfShadowThreshold, (_SelfShadowThreshold*(1.0 - i.vertexColor.g)), _VertexColorGreenControlSelfShadowThreshold ),_SelfShadowThreshold)) )*attenuation) , attenuation ))*lightfos);
                half2 node_8431 = reflect(viewDirection,normalDirection).rg;
                half2 node_4207 = (float2(node_8431.r,(-1*node_8431.g))*0.5+0.5);
                half4 _FReflection_var = tex2Dlod(_FReflection,float4(TRANSFORM_TEX(node_4207, _FReflection),0.0,_FReflectionRoughtness));
                half4 _MaskFReflection_var = tex2D(_MaskFReflection,TRANSFORM_TEX(i.uv0, _MaskFReflection));
                half3 node_2704 = L_F_FR( lerp(node_2388,lerp(node_2388,_FReflection_var.rgb * lerp(1,(node_7946 * 2), _RefMetallic) ,_MaskFReflection_var.r)*lightfos,_FReflectionIntensity) , node_2388 );
                half4 _MaskSelfLit_var = tex2D(_MaskSelfLit,TRANSFORM_TEX(i.uv0, _MaskSelfLit));
                half3 node_7395 = L_F_SL_1( lerp(node_2704,lerp(node_2704,node_7946,_MaskSelfLit_var.r),_SelfLitIntensity) , node_2704 );
                float3 finalColor = L_F_RL( lerp((node_7395+node_4858)*lightfos,node_7395,_RimLightInLight) , node_7395 );
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
            #pragma only_renderers d3d9 d3d11 vulkan glcore gles3 gles metal xboxone ps4 wiiu switch
            #pragma target 3.0
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform fixed _EnableTextureTransparent;
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
                o.pos = UnityObjectToClipPos( v.vertex );
				TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                half4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                clip(lerp( 1.0, _MainTex_var.a, _EnableTextureTransparent ) - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
	CustomEditor "RealToonShaderGUI_Lite"
}