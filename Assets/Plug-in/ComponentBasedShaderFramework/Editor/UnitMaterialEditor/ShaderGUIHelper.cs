using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Text.RegularExpressions;
using UnityEditor;
using UnityEngine;
using UnityEngine.Rendering;
using AresEditor;

namespace ArtistKit {

    public static class ShaderGUIHelper {

        public static bool Compare( String op, int a, int b ) {
            switch ( op ) {
            case "==":
                return a == b;
            case "!=":
                return a != b;
            case "<":
                return a < b;
            case "<=":
                return a <= b;
            case ">":
                return a > b;
            case ">=":
                return a >= b;
            case "&&":
                return a == 1 && b == 1;
            case "||":
                return a == 1 || b == 1;
            }
            return false;
        }

        public static bool Compare( String op, float a, float b ) {
            switch ( op ) {
            case "==":
                return a == b;
            case "!=":
                return a != b;
            case "<":
                return a < b;
            case "<=":
                return a <= b;
            case ">":
                return a > b;
            case ">=":
                return a >= b;
            }
            return false;
        }

        public static bool Compare( String op, String a, String b ) {
            switch ( op ) {
            case "==":
                return a == b;
            case "!=":
                return a != b;
            case "<":
                return a.CompareTo( b ) < 0;
            case "<=":
                return a.CompareTo( b ) <= 0;
            case ">":
                return a.CompareTo( b ) > 0;
            case ">=":
                return a.CompareTo( b ) >= 0;
            }
            return false;
        }

        public static bool Compare( String op, Vector4 a, Vector4 b, int mask = 0xff ) {
            if ( mask == 0 ) {
                return false;
            }
            if ( op == "!=" ) {
                for ( int i = 0; i < 4; ++i ) {
                    if ( ( mask & ( 1 << i ) ) != 0 ) {
                        if ( a[ i ] != b[ i ] ) {
                            return true;
                        }
                    }
                }
                return false;
            } else {
                for ( int i = 0; i < 4; ++i ) {
                    if ( ( mask & ( 1 << i ) ) != 0 ) {
                        switch ( op ) {
                        case "==":
                            if ( a[ i ] != b[ i ] ) {
                                return false;
                            }
                            break;
                        case "<":
                            if ( a[ i ] >= b[ i ] ) {
                                return false;
                            }
                            break;
                        case "<=":
                            if ( a[ i ] > b[ i ] ) {
                                return false;
                            }
                            break;
                        case ">":
                            if ( a[ i ] <= b[ i ] ) {
                                return false;
                            }
                            break;
                        case ">=":
                            if ( a[ i ] < b[ i ] ) {
                                return false;
                            }
                            break;
                        }
                    }
                }
            }
            return true;
        }

        public static bool ParseValue( UnitMaterialEditor gui, JSONObject obj, String fieldName, out String value ) {
            var v = obj.GetField( fieldName );
            if ( v != null && v.type == JSONObject.Type.STRING ) {
                value = v.str;
                return true;
            }
            value = String.Empty;
            return false;
        }

        public static bool ParseValue( UnitMaterialEditor gui, JSONObject obj, String fieldName, out int value ) {
            var v = obj.GetField( fieldName );
            if ( v != null && v.IsNumber ) {
                value = ( int )v.i;
                return true;
            }
            value = 0;
            return false;
        }

        public static bool ParseValue( UnitMaterialEditor gui, JSONObject obj, String fieldName, out bool value ) {
            var v = obj.GetField( fieldName );
            if ( v != null && v.IsBool ) {
                value = v.b;
                return true;
            }
            value = false;
            return false;
        }

        public static bool ParseValue( UnitMaterialEditor gui, JSONObject obj, String fieldName, out float value ) {
            var v = obj.GetField( fieldName );
            if ( v != null && v.IsNumber ) {
                value = v.n;
                return true;
            }
            value = 0;
            return false;
        }

        public static bool ParseValue( UnitMaterialEditor gui, JSONObject obj, String fieldName, out Vector4 value, out int mask ) {
            var v = obj.GetField( fieldName );
            mask = 0;
            if ( v != null && v.IsArray ) {
                var ret = new Vector4();
                for ( int i = 0; i < v.Count && i < 4; ++i ) {
                    if ( v[ i ].IsNumber ) {
                        mask |= 1 << i;
                        ret[ i ] = v[ i ].n;
                    }
                }
                if ( mask != 0 ) {
                    value = ret;
                    return true;
                }
            }
            value = Vector4.zero;
            return false;
        }

