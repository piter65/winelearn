-- John_Ferris
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0				-- where in the conversation you are
local dialogtext = require 'John_Ferris\\rnd_john'

if week == 3 and playernum == 4 then
	--dialogtext = require 'John_Ferris\\w3p4_vb_john'
end

function init()
	OS.logger("John_Ferris.lua init\n")

	OS.SetDir("npc//John_Ferris//model")
		npchandle = NPC.add("John_Ferris","John_Ferris.bws")
	OS.PopDir()

	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("John Ferris\n",np,112,32)
	
	place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	
	npc_animate(npchandle)
end

function exit()
	OS.logger("John_Ferris.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end
