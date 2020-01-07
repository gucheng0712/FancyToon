using System;
using UnityEditor;
using UnityEngine;
using UnityEngine.Rendering;
using System.Collections.Generic;

namespace ArtistKit {

    public class ShaderGUI_RenderMode_Bloom : ShaderGUI_RenderMode {

        protected MaterialProperty m_prop_SrcAlphaBlend = null;
        protected MaterialProperty m_prop_DstAlphaBlend = null;
        protected MaterialProperty m_prop_OutputBloomFactorAlphaSelector = null;
        protected MaterialProperty m_prop_OutputAlphaPreMultiplySelector = null;

        public float _OutputBloomFactorAlphaSelector {
            get {
                if ( m_prop_OutputBloomFactorAlphaSelector != null ) {
                    return m_prop_OutputBloomFactorAlphaSelector.floatValue > 0 ? 1 : 0;
                }
                return 0;
            }
            set {
                if ( m_prop_OutputBloomFactorAlphaSelector != null ) {
                    m_prop_OutputBloomFactorAlphaSelector.floatValue = value > 0 ? 1 : 0;
                }
            }
        }

        public float _OutputAlphaPreMultiplySelector {
            get {
                if ( m_prop_OutputAlphaPreMultiplySelector != null ) {
                    return m_prop_OutputAlphaPreMultiplySelector.floatValue > 0 ? 1 : 0;
                }
                return 0;
            }
            set {
                if ( m_prop_OutputAlphaPreMultiplySelector != null ) {
                    m_prop_OutputAlphaPreMultiplySelector.floatValue = value > 0 ? 1 : 0;
                }
            }
        }

        public BlendMode _SrcAlphaBlend {
            get {
                if ( m_prop_SrcAlphaBlend != null && m_prop_SrcAlphaBlend.type == MaterialProperty.PropType.Float ) {
                    return ( BlendMode )m_prop_SrcAlphaBlend.floatValue;
                }
                return BlendMode.One;
            }
            set {
                if ( m_prop_SrcAlphaBlend != null && m_prop_SrcAlphaBlend.type == MaterialProperty.PropType.Float ) {
                    m_prop_SrcAlphaBlend.floatValue = ( float )value;
                }
            }
        }

        public BlendMode _DstAlphaBlend {
            get {
                if ( m_prop_DstAlphaBlend != null && m_prop_DstAlphaBlend.type == MaterialProperty.PropType.Float ) {
                    return ( BlendMode )m_prop_DstAlphaBlend.floatValue;
                }
                return BlendMode.Zero;
            }
            set {
                if ( m_prop_DstAlphaBlend != null && m_prop_DstAlphaBlend.type == MaterialProperty.PropType.Float ) {
                    m_prop_DstAlphaBlend.floatValue = ( float )value;
                }
            }
        }

        protected override bool OnInitProperties( MaterialProperty[] props ) {
            m_keep = null;
            var _prop_Mode = FindCachedProperty( "_Mode", props, false );
            if ( _prop_Mode == null ) {
                _prop_Mode = FindCachedProperty( "_RenderMode", props );
            }
            if ( _prop_Mode != null ) {
                var _prop_BlendOp = FindCachedProperty( "_BlendOp", props );
                var _prop_SrcBlend = FindCachedProperty( "_SrcBlend", props );
                var _prop_DstBlend = FindCachedProperty( "_DstBlend", props );
                var _prop_SrcAlphaBlend = FindCachedProperty( "_SrcAlphaBlend", props );
                var _prop_DstAlphaBlend = FindCachedProperty( "_DstAlphaBlend", props );
                var _prop_ZWrite = FindCachedProperty( "_ZWrite", props );
                var _prop_ZTest = FindCachedProperty( "_ZTest", props );
                if ( _prop_SrcBlend != null && _prop_DstBlend != null && _prop_ZWrite != null && _prop_ZTest != null ) {
                    m_prop_Mode = _prop_Mode;
                    m_prop_BlendOp = _prop_BlendOp;
                    m_prop_SrcBlend = _prop_SrcBlend;
                    m_prop_DstBlend = _prop_DstBlend;
                    m_prop_SrcAlphaBlend = _prop_SrcAlphaBlend;
                    m_prop_DstAlphaBlend = _prop_DstAlphaBlend;
                    m_prop_ZWrite = _prop_ZWrite;
                    m_prop_ZTest = _prop_ZTest;
                    m_prop_AlphaPremultiply = FindCachedProperty( "_AlphaPremultiply", props, false );
                    m_prop_AutoRenderQueue = FindCachedProperty( "_AutoRenderQueue", props, false );
                    m_prop_FogColorSelector = FindCachedProperty( "_FogColorSelector", props, false );
                    m_prop_OutputBloomFactorAlphaSelector = FindCachedProperty( "_OutputBloomFactorAlphaSelector", props, false );
                    m_prop_OutputAlphaPreMultiplySelector = FindCachedProperty( "_OutputAlphaPreMultiplySelector", props, false );

                    m_prop_Cutoff = FindCachedProperty( "_Cutoff", props, false );
                    m_prop_ColorKey = FindCachedProperty( "_ColorKey", props, false );
                    m_prop_MainTex_Alpha = FindCachedProperty( "_MainTex_Alpha", props, false );
                }

                ParseOptions();
                return true;
            }
            return false;
        }

