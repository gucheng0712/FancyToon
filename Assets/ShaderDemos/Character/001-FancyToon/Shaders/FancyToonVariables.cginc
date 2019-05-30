struct WorldVec
{
	float3 viewDir;
	float3 normalDir;
	float3 lightDir;
	float3 halfDir;
}; 

sampler2D _MainTex; float4 _MainTex_ST;
float _Smoothness;
float _Shininess;
float4 _RampColor;
float4 _MainColor;
fixed4 _SpecularColor;
fixed _SpecularRange;
fixed _SpecularIntensity;
fixed _SpecularOffset;
fixed _ShadowIntensity;
float _Saturation;

