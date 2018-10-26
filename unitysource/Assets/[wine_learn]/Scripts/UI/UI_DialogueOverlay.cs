using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class UI_DialogueOverlay : MonoBehaviour
{
	public Button[] arr_btn_PcResponses = new Button[8];
	public TMP_Text txt_NpcText;

	public CharacterType character = null;

	private string[] arr_jump_PcResponses = new string[8];
	private NPC_Script_Parser _script_parser;
	private Canvas _canvas;

	void Start()
	{
		GLOBAL.ui_dialogue_overlay = this;

		_canvas = GetComponentInChildren<Canvas>();
		_canvas.gameObject.SetActive(false);
	}

	void OnDestroy()
	{
		if (GLOBAL.ui_dialogue_overlay == this)
			GLOBAL.ui_dialogue_overlay = null;
	}

	public static void Load()
	{
		if (GLOBAL.ui_dialogue_overlay == null)
			SceneManager.LoadSceneAsync("UI_dialogue_overlay", LoadSceneMode.Additive);
	}

	void Update()
	{
		
	}

	public void DialogueStart(string path_npc_script)
	{
		NPC_Say("Loading...");
		_canvas.gameObject.SetActive(true);

		StartCoroutine(Web_GetScript(path_npc_script));
	}

	private IEnumerator Web_GetScript(string path_npc_script)
	{
		WWW www = new WWW(path_npc_script);
		yield return www;

		string json = www.text;

		if (!string.IsNullOrEmpty(json))
		{
			_script_parser = new NPC_Script_Parser(json);
			if (character != null)
				character.is_talking = true;
		}
		else
		{
			Debug.LogErrorFormat("Unable process '{0}'. Either file does not exist, or it is empty.", path_npc_script);
		}
	}

	public void DialogueFinish()
	{
		_canvas.gameObject.SetActive(false);
		character.is_talking = false;
		character = null;
	}

	public void NPC_Say(string text)
	{
		txt_NpcText.text = text;

		for (int index_response = 0; index_response < 8; ++index_response)
		{
			arr_btn_PcResponses[index_response].gameObject.SetActive(false);
			arr_jump_PcResponses[index_response] = null;
		}
	}

	public void PC_Response(int index_response, string text, string jump_name)
	{
		Button btn_Response = arr_btn_PcResponses[index_response];

		btn_Response.GetComponentInChildren<TMP_Text>().text = text;
		arr_jump_PcResponses[index_response] = jump_name;
		btn_Response.gameObject.SetActive(true);
	}

	public void btn_Response_Clicked(int index_response)
	{
		string jump_name = arr_jump_PcResponses[index_response];
		_script_parser.ProcessThread(jump_name);
	}
}