        public static bool TryParseVector4( UnitMaterialEditor gui, JSONObject obj, String fieldName, ref Vector4 value, out int comp ) {
            var v = obj.GetField( fieldName );
            comp = 0;
            if ( v != null ) {
                if ( v.IsArray ) {
                    for ( int i = 0; i < v.Count; ++i ) {
                        if ( v[ i ].IsNumber ) {
                            value[ i ] = v[ i ].n;
                            ++comp;
                        } else {
                            break;
                        }
                    }
                    if ( comp > 0 ) {
                        return true;
                    }
                } else if ( v.IsNumber ) {
                    value[ 0 ] = v.f;
                    comp = 1;
                    return true;
                } else if ( v.IsBool ) {
                    value[ 0 ] = v.b ? 1 : 0;
                    comp = 1;
                }
            }
            return false;
        }

        public static int ExcuteLogicOp( UnitMaterialEditor gui, MaterialProperty prop, MaterialProperty[] props, JSONObject args ) {
            var _op = String.Empty;
            args.GetField( out _op, UnitMaterialEditor.Cfg.ArgsKey_OP, "==" );
            if ( prop == null ) {
                var ret = -1;
                String _id0, _id1;
                if ( args.GetField( out _id0, UnitMaterialEditor.Cfg.ArgsKey_OP_Arg0, String.Empty ) ) {
                    String ret0;
                    var _0 = EvalLogicOpArg( gui, _id0, props, out ret0 );
                    var argIndex = 1;
                    while ( args.GetField( out _id1, UnitMaterialEditor.Cfg.ArgsKey_OP_ArgPrefix + argIndex.ToString(), String.Empty ) ) {
                        String ret1;
                        var _1 = EvalLogicOpArg( gui, _id1, props, out ret1 );
                        if ( _0 != -1 && _1 != -1 ) {
                            ret = Compare( _op, _0, _1 ) ? 1 : 0;
                        } else {
                            if ( ret0 != null && ret1 != null ) {
                                ret = Compare( _op, ret0, ret1 ) ? 1 : 0;
                            }
                        }
                        if ( _op != "&&" && _op != "||" ) {
                            break;
                        } else {
                            if ( _op == "&&" ) {
                                if ( ret != 1 ) {
                                    break;
                                }
                            } else if ( _op == "||" ) {
                                if ( ret == 1 ) {
                                    break;
                                }
                            }
                        }
                        ++argIndex;
                        _0 = _1;
                        ret0 = ret1;
                    }
                }
                return ret;
            }
            switch ( prop.type ) {
            case MaterialProperty.PropType.Texture: {
                    var lh = prop.textureValue != null ? 1 : 0;
                    int rh;
                    if ( !ShaderGUIHelper.ParseValue( gui, args, UnitMaterialEditor.Cfg.ArgsKey_OP_Ref, out rh ) ) {
                        rh = 1;
                    }
                    return ShaderGUIHelper.Compare( _op, lh, rh ) ? 1 : 0;
                }
            case MaterialProperty.PropType.Vector: {
                    Vector4 rh;
                    int mask;
                    if ( ShaderGUIHelper.ParseValue( gui, args, UnitMaterialEditor.Cfg.ArgsKey_OP_Ref, out rh, out mask ) ) {
                        return ShaderGUIHelper.Compare( _op, prop.vectorValue, rh, mask ) ? 1 : 0;
                    }
                }
                break;
            case MaterialProperty.PropType.Color: {
                    Vector4 rh;
                    int mask;
                    if ( ShaderGUIHelper.ParseValue( gui, args, UnitMaterialEditor.Cfg.ArgsKey_OP_Ref, out rh, out mask ) ) {
                        return ShaderGUIHelper.Compare( _op, prop.colorValue, rh, mask ) ? 1 : 0;
                    }
                }
                break;
            case MaterialProperty.PropType.Range:
            case MaterialProperty.PropType.Float: {
                    float rh = 0;
                    ShaderGUIHelper.ParseValue( gui, args, UnitMaterialEditor.Cfg.ArgsKey_OP_Ref, out rh );
                    return ShaderGUIHelper.Compare( _op, prop.floatValue, rh ) ? 1 : 0;
                }
            }
            return -1;
        }

