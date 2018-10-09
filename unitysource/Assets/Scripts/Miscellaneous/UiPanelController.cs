using UnityEngine;

namespace Assets.Scripts.Miscellaneous
{
    public abstract class UiPanelController : MonoBehaviour
    {
        public abstract void OpenUiPanel();
        public abstract void CloseUiPanel();
    }
}