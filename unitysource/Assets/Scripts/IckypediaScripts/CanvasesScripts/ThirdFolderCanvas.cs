using System;
using Assets.Scripts.IckipediaDataScripts;
using UnityEngine;
using UnityEngine.UI;

namespace Assets.Scripts.CanvasesScripts
{
    public class ThirdFolderCanvas : AbstractCanvasBehavior
    {
        public Text ContentText;
        public string Reference { get; private set; }

        void Start()
        {
            if (ContentText == null)
                Debug.LogError("ThirdFolderCanvas:ContentText is null");
        }

        public override void Load(string startParam)
        {
            Reference = startParam;

            var positionNumber = IckipediaData.GetIndexForThirdLayer(startParam);
            var text = IckipediaData.IckipediaThirdLevel[positionNumber];
            ContentText.text = text;

            Scrollbar.value = 0.9999f;
        }

        public override void Clean()
        {
            ContentText.text = "";
        }
    }
}