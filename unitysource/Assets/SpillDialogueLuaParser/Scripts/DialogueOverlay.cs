using UnityEngine;
using UnityEngine.SceneManagement;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.IO;
using UnityEngine.UI;
using TMPro;

public class RemoteSound
{
	private string _url = null;
	private bool _abort_audio_download = false;
	private AudioType _audio_type;

	public string Url
	{
		get { return _url; }
		set
		{
			string new_value = value;

			if (new_value != null)
			{
				// Remove the file extension.
				new_value = new_value.Remove(new_value.Length - 4);

				// Set the file extension based on the platform we're running on.
				#if UNITY_EDITOR
					new_value += ".ogg";
					_audio_type = AudioType.OGGVORBIS;
					//new_value = "file:///" + Application.dataPath + "/../sounds/" + new_value;
				#else
					new_value += ".mp3";
					_audio_type = AudioType.MPEG;
					//new_value = Application.dataPath + "/../sounds/" + new_value;
				#endif

				new_value = GLOBAL_old.GetUrl_Assets("sounds/" + new_value);
			}
			
			_url = new_value;
		}
	}

	public IEnumerator DownloadAndPlay(AudioSource source)
	{
		// BChance: Don't download if we're in low bandwidth mode.
		if (!CONFIG_old.LOW_BANDWIDTH)
		{
			Debug.Log("== Downloading '" + _url + "' . . .");

			WWW www = new WWW(_url);

			// Timeout the the download if it's taking too long.
			GLOBAL_old.Instance.StartCoroutine(AudioDownloadTimeout(www));

			// Wait until we've fully downloaded the audio.
			yield return www;

			// If the download has not been aborted, proceed with playing it.
			if (!_abort_audio_download)
			{
				// Store the audio.
				source.clip = www.GetAudioClip(false, false, _audio_type);

				// audioClip.LoadAudioData();

				Debug.Log(string.Format("Finished downloading '{0}'.", _url));

				source.Play();
			}
			else
			{
				_abort_audio_download = false;
				Debug.LogError(string.Format("Download of '{0}' timed out. Skipping download.", _url));
			}
		}
		else
		{
			Debug.Log(string.Format("LOW BANDWIDTH MODE, skipping download of '{0}'.", _url));
		}
	}

	private IEnumerator AudioDownloadTimeout(WWW www)
	{
		yield return new WaitForSeconds(CONFIG_old.AUDIO_DOWNLOAD_TIMEOUT);

		// If we're not done downloading, stop downloading.
		if (!www.isDone)
		{
			_abort_audio_download = true;
			www.Dispose();
		}
	}
};

public class LuaNode
{
	public int iStartIndex = -1;
	public int iEndIndex   = -1;
	public List<string> lstTokens = new List<string>();
	public List<LuaNode> lstChildren  = new List<LuaNode>();
	public string strError = null;
	public int iErrorDepth = -1;
};

// Handles both 'if' and 'goto' commands.
public class DiaEntry_IfGoto
{
	public string key;
	public string op = "NO_CONDITION";
	public MultiType value;
	public string label;
	
	public bool Eval()
	{
		// BChance: (2015-12-14) - Merged IfGoto and Goto.
		//                         If op is not set, defaults to Goto behaviour.
		if (op.Equals("NO_CONDITION"))
			return true;

		if (!GLOBAL_old.Player.progress.ContainsKey(key))
			return false;
		
		// Determine if we're comparing to a constant or a variable.
		MultiType right_side = MultiType.UNKNOWN;
		if (value.IsInt)
			right_side = value;
		else if (value.IsBool)
			right_side = value;
		else if (value.IsString)
			right_side = GLOBAL_old.Player.progress[value.str];

		// Determine how we're comparing.
		if (op.Equals("=="))
			return GLOBAL_old.Player.progress[key] == right_side;
		
		if (op.Equals(">"))
			return GLOBAL_old.Player.progress[key] > right_side;
		
		if (op.Equals("<"))
			return GLOBAL_old.Player.progress[key] < right_side;
		
		if (op.Equals(">="))
			return GLOBAL_old.Player.progress[key] >= right_side;
		
		if (op.Equals("<="))
			return GLOBAL_old.Player.progress[key] <= right_side;
		
		if (op.Equals("!="))
			return GLOBAL_old.Player.progress[key] != right_side;
		
		if (op.Equals("~="))
			return GLOBAL_old.Player.progress[key] != right_side;

		return false;
	}
};

public class DiaBranch_Label
{
	public DiaEntry_NpcText npcText;
	public List<DiaEntry_Function> lstFunctions = new List<DiaEntry_Function>();
	public List<DiaEntry_PcText> lstPcTexts = new List<DiaEntry_PcText>();
	public List<DiaEntry_IfGoto> lstIfGotos = new List<DiaEntry_IfGoto>();
	// public DiaEntry_Goto branchGoto;
};

public class DiaEntry_Label
{
	public int index;
	public string name;
	public List<DiaBranch_Label> lstBranches = new List<DiaBranch_Label>();
	public List<DiaEntry_Function> lstInitialFunctions = new List<DiaEntry_Function>();
	public List<DiaEntry_IfGoto> lstInitialIfGotos = new List<DiaEntry_IfGoto>();
	// public DiaEntry_Goto initialGoto;
};

public class DiaEntry_NpcText
{
	public string text;                           // n
	public RemoteSound sound = new RemoteSound(); // ns
	public MultiType arg1 = MultiType.UNKNOWN;    // ns1
	public MultiType arg2 = MultiType.UNKNOWN;    // ns2
	public MultiType arg3 = MultiType.UNKNOWN;    // ns3
};

public class DiaEntry_PcText
{
	public string text;                        // p
	public string gotoLabel = null;            // pg
	public string score = null;                // pgs
	public MultiType arg1 = MultiType.UNKNOWN; // pg1
	public MultiType arg2 = MultiType.UNKNOWN; // pg2
};

public class DiaEntry_Function
{
	public string name;                        // fun
	public MultiType arg1 = MultiType.UNKNOWN; // fun2
	public MultiType arg2 = MultiType.UNKNOWN; // fun3
};




// === LOGIC BELOW ===

public class DialogueOverlay : MonoBehaviour
{
	public RectTransform overlay_panel;
	public RectTransform grp_NPC;
	public RectTransform grp_PC;

	public Button btn_Option_1;
	public Button btn_Option_2;
	public Button btn_Option_3;
	public Button btn_Option_4;
	public Button btn_Option_5;
	public Button btn_Option_6;
	public Button btn_Option_7;
	public Button btn_Option_8;

	// public Text txt_NpcText;
	public TMP_Text txt_NpcText;
	
	public DiaEntry_Label ActiveLabel;
	public int ActiveDialogueNodeIndex = -1;

	private float _max_height_grp_npc = 0;
	private float _min_pos_y_grp_pc = 0;
	
	public static bool is_open = false;
	public static bool disable_dialogue_audio_loading = false;
	public static string strFilePath_Dialogue;
	public static AudioClip[] arrAudioClips;
	public static CharacterType character;
	public static List<DiaEntry_Function> lstEntries_Function = new List<DiaEntry_Function>();
	public static List<DiaEntry_IfGoto> lstEntries_IfGoto = new List<DiaEntry_IfGoto>();
	public static Dictionary<string,DiaEntry_Label> dictEntries_Label = new Dictionary<string,DiaEntry_Label>();
	public static List<DiaEntry_Label> lstEntries_Label = new List<DiaEntry_Label>();
	
	private static char[] _arrDelimiters = new char[] {'{','}','"',','};
	private static int _iParseCallCount = 0;
	
	private static DialogueOverlay _instance;
	private static bool _bInitialized = false;

	private static AudioSource _audioSource;
	private static bool _bNodeSoundPlayed = false;

	private static string _strFilePath_Folder;

	void Awake()
	{
		Debug.Log("DialogueOverlay Created");
		
		_instance = this;

		_bInitialized = true;
		is_open = true;

		_audioSource = gameObject.GetComponent<AudioSource>();

	}

