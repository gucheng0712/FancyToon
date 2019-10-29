
Shader "Toon/FancyToon"
{
    Properties
    {
        [Enum(UnityEngine.Rendering.CullMode)]
        _Cull("Cull Mode", Float) = 2

        [Toggle(RECEIVE_SHADOW)]
        _ReceiveShadow("Receive Shadow?", Float) = 0
        
        _MainTex("Albedo", 2D) = "white" {}
        _RampTex("Ramp Texture", 2D) = "white"{}
        _MainColor("MainColor", Color) = (1,1,1,1)
        _Shininess("Shininess", Range(0.01,5)) = 0.2
        _RimScale("RimScale", Range(0,0.5)) = 0.05
        
        _NormalMap("Normal Map", 2D) = "bump"{}
        _BumpScale("BumpScale",Float) = 1
    
        _LightMask("Light Mask",2D) = "black"{} // r 通道为 高光遮罩, g:未定(阴影遮罩), b:未定(emission遮罩)
        
        _SpecularColor("Specular Color",Color) = (1,1,1,1)
        _SpecularRange("Specular Range",Range(0.001,5)) = 0.1
        _SpecularIntensity("Specular Intensity",Range(0, 1)) = 0.01
        _SpecularOffset("Specular Offset",Range(0.5,1)) = 0.6
               
        _OutlineWidth("Outline Width", Range(0,0.1)) = 0.002
        _OutlineColor("OutlineColor", Color) = (0,0,0,0)
        _Farthest_Distance("Farthest_Distance", Float) = 10
        _Nearest_Distance("Nearest_Distance", Float) = 0.5
        _Outline_Sampler("Outline_Sampler", 2D) = "white" {}

        _ShadowIntensity("Shadow Intensity", Range(0,1)) = 0.5

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
            #pragma shader_feature RECEIVE_SHADOW
            #if RECEIVE_SHADOW
            //#pragma multi_compile_fwdbase
            #endif
            #pragma target 3.0

            #include "FancyToon_Lighting.cginc"
            ENDCG
        }
        
        Pass
        {
            Tags {
                "LightMode" = "ShadowCaster"
            }

            CGPROGRAM

            #pragma target 3.0
            //#pragma multi_compile_shadowcaster
            #pragma vertex MyShadowVertexProgram
            #pragma fragment MyShadowFragmentProgram

            #include "FancyToon_Shadow.cginc"

            ENDCG
        }
    }
   // Fallback "Diffuse"
    CustomEditor "FancyToonGUI"
}