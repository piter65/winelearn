using System;
using UnityEngine;
using UnityEngine.UI;

namespace Assets.Scripts.CanvasesScripts
{
    public abstract class AbstractCanvasBehavior : MonoBehaviour
    {
        public Button ExitButton;
        public Scrollbar Scrollbar;
        public event EventHandler CanvasClosed;
        public abstract void Load(string startParam);
        public abstract void Clean();

        void Awake()
        {
            if (ExitButton != null)
            {
                ExitButton.onClick.AddListener(OnCanvasClosed);
            }
            else
            {
                Debug.LogError("ExitButton not found");
            }

            if (Scrollbar == null)
                Debug.LogError("Scrollbar not found");
        }

        protected virtual void OnCanvasClosed()
        {
            var handler = CanvasClosed;
            if (handler != null) handler(this, EventArgs.Empty);
        }
    }
}