        public static bool IsModeMatched( UnitMaterialEditor gui, JSONObject args ) {
            String mode;
            var modeMatched = true;
            if ( args != null && args.GetField( out mode, UnitMaterialEditor.Cfg.ArgsKey_Mode, String.Empty ) ) {
                var renderMode = gui.FindPropEditor<ShaderGUI_RenderMode>();
                if ( renderMode != null && !String.IsNullOrEmpty( mode ) ) {
                    var names = mode.Split( '|' );
                    modeMatched = false;
                    for ( int i = 0; i < names.Length; ++i ) {
                        var name = names[ i ].Trim();
                        if ( name.Equals( renderMode._Mode.ToString(), StringComparison.OrdinalIgnoreCase ) ) {
                            modeMatched = true;
                            break;
                        }
                    }
                }
            }
            return modeMatched;
        }

        public static int EvalLogicOpArg( UnitMaterialEditor gui, String express, MaterialProperty[] props ) {
            String returnValue;
            return EvalLogicOpArg( gui, express, props, out returnValue );
        }

        public static int EvalLogicOpArg( UnitMaterialEditor gui, String express, MaterialProperty[] props, out String returnValue ) {
            returnValue = null;
            if ( !String.IsNullOrEmpty( express ) ) {
                var m = UnitMaterialEditor.Reg_LogicRef.Match( express );
                if ( m.Success && m.Groups.Count > 2 ) {
                    var rev = m.Groups[ 1 ].ToString().Trim() == "!";
                    var id = m.Groups[ 2 ].ToString().Trim();
                    if ( !String.IsNullOrEmpty( id ) ) {
                        var ui = gui.FindPropEditor<UnitMaterialEditor>( id );
                        if ( ui != null ) {
                            var b = ui.GetLogicOpResult( out returnValue, props );
                            if ( rev ) {
                                b = !b;
                            }
                            return b ? 1 : 0;
                        } else {
                            var result = false;
                            var material = gui.materialEditor.target as Material;
                            if ( material != null && material.shader != null ) {
                                var shader = material.shader;
                                for ( int i = 0; i < ShaderUtil.GetPropertyCount( shader ); ++i ) {
                                    var name = ShaderUtil.GetPropertyName( shader, i );
                                    if ( name == id ) {
                                        switch ( ShaderUtil.GetPropertyType( shader, i ) ) {
                                        case ShaderUtil.ShaderPropertyType.Color:
                                            result = ShaderGUIHelper.Compare( ">", material.GetColor( name ), new Color( 0, 0, 0, 0 ) );
                                            break;
                                        case ShaderUtil.ShaderPropertyType.Float:
                                        case ShaderUtil.ShaderPropertyType.Range:
                                            result = material.GetFloat( name ) > 0;
                                            break;
                                        case ShaderUtil.ShaderPropertyType.TexEnv:
                                            result = material.GetTexture( name ) != null;
                                            break;
                                        case ShaderUtil.ShaderPropertyType.Vector:
                                            result = ShaderGUIHelper.Compare( ">", material.GetVector( name ), new Vector4( 0, 0, 0, 0 ) );
                                            break;
                                        }
                                        if ( rev ) {
                                            result = !result;
                                        }
                                        return result ? 1 : 0;
                                    }
                                }
                            }
                        }
                        return 0;
                    }
                } else {
                    returnValue = express;
                }
            }
            return -1;
        }

        public static String JSONValueToString( JSONObject jo ) {
            switch ( jo.type ) {
            case JSONObject.Type.BOOL:
                return jo.b.ToString();
            case JSONObject.Type.NUMBER:
                return jo.n.ToString();
            case JSONObject.Type.STRING:
                return jo.str;
            }
            return String.Empty;
        }

