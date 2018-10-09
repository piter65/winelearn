using UnityEngine;
using UnityEngine.SceneManagement;
using System.Collections;
using UnityEngine.UI;
using System;
using System.Text;

public class UIMetricsDialog : MonoBehaviour
{
	public static UIMetricsDialog INSTANCE = null;

	public Text txt_Content;
	public RawImage rimg_Image;
	public Image img_Image;
	public float textUpdateInterval = 0.33f;

	private StringBuilder _strbText = new StringBuilder();
	private float _fTimeSinceLastTextUpdate = 0.0f;
	private int _iTextUpdtateStep = 2;
	private int _iMaxTextUpdateStep = 3;

	private int _iMetricsStep = 0;
	private bool _bAllMetricsGathered = false;

	private float _fTimeStamp = 0.0f;
	private bool _bRecordingFPS = false;
	private int _iRecordedFrameCount = 0;

	private AudioSource _audioSource;

	private bool _data_complete = false;
	private string _data_ip_address = null;
	private string _data_download_time = null;
	private string _data_web_browser = null;
	private string _data_web_gl_memory_usage = null;
	private string _data_scene_load_time = null;
	private string _data_fps_record_time = null;
	private string _data_fps_frame_count = null;
	private string _data_fps = null;
	private string _data_web_server_connection = null;

// Peter's metrics


	private float fPeteLoadTime = 0.0f;
	private float fPeteConTime = 0.0f;
	private float fPeteScloadTime = 0.0f;
	private bool bMultiplayerConnect = false;
	private bool bDataConnect = false;
	private float fPeteFrameRate = 0.0f;

	private bool bPeteScload = false;			// assume no working   - Scene Load




	private string GetIP()
	{
		string strHostName = "";
		strHostName = System.Net.Dns.GetHostName();
		 
		System.Net.IPHostEntry ipEntry = System.Net.Dns.GetHostEntry(strHostName);
		 
		System.Net.IPAddress[] addr = ipEntry.AddressList;
		 
		return addr[addr.Length-1].ToString();
	}

	// Use this for initialization
	void Start()
	{
		_audioSource = GetComponent<AudioSource>();

		txt_Content.text = CycleProgressIndicator();

		rimg_Image.gameObject.SetActive(false);
		img_Image.gameObject.SetActive(false);

		//_data_ip_address = GetIP();

		StartCoroutine(GatherMetrics_Start());
	}
	
	// Update is called once per frame
	void Update()
	{
		if (!_bAllMetricsGathered)
		{
			_fTimeSinceLastTextUpdate += Time.deltaTime;

			if (_fTimeSinceLastTextUpdate >= textUpdateInterval)
			{
				UpdateText();
			}

			if (_bRecordingFPS)
			{
				++_iRecordedFrameCount;
			}
		}
	}

	private void UpdateText()
	{
		_fTimeSinceLastTextUpdate = 0.0f;

		string strText = _strbText.ToString();

		if (!_bAllMetricsGathered)
			strText += CycleProgressIndicator();

		txt_Content.text = strText;
	}

	// Generates a string to append to the end of the text content 
	//   to allow the user to see that the app is still running.
	private string CycleProgressIndicator()
	{
		++_iTextUpdtateStep;

		if (_iTextUpdtateStep > _iMaxTextUpdateStep)
			_iTextUpdtateStep = 0;

		switch (_iTextUpdtateStep)
		{
			case 0:
				return "";
			case 1:
				return " .";
			case 2:
				return " . .";
			case 3:
			default:
				return " . . .";
		}
	}

	private IEnumerator GatherMetrics_Start()
	{
		_strbText.AppendLine("Please stay on this page while tests are in progress.");
		_strbText.AppendLine();
		_strbText.AppendLine("Note: Test results can vary. For the most accurate and useful results, test during classtime and from a student's computer.");
		_strbText.AppendLine();



		yield return StartCoroutine(GatherMetrics_WebGLConnection());
	}

	private float Pround(float danumber)
	{

// Peter's idea to round down huge #'s to something less scary - Halloween Trick.
	danumber = danumber *100f;

	float temp = Mathf.Round(danumber);

	temp = temp/100;

	return (temp);

	}






