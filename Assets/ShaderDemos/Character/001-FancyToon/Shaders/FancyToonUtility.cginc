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


