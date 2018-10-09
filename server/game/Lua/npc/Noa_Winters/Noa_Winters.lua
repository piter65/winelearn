-- Noa_Winters
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0				-- where in the conversation you are
local dialogtext = require 'Noa_Winters\\rnd_noa'

if week == 1 then
	--dialogtext = require 'Noa_Winters\\nlc_ol2'
end

function init()
	OS.logger("Noa_Winters.lua init\n")

	OS.SetDir("npc//Noa_Winters//model")
		npchandle = NPC.add("Noa_Winters","Noa_Winters.bws")
	OS.PopDir()

	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Noa Winters\n",np,112,32)
	
	place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	
	npc_animate(npchandle)
end

function exit()
	OS.logger("Noa_Winters.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end
