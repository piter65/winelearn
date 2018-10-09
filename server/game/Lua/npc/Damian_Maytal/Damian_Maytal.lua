-- Damian_Maytal
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0				-- where in the conversation you are
local dialogtext = require 'Damian_Maytal\\rnd_damian'

if week == 1 and playernum == 4 then
	dialogtext = require 'Damian_Maytal\\t1p4_va_nathaniel_wailer'
elseif week == 3 and playernum == 2 then
	dialogtext = require 'Damian_Maytal\\t3p2_vb_nathaniel'
end

function init()
	OS.logger("Damian_Maytal.lua init\n")

	OS.SetDir("npc//Damian_Maytal//model")
		npchandle = NPC.add("Damian_Maytal","Damian_Maytal.bws")
	OS.PopDir()

	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Nathaniel Wailer\n",np,112,32)
	
	if spawnarrest == 2 and np == 1 then
			spawnarrest = 3
	else
		place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	end
	
	npc_animate(npchandle)
end

function exit()
	OS.logger("Damian_Maytal.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end
