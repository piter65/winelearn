-- Willie_Trucks
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0			-- where in the conversation you are
local dialogtext = require 'Willie_Trucks\\rnd_willie'

if week == 1 and playernum == 4 then
	dialogtext = require 'Willie_Trucks\\w1p4_vd_skeeter_mcbragg'
elseif week == 3 and playernum == 2 then
	dialogtext = require 'Willie_Trucks\\t3p2_vc_skeeter'
end

function init()
	OS.logger("Willie_Trucks.lua init\n")

	OS.SetDir("npc//Willie_Trucks//model")
		npchandle = NPC.add("Willie_Trucks","Willie_Trucks.bws")
	OS.PopDir()

	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Skeeter McBragg\n",np,112,32)
	
	if spawnarrest == 2 and np == 1 then
			spawnarrest = 3
	else
		place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	end
	
	npc_animate(npchandle)
end

function exit()
	OS.logger("Willie_Trucks.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end