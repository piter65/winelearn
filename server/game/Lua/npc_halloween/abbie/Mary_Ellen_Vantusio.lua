-- Mary_Ellen_Vantusio
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0				-- where in the conversation you are
local dialogtext = require 'Mary_Ellen_Vantusio\\rnd_maryellen'

if week == 2 and playernum == 4 then
	dialogtext = require 'Mary_Ellen_Vantusio\\t2p4_vc_abbie'
end

function init()
	OS.logger("Mary_Ellen_Vantusio.lua init\n")

	OS.SetDir("npc//Mary_Ellen_Vantusio//model")
		npchandle = NPC.add("Mary_Ellen_Vantusio","Mary_Ellen_Vantusio.bws")
	OS.PopDir()
	
	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Abbie S. Korpis\n",np,112,32)
	
	place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	
	npc_animate(npchandle)
end

function exit()
	OS.logger("Mary_Ellen_Vantusio.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end