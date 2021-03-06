-- Mack_McKinnon
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0			-- where in the conversation you are
local dialogtext = require 'Mack_McKinnon\\rnd_mack'

if week == 1 then
	dialogtext = require 'Mack_McKinnon\\funq_npc1_mckinnon'
end

function init()
	OS.logger("Mack_McKinnon.lua init\n")
	OS.SetDir("npc//Mack_McKinnon//model")
		npchandle = NPC.add("Mack_McKinnon","Mack_McKinnon.bws")
	OS.PopDir()
	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Mack McKinnon\n",np,112,32)
	
	place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	
	npc_animate(npchandle)
end

function exit()
	OS.logger("Mack_McKinnon.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end