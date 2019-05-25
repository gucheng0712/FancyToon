// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'
// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

uniform sampler2D _ColorBase;
uniform sampler2D _ShadowSampler;
uniform fixed4 _ColorBase_ST;

// Vertex
struct VS {
  half4 Pos: POSITION;
  fixed2 UV: TEXCOORD0;
  fixed Shadow: TEXCOORD1;
};

// Light vector
inline fixed3 getLightVector (fixed3 pos) {
  // dir light if w == 0
  return normalize (_WorldSpaceLightPos0.xyz); 
}
// Vertex shader
VS vert (appdata_base i) {

  half3 world_pos = mul (unity_ObjectToWorld, i.vertex).xyz;
  half3 world_light = getLightVector (i.vertex);
  half3 world_norml = normalize (mul (unity_ObjectToWorld, fixed4(i.normal, 0)).xyz);
  fixed shadow = (dot (world_norml, world_light) + 1.0f) * 0.45f + 0.05f;
  // (0 -> 1) * 0.9 + 0.5

  VS o;
  o.Pos = UnityObjectToClipPos (i.vertex);
  o.UV = TRANSFORM_TEX(i.texcoord, _ColorBase);
  o.Shadow = shadow;
  return o;
}
// Fragment shader
fixed4 frag (VS i): COLOR {
  fixed shadow = (tex2D (_ShadowSampler, fixed2 (i.Shadow, 0)).r - 0.5) * 2; // -1 -> 1
  return tex2D (_ColorBase, i.UV) + shadow;
}
