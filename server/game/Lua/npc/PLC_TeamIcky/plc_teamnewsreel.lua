-- BizHolder
local npchandle = nil		-- display npc handle

function init()
	OS.SetDir("npc//PLC_TeamIcky//model")
		npchandle = NPC.add("Newsreel","TeamIcky.BWS")
	OS.PopDir()
	NPC.setvis(npchandle,0)
end

function proc()
	local np
	
	np = npc_mousecheck(npchandle)		
	npc_tooltip("Newsreel\n",np,112,32)
	
	if np ==1 then
		if moviehandle ~= nil then 
			OS.removescript(moviehandle) 
			moviehandle = nil
		else
			if week == 0 then
				return
			else
				curmovie = string.format("nomovie.bik",week)			
--curmovie = string.format("wk%d_newsreel.bik",week)	
				moviehandle = OS.addscript("movie.lua")
			end
			--curmovie = string.format("wk%d_newsreel.bik",week)			
			--moviehandle = OS.addscript("movie.lua")
		end
	end
end

function exit()
-- kill npc model
	if npchandle then
		NPC.remove(npchandle)
		npchandle = nil
	end
	
	if moviehandle then
		OS.removescript(moviehandle)
		moviehandle = nil
	end	
end
