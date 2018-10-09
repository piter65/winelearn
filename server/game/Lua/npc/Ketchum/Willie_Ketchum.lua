-- Willie_Ketchum
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0				-- where in the conversation you are
local dialogtext = nil

dialogtext = require 'Willie_Ketchum\\rnd_secur'

if week == 2 and playernum == 2 then
	dialogtext = require 'Willie_Ketchum\\t2p2_expert_ketchum'
elseif week == 3 then
	dialogtext = require 'Willie_Ketchum\\t3_ketchum'
end

function init()
	OS.logger("Willie_Ketchum.lua init\n")

	OS.SetDir("npc//Willie_Ketchum//model")
		npchandle = NPC.add("Willie_Ketchum","Willie_Ketchum.bws")
	OS.PopDir()

	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Willie Ketchum\n",np,112,32)
	

	if spawnarrest == 2 then
		if np == 1 then
			spawnarrest = 3
		end
	else
		place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	end
	
	npc_animate(npchandle)
end

function exit()
	OS.logger("Willie_Ketchum.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end
