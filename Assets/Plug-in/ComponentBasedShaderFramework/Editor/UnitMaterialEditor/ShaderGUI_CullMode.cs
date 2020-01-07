using System;
using UnityEditor;
using UnityEngine;
using UnityEngine.Rendering;

namespace ArtistKit {

    public class ShaderGUI_CullMode : UnitMaterialEditor {

        String m_propName = String.Empty;
        String m_label = String.Empty;
        MaterialProperty m_prop = null;
        MaterialProperty m_invertProp = null;
        object m_keep = null;

        public String propName {
            get {
                return m_propName ?? String.Empty;
            }
        }

        public void DrawGUI( Material material ) {
            if ( !ShaderGUIHelper.IsModeMatched( this, m_args ) || !GetBoolTestResult( material, null ) ) {
                return;
            }
            var gui_enabled = GUI.enabled;
            try {
                GUI.enabled = m_keep == null && m_invertProp == null;
                if ( !GUI.enabled && ( m_prop.flags & MaterialProperty.PropFlags.HideInInspector ) != 0 ) {
                    return;
                }
                m_MaterialEditor.SetDefaultGUIWidths();
                var label = m_label ?? m_prop.displayName;
                float h = m_MaterialEditor.GetPropertyHeight( m_prop, label );
                Rect r = EditorGUILayout.GetControlRect( true, h, EditorStyles.layerMaskField );
                for (; ; ) {
                    if ( m_invertProp != null ) {
                        var mode = ( CullMode )( int )m_invertProp.floatValue;
                        switch ( mode ) {
                        case CullMode.Off:
                            m_prop.floatValue = ( float )CullMode.Off;
                            break;
                        case CullMode.Front:
                            m_prop.floatValue = ( float )CullMode.Back;
                            break;
                        case CullMode.Back:
                            m_prop.floatValue = ( float )CullMode.Front;
                            break;
                        }
                    }
                    m_MaterialEditor.ShaderProperty( r, m_prop, label );
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

        protected override bool OnInitProperties( MaterialProperty[] props ) {
            m_prop = FindCachedProperty( m_propName, props );
            m_keep = null;
            if ( m_prop != null && m_args != null && m_prop.type == MaterialProperty.PropType.Float ) {
                ShaderGUIHelper.ParseValue( this, m_args, Cfg.Key_GUILabel, out m_label );
                m_label = String.IsNullOrEmpty( m_label ) ? null : m_label;
                if ( m_args.HasField( Cfg.Key_FixedValue ) ) {
                    switch ( m_prop.type ) {
                    case MaterialProperty.PropType.Float: {
                            float val;
                            if ( ShaderGUIHelper.ParseValue( this, m_args, Cfg.Key_FixedValue, out val ) ) {
                                int ival = ( int )val;
                                switch ( ival ) {
                                case 0:
                                    m_keep = CullMode.Off;
                                    break;
                                case 1:
                                    m_keep = CullMode.Front;
                                    break;
                                case 2:
                                    m_keep = CullMode.Back;
                                    break;
                                default:
                                    m_keep = CullMode.Back;
                                    break;
                                }
                                m_prop.floatValue = ( float )( CullMode )m_keep;
                            } else {
                                String s;
                                if ( ShaderGUIHelper.ParseValue( this, m_args, Cfg.Key_FixedValue, out s ) ) {
                                    s = s.ToLower();
                                    switch ( s ) {
                                    case "none":
                                    case Cfg.Value_CullMode_Off:
                                        m_keep = CullMode.Off;
                                        break;
                                    case Cfg.Value_CullMode_Front:
                                        m_keep = CullMode.Front;
                                        break;
                                    case Cfg.Value_CullMode_Back:
                                        m_keep = CullMode.Back;
                                        break;
                                    default:
                                        m_keep = CullMode.Back;
                                        break;
                                    }
                                    m_prop.floatValue = ( float )( CullMode )m_keep;
                                }
                            }
                        }
                        break;
                    }
                } else if ( m_args.HasField( Cfg.Command_Value_Invert ) ) {
                    String val;
                    if ( ShaderGUIHelper.ParseValue( this, m_args, Cfg.Command_Value_Invert, out val ) &&
                        !String.IsNullOrEmpty( val ) && val != m_propName ) {
                        var invertProp = FindCachedProperty( val, props, false );
                        if ( invertProp != null && invertProp.type == MaterialProperty.PropType.Float ) {
                            m_invertProp = invertProp;
                        }
                    }
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
            var ret = new ShaderGUI_CullMode();
            ret.m_propName = s.name;
            return ret;
        }
    }
}
