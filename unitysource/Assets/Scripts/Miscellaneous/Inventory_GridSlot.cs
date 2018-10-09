using UnityEngine;
using System.Collections;
using UnityEngine.EventSystems;
using UnityEngine.UI;

// found code in Unity's docs http://docs.unity3d.com/ScriptReference/EventSystems.IDragHandler.html

[RequireComponent(typeof(Image))]
public class Inventory_GridSlot : MonoBehaviour, IBeginDragHandler, IDragHandler, IEndDragHandler, IPointerEnterHandler, IPointerExitHandler {

	private GameObject m_DraggingIcon;
	private RectTransform m_DraggingPlane;

	private int _gridIndex = 0;
	private bool _isMouseOver = false;

	void Start(){

		m_DraggingPlane = UI_Inventory.instance.canvas.transform as RectTransform;

		for(int i=0; i<transform.parent.childCount; i++){
			if(transform.parent.GetChild(i) == this.transform){
				_gridIndex = i;
				break;
			}
		}

	}

	void Update(){
		
		if(_isMouseOver){

			Vector3 globalMousePos;
			if (RectTransformUtility.ScreenPointToWorldPointInRectangle(m_DraggingPlane, Input.mousePosition, null, out globalMousePos))
			{
				UI_Inventory.SubText_Show(_gridIndex, "Player", globalMousePos, m_DraggingPlane.rotation);
			}

		}

	}


	public void OnBeginDrag(PointerEventData eventData)
	{
		m_DraggingIcon = new GameObject("DragingIcon");
		m_DraggingIcon.transform.SetParent (UI_Inventory.instance.canvas.transform, false);

		// to put it on top
		m_DraggingIcon.transform.SetAsLastSibling(); 

		var image = m_DraggingIcon.AddComponent<Image>();

		image.sprite = GetComponent<Image>().sprite;
		image.SetNativeSize();

		SetDraggedPosition(eventData);
	}

	public void OnDrag(PointerEventData data)
	{
		if (m_DraggingIcon != null)
			SetDraggedPosition(data);
	}

	private void SetDraggedPosition(PointerEventData data)
	{
		var rt = m_DraggingIcon.GetComponent<RectTransform>();
		Vector3 globalMousePos;
		if (RectTransformUtility.ScreenPointToWorldPointInRectangle(m_DraggingPlane, data.position, data.pressEventCamera, out globalMousePos))
		{
			rt.position = globalMousePos;
			rt.rotation = m_DraggingPlane.rotation;
		}
	}

	public void OnEndDrag(PointerEventData eventData)
	{
		if (m_DraggingIcon != null)
			Destroy(m_DraggingIcon);

		Camera cam = Camera.main;
		Ray ray = cam.ScreenPointToRay(eventData.position);
		UI_Inventory.DragAndDropped(_gridIndex, ray);

	}

	public void OnPointerEnter(PointerEventData eventData){

		_isMouseOver = true;
			
	}

	public void OnPointerExit(PointerEventData eventData){
		_isMouseOver = false;
		UI_Inventory.SubText_Hide();
	}

}
