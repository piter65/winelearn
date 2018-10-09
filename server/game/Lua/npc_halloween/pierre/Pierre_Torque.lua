-- Pierre_Torque
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0				-- where in the conversation you are
local dialogtext = require 'Pierre_Torque\\rnd_pierre'

if week == 2 then
	dialogtext = require 'Pierre_Torque\\edt_serge'
elseif week == 3 then
	dialogtext = require 'Pierre_Torque\\t3_mq_npc5_serge'
end

function init()
	OS.logger("Pierre_Torque.lua init\n")

	OS.SetDir("npc//Pierre_Torque//model")
		npchandle = NPC.add("Pierre_Torque","Pierre_Torque.bws")
	OS.PopDir()

	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Serge Toulouse\n",np,112,32)
	
	if trapper == 1 then
		if shorttrap == 1 and week == 2 then
			np = 1
			shorttrap = 0
			trapper = 0
		end
	end

	place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	
	npc_animate(npchandle)
end

function exit()
	OS.logger("Pierre_Torque.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end
