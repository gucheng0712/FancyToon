struct WorldVec
{
	float3 viewDir;
	float3 normalDir;
	float3 lightDir;
	float3 halfDir;
}; 

sampler2D _MainTex; float4 _MainTex_ST;
sampler2D _NormalMap; float _BumpScale;
sampler2D _LightMask;
float _RimScale;
float _Shininess;
float4 _RimColor;
float4 _MainColor;
fixed4 _SpecularColor;
fixed _SpecularRange;
fixed _SpecularIntensity;
fixed _SpecularOffset;
fixed _ShadowIntensity;
float _Saturation;

sampler2D _RampTex;


