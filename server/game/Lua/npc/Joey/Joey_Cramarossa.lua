-- Joey_Cramarossa
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0				-- where in the conversation you are
local dialogtext = require 'Joey_Cramarossa\\rnd_joey'

if week == 1 and playernum == 2 then
	dialogtext = require 'Joey_Cramarossa\\t1p2_utt_joey'
elseif week == 3 and playernum == 3 then
	dialogtext = require 'Joey_Cramarossa\\t3p3_l1w1_joey'
end

function init()
	OS.logger("Joey_Cramarossa.lua init\n")

	OS.SetDir("npc//Joey_Cramarossa//model")
		npchandle = NPC.add("Joey_Cramarossa","Joey_Cramarossa.bws")
	OS.PopDir()

	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Joey Cramarossa\n",np,112,32)
	
	if trapper == 1 then
		if week == 1 and playernum == 2 and mickeytrap == 1 then
			np = 1
			mickeytrap = 0
			trapper = 0
		end
	end

	place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	
	npc_animate(npchandle)
end

function exit()
	OS.logger("Joey_Cramarossa.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end
