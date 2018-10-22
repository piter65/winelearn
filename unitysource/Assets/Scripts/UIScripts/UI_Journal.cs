using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.EventSystems;
using System;
using System.Text;
using System.Collections;
using UnityEngine.UI;
using TMPro;
using System.Linq;
using System.Text.RegularExpressions;

public class UI_Journal : MonoBehaviour
{
	public Color color_background_active = Color.white;
	public Color color_background_readonly = Color.gray;

	public GameObject canvas;

	public ToggleGroup toggrp_Journal;

	public GameObject view_Active;
	public GameObject view_Complete;
	public GameObject view_Notes;
	public GameObject view_Glossary;

	public Toggle tog_notes_task_1;
	public Toggle tog_notes_task_2;
	public Toggle tog_notes_task_3;

	public Text txt_version;
	public TMP_InputField input_Notes;
	public Text txt_Active;
	public Text txt_Complete;

	public float saveInterval = 15.0f;

	private bool _bNotesNeedSaving = false;
	private float _fTimeSinceLastSend = 0.0f;
	private int _prev_index_journal_progress = -1;
	private bool _bNotesNewlyFocused = false;

	private float _time_journal_active = 0.0f;
	private float _time_notes_active = 0.0f;

	private Animator _animator_Active;
	private Animator _animator_Complete;

	private Image _notes_background;

	private static UI_Journal _instance;

	private static int _journal_week = -1;
	private static string _key_journal_notes = null;
	private static bool _setting_journal_text = false;

