-- Mayor
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0			-- where in the conversation you are
local dialogtext = require 'Mayor\\rnd_mayor'

if week == 1 then
	if playernum == 1 then
		dialogtext = require 'Mayor\\t1p1_mayor'
	elseif playernum == 2 then
		dialogtext = require 'Mayor\\t1p2_mayor'
	elseif playernum == 3 then
		dialogtext = require 'Mayor\\t1p3_mayor'
	elseif playernum == 4 then
		dialogtext = require 'Mayor\\t1p4_mayor'
	end
elseif week == 2 then
	if playernum == 1 then
		dialogtext = require 'Mayor\\t2p1_mayor'
	elseif playernum == 2 then
		dialogtext = require 'Mayor\\t2p2_mayor'
	elseif playernum == 3 then
		dialogtext = require 'Mayor\\t2p3_mayor'
	elseif playernum == 4 then
		dialogtext = require 'Mayor\\t2p4_mayor'
	end
elseif week == 3 then
	dialogtext = require 'Mayor\\t3_mayor'
elseif week == 4 then
	--dialogtext = require 'Mayor\\w4_mayor'
end

function init()
	OS.logger("Mayor.lua init\n")

	OS.SetDir("npc//Mayor//model")
		npchandle = NPC.add("Mayor","Mayor.bws")
	OS.PopDir()

	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Mayor Judy Gonzales\n",np,112,32)
	
	place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	
	npc_animate(npchandle)
end

function exit()
	OS.logger("Mayor.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end