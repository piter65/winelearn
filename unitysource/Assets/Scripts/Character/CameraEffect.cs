
using System;
using System.Collections;
using UnityEngine;

[Serializable]
public class CameraUp{
	public bool CamEnabled;
	public float startValue;
	public float endValue;
	public Quaternion StartEuler, EndEuler;
}
[Serializable]
public class CameraLR{
	public bool CamEnabled;
	public float startValue;
	public float endValue;
	public Quaternion StartEuler, EndEuler;
}
[Serializable]
public class CameraRL{
	public bool CamEnabled;
	public float startValue;
	public float endValue;
	public Quaternion StartEuler, EndEuler;
}
[Serializable]
public class Speed{
	public float SpeedToChange;

}

public class CameraEffect : MonoBehaviour {

	public static CameraEffect instance;
	public CameraUp CamUP;
	public CameraLR CamLR;
	public CameraRL CamRL;
	public Speed Speed;

	public float StartEuler, EndEuler;

	public Quaternion VectorFrom, VectorTo;

	public  bool cameraEnabled = true;
	public Vector3 g;
	void Awake(){

		instance = this;
	}

	private float Euler(float StartEuler){
		return StartEuler;
	}




}