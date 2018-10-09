-- Cedric_Maxwell
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0				-- where in the conversation you are
local dialogtext = require 'Cedric_Maxwell\\rnd_cedric'

if week == 2 and playernum == 2 then
	dialogtext = require 'Cedric_Maxwell\\t2p2_vb_cedric'
end

function init()
	OS.logger("Cedric_Maxwell.lua init\n")

	OS.SetDir("npc//Cedric_Maxwell//model")
		npchandle = NPC.add("Cedric_Maxwell","Cedric_Maxwell.bws")
	OS.PopDir()

	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Cedric Maxwell\n",np,112,32)
	
	place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	
	npc_animate(npchandle)
end

function exit()
	OS.logger("Cedric_Maxwell.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end
