
Shader "Toon/FancyToon_MultiLight"
{
	Properties
	{
		[Enum(UnityEngine.Rendering.CullMode)]
		_Cull("Cull Mode", Float) = 2

		[Toggle(RECEIVE_SHADOW)]
		_ReceiveShadow("Receive Shadow?", Float) = 0

		[Space(20)]

		[Header(Main Settings)]
		_MainTex("Texture", 2D) = "white" {}
		_MainColor("MainColor", Color) = (1,1,1,1)
		_Smoothness("Smoothness", Range(0.01,5)) = 0.2
		_Shininess("Shininess", Range(0,1)) = 0.7
		_RampColor("RampColor", Color) = (0.5,0.5,0.5,1)

		[Space(20)]

		[Header(Specular Settings)]
		_SpecularColor("Specular Color",Color) = (1,1,1,1)
        _SpecularRange("Specular Range",Range(0.001,5)) = 0.1
		_SpecularIntensity("Specular Intensity",Range(0, 1)) = 0.01
		_SpecularOffset("Specular Offset",Range(0.5,1)) = 0.6

		[Space(20)]
        
        [Header(NormalMap Settings)]
        _NormalMap("Normal Map", 2D) = "bump"{}
        _BumpScale("BumpScale",Float) = 1

        [Space(20)]
        
		[Header(Outline Settings)]
		_OutlineWidth("Outline Width", Range(0,0.1)) = 0.002
		_OutlineColor("OutlineColor", Color) = (0,0,0,0)
		_Farthest_Distance("Farthest_Distance", Float) = 10
		_Nearest_Distance("Nearest_Distance", Float) = 0.5
		_Outline_Sampler("Outline_Sampler", 2D) = "white" {}

		[Space(20)]

		[Header(Shadow Settings)]
		_ShadowIntensity("Shadow Intensity", Range(0,1))=0.5

		_ID("Mask ID", Int) = 1

		[Header(Other Settings)]
		_Saturation("Color Saturation",Range(0.5,3)) = 1.0
        
	}
    
    CGINCLUDE

    #define BINORMAL_PER_FRAGMENT

    ENDCG
    
	SubShader
	{
		Tags { "RenderType" = "Opaque" "Queue" = "Geometry"}

		// This Pass is more used to make the outline of the character
		Pass
		{
			Name "Outline"
			Tags{ "LightMode" = "Always" }
			Cull Front
			CGPROGRAM
			#include "Assets/ShaderLib/OutlineLib.cginc"
			#pragma vertex outline_vert
			#pragma fragment outline_frag
			#pragma target 3.0
			ENDCG
		}

		Pass
		{
			Tags{ "LightMode" = "ForwardBase" }
			Cull[_Cull]
     
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			//#pragma shader_feature RECEIVE_SHADOW
			//#pragma multi_compile_fwdbase
			#pragma target 3.0

			#include "FancyToonLighting.cginc"
			ENDCG
        }
        Pass
        {
            Tags{ "LightMode" = "ForwardAdd" }
            Cull[_Cull]
            Blend One One
            ZWrite Off
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            //#pragma shader_feature RECEIVE_SHADOW
            #pragma multi_compile_fwdadd
            #pragma target 3.0

            #include "FancyToonLighting.cginc"
            ENDCG
        }
	}
	Fallback "Diffuse"
}