-- Rita_Novell
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0				-- where in the conversation you are
local dialogtext = require 'Rita_Novell\\rnd_librarian'

if week == 1 then
	dialogtext = require 'Rita_Novell\\w1_res_lib'
elseif week == 2 then
	dialogtext = require 'Rita_Novell\\w2_res_lib'
elseif week == 3 then
	dialogtext = require 'Rita_Novell\\t3_wp3_rita'
elseif week == 4 then
	--dialogtext = require 'Rita_Novell\\w4_wp3_librarian'
end

function init()
	OS.logger("Rita_Novell.lua init\n")

	OS.SetDir("npc//Rita_Novell//model")
		npchandle = NPC.add("Rita_Novell","Rita_Novell.bws")
	OS.PopDir()

	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Rita Novell\n",np,112,32)
	
	place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	
	npc_animate(npchandle)
end

function exit()
	OS.logger("Rita_Novell.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end
