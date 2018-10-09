using UnityEngine;
using System.Collections;

public class RenderSetup : MonoBehaviour
{
	public Color ambient_color = new Color(0.65f, 0.65f, 0.65f, 1.0f);

	void Awake()
	{
		
	}

	void Start()
	{
		RenderSettings.ambientLight = ambient_color;
	}
	
	void Update()
	{
	
	}
}