	// BChance: Taken from '/application/journal.lua'.
	private static readonly string[][][] _journal_progress = new string[][][]
	{
		// week 1
		new string[][]
		{
			// fast tracker
			new string[]
			{
				"Welcome to New City!  Now that you've made it, go and talk to your team assistant, Evelyn Hu.  She is waiting for you at your team office.",
				"You now have your first meeting with your client's representative, Will Standon, at his office in City Hall.  Head to him now and see what he has to tell you.",
				"Now, go and meet with Sandy Carlson at the New City Cinemas to find out what media relations firms are available to help with your first task.",
				"Visit and interview the media relations firms that Sandy Carlson told you about - then conduct research around town to decide who would be best for your task.  When you have arrived at a decision, go and tell Will Standon whom you'd like to hire.",
				"Now that you have interviewed all the media relations firms available to help with your task, do as much research as you can - then report to Will Standon with your decision.",
				"After informing Will Standon of your decision, go and meet Mayor Gonzalez in her office for approval. Remember to dress your best!",
				"Your next step is to make a deal with whomever you chose to help you with your task.  Head to the vendor's location and negotiate a fee for their services.",
				"Congratulations! You have successfully reached a deal with the vendor.  Now, go and see Will Standon so that he can draw up a contract for their services.",
				"You need to bring the contract you received from Will Standon back to the vendor and have it signed.",
				"Now, head back to City Hall and have the Mayor countersign the contract signed by the vendor to complete your assignment.",
				"You're almost done with your first task!  The last thing you have to do is bring the countersigned contract back to Will Standon, so he can file it away.",
				"Congratulaltions! You have completed the principal task you were assigned.  Now that your job in New City is complete for now, you can look around to see who else you can find who could use your help!\n\nIf your team members have completed this task as well, inform your teacher that your team is ready for Task 2!",
			},
			// smooth operator
			new string[]
			{
				"Welcome to New City!  Now that you've made it, go and talk to your team assistant, Evelyn Hu.  She is waiting for you at your team office.",
				"You now have your first meeting with your client's representative, Will Standon, at his office in City Hall.  Head to him now and see what he has to tell you.",
				"Now, go and meet Dennis McCarthy at Techtronics to find out what emergency response services are available to help with your first task.",
				"Visit and interview the emergency response services providers  that  Dennis McCarthy told you about - then conduct research around town to decide who would be best for your task.  When you have arrived at a decision, go and tell Will Standon whom you'd like to hire.",
				"Now that you have interviewed all the emergency response services firms available to help with your task, do as much research as you can - then report to Will Standon with your decision.",
				"After informing Will Standon of your decision, go and meet Mayor Gonzalez in her office for approval. Remember to dress your best!",
				"Your next step is to make a deal with whomever you chose to help you with your task.  Head to the vendor's location and negotiate a fee for their services.",
				"Congratulations! You have successfully reached a deal with the vendor.  Now, go and see Will Standon so that he can draw up a contract for their services.",
				"You need to bring the contract you received from Will Standon back to the vendor and have it signed.",
				"Now, head back to City Hall and have the Mayor countersign the contract signed by the vendor to complete your assignment.",
				"You're almost done with your first task!  The last thing you have to do is bring the countersigned contract back to Will Standon, so he can file it away.",
				"Congratulaltions! You have completed the principal task you were assigned.  Now that your job in New City is complete for now, you can look around to see who else you can find who could use your help!\n\nIf your team members have completed this task as well, inform your teacher that your team is ready for Task 2!",
			},
			// grime stopper
			new string[]
			{
				"Welcome to New City!  Now that you've made it, go and talk to your team assistant, Evelyn Hu.  She is waiting for you at your team office.",
				"You now have your first meeting with your client's representative, Will Standon, at his office in City Hall.  Head to him now and see what he has to tell you.",
				"Now, go and meet with Mark Carpenter at Power Planning to find out what spill containment providers are available to help with your first task.",
				"Visit and interview the toxic spill containment providers that Mark Carpenter told you about - then conduct research around town to decide who would be best for your task.  When you have arrived at a decision, go and tell Will Standon whom you'd like to hire.",
				"Now that you have interviewed all the hazardous materials containment providers available to help with your task, do as much research as you can - then report to Will Standon with your decision.",
				"After informing Will Standon of your decision, go and meet Mayor Gonzalez in her office for approval. Remember to dress your best!",
				"Your next step is to make a deal with whomever you chose to help you with your task.  Head to the vendor's location and negotiate a fee for their services.",
				"Congratulations! You have successfully reached a deal with the vendor.  Now, go and see Will Standon so that he can draw up a contract for their services.",
				"You need to bring the contract you received from Will Standon back to the vendor and have it signed.",
				"Now, head back to City Hall and have the Mayor countersign the contract signed by the vendor to complete your assignment.",
				"You're almost done with your first task!  The last thing you have to do is bring the countersigned contract back to Will Standon, so he can file it away.",
				"Congratulaltions! You have completed the principal task you were assigned.  Now that your job in New City is complete for now, you can look around to see who else you can find who could use your help!\n\nIf your team members have completed this task as well, inform your teacher that your team is ready for Task 2!",
			},
			// green machine
			new string[]
			{
				"Welcome to New City!  Now that you've made it, go and talk to your team assistant, Evelyn Hu.  She is waiting for you at your team office.",
				"You now have your first meeting with your client's representative, Will Standon, at his office in City Hall.  Head to him now and see what he has to tell you.",
				"Now, go and meet Heather Winehart at her loft to find out what environmental damage assessment consultants are available to help with your first task.",
				"Visit and interview the disaster assment providers that Heather Winehart told you about - then conduct research around town to decide who would be best for your task.  When you have arrived at a decision, go and tell Will Standon whom you'd like to hire.",
				"Now that you have interviewed all the disaster assessment providers available to help with your task, do as much research as you can - then report to Will Standon with your decision.",
				"After informing Will Standon of your decision, go and meet Mayor Gonzalez in her office for approval. Remember to dress your best!",
				"Your next step is to make a deal with whomever you chose to help you with your task.  Head to the vendor's location and negotiate a fee for their services.",
				"Congratulations! You have successfully reached a deal with the vendor.  Now, go and see Will Standon so that he can draw up a contract for their services.",
				"You need to bring the contract you received from Will Standon back to the vendor and have it signed.",
				"Now, head back to City Hall and have the Mayor countersign the contract signed by the vendor to complete your assignment.",
				"You're almost done with your first task!  The last thing you have to do is bring the countersigned contract back to Will Standon, so he can file it away.",
				"Congratulaltions! You have completed the principal task you were assigned.  Now that your job in New City is complete for now, you can look around to see who else you can find who could use your help!\n\nIf your team members have completed this task as well, inform your teacher that your team is ready for Task 2!",
			},
		},
		// week 2
		new string[][]
		{
			// fast tracker
			new string[]
			{
				"Welcome back!  Your team assistant, Evelyn Hu, is waiting for you at your team office. She will help you get started with your second task in New City.",
				"You have a meeting with Will Standon at his office in City Hall.  He will give you instructions for your next task.",
				"You have a meeting with D-Verb at Hip Hop House to find out what local spokespersons are available to help with your task.",
				"Research and interview the spokespeople that D-Verb told you about - then decide who would be best for your task.  Inform Will Standon of your choice when you have reached a decision.",
				"Report to Will Standon with your decision when you finish researching and interviewing the spokespersons available for the relief and recovery effort.",
				"Go and meet with Mayor Gonzalez in her office for to get her approval to hire the vendor you chose.",
				"Your next step is to make a deal with whomever you chose to help you with your task.  Head to the vendor's location and negotiate a fee for their services.",
				"Congratulations! You have successfully reached a deal with the vendor.  Now, go and see Will Standon so that he can draw up a contract for their services.",
				"You need to bring the contract you received from Will Standon back to the vendor and have it signed.",
				"Now, head back to City Hall and have the Mayor countersign the contract signed by the vendor to complete your assignment.",
				"You're almost done! Your final step is to bring the countersigned contract that the Mayor gave you back to Will Standon, so that it may be filed away.",
				"Congratulaltions! You have completed the task you were assigned.  Now that your job in New City is complete for this week, try and look around to see who else you can find who could use your help!",
			},
			// smooth operator
			new string[]
			{
				"Welcome back!  Your team assistant, Evelyn Hu, is waiting for you at your team office. She will help you get started with your second task in New City.",
				"You have a meeting with Will Standon at his office in City Hall.  He will give you instructions for your next task.",
				"You have a meeting with Willie Ketchum at City Hall to find out what logistics and support services firms are available to help with your task.",
				"Research and interview the logistics and support services firms that Willie Ketchum told you about - then decide who would be best for your task.  Inform Will Standon of your choice when you have reached a decision.",
				"Report to Will Standon with your decision when you finish researching and interviewing the firms available to perform logistics and support services for the relief and recovery effort.",
				"Go and meet with Mayor Gonzalez in her office for to get her approval to hire the vendor you chose.",
				"Your next step is to make a deal with whomever you chose to help you with your task.  Head to the vendor's location and negotiate a fee for their services.",
				"Congratulations! You have successfully reached a deal with the vendor.  Now, go and see Will Standon so that he can draw up a contract for their services.",
				"You need to bring the contract you received from Will Standon back to the vendor and have it signed.",
				"Now, head back to City Hall and have the Mayor countersign the contract signed by the vendor to complete your assignment.",
				"You're almost done! Your final step is to bring the countersigned contract that the Mayor gave you back to Will Standon, so that it may be filed away.",
				"Congratulaltions! You have completed the task you were assigned.  Now that your job in New City is complete for this week, try and look around to see who else you can find who could use your help!",
			},
			// grime stopper
			new string[]
			{
				"Welcome back!  Your team assistant, Evelyn Hu, is waiting for you at your team office. She will help you get started with your second task in New City.",
				"You have a meeting with Will Standon at his office in City Hall.  He will give you instructions for your next task.",
				"You have a meeting with Count de Monet at Throne Time to find out what waste recovery and disposal providers are available to help with your task.",
				"Research and interview the waste recovery and disposal providers that Count de Monet told you about - then decide who would be best for your task. Inform Will Standon of your choice when you have reached a decision.",
				"Report to Will Standon with your decision when you finish researching and interviewing the firms available to recover and dispose of the contaminants on the New City River.",
				"Go and meet with Mayor Gonzalez in her office for to get her approval to hire the vendor you chose.",
				"Your next step is to make a deal with whomever you chose to help you with your task.  Head to the vendor's location and negotiate a fee for their services.",
				"Congratulations! You have successfully reached a deal with the vendor.  Now, go and see Will Standon so that he can draw up a contract for their services.",
				"You need to bring the contract you received from Will Standon back to the vendor and have it signed.",
				"Now, head back to City Hall and have the Mayor countersign the contract signed by the vendor to complete your assignment.",
				"You're almost done! Your final step is to bring the countersigned contract that the Mayor gave you back to Will Standon, so that it may be filed away.",
				"Congratulaltions! You have completed the task you were assigned.  Now that your job in New City is complete for this week, try and look around to see who else you can find who could use your help!",
			},
			// green machine
			new string[]
			{
				"Welcome back!  Your team assistant, Evelyn Hu, is waiting for you at your team office. She will help you get started with your second task in New City.",
				"You have a meeting with Will Standon at his office in City Hall.  He will give you instructions for your next task.",
				"You have a meeting with Debra Geffen at Clik-Adz to find out what law firms are available to help with your second task.",
				"Research and interview the compliance and legal services providers that Debra Geffen told you about - then decide which one is best for your task.  Inform Will Standon of your choice when you have reached a decision.",
				"Report to Will Standon with your decision when you finish researching and interviewing the law firms available to perform legal and compliance work on behalf of the City's relief and recovery effort.",
				"Go and meet with Mayor Gonzalez in her office for to get her approval to hire the vendor you chose.",
				"Your next step is to make a deal with whomever you chose to help you with your task.  Head to the vendor's location and negotiate a fee for their services.",
				"Congratulations! You have successfully reached a deal with the vendor.  Now, go and see Will Standon so that he can draw up a contract for their services.",
				"You need to bring the contract you received from Will Standon back to the vendor and have it signed.",
				"Now, head back to City Hall and have the Mayor countersign the contract signed by the vendor to complete your assignment.",
				"You're almost done! Your final step is to bring the countersigned contract that the Mayor gave you back to Will Standon, so that it may be filed away.",
				"Congratulaltions! You have completed the task you were assigned.  Now that your job in New City is complete for this week, try and look around to see who else you can find who could use your help!",
			},
		},
		// week 3
		new string[][]
		{
			// fast tracker
			new string[]
			{
				"Welcome to New City!  Now that you've made it, go and talk to your team assistant, Evelyn Hu.  She is waiting for you at your team office.",
				"Something is amiss in New City! Head to Will Standon at City Hall now and see what he has to tell you.",
				"Now, go and meet with Willie Ketchum, New City's highest ranking law enforcement official, to receive a 'profile' of the criminal presumed responsible for the fraudulent scheme.",
				"Visit Luisa's Kitchen, where Ketchum told you to start your investigation.  Talk to all the people you find there and see if you can discover any clues!",
				"You have discovered a clue leading you to Needles and Threads.  Go and talk to the people you find there.  Remember to take notes in case they tell you something important...",
				"Your investigation has finally yielded some suspects! Head to the various containment specialists in town that your team mates know about. Determine which best matches the profile that Ketchum gave you.",
				"Congratulations!  Your final task in New City is now complete.  You should pat yourself on the back for a job well done - and be sure and look out for the results of all your work online sometime after you leave town. Now go and have fun - and see if there is anything for you to do.",
				"Empty1!",
				"Empty2!",
				"Empty3!",
				"Empty4!",
				"Empty5!",
			},
			// smooth operator
			new string[]
			{
				"Welcome to New City!  Now that you've made it, go and talk to your team assistant, Evelyn Hu.  She is waiting for you at your team office.",
				"Something is amiss in New City! Head to Will Standon at City Hall now and see what he has to tell you.",
				"Now, go and meet with Willie Ketchum, New City's highest ranking law enforcement official, to receive a 'profile' of the criminal presumed responsible for the fraudulent scheme.",
				"Visit Bona Fortuna, where Ketchum told you to start your investigation.  Talk to the people you find there and see if you can discover any clues!",
				"You have discovered a clue leading you to National Readiness Services.  Go and talk to the people you find there.  Remember to take notes in case they tell you something important...",
				"Your investigation has finally yielded some suspects! Head to the various ecological damage assessment specialists in town that that your team mates know about. Determine which best matches the profile that Ketchum gave you.",
				"Congratulations!  Your final task in New City is now complete.  You should pat yourself on the back for a job well done - and be sure and look out for the results of all your work online sometime after you leave town. Now go and have fun - and see if there is anything for you to do.",
				"Empty1!",
				"Empty2!",
				"Empty3!",
				"Empty4!",
				"Empty5!",
			},
			// grime stopper
			new string[]
			{
				"Welcome to New City!  Now that you've made it, go and talk to your team assistant, Evelyn Hu.  She is waiting for you at your team office.",
				"Something is amiss in New City! Head to Will Standon at City Hall now and see what he has to tell you.",
				"Now, go and meet with Willie Ketchum, New City's highest ranking law enforcement official, to receive a 'profile' of the criminal presumed responsible for the fraudulent scheme.",
				"Visit Cramarossa's Sandwich Joint, where Ketchum told you to start your investigation.  Talk to the people you find there and see if you can discover any clues!",
				"You have discovered a clue leading you to Lindo Equipment.  Go and talk to the people you find there.  Remember to take notes in case they tell you something important...",
				"Your investigation has finally yielded some suspects! Head to the various media relations specialists in town that that your team mates know about. Determine which best matches the profile that Ketchum gave you.",
				"Congratulations!  Your final task in New City is now complete.  You should pat yourself on the back for a job well done - and be sure and look out for the results of all your work online sometime after you leave town. Now go and have fun - and see if there is anything for you to do.",
				"Empty1!",
				"Empty2!",
				"Empty3!",
				"Empty4!",
				"Empty5!",
			},
			// green machine
			new string[]
			{
				"Welcome to New City!  Now that you've made it, go and talk to your team assistant, Evelyn Hu.  She is waiting for you at your team office.",
				"Something is amiss in New City! Head to Will Standon at City Hall now and see what he has to tell you.",
				"Now, go and meet with Willie Ketchum, New City's highest ranking law enforcement official, to receive a 'profile' of the criminal presumed responsible for the fraudulent scheme.",
				"Visit the Markdown Street Diner, where Ketchum told you to start your investigation.  Talk to the people you find there and see if you can discover any clues!",
				"You have discovered a clue leading you to New City Tools and Equipment.  Go and talk to the people you find there.  Remember to take notes in case they tell you something important.",
				"Your investigation has finally yielded some suspects! Head to the various medical response firms in town that your team mates know about. Determine which best matches the profile that Ketchum gave you.",
				"Congratulations!  Your final task in New City is now complete.  You should pat yourself on the back for a job well done - and be sure and look out for the results of all your work online sometime after you leave town. Now go and have fun - and see if there is anything for you to do.",
				"Empty1!",
				"Empty2!",
				"Empty3!",
				"Empty4!",
				"Empty5!",
			},
		},
	};

