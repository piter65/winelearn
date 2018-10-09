-- Bill_Gastrow
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0				-- where in the conversation you are
local dialogtext = require 'Bill_Gastrow\\rnd_bgastrow'

function init()
	OS.logger("Bill_Gastrow.lua init\n")

	OS.SetDir("npc//Bill_Gastrow//model")
		npchandle = NPC.add("Bill_Gastrow","Bill_Gastrow.bws")
	OS.PopDir()

	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Bill Burells\n",np,112,32)
	
	place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	
	npc_animate(npchandle)
end

function exit()
	OS.logger("Bill_Gastrow.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end
