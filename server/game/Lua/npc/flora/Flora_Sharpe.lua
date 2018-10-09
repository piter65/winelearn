-- Flora_Sharpe
local npchandle = nil		-- display npc handle
local dialoghandle = nil	-- display dialog handle
local place = 0				-- where in the conversation you are
local dialogtext = require 'Flora_Sharpe\\rnd_vgdaught'

if week == 1 then
	dialogtext = require 'Flora_Sharpe\\nlc_math'
elseif week == 2 then
	dialogtext = require 'Flora_Sharpe\\nlc_math2'
elseif week == 3 then
	dialogtext = require 'Flora_Sharpe\\nlc_math3'
elseif week == 4 then
	dialogtext = require 'Flora_Sharpe\\nlc_math4'
end

function init()
	OS.logger("Flora_Sharpe.lua init\n")

	OS.SetDir("npc//Flora_Sharpe//model")
		npchandle = NPC.add("Flora_Sharpe","Flora_Sharpe.bws")
	OS.PopDir()

	NPC.setvis(npchandle,0)

	NPC.playanim(npchandle,1)

	NPC.setanimse(npchandle,0,10,70,1)
end

function proc()
	local np
	
	if npc_master(npchandle) > 0 then return end

	np = npc_mousecheck(npchandle)
	npc_tooltip("Flora Sharpe - 4th Grader\n",np,112,32)
	
	place,dialoghandle = npc_dodialognoturn(dialoghandle,dialogtext,npchandle,place,np)
	
	npc_animate(npchandle)
end

function exit()
	OS.logger("Flora_Sharpe.lua exit\n")
	
	npc_release(npchandle)
	npc_closedialog(dialoghandle)

	npchandle = nil
	place = 0
	indialog = 0
end
