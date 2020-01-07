using System;
using System.Collections.Generic;
using System.Linq;
using UnityEditor;
using UnityEngine;
using UnityEngine.Rendering;
using System.Text.RegularExpressions;
using System.Text;
using ArtistKit.UnitShaderGUIAttribute;
using FGDKit.Base;

namespace ArtistKit {

    [AllowMultiple]
    public class ShaderGUI_Initializer : UnitMaterialEditor {

        static List<ShaderGUI_Initializer> s_allInitializers = new List<ShaderGUI_Initializer>();
        static HashSet<String> s_shaderFeaturesTable = new HashSet<String>();
        static List<KeyValuePair<String, bool>> s_allShaderFeatures = new List<KeyValuePair<String, bool>>();
        static String s_allShaderFeaturesText = String.Empty;

        List<String> m_featureList = null;

        protected override bool OnInitProperties( MaterialProperty[] props ) {
            if ( m_args != null && props.Length > 0 ) {
                var material = this.m_MaterialEditor.target as Material;
                if ( ShaderGUIHelper.IsModeMatched( this, m_args ) && GetBoolTestResult( material, props ) ) {
                    var values = m_args.GetField( "values" );
                    if ( values != null && values.type == JSONObject.Type.OBJECT ) {
                        for ( int i = 0; i < values.keys.Count; ++i ) {
                            var key = values.keys[ i ];
                            var value = values.GetField( key );
                            var prop = ShaderGUI.FindProperty( key, props );
                            if ( prop != null && !String.IsNullOrEmpty( key ) && value != null ) {
                                switch ( prop.type ) {
                                case MaterialProperty.PropType.Float: {
                                        float f;
                                        if ( ShaderGUIHelper.ParseValue( this, values, key, out f ) ) {
                                            prop.floatValue = f;
                                        }
                                    }
                                    break;
                                case MaterialProperty.PropType.Range: {
                                        float f;
                                        if ( ShaderGUIHelper.ParseValue( this, values, key, out f ) ) {
                                            prop.floatValue = Mathf.Clamp( f, prop.rangeLimits.x, prop.rangeLimits.y );
                                        }
                                    }
                                    break;
                                case MaterialProperty.PropType.Color: {
                                        Vector4 c = prop.colorValue;
                                        int comp;
                                        if ( ShaderGUIHelper.TryParseVector4( this, values, key, ref c, out comp ) ) {
                                            if ( ( prop.flags & MaterialProperty.PropFlags.HDR ) != 0 ) {
                                                c.x = Mathf.Clamp01( c.x );
                                                c.y = Mathf.Clamp01( c.y );
                                                c.z = Mathf.Clamp01( c.z );
                                                c.w = Mathf.Clamp01( c.w );
                                            }
                                            prop.colorValue = new Color( c.x, c.y, c.z, c.w );
                                        }
                                    }
                                    break;
                                case MaterialProperty.PropType.Vector: {
                                        Vector4 v = prop.colorValue;
                                        int comp;
                                        if ( ShaderGUIHelper.TryParseVector4( this, values, key, ref v, out comp ) ) {
                                            prop.vectorValue = v;
                                        }
                                    }
                                    break;
                                }
                            }
                        }
                    }
                }
                var features = m_args.GetField( "shader_feature_list" );
                if ( features != null && features.type == JSONObject.Type.ARRAY ) {
                    var features_list = new List<String>( features.list.Count );
                    for ( int i = 0; i < features.list.Count; ++i ) {
                        var o = features.list[ i ];
                        if ( o != null && o.type == JSONObject.Type.STRING &&
                            !String.IsNullOrEmpty( o.str ) ) {
                            features_list.Add( o.str );
                        }
                    }
                    for ( int i = 0; i < BlendModeNames.Length; ++i ) {
                        features_list.Add( "_MODE_" + BlendModeNames[ i ].ToUpper() );
                    }
                    features_list.Add( "_BLEND_ADDITIVE_SERIES" );
                    features_list.Add( "_ALPHAPREMULTIPLY_ON" );

                    m_featureList = features_list.Distinct().ToList();
                }
            }
            return true;
        }