	void Start()
	{
		_max_height_grp_npc = grp_NPC.rect.height;

		//Debug.Log("_max_height_grp_npc: " + _max_height_grp_npc);

		_min_pos_y_grp_pc = grp_PC.offsetMax.y;

		//Debug.Log("_min_pos_y_grp_pc: " + _min_pos_y_grp_pc);

		// BChance: (2016-08-09) - Ensure that score fields are empty at the start of the dialogue.
		GLOBAL_old.Player.progress["scoreconvo"] = (string)null;
		GLOBAL_old.Player.progress["scorestr"] = (string)null;

		if (!String.IsNullOrEmpty(strFilePath_Dialogue))
		{
			// Store the folder path for the dialogue file.
			//_strFilePath_Folder = strFilePath_Dialogue.Substring(0, strFilePath_Dialogue.LastIndexOf('/') + 1);

			print("strFilePath_Dialogue: " +  strFilePath_Dialogue);
			
			txt_NpcText.text = "Loading...";
			
			btn_Option_1.gameObject.SetActive(false);
			btn_Option_2.gameObject.SetActive(false);
			btn_Option_3.gameObject.SetActive(false);
			btn_Option_4.gameObject.SetActive(false);
			btn_Option_5.gameObject.SetActive(false);
			btn_Option_6.gameObject.SetActive(false);
			btn_Option_7.gameObject.SetActive(false);
			btn_Option_8.gameObject.SetActive(false);
			StartCoroutine(Web_Parse(strFilePath_Dialogue));
		}
		else
		{
			print("No file path set for dialogue content.");
		}
	}

	void Update()
	{
		// float grp_NPC_height = grp_NPC.rect.height;

		float grp_NPC_height = txt_NpcText.rectTransform.rect.height + 24;

		// if (grp_NPC_height > _max_height_grp_npc)
		// {
		// 	grp_NPC_height = _max_height_grp_npc;
		// }

		grp_NPC.SetSizeWithCurrentAnchors(RectTransform.Axis.Vertical, grp_NPC_height);

		//Debug.Log("grp_NPC height: " + grp_NPC.rect.height);

		Vector2 pos_grp_PC = grp_PC.offsetMax;

		// pos_grp_PC.y = _min_pos_y_grp_pc + (_max_height_grp_npc - grp_NPC_height);
		pos_grp_PC.y = -grp_NPC_height;

		grp_PC.offsetMax = pos_grp_PC;

		float grp_PC_height = grp_PC.rect.height;

		overlay_panel.SetSizeWithCurrentAnchors(RectTransform.Axis.Vertical, grp_NPC_height + grp_PC_height);

		//Debug.Log("grp_PC y: " + grp_PC.offsetMax.y);


		// Do we have active label?
		if (ActiveLabel != null)
		{
			DiaBranch_Label branch = ActiveLabel.lstBranches[ActiveDialogueNodeIndex];
			
			//Debug.Log("ActiveLabel found.");

			// Only play audio if we're flagged to do so.
			if (!disable_dialogue_audio_loading)
			{
				// If we haven't played the sound for the current node, attempt to do so.
				if (!_bNodeSoundPlayed)
				{
					//Debug.Log("Sound hasn't played.");

					// Do we have a sound?
					RemoteSound sound = branch.npcText.sound;
					if (   sound != null
						&& sound.Url != null)
					{
						_instance.StartCoroutine(sound.DownloadAndPlay(_audioSource));

						_bNodeSoundPlayed = true;
					}
				}
			}
		}
	}

	void OnDestroy()
	{
		if (_instance == this)
		{
			// Unflag the NPC as talking.
			if (character != null)
			{
				character.is_talking = false;
				Debug.Log("== NPC '" + character.name + "' stopped talking. ==");
			}

			_instance = null;

			is_open = false;
			strFilePath_Dialogue = null;
			arrAudioClips = null;
			character = null;
			lstEntries_Function.Clear();
			lstEntries_IfGoto.Clear();
			dictEntries_Label.Clear();
			lstEntries_Label.Clear();
			_iParseCallCount = 0;
			_bInitialized = false;
			_audioSource = null;
			_bNodeSoundPlayed = false;
			_strFilePath_Folder = null;
		}
	}
	
	public static void Load()
	{
		Debug.Log("Load");

		SceneManager.LoadScene("dialogue_overlay", LoadSceneMode.Additive);


		//// Loop thru the available audio clips.
		//for (int iClipIndex = 0; iClipIndex < arrAudioClips.Length; ++iClipIndex)
		//{
		//	AudioClip clip = arrAudioClips[iClipIndex];
//
		//	// If we have a name match, return the audio clip.
		//	Debug.LogError("AudioClip " + iClipIndex + ": " + clip.name);
		//}
	}

	private static AudioClip GetAudioByName(string strAudioName)
	{
		// Remove the file extension if present.
		int iStringIndex;
		iStringIndex = strAudioName.LastIndexOf(".ogg");
		if (iStringIndex < 0)
			iStringIndex = strAudioName.LastIndexOf(".wav");
		if (iStringIndex > -1)
			strAudioName = strAudioName.Remove(iStringIndex, 4);

		strAudioName = strAudioName.ToLower();

		//Debug.Log("GetAudioByName() - strAudioName: " + strAudioName);

		// Loop thru the available audio clips.
		for (int iClipIndex = 0; iClipIndex < arrAudioClips.Length; ++iClipIndex)
		{
			AudioClip clip = arrAudioClips[iClipIndex];

			// If we have a name match, return the audio clip.
			if (clip.name.ToLower().Equals(strAudioName))
				return clip;
		}

		// If we have no matches, return NULL.
		return null;
	}
	
	private IEnumerator Web_Parse(string strPath)
	{
		
		StringBuilder strbText = new StringBuilder();
		
		WWW www = new WWW(strPath);
		yield return www;
		
		string strText = www.text;
		
		if (!string.IsNullOrEmpty(strText))
		{
			strbText.AppendLine("=== TOKENIZE RESULTS ===");
			strbText.AppendLine();
			
			strbText.AppendLine("Loading: " + strPath);
			strbText.AppendLine();
			
			// txt_NpcText.text = strbText.ToString();

			LuaNode nodeRoot = TokenizeBracedContent(strText);
			
			strbText.AppendLine("ParseCallCount: " + _iParseCallCount);
			strbText.AppendLine();
			strbText.AppendLine();
			
			
			strbText.AppendLine("TOKENS:");
			strbText.AppendLine();
			
			TokensToString(strbText, nodeRoot);
			
			print(strbText.ToString());
			
			DiaEntry_Label entry_Label = null;
			ExtractDialogueEntries(nodeRoot, ref entry_Label);
			
			print("--- Dialogue Entries Extracted. ---");

			// Flag the NPC as talking.
			if (character != null)
			{
				character.is_talking = true;
				Debug.Log("== NPC '" + character.name + "' started talking. ==");
			}
			
			ProcessDialogueEntries();
			
			print("--- Dialogue Entries Processed. ---");
		}
		else
		{
			Debug.LogError(string.Format("Unable process '{0}'. Either file does not exist, or it is empty.", strPath));
		}
	}
	
	private void TokensToString(StringBuilder strbText, LuaNode node, int iIndentationLevel = 0)
	{
		if (node.lstTokens.Count > 0)
		{
			strbText.Append(new String('\t', iIndentationLevel));
			strbText.Append(node.lstTokens[0]);
			for (int iTokenIndex = 1; iTokenIndex < node.lstTokens.Count; ++iTokenIndex)
			{
				strbText.Append("  |  ");
				strbText.Append(node.lstTokens[iTokenIndex]);
			}
			strbText.AppendLine();
			strbText.AppendLine();
		}
		
		for (int iChildIndex = 0; iChildIndex < node.lstChildren.Count; ++iChildIndex)
		{
			LuaNode childNode = node.lstChildren[iChildIndex];
			
			TokensToString(strbText, childNode, iIndentationLevel + 1);
		}
	}
	
