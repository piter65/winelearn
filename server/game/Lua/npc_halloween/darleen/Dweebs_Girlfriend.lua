-- Dweeb's_Girlfriend
-- Shawn changed this to remove the ' from the character references
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0				-- where in the conversation you are
local dialogtext = require 'Dweebs_Girlfriend\\rnd_darleen'

if week == 3 and playernum == 4 then
	dialogtext = require 'Dweebs_Girlfriend\\t3p4_l2r_darleen'
end

function init()
	OS.logger("Dweebs_Girlfriend.lua init\n")

	OS.SetDir("npc//Dweebs_Girlfriend//model")
		npchandle = NPC.add("Dweebs_Girlfriend","Dweebs_Girlfriend.bws")
	OS.PopDir()

	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Darleen Diva\n",np,112,32)
	
	place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	
	npc_animate(npchandle)
end

function exit()
	OS.logger("Dweebs_Girlfriend.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end
