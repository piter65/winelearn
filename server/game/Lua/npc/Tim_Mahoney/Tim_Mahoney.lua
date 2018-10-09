-- Tim_Mahoney
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0				-- where in the conversation you are
local dialogtext = require 'Tim_Mahoney\\rnd_newsguy'

if week == 4 then
	--dialogtext = require 'Tim_Mahoney\\w4_wp2_np_vendor'
end

function init()
	OS.logger("Tim_Mahoney.lua init\n")

	OS.SetDir("npc//Tim_Mahoney//model")
		npchandle = NPC.add("Tim_Mahoney","Tim_Mahoney.bws")
	OS.PopDir()

	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Tim Mahoney\n",np,112,32)
	
	place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	
	npc_animate(npchandle)
end

function exit()
	OS.logger("Tim_Mahoney.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end
