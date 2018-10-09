-- Sven_Erikson
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0				-- where in the conversation you are
local dialogtext = require 'Sven_Erikson\\rnd_sven'

if week == 1 and playernum == 1 then
	dialogtext = require 'Sven_Erikson\\w1p1_vc_bjorn'
elseif week == 3 and playernum == 3 then
	dialogtext = require 'Sven_Erikson\\t3p3_va_bjorn'
end

function init()
	OS.logger("Sven_Erikson.lua init\n")

	OS.SetDir("npc//Sven_Erikson//model")
		npchandle = NPC.add("Sven_Erikson","Sven_Erikson.bws")
	OS.PopDir()

	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Bjorn Egan\n",np,112,32)
	
	if spawnarrest == 2 and np == 1 then
			spawnarrest = 3
	else
		place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	end
	
	npc_animate(npchandle)
end

function exit()
	OS.logger("Sven_Erikson.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end
