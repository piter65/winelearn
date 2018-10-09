-- Little Girl
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0			-- where in the conversation 

local dialogtext = require 'anim_boats\\dlg_anim_boats'



function init()
	OS.logger("anim_boats.lua init\n")

	OS.SetDir("npc//anim_boats//model")
		npchandle = NPC.add("anim_boats","npc_anim_boats.BWS")
	OS.PopDir()

	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,1,160,1)
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
	OS.logger("anim_boats.lua exit\n")
	
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