
Shader "Toon/FancyToon"
{
    Properties
    {
        [Enum(UnityEngine.Rendering.CullMode)]
        _Cull("Cull Mode", Float) = 2

        [Toggle(RECEIVE_SHADOW)]
        _ReceiveShadow("Receive Shadow?", Float) = 0
        [Toggle(APPLY_IBL)]
        _ApplyIBL("Apply IBL?",Float) = 0

        _IBLCubeTex("IBL (CubeMap)",CUBE) = ""{}
        _MainTex("Albedo", 2D) = "white" {}
        _RampTex("Ramp", 2D) = "white"{}
        _MainColor("MainColor", Color) = (1,1,1,1)
        _ShadeColor("ShadeColor",Color) = (1,1,1,1)
        _Smoothness("Smoothness", Range(0.01,5)) = 0.2
        _Brightness("Brightness", Range(0,0.5)) = 0.05

        _Thickness("Thickness",2D) = "white"{}
        _SssColor("SSS Color", Color)=(0,0,0,0)
        _Attenuation("Attenuation",Range(0,5)) = 1
        _Ambient("Ambient",Range(0,1)) = 1
        _Distortion("Distortion",Range(0,1)) = 1
        _SSSPower("SSS Power", Range(0,5)) = 1
        _SSSScale("SSS Scale",Range(0,5)) = 1
        
        _NormalMap("Normal Map", 2D) = "bump"{}
        _BumpScale("BumpScale",Range(1,5)) = 1
        
        _EmissionMap("Emission Map", 2D) = "white"{}
        _EmissionColor("Emission Color", Color) = (0,0,0,1)

        _LightMask("Light Mask",2D) = "white"{} // R:Specular Mask, g:AO Mask, b:Emission Mask)
        
        [HDR]_RimColor("Rim Color",Color) = (1,1,1,1)
        _RimRange("Rim Range",Range(0.001,1)) = 0.1
        _RimIntensity("Rim Intensity",Range(0, 1)) = 0.01
        _RimOffset("Rim Offset",Range(0.5,1)) = 0.6

        [Toggle(ANISOTROPIC_SPECULAR)]
        _UseAnisotropicSpecular("Use Anisotropic Specular?", Float) = 0


        _AnisotropicSpecularTexture("Anisotropic Specular Texture", 2D) = "white"{}
        
        _FirstAnisotropicSpecularOffset("First Anisotropic Specular Offset", Range(0, 30)) = 1
        _FirstAnisotropicSpecularRange("First Anisotropic Specular Range",Range(0,5000)) = 500
        _FirstAnisotropicSpecularStrength("First Anisotropic Specular Strength",Range(0,1)) = 1

        _SecondAnisotropicSpecularOffset("Second Anisotropic Specular Offset", Range(0, 30)) = 1
        _SecondAnisotropicSpecularRange("Second Anisotropic Specular Range",Range(0,5000)) = 500
        _SecondAnisotropicSpecularStrength("Second Anisotropic Specular Strength",Range(0,1)) = 1
        
        _OutlineWidth("Outline Width", Range(0,0.1)) = 0.002
        _OutlineColor("OutlineColor", Color) = (0,0,0,0)
        _Farthest_Distance("Farthest_Distance", Float) = 10
        _Nearest_Distance("Nearest_Distance", Float) = 0.5
        _Outline_Sampler("Outline_Sampler", 2D) = "white" {}

        _ID("Stencil Mask ID", Int) = 1

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
            #include "FancyToon_Outline.cginc"
            #pragma vertex outline_vert
            #pragma fragment outline_frag
            //#pragma multi_compile_instancing
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
            #pragma shader_feature RampTex	
            #pragma shader_feature RECEIVE_SHADOW
            #pragma shader_feature APPLY_IBL
            #pragma shader_feature ANISOTROPIC_SPECULAR
            #if RECEIVE_SHADOW
                #pragma multi_compile_fwdbase
            #endif
            #pragma target 3.0

            #include "FancyToon_Lighting.cginc"
            ENDCG
        }
        
        //todo add Shadow receiver and multilight support in to future
        Pass
        {
            Tags { "LightMode" = "ShadowCaster" }

            CGPROGRAM

            #pragma target 3.0
            #pragma multi_compile_shadowcaster
            #pragma vertex vert
            #pragma fragment frag

            #include "FancyToon_Shadow.cginc"

            ENDCG
        }
    }
    Fallback "Diffuse"
    // CustomEditor "FancyToonGUI"
}