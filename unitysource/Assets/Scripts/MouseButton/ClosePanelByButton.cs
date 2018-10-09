using UnityEngine;
using UnityEngine.UI;

namespace Assets.Scripts.MouseButton
{
    public class ClosePanelByButton : MonoBehaviour
    {
        public Button CloseButton;

        // Use this for initialization
        void Start()
        {
            CloseButton.onClick.AddListener(ClosePanel);
        }

        private void ClosePanel()
        {
            gameObject.SetActive(false);
        }

        // Update is called once per frame
        void Update()
        {

        }
    }
}
