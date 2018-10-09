using UnityEngine;
using System.Collections;
//using System.Diagnostics;
using System;
using System.IO;
using System.Collections.Generic;
using System.Net;
using System.Runtime.InteropServices;
//using System


public class Systeminfo1 : MonoBehaviour {

//	[DllImport("winmm.dll", SetLastError = true)]
//	public static extern uint waveOutGetNumDevs();
//	private void frmSound_Load(object sender, System.EventArgs e){
//		if(waveOutGetNumDevs() != 0)
//		{
//			//lblSound.Text = "The Sound device is detected for this system";
//			str = "sound true";
//		}
//		else
//		{
//			str = "sound false";
//			//lblSound.ForeColor = Color.Red; 
//			//lblSound.Text = "The Sound device is Not Found for this system";
//		}
//	}
	public string str;
	// Use this for initialization
	void Start () {
		//print(System.Media.SystemSounds);

//		Debug.Log(System.Runtime.InteropServices);

		print(System.Environment.ProcessorCount);
		print(System.Environment.MachineName);
	//	print(System.Environment.UserDomainName);
		print(System.Environment.OSVersion);
		print("OS type : "+SystemInfo.operatingSystem);
		print("processor type : "+SystemInfo.processorType);
		print("Memroy size :"+SystemInfo.systemMemorySize);
		print("graphicsMemroy size :"+SystemInfo.graphicsMemorySize);

		print ("graphics level "+SystemInfo.graphicsShaderLevel);
		print ("graphics device version "+SystemInfo.graphicsDeviceVersion+"\tvender "+SystemInfo.graphicsDeviceVendor);
		print ("graphics Device model : "+SystemInfo.deviceModel+"  name "+SystemInfo.graphicsDeviceName);
		print ("graphics type "+SystemInfo.deviceType);
		print ("graphics device type "+SystemInfo.graphicsDeviceType);
		//print (""+);

	
	}
	
	// Update is called once per frame
	void Update () {
	
	}
}
