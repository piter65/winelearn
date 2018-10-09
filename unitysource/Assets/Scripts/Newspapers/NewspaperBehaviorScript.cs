using System;
using Assets.Scripts.Data;
using Assets.Scripts.Miscellaneous;
using UnityEngine;
using UnityEngine.UI;

namespace Assets.Scripts.Newspapers
{
	public class NewspaperBehaviorScript : UiPanelController
	{
		public NewspaperData.NewspapersEnum Newspaper;
		public Scrollbar Scrollbar;
		public Button CloseButton;
		public Text DefaultTextHolder;

		// Use this for initialization
		void Start()
		{
			if (CloseButton != null)
			{
				CloseButton.onClick.AddListener(CloseUiPanel);
			}
			else
			{
				Debug.LogError(string.Format("{0}:{1}:CloseButton not found", gameObject.name, GetType().Name));
			}

			if (DefaultTextHolder == null)
			{
				Debug.LogError(string.Format("{0}:{1}:DefaultTextHolder not found", gameObject.name, GetType().Name));
			}

			if (Scrollbar == null)
				Debug.LogError(string.Format("{0}:{1}:Scrollbar not found", gameObject.name, GetType().Name));
		}

		// Update is called once per frame
		void Update()
		{

		}

		public override void OpenUiPanel()
		{
			// Don't interact if we're in the middle of a dialogue.
			if (!DialogueOverlay.is_open)
			{
				//SetText(NewspaperData.GetNewspaper(Newspaper).Week1);
				//Scrollbar.value = 0.9999999f;
				//gameObject.SetActive(true);

				UI_Inventory.BuyNewspaper(Newspaper);
			}
		}

		private void SetText(string text)
		{
			CleanElementHolder();

			var elementHolder = DefaultTextHolder.transform.parent.gameObject;
			if (text.Length > LongStringSecretSplitter.MaxStringCharacters) //max count of support characters 
			{
				foreach (var splits in text.Split(new[] { LongStringSecretSplitter.SecretSplitter }, StringSplitOptions.None))
				{
					if (splits.Length > LongStringSecretSplitter.MaxStringCharacters)
					{
						Debug.LogError(string.Format("Please divide string for smaller substring by using this splitter string: {0}", LongStringSecretSplitter.SecretSplitter));
					}

					var instance = Instantiate(DefaultTextHolder);
					if (instance != null)
					{
						instance.transform.SetParent(elementHolder.transform, false); //move to element holder
						instance.text = splits; //set name
					}
				}
				DefaultTextHolder.gameObject.SetActive(false);
			}
			else
			{
				DefaultTextHolder.text = text;
			}
		}

		public override void CloseUiPanel()
		{
			CleanElementHolder();
			gameObject.SetActive(false);
		}

		private void CleanElementHolder()
		{
			DefaultTextHolder.gameObject.SetActive(true);
			var elementHolder = DefaultTextHolder.transform.parent.gameObject;
			var childsCount = elementHolder.transform.childCount;
			for (int i = 0; i < childsCount; i++)
			{
				var child = elementHolder.transform.GetChild(i);
				if (!child.Equals(DefaultTextHolder.transform))
				{
					Destroy(child.gameObject);
				}
			}
		}
	}
}