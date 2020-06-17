using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ScreenLogger : MonoBehaviour
{
    [SerializeField] private int fontSize = 16;

    private static List<string> logMsg = new List<string>();
    private Rect rect;
    private GUIStyle style;

    void Awake()
    {
        rect = new Rect(0, 0, Screen.width, Screen.height);
        style = new GUIStyle();
    }

    public static void Log(string msg)
    {
        logMsg.Add(msg);
        if (logMsg.Count > 10)
        {
            logMsg.RemoveAt(0);
        }
    }

    void OnGUI()
    {
        style.fontSize = fontSize;
        style.fontStyle = FontStyle.Normal;
        style.normal.textColor = Color.white;

        string outMessage = "";
        foreach(string msg in logMsg)
        {
            outMessage += msg + System.Environment.NewLine;
        }
        GUI.Label(rect, outMessage, style);
    }
}