	void Awake()
	{
		_instance = this;

		// BChance: (2016-01-07) - Ensure GLOBALs are setup.
		GLOBAL.Init();
	}

	// Use this for initialization
	void Start()
	{
		// BChance: Reset the static fields.
		_journal_week = -1;
		_key_journal_notes = null;
		_setting_journal_text = false;

		//txt_version.text = "v." + CONFIG.VERSION;

		_notes_background = input_Notes.GetComponent<Image>();
		color_background_active = _notes_background.color;
		color_background_readonly = new Color
		(
			color_background_readonly.r,
			color_background_readonly.g,
			color_background_readonly.b,
			color_background_active.a
		);
		
		_animator_Active = txt_Active.GetComponent<Animator>();
		_animator_Complete = txt_Complete.GetComponent<Animator>();

		ToggleView();
	    SetScrollBarsStartValue();

		SetJournalText();

		// Hide by default.
		canvas.SetActive(false);
	}

    private void SetScrollBarsStartValue()
    {
        var glossaryScrollRect = view_Glossary.GetComponent<ScrollRect>();
        glossaryScrollRect.verticalScrollbar.value = 0.999999f;
    }

    // Update is called once per frame
	void Update()
	{
		_fTimeSinceLastSend += Time.deltaTime;

		if (_bNotesNeedSaving)
		{
			if (_fTimeSinceLastSend >= saveInterval)
			{
				Debug.Log("== Journal saving... ==");

				// BChance: Increment the time in seconds the journal and notes are open, and flag the them for tracking.
				GLOBAL.Player.progress["sJournalTime"] = GLOBAL.Player.progress["sJournalTime"].i + (int)Mathf.Round(_time_journal_active);
				GLOBAL.Player.progress["tkjournaltime"] = true;
				GLOBAL.Player.progress["sNotePadTime"] = GLOBAL.Player.progress["sNotePadTime"].i + (int)Mathf.Round(_time_notes_active);
				GLOBAL.Player.progress["tknotepadtime"] = true;

				// Clear the times.
				_time_journal_active = 0.0f;
				_time_notes_active = 0.0f;

				// TODO: Save the journal.

				//StartCoroutine(GLOBAL.Player.Web_SendPlayerData_Progress());

				_fTimeSinceLastSend = 0.0f;
				_bNotesNeedSaving = false;
			}
		}

		// Track how long the journal and notes are open.
		if (canvas.activeSelf)
		{
			_time_journal_active += Time.deltaTime;

			if (view_Notes.activeSelf)
			{
				_time_notes_active += Time.deltaTime;
			}
		}

		// Update the 'Active' and 'Complete' panes if they need it.
		DetermineJournalProgress();
	}

