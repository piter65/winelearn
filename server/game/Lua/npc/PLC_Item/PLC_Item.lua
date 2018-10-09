local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0				-- where in the conversation you are
local dialogtext = require 'PLC_Item\\t1_trap'

if week == 1 then
	dialogtext = require 'PLC_Item\\t1_trap'
elseif week == 2 then
	dialogtext = require 'PLC_Item\\t2_trap'
end

function init()
	OS.logger("PLC_Item.lua init\n")

	OS.SetDir("npc//PLC_Item//model")
		npchandle = NPC.add("PLC_Item","PLC_Item.bws")
	OS.PopDir()

	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Package\n",np,112,32)
	
	place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	
	npc_animate(npchandle)
end

function exit()
	OS.logger("PLC_Item.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end
