-- Shrapnel_Fan
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0				-- where in the conversation you are
local dialogtext = nil

dialogtext = require 'Shrapnel_Fan\\rnd_shrapfan'

if week == 2 then
	dialogtext = require 'Shrapnel_Fan\\ett_jeff'
elseif week == 3 and playernum == 2 then
	dialogtext = require 'Shrapnel_Fan\\t3p2_l2r_jeff'
end

function init()
	OS.logger("Shrapnel_Fan.lua init\n")

	OS.SetDir("npc//Shrapnel_Fan//model")
		npchandle = NPC.add("Shrapnel_Fan","Shrapnel_Fan.bws")
	OS.PopDir()

	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Jeff Punkman\n",np,112,32)

	if trapper == 1 then
		if etttrap == 1 and week == 2 then
			np = 1
			etttrap = 0
			trapper = 0
		end
	end	

	place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	
	npc_animate(npchandle)
end

function exit()
	OS.logger("Shrapnel_Fan.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end
