-- Will
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0			-- where in the conversation you are
local dialogtext = require 'Will\\rnd_succup'


outcome = tm_3_w1vendor + tm_3_w2vendor - tm_3_w3vendor + tm_4_w1vendor + tm_4_w2vendor - tm_4_w3vendor + tm_5_w1vendor + tm_5_w2vendor - tm_5_w3vendor + tm_6_w1vendor + tm_6_w2vendor - tm_6_w3vendor

if outcome < 1 then
	outcome = 1
elseif outcome < 10 then
	outcome = 2
elseif outcome < 19 then
	outcome = 3 
else
	outcome = 4
end


if tm_3_w1cost == 0 then
	tm_3_w1cost = 7760
end
if tm_3_w2cost == 0 then
	tm_3_w2cost = 17900
end
if tm_4_w1cost == 0 then
	tm_4_w1cost = 7760
end
if tm_4_w2cost == 0 then
	tm_4_w2cost = 17900
end
if tm_5_w1cost == 0 then
	tm_5_w1cost = 7760
end
if tm_5_w2cost == 0 then
	tm_5_w2cost = 17900
end
if tm_6_w1cost == 0 then
	tm_6_w1cost = 7760
end
if tm_6_w2cost == 0 then
	tm_6_w2cost = 17900
end

teamtotalcost = tm_3_w1cost + tm_3_w2cost + tm_4_w1cost + tm_4_w2cost + tm_5_w1cost + tm_5_w2cost + tm_6_w1cost + tm_6_w2cost

vendorsarrested = 0

if tm_3_w1vendor == 1 then
	vendorsarrested = vendorsarrested + 1
end
if tm_4_w1vendor == 1 then
	vendorsarrested = vendorsarrested + 1
end
if tm_5_w1vendor == 1 then
	vendorsarrested = vendorsarrested + 1
end
if tm_6_w1vendor == 1 then
	vendorsarrested = vendorsarrested + 1
end

if week == 1 then
	if playernum == 1 then
		dialogtext = require 'Will\\w1p1_s'
	elseif playernum == 2 then
		dialogtext = require 'Will\\w1p2_s'
	elseif playernum == 3 then
		dialogtext = require 'Will\\w1p3_s'
	elseif playernum == 4 then
		dialogtext = require 'Will\\w1p4_s'
	end
elseif week == 2 then
	if playernum == 1 then
		dialogtext = require 'Will\\w2p1_s'
	elseif playernum == 2 then
		dialogtext = require 'Will\\w2p2_s'
	elseif playernum == 3 then
		dialogtext = require 'Will\\w2p3_s'
	elseif playernum == 4 then
		dialogtext = require 'Will\\w2p4_s'
	end
elseif week == 3 then
	dialogtext = require 'Will\\t3_will'
elseif week == 4 then
	if outcome == 1 then
		dialogtext = require 'Will\\task4-1'
	elseif outcome == 2 then
		dialogtext = require 'Will\\task4-2'
	elseif outcome == 3 then
		dialogtext = require 'Will\\task4-3'
	else
		dialogtext = require 'Will\\task4-4'
	end 
elseif week == 0 then
	dialogtext = require 'Will\\w0_succup'
end

function init()
	OS.logger("Will.lua init\n")

	OS.SetDir("npc//Will//model")
		npchandle = NPC.add("Will","Will.bws")
	OS.PopDir()

	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Will Standon\n",np,112,32)

	if week == 4 and trapper == 1 then
		np = 1
		trapper = 0
	end
	
	place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	
	npc_animate(npchandle)
end

function exit()
	OS.logger("Will.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end