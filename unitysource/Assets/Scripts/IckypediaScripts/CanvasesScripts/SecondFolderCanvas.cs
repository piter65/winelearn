using System;
using System.Diagnostics;
using System.Linq;
using Assets.Scripts.IckipediaDataScripts;
using UnityEngine.UI;
using Debug = UnityEngine.Debug;

namespace Assets.Scripts.CanvasesScripts
{
	public class SecondFolderCanvas : AbstractCanvasBehavior
	{
		public Text Text;
		public Button ReferenceOne;
		public Button ReferenceTwo;
		public Button ReferenceThree;

		public event Delegates.ReferenceDelegate ReferenceWasChoosen;

		void Start()
		{
			if (Text == null)
				Debug.LogError("SecondFolderCanvas:Text not found");

			if (ReferenceOne == null)
				Debug.LogError("SecondFolderCanvas:ReferenceOne not found");

			if (ReferenceTwo == null)
				Debug.LogError("SecondFolderCanvas:ReferenceTwo not found");

			if (ReferenceThree == null)
				Debug.LogError("SecondFolderCanvas:ReferenceThree not found");
		}

		public override void Load(string startParam)
		{
			if (IckipediaData.IckipediaRootLevel.ContainsKey(startParam))
			{
				var ickipediaPerson = IckipediaData.IckipediaRootLevel[startParam];
				Text.text = ickipediaPerson.Bio;

				var referencesStringsArray = ickipediaPerson.Reference.Keys.ToArray();

				ReferenceOne.GetComponentInChildren<Text>().text = referencesStringsArray[0];
				ReferenceTwo.GetComponentInChildren<Text>().text = referencesStringsArray[1];
				ReferenceThree.GetComponentInChildren<Text>().text = referencesStringsArray[2];

				ReferenceOne.onClick.AddListener(() =>
				{
					OnReferenceWasChoosen(startParam, 0);
				});

				ReferenceTwo.onClick.AddListener(() =>
				{
					OnReferenceWasChoosen(startParam, 1);
				});

				ReferenceThree.onClick.AddListener(() =>
				{
					OnReferenceWasChoosen(startParam, 2);
				});

				// Compose the icky_read flag for this week.
				int week = GLOBAL.Player.progress["week"].i;
				string icky_read = string.Format("w{0}icky_read", week);

				// BChance: If we haven't flagged that an icky article has been read this week, do so now.
				if (!GLOBAL.Player.progress[icky_read].b)
				{
					GLOBAL.Player.progress[icky_read] = true;

					// Ensure that the player data is saved.
					StartCoroutine(GLOBAL.Player.Web_SendPlayerData_Progress());
				}
			}
			else
			{
				Debug.LogError("Bio for this name not found: " + startParam);
			}

			Scrollbar.value = 0.9999f;
		}

		public override void Clean()
		{
			Text.text = string.Empty;
			ReferenceOne.GetComponentInChildren<Text>().text = string.Empty;
			ReferenceTwo.GetComponentInChildren<Text>().text = string.Empty;
			ReferenceThree.GetComponentInChildren<Text>().text = string.Empty;

			ReferenceOne.onClick.RemoveAllListeners();
			ReferenceTwo.onClick.RemoveAllListeners();
			ReferenceThree.onClick.RemoveAllListeners();
		}

		protected virtual void OnReferenceWasChoosen(string nameParam, int referenceNumber)
		{
			if (IckipediaData.IckipediaRootLevel.ContainsKey(nameParam))
			{
				var ickipediaPerson = IckipediaData.IckipediaRootLevel[nameParam];
				var refKey = ickipediaPerson.Reference.Keys.ToArray()[referenceNumber];
				var refValue = ickipediaPerson.Reference[refKey];

				var handler = ReferenceWasChoosen;
				if (handler != null) handler(refValue);
			}
		}
	}
}
