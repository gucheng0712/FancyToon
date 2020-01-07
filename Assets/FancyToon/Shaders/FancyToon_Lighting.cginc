// Upgrade NOTE: replaced 'defined RECEIVE_SHADOW' with 'defined (RECEIVE_SHADOW)'

#include "Lighting.cginc"
#include "UnityCG.cginc"
#include "AutoLight.cginc"
#include "FancyToon_Utility.cginc"
#include "FancyToon_Variables.cginc"


struct a2v
{
    float4 vertex : POSITION;
    float3 normal: NORMAL;
    float4 texcoord : TEXCOORD0;
    float4 tangent: TANGENT;
    //float4 color : COLOR;
};

struct v2f
{
    float4 pos : POSITION;
    float4 uv : TEXCOORD0; // uv.xy: _MainTex's uv // uv.zw: _Normal's uv
    float3 worldNormal : TEXCOORD1;
    float3 worldViewDir : TEXCOORD2;
    float3 worldPos : TEXCOORD3;
    #if defined(PER_FRAGMENT_BINORMAL)
        float4 worldTangent : TEXCOORD4;
    #else 
        float3 worldTangent : TEXCOORD4;
        float3 binormal: TEXCOORD5;
    #endif
    //float4 vertColor : COLOR;

    SHADOW_COORDS(6)
};


v2f vert(a2v v)
{
    v2f f;
    f.pos = UnityObjectToClipPos(v.vertex);
    f.worldNormal =UnityObjectToWorldNormal(v.normal);
    f.worldViewDir = WorldSpaceViewDir(v.vertex);
    f.worldPos = mul(unity_ObjectToWorld, v.vertex);
    
    #if defined(PER_FRAGMENT_BINORMAL)
        f.worldTangent = float4(UnityObjectToWorldDir(v.tangent.xyz),v.tangent.w);
    #else
        f.worldTangent = UnityObjectToWorldDir(v.tangent.xyz);
        f.binormal = CreateBinormal(f.worldNormal,f.worldTangent,v.tangent.w);
    #endif    
    
    f.uv.xy = TRANSFORM_TEX(v.texcoord, _MainTex);
    f.uv.zw = TRANSFORM_TEX(v.texcoord, _NormalMap);
    //f.vertColor = v.color;

    TRANSFER_SHADOW(f);

    return f;
}

WorldVec ComputeWorldVector(v2f f)
{
    WorldVec worldVec;
    worldVec.viewDir = normalize(f.worldViewDir);
    worldVec.normalDir = normalize(f.worldNormal.xyz);
    worldVec.tangentDir = normalize(f.worldTangent);
    worldVec.lightDir = normalize(UnityWorldSpaceLightDir(f.worldPos));    
    worldVec.halfDir = normalize(worldVec.lightDir + worldVec.viewDir);
    return worldVec;
}

void InitNormal(inout v2f f)
{
    float3 tangentSpaceNormal = UnpackScaleNormal(tex2D(_NormalMap,f.uv.zw),_BumpScale);
    #if defined(PER_FRAGMENT_BINORMAL)
        float3 binormal = CreateBinormal(f.normal, f.tangent.xyz, f.tangent.w);
    #else
        float3 binormal = f.binormal;
    #endif
    
    f.worldNormal = normalize(
        tangentSpaceNormal.x * f.worldTangent +
        tangentSpaceNormal.y * binormal +
        tangentSpaceNormal.z * f.worldNormal
        );
}


float ComputeAttenuation(v2f f)
{
    float attenuation = 1.0f;
    #if RECEIVE_SHADOW
        // compute both attenuation and shadow
        UNITY_LIGHT_ATTENUATION(atten, f, f.worldPos);
        attenuation = atten;
    #endif
    return attenuation;
}

float4 frag(v2f f) : SV_Target
{
    InitNormal(f);
    
    // light attenuation
    float attenuation = ComputeAttenuation(f);

    float4 lightMask = tex2D(_LightMask, f.uv);
    // The r channel of _LightMask is used for the Rim mask
    float specularMask = lightMask.r;
    // The g channel of _LightMask is used for the Shade mask
    float shadeMap = lightMask.g;

    WorldVec world = ComputeWorldVector(f);
    float distortedhalfDir = normalize(world.normalDir * _Distortion + world.lightDir);
    float VdotH = ClampedDot(world.viewDir, -distortedhalfDir);

    float NdotL = dot(world.normalDir, world.lightDir)*shadeMap * attenuation;
    float NdotV = ClampedDot(world.normalDir, world.viewDir);

    float halfLambert = NdotL*0.49f+0.5f;
    

    float3 albedo = tex2D(_MainTex, f.uv).rgb *_MainColor.rgb;
    
    float3 ambient = UNITY_LIGHTMODEL_AMBIENT.xyz*albedo;

    // Subsurface Scattering Implementation
    float3 thickness = tex2D(_Thickness, f.uv);

    float sssIntensity = pow(VdotH, _SSSPower + 0.000001) * _SSSScale+_Ambient;
    float3 sss = _Attenuation * sssIntensity * thickness*_SssColor.rgb;

    // Extra Rim for the Surface
    float3 innerRim = _Brightness * pow(NdotV * halfLambert, _Smoothness);




    #if defined(RampTex)
        float4 rampTex = tex2D(_RampTex, float2(halfLambert, NdotV));
        float softness = rampTex.r* rampTex.g* rampTex.b;
    #else
        float softness = smoothstep(0, 0.1f, ClampedDot(world.normalDir, world.lightDir));
    #endif
    
    // Shade Color
    float3 tint = ((saturate((1.0 - (1.0 - _ShadeColor.rgb) * (1.0 - softness))) * _ShadeColor.a) + ((1.0 - _ShadeColor.a) * float3(1, 1, 1)));
    float3 diffuse = (innerRim +albedo) *tint;
    
    

    // View-based Specular Highlight
    float specRange = (1 - NdotV) * pow(NdotL, 1-_RimRange);

    //The approximate derivative value between adjacent pixels is used to achieve anti-aliasing effect on smoothstep
    fixed w = fwidth(specRange)*2.0;

    //float3 specular = smoothstep(_SpecularOffset - w, _SpecularOffset + w, specRange) * _SpecularIntensity * _SpecularColor.rgb;
    // After Optimized
    float3 specular = saturate((specRange - (_RimOffset - w)) / (w * 2)) * _RimIntensity * specularMask;

    #if ANISOTROPIC_SPECULAR
        float3 anisotropicSpecularTex = tex2D(_AnisotropicSpecularTexture, TRANSFORM_TEX(f.uv, _AnisotropicSpecularTexture));
        specular += StrandSpecular(normalize(world.tangentDir + world.normalDir * _FirstAnisotropicSpecularOffset), world.viewDir, world.lightDir, _FirstAnisotropicSpecularRange, _FirstAnisotropicSpecularStrength);
        specular += StrandSpecular(normalize(world.tangentDir + world.normalDir * _SecondAnisotropicSpecularOffset), world.viewDir, world.lightDir, _SecondAnisotropicSpecularRange, _SecondAnisotropicSpecularStrength);
        specular *= anisotropicSpecularTex;
#endif

    #if APPLY_IBL
        float3 IBL = texCUBE(_IBLCubeTex, world.normalDir).rgb;
        specular *= IBL;
    #else
        specular *= _RimColor.rgb;
    #endif


    // overall color
    float3 color = (diffuse+ sss + specular)  + ambient;
    
    // adjust the saturation at the end
    color = Saturation(color, _Saturation);

    return float4(color * _LightColor0.rgb, 1);
}