	private IEnumerator GatherMetrics_WebGLConnection()
	{
		_strbText.Append("Checking Download Speed");
		UpdateText();

		_fTimeStamp = Time.unscaledTime;


// Peter was here screwing up Brent's code....
		

		// BChance: (2016-10-30) - Added GET param 't' at the end to ensure non-cached image downloaded.
//		string strUrl = GLOBAL.GetUrl_Benchmark("med_image_asset_" + UnityEngine.Random.Range(1,10) + ".jpg?t=" + DateTime.Now.Ticks.ToString());
		
		string strUrl = GLOBAL.GetUrl_Benchmark("huge_image_asset.jpg?t=" + DateTime.Now.Ticks.ToString());

		Debug.Log("Happy Presidents Day");
		Debug.Log(strUrl);

		WWW www = new WWW(strUrl);
		yield return www;
		Texture2D tex = new Texture2D(1,1);
		www.LoadImageIntoTexture(tex);
		Sprite sprite = Sprite.Create(tex, new Rect(0, 0, tex.width, tex.height), new Vector2(0.5f,0.5f), 1.0f);
		img_Image.sprite = sprite;
		img_Image.gameObject.SetActive(true);

		// yield return new WaitForSeconds(3.0f);

// Peter added 2 more loads so we get average for more consistency... General idea is good.  Needs some tuning....	
		//strUrl = GLOBAL.GetUrl_Benchmark("med_image_asset_" + UnityEngine.Random.Range(1,10) + ".jpg");
/*  This idea now abandoned.   
		 strUrl = GLOBAL.GetUrl_Benchmark("med_image_asset_" + UnityEngine.Random.Range(1,10) + ".jpg?t=" + DateTime.Now.Ticks.ToString());
		 www = new WWW(strUrl);
		 yield return www;
		 strUrl = GLOBAL.GetUrl_Benchmark("med_image_asset_" + UnityEngine.Random.Range(1,10) + ".jpg?t=" + DateTime.Now.Ticks.ToString());
		 www = new WWW(strUrl);
		 yield return www;
*/

		float fTimeDelta = Time.unscaledTime - _fTimeStamp;

		fPeteLoadTime = fTimeDelta;		// save for calc below  peter

// magic equation for the day...
		_data_download_time = Pround(fTimeDelta).ToString();

// Peter		_strbText.AppendLine();
		_strbText.AppendLine("\t\tDownload Time: " + _data_download_time + " seconds.");
//		_strbText.AppendLine();

		// yield return new WaitForSeconds(1.0f);
		// rimg_Image.gameObject.SetActive(false);

		StartCoroutine(GatherMetrics_WebBrowser());
	}

	private IEnumerator GatherMetrics_WebBrowser()
	{

//		_strbText.Append("Checking Web Browser");
		UpdateText();

		yield return new WaitForSeconds(0.5f);

//		_strbText.AppendLine();
//		_strbText.AppendLine("\t[NOT IMPLEMENTED YET]");
//		_strbText.AppendLine();


		StartCoroutine(GatherMetrics_WebGLMemory());
	}

	private IEnumerator GatherMetrics_WebGLMemory()
	{

//		_strbText.Append("Checking WebGL Memory Usage");
		UpdateText();

		yield return new WaitForSeconds(0.5f);


//		_strbText.AppendLine("\t[NOT IMPLEMENTED YET]");
//		_strbText.AppendLine();


		StartCoroutine(GatherMetrics_LoadScene());
	}

	private IEnumerator GatherMetrics_LoadScene()
	{
		_strbText.Append("Checking Scene Load Time");
		UpdateText();

		_fTimeStamp = Time.unscaledTime;

		//yield return new WaitForSeconds(0.0f);

		//yield return SceneManager.LoadSceneAsync("Outside", LoadSceneMode.Additive);
		yield return SceneManager.LoadSceneAsync("city_hall", LoadSceneMode.Additive);

		float fTimeDelta = Time.unscaledTime - _fTimeStamp;

		fPeteScloadTime=fTimeDelta;	// Load scene time

		if (fPeteScloadTime>10) bPeteScload=false;
		else
			bPeteScload=true;					// callingg it pass fail for now.  pa


//		_data_scene_load_time = fTimeDelta.ToString();
		_data_scene_load_time = Pround(fTimeDelta).ToString();

//		Pround(fTimeDelta)

//		_strbText.AppendLine();
		_strbText.AppendLine("\t\tLoad Time: " + _data_scene_load_time + " seconds.");
//		_strbText.AppendLine();

		StartCoroutine(GatherMetrics_FPS());
	}

