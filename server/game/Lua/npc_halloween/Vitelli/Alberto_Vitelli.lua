-- Alberto_Vitelli
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0				-- where in the conversation you are
local dialogtext = require 'Alberto_Vitelli\\rnd_alberto'

if week == 3 then
	dialogtext = require 'Alberto_Vitelli\\t3_wp2_vitelli'
end

function init()
	OS.logger("Alberto_Vitelli.lua init\n")

	OS.SetDir("npc//Alberto_Vitelli//model")
		npchandle = NPC.add("Alberto_Vitelli","Alberto_Vitelli.bws")
	OS.PopDir()

	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Alberto Vitelli\n",np,112,32)
	
	place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	
	npc_animate(npchandle)
end

function exit()
	OS.logger("Alberto_Vitelli.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end
