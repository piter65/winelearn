-- Ivan_Stranglovich
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0				-- where in the conversation you are
local dialogtext = require 'Ivan_Stranglovich\\rnd_ivan'

if week == 4 and playernum == 2 then
	--dialogtext = require 'Ivan_Stranglovich\\w4p2_l1r_ivan'
end

function init()
	OS.logger("Ivan_Stranglovich.lua init\n")

	OS.SetDir("npc//Ivan_Stranglovich//model")
		npchandle = NPC.add("Ivan_Stranglovich","Ivan_Stranglovich.bws")
	OS.PopDir()

	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Emil Dewey\n",np,112,32)
	
	place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	
	npc_animate(npchandle)
end

function exit()
	OS.logger("Ivan_Stranglovich.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end
