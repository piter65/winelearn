-- Jorge_Estevez
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0				-- where in the conversation you are
local dialogtext = require 'Jorge_Estevez\\rnd_jorge'

if week == 3 and playernum == 3 then
	--dialogtext = require 'Jorge_Estevez\\w3p3_va_jorge'
end

function init()
	OS.logger("Jorge_Estevez.lua init\n")

	OS.SetDir("npc//Jorge_Estevez//model")
		npchandle = NPC.add("Jorge_Estevez","Jorge_Estevez.bws")
	OS.PopDir()

	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Jorge Estevez\n",np,112,32)
	
	place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	
	npc_animate(npchandle)
end

function exit()
	OS.logger("Jorge_Estevez.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end