        public static bool? IsTagRemoveable( Material mat, String name ) {
            if ( mat != null && name != null ) {
                if ( String.IsNullOrEmpty( name ) ) {
                    return true;
                }
                var tagMap = new Dictionary<String, String>();
                GetMaterialOverrideTags( mat, ref tagMap );
                // 获取的tag可能是从材质中来，也可以是shader定义中来
                var value = mat.GetTag( name, true );
                if ( !String.IsNullOrEmpty( value ) ) {
                    try {
                        // 设置覆盖Tag，如果Shader中声明了Tag，此次覆盖操作只能保证从
                        // 材质中去除，
                        mat.SetOverrideTag( name, String.Empty );
                        var _value = mat.GetTag( name, true );
                        if ( !String.IsNullOrEmpty( _value ) ) {
                            // 表明此tag是不能被删除的
                            return false;
                        }
                        return true;
                    } finally {
                        // 如何还原？
                        // 如果测试的tag在材质中定义，说明我们之前获取的值从tagMap中来
                        if ( tagMap.ContainsKey( name ) ) {
                            // 设置原始值回去
                            mat.SetOverrideTag( name, value );
                        } else {
                            // 如果测试的tag，在材质中没有定义，
                            // 说明此tag从shader中来，无需处理
                        }
                    }
                } else {
                    // 说明测试的tag既不在tagMap也不再Shader中，可认为可删除
                    return true;
                }
            }
            return null;
        }

        public static bool GetMaterialOverrideTags( Material mat, ref Dictionary<String, String> tags ) {
            if ( mat == null ) {
                return false;
            }
            if ( tags != null ) {
                tags.Clear();
            } else {
                tags = new Dictionary<String, String>();
            }
            using ( var so = new SerializedObject( mat ) ) {
                var tagMap = so.FindProperty( "stringTagMap" );
                if ( tagMap != null && tagMap.isArray ) {
                    var arraySize = tagMap.arraySize;
                    for ( int i = 0; i < arraySize; ++i ) {
                        var key = so.FindProperty( String.Format( "stringTagMap.Array.data[{0}].first", i ) );
                        var value = so.FindProperty( String.Format( "stringTagMap.Array.data[{0}].second", i ) );
                        if ( key != null && value != null &&
                            key.propertyType == SerializedPropertyType.String &&
                            value.propertyType == SerializedPropertyType.String ) {
                            tags = tags ?? new Dictionary<String, String>();
                            tags.Add( key.stringValue, value.stringValue );
                            Debug.Assert( !String.IsNullOrEmpty( key.stringValue ) );
                            Debug.Assert( !String.IsNullOrEmpty( value.stringValue ) );
                        }
                    }
                }
            }
            return tags != null;
        }

        static bool IsUnityDefaultResource( String path ) {
            return String.IsNullOrEmpty( path ) == false &&
                ( path == "Resources/unity_builtin_extra" ||
                path == "Library/unity default resources" );
        }

        public static String GetAssetGUID( UnityEngine.Object o ) {
            if ( o != null ) {
                var path = AssetDatabase.GetAssetPath( o );
                if ( !String.IsNullOrEmpty( path ) ) {
                    if ( !IsUnityDefaultResource( path ) ) {
                        return AssetDatabase.AssetPathToGUID( path );
                    } else {
                        return o.name;
                    }
                }
            }
            return "null";
        }

