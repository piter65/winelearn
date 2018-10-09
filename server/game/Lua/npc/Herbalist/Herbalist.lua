-- Herbalist
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0				-- where in the conversation you are
local dialogtext = require 'Herbalist\\rnd_herb'

if week == 3 and playernum == 1 then
	dialogtext = require 'Herbalist\\t3p1_l2w1_herbalist'
end

function init()
	OS.logger("Herbalist.lua init\n")

	OS.SetDir("npc//Herbalist//model")
		npchandle = NPC.add("Herbalist","Herbalist.bws")
	OS.PopDir()

	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Heather Winehart's Herbalist\n",np,112,48)
	
	place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	
	npc_animate(npchandle)
end

function exit()
	OS.logger("Herbalist.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end