	void OnDestroy()
	{
		if (_instance == this)
			_instance = null;
	}

	private void ToggleView()
	{
		Toggle activeToggle = toggrp_Journal.ActiveToggles().FirstOrDefault();
		if (activeToggle != null)
		{
			if (activeToggle.name.Equals("tog_Active"))
			{
				view_Active.SetActive(true);
				view_Complete.SetActive(false);
				view_Notes.SetActive(false);
				view_Glossary.SetActive(false);
			}
			else if (activeToggle.name.Equals("tog_Complete"))
			{
				view_Active.SetActive(false);
				view_Complete.SetActive(true);
				view_Notes.SetActive(false);
				view_Glossary.SetActive(false);
			}
			else if (activeToggle.name.Equals("tog_Notes"))
			{
				view_Active.SetActive(false);
				view_Complete.SetActive(false);
				view_Notes.SetActive(true);
				view_Glossary.SetActive(false);
			}
			else if (activeToggle.name.Equals("tog_Glossary"))
			{
				view_Active.SetActive(false);
				view_Complete.SetActive(false);
				view_Notes.SetActive(false);
				view_Glossary.SetActive(true);
                SetScrollBarsStartValue();
            }
		}
	}

	public void toggle_view_Changed(bool bOn)
	{
		ToggleView();
	}

