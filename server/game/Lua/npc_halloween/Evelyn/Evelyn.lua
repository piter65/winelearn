-- Evelyn
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0			-- where in the conversation you are
local dialogtext = require 'Evelyn\\rnd_evelyn'


if week == 1 then
	if playernum == 1 then
		dialogtext = require 'Evelyn\\w1p1_as_evelyn'
	elseif playernum == 2 then
		dialogtext = require 'Evelyn\\w1p2_as_evelyn'
	elseif playernum == 3 then
		dialogtext = require 'Evelyn\\w1p3_as_evelyn'
	elseif playernum == 4 then
		dialogtext = require 'Evelyn\\w1p4_as_evelyn'
	end
elseif week == 2 then
	if playernum == 1 then
		dialogtext = require 'Evelyn\\w2p1_evelyn'
	elseif playernum == 2 then
		dialogtext = require 'Evelyn\\w2p2_evelyn'
	elseif playernum == 3 then
		dialogtext = require 'Evelyn\\w2p3_evelyn'
	elseif playernum == 4 then
		dialogtext = require 'Evelyn\\w2p4_evelyn'
	end
elseif week == 3 then
		dialogtext = require 'Evelyn\\w3_evelyn'
elseif week == 4 then
	--dialogtext = require 'Evelyn\\w4_evelyn'
elseif week == 0 then
	dialogtext = require 'Evelyn\\w0_evelyn'
end

function init()
	OS.logger("Evelyn.lua init\n")

	OS.SetDir("npc//Evelyn//model")
		npchandle = NPC.add("Evelyn","Evelyn.bws")
	OS.PopDir()

	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Evelyn Hu\n",np,112,32)
	
		if trapper == 1 then
			if evetrap == 1 then
				np = 1
				evetrap = 0
				trapper = 0
			end
		end
	
	npc_animate(npchandle)	

	OS.logger("Why is np:%d",np)
	OS.logger("Don't mess with me!")
	place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	OS.logger("ARGGGGGGGGG!")
end

function exit()
	OS.logger("Evelyn.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
	if cantrap == 1 then
		ravetrap = 1
		cantrap = 0
	end
end