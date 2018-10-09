-- Madeline_Kutsch
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0				-- where in the conversation you are
local dialogtext = require 'Madeline_Kutsch\\rnd_madlin'

if week == 2 and playernum == 4 then
	dialogtext = require 'Madeline_Kutsch\\t2p4_vd_liddy'
end

function init()
	OS.logger("Madeline_Kutsch.lua init\n")

	OS.SetDir("npc//Madeline_Kutsch//model")
		npchandle = NPC.add("Madeline_Kutsch","Madeline_Kutsch.bws")
	OS.PopDir()

	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Liddy Gates\n",np,112,32)
	
	place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	
	npc_animate(npchandle)
end

function exit()
	OS.logger("Madeline_Kutsch.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end
