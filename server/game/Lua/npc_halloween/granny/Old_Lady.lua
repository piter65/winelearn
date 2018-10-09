-- Old_Lady
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0				-- where in the conversation you are
local dialogtext = require 'Old_Lady\\rnd_granny'

if week == 2 then
	dialogtext = require 'Old_Lady\\t2_equ_npc4_granny'
elseif week == 3 and playernum == 3 then
	dialogtext = require 'Old_Lady\\t3p3_l1w2_granny'
end

function init()
	OS.logger("Old_Lady.lua init\n")

	OS.SetDir("npc//Old_Lady//model")
		npchandle = NPC.add("Old_Lady","Old_Lady.bws")
	OS.PopDir()

	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Granny Smith\n",np,112,32)
	
	place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	
	npc_animate(npchandle)
end

function exit()
	OS.logger("Old_Lady.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end
