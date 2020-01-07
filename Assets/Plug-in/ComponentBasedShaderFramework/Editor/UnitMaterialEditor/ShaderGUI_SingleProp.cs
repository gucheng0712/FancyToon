using System;
using UnityEditor;
using UnityEngine;
using UnityEngine.Rendering;
using AresEditor;

namespace ArtistKit {

    public class ShaderGUI_SingleProp : UnitMaterialEditor {

        enum Precision {
            Default = 0,
            Low = 8,
            Half = 16,
            High = 32,
        }

        String m_propName = String.Empty;
        String m_label = String.Empty;
        String m_guiType = String.Empty;
        bool m_autoReset = true;
        bool? m_dirty = null;
        MaterialProperty m_prop = null;
        object m_keep = null;
        int m_precision = 0;

        public String propName {
            get {
                return m_propName ?? String.Empty;
            }
        }

        static float DrawRangeProperty( Rect position, MaterialProperty prop, float value, String label, float left, float right, int step = 0 ) {
            EditorGUI.showMixedValue = prop.hasMixedValue;
            float labelWidth = EditorGUIUtility.labelWidth;
            EditorGUIUtility.labelWidth = 0f;
            float floatValue = EditorGUI.Slider( position, label, value, left, right );
            floatValue = _RoundFloat( floatValue, step );
            EditorGUI.showMixedValue = false;
            EditorGUIUtility.labelWidth = labelWidth;
            return floatValue;
        }

        static Vector3? GetDefaultRange( Shader shader, String name ) {
            var index = ShaderUtils.FindPropertyIndex( shader, name, ShaderUtil.ShaderPropertyType.Range );
            if ( index >= 0 ) {
                return new Vector3(
                    ShaderUtil.GetRangeLimits( shader, index, 0 ),
                    ShaderUtil.GetRangeLimits( shader, index, 1 ),
                    ShaderUtil.GetRangeLimits( shader, index, 2 ) );
            } else {
                index = ShaderUtils.FindPropertyIndex( shader, name, ShaderUtil.ShaderPropertyType.Float );
                if ( index >= 0 ) {
                    return new Vector3( ShaderUtil.GetRangeLimits( shader, index, 0 ), float.MinValue, float.MaxValue );
                }
            }
            return null;
        }

        void ResetToDefaultValue( Material template ) {
            if ( m_prop != null && template != null && !IsEmptyShader( template.shader ) && template.HasProperty( m_prop.name ) ) {
                var propType = FindShaderPropertyType( template.shader, m_prop.name );
                if ( propType != null ) {
                    switch ( propType.Value ) {
                    case ShaderUtil.ShaderPropertyType.Range:
                    case ShaderUtil.ShaderPropertyType.Float:
                        if ( m_prop.type == MaterialProperty.PropType.Float ||
                            m_prop.type == MaterialProperty.PropType.Range ) {
                            var _defalueVal = GetDefaultRange( template.shader, m_prop.name );
                            if ( _defalueVal != null ) {
                                m_prop.floatValue = _RoundFloat( _defalueVal.Value.x, _defalueVal.Value );
                                Debug.AssertFormat( m_prop.floatValue == _defalueVal.Value.x,
                                    "{0} = {1}/[{2}]", m_prop.name, m_prop.floatValue, _defalueVal.Value.x );
                            }
                        }
                        break;
                    case ShaderUtil.ShaderPropertyType.Color: {
                            if ( m_prop.type == MaterialProperty.PropType.Color ) {
                                var srcValue = template.GetColor( m_prop.name );
                                if ( m_guiType != null && m_guiType.StartsWith( Cfg.Value_PropGUIType_ColorPrefix ) ) {
                                    var dst = m_prop.colorValue;
                                    switch ( m_guiType ) {
                                    case Cfg.Value_PropGUIType_ColorR:
                                        dst.r = _RoundColorFixed( srcValue.r, m_precision );
                                        Debug.AssertFormat( dst.r == srcValue.r, "{0} = {1}/[{2}]", m_prop.name, dst.r, srcValue.r );
                                        break;
                                    case Cfg.Value_PropGUIType_ColorG:
                                        dst.g = _RoundColorFixed( srcValue.g, m_precision );
                                        Debug.AssertFormat( dst.g == srcValue.g, "{0} = {1}/[{2}]", m_prop.name, dst.g, srcValue.g );
                                        break;
                                    case Cfg.Value_PropGUIType_ColorB:
                                        dst.b = _RoundColorFixed( srcValue.b, m_precision );
                                        Debug.AssertFormat( dst.b == srcValue.b, "{0} = {1}/[{2}]", m_prop.name, dst.b, srcValue.b );
                                        break;
                                    case Cfg.Value_PropGUIType_ColorA:
                                        dst.a = _RoundColorFixed( srcValue.a, m_precision );
                                        Debug.AssertFormat( dst.a == srcValue.a, "{0} = {1}/[{2}]", m_prop.name, dst.a, srcValue.a );
                                        break;
                                    }
                                    m_prop.colorValue = dst;
                                } else {
                                    m_prop.colorValue = srcValue;
                                }
                            }
                        }
                        break;
                    case ShaderUtil.ShaderPropertyType.Vector:
                        if ( m_prop.type == MaterialProperty.PropType.Vector ) {
                            m_prop.vectorValue = template.GetVector( m_prop.name );
                        }
                        break;
                    case ShaderUtil.ShaderPropertyType.TexEnv:
                        if ( m_prop.type == MaterialProperty.PropType.Texture ) {
                            m_prop.textureValue = template.GetTexture( m_prop.name );
                            m_prop.textureScaleAndOffset = template.GetTextureScaleOffset( m_prop.name );
                        }
                        break;
                    }
                }
            }
        }

