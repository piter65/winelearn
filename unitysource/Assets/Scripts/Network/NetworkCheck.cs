using UnityEngine;
using System.Collections;
using UnityEngine.Networking;
using System;
using System.Net;

public class NetworkCheck : MonoBehaviour {

	public string str;
	void Start(){
		//ConnectionChecking();
		//Update1();
	}
	// Use this for initialization
	public static bool ConnectionChecking(){
		try{
			//var client  = new WebClient();
			using(var stream = new WebClient().OpenRead("http://www.google.com"))
			{
				Debug.Log(stream.ToString());
				return true;
			}
		}catch {
			return false;
		}
	}
	
	// Update is called once per frame
	void Update1 () {
		HttpWebRequest request = (HttpWebRequest)WebRequest.Create("http://www.google.com");
		request.Timeout = 5000;
		request.Credentials = CredentialCache.DefaultNetworkCredentials;

		HttpWebResponse response = (HttpWebResponse)request.GetResponse();
		Debug.Log(response.StatusCode);
	}
}
