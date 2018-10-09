using UnityEngine;
using UnityEngine.SceneManagement;
using System.Collections;
using UnityEngine.UI; 

public class UI_MiniMap : MonoBehaviour
{

	public static UI_MiniMap instance;
	public GameObject    canvas;

	public Transform     targetPlayer;
	public Transform     world_relativeAxis; 
	public Vector2       world_areaSize = new Vector2(50, 50);

	public RectTransform content_hotspots;
	public RectTransform content_playerArrow;

	public RectTransform arrow_ui;
	public Vector3       arrow_rotationOffset;

	public Text           hotspotText_text;
	private RectTransform hotspotText_parent;

	#region UI_Manager calls

	public static void Load()
	{
		if (instance == null)
		{
			SceneManager.LoadScene("UI_MiniMap", LoadSceneMode.Additive);
		}
	}

	public static void ToggleOpenClose()
	{
		instance.canvas.SetActive(!instance.canvas.activeInHierarchy);

		if(!instance.canvas.activeInHierarchy)
			instance.OnDisable();
		else
			instance.OnEnable();

		Debug.Log("UI_MiniMap - ToggleOpenClose() - Active: " + instance.canvas.activeInHierarchy);
	}

	public static void ToggleOpenClose(bool active)
	{
		instance.canvas.SetActive(active);

		if(!active)
			instance.OnDisable();
		else
			instance.OnEnable();

		Debug.Log("UI_MiniMap - ToggleOpenClose() - Active: " + active);
	}

	#endregion

	#region MonoBehaviour Calls

	void Awake(){
		instance = this;
	}

	// Use this for initialization
	void Start(){
		canvas.SetActive(false);

		hotspotText_parent = hotspotText_text.transform.parent.GetComponent<RectTransform>();

		OnDisable();
	}

	void OnEnable () {
		
		if(targetPlayer == null)
			targetPlayer = GameObject.FindGameObjectWithTag("Player").transform;
		
	}
	void OnDisable(){

		HideText();
	}

	// Update is called once per frame
	void Update () {

		if(!canvas.activeInHierarchy)
			return;

		if(targetPlayer == null){
			ToggleOpenClose(false);
			return;
		}

		// arrow
		Vector2 content_size = content_playerArrow.sizeDelta;
		Vector2 arrowSpot = (Vector2) world_relativeAxis.InverseTransformPoint(targetPlayer.position);
	
		// normal values
		arrowSpot.x = arrowSpot.x/world_areaSize.x;
		arrowSpot.y = arrowSpot.y/world_areaSize.y;

		// convert to content size
		arrowSpot.x *= content_size.x;
		arrowSpot.y *= content_size.y;

		arrow_ui.rotation = Quaternion.Euler(arrow_rotationOffset.x, arrow_rotationOffset.y, targetPlayer.eulerAngles.y + arrow_rotationOffset.z);
		arrow_ui.anchoredPosition =  arrowSpot;


		// text panel
		if(hotspotText_parent.gameObject.activeInHierarchy){

			// position bottom right of the Mouse
			Vector3 mousePosition = Input.mousePosition;

			// normalize
			mousePosition.x = mousePosition.x/Screen.width;
			mousePosition.y = mousePosition.y/Screen.height;
			mousePosition.z = 0.0f;

			Vector2 canvasSize = canvas.GetComponent<RectTransform>().sizeDelta;

			// convert to canvas coordinates
			mousePosition.x *= canvasSize.x;
			mousePosition.y *= canvasSize.y;

			// so it doesn't clip off
			if(mousePosition.x >= canvasSize.x - hotspotText_parent.sizeDelta.x){
				hotspotText_parent.pivot = new Vector2(1.0f, 1.0f);
			}else{
				hotspotText_parent.pivot = new Vector2(0.0f, 1.0f);
			}

			hotspotText_parent.anchoredPosition3D = mousePosition;

		}
	}

	void OnDestroy()
	{
		if (instance == this)
			instance = null;
	}

	void OnDrawGizmos () {

		Vector3[] fourpoints = new Vector3[]{

			world_relativeAxis.position,
			world_relativeAxis.TransformPoint( new Vector3(0,world_areaSize.y,0)),
			world_relativeAxis.TransformPoint((Vector3) world_areaSize),
			world_relativeAxis.TransformPoint( new Vector3(world_areaSize.x,0,0))

		};

		Gizmos.color = Color.yellow;

		Gizmos.DrawLine(fourpoints[0], fourpoints[1]); // left
		Gizmos.DrawLine(fourpoints[1], fourpoints[2]); // top
		Gizmos.DrawLine(fourpoints[2], fourpoints[3]); // right
		Gizmos.DrawLine(fourpoints[3], fourpoints[0]); // bottom
		Gizmos.DrawLine(fourpoints[0], fourpoints[2]); // across
		Gizmos.DrawLine(fourpoints[1], fourpoints[3]); // across

	}

	#endregion

	public void Button_Close(){

		UI_MiniMap.ToggleOpenClose(false);
	}

	#region Hotspot calls

	public static void ShowText(string text){

		instance.hotspotText_parent.gameObject.SetActive(true);

		int numOfLines = text.Split('\n').Length;
		numOfLines++;

		Vector2 panelSize = instance.hotspotText_parent.sizeDelta;
		panelSize.y = 20.0f * numOfLines;
		instance.hotspotText_parent.sizeDelta = panelSize;

		instance.hotspotText_text.text = text;

	}

