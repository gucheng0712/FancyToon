using System;
using UnityEditor;
using UnityEngine;
using UnityEngine.Rendering;
using ArtistKit.UnitShaderGUIAttribute;

namespace ArtistKit {

    [AllowMultiple]
    public class ShaderGUI_Eval : UnitMaterialEditor {

        String m_propName = String.Empty;
        MaterialProperty m_prop = null;

        public override bool GetLogicOpResult( out String returnValue, MaterialProperty[] props ) {
            returnValue = String.Empty;
            if ( m_prop != null ) {
                return ShaderGUIHelper.IsModeMatched( this, m_args ) &&
                    ShaderGUIHelper.ExcuteLogicOp( this, m_prop, props, m_args ) == 1;
            } else {
                return ShaderGUIHelper.IsModeMatched( this, m_args ) &&
                    GetBoolTestResult( m_MaterialEditor.target as Material, props );
            }
        }

        protected override bool OnInitProperties( MaterialProperty[] props ) {
            m_prop = ShaderGUI.FindProperty( m_propName, props, false );
            return true;
        }

        public static UnitMaterialEditor Create( UnitMaterialEditor.PropEditorSettings s ) {
            var ret = new ShaderGUI_Eval();
            ret.m_propName = s.name;
            return ret;
        }
    }
}
