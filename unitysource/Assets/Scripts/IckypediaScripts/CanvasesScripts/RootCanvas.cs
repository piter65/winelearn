using System;
using Assets.Scripts.IckipediaDataScripts;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

namespace Assets.Scripts.CanvasesScripts
{
    public class RootCanvas : AbstractCanvasBehavior
    {
        public Button ElementPrefab;
        public GameObject ElementsHolder;

        public event Delegates.NameDelegate NameWasPressed;

        public override void Load(string startParam)
        {
            foreach (var ickipediaName in IckipediaData.IckipediaRootLevel.Keys)
            {
                var instance = Instantiate(ElementPrefab); //instantiate
                instance.name = ickipediaName;
                instance.transform.SetParent(ElementsHolder.transform, false); //move to element holder
                var textComponent = instance.GetComponentInChildren<Text>();
                textComponent.text = ickipediaName; //set name

                instance.onClick.AddListener(() =>
                {
                    var nameStr = instance.GetComponentInChildren<Text>().text;
                    OnNameWasPressed(nameStr);
                });
            }
        }

        public override void Clean()
        {
            for (int i = 0; i < ElementsHolder.transform.childCount; i++)
            {
                Destroy(ElementsHolder.transform.GetChild(i).gameObject);
            }
        }

        protected virtual void OnNameWasPressed(string nameStr)
        {
            var handler = NameWasPressed;
            if (handler != null) handler(nameStr);
        }
    }
}