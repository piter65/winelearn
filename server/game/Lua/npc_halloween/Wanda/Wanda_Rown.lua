-- Wanda_Rown
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0				-- where in the conversation you are
local dialogtext = require 'Wanda_Rown\\rnd_wanda'

if week == 2 and playernum == 3 then
	dialogtext = require 'Wanda_Rown\\t2p3_vb_wanda'
end

function init()
	OS.logger("Wanda_Rown.lua init\n")
	OS.SetDir("npc//Wanda_Rown//model")
		npchandle = NPC.add("Wanda_Rown","Wanda_Rown.bws")
	OS.PopDir()
	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Wanda Rown\n",np,112,32)
	
	place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	
	npc_animate(npchandle)
end

function exit()
	OS.logger("Wanda_Rown.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end