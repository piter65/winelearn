-- Fuji_Kiokawa
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0				-- where in the conversation you are
local dialogtext = require 'Fuji_Kiokawa\\rnd_fuji'

if week == 4 and playernum == 4 then
	--dialogtext = require 'Fuji_Kiokawa\\w4p4_l1w_fuji'
end

function init()
	OS.logger("Fuji_Kiokawa.lua init\n")

	OS.SetDir("npc//Fuji_Kiokawa//model")
		npchandle = NPC.add("Fuji_Kiokawa","Fuji_Kiokawa.bws")
	OS.PopDir()

	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Fuji Hiokawa\n",np,112,32)
	
	place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	
	npc_animate(npchandle)
end

function exit()
	OS.logger("Fuji_Kiokawa.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end
