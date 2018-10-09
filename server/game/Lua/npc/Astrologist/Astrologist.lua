-- Astrologist
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0				-- where in the conversation you are
local dialogtext = require 'Astrologist\\rnd_astrol'

if week == 2 then
	dialogtext = require 'Astrologist\\t2_equ_npc3_astrologer'
elseif week == 3 and playernum == 2 then
	dialogtext = require 'Astrologist\\t3p2_l1r_astrologist'
end

function init()
	OS.logger("Astrologist.lua init\n")

	OS.SetDir("npc//Astrologist//model")
		npchandle = NPC.add("Astrologist","Astrologist.bws")
	OS.PopDir()

	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Heather Winehart's Astrologist\n",np,112,48)
	
	place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	
	npc_animate(npchandle)
end

function exit()
	OS.logger("Astrologist.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end
