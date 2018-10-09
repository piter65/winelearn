-- Bill_Dryer
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0				-- where in the conversation you are
local dialogtext = require 'greenlady\\t1_green'

if week == 1 then
	dialogtext = require 'greenlady\\t1_green'
end
if week == 2 then
	dialogtext = require 'greenlady\\t2_green'
end 
if week == 3 then
	dialogtext = require 'greenlady\\t3_green'
end 

function init()
	OS.logger("greenlady.lua init\n")

	
	OS.SetDir("npc//greenlady//model")
		npchandle = NPC.add("greenlady","greenlady.bws")
	OS.PopDir()

	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Eva Green\n",np,112,32)
	
	place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	
	npc_animate(npchandle)
end

function exit()
	OS.logger("greenlady.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end
