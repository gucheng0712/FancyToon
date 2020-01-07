// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// UCTS_Outline.cginc
// 2017/03/08 N.Kobayashi (Unity Technologies Japan)
// カメラオフセット付きアウトライン（BaseColorライトカラー反映修正版）
// 2017/06/05 PS4対応版
//
            uniform float4 _LightColor0; 
            uniform float4 _BaseColor;
            uniform float _Outline_Width;
            uniform float _Farthest_Distance;
            uniform float _Nearest_Distance;
            uniform sampler2D _Outline_Sampler; uniform float4 _Outline_Sampler_ST;
            uniform float4 _Outline_Color;
            uniform fixed _Is_BlendBaseColor;
            uniform fixed _Is_LightColor_Base;
            uniform float _Offset_Z;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
				float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );
                float3 lightColor = _LightColor0.rgb;
                float4 _Outline_Sampler_var = tex2Dlod(_Outline_Sampler,float4(TRANSFORM_TEX(o.uv0, _Outline_Sampler),0.0,0));
                float dist = distance(objPos.xyz,_WorldSpaceCameraPos); // 顶点与摄像机的距离
                float step = smoothstep( _Farthest_Distance, _Nearest_Distance, dist); //将距离转为描边范围内的归一化
                float outlineWIdth = _Outline_Width * 0.001;
                //outlineWIdth *= ( step * _Outline_Sampler_var.rgb).r;
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - o.pos.xyz); // 
                float4 viewDirectionVP = mul(UNITY_MATRIX_VP, float4(viewDirection.xyz, 1));
                _Offset_Z = _Offset_Z * -0.1;
				//v.normal.z = -0.5;//首先对顶点法线的z分量进行处理，使它们等于一个定值，然后再归一化，让拓展后的背面更加扁平化，降低遮挡正面面片的可能。
				//v.normal = normalize(v.normal);
				//o.pos = UnityObjectToClipPos(float4(v.vertex.xyz + v.vertexColor*outlineWIdth, 1));
                o.pos = UnityObjectToClipPos(float4(v.vertex.xyz + v.normal*outlineWIdth,1) );
                o.pos.z = o.pos.z + _Offset_Z*viewDirectionVP.z;
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : SV_Target{
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );
                float3 lightColor = _LightColor0.rgb;
                float3 baseColor = lerp( _BaseColor.rgb, (_BaseColor.rgb*_LightColor0.rgb), _Is_LightColor_Base );
                float3 outline_Color = lerp( _Outline_Color.rgb, (_Outline_Color.rgb*baseColor*baseColor), _Is_BlendBaseColor );
                return fixed4(outline_Color,0);
            }
// UCTS_Outline.cginc ここまで.
