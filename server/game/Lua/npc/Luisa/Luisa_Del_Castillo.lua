-- Luisa_Del_Castillo
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0				-- where in the conversation you are
local dialogtext = require 'Luisa_Del_Castillo\\rnd_luisa'

if week == 3 and playernum == 1 then
	dialogtext = require 'Luisa_Del_Castillo\\t3p1_l1w1_luisa'
end

function init()
	OS.logger("Luisa_Del_Castillo.lua init\n")

	OS.SetDir("npc//Luisa_Del_Castillo//model")
		npchandle = NPC.add("Luisa_Del_Castillo","Luisa_Del_Castillo.bws")
	OS.PopDir()

	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Luisa Del Castillo\n",np,112,32)
	
	place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	
	npc_animate(npchandle)
end

function exit()
	OS.logger("Luisa_Del_Castillo.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end
