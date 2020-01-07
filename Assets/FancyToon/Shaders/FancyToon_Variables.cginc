struct WorldVec
{
	float3 viewDir;
	float3 normalDir;
	float3 tangentDir;
	float3 lightDir;
	float3 halfDir;
}; 

samplerCUBE _IBLCubeTex;

sampler2D _MainTex; float4 _MainTex_ST;
sampler2D _NormalMap; float4 _NormalMap_ST;
float _BumpScale;
sampler2D _LightMask;
float _Brightness;
float _Smoothness;
float4 _MainColor;
float4 _ShadeColor;

sampler2D _Thickness;
float4 _SssColor;
float _Attenuation;
float _Ambient; 
float _Distortion; 
float _SSSPower;
float _SSSScale;

fixed4 _RimColor;
fixed _RimRange;
fixed _RimIntensity;
fixed _RimOffset;

sampler2D _AnisotropicSpecularTexture; float4 _AnisotropicSpecularTexture_ST;
float _FirstAnisotropicSpecularOffset;
float _FirstAnisotropicSpecularRange;
float _FirstAnisotropicSpecularStrength;
float _SecondAnisotropicSpecularOffset;
float _SecondAnisotropicSpecularRange;
float _SecondAnisotropicSpecularStrength;
float _Saturation;


sampler2D _RampTex;


