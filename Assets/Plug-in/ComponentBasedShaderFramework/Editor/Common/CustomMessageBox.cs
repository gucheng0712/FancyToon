using System;
using System.Collections.Generic;
using System.Linq;
using UnityEditor;
using UnityEngine;

namespace AresEditor {

    public class CustomMessageBox : EditorWindow {
        public String Info = String.Empty;
        public Func<int> OnGUIFunc = null;
        public Action<int>[] OnButtonClicks = null;
        public String[] Buttons = null;
        public int ReturnValue = 0;

        public void OnGUI() {
            EditorGUILayout.BeginVertical();
            EditorGUILayout.Space();
            EditorGUILayout.HelpBox( Info, MessageType.None );
            EditorGUILayout.Space();
            if ( OnGUIFunc != null ) {
                ReturnValue = OnGUIFunc();
            }
            EditorGUILayout.Space();
            EditorGUILayout.BeginHorizontal();
            if ( Buttons != null ) {
                for ( int i = 0; i < Buttons.Length; ++i ) {
                    if ( GUILayout.Button( Buttons[ i ], GUILayout.MinWidth( 80 ) ) ) {
                        if ( OnButtonClicks != null ) {
                            if ( i >= 0 && i <= OnButtonClicks.Length && OnButtonClicks[ i ] != null ) {
                                try {
                                    OnButtonClicks[ i ]( ReturnValue );
                                } catch ( Exception e ) {
                                    Debug.LogException( e );
                                }
                            }
                        }
                        EditorApplication.delayCall += () => {
                            Close();
                        };
                    }
                    GUILayout.Space( 5 );
                }
            }
            EditorGUILayout.EndHorizontal();
            EditorGUILayout.Space();
            EditorGUILayout.EndVertical();
        }
    }
}
//EOF
