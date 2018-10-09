using UnityEngine;
using UnityEngine.SceneManagement;
using System;
using System.Collections;
using UnityEngine.UI;
using MaterialUI;

public class UIManager : MonoBehaviour
{
    public GameObject PlayerObject;
    public GameObject Panel_Audio;
    public GameObject Panel_ProgressReport;
    public GameObject Panel_Inventory;
    public GameObject Panel_Journal;
    public GameObject Panel_Map;
    public GameObject topCameObj;
    public UIManager uimanager;
    public InputField chatInput;

    bool isAudio;
    bool isMap;
    bool isInventory;
    bool isJournal;
    bool isProgressReport;

    /************** buttons ************/
    public Toggle BtnAudio;

    /************************ Custom Functions ******************************************/

    public void AudioSetting(bool isEnable)
    {
        if (!isEnable)
        {
            Panel_Audio.SetActive(false);
        }
        else if (isEnable)
        {
            Panel_Audio.SetActive(true);
        }
    }
    public void ProgressReport(bool isEnable)
    {
        if (!isEnable)
        {
            Panel_ProgressReport.SetActive(false);
        }
        else if (isEnable)
        {
            Panel_ProgressReport.SetActive(true);
        }
    }
    public void Inventory(bool isEnable)
    {
        if (!isEnable)
        {
            Panel_Inventory.SetActive(false);
        }
        else if (isEnable)
        {
            Panel_Inventory.SetActive(true);
        }
    }
    public void Journal(bool isEnable)
    {
        // BChance: (2016-01-08) - Subbed in my custom Journal UI implementation.
        if (!isEnable)
        {
            //Panel_Journal.SetActive(false);
            UI_Journal.Close();
        }
        else if (isEnable)
        {
            //Panel_Journal.SetActive(true);
            UI_Journal.Open();
        }
    }
    /******************************** buttons events ********************************************/

    public void SoundAction()
    {
        isJournal = isInventory = isProgressReport = false;
        isAudio = !isAudio;
        AudioSetting(isAudio);
        Panel_Journal.SetActive(false);
        //Panel_Inventory.SetActive(false);
        UI_Inventory.ToggleOpenClose(false);
        Panel_ProgressReport.SetActive(false);

    }
    public void ProgressAction()
    {
        isAudio = isInventory = isJournal = false;
        isProgressReport = !isProgressReport;
        ProgressReport(isProgressReport);
        Panel_Journal.SetActive(false);
        //Panel_Inventory.SetActive(false);
        UI_Inventory.ToggleOpenClose(false);
        Panel_Audio.SetActive(false);
    }
    public void InventoryAction()
    {
        isJournal = isAudio = isProgressReport = false;
        isInventory = !isInventory;
        //Inventory(isInventory);
        UI_Inventory.ToggleOpenClose(isInventory);
        Panel_Journal.SetActive(false);
        Panel_ProgressReport.SetActive(false);
        Panel_Audio.SetActive(false);
    }
    public void JournalAction()
    {
        isAudio = isInventory = isProgressReport = false;
        isJournal = !isJournal;
        //Journal(isJournal);
        //Panel_Inventory.SetActive(false);
        UI_Inventory.ToggleOpenClose(false);
        Panel_ProgressReport.SetActive(false);
        Panel_Audio.SetActive(false);

        // BChance: (2016-01-08) - Toggle the UI_Journal.
        UI_Journal.ToggleOpenClose();
    }
    public void MapAction()
	{
		// Dustin: (2016-05-02) - open and close the minimap
		// Yeah sometimes the O changes case
		if (SceneManager.GetActiveScene().name == "Outside" || SceneManager.GetActiveScene().name == "outside")
			UI_MiniMap.ToggleOpenClose();
		else
			UI_MiniMap.ToggleOpenClose(false);
		/*
        if (GameObject.Find("TopViewCamera") != null)
        {

            Panel_Map.SetActive(false);
        }
        else
        {
            Panel_Map.SetActive(!Panel_Map.activeSelf);
        }
        */
    }
    public void SoundOff()
    {
        if (BtnAudio.isOn == true)
        {
            PlayerObject.GetComponent<AudioSource>().mute = true;
        }
        else if (BtnAudio.isOn == false)
        {
            PlayerObject.GetComponent<AudioSource>().mute = false;
        }


    }

    /************************ End of Custom Functions ******************************************/

    /************************ Unity Inbuilt Functions *************************************/


    public void OnMouseOver()
    {
        Debug.Log("gameobject");
    }


    public GameObject CanvasObj, chatwindowObj, NPCdialogObj, eventSysObj;
    public static bool isCanvasLoaded = false;
    GameObject obj1;

