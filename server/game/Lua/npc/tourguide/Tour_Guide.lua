-- Tour_Guide
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0				-- where in the conversation you are
local dialogtext = nil

if week == 1 then 
	dialogtext = require 'Tour_Guide\\nlc_tourguide'
elseif week == 2 then
	dialogtext = require 'Tour_Guide\\nlc_tourguide2'
elseif week == 3 then
	dialogtext = require 'Tour_Guide\\nlc_tourguide3'
elseif week == 4 then
	dialogtext = require 'Tour_Guide\\nlc_tourguide4'
elseif week == 0 then
	dialogtext = require 'Tour_Guide\\w0_tourguide'
end

function init()
	OS.logger("Tour_Guide.lua init\n")

	OS.SetDir("npc//Tour_Guide//model")
		npchandle = NPC.add("Tour_Guide","Tour_Guide.bws")
	OS.PopDir()

	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Tour Guide\n",np,112,32)
	
	if trapper == 1 then
		if week == 0 and tgtrap == 1 or tgtrap == 2 or tgtrap == 3 or tgtrap == 4 then
			np = 1
			tgtrap = 0
			trapper = 0
		end
	end
	place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	
	npc_animate(npchandle)
end

function exit()
	OS.logger("Tour_Guide.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end
