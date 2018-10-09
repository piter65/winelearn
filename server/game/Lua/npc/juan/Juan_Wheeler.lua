-- Juan_Wheeler
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0				-- where in the conversation you are
local dialogtext = require 'Juan_Wheeler\\rnd_juan'

if week == 3 and playernum == 4 then
	--dialogtext = require 'Juan_Wheeler\\w3p4_vd_juan'
end

function init()
	OS.logger("Juan_Wheeler.lua init\n")

	OS.SetDir("npc//Juan_Wheeler//model")
		npchandle = NPC.add("Juan_Wheeler","Juan_Wheeler.bws")
	OS.PopDir()

	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Juan Wheeler\n",np,112,32)
	
	place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	
	npc_animate(npchandle)
end

function exit()
	OS.logger("Juan_Wheeler.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end
