
HOW TO USE SPILL DIALOGUE LUA PARSER:

1. Ensure that "Scenes/dialogue_overlay.scene" and "Scenes/dialogue_state.scene" scenes are set to build with your project by going to "File > Build Settings... > Add Current" after opening each of those scenes.
	- This is necessary for loading in those scenes at runtime by other scenes.

2. The LUA scripts are setup to interact with various fields for tracking states. These fields and be accessed and modified in "Scenes/dialogue_state.scene".
	- Select the root node of the scene to view the currently set values for the fields that are currently included for this demo in the Inspector Pane.
	- To add more fields, modify "Scripts/DialogueState.cs".
		- The fields are exposed to the rest of the project via a static dictionary.
	- Ensure that the field dictionary is properly setup, call "DialogueState.Init();" in the "Awake()" function for whatever Monobehaviour might want to use the dictionary.
		- An example of this can be scene in "Scripts/DialogueDemo.cs".

3. The demo scene "Scenes/dialogue_demo.scene" is setup with sliders for various dictionary entries that are used by the LUA scripts.
	- Run this scene if you want to see the dialogue parser in action.

4. The "Scenes/dialogue_overlay.scene" scene is a UI Window that can be loaded by other scenes for when you want to display dialogue to a player.
	- The UI Window includes a ScrollRect for the NPC text and 3 text buttons for player responses.
		- If there are fewer than 3 responses available for a dialogue branch, less text buttons are shown.
	- A .lua file must be specified for the dialogue overlay to be able to parse anything.
		- An example how this is accomplished can be seen in "Scripts/npc_tourguide.cs" which is used in "Scenes/dialogue_demo.scene" and triggered in "Scripts/DialogueDemo.cs".
			- "Scripts/npc_tourguide.cs" is intended to be a replacement for the "Lua\npc\Tour_Guide\Tour_Guide.lua" script.
	- The "Scripts/DialogueOverlay.cs" script has functions for loading the specified file as a web request, tokenizing the file into substrings, and parsing the tokens into commands for handling dialogue threads.

5. In order for WebGL to load in files at runtime, we have to use the WWW class and access them via web request.
	- For this purpose, I have placed the "Lua" folder in the root of the project as a sibling of the asset folder.
	- When deploying the project to WebGL, you must ensure that the "LUA" folder is accessible as a sibling to the deployment folder.
		- Additionally, you'll need to set the MIME type of .lua files to "text/plain" on the server so that .lua files can be loaded at all.
	- The pathing to the files is determined by using "Application.dataPath" within a Unity script.
		- An example of this can be seen in "Scripts/npc_tourguide.cs".



WHAT IS CURRENTLY NOT SUPPORTED BY THE PARSER:

- Functions (fun, fun2, fun3)
	- Functions are parsed stored as function entries, just no logic currently interacts with them when navigating dialogues.
- Various State Fields
	- Currently only 'week', 'tourguide', 'touristscore', and 'tourcash' fields are stored.
- Formatted Lua Strings
	- Strings that use formatting such as those presented in the 'ns2' Lua command don't have logic implemented to handle the intended formatting.