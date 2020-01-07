float ClampedDot (half3 a, half3 b) {
	#if (SHADER_TARGET < 30 || defined(SHADER_API_PS3))
		return saturate(dot(a, b));
	#else
		return max(0.0, dot(a, b));
	#endif
}

// Saturation
inline float3 Saturation(float3 color, float value)
{
	float luminance = 0.2125*color.r + 0.7154*color.g + 0.0721*color.b;
	float3 luminanceColor = float3(luminance, luminance, luminance);
	return lerp(luminanceColor, color, value);
}

// Create the binormal
float3 CreateBinormal (float3 normal, float3 tangent, float binormalSign) {
	return cross(normal, tangent.xyz) *
	(binormalSign * unity_WorldTransformParams.w);
}


float StrandSpecular(float3 T, float3 V, float3 L, float exponent, float strength)
{
    float3 H = normalize(L + V);
    float TdotH = dot(T, H);
    /*
    這一行高大上一點的說法就是三角恆等式
    sin2 = 1 - cos2
        sin = sqrt(1 - cos ^ 2)　　　//　TdotH = cosθ
        sin = sqrt(1 - dotTH * dotTH)

    直觀一點的說法大概是反相, todo 寻找资料了解它的几何意义
     */
    float sinTH = sqrt(1 - TdotH * TdotH);
    float dirAtten = smoothstep(-1.0, 0.0, TdotH);
    return pow(sinTH, exponent) * strength * dirAtten;
}
