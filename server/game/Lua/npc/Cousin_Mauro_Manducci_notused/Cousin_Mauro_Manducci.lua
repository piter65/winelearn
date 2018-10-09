-- Cousin_Mauro_Manducci
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0				-- where in the conversation you are

local dialogtext = {
		{"n","Hi! Do I know you?"},
		{"p","End."},
}

function init()
	OS.logger("Cousin_Mauro_Manducci.lua init\n")

	OS.SetDir("npc//Cousin_Mauro_Manducci//model")
		npchandle = NPC.add("Cousin_Mauro_Manducci","Cousin_Mauro_Manducci.bws")
	OS.PopDir()

	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Cousin Mauro Manducci\n",np,112,32)
	
	place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	
	npc_animate(npchandle)
end

function exit()
	OS.logger("Cousin_Mauro_Manducci.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end
