﻿using UnityEngine;
using UnityEngine.UI;
using UnityEngine.EventSystems;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;

/// <summary>
/// behavior to do horrible hack to input field, will force input field
/// to expand by resizing the background image to the unbounded rect of
/// it's full text
/// </summary>
/// 
public class ExpandingInputField : UIBehaviour
{
	public RectTransform expand_target;
	InputField inf;
	private Regex colorTags = new Regex("<[^>]*>");
	private Regex keyWords = new Regex("and |assert |break |class |continue |def |del |elif |else |except |exec |finally |for |from |global |if |import |in |is |lambda |not |or |pass |print |raise |return |try |while |yield |None |True |False ");
	private Regex operators = new Regex("<=|>=|!=");
	public Regex definedTriggers { get; set; }
	private float min_height;

	protected override void Start()
	{
		inf = this.gameObject.GetComponent<InputField>();
		inf.onValueChange.AddListener(new UnityEngine.Events.UnityAction<string>(ResizeInput));
		inf.onEndEdit.AddListener(new UnityEngine.Events.UnityAction<string>(highlight));
		inf.onValueChange.AddListener(new UnityEngine.Events.UnityAction<string>(removeTags));

		min_height = inf.GetComponent<RectTransform>().rect.height;
	}


	public void highlight(string text)
	{

		inf.text = colorTags.Replace(inf.text, @"");
		inf.text = keyWords.Replace(inf.text, @"<color=blue>$&</color>");
		inf.text = operators.Replace(inf.text, @"<color=red>$&</color>");
		if (definedTriggers != null)
		{
			inf.text = definedTriggers.Replace(inf.text, @"<color=green>$&</color>");
		}
		inf.MoveTextEnd(false);
	}

	private void removeTags(string text)
	{

		inf.text = colorTags.Replace(inf.text, @"");

	}

	void ResizeInput(string text)
	{

		Debug.Log("some kind of resizing horror");
		var fullText = inf.text;

		Vector2 extents = inf.textComponent.rectTransform.rect.size;
		var settings = inf.textComponent.GetGenerationSettings(extents);
		settings.generateOutOfBounds = false;
		var prefheight = new TextGenerator().GetPreferredHeight(fullText, settings) + 10;
		// var prefheight = new TextGenerator().GetPreferredHeight(fullText, settings);

		prefheight = Mathf.Max(prefheight, min_height);

		if (prefheight > inf.textComponent.rectTransform.rect.height - 10)
		// if (prefheight > inf.textComponent.rectTransform.rect.height)
		{
			Debug.Log("i grew because the inputfield was only this big" + inf.GetComponent<RectTransform>().rect.height + "and I needed" + prefheight + "space");
			// expand_target.GetComponent<LayoutElement>().preferredHeight = prefheight;
			Vector2 pref_size = expand_target.sizeDelta;
			pref_size.y = prefheight;
			expand_target.sizeDelta = pref_size;
		}
		else if (prefheight < inf.textComponent.rectTransform.rect.height + 10)
		// else if (prefheight < inf.textComponent.rectTransform.rect.height)
		{
			Debug.Log("i shrank because the inputfield was this big" + inf.GetComponent<RectTransform>().rect.height + "and I needed" + prefheight + "space");
			// expand_target.GetComponent<LayoutElement>().preferredHeight = prefheight;
			Vector2 pref_size = expand_target.sizeDelta;
			pref_size.y = prefheight;
			expand_target.sizeDelta = pref_size;
		}

	}

}
