-- Webster_Dweeb
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0			-- where in the conversation you are
local dialogtext = require 'Webster_Dweeb\\rnd_webster'

if week == 1 and playernum == 1 then
	dialogtext = require 'Webster_Dweeb\\t1p1_utt_webster'
end

function init()
	OS.logger("Webster_Dweeb.lua init\n")

	OS.SetDir("npc//Webster_Dweeb//model")
		npchandle = NPC.add("Webster_Dweeb","Webster_Dweeb.bws")
	OS.PopDir()

	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Webster Dweeb\n",np,112,32)
	
	if trapper == 1 then
		if mickeytrap == 1 and week == 1 and playernum == 1 then
			np = 1
			mickeytrap = 0
			trapper = 0
		end
	end


	place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	
	npc_animate(npchandle)
end

function exit()
	OS.logger("Webster_Dweeb.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end