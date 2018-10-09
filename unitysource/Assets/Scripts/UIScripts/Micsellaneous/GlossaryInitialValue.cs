using Assets.Scripts.Data;
using UnityEngine;
using UnityEngine.UI;

namespace Assets.Scripts.UIScripts.Micsellaneous
{
    public class GlossaryInitialValue : MonoBehaviour
    {
        public UI_Journal UiJournal;

        // Use this for initialization
        void Start()
        {
            var textComponent = UiJournal.view_Glossary.GetComponentInChildren<Text>();
            print("glossary: "+textComponent.text);
            textComponent.text = Glossary.GlossaryText;
        }

        // Update is called once per frame
        void Update()
        {

        }
    }
}
