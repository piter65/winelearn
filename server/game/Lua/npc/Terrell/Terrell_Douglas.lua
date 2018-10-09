-- Terrell_Douglas
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0				-- where in the conversation you are
local dialogtext = require 'Terrell_Douglas\\rnd_terrell'

if week == 2 then
	dialogtext = require 'Terrell_Douglas\\t2_equ_npc2_terrell'
elseif week == 3 and playernum == 2 then
	dialogtext = require 'Terrell_Douglas\\t3p2_l2w2_terrell'
end

function init()
	OS.logger("Terrell_Douglas.lua init\n")

	OS.SetDir("npc//Terrell_Douglas//model")
		npchandle = NPC.add("Terrell_Douglas","Terrell_Douglas.bws")
	OS.PopDir()

	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Terrell Douglas\n",np,112,32)
	
	place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	
	npc_animate(npchandle)
end

function exit()
	OS.logger("Terrell_Douglas.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end
