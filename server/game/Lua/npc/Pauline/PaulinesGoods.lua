-- globals
pinvX = 0
pinvcontainerX = pinvX + 91/windowedmodifier
pinvcontainerY = 116/windowedmodifier
--locals
local invback
--local invcash 
local xhandle = nil
local sextype = gender -- later get this someplace

-- inventory interface

-- some button functions
--require 'PaulinesGoods_func'

local buttypes = {
--female outfits
	{"f_outfit_1",buyoutfit,"gui","ipf_chest001.tga"},
	--{"f_outfit_2",buyoutfit,"gui","ipf_chest002.tga"},
	{"f_outfit_3",buyoutfit,"gui","ipf_chest003.tga"},
	--{"f_outfit_4",buyoutfit,"gui","ipf_chest004.tga"},
	--{"f_outfit_5",buyoutfit,"gui","ipf_chest005.tga"},
	--{"f_outfit_6",buyoutfit,"gui","ipf_chest006.tga"},
	--{"f_outfit_7",buyoutfit,"gui","ipf_chest007.tga"},
	--{"f_outfit_8",buyoutfit,"gui","ipf_chest008.tga"},
	--{"f_outfit_9",buyoutfit,"gui","ipf_chest009.tga"},
	{"f_outfit_10",buyoutfit,"gui","ipf_chest010.tga"},
	{"f_outfit_11",buyoutfit,"gui","ipf_chest011.tga"},
	{"f_outfit_12",buyoutfit,"gui","ipf_chest012.tga"},
	--{"f_outfit_13",buyoutfit,"gui","ipf_chest013.tga"},
	{"f_outfit_14",buyoutfit,"gui","ipf_chest014.tga"},
	--{"f_outfit_15",buyoutfit,"gui","ipf_chest015.tga"},
	{"f_outfit_16",buyoutfit,"gui","ipf_chest016.tga"},
	{"f_outfit_17",buyoutfit,"gui","ipf_chest017.tga"},
	--{"f_outfit_18",buyoutfit,"gui","ipf_chest018.tga"},
	--{"f_outfit_19",buyoutfit,"gui","ipf_chest019.tga"},
	--{"f_outfit_20",buyoutfit,"gui","ipf_chest020.tga"},
	{"f_outfit_21",buyoutfit,"gui","ipf_chest021.tga"},
	{"f_outfit_22",buyoutfit,"gui","ipf_chest022.tga"},
	{"f_outfit_23",buyoutfit,"gui","ipf_chest023.tga"},
	--{"f_outfit_24",buyoutfit,"gui","ipf_chest024.tga"},
	--{"f_outfit_25",buyoutfit,"gui","ipf_chest025.tga"},
	--{"f_outfit_26",buyoutfit,"gui","ipf_chest026.tga"},
	--{"f_outfit_27",buyoutfit,"gui","ipf_chest027.tga"},
	--{"f_outfit_28",buyoutfit,"gui","ipf_chest028.tga"},
	--{"f_outfit_29",buyoutfit,"gui","ipf_chest029.tga"},
	--{"f_outfit_30",buyoutfit,"gui","ipf_chest030.tga"},
	{"f_outfit_31",buyoutfit,"gui","ipf_chest031.tga"},
	--{"f_outfit_32",buyoutfit,"gui","ipf_chest032.tga"},

--male outfits
	{"m_outfit_1",buyoutfit,"gui","ipm_chest001.tga"},
	--{"m_outfit_2",buyoutfit,"gui","ipm_chest002.tga"},
	{"m_outfit_3",buyoutfit,"gui","ipm_chest003.tga"},
	{"m_outfit_4",buyoutfit,"gui","ipm_chest004.tga"},
	--{"m_outfit_5",buyoutfit,"gui","ipm_chest005.tga"},
	--{"m_outfit_6",buyoutfit,"gui","ipm_chest006.tga"},
	--{"m_outfit_7",buyoutfit,"gui","ipm_chest007.tga"},
	{"m_outfit_8",buyoutfit,"gui","ipm_chest008.tga"},
	{"m_outfit_9",buyoutfit,"gui","ipm_chest009.tga"},
	--{"m_outfit_10",buyoutfit,"gui","ipm_chest010.tga"},
	{"m_outfit_11",buyoutfit,"gui","ipm_chest011.tga"},
	{"m_outfit_12",buyoutfit,"gui","ipm_chest012.tga"},
	{"m_outfit_13",buyoutfit,"gui","ipm_chest013.tga"},
	--{"m_outfit_14",buyoutfit,"gui","ipm_chest014.tga"},
	--{"m_outfit_15",buyoutfit,"gui","ipm_chest015.tga"},
	--{"m_outfit_16",buyoutfit,"gui","ipm_chest016.tga"},
	{"m_outfit_17",buyoutfit,"gui","ipm_chest017.tga"},
	{"m_outfit_18",buyoutfit,"gui","ipm_chest018.tga"},
	--{"m_outfit_19",buyoutfit,"gui","ipm_chest019.tga"},
	--{"m_outfit_20",buyoutfit,"gui","ipm_chest020.tga"},
	{"m_outfit_21",buyoutfit,"gui","ipm_chest021.tga"},
	{"m_outfit_22",buyoutfit,"gui","ipm_chest022.tga"},
	--{"m_outfit_23",buyoutfit,"gui","ipm_chest023.tga"},
	{"m_outfit_24",buyoutfit,"gui","ipm_chest024.tga"},
	--{"m_outfit_25",buyoutfit,"gui","ipm_chest025.tga"},
	--{"m_outfit_26",buyoutfit,"gui","ipm_chest026.tga"},
	{"m_outfit_27",buyoutfit,"gui","ipm_chest027.tga"},
	--{"m_outfit_28",buyoutfit,"gui","ipm_chest028.tga"},
	--{"m_outfit_29",buyoutfit,"gui","ipm_chest029.tga"},
	--{"m_outfit_30",buyoutfit,"gui","ipm_chest030.tga"},
	{"m_outfit_31",buyoutfit,"gui","ipm_chest031.tga"}
}

