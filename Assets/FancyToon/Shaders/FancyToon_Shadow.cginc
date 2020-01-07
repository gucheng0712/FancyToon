#include "UnityCG.cginc"

struct a2v {
	float4 position : POSITION;
	float3 normal : NORMAL;
};

#if defined(SHADOWS_CUBE)
struct v2f {
	float4 position : SV_POSITION;
	float3 lightVec : TEXCOORD0;
};

v2f vert(a2v v) {
	v2f i;
	i.position = UnityObjectToClipPos(v.position);
	i.lightVec =
		mul(unity_ObjectToWorld, v.position).xyz - _LightPositionRange.xyz;
	return i;
}

float4 frag(v2f i) : SV_TARGET{
	float depth = length(i.lightVec) + unity_LightShadowBias.x;
	depth *= _LightPositionRange.w;
	return UnityEncodeCubeShadowDepth(depth);
}
#else
float4 vert(a2v v) : SV_POSITION{
	float4 position =
		UnityClipSpaceShadowCasterPos(v.position.xyz, v.normal);
	return UnityApplyLinearShadowBias(position);
}

half4 frag() : SV_TARGET{
	return 0;
}
#endif