	public void btn_Close_Click()
	{
		UI_Journal.Close();
	}

	public void input_Notes_ValueChanged(string strText)
	{
		// Flag the notes as needing saving.
		_bNotesNeedSaving = true;

		// Setup the journal_notes to be saved.
		//GLOBAL.Player.progress["journal_notes"] = ConvertSpecialCharsToTags(input_Notes.text);
		GLOBAL.Player.progress[_key_journal_notes] = ConvertSpecialCharsToTags(input_Notes.text);
	}

	public void input_Notes_OnSelected(string text)
	{
		Debug.Log("== UI_Journal.input_Notes_OnSelected() ==");

		StartCoroutine(MoveTextEnd_NextFrame());
	}

	public void input_Notes_OnDeselect(string text)
	{
		Debug.Log("== UI_Journal.input_Notes_OnDeselect() ==");
	}
 
	private IEnumerator MoveTextEnd_NextFrame()
	{
		// Skip the first frame in which this is called.
	    yield return 0;

	    // Move the caret to the end after a frame of delay.
	    input_Notes.MoveTextEnd(false);

		Debug.Log("== UI_Journal.MoveTextEnd_NextFrame() ==");
	}

	public static void Load()
	{
		if (_instance == null)
		{
			SceneManager.LoadScene("UI_Journal", LoadSceneMode.Additive);
		}
	}