	private LuaNode TokenizeBracedContent(string strText, int iPrevDelimiterIndex = -1)
	{
		++_iParseCallCount;
		
		LuaNode node = new LuaNode();
		
		try
		{
			//print("START iPrevDelimiterIndex: " + iPrevDelimiterIndex);
			
			// If we're at the start of parsing, search for the first open brace.
			if (iPrevDelimiterIndex < 0)
			{
				iPrevDelimiterIndex = strText.IndexOf('{');
				
				//print("MODIFIED iPrevDelimiterIndex: " + iPrevDelimiterIndex);
			}
			
			// If we've found a open brace character continue.
			if (iPrevDelimiterIndex > -1)
			{
				// Store the starting point of the node.
				node.iStartIndex = iPrevDelimiterIndex;
				
				++iPrevDelimiterIndex;
				
				int iDelimiterIndex = -1;
				
				// Loop until we've found a closing brace.
				while (node.iEndIndex < 0)
				{
					// Search for the next delimiter.
					iDelimiterIndex = strText.IndexOfAny(_arrDelimiters, iPrevDelimiterIndex);
					
					// If we've found a delimiter, process it.
					if (iDelimiterIndex > -1)
					{
						int iSubLength = iDelimiterIndex - iPrevDelimiterIndex;
						string strStatement = strText.Substring(iPrevDelimiterIndex, iSubLength);
						//print("strStatement (" + iPrevDelimiterIndex + "-" + iDelimiterIndex + "): " + strStatement);
						strStatement =
							strStatement.Trim()
								.Replace("\\\"", "\"")
								.Replace("\\t", "\t")
								.Replace("\\r", "\r")
								.Replace("\\n", "\n")
								.Replace("\\\\", "\\");
						
						// Ignore LUA comments.
						if (strStatement.StartsWith("--"))
						{
							iDelimiterIndex = strText.IndexOf('\n', iPrevDelimiterIndex);
							//print("END OF COMMENT - iDelimiterIndex: " + iDelimiterIndex);
							if (iDelimiterIndex < 0)
							{
								iDelimiterIndex = strText.Length - 1;
								break;
							}
						}
						else if (strText[iDelimiterIndex] == '"')
						{
							++iDelimiterIndex;
							
							int iStringStartIndex = iDelimiterIndex;
							int iStringEndIndex = -1;
							while (iStringEndIndex < 0)
							{
								iStringEndIndex = strText.IndexOf('"', iStringStartIndex);
								
								if (iStringEndIndex > -1)
								{
									// If this is an escaped double quote, keep searching.
									if (strText[iStringEndIndex - 1] == '\\')
									{
										iStringStartIndex = iStringEndIndex + 1;
										iStringEndIndex = -1;
									}
									else
									{
										iSubLength = iStringEndIndex - iDelimiterIndex;
										
										strStatement =
											strText.Substring(iDelimiterIndex, iSubLength).Trim()
												.Replace("\\\"", "\"")
												.Replace("\\t", "\t")
												.Replace("\\r", "\r")
												.Replace("\\n", "\n")
												.Replace("\\\\", "\\");
										
										if (strStatement.Length > 0)
										{
											node.lstTokens.Add(strStatement);
										}
										
										iDelimiterIndex = iStringEndIndex;
									}
								}
								else
								{
									throw new Exception("Unable find closing double quote for string.");
								}
							}
						}
						else
						{
							if (strStatement.Length > 0)
							{
								node.lstTokens.Add(strStatement);
							}
							
							if (strText[iDelimiterIndex] == '}')
							{
								node.iEndIndex = iDelimiterIndex;
							}
							else
								if (strText[iDelimiterIndex] == '{')
							{
								//print("Parsing new node - iDelimiterIndex: " + iDelimiterIndex);
								
								LuaNode nodeChild = TokenizeBracedContent(strText, iDelimiterIndex);
								
								//print("Done parsing new node - iEndIndex: " + nodeChild.iEndIndex);
								
								if (nodeChild.strError != null)
								{
									node.strError = nodeChild.strError;
									node.iErrorDepth = nodeChild.iErrorDepth + 1;
									
									break;
								}
								
								node.lstChildren.Add(nodeChild);
								
								iDelimiterIndex = nodeChild.iEndIndex;
								
								if (_iParseCallCount > 3)
								{
									// break;
								}
							}
						}
						
						iPrevDelimiterIndex = iDelimiterIndex + 1;
					}
					else
					{
						throw new Exception("Unable find closing brace.");
					}
				}
			}
			else
			{
				throw new Exception("Unable find opening brace.");
			}
		}
		catch (Exception e)
		{
			node.strError = "ERROR: " + e.Message;
			node.iErrorDepth = 0;
		}
		
		return node;
	}
	
