-- Suzuku_ Kiroshi
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0				-- where in the conversation you are
local dialogtext = require 'Suzuku_Kiroshi\\rnd_suzuku'

if week == 1 and playernum == 3 then
	dialogtext = require 'Suzuku_Kiroshi\\t1p3_vb_oroko'
elseif week == 3 and playernum == 1 then
	dialogtext = require 'Suzuku_Kiroshi\\t3p1_vd_oroko'
end

function init()
	OS.logger("Suzuku_Kiroshi.lua init\n")

	OS.SetDir("npc//Suzuku_Kiroshi//model")
		npchandle = NPC.add("Suzuku_Kiroshi","Suzuku_Kiroshi.bws")
	OS.PopDir()

	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Oroko Nakashima\n",np,112,32)
	
	if spawnarrest == 2 and np == 1 then
			spawnarrest = 3
	else
		place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	end
	
	npc_animate(npchandle)
end

function exit()
	OS.logger("Suzuku_Kiroshi.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end
