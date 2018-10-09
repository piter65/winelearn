-- Franco_Manducci
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0				-- where in the conversation you are
local dialogtext = require 'Franco_Manducci\\rnd_franco'

if week == 4 then
	--dialogtext = require 'Franco_Manducci\\nlc_francom'
end

function init()
	OS.logger("Franco_Manducci.lua init\n")

	OS.SetDir("npc//Franco_Manducci//model")
		npchandle = NPC.add("Franco_Manducci","Franco_Manducci.bws")
	OS.PopDir()

	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Franco Manducci, P.I.\n",np,112,32)

	place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	
	npc_animate(npchandle)
end

function exit()
	OS.logger("Franco_Manducci.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end
