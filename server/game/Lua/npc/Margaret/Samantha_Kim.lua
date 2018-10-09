-- Samantha_Kim
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0				-- where in the conversation you are
local dialogtext = require 'Samantha_Kim\\rnd_samantha'

if week == 2 and playernum == 2 then
	dialogtext = require 'Samantha_Kim\\t2p2_va_margaret'
end

function init()
	OS.logger("Samantha_Kim.lua init\n")

	OS.SetDir("npc//Samantha_Kim//model")
		npchandle = NPC.add("Samantha_Kim","Samantha_Kim.bws")
	OS.PopDir()

	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Margaret Wong\n",np,112,32)
	
	place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	
	npc_animate(npchandle)
end

function exit()
	OS.logger("Samantha_Kim.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end
