-- Count_De_Monet
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0				-- where in the conversation you are
local dialogtext = require 'Count_De_Monet\\rnd_count'

if week == 2 and playernum == 3 then
	dialogtext = require 'Count_De_Monet\\t2p3_expert_count'
end

function init()
	OS.logger("Count_De_Monet.lua init\n")
	OS.SetDir("npc//Count_De_Monet//model")
		npchandle = NPC.add("Count_De_Monet","Count_De_Monet.bws")
	OS.PopDir()
	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Count De Monet\n",np,112,32)
	
	place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	
	npc_animate(npchandle)
end

function exit()
	OS.logger("Count_De_Monet.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end
