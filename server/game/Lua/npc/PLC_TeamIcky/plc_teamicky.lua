-- BizHolder
local npchandle = nil		-- display npc handle
function init()
	OS.SetDir("npc//PLC_TeamIcky//model")
		npchandle = NPC.add("TeamIcky","TeamIcky.BWS")
	OS.PopDir()
	NPC.setvis(npchandle,0)
end

function proc()
	local np
	
	np = npc_mousecheck(npchandle)		
	npc_tooltip("Ickypedia\n",np,112,32)
	
	if np ==1 then
		if icky then
			OS.removescript(icky)
			icky = nil
		else
			icky = OS.addscript("showicky.lua")
		end
	end
end

function exit()
-- kill npc model
	if npchandle then
		NPC.remove(npchandle)
		npchandle = nil
	end
	
	if icky then
		OS.removescript(icky)
		icky = nil
	end	
end
