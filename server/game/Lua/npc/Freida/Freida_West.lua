-- Danny_Mondorian
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0				-- where in the conversation you are
local dialogtext = require 'Freida_West\\rnd_freida'

if week == 2 and playernum == 3 then
	dialogtext = require 'Freida_West\\t2p3_vc_freida'
end

function init()
	OS.logger("Freida_West.lua init\n")

	OS.SetDir("npc//Freida_West//model")
		npchandle = NPC.add("Freida_West","npc_frieda.bws")
	OS.PopDir()

	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Freida West\n",np,112,32)
	
	npc_animate(npchandle)

	place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	
end

function exit()
	OS.logger("Freida_West.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end