	public static void ExtractDialogueEntries(LuaNode node, ref DiaEntry_Label entry_Label, bool bClearEntries = true, int iLuaNodeIndex = 0)
	{
		if (bClearEntries)
		{
			lstEntries_IfGoto.Clear();
			dictEntries_Label.Clear();
			lstEntries_Label.Clear();
		}
		
		if (node.lstTokens.Count > 0)
		{
			string strType = node.lstTokens[0].ToLower();
			
			if (strType.Equals("if"))
			{
				try
				{
					if (node.lstTokens.Count == 5)
					{
						DiaEntry_IfGoto entry = new DiaEntry_IfGoto();
						entry.key = node.lstTokens[1];
						entry.op = node.lstTokens[2];
						entry.value = node.lstTokens[3];
						entry.label = node.lstTokens[4];
						
						//Debug.LogError(entry.key+"\t"+entry.op+"\t"+entry.value+"\t"+entry.label+"**************");
						
						if (entry_Label == null)
						{
							// General
							lstEntries_IfGoto.Add(entry);
						}
						else
						{
							if (entry_Label.lstBranches.Count > 0)
							{
								// Branch
								DiaBranch_Label branch = entry_Label.lstBranches.Last();
								branch.lstIfGotos.Add(entry);
							}
							else
							{
								// Label
								entry_Label.lstInitialIfGotos.Add(entry);
							}
						}
					}
					else
					{
						string strError = "!!! ERROR - Node: " + iLuaNodeIndex + " - 'if' entry does not contain exactly 5 tokens. Found token count: " + node.lstTokens.Count;
						strError += "\r\n";
						foreach (string strToken in node.lstTokens)
						{
							strError += "  |  " + strToken;
						}
						Debug.LogError(strError);
					}
				}
				catch (Exception e)
				{
					Debug.LogError("!!! ERROR - DialogueOverlay.ExtractDialogueEntries() - 'if' node - " + e);
				}
			}
			else if (strType.Equals("goto"))
			{
				try
				{
					if (node.lstTokens.Count == 2)
					{
						// Only set the 'label' value because this is a straight goto.
						DiaEntry_IfGoto entry = new DiaEntry_IfGoto();
						entry.label = node.lstTokens[1];

						if (entry_Label == null)
						{
							// General
							lstEntries_IfGoto.Add(entry);
						}
						else
						{
							if (entry_Label.lstBranches.Count > 0)
							{
								// NOTE: Nothing is currently done with branch.lstIfGotos.

								// Branch
								DiaBranch_Label branch = entry_Label.lstBranches.Last();
								branch.lstIfGotos.Add(entry);
							}
							else
							{
								// Label
								entry_Label.lstInitialIfGotos.Add(entry);
							}
						}
					}
					else
					{
						string strError = "!!! ERROR - Node: " + iLuaNodeIndex + " - 'goto' entry does not contain exactly 2 tokens. Found token count: " + node.lstTokens.Count;
						strError += "\r\n";
						foreach (string strToken in node.lstTokens)
						{
							strError += "  |  " + strToken;
						}
						Debug.LogError(strError);
					}
				}
				catch (Exception e)
				{
					Debug.LogError("!!! ERROR - DialogueOverlay.ExtractDialogueEntries() - 'goto' node - " + e);
				}
			}
			else if (strType.Equals("label"))
			{
				try
				{
					if (node.lstTokens.Count == 2)
					{
						entry_Label = new DiaEntry_Label();
						entry_Label.name = node.lstTokens[1];
						entry_Label.index = lstEntries_Label.Count;
						
						dictEntries_Label.Add(entry_Label.name, entry_Label);
						lstEntries_Label.Add(entry_Label);
					}
					else
					{
						string strError = "!!! ERROR - Node: " + iLuaNodeIndex + " - 'label' entry does not contain exactly 2 tokens. Found token count: " + node.lstTokens.Count;
						strError += "\r\n";
						foreach (string strToken in node.lstTokens)
						{
							strError += "  |  " + strToken;
						}
						Debug.LogError(strError);
					}
				}
				catch (Exception e)
				{
					Debug.LogError("!!! ERROR - DialogueOverlay.ExtractDialogueEntries() - 'label' node - " + e);
				}
			}
			else if (strType.Equals("n"))
			{
				try
				{
					if (node.lstTokens.Count == 2)
					{
						// print("n - entry_Label is NULL: " + (entry_Label == null).ToString());
						
						if (entry_Label != null)
						{
							DiaEntry_NpcText entry = new DiaEntry_NpcText();
							entry.text = Regex.Unescape(node.lstTokens[1]);
							
							DiaBranch_Label branch = new DiaBranch_Label();
							branch.npcText = entry;
							
							entry_Label.lstBranches.Add(branch);
						}
						else
						{
							Debug.LogError("!!! ERROR - Node: " + iLuaNodeIndex + " - 'n' entry found in mode other than Label.");
						}
					}
					else
					{
						string strError = "!!! ERROR - Node: " + iLuaNodeIndex + " - 'n' entry does not contain exactly 2 tokens. Found token count: " + node.lstTokens.Count;
						strError += "\r\n";
						foreach (string strToken in node.lstTokens)
						{
							strError += "  |  " + strToken;
						}
						Debug.LogError(strError);
					}
				}
				catch (Exception e)
				{
					Debug.LogError("!!! ERROR - DialogueOverlay.ExtractDialogueEntries() - 'n' node - " + e);
				}
			}
			else if (strType.Equals("n1"))
			{
				try
				{
					if (node.lstTokens.Count == 3)
					{
						if (entry_Label != null)
						{
							DiaEntry_NpcText entry = new DiaEntry_NpcText();
							entry.text = Regex.Unescape(node.lstTokens[1]);

							entry.arg1 = node.lstTokens[2];
							
							DiaBranch_Label branch = new DiaBranch_Label();
							branch.npcText = entry;
							
							entry_Label.lstBranches.Add(branch);
						}
						else
						{
							Debug.LogError("!!! ERROR - Node: " + iLuaNodeIndex + " - 'n1' entry found in mode other than Label.");
						}
					}
					else
					{
						string strError = "!!! ERROR - Node: " + iLuaNodeIndex + " - 'n1' entry does not contain exactly 3 tokens. Found token count: " + node.lstTokens.Count;
						strError += "\r\n";
						foreach (string strToken in node.lstTokens)
						{
							strError += "  |  " + strToken;
						}
						Debug.LogError(strError);
					}
				}
				catch (Exception e)
				{
					Debug.LogError("!!! ERROR - DialogueOverlay.ExtractDialogueEntries() - 'n1' node - " + e);
				}
			}
			else if (strType.Equals("n2"))
			{
				try
				{
					if (node.lstTokens.Count == 4)
					{
						if (entry_Label != null)
						{
							DiaEntry_NpcText entry = new DiaEntry_NpcText();
							entry.text = Regex.Unescape(node.lstTokens[1]);

							entry.arg1 = node.lstTokens[2];
							entry.arg2 = node.lstTokens[3];
							
							DiaBranch_Label branch = new DiaBranch_Label();
							branch.npcText = entry;
							
							entry_Label.lstBranches.Add(branch);
						}
						else
						{
							Debug.LogError("!!! ERROR - Node: " + iLuaNodeIndex + " - 'n2' entry found in mode other than Label.");
						}
					}
					else
					{
						string strError = "!!! ERROR - Node: " + iLuaNodeIndex + " - 'n2' entry does not contain exactly 4 tokens. Found token count: " + node.lstTokens.Count;
						strError += "\r\n";
						foreach (string strToken in node.lstTokens)
						{
							strError += "  |  " + strToken;
						}
						Debug.LogError(strError);
					}
				}
				catch (Exception e)
				{
					Debug.LogError("!!! ERROR - DialogueOverlay.ExtractDialogueEntries() - 'n2' node - " + e);
				}
			}
			else if (strType.Equals("n3"))
			{
				try
				{
					if (node.lstTokens.Count == 5)
					{
						if (entry_Label != null)
						{
							DiaEntry_NpcText entry = new DiaEntry_NpcText();
							entry.text = Regex.Unescape(node.lstTokens[1]);

							entry.arg1 = node.lstTokens[2];
							entry.arg2 = node.lstTokens[3];
							entry.arg3 = node.lstTokens[4];
							
							DiaBranch_Label branch = new DiaBranch_Label();
							branch.npcText = entry;
							
							entry_Label.lstBranches.Add(branch);
						}
						else
						{
							Debug.LogError("!!! ERROR - Node: " + iLuaNodeIndex + " - 'n3' entry found in mode other than Label.");
						}
					}
					else
					{
						string strError = "!!! ERROR - Node: " + iLuaNodeIndex + " - 'n3' entry does not contain exactly 5 tokens. Found token count: " + node.lstTokens.Count;
						strError += "\r\n";
						foreach (string strToken in node.lstTokens)
						{
							strError += "  |  " + strToken;
						}
						Debug.LogError(strError);
					}
				}
				catch (Exception e)
				{
					Debug.LogError("!!! ERROR - DialogueOverlay.ExtractDialogueEntries() - 'n3' node - " + e);
				}
			}
			else if (strType.Equals("ns"))
			{
				try
				{
					if (node.lstTokens.Count == 3)
					{
						if (entry_Label != null)
						{
							DiaEntry_NpcText entry = new DiaEntry_NpcText();
							entry.text = Regex.Unescape(node.lstTokens[1]);

							string strAudioName = node.lstTokens[2];
							entry.sound.Url = strAudioName;

							DiaBranch_Label branch = new DiaBranch_Label();
							branch.npcText = entry;

							entry_Label.lstBranches.Add(branch);
						}
						else
						{
							Debug.LogError("!!! ERROR - Node: " + iLuaNodeIndex + " - 'ns' entry found in mode other than Label.");
						}
					}
					else
					{
						string strError = "!!! ERROR - Node: " + iLuaNodeIndex + " - 'ns' entry does not contain exactly 3 tokens. Found token count: " + node.lstTokens.Count;
						strError += "\r\n";
						foreach (string strToken in node.lstTokens)
						{
							strError += "  |  " + strToken;
						}
						Debug.LogError(strError);
					}
				}
				catch (Exception e)
				{
					Debug.LogError("!!! ERROR - DialogueOverlay.ExtractDialogueEntries() - 'ns' node - " + e);
				}
			}
			else if (strType.Equals("ns1"))
			{
				try
				{
					if (node.lstTokens.Count == 4)
					{
						if (entry_Label != null)
						{
							DiaEntry_NpcText entry = new DiaEntry_NpcText();
							entry.text = Regex.Unescape(node.lstTokens[1]);

							string strAudioName = node.lstTokens[2];
							entry.sound.Url = strAudioName;

							entry.arg1 = node.lstTokens[3];
							
							DiaBranch_Label branch = new DiaBranch_Label();
							branch.npcText = entry;
							
							entry_Label.lstBranches.Add(branch);

						}
						else
						{
							Debug.LogError("!!! ERROR - Node: " + iLuaNodeIndex + " - 'ns1' entry found in mode other than Label.");
						}
					}
					else
					{
						string strError = "!!! ERROR - Node: " + iLuaNodeIndex + " - 'ns1' entry does not contain exactly 4 tokens. Found token count: " + node.lstTokens.Count;
						strError += "\r\n";
						foreach (string strToken in node.lstTokens)
						{
							strError += "  |  " + strToken;
						}
						Debug.LogError(strError);
					}
				}
				catch (Exception e)
				{
					Debug.LogError("!!! ERROR - DialogueOverlay.ExtractDialogueEntries() - 'ns1' node - " + e);
				}
			}
			else if (strType.Equals("ns2"))
			{
				try
				{
					if (node.lstTokens.Count == 5)
					{
						if (entry_Label != null)
						{
							DiaEntry_NpcText entry = new DiaEntry_NpcText();
							entry.text = Regex.Unescape(node.lstTokens[1]);

							string strAudioName = node.lstTokens[2];
							entry.sound.Url = strAudioName;

							entry.arg1 = node.lstTokens[3];
							entry.arg2 = node.lstTokens[4];
							
							DiaBranch_Label branch = new DiaBranch_Label();
							branch.npcText = entry;
							
							entry_Label.lstBranches.Add(branch);
						}
						else
						{
							Debug.LogError("!!! ERROR - Node: " + iLuaNodeIndex + " - 'ns2' entry found in mode other than Label.");
						}
					}
					else
					{
						string strError = "!!! ERROR - Node: " + iLuaNodeIndex + " - 'ns2' entry does not contain exactly 5 tokens. Found token count: " + node.lstTokens.Count;
						strError += "\r\n";
						foreach (string strToken in node.lstTokens)
						{
							strError += "  |  " + strToken;
						}
						Debug.LogError(strError);
					}
				}
				catch (Exception e)
				{
					Debug.LogError("!!! ERROR - DialogueOverlay.ExtractDialogueEntries() - 'ns2' node - " + e);
				}
			}
			else if (strType.Equals("ns3"))
			{
				try
				{
					if (node.lstTokens.Count == 6)
					{
						if (entry_Label != null)
						{
							DiaEntry_NpcText entry = new DiaEntry_NpcText();
							entry.text = Regex.Unescape(node.lstTokens[1]);

							string strAudioName = node.lstTokens[2];
							entry.sound.Url = strAudioName;

							entry.arg1 = node.lstTokens[3];
							entry.arg2 = node.lstTokens[4];
							entry.arg3 = node.lstTokens[5];
							
							DiaBranch_Label branch = new DiaBranch_Label();
							branch.npcText = entry;
							
							entry_Label.lstBranches.Add(branch);
						}
						else
						{
							Debug.LogError("!!! ERROR - Node: " + iLuaNodeIndex + " - 'ns3' entry found in mode other than Label.");
						}
					}
					else
					{
						string strError = "!!! ERROR - Node: " + iLuaNodeIndex + " - 'ns3' entry does not contain exactly 6 tokens. Found token count: " + node.lstTokens.Count;
						strError += "\r\n";
						foreach (string strToken in node.lstTokens)
						{
							strError += "  |  " + strToken;
						}
						Debug.LogError(strError);
					}
				}
				catch (Exception e)
				{
					Debug.LogError("!!! ERROR - DialogueOverlay.ExtractDialogueEntries() - 'ns3' node - " + e);
				}
			}
			else if (strType.Equals("p"))
			{
				try
				{
					if (node.lstTokens.Count == 2)
					{
						if (entry_Label != null)
						{
							if (entry_Label.lstBranches.Count > 0)
							{
								DiaEntry_PcText entry = new DiaEntry_PcText();
								entry.text = Regex.Unescape(node.lstTokens[1]);
								
								DiaBranch_Label branch = entry_Label.lstBranches.Last();
								branch.lstPcTexts.Add(entry);
							}
							else
							{
								Debug.LogError("!!! ERROR - Node: " + iLuaNodeIndex + " - 'p' entry found before any 'n' or 'ns' entries for label '" + entry_Label.name + "'.");
							}
						}
						else
						{
							Debug.LogError("!!! ERROR - Node: " + iLuaNodeIndex + " - 'p' entry found in mode other than Label.");
						}
					}
					else
					{
						string strError = "!!! ERROR - Node: " + iLuaNodeIndex + " - 'p' entry does not contain exactly 2 tokens. Found token count: " + node.lstTokens.Count;
						strError += "\r\n";
						foreach (string strToken in node.lstTokens)
						{
							strError += "  |  " + strToken;
						}
						Debug.LogError(strError);
					}
				}
				catch (Exception e)
				{
					Debug.LogError("!!! ERROR - DialogueOverlay.ExtractDialogueEntries() - 'p' node - " + e);
				}
			}
			else if (strType.Equals("pg"))
			{
				try
				{
					if (node.lstTokens.Count == 3)
					{
						if (entry_Label != null)
						{
							if (entry_Label.lstBranches.Count > 0)
							{
								DiaEntry_PcText entry = new DiaEntry_PcText();
								entry.text = Regex.Unescape(node.lstTokens[1]);
								entry.gotoLabel = node.lstTokens[2];
								
								DiaBranch_Label branch = entry_Label.lstBranches.Last();
								branch.lstPcTexts.Add(entry);
							}
							else
							{
								Debug.LogError("!!! ERROR - Node: " + iLuaNodeIndex + " - 'pg' entry found before any 'n' or 'ns' entries for label '" + entry_Label.name + "'.");
							}
						}
						else
						{
							Debug.LogError("!!! ERROR - Node: " + iLuaNodeIndex + " - 'pg' entry found in mode other than Label.");
						}
					}
					else
					{
						string strError = "!!! ERROR - Node: " + iLuaNodeIndex + " - 'pg' entry does not contain exactly 3 tokens. Found token count: " + node.lstTokens.Count;
						strError += "\r\n";
						foreach (string strToken in node.lstTokens)
						{
							strError += "  |  " + strToken;
						}
						Debug.LogError(strError);
					}
				}
				catch (Exception e)
				{
					Debug.LogError("!!! ERROR - DialogueOverlay.ExtractDialogueEntries() - 'pg' node - " + e);
				}
			}
			else if (strType.Equals("pgs"))
			{
				try
				{
					if (node.lstTokens.Count == 4)
					{
						if (entry_Label != null)
						{
							if (entry_Label.lstBranches.Count > 0)
							{
								DiaEntry_PcText entry = new DiaEntry_PcText();
								entry.text = Regex.Unescape(node.lstTokens[1]);
								entry.gotoLabel = node.lstTokens[2];
								entry.score = node.lstTokens[3];
								
								DiaBranch_Label branch = entry_Label.lstBranches.Last();
								branch.lstPcTexts.Add(entry);
							}
							else
							{
								Debug.LogError("!!! ERROR - Node: " + iLuaNodeIndex + " - 'pgs' entry found before any 'n' or 'ns' entries for label '" + entry_Label.name + "'.");
							}
						}
						else
						{
							Debug.LogError("!!! ERROR - Node: " + iLuaNodeIndex + " - 'pgs' entry found in mode other than Label.");
						}
					}
					else
					{
						string strError = "!!! ERROR - Node: " + iLuaNodeIndex + " - 'pgs' entry does not contain exactly 4 tokens. Found token count: " + node.lstTokens.Count;
						strError += "\r\n";
						foreach (string strToken in node.lstTokens)
						{
							strError += "  |  " + strToken;
						}
						Debug.LogError(strError);
					}
				}
				catch (Exception e)
				{
					Debug.LogError("!!! ERROR - DialogueOverlay.ExtractDialogueEntries() - 'pgs' node - " + e);
				}
			}
			else if (strType.Equals("pg1"))
			{
				try
				{
					if (node.lstTokens.Count == 4)
					{
						if (entry_Label != null)
						{
							if (entry_Label.lstBranches.Count > 0)
							{
								DiaEntry_PcText entry = new DiaEntry_PcText();
								entry.text = Regex.Unescape(node.lstTokens[1]);
								entry.gotoLabel = node.lstTokens[2];
								entry.arg1 = node.lstTokens[3];

								// Format the text based on legacy formatting rules.
								//entry.text = LegacyFormatSubstitute(entry.text, arg1);
								
								DiaBranch_Label branch = entry_Label.lstBranches.Last();
								branch.lstPcTexts.Add(entry);
							}
							else
							{
								Debug.LogError("!!! ERROR - Node: " + iLuaNodeIndex + " - 'pg1' entry found before any 'n' or 'ns' entries for label '" + entry_Label.name + "'.");
							}
						}
						else
						{
							Debug.LogError("!!! ERROR - Node: " + iLuaNodeIndex + " - 'pg1' entry found in mode other than Label.");
						}
					}
					else
					{
						string strError = "!!! ERROR - Node: " + iLuaNodeIndex + " - 'pg1' entry does not contain exactly 4 tokens. Found token count: " + node.lstTokens.Count;
						strError += "\r\n";
						foreach (string strToken in node.lstTokens)
						{
							strError += "  |  " + strToken;
						}
						Debug.LogError(strError);
					}
				}
				catch (Exception e)
				{
					Debug.LogError("!!! ERROR - DialogueOverlay.ExtractDialogueEntries() - 'pg' node - " + e);
				}
			}
			else if (strType.Equals("pg1s"))
			{
				try
				{
					if (node.lstTokens.Count == 5)
					{
						if (entry_Label != null)
						{
							if (entry_Label.lstBranches.Count > 0)
							{
								DiaEntry_PcText entry = new DiaEntry_PcText();
								entry.text = Regex.Unescape(node.lstTokens[1]);
								entry.gotoLabel = node.lstTokens[2];
								entry.arg1 = node.lstTokens[3];
								entry.score = node.lstTokens[4];

								// Format the text based on legacy formatting rules.
								//entry.text = LegacyFormatSubstitute(entry.text, arg1);
								
								DiaBranch_Label branch = entry_Label.lstBranches.Last();
								branch.lstPcTexts.Add(entry);
							}
							else
							{
								Debug.LogError("!!! ERROR - Node: " + iLuaNodeIndex + " - 'pg1s' entry found before any 'n' or 'ns' entries for label '" + entry_Label.name + "'.");
							}
						}
						else
						{
							Debug.LogError("!!! ERROR - Node: " + iLuaNodeIndex + " - 'pg1s' entry found in mode other than Label.");
						}
					}
					else
					{
						string strError = "!!! ERROR - Node: " + iLuaNodeIndex + " - 'pg1s' entry does not contain exactly 5 tokens. Found token count: " + node.lstTokens.Count;
						strError += "\r\n";
						foreach (string strToken in node.lstTokens)
						{
							strError += "  |  " + strToken;
						}
						Debug.LogError(strError);
					}
				}
				catch (Exception e)
				{
					Debug.LogError("!!! ERROR - DialogueOverlay.ExtractDialogueEntries() - 'pg' node - " + e);
				}
			}
			else if (strType.Equals("pg2"))
			{
				try
				{
					if (node.lstTokens.Count == 5)
					{
						if (entry_Label != null)
						{
							if (entry_Label.lstBranches.Count > 0)
							{
								DiaEntry_PcText entry = new DiaEntry_PcText();
								entry.text = Regex.Unescape(node.lstTokens[1]);
								entry.gotoLabel = node.lstTokens[2];
								entry.arg1 = node.lstTokens[3];
								entry.arg2 = node.lstTokens[4];

								// Format the text based on legacy formatting rules.
								//entry.text = LegacyFormatSubstitute(entry.text, arg1);
								//entry.text = LegacyFormatSubstitute(entry.text, arg2);
								
								DiaBranch_Label branch = entry_Label.lstBranches.Last();
								branch.lstPcTexts.Add(entry);
							}
							else
							{
								Debug.LogError("!!! ERROR - Node: " + iLuaNodeIndex + " - 'pg2' entry found before any 'n' or 'ns' entries for label '" + entry_Label.name + "'.");
							}
						}
						else
						{
							Debug.LogError("!!! ERROR - Node: " + iLuaNodeIndex + " - 'pg2' entry found in mode other than Label.");
						}
					}
					else
					{
						string strError = "!!! ERROR - Node: " + iLuaNodeIndex + " - 'pg2' entry does not contain exactly 5 tokens. Found token count: " + node.lstTokens.Count;
						strError += "\r\n";
						foreach (string strToken in node.lstTokens)
						{
							strError += "  |  " + strToken;
						}
						Debug.LogError(strError);
					}
				}
				catch (Exception e)
				{
					Debug.LogError("!!! ERROR - DialogueOverlay.ExtractDialogueEntries() - 'pg' node - " + e);
				}
			}
			else if (strType.Equals("pg2s"))
			{
				try
				{
					if (node.lstTokens.Count == 6)
					{
						if (entry_Label != null)
						{
							if (entry_Label.lstBranches.Count > 0)
							{
								DiaEntry_PcText entry = new DiaEntry_PcText();
								entry.text = Regex.Unescape(node.lstTokens[1]);
								entry.gotoLabel = node.lstTokens[2];
								entry.arg1 = node.lstTokens[3];
								entry.arg2 = node.lstTokens[4];
								entry.score = node.lstTokens[5];

								// Format the text based on legacy formatting rules.
								//entry.text = LegacyFormatSubstitute(entry.text, arg1);
								//entry.text = LegacyFormatSubstitute(entry.text, arg2);
								
								DiaBranch_Label branch = entry_Label.lstBranches.Last();
								branch.lstPcTexts.Add(entry);
							}
							else
							{
								Debug.LogError("!!! ERROR - Node: " + iLuaNodeIndex + " - 'pg2s' entry found before any 'n' or 'ns' entries for label '" + entry_Label.name + "'.");
							}
						}
						else
						{
							Debug.LogError("!!! ERROR - Node: " + iLuaNodeIndex + " - 'pg2s' entry found in mode other than Label.");
						}
					}
					else
					{
						string strError = "!!! ERROR - Node: " + iLuaNodeIndex + " - 'pg2s' entry does not contain exactly 6 tokens. Found token count: " + node.lstTokens.Count;
						strError += "\r\n";
						foreach (string strToken in node.lstTokens)
						{
							strError += "  |  " + strToken;
						}
						Debug.LogError(strError);
					}
				}
				catch (Exception e)
				{
					Debug.LogError("!!! ERROR - DialogueOverlay.ExtractDialogueEntries() - 'pg' node - " + e);
				}
			}
			else if (strType.Equals("wait"))
			{
				try
				{
					if (node.lstTokens.Count == 2)
					{
						if (entry_Label != null)
						{
							if (entry_Label.lstBranches.Count > 0)
							{
								DiaEntry_PcText entry = new DiaEntry_PcText();
								//entry.text = "[Leave] (Wait Placeholder)";
								entry.text = "Ok.";
								entry.gotoLabel = node.lstTokens[1];
								
								DiaBranch_Label branch = entry_Label.lstBranches.Last();
								branch.lstPcTexts.Add(entry);
							}
							else
							{
								Debug.LogError("!!! ERROR - Node: " + iLuaNodeIndex + " - 'wait' entry found before any 'n' or 'ns' entries for label '" + entry_Label.name + "'.");
							}
						}
						else
						{
							Debug.LogError("!!! ERROR - Node: " + iLuaNodeIndex + " - 'wait' entry found in mode other than Label.");
						}
					}
					else
					{
						string strError = "!!! ERROR - Node: " + iLuaNodeIndex + " - 'wait' entry does not contain exactly 2 tokens. Found token count: " + node.lstTokens.Count;
						strError += "\r\n";
						foreach (string strToken in node.lstTokens)
						{
							strError += "  |  " + strToken;
						}
						Debug.LogError(strError);
					}
				}
				catch (Exception e)
				{
					Debug.LogError("!!! ERROR - DialogueOverlay.ExtractDialogueEntries() - 'wait' node - " + e);
				}
			}
			else if (strType.Equals("fun"))
			{
				try
				{
					if (node.lstTokens.Count == 2)
					{
						DiaEntry_Function entry = new DiaEntry_Function();
						entry.name = node.lstTokens[1];
						
						if (entry_Label != null)
						{
							
							if (entry_Label.lstBranches.Count > 0)
							{
								DiaBranch_Label branch = entry_Label.lstBranches.Last();
								branch.lstFunctions.Add(entry);
							}
							else
							{
								entry_Label.lstInitialFunctions.Add(entry);
							}
						}
						else
						{
							lstEntries_Function.Add(entry);
						}
					}
					else
					{
						string strError = "!!! ERROR - Node: " + iLuaNodeIndex + " - 'fun' entry does not contain exactly 2 tokens. Found token count: " + node.lstTokens.Count;
						strError += "\r\n";
						foreach (string strToken in node.lstTokens)
						{
							strError += "  |  " + strToken;
						}
						Debug.LogError(strError);
					}
				}
				catch (Exception e)
				{
					Debug.LogError("!!! ERROR - DialogueOverlay.ExtractDialogueEntries() - 'fun' node - " + e);
				}
			}
			else if (strType.Equals("fun2"))
			{
				try
				{
					if (node.lstTokens.Count == 3)
					{
						DiaEntry_Function entry = new DiaEntry_Function();
						entry.name = node.lstTokens[1];
						entry.arg1 = node.lstTokens[2];
						
						if (entry_Label != null)
						{
							if (entry_Label.lstBranches.Count > 0)
							{
								DiaBranch_Label branch = entry_Label.lstBranches.Last();
								branch.lstFunctions.Add(entry);
							}
							else
							{
								entry_Label.lstInitialFunctions.Add(entry);
							}
						}
						else
						{
							lstEntries_Function.Add(entry);
						}
					}
					else
					{
						string strError = "!!! ERROR - Node: " + iLuaNodeIndex + " - 'fun2' entry does not contain exactly 3 tokens. Found token count: " + node.lstTokens.Count;
						strError += "\r\n";
						foreach (string strToken in node.lstTokens)
						{
							strError += "  |  " + strToken;
						}
						Debug.LogError(strError);
					}
				}
				catch (Exception e)
				{
					Debug.LogError("!!! ERROR - DialogueOverlay.ExtractDialogueEntries() - 'fun2' node - " + e);
				}
			}
			else if (strType.Equals("fun3"))
			{
				try
				{
					if (node.lstTokens.Count == 4)
					{
						DiaEntry_Function entry = new DiaEntry_Function();
						entry.name = node.lstTokens[1];
						entry.arg1 = node.lstTokens[2];
						entry.arg2 = node.lstTokens[3];
						
						if (entry_Label != null)
						{
							if (entry_Label.lstBranches.Count > 0)
							{
								DiaBranch_Label branch = entry_Label.lstBranches.Last();
								branch.lstFunctions.Add(entry);
							}
							else
							{
								entry_Label.lstInitialFunctions.Add(entry);
							}
						}
						else
						{
							lstEntries_Function.Add(entry);
						}
					}
					else
					{
						string strError = "!!! ERROR - Node: " + iLuaNodeIndex + " - 'fun3' entry does not contain exactly 4 tokens. Found token count: " + node.lstTokens.Count;
						strError += "\r\n";
						foreach (string strToken in node.lstTokens)
						{
							strError += "  |  " + strToken;
						}
						Debug.LogError(strError);
					}
				}
				catch (Exception e)
				{
					Debug.LogError("!!! ERROR - DialogueOverlay.ExtractDialogueEntries() - 'fun3' node - " + e);
				}
			}
			
		}
		
		foreach (LuaNode childNode in node.lstChildren)
		{
			ExtractDialogueEntries(childNode, ref entry_Label, false, ++iLuaNodeIndex);
		}
	}

