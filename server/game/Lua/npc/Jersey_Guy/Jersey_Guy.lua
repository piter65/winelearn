-- Jersey_Guy
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0				-- where in the conversation you are

local dialogtext = {
		{"n","Hi! Do I know you?"},
		{"p","End."},
}

function init()
	OS.logger("Jersey_Guy.lua init\n")

	OS.SetDir("npc//Jersey_Guy//model")
		npchandle = NPC.add("Jersey_Guy","Jersey_Guy.bws")
	OS.PopDir()

	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Jersey_Guy\n",np,112,32)
	
	place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	
	npc_animate(npchandle)
end

function exit()
	OS.logger("Jersey_Guy.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end
