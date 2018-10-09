-- Gil_Fermin
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0				-- where in the conversation you are
local dialogtext = require 'Gil_Fermin\\rnd_gil'

if week == 1 and playernum == 2 then
	dialogtext = require 'Gil_Fermin\\v1_fermin'
elseif week == 3 and playernum == 4 then
	dialogtext = require 'Gil_Fermin\\t3p4_vb_gil'
end

function init()
	OS.logger("Gil_Fermin.lua init\n")

	OS.SetDir("npc//Gil_Fermin//model")
		npchandle = NPC.add("Gil_Fermin","Gil_Fermin.bws")
	OS.PopDir()

	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Gil Fermin\n",np,112,32)
	
	if spawnarrest == 2 and np == 1 then
			spawnarrest = 3
	else
		place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	end
	
	npc_animate(npchandle)
end

function exit()
	OS.logger("Gil_Fermin.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end
