-- Howie_Glicksman
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0				-- where in the conversation you are
local dialogtext = require 'Howie_Glicksman\\rnd_howie'

if week == 2 and playernum == 2 then
	--dialogtext = require 'Howie_Glicksman\\w2p2_va_howie'
end

function init()
	OS.logger("Howie_Glicksman.lua init\n")

	OS.SetDir("npc//Howie_Glicksman//model")
		npchandle = NPC.add("Howie_Glicksman","Howie_Glicksman.bws")
	OS.PopDir()

	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Howie Glicksman\n",np,112,32)
	
	place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	
	npc_animate(npchandle)
end

function exit()
	OS.logger("Howie_Glicksman.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end
