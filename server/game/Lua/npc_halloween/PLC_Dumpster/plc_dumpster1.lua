-- BizHolder
local npchandle = nil		-- display npc handle
local place
local dialoghandle
local dialogtext = {{"n","Thank you for Recycling"}}
function init()
	OS.SetDir("npc//PLC_dumpster//model")
		npchandle = NPC.add("Dumpster1","PLC_Dumpster.bws")
	OS.PopDir()
	NPC.setvis(npchandle,0)
end

function proc()
	local np
	
	np = npc_mousecheck(npchandle)		
	npc_tooltip("Dumpster\n",np,112,32)
	if trash1 == true then
		if np == 1 then
			if indialog == 0 then
				indialog = 1
				dialoghandle = OS.dialogadd(10,30,480,220)
				place = 0
			end
		end
		if dialoghandle then
			place = procdialog(npchandle,dialoghandle,dialogtext,place)
			if place == -1 then
				dropcash()
				OS.dialogremove(dialoghandle)
				dialoghandle = nil
				indialog = 0
			end
		end
	elseif trash2 == true then
		if np == 1 then			
			if indialog == 0 then
				indialog = 1
				dialoghandle = OS.dialogadd(10,30,480,220)
				place = 0
			end
		end
		if dialoghandle then
			place = procdialog(npchandle,dialoghandle,dialogtext,place)
			if place == -1 then
				dropcash()
				OS.dialogremove(dialoghandle)
				dialoghandle = nil
				indialog = 0
			end
		end
	end
end

function exit()
-- kill npc model
	npc_closedialog(dialoghandle)
	if npchandle then
		NPC.remove(npchandle)
		npchandle = nil
	end

end
