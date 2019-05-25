Shader "Shadow/PlaneProjection"
{
	Properties
	{
		_MainTex ("Texture", 2D) = "white" {}
		_ShadowColor ("ShadowColor", Color) = (0,0,0,0)
		//1
		_ShadowFalloff ("ShadowFalloff",range(0,10)) = 2
		//2
		_ShadowInvLen ("ShadowInvLen", float) = 1.0 
		_ShadowFadeParams ("ShadowFadeParams", Vector) = (0.0, 1.5, 0.7, 0.0)
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
			
			#include "UnityCG.cginc"

			struct appdata
			{
				float4 vertex : POSITION;
				float2 uv : TEXCOORD0;
			};

			struct v2f
			{
				float2 uv : TEXCOORD0;
				UNITY_FOG_COORDS(1)
				float4 vertex : SV_POSITION;
			};

			sampler2D _MainTex;
			float4 _MainTex_ST;
			
			v2f vert (appdata v)
			{
				v2f o;
				o.vertex = UnityObjectToClipPos(v.vertex);
				o.uv = TRANSFORM_TEX(v.uv, _MainTex);
				UNITY_TRANSFER_FOG(o,o.vertex);
				return o;
			}
			
			fixed4 frag (v2f i) : SV_Target
			{
				// sample the texture
				fixed4 col = tex2D(_MainTex, i.uv);
				// apply fog
				UNITY_APPLY_FOG(i.fogCoord, col);
				return col;
			}
			ENDCG
		}

//阴影pass
Pass
{
	Name "Shadow"

	//用使用模板测试以保证alpha显示正确
	Stencil
	{
		Ref 0
		Comp equal
		Pass incrWrap
		Fail keep
		ZFail keep
	}

	Blend SrcAlpha OneMinusSrcAlpha

	//关闭深度写入
	ZWrite off

	//深度稍微偏移防止阴影与地面穿插
	Offset -1 , 0

	CGPROGRAM
	#pragma vertex vert
	#pragma fragment frag

	#include "UnityCG.cginc"
	struct appdata
	{
		float4 vertex : POSITION;
	};

	struct v2f
	{
		float4 vertex : SV_POSITION;
		float4 color : COLOR;
	};

	float _Height;
	float4 _ShadowColor;

	float _ShadowFalloff;

	float _ShadowInvLen;
	float4 _ShadowFadeParams;

	float3 ShadowProjectPos1(float4 vertPos)
	{
		float3 shadowPos;

		//得到顶点的世界空间坐标
		float3 worldPos = mul(unity_ObjectToWorld , vertPos).xyz;

		//灯光方向
		float3 lightDir = normalize(_WorldSpaceLightPos0.xyz);

		float3 p0 = float3(0,0,0);
		float3 normal = float3(0,1,0);

		float distance = dot(p0.xyz - worldPos.xyz, normal.xyz) / dot(lightDir, normal.xyz);
        shadowPos.xyz = worldPos.xyz + distance * lightDir;

		return shadowPos;
	}

	float3 ShadowProjectPos2(float4 vertPos)
	{
		float3 shadowPos;

		//得到顶点的世界空间坐标
		float3 worldPos = mul(unity_ObjectToWorld , vertPos).xyz;

		//灯光方向
		float3 lightDir = normalize(_WorldSpaceLightPos0.xyz);

		_Height = 0.1;

		//阴影的世界空间坐标（低于地面的部分不做改变）
		shadowPos.y = min(worldPos .y ,_Height);
		shadowPos.xz = worldPos .xz - lightDir.xz * max(0 , worldPos .y - _Height) / lightDir.y; 

		return shadowPos;
	}

	v2f vert (appdata v)
	{
		v2f o;

		//得到阴影的世界空间坐标
		float3 shadowPos = ShadowProjectPos1(v.vertex);

		//转换到裁切空间
		o.vertex = UnityWorldToClipPos(shadowPos);

		//得到中心点世界坐标
		//float3 center = _WorldPos.xyz;//不考虑地面高度
		float3 center =float3( unity_ObjectToWorld[0].w , _Height , unity_ObjectToWorld[2].w);

		//计算阴影衰减方法一
		float3 posToPlane_2 = (center - shadowPos);
		float falloff = (pow((1.0 - clamp(((sqrt(dot(posToPlane_2, posToPlane_2)) * _ShadowInvLen) - _ShadowFadeParams.x), 0.0, 1.0)), _ShadowFadeParams.y) * _ShadowFadeParams.z);

		//计算阴影衰减方法二
		//float falloff = 1-saturate(distance(shadowPos , center) * _ShadowFalloff);

		//阴影颜色
		o.color = _ShadowColor; 
		o.color.a *= falloff;

		return o;
	}

	fixed4 frag (v2f i) : SV_Target
	{
		return i.color;
	}
	ENDCG
}
	}
}
