//using UnityEngine;
//using System.Collections;
//using UnityEngine.UI;
//using SimpleJSON;
//public class Scripts : MonoBehaviour {
//
//	public GameObject textview;
//	public InputField NameFiled;
//	public Button submitBtn;
//	public string ResName,Res_msg;
//
//	IEnumerator ResponseWaiting () {
//		yield return new  WaitForSeconds(0.1f);
//		string webservicePath = "http://dev.credencys.com/unity_test/index.php?name="+NameFiled.text;
//			print (webservicePath);
//		WWW wwwWebservice = new WWW (webservicePath); //calling the getArContent Webservice
//			textview.GetComponent<Text>().text = "waiting for server response...";
//		yield return wwwWebservice;
//			var N = JSONNode.Parse (wwwWebservice.text);
//			if(wwwWebservice.error == null){		
//				print(N["data"]["name"]);
//				print(N["data"]["msg"]);
//				
//				ResName = N["data"]["name"];
//				Res_msg = N["data"]["msg"];
//				textview.GetComponent<Text>().text =""+ResName+" "+Res_msg;
//				NameFiled.text = ResName;
//			}else{
//				textview.GetComponent<Text>().text ="No response.";
//			}
//		
//	}
//
//	public void OnClick(){
//		if(NameFiled.text != null)
//		StartCoroutine(ResponseWaiting());
//	}
//}
