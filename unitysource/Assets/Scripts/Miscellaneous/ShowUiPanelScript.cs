using UnityEngine;

namespace Assets.Scripts.Miscellaneous
{
    public class ShowUiPanelScript : MonoBehaviour
    {
        public UiPanelController UiPanel;

        void OnMouseDown()
        {
            UiPanel.OpenUiPanel();
        }

        // Use this for initialization
        void Start()
        {
            if (UiPanel != null)
            {
                UiPanel.CloseUiPanel();
            }
            else
            {
                Debug.LogError("ShowUiPanelScript:UiPanel not found");
            }
        }

        // Update is called once per frame
        void Update()
        {

        }
    }
}
