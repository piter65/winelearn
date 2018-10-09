-- Pauline
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0				-- where in the conversation you are
local dialogtext = nil
local pinv = nil
local showmeyourjunk = nil

function closepshop()
	if pinv ~= nil then OS.removescript(pinv) end
	pinv = nil
	showmeyourjunk = 0
	remguihandle()
end

function paulinesgoods()

	if showmeyourjunk == 1 and pinv ~= nil then
		OS.removescript(pinv)
		pinv = nil
	end

	showmeyourjunk = 1
end

dialogtext = require 'Pauline\\rnd_paulin'

function init()
	OS.logger("Pauline.lua init\n")

	OS.SetDir("npc//Pauline//model")
		npchandle = NPC.add("Pauline","Pauline.bws")
	OS.PopDir()

	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Pauline\n",np,112,32)
	
	place,dialoghandle = npc_dodialog(dialoghandle,dialogtext,npchandle,place,np)
	
	if showmeyourjunk == 1 and pinv == nil then
		OS.SetDir("npc//pauline")
			pinv = OS.addscript("PaulinesGoods.lua")
		OS.PopDir()
		
		picksubgui(2)
	end
	
	npc_animate(npchandle)
end

function exit()
	OS.logger("Pauline.lua exit\n")
	
	if pinv ~= nil then OS.removescript(pinv) end
	pinv = nil
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end
