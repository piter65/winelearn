using UnityEngine;
using UnityEngine.UI;

namespace Assets.Scripts.IckypediaScripts
{
    public class IckypediaComputer : MonoBehaviour
    {
        public IckypediaBehaviorScript IckypediaBehaviorScript;

        public GameObject IckypediaPopupTextObject;
        private bool _adjustText;

        void OnMouseOver()
        {
            IckypediaPopupTextObject.SetActive(true);
            _adjustText = true;
        }

        void OnMouseDown()
        {
            IckypediaBehaviorScript.OpenIckypedia();
        }
        void OnMouseExit()
        {
            IckypediaPopupTextObject.SetActive(false);
            _adjustText = true;
        }

        // Use this for initialization
        void Start()
        {
            if (IckypediaPopupTextObject != null)
            {
                IckypediaPopupTextObject.gameObject.SetActive(false);
            }
            else
            {
                Debug.LogError("IckypediaComputer:IckypediaPopupTextObject not found");
            }

            if (IckypediaBehaviorScript == null)
            {
                Debug.LogError("IckypediaComputer:IckypediaBehaviorScript not found");
            }

            //var canvasObject = GameObject.Find("Canvas");
            //if (canvasObject == null)
            //{
            //    Debug.LogWarning("canvasObject not found");
            //}
            //else
            //{
            //    Debug.LogWarning("canvasObject exsist");
            //}

            //foreach (var obj in FindObjectsOfType(typeof(UIManager)))
            //{
            //    Debug.LogError("object " + obj.name);
            //}
        }

        // Update is called once per frame
        void Update()
        {
            if (_adjustText)
            {
                AdjustObjectPositionToMousePointerPosition(IckypediaPopupTextObject);
            }
        }

        private void AdjustObjectPositionToMousePointerPosition(GameObject gameObj)
        {
            var mousePosiiton = Input.mousePosition;
            gameObj.transform.position = mousePosiiton;
        }
    }
}
