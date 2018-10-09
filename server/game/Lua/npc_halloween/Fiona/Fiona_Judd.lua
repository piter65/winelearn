-- Fiona_Judd
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0			-- where in the conversation you are
local dialogtext = require 'Fiona_Judd\\rnd_fiona'

if week == 2 and playernum == 1 then
	dialogtext = require 'Fiona_Judd\\t2p1_vd_fiona'	
elseif week == 0 then
	dialogtext = require 'Fiona_Judd\\w0_fiona'
end

function init()
	OS.logger("Fiona_Judd.lua init\n")

	OS.SetDir("npc//Fiona_Judd//model")
		npchandle = NPC.add("Fiona_Judd","Fiona_Judd.bws")
	OS.PopDir()

	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Fiona Rudd\n",np,112,32)
	
	place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	
	npc_animate(npchandle)
end

function exit()
	OS.logger("Fiona_Judd.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end