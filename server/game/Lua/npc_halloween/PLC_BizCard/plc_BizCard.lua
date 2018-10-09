-- BizHolder
local npchandle = nil		-- display npc handle


function init()
	OS.logger("BizHolder init\n")
	OS.SetDir("npc//PLC_BizCard//model")
		npchandle = NPC.add("BizCard","BizCard.bws")
	OS.PopDir()
	NPC.setvis(npchandle,0)
end

function proc()
	local np
	np = npc_mousecheck(npchandle)	
	npc_tooltip("Card Dispenser\n",np,112,32)
	
	if np == 1 then
		if cardholder > 0 then
			local bc = string.format("businesscard%d",cardholder)
			if _G[bc] then 
				return
			else
				busicards = busicards + 1
				tkbusicards = true
				--if username and password then
					--OS.telldb(string.format("/gsq.php?u=%s&p=%s&t=tracking&c=%s&v=%s",username,password,string.format("w%dcards",week),busicards))
				--end
				_G[bc] = true
				picksubgui(2)
			end
		end
	end
end

function exit()
	OS.logger("BizHolder.lua exit\n")
-- kill npc model
	if npchandle then
		NPC.remove(npchandle)
		npchandle = nil
	end
end