        static bool RenderModeNeedsAlpha( RenderMode mode ) {
            return mode == RenderMode.Cutout ||
                    mode == RenderMode.Transparent;
        }

        static bool IsTransparentMode( RenderMode mode ) {
            return mode == RenderMode.Additive ||
                mode == RenderMode.Transparent;
        }

        bool SetMaterialKeywords( Material material ) {
            var ret = true;
            var mode = _Mode;
            var cutoff = false;
            switch ( mode ) {
            case RenderMode.Opaque:
                _AlphaPremultiply = false;
                _OutputBloomFactorAlphaSelector = 0;
                _OutputAlphaPreMultiplySelector = 0;
                SetKeyword( material, "_ALPHATEST_COLOR_KEY_ON", false );
                SetKeyword( material, "_ALPHATEST_ON", false );
                break;
            case RenderMode.Cutout: {
                    var alphaTest = m_prop_Cutoff != null;
                    if ( m_prop_Cutoff != null && m_prop_Cutoff.floatValue == 0 ) {
                        if ( m_prop_Cutoff.type == MaterialProperty.PropType.Range ) {
                            m_prop_Cutoff.floatValue = m_prop_Cutoff.rangeLimits.x;
                        }
                    }
                    cutoff = alphaTest;
                    if ( alphaTest ) {
                        SetKeyword( material, "_ALPHATEST_ON", true );
                    } else {
                        SetKeyword( material, "_ALPHATEST_ON", false );
                    }
                    SetKeyword( material, "_ALPHATEST_COLOR_KEY_ON", false );
                    // output bloom factor
                    _OutputBloomFactorAlphaSelector = 0;
                    _OutputAlphaPreMultiplySelector = 0;
                    _AlphaPremultiply = false;
                }
                break;
            case RenderMode.ColorKey:
                cutoff = m_prop_ColorKey != null;
                SetKeyword( material, "_ALPHATEST_COLOR_KEY_ON", cutoff );
                SetKeyword( material, "_ALPHATEST_ON", false );
                // output bloom factor
                _OutputBloomFactorAlphaSelector = 0;
                _OutputAlphaPreMultiplySelector = 0;
                _AlphaPremultiply = false;
                break;
            case RenderMode.Additive:
                // output bloom factor
                _OutputBloomFactorAlphaSelector = 0;
                // 透明值预乘到颜色通道中，A通道可以输出BloomFactor
                _OutputAlphaPreMultiplySelector = 1;
                _AlphaPremultiply = true;
                break;
            case RenderMode.SoftAdditive:
                // output bloom factor
                _OutputBloomFactorAlphaSelector = 0;
                // 透明值预乘到颜色通道中，A通道可以输出BloomFactor
                _OutputAlphaPreMultiplySelector = 1;
                _AlphaPremultiply = true;
                break;
            case RenderMode.Transparent:
                // output alpha
                _OutputBloomFactorAlphaSelector = 1;
                // 完整支持预乘模式
                _OutputAlphaPreMultiplySelector = _AlphaPremultiply ? 1 : 0;
                break;
            case RenderMode.Custom:
                break;
            default:
                cutoff = false;
                SetKeyword( material, "_ALPHATEST_COLOR_KEY_ON", false );
                SetKeyword( material, "_ALPHATEST_ON", false );
                break;
            }
            if ( !cutoff && ( mode == RenderMode.Cutout || mode == RenderMode.ColorKey ) ) {
                // 选定模式下，但是缺少材质属性，强制设置为非透明模式
                _Mode = RenderMode.Opaque;
                SetKeyword( material, "_ALPHATEST_COLOR_KEY_ON", false );
                SetKeyword( material, "_ALPHATEST_ON", false );
                ret = false;
            }
            if ( _Mode == RenderMode.Opaque ) {
                // output bloom factor
                _OutputBloomFactorAlphaSelector = 0;
                _OutputAlphaPreMultiplySelector = 0;
                _AlphaPremultiply = false;
            } else {
                if ( _Mode == RenderMode.Additive ) {
                    if ( m_prop_AlphaPremultiply != null && !_AlphaPremultiply ) {
                        // 强制开启预乘模式，这样可以不用输出A通道透明值
                        _AlphaPremultiply = true;
                    }
                }
            }
            var hasAlphaTex = useAlpha && m_prop_MainTex_Alpha != null ? m_prop_MainTex_Alpha.textureValue : null;
            SetKeyword( material, "_USE_EXTERNAL_ALPHA", hasAlphaTex != null );
            if ( hasAlphaTex == null && m_prop_MainTex_Alpha != null ) {
                m_prop_MainTex_Alpha.textureValue = null;
            }
            SetKeyword( material, "_MODE_OPAQUE", _Mode == RenderMode.Opaque );
            SetKeyword( material, "_MODE_COLORKEY", _Mode == RenderMode.ColorKey );
            SetKeyword( material, "_MODE_CUSTOM", _Mode == RenderMode.Custom );
            SetKeyword( material, "_MODE_CUTOUT", _Mode == RenderMode.Cutout );
            SetKeyword( material, "_MODE_TRANSPARENT", _Mode == RenderMode.Transparent );
            SetKeyword( material, "_MODE_ADDITIVE", _Mode == RenderMode.Additive );
            SetKeyword( material, "_MODE_SOFTADDITIVE", _Mode == RenderMode.SoftAdditive );
            if ( _Mode == RenderMode.SoftAdditive || _Mode == RenderMode.Additive ) {
                SetKeyword( material, "_BLEND_ADDITIVE_SERIES", true );
                // 颜色叠加模式，注意去掉目标雾的颜色，避免两次叠加
                _FogColorSelector = 0;
            } else {
                SetKeyword( material, "_BLEND_ADDITIVE_SERIES", false );
                _FogColorSelector = 1;
            }
            return ret;
        }