        public void DrawGUI( Material material ) {
            if ( !ShaderGUIHelper.IsModeMatched( this, m_args ) || !GetBoolTestResult( material, null ) ) {
                if ( m_autoReset && m_parent.template != null ) {
                    if ( m_dirty == null || m_dirty.Value == true ) {
                        m_dirty = false;
                        ResetToDefaultValue( m_parent.template );
                    }
                }
                return;
            }
            m_dirty = true;
            var gui_enabled = GUI.enabled;
            try {
                GUI.enabled = m_keep == null;
                if ( !GUI.enabled && ( m_prop.flags & MaterialProperty.PropFlags.HideInInspector ) != 0 ) {
                    return;
                }
                m_MaterialEditor.SetDefaultGUIWidths();
                var label = m_label ?? m_prop.displayName;
                float h = m_MaterialEditor.GetPropertyHeight( m_prop, label );
                Rect r = EditorGUILayout.GetControlRect( true, h, EditorStyles.layerMaskField );
                for (; ; ) {
                    if ( m_guiType == Cfg.Value_PropGUIType_Toggle && ( m_prop.type == MaterialProperty.PropType.Float || m_prop.type == MaterialProperty.PropType.Range ) ) {
                        m_prop.floatValue = EditorGUI.Toggle( r, label, m_prop.floatValue > 0 ) ? 1 : 0;
                        break;
                    }
                    if ( m_guiType == Cfg.Value_PropGUIType_Rect && ( m_prop.type == MaterialProperty.PropType.Vector ) ) {
                        var v = m_prop.vectorValue;
                        var bounds = new Rect();
                        bounds.xMin = v.x;
                        bounds.xMax = v.y;
                        bounds.yMin = v.z;
                        bounds.yMax = v.w;
                        EditorGUI.LabelField( r, m_prop.displayName );
                        EditorGUI.indentLevel++;
                        bounds = EditorGUILayout.RectField( bounds );
                        EditorGUI.indentLevel--;
                        m_prop.vectorValue = new Vector4( bounds.xMin, bounds.xMax, bounds.yMin, bounds.yMax );
                        break;
                    }
                    if ( m_prop.type == MaterialProperty.PropType.Color ) {
                        var precision = m_precision;
                        if ( precision <= 0 ) {
                            precision = 256;
                        }
                        if ( m_guiType == Cfg.Value_PropGUIType_ColorR ) {
                            var c = m_prop.colorValue;
                            c.r = DrawRangeProperty( r, m_prop, m_prop.colorValue.r, label, 0, 1, precision );
                            m_prop.colorValue = c;
                            break;
                        } else if ( m_guiType == Cfg.Value_PropGUIType_ColorG ) {
                            var c = m_prop.colorValue;
                            c.g = DrawRangeProperty( r, m_prop, m_prop.colorValue.g, label, 0, 1, precision );
                            m_prop.colorValue = c;
                            break;
                        } else if ( m_guiType == Cfg.Value_PropGUIType_ColorB ) {
                            var c = m_prop.colorValue;
                            c.b = DrawRangeProperty( r, m_prop, m_prop.colorValue.b, label, 0, 1, precision );
                            m_prop.colorValue = c;
                            break;
                        } else if ( m_guiType == Cfg.Value_PropGUIType_ColorA ) {
                            var c = m_prop.colorValue;
                            c.a = DrawRangeProperty( r, m_prop, m_prop.colorValue.a, label, 0, 1, precision );
                            m_prop.colorValue = c;
                            break;
                        }
                    }
                    m_MaterialEditor.ShaderProperty( r, m_prop, label );
                    if ( m_precision >= 0 ) {
                        var range = new Vector3( 0, float.MinValue, float.MaxValue );
                        if ( m_prop.type == MaterialProperty.PropType.Float ) {
                            var index = ShaderUtils.FindPropertyIndex( material.shader, m_prop.name, ShaderUtil.ShaderPropertyType.Float );
                            if ( index >= 0 ) {
                                range.x = ShaderUtil.GetRangeLimits( material.shader, index, 0 );
                            }
                            m_prop.floatValue = _RoundFloat( m_prop.floatValue, range );
                        } else if ( m_prop.type == MaterialProperty.PropType.Range ) {
                            range.y = m_prop.rangeLimits.x;
                            range.z = m_prop.rangeLimits.y;
                            var index = ShaderUtils.FindPropertyIndex( material.shader, m_prop.name, ShaderUtil.ShaderPropertyType.Range );
                            if ( index >= 0 ) {
                                range.x = ShaderUtil.GetRangeLimits( material.shader, index, 0 );
                            }
                            m_prop.floatValue = _RoundFloat( m_prop.floatValue, range );
                        } else if ( m_prop.type == MaterialProperty.PropType.Color ) {
                            if ( m_parent.template != null ) {
                                var _type = FindShaderPropertyType( m_parent.template.shader, m_prop.name );
                                if ( _type != null && _type.Value == ShaderUtil.ShaderPropertyType.Color ) {
                                    var defaultColor = m_parent.template.GetColor( m_prop.name );
                                    var c = m_prop.colorValue;
                                    c.r = _RoundColorFixed( c.r, new Vector3( defaultColor.r, 0, 1 ), m_precision );
                                    c.g = _RoundColorFixed( c.r, new Vector3( defaultColor.g, 0, 1 ), m_precision );
                                    c.b = _RoundColorFixed( c.r, new Vector3( defaultColor.b, 0, 1 ), m_precision );
                                    c.a = _RoundColorFixed( c.r, new Vector3( defaultColor.a, 0, 1 ), m_precision );
                                }
                            }
                        }
                    }
                    break;
                }
            } finally {
                GUI.enabled = gui_enabled;
            }
            m_MaterialEditor.SetDefaultGUIWidths();
        }

