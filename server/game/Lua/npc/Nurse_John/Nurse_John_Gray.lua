-- Nurse_John_Gray
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0				-- where in the conversation you are
local dialogtext = require 'Nurse_John_Gray\\rnd_nursej'

if week == 1 and playernum == 2 then
	dialogtext = require 'Nurse_John_Gray\\v2_gray'
elseif week == 3 and playernum == 4 then
	dialogtext = require 'Nurse_John_Gray\\t3p4_vd_john_gray'
end

function init()
	OS.logger("Nurse_John_Gray.lua init\n")

	OS.SetDir("npc//Nurse_John_Gray//model")
		npchandle = NPC.add("Nurse_John_Gray","Nurse_John_Gray.bws")
	OS.PopDir()

	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Nurse John Gray\n",np,112,32)
	
	if spawnarrest == 2 and np == 1 then
			spawnarrest = 3
	else
		place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	end
	
	npc_animate(npchandle)
end

function exit()
	OS.logger("Nurse_John_Gray.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end
