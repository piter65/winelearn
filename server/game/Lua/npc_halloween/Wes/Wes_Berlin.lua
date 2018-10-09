-- Wes_Berlin
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0				-- where in the conversation you are
local dialogtext = require 'Wes_Berlin\\rnd_wesberlin'

if week == 2 and playernum == 1 then
	dialogtext = require 'Wes_Berlin\\t2p1_va_wes'
end

function init()
	OS.logger("Wes_Berlin.lua init\n")

	OS.SetDir("npc//Wes_Berlin//model")
		npchandle = NPC.add("Wes_Berlin","Wes_Berlin.bws")
	OS.PopDir()

	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Wes Berlin\n",np,112,32)
	
	place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	
	npc_animate(npchandle)
end

function exit()
	OS.logger("Wes_Berlin.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end
