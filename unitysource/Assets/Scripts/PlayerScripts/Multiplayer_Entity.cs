using UnityEngine;
using System;
using System.Collections;
using UnityStandardAssets.Characters.ThirdPerson;
using UnityEngine.SceneManagement;

public class Multiplayer_Entity : MonoBehaviour
{
	public GameObject MaleCharacter;
	public GameObject FemaleCharacter;
	public Avatar MaleAvatar;
	public Avatar FemaleAvatar;
	public GameObject[] MaleHairModels = new GameObject[1];
	public GameObject[] FemaleHairModels = new GameObject[1];
	public GameObject[] MaleBodyModels = new GameObject[1];
	public GameObject[] FemaleBodyModels = new GameObject[1];
	public Color[] SkinColors = new Color[1];
	public Color[] HairColors = new Color[1];

	public string username;

	public bool isProxy = true;
	public bool allowInput = true;

	public Vector3 proxy_TargetPosition;
	public Quaternion proxy_TargetRotation = Quaternion.identity;
	public Vector3 proxy_PrevPosition;
	public Quaternion proxy_PrevRotation = Quaternion.identity;

	public float timeSinceLastProxyUpdate = 0.0f;

	public bool isMale = true;
	public int index_BodyModel = 0;
	public int index_HairModel = 0;
	public int index_SkinColor = 0;
	public int index_HairColor = 0;

	// private Rigidbody _rigidbody;

	private float _fTimeSinceLastUpdate = 0.0f;
	private bool _bDestroying = false;
	private Animator _animator;
	private CharacterType _character_type;
	private ThirdPersonCharacter _ThirdPersonCharacter;
	private bool _outside = false;

    private float pfloat = 0.0f;
    private int pintx = 0;   // peters int
    private int pinty = 0;   // peters int
    private int pintz = 0;   // peters int

    private string tempstr="012345";

	void Awake()
	{
		// BChance: (2016-01-07) - Ensure GLOBALs are setup.
		GLOBAL.Init();

		_animator = GetComponent<Animator>();
		_character_type = GetComponent<CharacterType>();
		//_animator.applyRootMotion = true;

		//proxy_TargetPosition = new Vector3(-5.0f, 0.0f, -5.0f);
	}

	// Use this for initialization
	void Start()
	{
		// Determine if the player is outside.
		_outside = SceneManager.GetActiveScene().name == "Outside";

		if (GLOBAL.Player != null)
		{
			// Set this as the current player.
			if (!isProxy)
			{
				if (Multiplayer_ProxyController.Instance != null)
					Multiplayer_ProxyController.Instance.currentPlayer = this;

				// Retrieve the player's settings.
				username = GLOBAL.Player.username;
				isMale = GLOBAL.Player.progress["isMale"].b;
				index_BodyModel = GLOBAL.Player.progress["index_BodyModel"].i;
				index_HairModel = GLOBAL.Player.progress["index_HairModel"].i;
				index_SkinColor = GLOBAL.Player.progress["index_SkinColor"].i;
				index_HairColor = GLOBAL.Player.progress["index_HairColor"].i;

				Debug.Log(string.Format
				(
					"Start() - isMale: {0}, index_BodyModel: {1}, index_HairModel: {2}, index_SkinColor: {3}, index_HairColor: {4}",
					isMale,
					index_BodyModel,
					index_HairModel,
					index_SkinColor,
					index_HairColor
				));

				GetComponent<Rigidbody>().useGravity = true;
				GetComponent<Collider>().isTrigger = false;

				// Let the everyone know of the current player entity.
				GLOBAL.player_entity = this;

				// Try to spawn the player on the spawn target.
				if (!String.IsNullOrEmpty(GLOBAL.target_spawn))
				{
					// If we find an object with the target spawn name, copy its position and rotation.
					GameObject obj_spawn = GameObject.Find(GLOBAL.target_spawn);
					if (obj_spawn != null)
					{
						transform.position = obj_spawn.transform.position;
						//transform.rotation = obj_spawn.transform.localRotation;
					}
					else
					{
						Debug.LogError(String.Format("Could not find spawn target '{0}'.", GLOBAL.target_spawn));
					}
				}
			}
			else
			{
				// Disable the animation scripts for proxies.
				GetComponent<PlayerInputControl>().enabled = false;

				// Disable the Audio components for proxies.
				if(GetComponent<AudioSource>() != null)
					GetComponent<AudioSource>().enabled = false;
				if(GetComponent<AudioListener>() != null)
					GetComponent<AudioListener>().enabled = false;

				// Disable the quick travel script for proxies.
				if (GetComponent<QuickTravel>() != null)
					GetComponent<QuickTravel>().enabled = false;

				GetComponent<Rigidbody>().useGravity = false;
				GetComponent<Collider>().isTrigger = true;
			}

			_ThirdPersonCharacter = GetComponent<ThirdPersonCharacter>();

			ApplyPlayerModel();

			// _rigidbody = GetComponent<Rigidbody>();
		}
	}
	
