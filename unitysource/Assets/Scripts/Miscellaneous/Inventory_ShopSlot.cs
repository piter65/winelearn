using UnityEngine;
using System.Collections;
using UnityEngine.EventSystems;
using UnityEngine.UI;

// found code in Unity's docs http://docs.unity3d.com/ScriptReference/EventSystems.IDragHandler.html

[RequireComponent(typeof(Image))]
public class Inventory_ShopSlot : MonoBehaviour, IPointerEnterHandler, IPointerExitHandler {

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
				UI_Inventory.SubText_Show(_gridIndex, "npc_Pauline" + (GLOBAL.Player.progress["isMale"].b ? "_male" : "_female"), globalMousePos, m_DraggingPlane.rotation);
			}

		}

	}

	public void OnPointerEnter(PointerEventData eventData){

		_isMouseOver = true;

	}

	public void OnPointerExit(PointerEventData eventData){
		_isMouseOver = false;
		UI_Inventory.SubText_Hide();
	}

}