        protected override void OnDrawPropertiesGUI( Material material, MaterialProperty[] props ) {
            DrawGUI( material );
        }

        float _RoundFloat( float value ) {
            if ( m_precision <= 0 ) {
                return value;
            }
            return ( float )( Math.Round( value * m_precision ) ) / m_precision;
        }

        float _RoundFloat( float value, Vector3 defaultRange ) {
            if ( value <= defaultRange.y ) {
                return defaultRange.y;
            }
            if ( value >= defaultRange.z ) {
                return defaultRange.z;
            }
            if ( m_precision > 0 ) {
                value = ( float )( Math.Round( ( value - defaultRange.x ) * m_precision ) ) / m_precision + defaultRange.x;
            }
            value = Mathf.Clamp( value, defaultRange.y, defaultRange.z );
            return value;
        }

        static float _RoundFloat( float value, int step ) {
            if ( step <= 0 ) {
                return value;
            }
            return ( float )( Math.Round( value * step ) ) / step;
        }

        static float _RoundColorFixed( float value, Vector3 defaultRange, int precision ) {
            if ( value <= defaultRange.y ) {
                return defaultRange.y;
            }
            if ( value >= defaultRange.z ) {
                return defaultRange.z;
            }
            if ( precision > 0 ) {
                value = ( float )( Math.Round( ( value - defaultRange.x ) * precision ) ) / precision + defaultRange.x;
            }
            value = Mathf.Clamp( value, defaultRange.y, defaultRange.z );
            return value;
        }

        static float _RoundColorFixed( float value, int step = 256 ) {
            if ( value <= 0 ) {
                return 0;
            }
            if ( value >= 1 ) {
                return 1;
            }
            return step > 0 ? Mathf.Clamp01( ( float )( Math.Round( value * step ) ) / step ) : value;
        }

        void ParsePrecision() {
            var _precision = m_args.GetField( Cfg.Key_Precision );
            if ( _precision == null ) {
                _precision = m_args.GetField( "grade" );
            }
            if ( _precision != null ) {
                if ( _precision.IsNumber ) {
                    m_precision = ( int )_precision.i;
                } else if ( _precision.IsString ) {
                    switch ( _precision.str.ToLower() ) {
                    case Cfg.Value_Precision_Low:
                        m_precision = ( int )Precision.Low;
                        break;
                    case Cfg.Value_Precision_Half:
                        m_precision = ( int )Precision.Half;
                        break;
                    case Cfg.Value_Precision_High:
                        m_precision = ( int )Precision.High;
                        break;
                    }
                }
            }
            CheckPrecisionLevel();
        }

