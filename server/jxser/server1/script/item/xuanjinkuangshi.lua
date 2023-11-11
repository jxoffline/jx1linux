Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

local tbAward = {
	[3153] = {
		{szName = "Huy“n Kim", tbProp = {6,1,3151,1,0,0}, nBindState = -2, nRate = 15,},
		{szName = "Huy“n Kim", tbProp = {6,1,3151,2,0,0}, nBindState = -2, nRate = 20,},
		{szName = "Huy“n Kim", tbProp = {6,1,3151,3,0,0}, nBindState = -2, nRate = 35,},
		{szName = "Huy“n Kim", tbProp = {6,1,3151,4,0,0}, nBindState = -2, nRate = 30,},
	},
	[3154] = {
		{szName = "Huy“n Kim", tbProp = {6,1,3151,2,0,0}, nBindState = -2, nRate = 10,},
		{szName = "Huy“n Kim", tbProp = {6,1,3151,3,0,0}, nBindState = -2, nRate = 20,},
		{szName = "Huy“n Kim", tbProp = {6,1,3151,4,0,0}, nBindState = -2, nRate = 50,},
		{szName = "Huy“n Kim", tbProp = {6,1,3151,5,0,0}, nBindState = -2, nRate = 15,},
		{szName = "Huy“n Kim", tbProp = {6,1,3151,6,0,0}, nBindState = -2, nRate = 5,},
	},
	[3155] = {
		{szName = "Huy“n Kim", tbProp = {6,1,3151,4,0,0}, nBindState = -2, nRate = 34,},
		{szName = "Huy“n Kim", tbProp = {6,1,3151,5,0,0}, nBindState = -2, nRate = 40,},
		{szName = "Huy“n Kim", tbProp = {6,1,3151,6,0,0}, nBindState = -2, nRate = 22,},
		{szName = "Huy“n Kim", tbProp = {6,1,3151,7,0,0}, nBindState = -2, nRate = 2,},
		{szName = "Huy“n Kim", tbProp = {6,1,3151,8,0,0}, nBindState = -2, nRate = 1,},
		{szName = "Huy“n Kim Chi Tinh", tbProp = {6,1,3152,1,0,0}, nBindState = -2, nRate = 1,},
	},
	[3156] = {
		{szName = "Huy“n Kim", tbProp = {6,1,3151,5,0,0}, nBindState = -2, nRate = 50,},
		{szName = "Huy“n Kim", tbProp = {6,1,3151,6,0,0}, nBindState = -2, nRate = 20.5,},
		{szName = "Huy“n Kim", tbProp = {6,1,3151,7,0,0}, nBindState = -2, nRate = 20,},
		{szName = "Huy“n Kim", tbProp = {6,1,3151,8,0,0}, nBindState = -2, nRate = 5,},
		{szName = "Huy“n Kim", tbProp = {6,1,3151,9,0,0}, nBindState = -2, nRate = 1,},
		{szName = "Huy“n Kim", tbProp = {6,1,3151,10,0,0}, nBindState = -2, nRate = 0.5,},
		{szName = "Huy“n Kim Chi Tinh", tbProp = {6,1,3152,1,0,0}, nBindState = -2, nRate = 3,},
	},
}

function main(nItemIndex)
	local nG, nD, nP = GetItemProp(nItemIndex)
	if %tbAward[nP] == nil then
		Talk(1, "", "ßπo cÙ b t th≠Íng, xin li™n h÷ Æ” gi∂i quy’t")
		return 1
	end
	if PlayerFunLib:CheckFreeBagCell(1, "default") ~= 1 then
		return 1
	end
	tbAwardTemplet:GiveAwardByList(%tbAward[nP], "MÎ Huy“n Kim Kho∏ng Thπch nhÀn Huy“n Kim")
end