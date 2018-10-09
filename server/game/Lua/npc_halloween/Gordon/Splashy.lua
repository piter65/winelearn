-- Splashy
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0				-- where in the conversation you are
local dialogtext = nil

dialogtext = require 'Splashy\\rnd_splashy'

if week == 3 and playernum == 4 then
	dialogtext = require 'Splashy\\t3p4_l1w2_gordon'
end

function init()
	OS.logger("Splashy.lua init\n")

	OS.SetDir("npc//Splashy//model")
		npchandle = NPC.add("Splashy","Splashy.bws")
	OS.PopDir()

	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Gordon \"Splashy\" Hibbert\n",np,112,48)
	
	place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	
	npc_animate(npchandle)
end

function exit()
	OS.logger("Splashy.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end
