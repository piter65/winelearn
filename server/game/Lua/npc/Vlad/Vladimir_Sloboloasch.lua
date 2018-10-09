-- Vladimir_Sloboloasch
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0				-- where in the conversation you are
local dialogtext = require 'Vladimir_Sloboloasch\\rnd_vladimir'

if week == 3 then
	dialogtext = require 'Vladimir_Sloboloasch\\t3_wp1_slobolasch'
end


function init()
	OS.logger("Vladimir_Sloboloasch.lua init\n")

	OS.SetDir("npc//Vladimir_Sloboloasch//model")
		npchandle = NPC.add("Vladimir_Sloboloasch","Vladimir_Sloboloasch.bws")
	OS.PopDir()

	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Vladimir Sloboloasch\n",np,112,32)
	
	place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	
	npc_animate(npchandle)
	if place == -1 then
		if cantrap == 1 then
			cwgtrap = 1
			cantrap = 0
		end
	end
end

function exit()
	OS.logger("Vladimir_Sloboloasch.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end
