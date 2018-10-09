using UnityEngine;
using System.Collections;

public class PlayerController : MonoBehaviour
{
	public int charaterIndex = 0;
	public Transform[] characterModels;
	public Avatar[] characterAvatars;

	private Animator _animator;
	private Transform _characterModel;

	// Use this for initialization
	void Start()
	{
		_characterModel = Instantiate(characterModels[charaterIndex]);
		_characterModel.transform.parent = transform;
		_characterModel.transform.localPosition = Vector3.zero;
		_characterModel.transform.localRotation = Quaternion.identity;

		_animator = GetComponent<Animator>();
		_animator.avatar = characterAvatars[charaterIndex];
	}
	
	// Update is called once per frame
	void Update()
	{
	
	}
}