	private IEnumerator GatherMetrics_FPS()
	{
		_strbText.Append("Checking Framerate\t");
		UpdateText();

		yield return new WaitForSeconds(0.5f);

		_fTimeStamp = Time.unscaledTime;
		_bRecordingFPS = true;
		_iRecordedFrameCount = 0;

		yield return new WaitForSeconds(10.0f);

		_bRecordingFPS = false;

		float fTimeDelta = Time.unscaledTime - _fTimeStamp;
		float fFPS = (float)_iRecordedFrameCount / fTimeDelta;

		_data_fps_record_time = fTimeDelta.ToString();
		_data_fps_frame_count = _iRecordedFrameCount.ToString();
// old way		_data_fps = fFPS.ToString();
		fPeteFrameRate = Pround(fFPS);			// save frame rate

//new way!
		_data_fps = Pround(fFPS).ToString();



// pa		_strbText.AppendLine();
//	pa	_strbText.AppendLine("\tTime Recorded: " + _data_fps_record_time + " seconds");
//	pa	_strbText.AppendLine("\tFrames Counted: " + _data_fps_frame_count);
//		_strbText.AppendLine("\tFrames Per Second: " + _data_fps);

		_strbText.AppendLine("\t\t\t\tFrames Per Second: " + _data_fps);

//		_strbText.AppendLine();

		StartCoroutine(GatherMetrics_MultiplayerServerConnection());
	}

	private IEnumerator GatherMetrics_MultiplayerServerConnection()
	{
		_strbText.Append("Checking Multiplayer (spillmp.us) Connect: ");
		UpdateText();

		yield return new WaitForSeconds(1.0f);

		_fTimeStamp = Time.unscaledTime;

		// Attempt to connect to a page on the server and measure the time.
		string strUrl = GLOBAL.GetUrl_Multiplayer("metrics/ping.php");
		WWW www = new WWW(strUrl);

		yield return www;
		if (www.text.Equals("ping"))
		{
			float fTimeDelta = Time.unscaledTime - _fTimeStamp;

			fPeteConTime = fTimeDelta;

			_data_web_server_connection = Pround(fTimeDelta).ToString();

			bMultiplayerConnect = true;				// success!

		}
		else
		{
			_data_web_server_connection = "FAILED";


			bMultiplayerConnect = false;				// failure!

		}

		_strbText.AppendLine("\t\t"+_data_web_server_connection);  // Peter tweaking

		StartCoroutine(GatherMetrics_DataServerConnection());
	}

	private IEnumerator GatherMetrics_DataServerConnection()
	{

		_strbText.Append("Checking Database (spillweb.us) Connect: ");
		UpdateText();

		yield return new WaitForSeconds(1.0f);

		_fTimeStamp = Time.unscaledTime;

		// Attempt to connect to a page on the server and measure the time.
		string strUrl = GLOBAL.GetUrl_Database("metrics/ping.php");
		WWW www = new WWW(strUrl);

		yield return www;
		
		if (www.text.Equals("ping"))
		{
			float fTimeDelta = Time.unscaledTime - _fTimeStamp;

			fPeteConTime = fTimeDelta;

			_data_web_server_connection = Pround(fTimeDelta).ToString();

			bDataConnect = true;				// success!

		}
		else
		{
			_data_web_server_connection = "FAILED";

			bDataConnect = false;				// failure!

		}

		_strbText.AppendLine("\t\t"+_data_web_server_connection);  // Peter tweaking


		StartCoroutine(FinishMetrics_PlaySound());
	}