	private static string LegacyFormatSubstitute(string strFormat, MultiType arg)
	{
		// If it's a string, then it's a reference to a variable.
		string strInsert;
		if (arg.IsString)
			strInsert = GLOBAL_old.Player.progress[arg.str].ToString();
		// Otherwise, take the value straight.
		else
			strInsert = arg.ToString();

		// Make the insert string empty instead of null.
		if (strInsert == null)
			strInsert = "";

		// Replace the format token with the argument.
		int iInsertIndex = strFormat.IndexOf("%s");
		if (iInsertIndex < 0)
			iInsertIndex = strFormat.IndexOf("%d");

		if (iInsertIndex > -1)
		{
			return strFormat.Remove(iInsertIndex, 2).Insert(iInsertIndex, strInsert);
		}
		else
		{
			Debug.LogError("!!! ERROR - DialogueOverlay.LegacyFormatSubstitute() - No format token found to replace.");
			return strFormat;
		}
	}

	public static void ProcessDialogueEntries()
	{
		// Run whatever initial functions we have.
		ProcessFunctions(lstEntries_Function);

		bool bGotoTriggered = false;
		foreach (DiaEntry_IfGoto ifGoto in lstEntries_IfGoto)
		{
			bool if_result = ifGoto.Eval();

			Debug.Log(string.Format("Processed IfGoto['{0}' | {1} | {2} | '{3}']: {4}", ifGoto.key, ifGoto.op, ifGoto.value.str, ifGoto.label, if_result));

			if (if_result)
			{
				_instance.ActiveLabel = dictEntries_Label[ifGoto.label];
				_instance.ActiveDialogueNodeIndex = 0;

				bGotoTriggered = true;
				break;
			}
		}

		// If we didn't find a starting label from the IfGotos, then start with the first label.
		if (!bGotoTriggered)
		{
			_instance.ActiveLabel = lstEntries_Label[0];
			_instance.ActiveDialogueNodeIndex = 0;
		}
		
		ProcessActiveDialogueNode();
	}

