using System;
using System.Collections;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using UnityEngine;
using UnityEngine.XR.MagicLeap;
using UniRx;
using TMPro;

public class MyArUcoTest : MonoBehaviour
{
    [DllImport("MyArUco", CallingConvention = CallingConvention.StdCall)]
    public static extern void TrackerCreate(float marker_length, out int resultCode);

    [DllImport("MyArUco", CallingConvention = CallingConvention.StdCall)]
    public static extern void TrackerDestroy();

    [DllImport("MyArUco", CallingConvention = CallingConvention.StdCall)]
    public static extern void TrackerGetResult(out IntPtr arrayPtr, out int size);

    [DllImport("MyArUco", CallingConvention = CallingConvention.StdCall)]
    public static extern void TrackerReleaseResult();

    private readonly float MARKER_LENGTH = 0.1f;
    private readonly float FLOAT_OFFSET = 0.1f;

    [SerializeField] private MLControllerConnectionHandlerBehavior controllerConnectionHandler = null;
    [SerializeField] private Transform quadTransform = null;
    [SerializeField] private TextMeshPro quadText = null;

    private bool isCreatedTracker;
    private int counter;

    void Start()
    {
        MLPrivileges.Start();
        MLPrivileges.RequestPrivilege(MLPrivileges.Id.CameraCapture);

        Observable.Timer(System.TimeSpan.FromSeconds(0.1f)).Subscribe(_ =>
        {
            Setup();
        });
    }

    void Update()
    {
        counter++;
        if ((counter & 1) == 0)
        {
            GetTrackerResult();
        }
    }

    void Setup()
    {
#if PLATFORM_LUMIN
        try
        {
            int resultCode;
            TrackerCreate(MARKER_LENGTH, out resultCode);
            MLResult.Code code = (MLResult.Code)resultCode;
            ScreenLogger.Log("TrackerCreate :" + resultCode + " " + MLResult.CodeToString(code));
            if (MLResult.IsOK(code))
            {
                isCreatedTracker = true;
            }
        }
        catch(Exception e)
        {
            ScreenLogger.Log(e.ToString());
        }

        if (!controllerConnectionHandler.IsControllerValid())
        {
            ScreenLogger.Log("Controller Invalid");
            return;
        }
        MLInput.Controller controller = controllerConnectionHandler.ConnectedController;
        controller.OnButtonDown += OnButtonDown;
#endif
    }

    void OnButtonDown(byte controllerId, MLInput.Controller.Button button)
    {
        if (button == MLInput.Controller.Button.Bumper)
        {
            GetTrackerResult();
        }
    }

    void GetTrackerResult()
    {
        if (!isCreatedTracker)
        {
            return;
        }
        try
        {
            IntPtr arrayPtr = IntPtr.Zero;
            int size = 0;
            TrackerGetResult(out arrayPtr, out size);
            float[] arr = new float[size];
            Marshal.Copy(arrayPtr, arr, 0, size);

            int num = (int)(arr[0] + FLOAT_OFFSET);
            if (num > 0)
            {
                quadTransform.gameObject.SetActive(true);
            }
            else
            {
                quadTransform.gameObject.SetActive(false);
            }
            int id = (int)(arr[1] + FLOAT_OFFSET);
            Vector3 pos = new Vector3(arr[2], arr[3], arr[4]);
            Vector3 rot = new Quaternion(arr[5], arr[6], arr[7], arr[8]).eulerAngles;
            pos.z = -pos.z;
            rot.x = -rot.x;
            rot.y = -rot.y;
            quadText.text = id.ToString();
            quadTransform.localPosition = pos;
            quadTransform.eulerAngles = rot;
            ScreenLogger.Log(" Num : " + num);
            ScreenLogger.Log(" ID  : " + id);
            ScreenLogger.Log(" Pos : " + pos);
            ScreenLogger.Log(" Rot : " + rot);
        }
        catch(Exception e)
        {
            ScreenLogger.Log(e.ToString());
        }
    }
}