local maleclothes = { 
	{"moutfit1","m_outfit_1",25,  1,"Casual Outfit",nil,nil,nil},
	{"moutfit3","m_outfit_3",25,  3,"Casual Outfit",nil,nil,nil},
	{"moutfit4","m_outfit_4",25,  4,"Casual Outfit",nil,nil,nil},
	--{"moutfit5","m_outfit_5",25,  5,"Casual Outfit",nil,nil,nil},
	--{"moutfit6","m_outfit_6",25,  6,"Casual Outfit",nil,nil,nil},
	--{"moutfit7","m_outfit_7",25,  7,"Casual Outfit",nil,nil,nil},
	{"moutfit8","m_outfit_8",25,  8,"Casual Outfit",nil,nil,nil},
	{"moutfit9","m_outfit_9",25,  9,"Casual Outfit",nil,nil,nil},
	{"moutfit11","m_outfit_11",100, 11,"Business Outfit",nil,nil,nil},
	{"moutfit12","m_outfit_12",100, 12,"Business Outfit",nil,nil,nil},
	{"moutfit13","m_outfit_13",100, 13,"Business Outfit",nil,nil,nil},
	--{"moutfit15","m_outfit_15",100, 15,"Business Outfit",nil,nil,nil},
	{"moutfit17","m_outfit_17",100, 17,"Business Outfit",nil,nil,nil},
	{"moutfit18","m_outfit_18",100, 18,"Business Outfit",nil,nil,nil},
	{"moutfit21","m_outfit_21",50, 21,"Spiffy Outfit",nil,nil,nil},
	{"moutfit22","m_outfit_22",50, 22,"Spiffy Outfit",nil,nil,nil},
	--{"moutfit23","m_outfit_23",50, 23,"Spiffy Outfit",nil,nil,nil},
	{"moutfit24","m_outfit_24",50, 24,"Spiffy Outfit",nil,nil,nil},
	{"moutfit27","m_outfit_27",50, 27,"Spiffy Outfit",nil,nil,nil},
	--{"moutfit28","m_outfit_28",50, 28,"Spiffy Outfit",nil,nil,nil},
	{"moutfit31","m_outfit_31",25, 31,"Casual Outfit",nil,nil,nil},
}

local femaleclothes = {
	{"foutfit1","f_outfit_1",25,   1,"Casual Outfit",nil,nil,nil},
	{"foutfit3","f_outfit_3",25,   3,"Casual Outfit",nil,nil,nil},
--	{"foutfit4","f_outfit_4",25,   4,"Casual Outfit",nil,nil,nil},
--	{"foutfit5","f_outfit_5",25,   5,"Casual Outfit",nil,nil,nil},
--	{"foutfit6","f_outfit_6",25,   6,"Casual Outfit",nil,nil,nil},
--	{"foutfit8","f_outfit_8",25,   8,"Casual Outfit",nil,nil,nil},
--	{"foutfit9","f_outfit_9",25,   9,"Casual Outfit",nil,nil,nil},
	{"foutfit10","f_outfit_10",25, 10,"Casual Outfit",nil,nil,nil},
	{"foutfit11","f_outfit_11",100, 11,"Business Outfit",nil,nil,nil},
	{"foutfit12","f_outfit_12",100, 12,"Business Outfit",nil,nil,nil},
--	{"foutfit13","f_outfit_13",100, 13,"Business Outfit",nil,nil,nil},
	{"foutfit14","f_outfit_14",100, 14,"Business Outfit",nil,nil,nil},
--	{"foutfit15","f_outfit_15",100, 15,"Business Outfit",nil,nil,nil},
	{"foutfit16","f_outfit_16",100, 16,"Business Outfit",nil,nil,nil},
	{"foutfit17","f_outfit_17",100, 17,"Business Outfit",nil,nil,nil},
	{"foutfit21","f_outfit_21",50, 21,"Spiffy Outfit",nil,nil,nil},
	{"foutfit22","f_outfit_22",50, 22,"Spiffy Outfit",nil,nil,nil},
	{"foutfit23","f_outfit_23",50, 23,"Spiffy Outfit",nil,nil,nil},
--	{"foutfit24","f_outfit_24",50, 24,"Spiffy Outfit",nil,nil,nil},
--	{"foutfit25","f_outfit_25",50, 25,"Spiffy Outfit",nil,nil,nil},
--	{"foutfit27","f_outfit_27",50, 27,"Spiffy Outfit",nil,nil,nil},
	{"foutfit31","f_outfit_31",25, 31,"Casual Outfit",nil,nil,nil},
}

