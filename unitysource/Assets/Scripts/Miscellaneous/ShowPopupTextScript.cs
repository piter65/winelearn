using UnityEngine;
using System.Collections;
using UnityEngine.UI;

public class ShowPopupTextScript : MonoBehaviour
{
    public string PopupText;
    public GameObject PopupGameObject;
    private bool _adjustText;

    void OnMouseOver()
    {
        PopupGameObject.SetActive(true);
        PopupGameObject.GetComponentInChildren<Text>().text = PopupText;
        _adjustText = true;
    }

    void OnMouseExit()
    {
        PopupGameObject.SetActive(false);
        _adjustText = true;
    }

    // Use this for initialization
    void Start()
    {
        if (PopupGameObject != null)
        {
            PopupGameObject.SetActive(false);
        }
        else
        {
            Debug.LogError("ShowPopupTextScript:PopupGameObject not found");
        }
    }

    // Update is called once per frame
    void Update()
    {
        if (_adjustText)
        {
            AdjustObjectPositionToMousePointerPosition(PopupGameObject);
        }
    }

    private void AdjustObjectPositionToMousePointerPosition(GameObject gameObj)
    {
        var mousePosiiton = Input.mousePosition;
        gameObj.transform.position = mousePosiiton;
    }
}
