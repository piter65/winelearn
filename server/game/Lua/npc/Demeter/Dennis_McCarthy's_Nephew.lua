-- Dennis_McCarthy's_Nephew
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0				-- where in the conversation you are
local dialogtext = require 'Dennis_McCarthy\'s_Nephew\\rnd_dennephw'

if week == 2 then
	dialogtext = require 'Dennis_McCarthy\'s_Nephew\\t2_utt_demeter'
elseif week == 3 and playernum == 4 then
	dialogtext = require 'Dennis_McCarthy\'s_Nephew\\t3p4_l1r_demeter'
end

function init()
	OS.logger("Dennis_McCarthy's_Nephew.lua init\n")

	OS.SetDir("npc//Dennis_McCarthy's_Nephew//model")
		npchandle = NPC.add("Dennis_McCarthy's_Nephew","Dennis_McCarthy's_Nephew.bws")
	OS.PopDir()

	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Demeter McCarthy\n",np,112,32)
	
	if trapper == 1 and mickeytrap == 1 then
		if week == 2 then
			np = 1
			mickeytrap = 0
			trapper = 0
		end
	end

	place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)	

	npc_animate(npchandle)
end

function exit()
	OS.logger("Dennis_McCarthy's_Nephew.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end
