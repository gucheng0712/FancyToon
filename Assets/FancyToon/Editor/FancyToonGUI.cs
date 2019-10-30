using UnityEditor;using UnityEngine;public class FancyToonGUI : ShaderGUI{    MaterialEditor materialEditor;    MaterialProperty[] properties;    bool ShowOutline;    public override void OnGUI(MaterialEditor materialEditor, MaterialProperty[] properties)    {        this.materialEditor = materialEditor;        this.properties = properties;        DrawDiffuseGUI();        this.materialEditor.SetDefaultGUIWidths();        DrawSpecularGUI();        DrawShadowGUI();        DrawOutlineGUI();        DrawOtherGUI();        EditorGUILayout.Space();        EditorGUILayout.HelpBox("FancyToon 1.0.0",MessageType.Info);    }    void DrawDiffuseGUI()    {        DrawHeader("DIFFUSE");        MaterialProperty mainTex = FindProperty("_MainTex");        GUIContent albedoLabel = CreateGUIContent(mainTex, "Main Texture(RGB)");        MaterialProperty mainColor = FindProperty("_MainColor");        materialEditor.TexturePropertySingleLine(albedoLabel, mainTex, mainColor);        MaterialProperty rampTex = FindProperty("_RampTex");        GUIContent rampLabel = CreateGUIContent(rampTex, "Ramp Texture(RGB)");        EditorGUI.BeginChangeCheck();
        materialEditor.TexturePropertySingleLine(rampLabel, rampTex);        if (EditorGUI.EndChangeCheck())
        {
            SetKeyword("RampTex", rampTex.textureValue);
        }        MaterialProperty normalMap = FindProperty("_NormalMap");        MaterialProperty bumpScale = FindProperty("_BumpScale");        GUIContent normalLabel = CreateGUIContent(normalMap);        materialEditor.TexturePropertySingleLine(normalLabel, normalMap, normalMap.textureValue ? bumpScale : null);        MaterialProperty lightMaskTex = FindProperty("_LightMask");        GUIContent lightMaskLabel = CreateGUIContent(lightMaskTex, "SpecularMask(R) + ShadowMask(G) +MetalicMask(B)+ EmissionMask(A)");        materialEditor.TexturePropertySingleLine(lightMaskLabel, lightMaskTex);        EditorGUI.indentLevel += 2;        materialEditor.TextureScaleOffsetProperty(mainTex);        EditorGUI.indentLevel -= 2;        EditorGUILayout.Space();        EditorGUI.indentLevel += 2;        CreateShaderProperty("_Shininess");        CreateShaderProperty("_RimScale");
        CreateShaderProperty("_IndirectionalIntensity");        EditorGUI.indentLevel -= 2;

        EditorGUILayout.Space();    }    void DrawSpecularGUI()    {        DrawHeader("Rim");
        EditorGUI.indentLevel += 2;        CreateColorProperty("_RimColor");        CreateShaderProperty("_RimRange");        CreateShaderProperty("_RimIntensity");        CreateShaderProperty("_RimOffset"); 
        EditorGUI.indentLevel -= 2;

        EditorGUILayout.Space();    }    void DrawShadowGUI()    {
        EditorGUI.indentLevel += 2;        DrawHeader("SHADOW");        CreateShaderProperty("_ReceiveShadow");
        EditorGUI.indentLevel -= 2;

        EditorGUILayout.Space();    }    void DrawOutlineGUI()    {        DrawHeader("OUTLINE");        MaterialProperty outlineMask = FindProperty("_Outline_Sampler");        MaterialProperty outlineColor = FindProperty("_OutlineColor");        GUIContent outlineMaskLabel = CreateGUIContent(outlineMask, "Outline Mask");        materialEditor.TexturePropertySingleLine(outlineMaskLabel, outlineMask, outlineColor);        EditorGUI.indentLevel += 2;        CreateShaderProperty("_OutlineWidth");        CreateShaderProperty("_Nearest_Distance");        CreateShaderProperty("_Farthest_Distance");        EditorGUI.indentLevel -= 2;

        EditorGUILayout.Space();    }    private void DrawOtherGUI()    {        DrawHeader("OTHER SETTING");
        EditorGUI.indentLevel += 2;
        CreateShaderProperty("_Cull");        CreateShaderProperty("_ID");        CreateShaderProperty("_Saturation");        GUILayout.Space(10);        materialEditor.RenderQueueField();        materialEditor.EnableInstancingField();        GUILayout.Space(10);
        EditorGUI.indentLevel -= 2;

        EditorGUILayout.Space();    }    void DrawHorizontalLine()    {        GUILayout.Box("", GUILayout.ExpandWidth(true), GUILayout.Height(1));    }    void DrawHeader(string title)    {        GUIStyle headerStyle = new GUIStyle("textarea");        headerStyle.alignment = TextAnchor.MiddleCenter;        headerStyle.font = new GUIStyle(EditorStyles.boldLabel).font;       // headerStyle.border = new RectOffset(15, 7, 4, 4);        headerStyle.fixedHeight = 24;        GUILayout.Label(title, headerStyle, GUILayout.ExpandWidth(true));    }    MaterialProperty FindProperty(string name)    {        return FindProperty(name, properties);    }    static GUIContent content = new GUIContent();    static GUIContent CreateGUIContent(string text, string tooltip = null)    {        content.text = text;        content.tooltip = tooltip;        return content;    }    void CreateShaderProperty(string propertyName)    {        MaterialProperty property = FindProperty(propertyName);        materialEditor.ShaderProperty(property, CreateGUIContent(property));    }    void CreateColorProperty(string propertyName)    {        MaterialProperty specColor = FindProperty(propertyName);        materialEditor.ColorProperty(specColor, specColor.displayName);    }    static GUIContent CreateGUIContent(MaterialProperty property, string tooltip = null)    {        content.text = property.displayName;        content.tooltip = tooltip;        return content;    }
    void SetKeyword(string keyword, bool state)
    {
        if (state)
        {
            foreach (Material m in materialEditor.targets)
            {
                m.EnableKeyword(keyword);
            }
        }
        else
        {
            foreach (Material m in materialEditor.targets)
            {
                m.DisableKeyword(keyword);
            }
        }
    }}