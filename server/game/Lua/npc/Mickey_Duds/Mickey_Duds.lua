-- Mickey_Duds
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0				-- where in the conversation you are
local dialogtext = require 'Mickey_Duds\\rnd_mickey'

if week == 1 then
	dialogtext = require 'Mickey_Duds\\t1_ett_mickey'
elseif week == 3 then
	dialogtext = require 'Mickey_Duds\\t3_edt_mickey'
end


function init()
	OS.logger("Mickey_Duds.lua init\n")

	OS.SetDir("npc//Mickey_Duds//model")
		npchandle = NPC.add("Mickey_Duds","Mickey_Duds.bws")
	OS.PopDir()

	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Mickey Jones\n",np,112,32)
	
	if trapper == 1 then
		if week == 1 and etttrap == 1 then
			np = 1
			etttrap = 0
			trapper = 0
		elseif week == 3 and shorttrap == 1 then
			np = 1
			shorttrap = 0
			trapper = 0
		end
	end

	place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	
	npc_animate(npchandle)
end

function exit()
	OS.logger("Mickey_Duds.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end
