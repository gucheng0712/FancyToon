using System;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using UnityEngine.Rendering;

namespace ArtistKit {

    public class ShaderGUI_RenderMode : UnitMaterialEditor {

        protected MaterialProperty m_prop_Mode = null;
        protected MaterialProperty m_prop_BlendOp = null;
        protected MaterialProperty m_prop_SrcBlend = null;
        protected MaterialProperty m_prop_DstBlend = null;
        protected MaterialProperty m_prop_ZWrite = null;
        protected MaterialProperty m_prop_ZTest = null;
        protected MaterialProperty m_prop_AlphaPremultiply = null;
        protected MaterialProperty m_prop_AutoRenderQueue = null;

        protected MaterialProperty m_prop_MainTex_Alpha = null;
        protected MaterialProperty m_prop_Cutoff = null;
        protected MaterialProperty m_prop_ColorKey = null;
        protected MaterialProperty m_prop_FogColorSelector = null;

        protected String[] m_optionNames = null;
        protected int[] m_optionValues = null;
        protected RenderMode? m_keep = null;

        protected static bool _showDetail = false;

        public RenderMode? fixedMode {
            get {
                if ( m_keep != null ) {
                    return m_keep.Value;
                }
                return null;
            }
        }

        public RenderMode _Mode {
            get {
                if ( m_prop_Mode != null && m_prop_Mode.type == MaterialProperty.PropType.Float ) {
                    return ( RenderMode )m_prop_Mode.floatValue;
                }
                return RenderMode.Opaque;
            }
            set {
                if ( m_prop_Mode != null && m_prop_Mode.type == MaterialProperty.PropType.Float ) {
                    m_prop_Mode.floatValue = ( float )value;
                }
            }
        }

        public bool _AutoRenderQueue {
            get {
                if ( m_prop_AutoRenderQueue != null && m_prop_AutoRenderQueue.type == MaterialProperty.PropType.Float ) {
                    return m_prop_AutoRenderQueue.floatValue != 0;
                }
                return false;
            }
            set {
                if ( m_prop_AutoRenderQueue != null && m_prop_AutoRenderQueue.type == MaterialProperty.PropType.Float ) {
                    m_prop_AutoRenderQueue.floatValue = value ? 1 : 0;
                }
            }
        }

        public bool _AlphaPremultiply {
            get {
                if ( m_prop_AlphaPremultiply != null && m_prop_AlphaPremultiply.type == MaterialProperty.PropType.Float ) {
                    return m_prop_AlphaPremultiply.floatValue != 0;
                }
                return false;
            }
            set {
                if ( m_prop_AlphaPremultiply != null && m_prop_AlphaPremultiply.type == MaterialProperty.PropType.Float ) {
                    m_prop_AlphaPremultiply.floatValue = value ? 1 : 0;
                }
            }
        }

        public float _FogColorSelector {
            get {
                if ( m_prop_FogColorSelector != null ) {
                    return m_prop_FogColorSelector.floatValue > 0 ? 1 : 0;
                }
                return 0;
            }
            set {
                if ( m_prop_FogColorSelector != null ) {
                    m_prop_FogColorSelector.floatValue = value > 0 ? 1 : 0;
                }
            }
        }

        public BlendOp _BlendOp {
            get {
                if ( m_prop_BlendOp != null && m_prop_BlendOp.type == MaterialProperty.PropType.Float ) {
                    return ( BlendOp )m_prop_BlendOp.floatValue;
                }
                return BlendOp.Add;
            }
            set {
                if ( m_prop_BlendOp != null && m_prop_BlendOp.type == MaterialProperty.PropType.Float ) {
                    m_prop_BlendOp.floatValue = ( float )value;
                }
            }
        }

        public BlendMode _SrcBlend {
            get {
                if ( m_prop_SrcBlend != null && m_prop_SrcBlend.type == MaterialProperty.PropType.Float ) {
                    return ( BlendMode )m_prop_SrcBlend.floatValue;
                }
                return BlendMode.One;
            }
            set {
                if ( m_prop_SrcBlend != null && m_prop_SrcBlend.type == MaterialProperty.PropType.Float ) {
                    m_prop_SrcBlend.floatValue = ( float )value;
                }
            }
        }

        public BlendMode _DstBlend {
            get {
                if ( m_prop_DstBlend != null && m_prop_DstBlend.type == MaterialProperty.PropType.Float ) {
                    return ( BlendMode )m_prop_DstBlend.floatValue;
                }
                return BlendMode.Zero;
            }
            set {
                if ( m_prop_DstBlend != null && m_prop_DstBlend.type == MaterialProperty.PropType.Float ) {
                    m_prop_DstBlend.floatValue = ( float )value;
                }
            }
        }

