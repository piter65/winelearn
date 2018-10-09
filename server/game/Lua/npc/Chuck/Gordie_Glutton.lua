-- Gordie_Glutton
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0				-- where in the conversation you are
local dialogtext = require 'Gordie_Glutton\\rnd_gordie'

if week == 3 and playernum == 4 then
	dialogtext = require 'Gordie_Glutton\\t3p4_l1w1_chuck'
end

function init()
	OS.logger("Gordie_Glutton.lua init\n")

	OS.SetDir("npc//Gordie_Glutton//model")
		npchandle = NPC.add("Gordie_Glutton","Gordie_Glutton.bws")
	OS.PopDir()

	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Chuck Wagner\n",np,112,32)
	
	place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	
	npc_animate(npchandle)
end

function exit()
	OS.logger("Gordie_Glutton.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end
