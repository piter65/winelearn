-- Tennessee_Ned
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0				-- where in the conversation you are
local dialogtext = require 'Tennessee_Ned\\rnd_tenned'

if week == 3 and playernum == 1 then
	--dialogtext = require 'Tennessee_Ned\\w3p1_vb_tennesse'
end

function init()
	OS.logger("Tennessee_Ned.lua init\n")

	OS.SetDir("npc//Tennessee_Ned//model")
		npchandle = NPC.add("Tennessee_Ned","Tennessee_Ned.bws")
	OS.PopDir()

	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Tennessee Ned\n",np,112,32)
	
	place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	
	npc_animate(npchandle)
end

function exit()
	OS.logger("Tennessee_Ned.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end
