using System;
using UnityEditor;
using UnityEngine;
using UnityEngine.Rendering;
using ArtistKit.UnitShaderGUIAttribute;

namespace ArtistKit {

    [AllowMultiple]
    public class ShaderGUI_Logic : UnitMaterialEditor {

        public override bool GetLogicOpResult( out String returnValue, MaterialProperty[] props ) {
            returnValue = "false";
            if ( ShaderGUIHelper.IsModeMatched( this, m_args ) &&
                ShaderGUIHelper.ExcuteLogicOp( this, null, props, m_args ) == 1 ) {
                returnValue = "true";
                return true;
            }
            return false;
        }

        protected override String ComputeReturnValue( MaterialProperty[] props ) {
            String returnValue;
            GetLogicOpResult( out returnValue, props );
            return returnValue;
        }

        protected override bool OnInitProperties( MaterialProperty[] props ) {
            return true;
        }

        public static UnitMaterialEditor Create( UnitMaterialEditor.PropEditorSettings s ) {
            var ret = new ShaderGUI_Logic();
            ret.m_MaterialEditor = s.parent.materialEditor;
            ret.m_parent = s.parent;
            return ret;
        }
    }
}
