-- Dan_Lee
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0				-- where in the conversation you are
local dialogtext = require 'Dan_Lee\\rnd_dan'

if week == 1 and playernum == 3 then
	dialogtext = require 'Dan_Lee\\t1p3_utt_nathan'
elseif week == 3 and playernum == 4 then
	dialogtext = require 'Dan_Lee\\t3p4_l2w2_nathan'
end

function init()
	OS.logger("Dan_Lee.lua init\n")
	OS.SetDir("npc//Dan_Lee//model")
		npchandle = NPC.add("Dan_Lee","Dan_Lee.bws")
	OS.PopDir()
	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Nathan Broome\n",np,112,32)
	
	if trapper == 1 then
		if week == 1 and playernum == 3 and mickeytrap == 1 then
			np = 1
			mickeytrap = 0
			trapper = 0
		end
	end

	place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	
	npc_animate(npchandle)
end

function exit()
	OS.logger("Dan_Lee.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end