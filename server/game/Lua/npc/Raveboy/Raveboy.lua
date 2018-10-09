-- Raveboy
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0				-- where in the conversation you are
local dialogtext = require 'Raveboy\\rnd_raver'

if week == 3 then
	dialogtext = require 'Raveboy\\t3_ett_tom'
end

function init()
	OS.logger("Raveboy.lua init\n")

	OS.SetDir("npc//Raveboy//model")
		npchandle = NPC.add("Raveboy","Raveboy.bws")
	OS.PopDir()

	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Techno Tom\n",np,112,32)

	if trapper == 1 then
		if etttrap == 1 and week == 3 then
			np = 1
			etttrap = 0
			trapper = 0
		end
	end
	
	place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	
	npc_animate(npchandle)
end

function exit()
	OS.logger("Raveboy.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end
