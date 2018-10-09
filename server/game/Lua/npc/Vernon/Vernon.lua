-- Vernon
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0			-- where in the conversation you are
local dialogtext = require 'Vernon\\rnd_vernon'

if week == 2 then
	dialogtext = require 'Vernon\\t2_equ_npc1_vern'
elseif week == 0 then
	dialogtext = require 'Vernon\\w0_vernon'
end

function init()
	OS.logger("Vernon.lua init\n")

	OS.SetDir("npc//Vernon//model")
		npchandle = NPC.add("Vernon","Vernon.bws")
	OS.PopDir()

	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Vernon Sharpe\n",np,112,32)
	
	place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	
	npc_animate(npchandle)
end

function exit()
	OS.logger("Vernon.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end