        public static String DumpMaterial( Material m ) {
            var sb = new StringBuilder();
            if ( m != null ) {
                var shader = m.shader;
                sb.AppendFormat( "shader: {0}\n", GetAssetGUID( shader ) );
                sb.AppendLine();

                sb.AppendFormat( "enableInstancing: {0}\n", m.enableInstancing );
                sb.AppendFormat( "doubleSidedGI: {0}\n", m.doubleSidedGI );
                sb.AppendFormat( "globalIlluminationFlags: {0}\n", m.globalIlluminationFlags );
                sb.AppendFormat( "renderQueue: {0}\n", m.renderQueue );
                sb.AppendLine();

                sb.AppendFormat( "passCount: {0}\n", m.passCount );
                for ( int i = 0; i < m.passCount; ++i ) {
                    var passName = m.GetPassName( i );
                    var enabled = m.GetShaderPassEnabled( passName );
                    sb.AppendFormat( "pass: {0} enabled = {1}\n", passName, enabled );
                }
                sb.AppendLine();

                List<KeyValuePair<String, Texture>> texEnvs = null;
                using ( var so = new SerializedObject( m ) ) {
                    List<KeyValuePair<String, String>> kv = null;
                    var tagMap = so.FindProperty( "stringTagMap" );
                    if ( tagMap != null && tagMap.isArray ) {
                        var arraySize = tagMap.arraySize;
                        for ( int i = 0; i < arraySize; ++i ) {
                            var key = so.FindProperty( String.Format( "stringTagMap.Array.data[{0}].first", i ) );
                            var value = so.FindProperty( String.Format( "stringTagMap.Array.data[{0}].second", i ) );
                            if ( key != null && value != null &&
                                key.propertyType == SerializedPropertyType.String &&
                                value.propertyType == SerializedPropertyType.String ) {
                                kv = kv ?? new List<KeyValuePair<String, String>>();
                                kv.Add( new KeyValuePair<String, String>( key.stringValue, value.stringValue ) );
                            }
                        }
                    }
                    if ( kv != null ) {
                        kv.Sort( ( l, r ) => l.Key.CompareTo( r.Key ) );
                        for ( int i = 0; i < kv.Count; ++i ) {
                            sb.AppendFormat( "stringTagMap[{0}]: {1} = {2}\n", i, kv[ i ].Key, kv[ i ].Value );
                        }
                    }
                    var envs_array = so.FindProperty( "m_SavedProperties.m_TexEnvs.Array" );
                    if ( envs_array != null && envs_array.isArray ) {
                        var arraySize = envs_array.arraySize;
                        for ( int i = 0; i < arraySize; ++i ) {
                            var envNamePropPath = String.Format( "data[{0}].first", i );
                            var envNameProp = envs_array.FindPropertyRelative( envNamePropPath );
                            var texValuePropPath = String.Format( "data[{0}].second.m_Texture", i );
                            var texValueProp = envs_array.FindPropertyRelative( texValuePropPath );
                            if ( texValueProp != null && envNameProp != null ) {
                                var envName = envNameProp.stringValue;
                                if ( texValueProp.propertyType == SerializedPropertyType.ObjectReference ) {
                                    if ( texValueProp.objectReferenceValue != null ) {
                                        texEnvs = texEnvs ?? new List<KeyValuePair<String, Texture>>();
                                        texEnvs.Add( new KeyValuePair<String, Texture>(
                                            envName, texValueProp.objectReferenceValue as Texture ) );
                                    }
                                }
                            }
                        }
                    }
                }
                sb.AppendLine();

                if ( shader != null ) {
                    var count = ShaderUtil.GetPropertyCount( shader );
                    for ( int i = 0; i < count; ++i ) {
                        var name = ShaderUtil.GetPropertyName( shader, i );
                        var type = ShaderUtil.GetPropertyType( shader, i );
                        switch ( type ) {
                        case ShaderUtil.ShaderPropertyType.Color:
                            sb.AppendFormat( "{0} {1} = {2}\n", type, name, m.GetColor( name ).ToString() );
                            break;
                        case ShaderUtil.ShaderPropertyType.Float:
                        case ShaderUtil.ShaderPropertyType.Range:
                            sb.AppendFormat( "{0} {1} = {2}\n", type, name, m.GetFloat( name ).ToString() );
                            break;
                        case ShaderUtil.ShaderPropertyType.Vector:
                            sb.AppendFormat( "{0} {1} = {2}\n", type, name, m.GetVector( name ).ToString() );
                            break;
                        case ShaderUtil.ShaderPropertyType.TexEnv:
                            var t = m.GetTexture( name );
                            sb.AppendFormat( "{0} {1} = {2}\n", ShaderUtil.GetTexDim( shader, i ), name, ShaderGUIHelper.GetAssetGUID( t ) );
                            sb.AppendFormat( "float4 {0}_ST, {1}, {2}\n", name, m.GetTextureScale( name ), m.GetTextureOffset( name ) );
                            if ( t != null && texEnvs != null ) {
                                var _name = name;
                                var ttIndex = texEnvs.FindIndex( kv => kv.Key == _name );
                                Debug.Assert( ttIndex >= 0 && texEnvs[ ttIndex ].Value == t );
                            }
                            break;
                        }
                    }
                }
                sb.AppendLine();

                var shaderKeywords = m.shaderKeywords;
                if ( shaderKeywords.Length > 0 ) {
                    Array.Sort( shaderKeywords );
                    sb.Append( '\n' );
                    for ( int i = 0; i < shaderKeywords.Length; ++i ) {
                        sb.Append( shaderKeywords[ i ] ).Append( ";\n" );
                    }
                }
                sb.AppendLine();
            }
            return sb.ToString();
        }
    }
}
