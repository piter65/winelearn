-- Shadey_Sayles
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0				-- where in the conversation you are
local dialogtext = require 'Shadey_Sayles\\rnd_manny'

if week == 3 then
	dialogtext = require 'Shadey_Sayles\\t3_mq_npc3_manny'
end

function init()
	OS.logger("Shadey_Sayles.lua init\n")

	OS.SetDir("npc//Shadey_Sayles//model")
		npchandle = NPC.add("Shadey_Sayles","Shadey_Sayles.bws")
	OS.PopDir()

	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Manny Sayles\n",np,112,32)
	
	place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	
	npc_animate(npchandle)
end

function exit()
	OS.logger("Shadey_Sayles.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end
