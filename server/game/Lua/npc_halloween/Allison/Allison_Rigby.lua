-- Allison_Rigby
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0				-- where in the conversation you are
local dialogtext = require 'Allison_Rigby\\rnd_allison'

if week == 3 and playernum == 1 then
	dialogtext = require 'Allison_Rigby\\t3p1_l2w2_allison'
end

function init()
	OS.logger("Allison_Rigby.lua init\n")

	OS.SetDir("npc//Allison_Rigby//model")
		npchandle = NPC.add("Allison_Rigby","Allison_Rigby.bws")
	OS.PopDir()

	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Allison Rigby\n",np,112,32)
	
	place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	
	npc_animate(npchandle)
end

function exit()
	OS.logger("Allison_Rigby.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end
