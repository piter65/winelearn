using System.Linq;
using Assets.Scripts.CanvasesScripts;
using Assets.Scripts.IckipediaDataScripts;
using UnityEngine;

namespace Assets.Scripts
{
    public class IckypediaBehaviorScript : MonoBehaviour
    {
        public RootCanvas RootFolderCanvas;
        public SecondFolderCanvas SecondFolderCanvas;
        public ThirdFolderCanvas ThirdFolderCanvas;

        private AbstractCanvasBehavior[] _canvasArray = new AbstractCanvasBehavior[3];

        private IckipediaState _innerState = IckipediaState.Off;

        // Use this for initialization
        void Start()
        {
            if (RootFolderCanvas != null)
            {
                _canvasArray[0] = RootFolderCanvas;
                RootFolderCanvas.NameWasPressed += RootFolderCanvas_NameWasPressed;
                RootFolderCanvas.CanvasClosed += RootFolderCanvas_CanvasClosed;
            }
            else
            {
                Debug.LogError("RootFolderCanvas not found");
            }

            if (SecondFolderCanvas != null)
            {
                _canvasArray[1] = SecondFolderCanvas;
                SecondFolderCanvas.ReferenceWasChoosen += SecondFolderCanvas_ReferenceWasChoosen;
                SecondFolderCanvas.CanvasClosed += SecondFolderCanvas_CanvasClosed;
            }
            else
            {
                Debug.LogError("SecondFolderCanvas not found");
            }

            if (ThirdFolderCanvas != null)
            {
                _canvasArray[2] = ThirdFolderCanvas;
                ThirdFolderCanvas.CanvasClosed += ThirdFolderCanvas_CanvasClosed;
            }
            else
            {
                Debug.LogError("ThirdFolderCanvas not found");
            }

            CloseIckypedia();
        }

        private void ThirdFolderCanvas_CanvasClosed(object sender, System.EventArgs e)
        {
            var thirdFolderCanvas = sender as ThirdFolderCanvas;
            if (thirdFolderCanvas != null)
            {
                var refName = thirdFolderCanvas.Reference;
                var val = IckipediaData.IckipediaRootLevel.Values.FirstOrDefault(
                    x => x.Reference.Values.Contains(refName));

                if (val != null)
                {
                    var ickiName = IckipediaData.IckipediaRootLevel.FirstOrDefault(x => x.Value.Equals(val)).Key;

                    RootFolderCanvas_NameWasPressed(ickiName);
                }
                else
                {
                    Debug.LogError(string.Format("Cannot find {0} in ickipedia data" + refName));
                }
            }
            else
            {
                Debug.LogError("System not return thirdFolderCanvas");
            }
        }

        private void SecondFolderCanvas_ReferenceWasChoosen(string reference)
        {
            SetActiveCanvas(ThirdFolderCanvas);
            LoadCanvasData(ThirdFolderCanvas, reference);
        }

        private void SecondFolderCanvas_CanvasClosed(object sender, System.EventArgs e)
        {
            SetActiveCanvas(RootFolderCanvas);
            LoadCanvasData(RootFolderCanvas, string.Empty);
        }

        private void RootFolderCanvas_NameWasPressed(string nameStr)
        {
            SetActiveCanvas(SecondFolderCanvas);
            LoadCanvasData(SecondFolderCanvas, nameStr);
        }

        private void RootFolderCanvas_CanvasClosed(object sender, System.EventArgs e)
        {
            CloseIckypedia();
        }

        // Update is called once per frame
        void Update()
        {

        }

        public void OpenIckypedia()
        {
            if (_innerState == IckipediaState.Off)
            {
                SetActiveCanvas(RootFolderCanvas);
                LoadCanvasData(RootFolderCanvas, string.Empty);
            }
        }

        public void CloseIckypedia()
        {
            SetActiveCanvas(null);
        }

        private void SetActiveCanvas(AbstractCanvasBehavior canvas)
        {

            foreach (var canv in _canvasArray)
            {
                if (canvas != null && canv.Equals(canvas))
                {
                    canv.gameObject.SetActive(true);
                }
                else
                {
                    canv.gameObject.SetActive(false);
                    CleanCanvasData(canv);
                }
            }

            ChangeState(canvas);
        }

        private void ChangeState(AbstractCanvasBehavior canvas)
        {
            _innerState = IckipediaState.Off;

            if (canvas is RootCanvas)
            {
                _innerState = IckipediaState.Root;
            }

            if (canvas is SecondFolderCanvas)
            {
                _innerState = IckipediaState.Second;
            }

            if (canvas is ThirdFolderCanvas)
            {
                _innerState = IckipediaState.Third;
            }

            //print("Current state: " + _innerState);
        }

        private void LoadCanvasData(AbstractCanvasBehavior canvas, string startStr)
        {
            canvas.Load(startStr);
        }

        private void CleanCanvasData(AbstractCanvasBehavior canv)
        {
            canv.Clean();
        }
    }
}