function findtype(typename)
	local idx= 1
	
	while buttypes[idx] do
		if buttypes[idx][1]==typename then
			break
		end
		idx = idx + 1
	end
	
	if not buttypes[idx] then
		OS.errorexit("can't find '%s'",typename)
	end
	
	return buttypes[idx]
end

-- locals
local infobox
local inventsize = 5
local buttonarray = {}
local backtracetype = {}
local backtraceglobal = {}
local nbuttonarray = 0

--[[ this functions job is to take a set of globals and construct what you have in the form of buttons ]]

function scaninventory()
	local i = 1
	local j = 1
	for i=1,nbuttonarray do
		OS.shaperemove(buttonarray[i])
	end
	buttonarray=nil
	nbuttonarray = 0
	buttonarray = {}
	backtracetype = {}
	backtraceglobal = {}
	local idx = 1
	local instock = {}
	
	if sextype == SEXTYPE_MALE then instock = maleclothes end
	if sextype == SEXTYPE_FEMALE then instock = femaleclothes end
	
	while instock[idx] do
		--if instock[idx][1] then
	  		nbuttonarray = nbuttonarray + 1
			ft = findtype(instock[idx][2])
			buttonarray[nbuttonarray]=OS.buttonaddS(
			  pinvcontainerX + 66/	windowedmodifier*(i-1),pinvcontainerY+66/windowedmodifier*(j-1),
			  64/windowedmodifier,64/windowedmodifier,
			  {0,0,0,.8},ft[3],ft[4],"") --,instock[idx][2])
	  		backtracetype[nbuttonarray] = ft
	  		backtraceglobal[nbuttonarray] = instock[idx]
	  		i = i + 1
	  		if i>inventsize then
	  			i = 1
	  			j = j + 1
			end
		--end
		idx = idx + 1
	end
end

local shoptimer = os.clock() + 1

function init()

-- all others are false or nil ( or 0?)
	scaninventory()
	--invcash = OS.dialogadd(pinvX + (324/windowedmodifier),452/windowedmodifier,100/windowedmodifier,40/windowedmodifier,{1,0,0,0})
	--OS.dialogaddstrB(invcash,0,0,string.format("$%d",playercash),blue)
	paulines = true
	invback = OS.backgndadd(pinvX,0,512/windowedmodifier,512/windowedmodifier,{0,0,0,1},"gui","pnl_store.tga")		
	xhandle = OS.buttonadd(pinvcontainerX+250,1,16,16,{0,0,0,1},"gui","ctl_btn_x")
	OS.changepriority(xhandle,4)
end

function proc()
	local i
	local but
	
	if examinetext then
		OS.dialogremove(examinetext)
		examinetext = nil
	end
	
	if os.clock() > shoptimer then
		for i=1,nbuttonarray do
	
			local mx,my,mc,muc,mbut,mhover = OS.shapemouseinfo(buttonarray[i])		
			if mhover == 1 then
				examine(backtraceglobal[i][5],backtraceglobal[i][1],backtraceglobal[i][3])
			end
		
			but = OS.buttongetval(buttonarray[i])
			if but then
				backtracetype[i][2](backtraceglobal[i][3],backtraceglobal[i][1],but,
								backtraceglobal[i][4],backtraceglobal[i][5],backtraceglobal[i][6],backtraceglobal[i][7],backtraceglobal[i][8])
			end
		end
	end
	if OS.buttongetval(xhandle) then -- user pressed x, fix me!
		closepshop() -- calls to pauline telling her to shut us down!
	end		
end

function exit()
	OS.shaperemove(infobox)
	infobox = nil
	paulines = nil
	local i
	for i=1,nbuttonarray do
		OS.shaperemove(buttonarray[i])
	end
	
	if xhandle then
		OS.shaperemove(xhandle)
		xhandle = nil
	end

	buttonarray=nil
	OS.shaperemove(invback)
	invback = nil
	--OS.dialogremove(invcash)
	--invcash = nil
end