	void FixedUpdate()
	{
		if (!_bDestroying)
		{
			_fTimeSinceLastUpdate += Time.fixedDeltaTime;
			timeSinceLastProxyUpdate += Time.fixedDeltaTime;

			if (!isProxy)
			{
				if (allowInput)
				{
					// Keep the player data positioning up to date.
					if (GLOBAL.Player != null)
					{
						GLOBAL.Player.position = transform.position;
						GLOBAL.Player.rotation = transform.rotation;
					}

					if (_fTimeSinceLastUpdate >= 1.0f / CONFIG.MULTIPLAYER_UPDATES_PER_SECOND)
					{
						_fTimeSinceLastUpdate = 0.0f;

						// Send the player data to the server.
						JSONObject objJSON_PlayerData = new JSONObject();
//						objJSON_PlayerData.AddField("ONLYME", 0);

						if (_outside)
						{
							// Only outside players should be connected to the multiplayer server.
							objJSON_PlayerData.AddField("connected", true);

							// BChance: Convert the float to an int with 3 decimal points of precision.
							int pos_x = (int)Mathf.Round(_ThirdPersonCharacter.m_EffectivePosition.x * 1000.0f);
							objJSON_PlayerData.AddField("x", pos_x);
							int pos_y = (int)Mathf.Round(_ThirdPersonCharacter.m_EffectivePosition.y * 1000.0f);
							objJSON_PlayerData.AddField("y", pos_y);
							int pos_z = (int)Mathf.Round(_ThirdPersonCharacter.m_EffectivePosition.z * 1000.0f);
							objJSON_PlayerData.AddField("z", pos_z);

							objJSON_PlayerData.AddField("yaw", (int)transform.rotation.eulerAngles.y);
							objJSON_PlayerData.AddField("boy", isMale);
	//						objJSON_PlayerData.AddField("index_BodyModel", index_BodyModel);
				// Peter playing with decreasing size.....			
							objJSON_PlayerData.AddField("i_BM", index_BodyModel);   // was BodyModel 

	// Peter was here
	//						objJSON_PlayerData.AddField("index_HairModel", index_HairModel);
							objJSON_PlayerData.AddField("i_HM", index_HairModel);
		
							objJSON_PlayerData.AddField("i_SC", index_SkinColor);
							objJSON_PlayerData.AddField("i_HC", index_HairColor);
						}
						else
						{
							// Only outside players should be connected to the multiplayer server.
							objJSON_PlayerData.AddField("connected", false);
						}



						StartCoroutine(Web_SendData(objJSON_PlayerData.ToString()));
					}
				}
			}
			else
			{
				if (Multiplayer_ProxyController.Instance != null)
				{
					// If the proxy's life is up, kill it.
					if (timeSinceLastProxyUpdate >= Multiplayer_ProxyController.Instance.ProxyTimeout)
					{
						Multiplayer_ProxyController.Instance.KillProxy(username);
					}
				}

				Vector3 move = proxy_TargetPosition - transform.position;

				//Debug.Log("move: " + move);

				if (move.magnitude > 0.01f)
				{
					if (move.magnitude < 5.0f)
					{
						_ThirdPersonCharacter.Move(move, false, false);
					}
					else
					{
						transform.position = proxy_TargetPosition;
					}
				}
				else
				{
					transform.position = proxy_TargetPosition;
				}

				//float fInterp = 1.0f / CONFIG.MULTIPLAYER_UPDATES_PER_SECOND * timeSinceLastProxyUpdate;
				//transform.position = Vector3.Lerp(proxy_PrevPosition, proxy_TargetPosition, fInterp);
				//transform.rotation = Quaternion.Slerp(proxy_PrevRotation, proxy_TargetRotation, fInterp);
			}
		}
	}