	public static void HideText(){

		instance.hotspotText_parent.gameObject.SetActive(false);

	}

	#endregion

	#if UNITY_EDITOR
	// emergency only
	/*
	//[MenuItem ("MyMenu/Do Something")] 
	static void DoSomething () {
		GameObject.FindObjectOfType<UI_MiniMap>().Create_from_source();
	}

	// values from the source
	void Create_from_source(){

		Vector2 sourceSize = new Vector2();

		Vector2[] positions = new Vector2[]{

			new Vector2(200,200),
			new Vector2(349,556),
			new Vector2(349,590),
			new Vector2(349,635),
			new Vector2(291,786),
			new Vector2(291,235),
			new Vector2(417,370),
			new Vector2(218,313),
			new Vector2(388,261),
			new Vector2(250,445),
			new Vector2(122,645),
			new Vector2( 23,546),
			new Vector2(232,644),
			new Vector2( 24,645),
			new Vector2(374,475),
			new Vector2(115,372),
			new Vector2(124,486),
			new Vector2(229,385),
			new Vector2(232,572),
			new Vector2( 24,412),
			new Vector2(204,838),
			new Vector2( 24,726),
			new Vector2( 27,837),
			new Vector2(216,734),
			new Vector2( 97,838),
			new Vector2(101,726),
			new Vector2(643,372),
			new Vector2( 24,239),
			new Vector2(109,154),
			new Vector2(110,250),
			new Vector2( 25,138),
			new Vector2(270, 44),
			new Vector2(552,373),
			new Vector2(552,440),
			new Vector2(143, 45),
			new Vector2(409,734),
			new Vector2(350,675),
			new Vector2(553,735),
			new Vector2(475,646),
			new Vector2(475,600),
			new Vector2(604,840),
			new Vector2(552,495),
			new Vector2(290,837),
			new Vector2(463,841),
			new Vector2(474,735),
			new Vector2( 31, 44),
			new Vector2(475,561),
			new Vector2(551,553),
			new Vector2(705,798),
			new Vector2(590,716),
			new Vector2(571,645)
		};

		string[] names = new string[]{

			"Botanical Gardens",
			"Team Office",
			"Interstate Containment",
			"New Media Communications",
			"Library",
			"City Hall \n Mayor's Office \n Will Standon",
			"United Americans Club",
			"Newspaper Stand",
			"Hot Dog Cart",
			"Korpis and Partners",
			"Potty Princess Showroom",
			"Burells Brothers",
			"Power Planning Services",
			"Techtronics Showroom",
			"Norse Communications",
			"Midway Amusements",
			"New City Tools and Equipment Co.",
			"Mane Hair Salon",
			"New City Cinema",
			"Office Building 2\nYpoforo Ecosystems\nMullen Medical Supplies\nNational Readiness Services\nDis-Pos Corp\nClikads Hi-Tech Office\nPostahz Ad. Agency\nPhoenix Services",
			"Markdown St. Diner",
			"Hip Hop House",
			"West Disposal",
			"Western Logistics",
			"Wes Berlin's Mother's House",
			"The Tchochke Shop",
			"Bona Fortuna",
			"Clean Green Machinery",
			"Running Rivers Corporation",
			"Luisa's Kitchen",
			"Recording Studio",
			"Heather Winehart's Loft",
			"Vitelli's Butcher Shop",
			"Prairie Services",
			"Office Building 1\nMedia Relations, Inc.\nGates & Partners Consulting\nNarravi Associates\nForce One\nRestoration Research Associates\nDewey, Sewim, and Howe",
			"Enviro-X",
			"Internet Cafe",
			"Eco-Tech",
			"Needles & Threads Clothing Shop",
			"Eastern Legal",
			"Lindo Equipment",
			"Cramarosa's",
			"Tie-Dye Loft",
			"Premiere Containment",
			"Big Fun Entertainment",
			"Throne Time",
			"Pauline's Clothing Shop",
			"Can't Get Enough Media & Music",
			"Boater's Paradise",
			"First Responders",
			"Office Building 3\nNew City Emergency Medic\nMedic! Inc.\nNew City Preservation Society\nRestoration Group\nCritical Point Consulting"

		};

		GameObject hotspot = content.GetChild(0).gameObject;
		for(int i=content.childCount; i<positions.Length; i++){
			GameObject obj = Instantiate(hotspot) as GameObject;
			obj.GetComponent<RectTransform>().SetParent(content);
		}

		for(int i=content.childCount; i>positions.Length; i--){
			Destroy(content.GetChild(i-1));
		}

		float mapwidth = 754.0f;
		float mapheight = 892.0f;

		Vector2 normalizedPos = Vector2.zero;
		for(int i=0; i<content.childCount; i++){

			RectTransform spot = content.GetChild(i).GetComponent<RectTransform>();
			spot.name = names[i];

			normalizedPos = positions[i];
			normalizedPos.x = normalizedPos.x/mapwidth;
			normalizedPos.y = normalizedPos.y/mapheight;
			normalizedPos.Scale(content.sizeDelta);
			normalizedPos.y *= -1.0f;

			spot.anchoredPosition = normalizedPos;

		}
			
	}
	*/
	#endif
}
