using System;
using UnityEngine;
using UnityStandardAssets.CrossPlatformInput;
using UnityStandardAssets.Characters.ThirdPerson;

[RequireComponent(typeof(ThirdPersonCharacter))]
public class PlayerInputControl : MonoBehaviour
{
	public float stopping_delay = 0.8f;

	private ThirdPersonCharacter m_Character; // A reference to the ThirdPersonCharacter on the object
	private Transform m_Cam;                  // A reference to the main camera in the scenes transform
	private Vector3 m_CamForward;             // The current forward direction of the camera
	private Vector3 m_Move;
	private bool m_Jump;                      // the world-relative desired move direction, calculated from the camForward and user input.

	private float _time_since_debug_run = 0.0f;
	private float _debug_override_h = 0.0f;
	private float _debug_override_v = 0.0f;

	private float _stopping_duration;
	
	private void Start()
	{
		// get the transform of the main camera
		if (Camera.main != null)
		{
			m_Cam = Camera.main.transform;
		}
		else
		{
			Debug.LogWarning(
				"Warning: no main camera found. Third person character needs a Camera tagged \"MainCamera\", for camera-relative controls.");
			// we use self-relative controls in this case, which probably isn't what the user wants, but hey, we warned them!
		}

		// get the third person character ( this should never be null due to require component )
		m_Character = GetComponent<ThirdPersonCharacter>();

		_stopping_duration = stopping_delay;
	}


	private void Update()
	{
		if (GLOBAL_old.HotkeysEnabled)
		{
			if (!m_Jump)
			{
				m_Jump = CrossPlatformInputManager.GetButtonDown("Jump");
			}
		}
	}


	// Fixed update is called in sync with physics
	private void FixedUpdate()
	{
		// Don't allow player movement while dialogue is open.
		if (   !DialogueOverlay.is_open
			&& GLOBAL_old.HotkeysEnabled)
		{
			_stopping_duration = stopping_delay;

			// read inputs
			float h = CrossPlatformInputManager.GetAxis("Horizontal");
			float v = CrossPlatformInputManager.GetAxis("Vertical");
			//bool crouch = Input.GetKey(KeyCode.C);

			// Auto mate walking if we're flagged for debug run.
			if (GLOBAL_old.debug_run)
			{
				// Jump cancels debug run as a fail safe.
				if (m_Jump)
				{
					GLOBAL_old.debug_run = false;
				}
				else
				{
					_time_since_debug_run += Time.deltaTime;

					// Only try to override the input once every second.
					if (_time_since_debug_run >= 1.5f)
					{
						_time_since_debug_run -= 1.5f;
						_debug_override_v = 0.0f;
						_debug_override_h = 0.0f;

						int random = UnityEngine.Random.Range(0,100);

						if (random < 30) 
						{
							_debug_override_h = 1.0f;
						}
						else if (random >= 70)
						{
							_debug_override_h = -1.0f;
						}


						random = UnityEngine.Random.Range(0,100);
						if (random < 30) 
						{
							_debug_override_v = 1.0f;
						}
						else if (random >= 70)
						{
							_debug_override_v = -1.0f;
						}
					}

					h = _debug_override_h;
					v = _debug_override_v;

// Once in a while, switch up rooms...
					int random2 = UnityEngine.Random.Range(0,100);
					if (random2<2)
					{
						GLOBAL_old.debug_room=true;
					}



				}
			}

			// Zero all movement if jumping.
			if (m_Jump)
			{
				h = 0.0f;
				v = 0.0f;
				_debug_override_h = 0.0f;
				_debug_override_v = 0.0f;
			}


			// calculate move direction to pass to character
			if (m_Cam != null)
			{
				// calculate camera relative direction to move:
				m_CamForward = Vector3.Scale(m_Cam.forward, new Vector3(1, 0, 1)).normalized;
				m_Move = v*m_CamForward + h*m_Cam.right;
			}
			else
			{
				// we use world-relative directions in the case of no main camera
				m_Move = v*Vector3.forward + h*Vector3.right;
			}

			//Debug.Log("m_Move: " + m_Move);

			// If the player has recieved input, reset the idle timer. 
			if (   m_Jump
				|| m_Move.sqrMagnitude > 0.0f)
			{
				GLOBAL_old.ResetIdleTimer();
			}

			// pass all parameters to the character control script
			//m_Character.Move(m_Move, crouch, m_Jump);
			m_Character.Move(m_Move, false, m_Jump);
			m_Jump = false;
		}
		// Slow down the player when input is disabled so they don't jerk to a stop.
		else
		{
			_stopping_duration = Mathf.Max(_stopping_duration - Time.fixedDeltaTime, 0.0f);
			float move_interp = _stopping_duration / stopping_delay;

			// Direct the movement toward the npc.
			Vector3 new_move = m_Move;
			if (DialogueOverlay.character != null)
			{
				Vector3 npc_direction = DialogueOverlay.character.transform.position - transform.position;
				npc_direction.Normalize();

				// BChance: The 'move_interp / 2.0f' is to cause the player to turn faster than the slow down.
				new_move = Vector3.Slerp(npc_direction * m_Move.magnitude, m_Move, move_interp / 2.0f);
			}

			// Zero out player movement over the stopping delay.
			m_Character.Move(new_move * move_interp, false, false);
		}
	}
}
