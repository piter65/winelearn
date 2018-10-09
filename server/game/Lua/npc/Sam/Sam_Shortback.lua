-- Sam_Shortback
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0				-- where in the conversation you are
local dialogtext = require 'Sam_Shortback\\rnd_sam'

if week == 2 and playernum == 2 then
	dialogtext = require 'Sam_Shortback\\t2p2_vc_sam'
end

function init()
	OS.logger("Sam_Shortback.lua init\n")

	OS.SetDir("npc//Sam_Shortback//model")
		npchandle = NPC.add("Sam_Shortback","Sam_Shortback.bws")
	OS.PopDir()

	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Sheriff Sam Shortback\n",np,112,32)

	place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	
	npc_animate(npchandle)
end

function exit()
	OS.logger("Sam_Shortback.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end
