-- Pablo_Cruz
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0				-- where in the conversation you are
local dialogtext = require 'Pablo_Cruz\\rnd_pablo'

if week == 1 and playernum == 4 then
	dialogtext = require 'Pablo_Cruz\\w1p4_vb_jannis_economou'
elseif week == 3 and playernum == 2 then
	dialogtext = require 'Pablo_Cruz\\t3p2_vd_jannis'
end

function init()
	OS.logger("Pablo_Cruz.lua init\n")

	OS.SetDir("npc//Pablo_Cruz//model")
		npchandle = NPC.add("Pablo_Cruz","Pablo_Cruz.bws")
	OS.PopDir()

	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Jannis Economou\n",np,112,32)
	
	if spawnarrest == 2 and np == 1 then
			spawnarrest = 3
	else
		place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	end
	
	npc_animate(npchandle)
end

function exit()
	OS.logger("Pablo_Cruz.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end