	static int count;
	private static void ProcessActiveDialogueNode()
	{

		if (_instance.ActiveLabel != null)
		{
			Debug.Log("Processing label '" + _instance.ActiveLabel.name + "'");

			// Ensure that the current label's functions are run initially.
			if (_instance.ActiveDialogueNodeIndex == 0)
			{
				ProcessFunctions(_instance.ActiveLabel.lstInitialFunctions);

				//Debug.LogError(string.Format("! Brent ! - '{0}' Gotos.Count: {1}", _instance.ActiveLabel.name, _instance.ActiveLabel.lstInitialIfGotos.Count));

				// Loop thru the IfGotos to see if we need to jump to a different label.
				foreach (DiaEntry_IfGoto ifGoto in _instance.ActiveLabel.lstInitialIfGotos)
				{
					bool if_result = ifGoto.Eval();

					Debug.Log(string.Format("Processed IfGoto['{0}' | {1} | {2} | '{3}']: {4}", ifGoto.key, ifGoto.op, ifGoto.value.str, ifGoto.label, if_result));

					if (if_result)
					{
						_instance.ActiveLabel = dictEntries_Label[ifGoto.label];
						_instance.ActiveDialogueNodeIndex = 0;

						ProcessActiveDialogueNode();

						return;
					}
				}
			}

			if (_instance.ActiveDialogueNodeIndex < _instance.ActiveLabel.lstBranches.Count)
			{
				// Flag the current node's sound file as having not been played yet.
				_bNodeSoundPlayed = false;

				count++;

				string text;

				DiaBranch_Label branch = _instance.ActiveLabel.lstBranches[_instance.ActiveDialogueNodeIndex];
				text = branch.npcText.text;

				// Apply string formatting if we have arguments
				if (!branch.npcText.arg1.IsUnknown)
					text = LegacyFormatSubstitute(text, branch.npcText.arg1);
				if (!branch.npcText.arg2.IsUnknown)
					text = LegacyFormatSubstitute(text, branch.npcText.arg2);
				if (!branch.npcText.arg3.IsUnknown)
					text = LegacyFormatSubstitute(text, branch.npcText.arg3);
				
				_instance.txt_NpcText.text = text;

				//// BChance: (2015-12-08) - Process the functions.
				//ProcessFunctions(_instance.ActiveLabel.lstInitialFunctions);

				if (branch.lstPcTexts.Count > 0)
				{
					_instance.btn_Option_1.gameObject.SetActive(true);
					var pc_text = branch.lstPcTexts[0];
					text = pc_text.text;

					// Apply string formatting if we have arguments
					if (!pc_text.arg1.IsUnknown)
						text = LegacyFormatSubstitute(text, pc_text.arg1);
					if (!pc_text.arg2.IsUnknown)
						text = LegacyFormatSubstitute(text, pc_text.arg2);

					TMP_Text btn_text = _instance.btn_Option_1.GetComponentInChildren<TMP_Text>();
					btn_text.text = text;
					
					// BChance: (2017-10-05) - This transform change ensures that Unity v2017.1.1 
					//                           properly layouts the text after it's been changed.
					btn_text.rectTransform.offsetMax = new Vector2
						(
							btn_text.rectTransform.offsetMax.x,
							btn_text.rectTransform.offsetMax.y + 1.0f
						);
					btn_text.rectTransform.offsetMax = new Vector2
						(
							btn_text.rectTransform.offsetMax.x,
							btn_text.rectTransform.offsetMax.y - 1.0f
						);
				}
				else
				{
					_instance.btn_Option_1.gameObject.SetActive(false);
				}
				
				// Option 2
				if (branch.lstPcTexts.Count > 1)
				{
					_instance.btn_Option_2.gameObject.SetActive(true);
					var pc_text = branch.lstPcTexts[1];
					text = pc_text.text;

					// Apply string formatting if we have arguments
					if (!pc_text.arg1.IsUnknown)
						text = LegacyFormatSubstitute(text, pc_text.arg1);
					if (!pc_text.arg2.IsUnknown)
						text = LegacyFormatSubstitute(text, pc_text.arg2);

					TMP_Text btn_text = _instance.btn_Option_2.GetComponentInChildren<TMP_Text>();
					btn_text.text = text;
					
					// BChance: (2017-10-05) - This transform change ensures that Unity v2017.1.1 
					//                           properly layouts the text after it's been changed.
					btn_text.rectTransform.offsetMax = new Vector2
						(
							btn_text.rectTransform.offsetMax.x,
							btn_text.rectTransform.offsetMax.y + 1.0f
						);
					btn_text.rectTransform.offsetMax = new Vector2
						(
							btn_text.rectTransform.offsetMax.x,
							btn_text.rectTransform.offsetMax.y - 1.0f
						);
				}
				else
				{
					_instance.btn_Option_2.gameObject.SetActive(false);
				}
				
				// Option 3
				if (branch.lstPcTexts.Count > 2)
				{
					_instance.btn_Option_3.gameObject.SetActive(true);
					var pc_text = branch.lstPcTexts[2];
					text = pc_text.text;

					// Apply string formatting if we have arguments
					if (!pc_text.arg1.IsUnknown)
						text = LegacyFormatSubstitute(text, pc_text.arg1);
					if (!pc_text.arg2.IsUnknown)
						text = LegacyFormatSubstitute(text, pc_text.arg2);

					TMP_Text btn_text = _instance.btn_Option_3.GetComponentInChildren<TMP_Text>();
					btn_text.text = text;
					
					// BChance: (2017-10-05) - This transform change ensures that Unity v2017.1.1 
					//                           properly layouts the text after it's been changed.
					btn_text.rectTransform.offsetMax = new Vector2
						(
							btn_text.rectTransform.offsetMax.x,
							btn_text.rectTransform.offsetMax.y + 1.0f
						);
					btn_text.rectTransform.offsetMax = new Vector2
						(
							btn_text.rectTransform.offsetMax.x,
							btn_text.rectTransform.offsetMax.y - 1.0f
						);
				}
				else
				{
					_instance.btn_Option_3.gameObject.SetActive(false);
				}

				// Option 4
				if (branch.lstPcTexts.Count > 3)
				{
					_instance.btn_Option_4.gameObject.SetActive(true);
					var pc_text = branch.lstPcTexts[3];
					text = pc_text.text;

					// Apply string formatting if we have arguments
					if (!pc_text.arg1.IsUnknown)
						text = LegacyFormatSubstitute(text, pc_text.arg1);
					if (!pc_text.arg2.IsUnknown)
						text = LegacyFormatSubstitute(text, pc_text.arg2);

					TMP_Text btn_text = _instance.btn_Option_4.GetComponentInChildren<TMP_Text>();
					btn_text.text = text;
					
					// BChance: (2017-10-05) - This transform change ensures that Unity v2017.1.1 
					//                           properly layouts the text after it's been changed.
					btn_text.rectTransform.offsetMax = new Vector2
						(
							btn_text.rectTransform.offsetMax.x,
							btn_text.rectTransform.offsetMax.y + 1.0f
						);
					btn_text.rectTransform.offsetMax = new Vector2
						(
							btn_text.rectTransform.offsetMax.x,
							btn_text.rectTransform.offsetMax.y - 1.0f
						);
				}
				else
				{
					_instance.btn_Option_4.gameObject.SetActive(false);
				}

				// Option 5
				if (branch.lstPcTexts.Count > 4)
				{
					_instance.btn_Option_5.gameObject.SetActive(true);
					var pc_text = branch.lstPcTexts[4];
					text = pc_text.text;

					// Apply string formatting if we have arguments
					if (!pc_text.arg1.IsUnknown)
						text = LegacyFormatSubstitute(text, pc_text.arg1);
					if (!pc_text.arg2.IsUnknown)
						text = LegacyFormatSubstitute(text, pc_text.arg2);

					TMP_Text btn_text = _instance.btn_Option_5.GetComponentInChildren<TMP_Text>();
					btn_text.text = text;
					
					// BChance: (2017-10-05) - This transform change ensures that Unity v2017.1.1 
					//                           properly layouts the text after it's been changed.
					btn_text.rectTransform.offsetMax = new Vector2
						(
							btn_text.rectTransform.offsetMax.x,
							btn_text.rectTransform.offsetMax.y + 1.0f
						);
					btn_text.rectTransform.offsetMax = new Vector2
						(
							btn_text.rectTransform.offsetMax.x,
							btn_text.rectTransform.offsetMax.y - 1.0f
						);
				}
				else
				{
					_instance.btn_Option_5.gameObject.SetActive(false);
				}

				// Option 6
				if (branch.lstPcTexts.Count > 5)
				{
					_instance.btn_Option_6.gameObject.SetActive(true);
					var pc_text = branch.lstPcTexts[5];
					text = pc_text.text;

					// Apply string formatting if we have arguments
					if (!pc_text.arg1.IsUnknown)
						text = LegacyFormatSubstitute(text, pc_text.arg1);
					if (!pc_text.arg2.IsUnknown)
						text = LegacyFormatSubstitute(text, pc_text.arg2);

					TMP_Text btn_text = _instance.btn_Option_6.GetComponentInChildren<TMP_Text>();
					btn_text.text = text;
					
					// BChance: (2017-10-05) - This transform change ensures that Unity v2017.1.1 
					//                           properly layouts the text after it's been changed.
					btn_text.rectTransform.offsetMax = new Vector2
						(
							btn_text.rectTransform.offsetMax.x,
							btn_text.rectTransform.offsetMax.y + 1.0f
						);
					btn_text.rectTransform.offsetMax = new Vector2
						(
							btn_text.rectTransform.offsetMax.x,
							btn_text.rectTransform.offsetMax.y - 1.0f
						);
				}
				else
				{
					_instance.btn_Option_6.gameObject.SetActive(false);
				}

				// Option 7
				if (branch.lstPcTexts.Count > 6)
				{
					_instance.btn_Option_7.gameObject.SetActive(true);
					var pc_text = branch.lstPcTexts[6];
					text = pc_text.text;

					// Apply string formatting if we have arguments
					if (!pc_text.arg1.IsUnknown)
						text = LegacyFormatSubstitute(text, pc_text.arg1);
					if (!pc_text.arg2.IsUnknown)
						text = LegacyFormatSubstitute(text, pc_text.arg2);

					TMP_Text btn_text = _instance.btn_Option_7.GetComponentInChildren<TMP_Text>();
					btn_text.text = text;
					
					// BChance: (2017-10-05) - This transform change ensures that Unity v2017.1.1 
					//                           properly layouts the text after it's been changed.
					btn_text.rectTransform.offsetMax = new Vector2
						(
							btn_text.rectTransform.offsetMax.x,
							btn_text.rectTransform.offsetMax.y + 1.0f
						);
					btn_text.rectTransform.offsetMax = new Vector2
						(
							btn_text.rectTransform.offsetMax.x,
							btn_text.rectTransform.offsetMax.y - 1.0f
						);
				}
				else
				{
					_instance.btn_Option_7.gameObject.SetActive(false);
				}

				// Option 8
				if (branch.lstPcTexts.Count > 7)
				{
					_instance.btn_Option_8.gameObject.SetActive(true);
					var pc_text = branch.lstPcTexts[7];
					text = pc_text.text;

					// Apply string formatting if we have arguments
					if (!pc_text.arg1.IsUnknown)
						text = LegacyFormatSubstitute(text, pc_text.arg1);
					if (!pc_text.arg2.IsUnknown)
						text = LegacyFormatSubstitute(text, pc_text.arg2);

					TMP_Text btn_text = _instance.btn_Option_8.GetComponentInChildren<TMP_Text>();
					btn_text.text = text;
					
					// BChance: (2017-10-05) - This transform change ensures that Unity v2017.1.1 
					//                           properly layouts the text after it's been changed.
					btn_text.rectTransform.offsetMax = new Vector2
						(
							btn_text.rectTransform.offsetMax.x,
							btn_text.rectTransform.offsetMax.y + 1.0f
						);
					btn_text.rectTransform.offsetMax = new Vector2
						(
							btn_text.rectTransform.offsetMax.x,
							btn_text.rectTransform.offsetMax.y - 1.0f
						);
				}
				else
				{
					_instance.btn_Option_8.gameObject.SetActive(false);
				}
			}
			else
			{
				Close();
			}
		}
		else
		{
			Close();
		}
	}