	public static void DataSaved()
	{
		if (_instance != null)
		{
			// The data has been saved, so unflag notes needing saving.
			_instance._bNotesNeedSaving = false;
		}
	}

	public static bool IsOpen()
	{
		return 
			   _instance != null
			&& _instance.canvas.activeSelf;
	}

	public static void Open()
	{
		_instance.canvas.SetActive(true);

		GLOBAL.Player.Log(string.Format
		(
			"Journal Opened - jrnsz_1: {0}; jrnsz_2: {1}; jrnsz_3: {2}",
			GLOBAL.JSize(1),
			GLOBAL.JSize(2),
			GLOBAL.JSize(3)
		));
	}

	public static void Close()
	{
		_instance.canvas.SetActive(false);

		GLOBAL.Player.Log(string.Format
		(
			"Journal Closed - jrnsz_1: {0}; jrnsz_2: {1}; jrnsz_3: {2}",
			GLOBAL.JSize(1),
			GLOBAL.JSize(2),
			GLOBAL.JSize(3)
		));
	}

	public static void ToggleOpenClose()
	{
		// Toggle the visibility of the Journal UI.
		_instance.canvas.SetActive(!_instance.canvas.activeSelf);

		Debug.Log("UI_Journal - ToggleOpenClose() - Active: " + _instance.canvas.activeSelf);

		GLOBAL.Player.Log(string.Format
		(
			"Journal {0} - jrnsz_1: {1}; jrnsz_2: {2}; jrnsz_3: {3}",
			IsOpen() ? "Opened" : "Closed",
			GLOBAL.JSize(1),
			GLOBAL.JSize(2),
			GLOBAL.JSize(3)
		));
	}

	public void toggle_notes_Changed(int week)
	{
		SetJournalText(week);
	}

