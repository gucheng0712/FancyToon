uniform fixed _InkSize;
uniform sampler2D _InkSampler;
uniform fixed4 _InkSampler_ST;

// Vertex shader
struct VS {
  half4 Pos: POSITION;
  fixed2 UV: TEXCOORD0;
};

// Vertex shader
VS vert (appdata_base i) {

  const fixed incDist = 1.1f;

  half4 normalUnit = normalize (half4 (i.normal, 0));

  half4 viewNormal = mul (UNITY_MATRIX_MV, normalUnit);
  half4 edgePos = mul (UNITY_MATRIX_MV, i.vertex);

  half4 edgeProj = mul (UNITY_MATRIX_P, edgePos);

  fixed baseSize = edgeProj.z;

  half distToCamera = clamp (length (edgePos) / incDist, 0.0, 1.0);
  half normalScale = lerp (0.1, 1.0, distToCamera) * _InkSize * 0.001;

  VS o;
  o.Pos = mul (UNITY_MATRIX_P, edgePos + normalScale * viewNormal * baseSize);
  o.UV = TRANSFORM_TEX(i.texcoord, _InkSampler);
  return o;
}
/// Fragment shader
fixed4 frag (VS i): COLOR {
  return tex2D (_InkSampler, i.UV);
}