	private static void Close()
	{
		// Exit the dialogue window.
		Destroy(GameObject.Find("DialogueOverlay"));
		Debug.Log("DialogueOverlay Destroyed");

		is_open = false;

		// TODO: Save player data when dialogue closes.

		//// Ensure that the player data is saved.
		//_instance.StartCoroutine(GLOBAL.Player.Web_SendPlayerData_Progress());
	}

	// BChance: (2015-12-08) - Processes the LUA functions.
	private static void ProcessFunctions(List<DiaEntry_Function> lstFunctions)
	{
		for (int iFunctionIndex = 0; iFunctionIndex < lstFunctions.Count; ++iFunctionIndex)
		{
			DiaEntry_Function func = lstFunctions[iFunctionIndex];

			Debug.Log(string.Format
			(
				"Processing Lua Function '{0}' with arg1({1}): {2}  and arg2({3}): {4}  . . .",
				func.name,
				func.arg1.type.ToString(),
				func.arg1.str,
				func.arg2.type.ToString(),
				func.arg2.str
			));

			// TODO: Process Lua functions.

			//LuaFunctions.Process_DiaEntry_Function(func);
		}
	}
	
	private void StepDialogue()
	{
		if (ActiveLabel != null)
		{
			++ActiveDialogueNodeIndex;
			ProcessActiveDialogueNode();
		}
	}
	
	public void btn_Option_Click(int iOptionIndex)
	{
		_audioSource.Stop();

		DiaBranch_Label branch = _instance.ActiveLabel.lstBranches[_instance.ActiveDialogueNodeIndex];

		// BChance: (2015-12-08) - Process the functions.
		ProcessFunctions(branch.lstFunctions);

		DiaEntry_PcText option = branch.lstPcTexts[iOptionIndex];

		// If the option has a score token, append it to the 'scorestr' field.
		if (option.score != null)
		{
			if (GLOBAL_old.Player.progress["scorestr"].str == null)
				GLOBAL_old.Player.progress["scorestr"] = option.score;
			else
				GLOBAL_old.Player.progress["scorestr"] += option.score;
		}
		
		// if the option has a goto label, jump to the label.
		if (option.gotoLabel != null)
		{
			_instance.ActiveLabel = dictEntries_Label[option.gotoLabel];
			_instance.ActiveDialogueNodeIndex = 0;
			
			ProcessActiveDialogueNode();
		}
		else
		{
			StepDialogue();
		}
	}
};