        protected override void SetupMaterialWithRenderingMode( Material material, bool modeChanged = true, bool fixRenderQueueStrict = true ) {
            var ok = false;
            while ( !ok ) {
                switch ( _Mode ) {
                case RenderMode.Opaque:
                    material.SetOverrideTag( "RenderType", "Opaque" );
                    _Mode = RenderMode.Opaque;
                    _BlendOp = BlendOp.Add;
                    _SrcBlend = BlendMode.One;
                    _DstBlend = BlendMode.Zero;
                    _SrcAlphaBlend = BlendMode.One;
                    _DstAlphaBlend = BlendMode.Zero;
                    _ZWrite = true;
                    if ( _AutoRenderQueue ) {
                        material.renderQueue = -1;
                    }
                    SetKeyword( material, "_ALPHAPREMULTIPLY_ON", false );
                    ok = SetMaterialKeywords( material );
                    break;
                case RenderMode.Cutout:
                    material.SetOverrideTag( "RenderType", "TransparentCutout" );
                    _Mode = RenderMode.Cutout;
                    _BlendOp = BlendOp.Add;
                    _SrcBlend = BlendMode.One;
                    _DstBlend = BlendMode.Zero;
                    _SrcAlphaBlend = BlendMode.One;
                    _DstAlphaBlend = BlendMode.Zero;
                    _ZWrite = true;
                    if ( _AutoRenderQueue ) {
                        material.renderQueue = ( int )UnityEngine.Rendering.RenderQueue.AlphaTest;
                    }
                    SetKeyword( material, "_ALPHAPREMULTIPLY_ON", false );
                    ok = SetMaterialKeywords( material );
                    break;
                case RenderMode.ColorKey:
                    material.SetOverrideTag( "RenderType", "TransparentCutout" );
                    _Mode = RenderMode.ColorKey;
                    _BlendOp = BlendOp.Add;
                    _SrcBlend = BlendMode.One;
                    _DstBlend = BlendMode.Zero;
                    _SrcAlphaBlend = BlendMode.One;
                    _DstAlphaBlend = BlendMode.Zero;
                    _ZWrite = true;
                    if ( _AutoRenderQueue ) {
                        material.renderQueue = ( int )UnityEngine.Rendering.RenderQueue.AlphaTest;
                    }
                    SetKeyword( material, "_ALPHAPREMULTIPLY_ON", false );
                    ok = SetMaterialKeywords( material );
                    break;
                case RenderMode.Transparent:
                    _Mode = RenderMode.Transparent;
                    material.SetOverrideTag( "RenderType", "Transparent" );
                    _BlendOp = BlendOp.Add;
                    // 开启预乘，AlphaBlend效率可能会高一点点，其他好像没有其他优势
                    // 只是为了多一种选择
                    if ( m_prop_AlphaPremultiply != null && _AlphaPremultiply ) {
                        _SrcBlend = BlendMode.One;
                        SetKeyword( material, "_ALPHAPREMULTIPLY_ON", true );
                    } else {
                        _SrcBlend = BlendMode.SrcAlpha;
                        SetKeyword( material, "_ALPHAPREMULTIPLY_ON", false );
                    }
                    _DstBlend = BlendMode.OneMinusSrcAlpha;
                    // disable alpha channel write
                    _SrcAlphaBlend = BlendMode.Zero;
                    _DstAlphaBlend = BlendMode.One;
                    _ZWrite = false;
                    if ( _AutoRenderQueue ) {
                        material.renderQueue = ( int )UnityEngine.Rendering.RenderQueue.Transparent;
                    }
                    ok = SetMaterialKeywords( material );
                    break;
                case RenderMode.Additive:
                    _Mode = RenderMode.Additive;
                    material.SetOverrideTag( "RenderType", "Transparent" );
                    _BlendOp = BlendOp.Add;
                    // 输出颜色都默认自动预乘，这样像素着色器不用输出Alpha值
                    _AlphaPremultiply = true;
                    SetKeyword( material, "_ALPHAPREMULTIPLY_ON", true );
                    _SrcBlend = BlendMode.One;
                    _DstBlend = BlendMode.One;
                    _SrcAlphaBlend = BlendMode.One;
                    _DstAlphaBlend = BlendMode.One;
                    // always output premultiplied color
                    _OutputAlphaPreMultiplySelector = 1;
                    _ZWrite = false;
                    if ( _AutoRenderQueue ) {
                        material.renderQueue = ( int )UnityEngine.Rendering.RenderQueue.Transparent;
                    }
                    ok = SetMaterialKeywords( material );
                    break;
                case RenderMode.SoftAdditive:
                    material.SetOverrideTag( "RenderType", "Transparent" );
                    _Mode = RenderMode.SoftAdditive;
                    _BlendOp = BlendOp.Add;
                    // 输出颜色都默认自动预乘，这样像素着色器不用输出Alpha值
                    _AlphaPremultiply = true;
                    SetKeyword( material, "_ALPHAPREMULTIPLY_ON", true );
                    _SrcBlend = BlendMode.OneMinusDstColor;
                    _DstBlend = BlendMode.One;
                    _SrcAlphaBlend = BlendMode.OneMinusDstColor;
                    _DstAlphaBlend = BlendMode.One;
                    // always output premultiplied color
                    _OutputAlphaPreMultiplySelector = 1;
                    _ZWrite = false;
                    if ( _AutoRenderQueue ) {
                        material.renderQueue = ( int )UnityEngine.Rendering.RenderQueue.Transparent;
                    }
                    SetKeyword( material, "_ALPHAPREMULTIPLY_ON", false );
                    ok = SetMaterialKeywords( material );
                    break;
                case RenderMode.Custom:
                    if ( modeChanged ) {
                        _AutoRenderQueue = false;
                    }
                    _Mode = RenderMode.Custom;
                    SetMaterialKeywords( material );
                    ok = true;
                    break;
                default:
                    ok = true;
                    break;
                }
            }
            if ( m_prop_AlphaPremultiply != null ) {
                _OutputAlphaPreMultiplySelector = _AlphaPremultiply ? 1 : 0;
            }
            if ( modeChanged && _Mode != RenderMode.Custom ) {
                _AutoRenderQueue = true;
                SetAutoRenderQueue( material, _Mode, fixRenderQueueStrict );
            }
        }

