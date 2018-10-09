using UnityEngine;
using System;
using System.Collections;
using UnityEngine.UI;


[Serializable]
public class Login
{
	/************ string fields *************/
	public string StrUserName;
	public string StrPassword;
	public string MouseDownObjectName;
	/************ input fields *************/
	public InputField UserName;
	public InputField Password;
	/************ GameObjects *************/
	public Text LoginInfo;
	public Text ProtectPassword;
	/************** Panel Objects**********/
	//public GameObject BgPanel;
	public Image BgPanel;


}