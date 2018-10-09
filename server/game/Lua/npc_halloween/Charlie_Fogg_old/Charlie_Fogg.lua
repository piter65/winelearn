-- Charlie_Fogg
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0				-- where in the conversation you are
local dialogtext = require 'Charlie_Fogg\\rnd_cjguitr'

if week == 1 then
	dialogtext = require 'Charlie_Fogg\\t1_edt_charlie'
elseif week == 2 then
	dialogtext = require 'Charlie_Fogg\\t2_equ_npc5_charlie'
elseif week == 3 and playernum == 3 then
	dialogtext = require 'Charlie_Fogg\\t3p3_l1r_charlie'
end

function init()
	OS.logger("Charlie_Fogg.lua init\n")

	OS.SetDir("npc//Charlie_Fogg//model")
		npchandle = NPC.add("Charlie_Fogg","Charlie_Fogg.bws")
	OS.PopDir()

	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Charlie Fogg\n",np,112,32)

	if trapper == 1 then
		if shorttrap == 1 and week == 1 then
			np = 1
			shorttrap = 0
			trapper = 0
		end
	end
	
	place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	
	npc_animate(npchandle)
end

function exit()
	OS.logger("Charlie_Fogg.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end
