-- Groovy_Gary
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0				-- where in the conversation you are
local dialogtext = require 'Groovy_Gary\\rnd_organg'

if week == 3 and playernum == 4 then
	dialogtext = require 'Groovy_Gary\\t3p4_l2w1_groovy'
end

function init()
	OS.logger("Groovy_Gary.lua init\n")

	OS.SetDir("npc//Groovy_Gary//model")
		npchandle = NPC.add("Groovy_Gary","Groovy_Gary.bws")
	OS.PopDir()

	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Groovy Gary\n",np,112,32)
	
	place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	
	npc_animate(npchandle)
end

function exit()
	OS.logger("Groovy_Gary.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end
