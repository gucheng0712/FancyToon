using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[ExecuteInEditMode]
public class BoxBlur : MonoBehaviour
{
    public Material blurMat;
    [Range(0, 10)] public int iterations;
    [Range(0, 4)] public int downResolutions;

    private void OnRenderImage(RenderTexture src, RenderTexture dst)
    {
        int width = src.width >> downResolutions;
        int height = src.height >> downResolutions;

        RenderTexture rt = RenderTexture.GetTemporary(width, height);
        Graphics.Blit(src, rt);

        for (int i = 0; i < iterations; i++)
        {
            RenderTexture rt2 = RenderTexture.GetTemporary(width, height);
            Graphics.Blit(rt, rt2, blurMat);
            RenderTexture.ReleaseTemporary(rt);
            rt = rt2;
        }
        Graphics.Blit(rt, dst);
        RenderTexture.ReleaseTemporary(rt);
    }
}