	public static void SetJournalText(int week = -1)
	{
		if (!_setting_journal_text)
		{
			_setting_journal_text = true;

			if (   _instance != null
				&& GLOBAL.Player != null)
			{
				int current_week = GLOBAL.Player.progress["week"].i;
				current_week = Mathf.Max(1, current_week);

				// If we have a journal open, ensure that it's data is saved before changing.
				if (_key_journal_notes != null)
					GLOBAL.Player.progress[_key_journal_notes] = ConvertSpecialCharsToTags(_instance.input_Notes.text);

				_journal_week = week;

				// BChance: Default to the current week if one isn't specified.
				if (_journal_week < 1)
					_journal_week = current_week;

				_key_journal_notes = "journal_notes_" + _journal_week;
				
				// _instance.input_Notes.text = ConvertTagsToSpecialChars(GLOBAL.Player.progress["journal_notes"].str);
				_instance.input_Notes.text = ConvertTagsToSpecialChars(GLOBAL.Player.progress[_key_journal_notes].str);

				_instance.input_Notes.readOnly = _journal_week < current_week;
				if (_instance.input_Notes.readOnly)
					_instance._notes_background.color = _instance.color_background_readonly;
				else
					_instance._notes_background.color = _instance.color_background_active;

				_instance.ToggleNotes(current_week);

				_instance.StartCoroutine(_instance.MoveTextEnd_NextFrame());
			}
				
			_setting_journal_text = false;
		}
	}

	private void ToggleNotes(int current_week)
	{
		tog_notes_task_1.gameObject.SetActive(true);
		tog_notes_task_2.gameObject.SetActive(current_week >= 2);
		tog_notes_task_3.gameObject.SetActive(current_week >= 3);

		tog_notes_task_1.isOn = _journal_week == 1;
		tog_notes_task_2.isOn = _journal_week == 2;
		tog_notes_task_3.isOn = _journal_week == 3;
	}

	private static string ConvertSpecialCharsToTags(string text)
	{
		Debug.Log("ConvertSpecialCharsToTags() - before:\n" + text);
		string result = text.Replace("\n", "<br>").Replace("\r", "<cr>").Replace("\"", "<q>").Replace("\\", "<bs>").Replace("/", "<fs>").Replace("=", "<eq>");
		Debug.Log("ConvertSpecialCharsToTags() - after:\n" + result);
		return result;
	}

	private static string ConvertTagsToSpecialChars(string text)
	{
		if (text != null)
		{
			Debug.Log("ConvertTagsToSpecialChars() - before:\n" + text);
			string result = text.Replace("<br>", "\n").Replace("<nl>", "\n").Replace("<cr>", "\r").Replace("<q>", "\"").Replace("<bs>", "\\").Replace("<fs>", "/").Replace("<eq>", "=");
			Debug.Log("ConvertTagsToSpecialChars() - after:\n" + result);
			return result;
		}
		else
		{
			return "";
		}
	}

	private void DetermineJournalProgress()
	{
		int index_journal_progress = GLOBAL.Player.progress["journalprogress"].i - 1;
		int index_week = GLOBAL.Player.progress["week"].i - 1;

		if (   index_week > -1
			&& index_week < 3
			&& index_journal_progress > -1
			&& _prev_index_journal_progress != index_journal_progress)
		{
			int index_player_num = GLOBAL.Player.progress["playernum"].i - 1;

			Debug.Log("== Journal Progres: index: " + index_journal_progress + ", week index: " + index_week + ", player num index: " + index_player_num);

			StringBuilder strb_active = new StringBuilder();
			StringBuilder strb_complete = new StringBuilder();

			// Fill the 'Active' pane with the current step.
			strb_active.Append("• ");
			strb_active.Append(_journal_progress[index_week][index_player_num][index_journal_progress]);

			// Loop thru the all the steps before the current one to fill the 'Complete' pane.
			for (int index_complete = 0; index_complete < index_journal_progress; ++index_complete)
			{
				strb_complete.Append("• ");
				strb_complete.Append(_journal_progress[index_week][index_player_num][index_complete]);
				strb_complete.Append("\n\n");
			}

			txt_Active.text = strb_active.ToString();
			txt_Complete.text = strb_complete.ToString();

			_prev_index_journal_progress = index_journal_progress;

			// Play the 'text_flash' animation.
			_animator_Active.SetTrigger("flash");
			_animator_Complete.SetTrigger("flash");
		}
	}
}
