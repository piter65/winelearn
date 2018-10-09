-- Danny_Mondorian
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0				-- where in the conversation you are
local dialogtext = require 'Danny_Mondorian\\rnd_danny'

if week == 2 and playernum == 3 then
	--dialogtext = require 'Danny_Mondorian\\t2p3_vc_freida'
end

function init()
	OS.logger("Danny_Mondorian.lua init\n")

	OS.SetDir("npc//Danny_Mondorian//model")
		npchandle = NPC.add("Danny_Mondorian","Danny_Mondorian.bws")
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
	
	place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	
	npc_animate(npchandle)
end

function exit()
	OS.logger("Danny_Mondorian.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end
