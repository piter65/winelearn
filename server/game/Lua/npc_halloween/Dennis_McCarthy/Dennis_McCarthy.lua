-- Dennis_McCarthy
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0				-- where in the conversation you are
local dialogtext = require 'Dennis_McCarthy\\rnd_dennis'

if week == 1 and playernum == 2 then
	dialogtext = require 'Dennis_McCarthy\\E1_mccarthy'
elseif week == 4 and playernum == 3 then
	--dialogtext = require 'Dennis_McCarthy\\w4p3_l2w_dennis'
end

function init()
	OS.logger("Dennis_McCarthy.lua init\n")

	OS.SetDir("npc//Dennis_McCarthy//model")
		npchandle = NPC.add("Dennis_McCarthy","Dennis_McCarthy.bws")
	OS.PopDir()

	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Dennis McCarthy\n",np,112,32)
	
	place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	
	npc_animate(npchandle)
end

function exit()
	OS.logger("Dennis_McCarthy.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end