        public float _Cutoff {
            get {
                if ( m_prop_Cutoff != null && ( m_prop_Cutoff.type == MaterialProperty.PropType.Float || m_prop_Cutoff.type == MaterialProperty.PropType.Range ) ) {
                    return m_prop_Cutoff.floatValue;
                }
                return 0;
            }
            set {
                if ( m_prop_Cutoff != null && ( m_prop_Cutoff.type == MaterialProperty.PropType.Float || m_prop_Cutoff.type == MaterialProperty.PropType.Range ) ) {
                    m_prop_Cutoff.floatValue = Mathf.Clamp01( value );
                }
            }
        }

        public Color _ColorKey {
            get {
                if ( m_prop_ColorKey != null && ( m_prop_ColorKey.type == MaterialProperty.PropType.Color ) ) {
                    return m_prop_ColorKey.colorValue;
                }
                return Color.black;
            }
            set {
                if ( m_prop_ColorKey != null && ( m_prop_ColorKey.type == MaterialProperty.PropType.Color ) ) {
                    m_prop_ColorKey.colorValue = value;
                }
            }
        }

        public bool _ZWrite {
            get {
                if ( m_prop_ZWrite != null && m_prop_ZWrite.type == MaterialProperty.PropType.Float ) {
                    return m_prop_ZWrite.floatValue != 0;
                }
                return true;
            }
            set {
                if ( m_prop_ZWrite != null && m_prop_ZWrite.type == MaterialProperty.PropType.Float ) {
                    m_prop_ZWrite.floatValue = value ? 1 : 0;
                }
            }
        }

        public bool useAlpha {
            get {
                return RenderModeNeedsAlpha( _Mode );
            }
        }

        protected override bool OnInitProperties( MaterialProperty[] props ) {
            var _prop_Mode = FindCachedProperty( "_Mode", props, false );
            if ( _prop_Mode == null ) {
                _prop_Mode = FindCachedProperty( "_RenderMode", props );
            }
            if ( _prop_Mode != null ) {
                var _prop_BlendOp = FindCachedProperty( "_BlendOp", props );
                var _prop_SrcBlend = FindCachedProperty( "_SrcBlend", props );
                var _prop_DstBlend = FindCachedProperty( "_DstBlend", props );
                var _prop_ZWrite = FindCachedProperty( "_ZWrite", props );
                var _prop_ZTest = FindCachedProperty( "_ZTest", props );
                if ( _prop_SrcBlend != null && _prop_DstBlend != null && _prop_ZWrite != null && _prop_ZTest != null ) {
                    m_prop_Mode = _prop_Mode;
                    m_prop_BlendOp = _prop_BlendOp;
                    m_prop_SrcBlend = _prop_SrcBlend;
                    m_prop_DstBlend = _prop_DstBlend;
                    m_prop_ZWrite = _prop_ZWrite;
                    m_prop_ZTest = _prop_ZTest;
                    m_prop_AlphaPremultiply = FindCachedProperty( "_AlphaPremultiply", props, false );
                    m_prop_AutoRenderQueue = FindCachedProperty( "_AutoRenderQueue", props, false );
                    m_prop_FogColorSelector = FindCachedProperty( "_FogColorSelector", props, false );

                    m_prop_Cutoff = FindCachedProperty( "_Cutoff", props, false );
                    m_prop_ColorKey = FindCachedProperty( "_ColorKey", props, false );
                    m_prop_MainTex_Alpha = FindCachedProperty( "_MainTex_Alpha", props, false );

                    ParseOptions();
                    return true;
                }
            }
            return false;
        }

