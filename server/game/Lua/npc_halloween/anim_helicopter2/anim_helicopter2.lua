-- Little Girl
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0			-- where in the conversation 

local dialogtext = require 'anim_helicopter2\\dlg_anim_helicopter'



function init()
	OS.logger("anim_helicopter2.lua init\n")

	OS.SetDir("npc//anim_helicopter2//model")
		npchandle = NPC.add("anim_helicopter2","anim_helicopter2.BWS")
	OS.PopDir()

	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,0,300,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Leydi\n",np,112,32)
	npc_animate(npchandle)
	place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	
end

function exit()
	OS.logger("anim_helicopter2.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
	if cantrap == 1 then
		ravetrap = 1
		cantrap = 0
	end
end