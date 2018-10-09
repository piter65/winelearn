-- Roseanne_Bellagiorno
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0			-- where in the conversation you are
local dialogtext = require 'Roseanne_Bellagiorno\\rnd_roseanne'

if week == 3 and playernum == 2 then
	dialogtext = require 'Roseanne_Bellagiorno\\t3p2_l1w1_roseanne'
end

function init()
	OS.logger("Roseanne_Bellagiorno.lua init\n")

	OS.SetDir("npc//Roseanne_Bellagiorno//model")
		npchandle = NPC.add("Roseanne_Bellagiorno","Roseanne_Bellagiorno.bws")
	OS.PopDir()

	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Roseanne Bellagiorno\n",np,112,32)
	
	place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	
	npc_animate(npchandle)
end

function exit()
	OS.logger("Roseanne_Bellagiorno.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end