-- BizHolder
local npchandle = nil		-- display npc handle
function init()
	OS.SetDir("npc//PLC_Moneybag//model")
		npchandle = NPC.add("MoneyBag","PLC_Moneybag.bws")
	OS.PopDir()
	NPC.setvis(npchandle,0)
end

function proc()
	local np
	
	np = npc_mousecheck(npchandle)		
	npc_tooltip("Bag with $\n",np,112,32)
	
	if np == 1 then
		ettfailed()
		moneybag = true
		picksubgui(2)
	end
end
function exit()
-- kill npc model
	if npchandle then
		NPC.remove(npchandle)
		npchandle = nil
	end
end