        protected void ParseOptions() {
            var enames = Enum.GetNames( typeof( RenderMode ) );
            var evals = Enum.GetValues( typeof( RenderMode ) );
            var options = new List<KeyValuePair<String, int>>();
            if ( m_args != null ) {
                var _options = m_args.GetField( Cfg.ArgsKey_Options );
                if ( _options != null && _options.IsString && !String.IsNullOrEmpty( _options.str ) ) {
                    var seps = _options.str.Split( ',', ';', '|' );
                    for ( int i = 0; i < seps.Length; ++i ) {
                        var key = seps[ i ].Trim();
                        var index = Array.IndexOf( enames, key );
                        if ( index >= 0 ) {
                            options.Add( new KeyValuePair<String, int>( enames[ index ], ( int )evals.GetValue( index ) ) );
                        }
                    }
                }
            }
            if ( options.Count > 0 ) {
                m_optionNames = new string[ options.Count ];
                m_optionValues = new int[ options.Count ];
                for ( int i = 0; i < options.Count; ++i ) {
                    m_optionNames[ i ] = options[ i ].Key;
                    m_optionValues[ i ] = options[ i ].Value;
                }
            } else {
                m_optionNames = enames;
                m_optionValues = new int[ m_optionNames.Length ];
                for ( int i = 0; i < m_optionNames.Length; ++i ) {
                    m_optionValues[ i ] = ( int )evals.GetValue( i );
                }
            }
            for (; ; ) {
                if ( m_args != null ) {
                    String keepOption;
                    if ( ShaderGUIHelper.ParseValue( this, m_args, Cfg.Key_FixedValue, out keepOption ) ) {
                        var index = Array.IndexOf( m_optionNames, keepOption );
                        if ( index >= 0 ) {
                            m_keep = ( RenderMode )m_optionValues[ index ];
                            _Mode = m_keep.Value;
                            SetupMaterialWithRenderingMode( this.m_MaterialEditor.target as Material, true, false );
                            break;
                        }
                    }
                }
                if ( Array.IndexOf( m_optionValues, ( int )_Mode ) < 0 ) {
                    // 修正选项
                    _Mode = ( RenderMode )m_optionValues[ 0 ];
                }
                // 修正渲染模式参数
                SetupMaterialWithRenderingMode( this.m_MaterialEditor.target as Material, true, false );
                break;
            }
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
                }
                break;
            case RenderMode.ColorKey: {
                    cutoff = m_prop_ColorKey != null;
                    SetKeyword( material, "_ALPHATEST_COLOR_KEY_ON", cutoff );
                    SetKeyword( material, "_ALPHATEST_ON", false );
                }
                break;
            case RenderMode.Additive:
                break;
            case RenderMode.Transparent:
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
                _Mode = RenderMode.Opaque;
                SetKeyword( material, "_ALPHATEST_COLOR_KEY_ON", false );
                SetKeyword( material, "_ALPHATEST_ON", false );
                ret = false;
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

        protected static RenderQueue? ConvertToRenderQueueFromSortValue( int renderQueue ) {
            var values = UnitMaterialEditor.RenderQueueValues;
            for ( int i = values.Length - 1; i >= 0; --i ) {
                if ( renderQueue >= values[ i ] ) {
                    return ( RenderQueue )values[ i ];
                }
            }
            return null;
        }

        protected static Vector2Int GetRenderQueueRange( RenderQueue queue ) {
            var values = UnitMaterialEditor.RenderQueueValues;
            var index = Array.IndexOf( values, queue );
            Debug.Assert( index >= 0 );
            const int QueueRangeSize = 1000;
            int lowerBound = index > 0 ? ( ( values[ index ] + values[ index - 1 ] ) / 2 ) : values[ 0 ] - QueueRangeSize;
            int upperBound = index < values.Length - 1 ? ( ( values[ index ] + values[ index + 1 ] ) / 2 ) : values[ values.Length - 1 ] + QueueRangeSize;
            return new Vector2Int( lowerBound, upperBound );
        }

        /// <summary>
        /// 找到距离给定渲染排序值最近的枚举值
        /// </summary>
        /// <param name="renderQueue"></param>
        /// <returns></returns>
        protected static RenderQueue FindNearestRenderQueueFromSortValue( int renderQueue ) {
            var curIndex = -1;
            var curDistance = int.MaxValue;
            var values = UnitMaterialEditor.RenderQueueValues;
            for ( int i = values.Length - 1; i >= 0; --i ) {
                var dis = Mathf.Abs( renderQueue - values[ i ] );
                if ( dis == 0 ) {
                    // 完全匹配
                    return ( RenderQueue )values[ i ];
                } else {
                    if ( dis < curDistance ) {
                        curIndex = i;
                        curDistance = dis;
                    }
                }
            }
            Debug.Assert( curIndex != -1 );
            return ( RenderQueue )values[ curIndex ];
        }

