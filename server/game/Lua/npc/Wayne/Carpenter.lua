-- Carpenter
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0				-- where in the conversation you are
local dialogtext = require 'Carpenter\\rnd_crpntr'

if week == 3 and playernum == 1 then
	dialogtext = require 'Carpenter\\t3p1_l1w2_wayne'
end

function init()
	OS.logger("Carpenter.lua init\n")

	OS.SetDir("npc//Carpenter//model")
		npchandle = NPC.add("Carpenter","Carpenter.bws")
	OS.PopDir()

	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Wayne Scotting\n",np,112,32)
	
	place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	
	npc_animate(npchandle)
end

function exit()
	OS.logger("Carpenter.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end
