#include "Lighting.cginc"
#include "UnityCG.cginc"
#include "AutoLight.cginc"
#include "FancyToonUtility.cginc"
#include "FancyToonVariables.cginc"


struct a2v
{
	float4 vertex : POSITION;
	float3 normal: NORMAL;
	float4 texcoord : TEXCOORD0;
	//float4 color : COLOR;
};

struct v2f
{
	float4 pos : POSITION;
	float2 uv : TEXCOORD0;
	float3 worldNormal : TEXCOORD1;
	float3 viewDir : TEXCOORD2;
	float3 worldPos : TEXCOORD3;
	//float4 vertColor : COLOR;
	//SHADOW_COORDS(4)
};

v2f vert(a2v v)
{
	v2f f;
	f.pos = UnityObjectToClipPos(v.vertex);
	f.uv = TRANSFORM_TEX(v.texcoord, _MainTex);
	f.worldNormal =UnityObjectToWorldNormal(v.normal);
	f.viewDir = WorldSpaceViewDir(v.vertex);
	f.worldPos = mul(unity_ObjectToWorld, v.vertex);
	//f.vertColor = v.color;
	//#if RECEIVE_SHADOW
	//	TRANSFER_SHADOW(f);
	//#endif
	return f;
}

WorldVec ComputeWorldVector(v2f f)
{
    WorldVec worldVec;
    worldVec.viewDir = normalize(f.viewDir);
    worldVec.normalDir = normalize(f.worldNormal.xyz);
    worldVec.lightDir = normalize(UnityWorldSpaceLightDir(f.worldPos));    
    worldVec.halfDir = normalize(worldVec.lightDir + worldVec.viewDir);
    return worldVec;
}

float4 frag(v2f f) : SV_Target
{
	WorldVec world = ComputeWorldVector(f);

    float NdotL = ClampedDot(world.normalDir, world.lightDir);
    float NdotV = ClampedDot(world.normalDir, world.viewDir);
    
	float3 albedo = tex2D(_MainTex, f.uv).rgb * _MainColor.rgb;
	
    float3 ambient = UNITY_LIGHTMODEL_AMBIENT.xyz*albedo;

	float3 rim = _Shininess * pow(NdotL*NdotL, _Smoothness);
	// 使用邻域像素之间的近似导数值来对smoothstep实现抗锯齿的效果 
	float ramp = smoothstep(0, 0.1, NdotL);   

	float3 diffuse = rim * _RampColor.rgb +  albedo * (ramp + _ShadowIntensity);

    // 基于视角的高光
	float specRange = (1 - NdotV) * pow(NdotL, _SpecularRange);

	// 使用邻域像素之间的近似导数值来对smoothstep实现抗锯齿的效果 
	fixed w = fwidth(specRange)*2.0;
	float3 specular = smoothstep(_SpecularOffset - w, _SpecularOffset + w, specRange) * _SpecularIntensity * _SpecularColor.rgb;
    
    // 添加灯光的attenuation
    UNITY_LIGHT_ATTENUATION(atten,0,f.worldPos); 
    
	float3 color = (diffuse + specular) + ambient;
    
	// 在最后调整饱和度
	color = Saturation(color, _Saturation);

	return float4(color * atten * _LightColor0.rgb, 1);
}