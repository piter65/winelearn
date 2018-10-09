-- DJ_Synapse
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0			-- where in the conversation you are
local dialogtext = require 'DJ_Synapse\\rnd_synapse'

if week == 1 and playernum == 1 then
	dialogtext = require 'DJ_Synapse\\T1P1_vb_gabe'
elseif week == 3 and playernum == 3 then
	dialogtext = require 'DJ_Synapse\\t3p3_vd_gabe'
end

function init()
	OS.logger("DJ_Synapse.lua init\n")

	OS.SetDir("npc//DJ_Synapse//model")
		npchandle = NPC.add("DJ_Synapse","DJ_Synapse.bws")
	OS.PopDir()

	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Gabe Vine\n",np,112,32)
	
	if spawnarrest == 2 and np == 1 then
		spawnarrest = 3
	else
		place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	end
	
	npc_animate(npchandle)
end

function exit()
	OS.logger("DJ_Synapse.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end