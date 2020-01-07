using System;
using UnityEditor;
using UnityEngine;
using UnityEngine.Rendering;

namespace ArtistKit {

    public class ShaderGUI_GetTextureAssetPath : UnitMaterialEditor {

        String m_propName = String.Empty;
        MaterialProperty m_prop = null;

        public override bool GetLogicOpResult( out String returnValue, MaterialProperty[] props ) {
            returnValue = ComputeReturnValue( props );
            return true;
        }

        protected override bool OnInitProperties( MaterialProperty[] props ) {
            m_prop = FindProperty( m_propName, props );
            return m_prop != null;
        }

        protected override String ComputeReturnValue( MaterialProperty[] props ) {
            if ( m_prop != null && m_prop.type == MaterialProperty.PropType.Texture ) {
                var texture = m_prop.textureValue;
                if ( texture != null ) {
                    var assetPath = AssetDatabase.GetAssetPath( texture );
                    if ( !String.IsNullOrEmpty( assetPath ) ) {
                        return assetPath;
                    }
                }
            }
            return "null";
        }

        public static UnitMaterialEditor Create( UnitMaterialEditor.PropEditorSettings s ) {
            var ret = new ShaderGUI_GetTextureAssetPath();
            ret.m_propName = s.name;
            return ret;
        }

    }
}
