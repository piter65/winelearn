using UnityEngine;

namespace Assets.Scripts
{
    public class RunIckypedia : MonoBehaviour
    {
        public IckypediaBehaviorScript Script;

        void OnMouseDown()
        {
            Script.OpenIckypedia();
        }

        // Use this for initialization
        void Start()
        {

        }

        // Update is called once per frame
        void Update()
        {

        }
    }
}
