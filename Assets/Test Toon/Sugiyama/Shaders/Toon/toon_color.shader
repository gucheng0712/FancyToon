Shader "Sugiyama/Toon/Color" {
  // @version 1.1.0
  // @date $date$
  // @author sugiyama-mitsunari

  Properties {
    _InkSize ("Ink Size", Float) = 5.0
    _InkColor ("Ink Color", Color) = (0,0,0,1)
    _ColorBase ("Diffuse", 2D) = "white" {}
    _ShadowSampler ("Shadow Texture", 2D) = "gray" {}
  }

  SubShader {

    Tags {
      "Queue" = "Geometry"
      "LightMode" = "ForwardBase"
    }

    // Outline pass
    Pass {
      Cull Front
      ZTest Less
CGPROGRAM
#pragma vertex vert
#pragma fragment frag
#include "UnityCG.cginc"

#include "_toon_ink_color.cginc"

ENDCG
    }
    

    // Main pass
    Pass {
      Cull Back
      ZTest LEqual
CGPROGRAM
#pragma vertex vert
#pragma fragment frag
#include "UnityCG.cginc"

#include "_toon_mesh.cginc"

ENDCG
    }
  }

  FallBack "VertexLit"
}
