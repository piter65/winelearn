-- Sean_Kwerty
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0				-- where in the conversation you are
local dialogtext = require 'Sean_Kwerty\\rnd_warren'

if week == 3 and playernum == 2 then
	dialogtext = require 'Sean_Kwerty\\t3p2_l2w1_warren'
end

function init()
	OS.logger("Sean_Kwerty.lua init\n")

	OS.SetDir("npc//Sean_Kwerty//model")
		npchandle = NPC.add("Sean_Kwerty","Sean_Kwerty.bws")
	OS.PopDir()

	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Warren Giles\n",np,112,32)
	
	place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	
	npc_animate(npchandle)
end

function exit()
	OS.logger("Sean_Kwerty.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end
