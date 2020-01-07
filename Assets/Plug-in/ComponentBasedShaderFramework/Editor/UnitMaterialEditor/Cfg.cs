using System;
using UnityEditor;
using UnityEngine;
using UnityEngine.Rendering;

namespace ArtistKit {

    public partial class UnitMaterialEditor {

        /// <summary>
        /// 材质编辑器配置中使用的关键词
        /// </summary>
        public static class Cfg {
            /// <summary>
            /// 为单属性编辑器SingleProp固定初始值
            /// </summary>
            public const String Key_FixedValue = "keep";
            /// <summary>
            /// 在指定条件下，为单属性编辑器SingleProp固定初始值
            /// </summary>
            public const String Key_FixedIfValue = "keep_if";
            /// <summary>
            /// 用于条件性的指定编辑器功能开启
            /// </summary>
            public const String Key_EnableIfValue = "enable_if";
            /// <summary>
            /// 为编辑器指定标签
            /// </summary>
            public const String Key_GUILabel = "label";
            /// <summary>
            /// 为单属性编辑器指定GUI类型，用于覆盖默认属性编辑器类型
            /// </summary>
            public const String Key_PropGUIType = "gui";
            /// <summary>
            /// 为单属性编辑器指定自动重置属性功能
            /// </summary>
            public const String Key_AutoResetValue = "auto_reset";
            /// <summary>
            /// 为属性编辑器提供精度：low， half， high
            /// </summary>
            public const String Key_Precision = "precision";
            /// <summary>
            /// 为HelpBox指定内容
            /// </summary>
            public const String Key_Text = "text";
            /// <summary>
            /// 指定单属性编辑器强制为toggle类型
            /// </summary>
            public const String Value_PropGUIType_Toggle = "toggle";
            /// <summary>
            /// 指定Vector单属性编辑器使用Rect类型UI
            /// </summary>
            public const String Value_PropGUIType_Rect = "rect";
            /// <summary>
            /// 把Color类型属性指定通道单独拆分为Slider编辑器
            /// </summary>
            public const String Value_PropGUIType_ColorPrefix = "color_";
            public const String Value_PropGUIType_ColorR = "color_r";
            public const String Value_PropGUIType_ColorG = "color_g";
            public const String Value_PropGUIType_ColorB = "color_b";
            public const String Value_PropGUIType_ColorA = "color_a";

            public const String Value_Precision_Low = "low";
            public const String Value_Precision_Half = "half";
            public const String Value_Precision_High = "high";

            public const String Value_CullMode_Off = "off";
            public const String Value_CullMode_Front = "front";
            public const String Value_CullMode_Back = "back";

            /// <summary>
            /// 指定编辑器类型
            /// </summary>
            public const String Key_Editor = "editor";
            /// <summary>
            /// 编辑器参数集
            /// </summary>
            public const String Key_Args = "args";
            /// <summary>
            /// 编辑器ID
            /// </summary>
            public const String Key_ID = "id";
            public const String Key_Name = "name";
            
            /// <summary>
            /// 混合模式限定，用户限定编辑器在特定混合模式下启用
            /// </summary>
            public const String ArgsKey_Mode = "mode";
            public const String ArgsKey_OP = "op";
            public const String ArgsKey_OP_ArgPrefix = "arg";
            public const String ArgsKey_OP_Arg0 = "arg0";
            public const String ArgsKey_OP_Ref = "ref";

            /// <summary>
            /// 混合模式编辑器可以指定可用的模式选项
            /// </summary>
            public const String ArgsKey_Options = "options";

            /// <summary>
            /// 属性名绑定前缀
            /// </summary>
            public const String ArgsKey_PropPrefix = "prefix";

            /// <summary>
            /// 编辑器初始值参数预设，目前用于StencilSettings配置固定几种使用模式，目前支持：maskout， mask
            /// </summary>
            public const String ArgsKey_Preset = "preset";

            /// <summary>
            /// 反转值标记
            /// </summary>
            public const String Command_Value_Invert = "invert";

            public const String ArgsKey_CustomTag_Tags = "tags";
            public const String ArgsKey_CustomTag_Type = "type";
            public const String ArgsKey_CustomTag_Values = "values";

            public const String ArgsKey_CustomTag_Readonly = "readonly";
            /// <summary>
            /// 用于把有些现有的CustomTag迁移到另外一个
            /// </summary>
            public const String ArgsKey_CustomTag_UpgradeTo = "upgrade_to";
            public const String ArgsKey_CustomTag_CopyTo = "copy_to";
        }
    }
}
//EOF