        void CheckPrecisionLevel() {
            if ( m_prop == null ) {
                return;
            }
            var _precision = m_precision;
            if ( m_precision > 0 ) {
                m_precision = Mathf.NextPowerOfTwo( m_precision );
            }
            var precision = m_precision;
            if ( precision > 0 && m_prop.type == MaterialProperty.PropType.Color ) {
                precision = Mathf.Clamp( precision, 2, 256 );
                m_precision = precision;
                Debug.Assert( Mathf.IsPowerOfTwo( m_precision ) );
            }
            if ( m_precision != _precision ) {
                Debug.LogWarningFormat( "fix {0}'s precision {1} -> {2}", m_prop.name, _precision, m_precision );
            }
        }

        protected override bool OnInitProperties( MaterialProperty[] props ) {
            m_prop = FindCachedProperty( m_propName, props );
            m_keep = null;
            if ( m_prop != null && m_args != null ) {
                if ( ShaderGUIHelper.ParseValue( this, m_args, Cfg.Key_PropGUIType, out m_guiType ) ) {
                    m_guiType = m_guiType.ToLower();
                }
                ShaderGUIHelper.ParseValue( this, m_args, Cfg.Key_GUILabel, out m_label );
                ParsePrecision();
                if ( !ShaderGUIHelper.ParseValue( this, m_args, Cfg.Key_AutoResetValue, out m_autoReset ) ) {
                    m_autoReset = true;
                }
                m_label = String.IsNullOrEmpty( m_label ) ? null : m_label;
                while ( m_args.HasField( Cfg.Key_FixedValue ) ) {
                    var material = this.materialEditor.target as Material;
                    var enable_if = TryGetBoolTestResult( material, props, Cfg.Key_FixedIfValue );
                    if ( enable_if != null && enable_if.Value == false ) {
                        break;
                    }
                    switch ( m_prop.type ) {
                    case MaterialProperty.PropType.Float:
                    case MaterialProperty.PropType.Range: {
                            float val;
                            if ( ShaderGUIHelper.ParseValue( this, m_args, Cfg.Key_FixedValue, out val ) ) {
                                var _defalueVal = GetDefaultRange( material.shader, m_prop.name );
                                if ( _defalueVal != null ) {
                                    m_prop.floatValue = _RoundFloat( val, _defalueVal.Value );
                                    Debug.AssertFormat( m_prop.floatValue == val, "{0} = {1}/[{2}]",
                                        m_prop.name, m_prop.floatValue, val );
                                }
                                m_keep = m_prop.floatValue;
                            }
                        }
                        break;
                    case MaterialProperty.PropType.Color: {
                            Vector4 val;
                            int mask;
                            if ( ShaderGUIHelper.ParseValue( this, m_args, Cfg.Key_FixedValue, out val, out mask ) ) {
                                var _val = m_prop.colorValue;
                                for ( int i = 0; i < 4; ++i ) {
                                    if ( ( mask & ( 1 << i ) ) != 0 ) {
                                        _val[ i ] = _RoundColorFixed( val[ i ], m_precision );
                                    }
                                }
                                m_prop.colorValue = _val;
                                m_keep = _val;
                            }
                        }
                        break;
                    case MaterialProperty.PropType.Vector: {
                            Vector4 val;
                            int mask;
                            if ( ShaderGUIHelper.ParseValue( this, m_args, Cfg.Key_FixedValue, out val, out mask ) ) {
                                var _val = m_prop.vectorValue;
                                for ( int i = 0; i < 4; ++i ) {
                                    if ( ( mask & ( 1 << i ) ) != 0 ) {
                                        _val[ i ] = _RoundFloat( val[ i ] );
                                    }
                                }
                                m_prop.vectorValue = _val;
                                m_keep = _val;
                            }
                        }
                        break;
                    case MaterialProperty.PropType.Texture: {
                            String val;
                            if ( ShaderGUIHelper.ParseValue( this, m_args, Cfg.Key_FixedValue, out val ) ) {
                                var tex = AssetDatabase.LoadAssetAtPath<Texture>( val );
                                if ( tex != null ) {
                                    m_prop.textureValue = tex;
                                    m_keep = tex;
                                } else {
                                    m_prop.textureValue = null;
                                }
                            }
                        }
                        break;
                    }
                    break;
                }
            }
            if ( m_prop == null ) {
                var mat = this.materialEditor.target as Material;
                if ( mat != null && mat.shader != null ) {
                    Debug.LogErrorFormat( "Find Shader Property failed: {0}.{1}. \n{2}",
                        mat.shader.name, m_propName, AssetDatabase.GetAssetPath( mat ) );
                }
            }
            return m_prop != null;
        }

        public static UnitMaterialEditor Create( UnitMaterialEditor.PropEditorSettings s ) {
            var ret = new ShaderGUI_SingleProp();
            ret.m_propName = s.name;
            return ret;
        }
    }
}