        protected static void SetAutoRenderQueue( Material material, RenderMode renderingMode, bool fixRenderQueueStrict ) {
            if ( fixRenderQueueStrict ) {
                switch ( renderingMode ) {
                case RenderMode.Opaque:
                    material.renderQueue = ( int )UnityEngine.Rendering.RenderQueue.Geometry;
                    break;
                case RenderMode.Cutout:
                case RenderMode.ColorKey:
                    material.renderQueue = ( int )UnityEngine.Rendering.RenderQueue.AlphaTest;
                    break;
                case RenderMode.Transparent:
                case RenderMode.SoftAdditive:
                case RenderMode.Additive:
                    material.renderQueue = ( int )UnityEngine.Rendering.RenderQueue.Transparent;
                    break;
                }
            } else {
                if ( material.renderQueue < 0 ) {
                    // 根据当前渲染混合模式初始化正确的排序值
                    SetAutoRenderQueue( material, renderingMode, true );
                }
                Debug.Assert( material.renderQueue >= 0 );
                var nearstRenderQueue = FindNearestRenderQueueFromSortValue( material.renderQueue );
                if ( nearstRenderQueue == RenderQueue.Overlay || nearstRenderQueue == RenderQueue.Background ) {
                    // 用户通过面板设置了不在当前支持的混合模式的排序区间
                    return;
                }
                // 当前所属的渲染队列和当先混合模式不匹配，需要重置
                var queueMatched = true;
                switch ( nearstRenderQueue ) {
                case RenderQueue.Geometry:
                case RenderQueue.GeometryLast:
                    queueMatched = renderingMode == RenderMode.Opaque;
                    break;
                case RenderQueue.AlphaTest:
                    queueMatched = renderingMode == RenderMode.ColorKey || renderingMode == RenderMode.Cutout;
                    break;
                case RenderQueue.Transparent:
                    queueMatched = renderingMode == RenderMode.Transparent || renderingMode == RenderMode.SoftAdditive || renderingMode == RenderMode.Additive;
                    break;
                }
                var range = GetRenderQueueRange( nearstRenderQueue );
                if ( !queueMatched || material.renderQueue < range.x || material.renderQueue > range.y ) {
                    // 超界，重置渲染排序队列值
                    var oldQueue = material.renderQueue;
                    SetAutoRenderQueue( material, renderingMode, true );
                    Debug.LogWarningFormat( "Fix RenderQueue {0}:{1} => {2}, RenderMode = {3}", nearstRenderQueue, oldQueue, material.renderQueue, renderingMode );
                }
            }
        }

        protected virtual void SetupMaterialWithRenderingMode( Material material, bool modeChanged = true, bool fixRenderQueueStrict = true ) {
            var ok = false;
            while ( !ok ) {
                switch ( _Mode ) {
                case RenderMode.Opaque:
                    material.SetOverrideTag( "RenderType", "Opaque" );
                    _Mode = RenderMode.Opaque;
                    _BlendOp = BlendOp.Add;
                    _SrcBlend = BlendMode.One;
                    _DstBlend = BlendMode.Zero;
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
                    if ( _AlphaPremultiply ) {
                        _SrcBlend = BlendMode.One;
                        SetKeyword( material, "_ALPHAPREMULTIPLY_ON", true );
                    } else {
                        _SrcBlend = BlendMode.SrcAlpha;
                        SetKeyword( material, "_ALPHAPREMULTIPLY_ON", false );
                    }
                    _DstBlend = BlendMode.OneMinusSrcAlpha;
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
                    if ( _AlphaPremultiply ) {
                        _SrcBlend = BlendMode.One;
                        SetKeyword( material, "_ALPHAPREMULTIPLY_ON", true );
                    } else {
                        _SrcBlend = BlendMode.SrcAlpha;
                        SetKeyword( material, "_ALPHAPREMULTIPLY_ON", false );
                    }
                    _DstBlend = BlendMode.One;
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
                    _SrcBlend = BlendMode.OneMinusDstColor;
                    _DstBlend = BlendMode.One;
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
                GUI.enabled = m_keep.HasValue == false;
                var renderingMode = ( RenderMode )EditorGUILayout.EnumPopup( "Render Mode", oldMode, GUILayout.MinWidth( 200 ) );
                GUI.enabled = true;
                EditorGUI.indentLevel++;
                if ( m_prop_AutoRenderQueue != null ) {
                    m_MaterialEditor.ShaderProperty( m_prop_AutoRenderQueue, m_prop_AutoRenderQueue.displayName );
                }
                if ( m_prop_AlphaPremultiply != null && IsTransparentMode( _Mode ) ) {
                    m_MaterialEditor.ShaderProperty( m_prop_AlphaPremultiply, m_prop_AlphaPremultiply.displayName );
                }
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
                    if ( m_prop_ZWrite != null ) {
                        m_prop_ZWrite.floatValue = EditorGUILayout.Toggle( m_prop_ZWrite.displayName, m_prop_ZWrite.floatValue > 0 ) ? 1 : 0;
                    }
                    if ( m_prop_ZTest != null ) {
                        var a = ( ZTest )EditorGUILayout.EnumPopup( m_prop_ZTest.displayName, ( ZTest )m_prop_ZTest.floatValue );
                        m_prop_ZTest.floatValue = ( float )a;
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

        public static UnitMaterialEditor Create( UnitMaterialEditor.PropEditorSettings s ) {
            return new ShaderGUI_RenderMode();
        }
    }
}