        protected override void OnDrawPropertiesGUI( Material material, MaterialProperty[] props ) {
            if ( m_prop_Mode != null ) {
                EditorGUI.showMixedValue = m_prop_Mode.hasMixedValue;
                var oldMode = ( RenderMode )m_prop_Mode.floatValue;
                EditorGUI.BeginChangeCheck();
                RenderMode renderingMode;
                GUI.enabled = m_keep.HasValue == false;
                renderingMode = ( RenderMode )EditorGUILayout.IntPopup( m_prop_Mode.displayName, ( int )oldMode, m_optionNames, m_optionValues );
                GUI.enabled = true;
                EditorGUI.indentLevel++;
                if ( m_prop_AutoRenderQueue != null ) {
                    m_MaterialEditor.ShaderProperty( m_prop_AutoRenderQueue, m_prop_AutoRenderQueue.displayName );
                }
                GUI.enabled = _Mode == RenderMode.Transparent || _Mode == RenderMode.Custom;
                if ( m_prop_AlphaPremultiply != null ) {
                    m_MaterialEditor.ShaderProperty( m_prop_AlphaPremultiply, m_prop_AlphaPremultiply.displayName );
                }
                GUI.enabled = true;

                if ( _Mode == RenderMode.Custom ) {
                    if ( m_prop_BlendOp != null ) {
                        var a = ( BlendOp )EditorGUILayout.EnumPopup( m_prop_BlendOp.displayName, ( BlendOp )m_prop_BlendOp.floatValue );
                        m_prop_BlendOp.floatValue = ( float )a;
                    }
                    if ( m_prop_SrcBlend != null ) {
                        var a = ( BlendMode )EditorGUILayout.EnumPopup( m_prop_SrcBlend.displayName, ( BlendMode )m_prop_SrcBlend.floatValue );
                        m_prop_SrcBlend.floatValue = ( float )a;
                    }
                    if ( m_prop_DstBlend != null ) {
                        var a = ( BlendMode )EditorGUILayout.EnumPopup( m_prop_DstBlend.displayName, ( BlendMode )m_prop_DstBlend.floatValue );
                        m_prop_DstBlend.floatValue = ( float )a;
                    }
                    if ( m_prop_SrcAlphaBlend != null ) {
                        var a = ( BlendMode )EditorGUILayout.EnumPopup( m_prop_SrcAlphaBlend.displayName, ( BlendMode )m_prop_SrcAlphaBlend.floatValue );
                        m_prop_SrcAlphaBlend.floatValue = ( float )a;
                    }
                    if ( m_prop_DstAlphaBlend != null ) {
                        var a = ( BlendMode )EditorGUILayout.EnumPopup( m_prop_DstAlphaBlend.displayName, ( BlendMode )m_prop_DstAlphaBlend.floatValue );
                        m_prop_DstAlphaBlend.floatValue = ( float )a;
                    }
                    if ( m_prop_OutputBloomFactorAlphaSelector != null ) {
                        m_prop_OutputBloomFactorAlphaSelector.floatValue = EditorGUILayout.Toggle( m_prop_OutputBloomFactorAlphaSelector.displayName, m_prop_OutputBloomFactorAlphaSelector.floatValue > 0 ) ? 1 : 0;
                    }
                    if ( m_prop_OutputAlphaPreMultiplySelector != null ) {
                        m_prop_OutputAlphaPreMultiplySelector.floatValue = EditorGUILayout.Toggle( m_prop_OutputAlphaPreMultiplySelector.displayName, m_prop_OutputAlphaPreMultiplySelector.floatValue > 0 ) ? 1 : 0;
                    }
                    if ( m_prop_ZWrite != null ) {
                        m_prop_ZWrite.floatValue = EditorGUILayout.Toggle( m_prop_ZWrite.displayName, m_prop_ZWrite.floatValue > 0 ) ? 1 : 0;
                    }
                    if ( m_prop_ZTest != null ) {
                        var a = ( ZTest )EditorGUILayout.EnumPopup( m_prop_ZTest.displayName, ( ZTest )m_prop_ZTest.floatValue );
                        m_prop_ZTest.floatValue = ( float )a;
                    }
                } else {
                    _showDetail = EditorGUILayout.Foldout( _showDetail, "Detail" );
                    if ( _showDetail ) {
                        GUI.enabled = false;
                        EditorGUI.indentLevel++;
                        try {
                            if ( m_prop_BlendOp != null ) {
                                EditorGUILayout.EnumPopup( m_prop_BlendOp.displayName, ( BlendOp )m_prop_BlendOp.floatValue );
                            }
                            if ( m_prop_SrcBlend != null ) {
                                EditorGUILayout.EnumPopup( m_prop_SrcBlend.displayName, ( BlendMode )m_prop_SrcBlend.floatValue );
                            }
                            if ( m_prop_DstBlend != null ) {
                                EditorGUILayout.EnumPopup( m_prop_DstBlend.displayName, ( BlendMode )m_prop_DstBlend.floatValue );
                            }
                            if ( m_prop_SrcAlphaBlend != null ) {
                                EditorGUILayout.EnumPopup( m_prop_SrcAlphaBlend.displayName, ( BlendMode )m_prop_SrcAlphaBlend.floatValue );
                            }
                            if ( m_prop_DstAlphaBlend != null ) {
                                EditorGUILayout.EnumPopup( m_prop_DstAlphaBlend.displayName, ( BlendMode )m_prop_DstAlphaBlend.floatValue );
                            }
                            if ( m_prop_ZWrite != null ) {
                                EditorGUILayout.Toggle( m_prop_ZWrite.displayName, m_prop_ZWrite.floatValue > 0 );
                            }
                            if ( m_prop_ZTest != null ) {
                                EditorGUILayout.EnumPopup( m_prop_ZTest.displayName, ( ZTest )m_prop_ZTest.floatValue );
                            }
                            if ( m_prop_OutputBloomFactorAlphaSelector != null ) {
                                EditorGUILayout.Toggle( m_prop_OutputBloomFactorAlphaSelector.displayName, m_prop_OutputBloomFactorAlphaSelector.floatValue > 0 );
                            }
                            if ( m_prop_OutputAlphaPreMultiplySelector != null ) {
                                if ( m_prop_AlphaPremultiply != null ) {
                                    _OutputAlphaPreMultiplySelector = _AlphaPremultiply ? 1 : 0;
                                }
                                EditorGUILayout.Toggle( m_prop_OutputAlphaPreMultiplySelector.displayName, m_prop_OutputAlphaPreMultiplySelector.floatValue > 0 );
                            }
                        } finally {
                            GUI.enabled = true;
                            EditorGUI.indentLevel--;
                        }
                    }
                }
                EditorGUI.indentLevel--;
                if ( EditorGUI.EndChangeCheck() ) {
                    this.m_MaterialEditor.RegisterPropertyChangeUndo( m_prop_Mode.name );
                    this.m_prop_Mode.floatValue = ( float )renderingMode;
                    SetupMaterialWithRenderingMode( material, oldMode != renderingMode );
                }
                EditorGUI.showMixedValue = false;
            }
        }

        protected override void OnRefreshKeywords( Material material ) {
            SetMaterialKeywords( material );
        }

        protected override void OnMaterialChanged( Material material, MaterialProperty[] props ) {
            SetMaterialKeywords( material );
        }

        public new static UnitMaterialEditor Create( UnitMaterialEditor.PropEditorSettings s ) {
            return new ShaderGUI_RenderMode_Bloom();
        }
    }
}
