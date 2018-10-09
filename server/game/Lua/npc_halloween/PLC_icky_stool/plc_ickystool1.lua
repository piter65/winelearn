-- BizHolder
--local npchandle = nil		-- display npc handle
local icky1

function init()
	OS.SetDir("npc//PLC_icky_stool//model")
		icky1 = NPC.add("icky_stool1","icky_stool.bws")
	OS.PopDir()
	NPC.setvis(icky1,0)
end

function proc()
	local np
	
	np = npc_mousecheck(icky1)

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
	if icky1 then
		NPC.remove(icky1)
		icky1 = nil
	end
	
	if icky then
		OS.removescript(icky)
		icky = nil
	end	
end
