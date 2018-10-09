using UnityEngine;
using UnityEngine.SceneManagement;
using System.Collections;
using SimpleJSON;
using UnityEngine.UI;

public class NetworkCommunicate : MonoBehaviour {

	string url;
	public Text ResponseServer;

	public GameObject Panel;
	public GameObject Teacher , Student , BackBg , Image ,menu;
	// Use this for initialization
	void Awake(){
		menu.SetActive(false);
		Panel.SetActive(false);
		Image.SetActive(false);
		Teacher.SetActive(false);
		Student.SetActive(false);
		BackBg.SetActive(true);


		url = "http://spilltest.com/webservice/webservices.php?action=checkserver";
		//StartCoroutine("ResponseWaiting");
	}

	IEnumerator Start(){
		yield return new  WaitForSeconds(5.5f);
		Image.SetActive(true);
		Teacher.SetActive(true);
		Student.SetActive(true);
		BackBg.SetActive(true);

	}
	public void BackMenu(){
		menu.SetActive(false);
		Panel.SetActive(false);
		Image.SetActive(false);
		Teacher.SetActive(false);
		Student.SetActive(false);


		Image.SetActive(true);
		Teacher.SetActive(true);
		Student.SetActive(true);
		BackBg.SetActive(true);


	}

	public void LoginTeacher(){
		Teacher.SetActive(false);
		Student.SetActive(false);
		BackBg.SetActive(false);
		Panel.SetActive(true);
		StartCoroutine("ResponseWaiting");
	}
	public void LoginStudent(){
		System.GC.Collect();
		Resources.UnloadUnusedAssets();
		System.GC.WaitForPendingFinalizers();
		SceneManager.LoadScene("Login");
	}
	string str;
	int Reload;
	IEnumerator ResponseWaiting () {
		str = "";
		ResponseServer.text = "";
		//str = "Requesting server communication...";
		ResponseServer.text = ""+str;
		yield return new  WaitForSeconds(2.0f);
		ResponseServer.text = ResponseServer.text+"\nRuntime platform :"+Application.platform+"...";
		yield return new  WaitForSeconds(0.5f);
		ResponseServer.text = ResponseServer.text+"\nOS type :"+SystemInfo.operatingSystem+"...";
		ResponseServer.text = ResponseServer.text+"\nOS version :"+System.Environment.OSVersion+"...";
		ResponseServer.text = ResponseServer.text+"\nProcessor Type :"+SystemInfo.processorType+"...";
		yield return new  WaitForSeconds(0.5f);
		ResponseServer.text = ResponseServer.text+"\nGraphics device name :"+SystemInfo.graphicsDeviceName+"...";
		ResponseServer.text = ResponseServer.text+"\nGraphics device vendor :"+SystemInfo.graphicsDeviceVendor+"...";
		ResponseServer.text = ResponseServer.text+"\nGraphics Type :"+SystemInfo.graphicsDeviceType+"...";
		if(SystemInfo.graphicsShaderLevel >=30){
			if(SystemInfo.graphicsShaderLevel >41 && SystemInfo.graphicsShaderLevel <60){
				ResponseServer.text = ResponseServer.text+"\nDirectX version :11.0  (decent shaders supported!).....";
			}else
			if(SystemInfo.graphicsShaderLevel >40 && SystemInfo.graphicsShaderLevel <=41){
				ResponseServer.text = ResponseServer.text+"\nDirectX version :10.1 (decent shaders supported!).....";
			}else
			if(SystemInfo.graphicsShaderLevel >30 && SystemInfo.graphicsShaderLevel <41){
				ResponseServer.text = ResponseServer.text+"\nDirectX version :10.0 (decent shaders supported!).....";
			}else{
				ResponseServer.text = ResponseServer.text+"\nDirectX version :9.0 (decent shaders supported!).....";
			}
		}else{
			ResponseServer.text = ResponseServer.text+"\nGraphics Level :"+SystemInfo.graphicsShaderLevel+"...shaders not supported!";
		}
		yield return new  WaitForSeconds(0.5f);
		ResponseServer.text = ResponseServer.text+"\nDevice Type :"+SystemInfo.deviceType+"...";

		yield return new  WaitForSeconds(0.5f);
		//ResponseServer.text = ResponseServer.text+"\ngraphicsMemroy size :"+SystemInfo.graphicsMemorySize+"...";
		ResponseServer.text = ResponseServer.text+"\nRequesting server communication...";

		string webservicePath	= url;		
		WWW wwwWebservice = new WWW (webservicePath); //calling the getArContent Webservice
		ResponseServer.text = ResponseServer.text+"\nWaiting for server response...";

		yield return wwwWebservice;
		var N = JSONNode.Parse (wwwWebservice.text);	
		if(wwwWebservice.error == null){
			switch(N["status"]){
			case "1" :
				str = str+"\nServer "+N["msg"]+"...";
				ResponseServer.text = ResponseServer.text+""+str;
				yield return new  WaitForSeconds(2.5f);
				menu.SetActive(true);
				//yield return new  WaitForSeconds(6.0f);
				//SceneManager.LoadScene("Outside");

				break;
			case "0":
				str = "failure.";
				ResponseServer.text = ResponseServer.text+"Server communication "+str;	
				yield return new  WaitForSeconds(0.5f);
				ResponseServer.text = "Runtime platform"+ResponseServer.text+"\n"+Application.platform;
				yield return new  WaitForSeconds(0.5f);
				ResponseServer.text = ResponseServer.text+"\n Reloading....";
					if(Reload < 3){
						Reload = Reload +1;
						StartCoroutine("ResponseWaiting");
					}
				break;				
			}

			
		}else{
			//LoginInstance.LoginInfo.text ="No response.";
		}
		
	}
}
