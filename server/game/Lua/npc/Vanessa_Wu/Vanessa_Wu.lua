-- Vanessa_Wu
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0				-- where in the conversation you are
local dialogtext = nil

if week == 1 then
	dialogtext = require 'Vanessa_Wu\\nlc_wtq'
elseif week == 2 then
	dialogtext = require 'Vanessa_Wu\\nlc_wtq2'
elseif week == 3 then
	dialogtext = require 'Vanessa_Wu\\nlc_wtq3'
elseif week == 4 then
	--dialogtext = require 'Vanessa_Wu\\nlc_wtq4'
else
	dialogtext = require 'Vanessa_Wu\\rnd_vanessa'
end

function init()
	OS.logger("Vanessa_Wu.lua init\n")

	OS.SetDir("npc//Vanessa_Wu//model")
		npchandle = NPC.add("Vanessa_Wu","Vanessa_Wu.bws")
	OS.PopDir()

	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
	--wutrap = 1 -- jared testing don't leave in!!!!!!!!!!!111!!!!one one one juan juan!! 1
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Vanessa Wu\n",np,112,32)
	
	if trapper == 1 then
		if wutrap == 1 then
			np = 1
			wutrap = 0
			trapper = 0
		end
	end
	place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	
	npc_animate(npchandle)
end

function exit()
	OS.logger("Vanessa_Wu.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end
