using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.XR.MagicLeap;
using UniRx;

public class MyBLETest : MonoBehaviour
{
    [SerializeField] GameObject sphere = null;
    [SerializeField] GameObject circle1 = null;
    [SerializeField] GameObject circle2 = null;
    [SerializeField, Range(170, 210)] byte rssiA, rssiB, rssiC;

    void Start()
    {
        MLBluetoothLE.Start();
        MLBluetoothLE.OnScanResult += OnScanResult;
        MLBluetoothLE.StartScan();
        StartScanInterval();
    }

    void StartScanInterval()
    {
        MLResult result = MLBluetoothLE.StartScan();
        Observable.Timer(System.TimeSpan.FromSeconds(0.1f)).Subscribe(_ =>
        {
            MLBluetoothLE.StopScan();
            Observable.Timer(System.TimeSpan.FromSeconds(0.02f)).Subscribe(__ =>
            {
                StartScanInterval();
            });
        });
    }

    void OnScanResult(MLBluetoothLE.Device device)
    {
        if (device.Name == "BLE Device")
        {
            rssiA = device.Rssi;
            ScreenLogger.Log("A Rssi:" + device.Rssi);
        }
        else if (device.Name == "Heart Rate")
        {
            rssiB = device.Rssi;
            ScreenLogger.Log("B Rssi:" + device.Rssi);
        }
        else if (device.Name == "Blood Pressure")
        {
            rssiC = device.Rssi;
            ScreenLogger.Log("C Rssi:" + device.Rssi);
        }
        //ScreenLogger.Log("Address:" + device.Address + " Name:" + device.Name + " Rssi:" + device.Rssi);
    }

