-- Bless
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0				-- where in the conversation you are
local dialogtext = nil

if week == 1 then
	dialogtext = require 'Bless\\nlc_unitedway'
elseif week == 2 then
	dialogtext = require 'Bless\\nlc_unitedway2'
elseif week == 3 then
	dialogtext = require 'Bless\\nlc_unitedway3'
elseif week == 4 then
	dialogtext = require 'Bless\\nlc_unitedway4'
else
	dialogtext = require 'Bless\\rnd_bless'
end

function init()
	OS.logger("Bless.lua init\n")

	OS.SetDir("npc//Bless//model")
		npchandle = NPC.add("Bless","Bless.bws")
	OS.PopDir()

	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Bless\n",np,112,32)
	
	place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	
	npc_animate(npchandle)
end

function exit()
	OS.logger("Bless.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end