	private IEnumerator FinishMetrics_PlaySound()
	{
		yield return new WaitForSeconds(0.0f);


		_strbText.AppendLine();
		_strbText.AppendLine();

		_strbText.AppendLine("=== ALL TESTS DONE ===");

		string petestring = "Peter was here again";
		float petescore = fPeteLoadTime;		// Raw Seconds - Peter gets about 12

/*
		if (bMultiplayerConnect)
			_strbText.AppendLine("Multiplayer Server Connect:\tPASSED");
		else
			_strbText.AppendLine("Multiplayer Server Connect:\tFAILED - Have IT check White List info on FAQ");

		if (bDataConnect)
			_strbText.AppendLine("Data Server Connect:\t\tPASSED");
		else
			_strbText.AppendLine("Data Server Connect:\t\tFAILED - Have IT check White List info on FAQ");


		if (bPeteScload)
			_strbText.AppendLine("Scene Load Test: \t\tPASSED");
		else
			_strbText.AppendLine("Scene Load Test: \t\tFAILED - Have IT check White List info on FAQ");

*/
		if (bMultiplayerConnect && bDataConnect && bPeteScload )
				_strbText.AppendLine("All Server Connections: \t\t\tPASSED");

		else
			_strbText.AppendLine("Server Connections:\t\t\tFAILED");



		_data_fps = Pround(fPeteFrameRate).ToString();

		if (fPeteFrameRate<3)
			_strbText.AppendLine("Frame Rate: "+_data_fps+" FPS    \t\tPOOR- Consider different browser");
		else if (fPeteFrameRate<7)
			_strbText.AppendLine("Frame Rate: "+_data_fps+" FPS    \t\tSLOW- Experience may be choppy");
		else if (fPeteFrameRate<11.5)
			_strbText.AppendLine("Frame Rate: "+_data_fps+" FPS    \t\tPASSABLE- a litte choppy");
		else if (fPeteFrameRate<17)
			_strbText.AppendLine("Frame Rate: "+_data_fps+" FPS    \t\tOK- Experience should be ok");
		else if (fPeteFrameRate<25)
			_strbText.AppendLine("Frame Rate: "+_data_fps+" FPS    \t\tGOOD!");
		else
			_strbText.AppendLine("Frame Rate: "+_data_fps+" FPS    \t\tEXCELLENT!");




//	pa	_strbText.AppendLine("\tFrames Counted: " + _data_fps_frame_count);

//		_strbText.AppendLine("Performance Score: "+ petescore.ToString() + "   (lower is better)");
		float peteinv = 30.0f / petescore;    // Make it geared off peter' 12 second load
 		peteinv = Mathf.Sqrt(peteinv);        // Get square root so it doesn't sound insane

		if (!bMultiplayerConnect || !bDataConnect  || !bPeteScload )
		{
			_strbText.AppendLine("Bandwidth Score: "+ Pround(peteinv).ToString()  );
			_strbText.AppendLine();
			_strbText.AppendLine();
			_strbText.AppendLine("Recommendations:");
			_strbText.AppendLine("Server Connection Issue: This will prevent students from playing!");
			_strbText.AppendLine();
			_strbText.AppendLine("Ask your IT team about 'White Listing' the URLs");
			_strbText.AppendLine("listed on the Virtual Team Challeng site's FAQS!");
			
		}
		else
		{


		if (peteinv<0.7)       // about less than one.  really kinda bad.

		{
			_strbText.AppendLine("Bandwidth Score: "+ Pround(peteinv).ToString() + "\t\t\t\t(extremely slow)");
			_strbText.AppendLine();
			_strbText.AppendLine("Recommendations:");
			_strbText.AppendLine("At this time, your connection to our servers is extremely slow.");	
			_strbText.AppendLine("No more than one student should load at a time.");
			_strbText.AppendLine("Once loaded, select 'Limit Dialog Audio' in Options.");	
		}

		else if (peteinv<1.3)       // about 1
		{
			_strbText.AppendLine("Bandwidth Score: "+ Pround(peteinv).ToString() + "\t\t\t\t(VERY SLOW)");
			_strbText.AppendLine();
			_strbText.AppendLine("Recommendations:");
			_strbText.AppendLine("No more than one student should load at a time.");	
			_strbText.AppendLine("Consider selecting 'Limit Dialog Audio' in Options after loading.");	
		}

		else if (peteinv<2)		// about 1.7
		{
			_strbText.AppendLine("Bandwidth Score: "+ Pround(peteinv).ToString() + "\t\t\t\t(SLOW)");
			_strbText.AppendLine();
			_strbText.AppendLine("Recommendations:");
			_strbText.AppendLine("No more than two students should load at a time.");	
			_strbText.AppendLine("No more than about 6 students should play simultaneously.");	
		}

		else if (peteinv<4)    // four
		{

			_strbText.AppendLine("Bandwidth Score: "+ Pround(peteinv).ToString() + "\t\t\t\t(GOOD)");
			_strbText.AppendLine();
			_strbText.AppendLine("Recommendations:");
			_strbText.AppendLine("No more than five students should load at a time.");	
			_strbText.AppendLine("No more than about 15 students should play simultaneously.");

		}


		else if (peteinv<10)
		{
			_strbText.AppendLine("Bandwidth Score: "+ Pround(peteinv).ToString() + "\t\t\t\t(VERY GOOD)");
			_strbText.AppendLine();
			_strbText.AppendLine("Recommendations:");
			_strbText.AppendLine("No more than ten students should load at a time.");	
			_strbText.AppendLine("No more than about 30 students should play simultaneously.");


		}

		else
		{
			_strbText.AppendLine("Bandwidth Score: "+  Pround(peteinv).ToString() + "\t\t\t\t(EXCELLENT)");
			_strbText.AppendLine();
			_strbText.AppendLine("Recommendations:");			
			_strbText.AppendLine("No more than twenty students should load at a time.");	
			_strbText.AppendLine("No more than about 50 students should play simultaneously.");
			_strbText.AppendLine("Mostly so our servers don't break with your super fast connection!!");

		}

			
		}




		_bAllMetricsGathered = true;

		_data_complete = true;

		UpdateText();

		// Play the finished sound clip.
		_audioSource.Play();
	}

