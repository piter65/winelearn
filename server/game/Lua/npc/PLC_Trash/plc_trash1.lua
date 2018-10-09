-- BizHolder
local npchandle = nil		-- display npc handle
function init()
	OS.SetDir("npc//PLC_trash//model")
		npchandle = NPC.add("Trash1","PLC_Trash.bws")
	OS.PopDir()
	NPC.setvis(npchandle,0)
end

function proc()
	local np
	
	np = npc_mousecheck(npchandle)		
	npc_tooltip("Trash\n",np,112,32)
	
	if np == 1 then
		if trash2 and trash1 then
			return
		else
			trash = trash + 1
			if trash1 then
				trash2 = true
			else
				trash1 = true
			end
			trash1picked = true
			picksubgui(2)
		end
	end
end
function exit()
-- kill npc model
	if npchandle then
		NPC.remove(npchandle)
		npchandle = nil
	end
end

