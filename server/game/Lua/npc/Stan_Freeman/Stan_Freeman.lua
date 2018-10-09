-- Stan_Freeman
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0				-- where in the conversation you are
local allowdialog = 0
local dialogtext = require 'Stan_Freeman\\rnd_ceostan'

if week == 4 then
	if playernum == 1 then
		dialogtext = require 'Stan_Freeman\\w4p1_ceo'
	elseif playernum == 2 then
		dialogtext = require 'Stan_Freeman\\w4p2_ceo'
	elseif playernum == 3 then
		dialogtext = require 'Stan_Freeman\\w4p3_ceo'
	elseif playernum == 4 then
		dialogtext = require 'Stan_Freeman\\w4p4_ceo'
	end
end

function init()
	OS.logger("Stan_Freeman.lua init\n")

	OS.SetDir("npc//Stan_Freeman//model")
		npchandle = NPC.add("Stan_Freeman","Stan_Freeman.bws")
	OS.PopDir()

	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Stan Freeman\n",np,112,32)
	
	if allowdialog == 0 then
		place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	else
		allowdialog = 1
	end
	
	npc_animate(npchandle)
end

function exit()
	OS.logger("Stan_Freeman.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end