        protected override void OnDrawPropertiesGUI( Material material, MaterialProperty[] props ) {
            if ( s_allInitializers[ 0 ] != this ) {
                return;
            }
            var allShaderFeatures = s_allShaderFeatures;
            var targets = this.m_MaterialEditor.targets;
            for ( int n = 0; n < targets.Length; ++n ) {
                var _material = targets[ n ] as Material;
                for ( int i = 0; i < allShaderFeatures.Count; ++i ) {
                    var state = _material.IsKeywordEnabled( allShaderFeatures[ i ].Key );
                    if ( state != allShaderFeatures[ i ].Value ) {
                        // mark as dirty
                        s_allShaderFeaturesText = String.Empty;
                        allShaderFeatures[ i ] = new KeyValuePair<String, bool>( allShaderFeatures[ i ].Key, state );
                    }
                }
            }
            if ( String.IsNullOrEmpty( s_allShaderFeaturesText ) ) {
                var sb = new StringBuilder();
                for ( int i = 0; i < allShaderFeatures.Count; ++i ) {
                    var state = allShaderFeatures[ i ];
                    if ( sb.Length > 0 ) {
                        sb.AppendLine();
                    }
                    if ( state.Value ) {
                        sb.AppendFormat( "<b><color=green>{0}</color></b>", state.Key );
                    } else {
                        sb.Append( state.Key );
                    }
                }
                if ( sb.Length == 0 ) {
                    sb.Append( "--" );
                }
                s_allShaderFeaturesText = sb.ToString();
            }
            if ( !String.IsNullOrEmpty( s_allShaderFeaturesText ) ) {
                m_MaterialEditor.SetDefaultGUIWidths();
                EditorGUILayout.BeginVertical();
                var style = GUI.skin.GetStyle( "HelpBox" );
                var _richText = style.richText;
                style.richText = true;
                EditorGUILayout.HelpBox( s_allShaderFeaturesText, MessageType.None );
                if ( Event.current.type == EventType.MouseDown &&
                    GUILayoutUtility.GetLastRect().Contains( Event.current.mousePosition ) ) {
                    if ( Event.current.button == 1 ) {
                        var menu = new GenericMenu();
                        menu.AddItem(
                            new GUIContent( "ClearCurrentShaderVariantCollection" ), false,
                            () => {
                                Utils.RflxStaticCall(
                                    "UnityEditor.ShaderUtil",
                                    "ClearCurrentShaderVariantCollection",
                                    null, "UnityEditor" );
                            }
                        );
                        menu.AddItem(
                            new GUIContent( "Report Current Collection" ), false,
                            () => {
                                Debug.developerConsoleVisible = true;
                                UnityEditor.EditorApplication.ExecuteMenuItem( "Window/General/Console" );
                                var shaderCount = Utils.RflxStaticCall(
                                    "UnityEditor.ShaderUtil",
                                    "GetCurrentShaderVariantCollectionShaderCount",
                                    null, "UnityEditor" );
                                var shaderVariantCount = Utils.RflxStaticCall(
                                    "UnityEditor.ShaderUtil",
                                    "GetCurrentShaderVariantCollectionVariantCount",
                                    null, "UnityEditor" );
                                Debug.LogFormat( "Currently tracked: {0} shaders {1} total variants.",
                                    shaderCount, shaderVariantCount );
                            }
                        );
                        if ( menu.GetItemCount() > 0 ) {
                            Event.current.Use();
                            menu.ShowAsContext();
                        }
                    }
                }
                style.richText = _richText;
                EditorGUILayout.EndVertical();
                m_MaterialEditor.SetDefaultGUIWidths();
            }
        }

        protected override void OnPostInitProperties() {
            s_allInitializers.Clear();
            // 整合所有的初始化器，合并ShaderFeatures
            FindPropEditors<ShaderGUI_Initializer>( s_allInitializers );
            if ( this != s_allInitializers[ 0 ] ) {
                // 只在第一个初始化器中处理
                return;
            }
            s_allShaderFeaturesText = String.Empty;
            s_shaderFeaturesTable.Clear();
            s_allShaderFeatures.Clear();
            // 整合所有支持的ShaderFeature
            for ( int i = 0; i < s_allInitializers.Count; ++i ) {
                var list = s_allInitializers[ i ].m_featureList;
                if ( list != null ) {
                    for ( int j = 0; j < list.Count; ++j ) {
                        if ( s_shaderFeaturesTable.Add( list[ j ] ) ) {
                            s_allShaderFeatures.Add( new KeyValuePair<String, bool>( list[ j ], true ) );
                        }
                    }
                }
            }
            s_allShaderFeatures.Sort( ( l, r ) => l.Key.CompareTo( r.Key ) );
            var allShaderFeatures = s_allShaderFeatures;
            if ( allShaderFeatures.Count > 0 ) {
                var targets = this.m_MaterialEditor.targets;
                for ( int n = 0; n < targets.Length; ++n ) {
                    var material = targets[ n ] as Material;
                    var keywords = new List<String>( material.shaderKeywords );
                    List<String> dirty = null;
                    for ( int i = keywords.Count - 1; i >= 0; --i ) {
                        var keyword = keywords[ i ];
                        var keywordIndex = -1;
                        if ( ( keywordIndex = allShaderFeatures.FindIndex( keyword, ( e, k ) => e.Key == k ) ) < 0 ) {
                            dirty = dirty ?? new List<String>();
                            dirty.Add( keywords[ i ] );
                            keywords.RemoveAt( i );
                        } else {
                            allShaderFeatures[ keywordIndex ] = new KeyValuePair<String, bool>( keyword, true );
                        }
                    }
                    if ( dirty != null ) {
                        Debug.LogErrorFormat(
                            "[{0}]{1}: Remove useless keywords: {2}",
                            AssetDatabase.GetAssetPath( material ),
                            material.shader.name,
                            String.Join( ";", dirty.ToArray() )
                        );
                        material.shaderKeywords = keywords.ToArray();
                        EditorUtility.SetDirty( material );
                    }
                }
            }
        }

        public static UnitMaterialEditor Create( UnitMaterialEditor.PropEditorSettings s ) {
            return new ShaderGUI_Initializer();
        }
    }
}
