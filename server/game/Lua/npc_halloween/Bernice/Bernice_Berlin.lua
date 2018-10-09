-- Bernice_Berlin
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0				-- where in the conversation you are
local dialogtext = require 'Bernice_Berlin\\rnd_wbmom'

if week == 3  and playernum == 1 then
	dialogtext = require 'Bernice_Berlin\\t3p1_l1r_bernice'
end

function init()
	OS.logger("Bernice_Berlin.lua init\n")

	OS.SetDir("npc//Bernice_Berlin//model")
		npchandle = NPC.add("Bernice_Berlin","Bernice_Berlin.bws")
	OS.PopDir()

	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Bernice Berlin\n",np,112,32)
	

	place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	
	npc_animate(npchandle)
end

function exit()
	OS.logger("Bernice_Berlin.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end