    void UICreated(bool isLoad)
    {
        if (isLoad == false)
        {
            isCanvasLoaded = true;

            // BChance: (2015-12-02) - Re-added chat window.
            obj1 = Instantiate(chatwindowObj);
            obj1.name = obj1.name.Substring(0, (obj1.name.Length - 7));

            obj1 = Instantiate(NPCdialogObj);
            obj1.name = obj1.name.Substring(0, (obj1.name.Length - 7));

            obj1 = Instantiate(CanvasObj);
            obj1.name = obj1.name.Substring(0, (obj1.name.Length - 7));

            obj1 = Instantiate(eventSysObj);
            obj1.name = obj1.name.Substring(0, (obj1.name.Length - 7));

            uimanager = gameObject.GetComponent<UIManager>();


            Panel_Audio = GameObject.Find("AudioPanel");
            Panel_ProgressReport = GameObject.Find("ProgressPanel");
            Panel_Inventory = GameObject.Find("InventoryPanel");
            Panel_Journal = GameObject.Find("JournalPanel");
            Panel_Map = GameObject.Find("MapPanel");

            Debug.Log("Panel_Audio: " + Panel_Audio);
            Debug.Log("Panel_ProgressReport: " + Panel_ProgressReport);
            Debug.Log("Panel_Inventory: " + Panel_Inventory);
            Debug.Log("Panel_Journal: " + Panel_Journal);
            Debug.Log("Panel_Map: " + Panel_Map);

            GameObject.Find("BtnAudio/Button Layer").GetComponent<Button>().onClick.AddListener(() => { uimanager.SoundAction(); });
            GameObject.Find("BtnInventroy/Button Layer").GetComponent<Button>().onClick.AddListener(() => { uimanager.InventoryAction(); });
            GameObject.Find("BtnJournal/Button Layer").GetComponent<Button>().onClick.AddListener(() => { uimanager.JournalAction(); });
            GameObject.Find("BtnProgress/Button Layer").GetComponent<Button>().onClick.AddListener(() => { uimanager.ProgressAction(); });
            GameObject.Find("BtnJournalMap/Button Layer").GetComponent<Button>().onClick.AddListener(() => { uimanager.MapAction(); });

			// DWhirle: (May 10, 2016)
			GameObject.Find("ImgRoleIcon").transform.GetChild(GLOBAL.Player.progress["playernum"].i - 1).gameObject.SetActive(true);


            isLoad = true;
            //StartCoroutine(waitForNPC());
        }
        else
        {

        }
        if (GameObject.Find("TopViewCamera") != null)
        {
            Panel_Map = GameObject.Find("TopViewCamera");
            //Panel_Map.SetActive(false);
        }
    }

    IEnumerator waitForNPC()
    {
        yield return new WaitForSeconds(5);
        obj1 = Instantiate(NPCdialogObj);
        obj1.name = obj1.name.Substring(0, (obj1.name.Length - 7));
    }

    void Awake()
    {
        //	DontDestroy(gameObject);

        // BChance: (2016-01-07) - Ensure GLOBALs are setup.
        GLOBAL.Init();

        // BChance: (2016-01-30) - Ensure UI_Instruction is setup.
        UI_Instruction.Load();

        // BChance: (2016-01-08) - Ensure UI_Journal is setup.
        UI_Journal.Load();

        // Dustin: (2016-04-02) - Ensure UI_Inventory is setup.
        UI_Inventory.Load();

		// Dustin: (2016-05-02) - Ensure UI_MiniMap is setup.
		UI_MiniMap.Load();

        if (GameObject.Find("TopViewCamera") != null)
        {
            Panel_Map = GameObject.Find("TopViewCamera");
            Panel_Map.SetActive(false);
        }
    }

    void Start()
    {


        UICreated(isCanvasLoaded);

        DontDestroyOnLoad(gameObject);

        Panel_Audio.SetActive(false);
        Panel_Inventory.SetActive(false);
        Panel_Journal.SetActive(false);
        Panel_ProgressReport.SetActive(false);
        Panel_Map.SetActive(false);

    }
    //**************************** Update function

    public void loadTopCam()
    {
        if (GameObject.Find("TopViewCamera") != null)
        {
            Panel_Map = GameObject.Find("TopViewCamera");
            Panel_Map.SetActive(false);
        }
    }
    void Update()
    {
        if (UI_ChatApp.isSelectInput == true)
            return;
        
        if ((isJournal == isInventory == isProgressReport == false) && Input.GetKeyUp(KeyCode.Q))
        {
            SoundAction();
        }

        if ((isJournal == isInventory == isAudio == false) && Input.GetKeyUp(KeyCode.C))
        {
            ProgressAction();
        }

        if ((isJournal == isAudio == isProgressReport == false) && Input.GetKeyUp(KeyCode.I))
        {
            InventoryAction();
        }

        if ((isInventory == isAudio == isProgressReport == false) && Input.GetKeyUp(KeyCode.J))
        {
            JournalAction();
        }

        if ((isInventory == isAudio == isProgressReport == false) && Input.GetKeyUp(KeyCode.M))
        {
            MapAction();
        }

        if (Input.GetKeyUp(KeyCode.Return) | Input.GetKeyUp(KeyCode.KeypadEnter))
        {
            //chatInput.text = "";
        }
    }

    /************************* End of Unity Inbuilt Functions *****************************/
}
