#include "UnityCG.cginc"
float _OutlineWidth;
float _OutlineFactor;
float4 _OutlineColor;
float _Farthest_Distance;
float _Nearest_Distance;
sampler2D _Outline_Sampler; float4 _Outline_Sampler_ST;
float _Offset_Z;


struct a2v
{
	float4 vertex: POSITION;
	float3 normal: NORMAL;
	float2 uv: TEXCOORD;
};

struct v2f
{
	float4 pos:SV_POSITION;
};

v2f outline_vert(a2v v)
{
	v2f f;
	
	// MV transform points from object space to view space
	float3 pos = UnityObjectToViewPos(v.vertex);
   
    float dist2Cam = distance(pos.xyz, _WorldSpaceCameraPos.xyz);
	float factor = smoothstep(_Nearest_Distance, _Farthest_Distance, dist2Cam);
	factor = clamp(factor, 0.05, 0.3);


	// Normal transformation is different from normal transformation
	// IT_MV rotates normals from object space to view space
	float3 normal = mul((float3x3)UNITY_MATRIX_IT_MV, v.normal);

	// 对于一些内凹的模型，可能发生背面面片遮挡正面面片的情况。
	normal.z = -0.5f;
	float3 outlineDir = normalize(normal)*factor;

	pos.xyz += outlineDir *_OutlineWidth;
	f.pos = mul(UNITY_MATRIX_P, float4(pos,1));

	return f;
}

fixed4 outline_frag(v2f i) :SV_Target
{
	fixed4 c = _OutlineColor;
	return c;
}
