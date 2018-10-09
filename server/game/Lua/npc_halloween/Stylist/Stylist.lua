-- Stylist
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0				-- where in the conversation you are
local dialogtext = require 'Stylist\\rnd_stylist'

if week == 4 and playernum == 4 then
	--dialogtext = require 'Stylist\\w4p4_l2w_stylist'
end

function init()
	OS.logger("Stylist.lua init\n")

	OS.SetDir("npc//Stylist//model")
		npchandle = NPC.add("Stylist","Stylist.bws")
	OS.PopDir()

	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Heather Winehart's Stylist\n",np,112,48)
	
	place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	
	npc_animate(npchandle)
end

function exit()
	OS.logger("Stylist.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end