	public void btn_OK_Click()
	{
		_bAllMetricsGathered = true;

		StartCoroutine(Web_SendData());
	}

	private void Exit()
	{
		//SceneManager.LoadScene("LandingScreen");

		GLOBAL.QuitGame();
	}

	private string PrepJSON()
	{
		JSONObject objJSON = new JSONObject();

		objJSON.AddField("complete",              JSONObject.Create(_data_complete.ToString()));
		objJSON.AddField("ip_address",            _data_ip_address);
		objJSON.AddField("download_time",         JSONObject.Create(_data_download_time));
		objJSON.AddField("web_browser",           JSONObject.Create(_data_web_browser));
		objJSON.AddField("web_gl_memory_usage",   JSONObject.Create(_data_web_gl_memory_usage));
		objJSON.AddField("scene_load_time",       JSONObject.Create(_data_scene_load_time));
		objJSON.AddField("fps_record_time",       JSONObject.Create(_data_fps_record_time));
		objJSON.AddField("fps_frame_count",       JSONObject.Create(_data_fps_frame_count));
		objJSON.AddField("fps",                   JSONObject.Create(_data_fps));
		objJSON.AddField("web_server_connection", JSONObject.Create(_data_web_server_connection));

		return objJSON.ToString();
	}

	private IEnumerator Web_SendData(bool bYield = true)
	{
		string strUrl = GLOBAL.GetUrl_Multiplayer("save_metrics_data.php");

		WWWForm wwwForm = new WWWForm();

		string data = PrepJSON();

		wwwForm.AddField("data", data);

		// Debug.Log("-- Set to Send Message. --");

		WWW www = new WWW(strUrl, wwwForm);

		if (bYield)
		{
			yield return www;
		}

		// Debug.Log("-- Web Result Received. --");

		string strResult = www.text;

		// Debug.Log(strResult);

		JSONObject objJSON = new JSONObject(strResult);

		if (   objJSON["error"] == null
			|| objJSON["error"].type == JSONObject.Type.NULL)
		{
			// Exit the scene.
			Exit();
		}
		else
		{
			Debug.Log(objJSON["error"].str);

			_strbText.AppendLine();
			_strbText.AppendLine("\tERROR: UNABLE TO SAVE DATA TO SERVER.");
		}
	}
}