    void Update()
    {
        if (rssiA == 0 || rssiB == 0 || rssiC == 0)
        {
            return;
        }
        if (rssiA == rssiB || rssiB == rssiC)
        {
            return;
        }

        float A = Mathf.Max(200 - rssiA, 0);
        float B = Mathf.Max(200 - rssiB, 0);
        float C = Mathf.Max(200 - rssiC, 0);

        // ABの円
        float rateA = A / (A + B);
        float rateB = B / (A + B);
        float rAB = 0;
        float x = 0;
        if (A < B)
        {
            //内分の点
            float w = 0.7f * rateA;
            //外分の点
            // W : W + 0.7 = rateA : rateB
            float W = (rateA * 0.7f) / (rateB - rateA);
            //半径
            rAB = (w + W) * 0.5f;
            //原点
            x = -0.7f * rateB - rAB;

            circle1.transform.localPosition = Vector3.right * x;
            circle1.transform.localScale = (Vector3.right + Vector3.forward) * (w + W);
        }
        else if (A > B)
        {
            //内分の点
            float w = 0.7f * rateB;
            //外分の点
            // W : W + 0.7 = rateB : rateA
            float W = (rateB * 0.7f) / (rateA - rateB);
            //半径
            rAB = (w + W) * 0.5f;
            //原点
            x = -0.7f * rateB + rAB;

            circle1.transform.localPosition = Vector3.right * x;
            circle1.transform.localScale = (Vector3.right + Vector3.forward) * (w + W);
        }

        // BCの円
        float rateC = C / (C + B);
        rateB = B / (C + B);
        float rBC = 0;
        float z = 0;
        if (C < B)
        {
            //内分の点
            float w = 0.42f * rateC;
            //外分の点
            // W : W + 0.42 = rateC : rateB
            float W = (rateC * 0.42f) / (rateB - rateC);
            //半径
            rBC = (w + W) * 0.5f;
            //原点
            z = -0.42f * rateB - rBC;

            circle2.transform.localPosition = Vector3.forward * z;
            circle2.transform.localScale = (Vector3.right + Vector3.forward) * (w + W);
        }
        else if (C > B)
        {
            //内分の点
            float w = 0.42f * rateB;
            //外分の点
            // W : W + 0.42 = rateB : rateC
            float W = (rateB * 0.42f) / (rateC - rateB);
            //半径
            rBC = (w + W) * 0.5f;
            //原点
            z = -0.42f * rateB + rBC;

            circle2.transform.localPosition = Vector3.forward * z;
            circle2.transform.localScale = (Vector3.right + Vector3.forward) * (w + W);
        }

        //位置
        float d = Mathf.Sqrt(x * x + z * z);
        if (d > rAB + rBC)
        {
            //交点がない（離れている）
            float rate = rAB / (rAB + rBC);
            sphere.transform.localPosition =
                circle1.transform.localPosition * (1 - rate) +
                circle2.transform.localPosition * rate;
        }
        else if (d < Mathf.Abs(rAB - rBC))
        {
            //交点がない（内包）
            if (rAB > rBC)
            {
                Vector3 vec = circle2.transform.localPosition - circle1.transform.localPosition;
                vec += vec.normalized * rBC;
                sphere.transform.localPosition = circle1.transform.localPosition + vec;
            }
            else
            {
                Vector3 vec = circle1.transform.localPosition - circle2.transform.localPosition;
                vec += vec.normalized * rAB;
                sphere.transform.localPosition = circle2.transform.localPosition + vec;
            }
        }
        else
        {
            //交点がある
            //--------
            //ABの円
            // (X - x)^2 + Z^2 = rAB^2
            //BCの円
            // X^2 + (Z - z)^2 = rBC^2
            //ABの円の式からBCの円の式を引く
            // (-2xX + x^2) - (-2zZ + z^2) = rAB^2 - rBC^2
            // Z = (2xX - x^2 + z^2 + rAB^2 - rBC^2) / 2z
            //ここで (- x^2 + z^2 + rAB^2 - rBC^2) = Q とする
            // Z = (2xX + Q) / 2z
            // Z^2 = (4 x^2 X^2 + 4QxX + Q^2) / 4z^2
            //これをABの円の式に代入
            // X^2 - 2xX + x^2 + (4 x^2 X^2 + 4QxX + Q^2) / 4z^2 = rAB^2
            // (1 + (x^2 / z^2)) X^2 + (-2x + (Qx / z^2)) X + (x^2 + (Q^2 / 4z^2) - rAB^2) = 0
            //ここで (1 + (x^2 / z^2))            = a とする
            //　　　 (-2x + (Qx / z^2))           = b とする
            //　　　 (x^2 + (Q^2 / 4z^2) - rAB^2) = c とする
            // a X^2 + b X + c = 0
            //この式の解は X = (-b ± √(b^2 - 4ac)) / 2a
            //--------
            float Q = (- x*x + z*z + rAB*rAB - rBC*rBC);
            float a = (1 + (x*x) / (z*z));
            float b = (-2*x + (Q*x) / (z*z));
            float c = (x*x + (Q*Q) / (4*z*z) - rAB*rAB);
            float X1 = (-b + Mathf.Sqrt(b*b - 4*a*c)) / (2*a);
            float X2 = (-b - Mathf.Sqrt(b*b - 4*a*c)) / (2*a);
            float Z1 = (2*x*X1 + Q) / (2*z);
            float Z2 = (2*x*X2 + Q) / (2*z);
            // 中心に近い方をとる
            Vector3 O  = Vector3.right * -0.35f + Vector3.forward * -0.21f;
            Vector3 P1 = Vector3.right * X1 + Vector3.forward * Z1;
            Vector3 P2 = Vector3.right * X2 + Vector3.forward * Z2;
            if ((O - P1).magnitude < (O - P2).magnitude)
            {
                sphere.transform.localPosition = Vector3.right * X1 + Vector3.forward * Z1;
            }
            else
            {
                sphere.transform.localPosition = Vector3.right * X2 + Vector3.forward * Z2;
            }
        }
    }
}
