-- Q-Tip
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0				-- where in the conversation you are
local dialogtext = require 'Q-tip\\rnd_gmasreg'

if week == 2 and playernum == 1 then
	dialogtext = require 'Q-tip\\t2p1_vc_grandmaster'
end

function init()
	OS.logger("Q-Tip.lua init\n")

	OS.SetDir("npc//Q-Tip//model")
		npchandle = NPC.add("Q-Tip","Q-Tip.bws")
	OS.PopDir()

	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Grandmaster G\n",np,112,32)
	
	place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	
	npc_animate(npchandle)
end

function exit()
	OS.logger("Q-Tip.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end
