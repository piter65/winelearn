-- Michael_Manducci
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0				-- where in the conversation you are
local dialogtext = require 'Michael_Manducci\\rnd_michael'

if week == 1 and playernum == 4 then
	dialogtext = require 'Michael_Manducci\\t1p4_utt_marcos'
elseif week == 3 and playernum == 3 then
	dialogtext = require 'Michael_Manducci\\t3p3_l2w2_marcos'
end

function init()
	OS.logger("Michael_Manducci.lua init\n")
	OS.SetDir("npc//Michael_Manducci//model")
		npchandle = NPC.add("Michael_Manducci","Michael_Manducci.bws")
	OS.PopDir()
	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Marcos Mendes\n",np,112,32)

	if trapper == 1 then
		if week == 1 and playernum == 4 and mickeytrap == 1 then
			np = 1
			mickeytrap = 0
			trapper = 0
		end
	end
	
	place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	
	npc_animate(npchandle)
end

function exit()
	OS.logger("Michael_Manducci.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end