	public void ApplyPlayerModel()
	{
		Debug.Log(string.Format
		(
			"ApplyPlayerModel() - isMale: {0}, index_BodyModel: {1}, index_HairModel: {2}, index_SkinColor: {3}, index_HairColor: {4}",
			isMale,
			index_BodyModel,
			index_HairModel,
			index_SkinColor,
			index_HairColor
		));

		GameObject[] body_models;
		GameObject[] hair_models;

		// Enable the select body type based on the player's settings.
		if (isMale)
		{
			// Make the male character visible.
			MaleCharacter.SetActive(true);
			FemaleCharacter.SetActive(false);

			_character_type.type = CharacterTypeEnum.generic_male;

			body_models = MaleBodyModels;
			hair_models = MaleHairModels;

			_animator.avatar = MaleAvatar;
		}
		else
		{
			// Make the female character visible.
			MaleCharacter.SetActive(false);
			FemaleCharacter.SetActive(true);
			
			_character_type.type = CharacterTypeEnum.generic_female;

			body_models = FemaleBodyModels;
			hair_models = FemaleHairModels;

			_animator.avatar = FemaleAvatar;
		}

		// Ensure that the animator is setup for the current character type.
		_character_type.UpdateAnimator();

		// If the index above range, keep decrementing until the index is within range.
		while (index_BodyModel >= body_models.Length)
		{
			index_BodyModel -= body_models.Length;
		}
		// If the index below range, keep incrementing until the index is within range.
		while (index_BodyModel < 0)
		{
			index_BodyModel += body_models.Length;
		}
		// If the index above range, keep decrementing until the index is within range.
		while (index_HairModel >= hair_models.Length)
		{
			index_HairModel -= hair_models.Length;
		}
		// If the index below range, keep incrementing until the index is within range.
		while (index_HairModel < 0)
		{
			index_HairModel += hair_models.Length;
		}
		// If the index above range, keep decrementing until the index is within range.
		while (index_SkinColor >= SkinColors.Length)
		{
			index_SkinColor -= SkinColors.Length;
		}
		// If the index below range, keep incrementing until the index is within range.
		while (index_SkinColor < 0)
		{
			index_SkinColor += SkinColors.Length;
		}
		// If the index above range, keep decrementing until the index is within range.
		while (index_HairColor >= HairColors.Length)
		{
			index_HairColor -= HairColors.Length;
		}
		// If the index below range, keep incrementing until the index is within range.
		while (index_HairColor < 0)
		{
			index_HairColor += HairColors.Length;
		}

		// Loop thru and only enable the body model we have selected.
		for (int index = 0; index < body_models.Length; ++index)
		{
			body_models[index].SetActive(index == index_BodyModel);
		}

		// Loop thru and only enable the hair model we have selected.
		for (int index = 0; index < hair_models.Length; ++index)
		{
			hair_models[index].SetActive(index == index_HairModel);
		}

		// Attempt to find the body model's skin material and then set it's color.
		Transform skin_model = null;
		foreach (Transform child in body_models[index_BodyModel].transform)
		{
			if (child.name.Contains("body"))
			{
				skin_model = child;
				break;
			}
		}
		if (skin_model != null)
		{
			//Debug.Log("'skin_model' found.");

			SkinnedMeshRenderer skin_renderer = skin_model.GetComponent<SkinnedMeshRenderer>();
			if (skin_renderer != null)
			{
				//Debug.Log("'skin_renderer' found.");
			
				skin_renderer.material.color = SkinColors[index_SkinColor];
			}
		}

		// Attempt to find the hair model's material and then set it's color.
		SkinnedMeshRenderer hair_renderer = hair_models[index_HairModel].GetComponent<SkinnedMeshRenderer>();
		if (hair_renderer != null)
		{
			//Debug.Log("'hair_renderer' found.");
			
			hair_renderer.material.color = HairColors[index_HairColor];
		}
	}

	void OnDestroy()
	{
		if (!isProxy)
		{
			_bDestroying = true;

			if (Multiplayer_ProxyController.Instance != null)
			{
				// Send the player data to the server.
				JSONObject objJSON_PlayerData = new JSONObject();

				// Notify the server that the player has disconnected.
				objJSON_PlayerData.AddField("connected", false);

				// BChance: Convert the float to an int with 3 decimal points of precision.
				int pos_x = (int)Mathf.Round(_ThirdPersonCharacter.m_EffectivePosition.x * 1000.0f);
				objJSON_PlayerData.AddField("x", pos_x);
				int pos_y = (int)Mathf.Round(_ThirdPersonCharacter.m_EffectivePosition.x * 1000.0f);
				objJSON_PlayerData.AddField("y", pos_y);
				int pos_z = (int)Mathf.Round(_ThirdPersonCharacter.m_EffectivePosition.x * 1000.0f);
				objJSON_PlayerData.AddField("z", pos_z);
				objJSON_PlayerData.AddField("yaw", (int)transform.rotation.eulerAngles.y);

				// Send the data without yielding.
				Web_SendData(objJSON_PlayerData.ToString(), false);
			}
		}
	}

	private IEnumerator Web_SendData(string strPlayerData, bool bYield = true)
	{
		// Only send the server the avatar data if the player isn't idle.
		if (!GLOBAL.IsPlayerIdle)
		{
			// Only send the server the avatar data if there's something in scene that can use it.
			// if (Multiplayer_ProxyController.Instance != null)
			// {
				string strUrl = GLOBAL.GetUrl_Multiplayer("set_player_data.php");

				// Debug.Log("send");
				// Debug.Log(strPlayerData);

				WWWForm wwwForm = new WWWForm();
				wwwForm.AddField("player_data", strPlayerData);
				wwwForm.AddField("key", GLOBAL.Player.username);
				wwwForm.AddField("group", GLOBAL.Player.group);

				// Debug.Log("-- Set to Send Message. --");

				WWW www = new WWW(strUrl, wwwForm);

				if (bYield)
				{
					yield return www;
				}

				// Debug.Log("-- Web Result Received. --");

				string strResult = www.text;

				// Debug.Log(strResult);

				JSONObject objJSON = new JSONObject(strResult);

				if (   objJSON["error"] == null
					|| objJSON["error"].type == JSONObject.Type.NULL)
				{
					// Debug.Log("-- Send Complete. --");
				}
				else
				{
					Debug.Log(objJSON["error"].str);
				}
			// }
		}
		else
		{
			//Debug.Log(string.Format("== PLAYER HAS BEEN IDLE FOR: {0} seconds - Stopped sending data to multiplayer server. ==", GLOBAL.idle_time));
		}
	}
}
