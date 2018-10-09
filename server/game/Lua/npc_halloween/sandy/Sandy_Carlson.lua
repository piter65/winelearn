-- Sandy
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0			-- where in the conversation you are
local dialogtext = require 'Sandy_Carlson\\rnd_sandy'

if week == 1 and playernum == 1 then
	dialogtext = require 'Sandy_Carlson\\w1p1_ex_sandy'
elseif week == 3 then
	dialogtext = require 'Sandy_Carlson\\t3_wp4_sandy'
end

function init()
	OS.logger("Sandy_Carlson.lua init\n")
			OS.SetDir("npc//Sandy_Carlson//model")
			npchandle = NPC.add("Sandy_Carlson","Sandy_Carlson.bws")
		--npchandle = NPC.add("Vernon","Vernon.bws")
	OS.PopDir()

	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Sandy Carlson\n",np,112,32)
	
	place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	
	npc_animate(npchandle)
end

function exit()
	OS.logger("Sandy_Carlson.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end