using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class NPC_Script_Parser
{
	//
	// Util-Classes
	//
	public class ScriptAction
	{
		public string name;
		public List<MultiType> lst_args = new List<MultiType>();

		public string Do()
		{
			switch (name)
			{
				case "if":
					{
						if (lst_args.Count < 4)
						{
							Debug.LogErrorFormat("At least 4 arguments needed for npc script action 'if': [var_a], [comparator], [var_b], [jump_thread_name].");
							return null;
						}

						if (true)
						{
							return lst_args[3].str;
						}
						else
							return null;
					}
				case "say":
					{
						if (lst_args.Count < 1)
						{
							Debug.LogErrorFormat("At least 1 argument needed for npc script action 'say': [npc_text].");
							return null;
						}

						GLOBAL.ui_dialogue_overlay.NPC_Say(lst_args[0].str);
						return null;
					}
				case "response":
					{
						if (lst_args.Count < 3)
						{
							Debug.LogErrorFormat("At least 3 arguments needed for npc script action 'response': [index_pc_response], [response_text], [jump_thread_name].");
							return null;
						}

						GLOBAL.ui_dialogue_overlay.PC_Response((int)lst_args[0].i, lst_args[1].str, lst_args[2].str);
						return null;
					}
				case "exit":
				{
					GLOBAL.ui_dialogue_overlay.DialogueFinish();

					return null;
				}
				default:
				{
					Debug.LogErrorFormat("Invalid npc script action '{0}'.", name);

					return null;
				}
			}
		}
	};

	public class ScriptThread
	{
		public string name;
		public List<ScriptAction> lst_actions = new List<ScriptAction>();
	};

	//
	// Fields
	//
	private UI_DialogueOverlay _ui_overlay;
	private ScriptThread _thread_start = null;
	private Dictionary<string, ScriptThread> _dict_threads = new Dictionary<string, ScriptThread>();

	//
	// Constructor
	//
	public NPC_Script_Parser(string json)
	{
		Debug.LogFormat("JSON Recieved:\n{0}", json);

		JSONObject objJSON = new JSONObject(json);

		JSONObject objJSON_start = objJSON["start"];
		JSONObject objJSON_threads = objJSON["threads"];

		_thread_start = ParseThread("start", objJSON_start);

		// Extract the threads
		foreach (string thread_name in objJSON_threads.keys)
		{
			JSONObject objJSON_thread = objJSON_threads[thread_name];

			ScriptThread thread = ParseThread(thread_name, objJSON_thread);

			_dict_threads.Add(thread_name, thread);
		}

		ProcessThread(_thread_start);
	}

	//
	// Parsing
	//
	private ScriptThread ParseThread(string thread_name, JSONObject objJSON_thread)
	{
		ScriptThread thread = new ScriptThread();
		thread.name = thread_name;

		// Extract the thread actions
		foreach (JSONObject objJSON_action in objJSON_thread.list)
		{
			ScriptAction action = new ScriptAction();
			action.name = objJSON_action.keys[0];

			// Extract the action args
			foreach (JSONObject objJSON_arg in objJSON_action[action.name].list)
			{
				if (objJSON_arg.IsNumber)
					action.lst_args.Add(new MultiType((int)objJSON_arg.i));
				else
				if (objJSON_arg.IsBool)
					action.lst_args.Add(new MultiType(objJSON_arg.b));
				else
				if (objJSON_arg.IsString)
					action.lst_args.Add(new MultiType(objJSON_arg.str));
				else
					action.lst_args.Add(new MultiType(MultiTypeType.UNKNOWN));
			}

			thread.lst_actions.Add(action);
		}

		return thread;
	}

	//
	// Processing
	//
	private void ProcessThread(ScriptThread thread)
	{
		foreach (ScriptAction action in thread.lst_actions)
		{
			string thread_name = action.Do();

			// If we have a thread name, jump to that thread.
			if (!string.IsNullOrEmpty(thread_name))
			{
				ScriptThread thread_jump = _dict_threads[thread_name];
				ProcessThread(thread_jump);
				break;
			}
		}

		// Idle until further instructions are recieved.
	}

	public void ProcessThread(string thread_name)
	{
		ScriptThread thread_jump = _dict_threads[thread_name];
		ProcessThread(thread_jump);
	}
}


