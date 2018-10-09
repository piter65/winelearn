-- Bill_Dryer
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0				-- where in the conversation you are
local dialogtext = require 'Ashley_Dapper\\rnd_ashley'

if week == 2 and playernum == 3 then
	dialogtext = require 'Ashley_Dapper\\t2p3_va_ashley'
elseif week == 3 then
  dialogtext = require 'Ashley_Dapper\\t3_mq_npc2_ashley'
end

function init()
	OS.logger("Ashley_Dapper.lua init\n")

	
	OS.SetDir("npc//Ashley_Dapper//model")
		npchandle = NPC.add("Ashley_Dapper","Ashley_Dapper.bws")
	OS.PopDir()

	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Ashley Dapper\n",np,112,32)
	
	place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	
	npc_animate(npchandle)
end

function exit()
	OS.logger("Ashley_Dapper.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end
