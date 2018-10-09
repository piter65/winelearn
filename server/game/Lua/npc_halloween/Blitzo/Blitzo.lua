-- Blitzo
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0			-- where in the conversation you are
local dialogtext = require 'Blitzo\\rnd_blitzo'

if week == 3 then
	dialogtext = require 'Blitzo\\t3_utt_blitzo'
end

function init()
	OS.logger("Blitzo.lua init\n")

	OS.SetDir("npc//Blitzo//model")
		npchandle = NPC.add("Blitzo","Blitzo.bws")
	OS.PopDir()

	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Blitzo",np,112,32)
	
	if trapper == 1 then
		if week == 3 then
			if mickeytrap == 1 then
				np = 1
				mickeytrap = 0
				trapper = 0
			end
		end
	end

	place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)

	npc_animate(npchandle)
end

function exit()
	OS.logger("Blitzo.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end