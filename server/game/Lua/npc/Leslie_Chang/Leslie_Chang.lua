-- Leslie_Chang
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0				-- where in the conversation you are
local dialogtext = require 'Leslie_Chang\\rnd_chang'

if week == 1 then
	dialogtext = require 'Leslie_Chang\\funq_npc3_leslie'
end

function init()
	OS.logger("Leslie_Chang.lua init\n")
	OS.SetDir("npc//Leslie_Chang//model")
		npchandle = NPC.add("Leslie_Chang","Leslie_Chang.bws")
	OS.PopDir()
	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Leslie Chang\n",np,112,32)
	
	place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	
	npc_animate(npchandle)
end

function exit()
	OS.logger("Leslie_Chang.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end