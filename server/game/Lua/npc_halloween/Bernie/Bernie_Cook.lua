-- Bernie_Cook
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0				-- where in the conversation you are
local dialogtext = require 'Bernie_Cook\\rnd_bernie'

if week == 3 and playernum == 1 then
	--dialogtext = require 'Bernie_Cook\\t3p1_l1r_bernice'
end

function init()
	OS.logger("Bernie_Cook.lua init\n")
	OS.SetDir("npc//Bernie_Cook//model")
		npchandle = NPC.add("Bernie_Cook","Bernie_Cook.bws")
	OS.PopDir()
	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Bernard \"Bernie\" Cook\n",np,112,32)
	
	place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	
	npc_animate(npchandle)
end

function exit()
	OS.logger("Bernie_Cook.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end
