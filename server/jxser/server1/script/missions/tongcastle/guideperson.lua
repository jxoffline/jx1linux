Include("\\script\\activitysys\\npcdailog.lua")
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\lib\\common.lua")
Include("\\script\\lib\\objbuffer_head.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\global\\autoexec_head.lua")
Include("\\script\\missions\\tongcastle\\tongcastle.lua")

--3399¸öÈËÉñÄ¾µã
TSK_TREEPOINT = 3399

local tbTreeItem = {
	[1] = {szName = "Thanh §ång ThÇn Méc LÖnh", nId = 3205, nPrice = 10,},
	[2] = {szName = "B¹ch Ng©n ThÇn Méc LÖnh", nId = 3206, nPrice = 100,},
	[3] = {szName = "Hoµng Kim ThÇn Méc LÖnh", nId = 3207, nPrice = 1000,},
}
--(nÎªÕ¼Áì³ÇÊÐ:·ïÏè 1,³É¶¼ 2,´óÀí 3,ãê¾© 4,ÏåÑô 5,ÑïÖÝ 6,ÁÙ°² 7)
local tbCity = {
	[1]   = {1,	978},
	[11]  = {2,	979},
	[162] = {3, 980},
	[37] 	= {4, 981},
	[78] 	= {5,	982},
	[80] 	= {6, 983}, 
	[176] = {7, 984},
}

local tbTranPos = {
	{1638, 3851},
	{1647, 3174},
	{917,	3106},
	{983, 3884},
}

local tbGuideNpc = 
{
		szName = "Ng­êi chØ dÉn bang héi thµnh b¶o",
		nNpcId = 108,
		nLevel = 95,
		tbPos = 
		{		
				{176, 1663, 3262,},
				{11, 3191, 5188,},
				{78, 1592, 3373,},
				{1, 1647, 3276,},
				{162, 1689, 3268,},
				{37, 1701, 3216,},
				{80, 1720, 3217,},
		},
		szScriptPath = "\\script\\missions\\tongcastle\\guideperson.lua",
}

local tbGuideNpcInside = 
{
		szName = "Ng­êi chØ dÉn bang héi thµnh b¶o",
		nNpcId = 108,
		nLevel = 95,
		tbPos = 
		{		
			{978,1093,3223},
			{978,1029,3285},
			{978,1050,3718},
			{978,1114,3780},
			{978,1506,3766},
			{978,1572,3704},
			{978,1562,3321},
			{978,1499,3260},
			{978,1331,3492},

			{979,1093,3223},
			{979,1029,3285},
			{979,1050,3718},
			{979,1114,3780},
			{979,1506,3766},
			{979,1572,3704},
			{979,1562,3321},
			{979,1499,3260},
			{979,1331,3492},

			{980,1093,3223},
			{980,1029,3285},
			{980,1050,3718},
			{980,1114,3780},
			{980,1506,3766},
			{980,1572,3704},
			{980,1562,3321},
			{980,1499,3260},
			{980,1331,3492},

			{981,1093,3223},
			{981,1029,3285},
			{981,1050,3718},
			{981,1114,3780},
			{981,1506,3766},
			{981,1572,3704},
			{981,1562,3321},
			{981,1499,3260},
			{981,1331,3492},

			{982,1093,3223},
			{982,1029,3285},
			{982,1050,3718},
			{982,1114,3780},
			{982,1506,3766},
			{982,1572,3704},
			{982,1562,3321},
			{982,1499,3260},
			{982,1331,3492},
			
			{983,1093,3223},
			{983,1029,3285},
			{983,1050,3718},
			{983,1114,3780},
			{983,1506,3766},
			{983,1572,3704},
			{983,1562,3321},
			{983,1499,3260},
			{983,1331,3492},

			{984,1093,3223},
			{984,1029,3285},
			{984,1050,3718},
			{984,1114,3780},
			{984,1506,3766},
			{984,1572,3704},
			{984,1562,3321},
			{984,1499,3260},
			{984,1331,3492},
		},
		szScriptPath = "\\script\\missions\\tongcastle\\guideperson_inside.lua",
}
local szDlgText = "<npc>Chµo c¸c b¹n, t«i lµ ng­êi chØ dÉn bang héi thµnh b¶o"
szDlgText = szDlgText.."<enter>1. Thêi gian më Thµnh B¶o Bang Héi lµ tõ 18:00 ®Õn 01:00 thø 4, thø 7, chñ nhËt hµng tuÇn, trong ®ã Nh©n Tù Phßng më 18:00, §Þa Tù Phßng më 20:00, Thiªn Tù Phßng më 23:40 më."
szDlgText = szDlgText.."<enter>2. Nh÷ng thµnh viªn chiÕm lÜnh Thµnh B¶o cã thÓ ®øng gÇn c¹nh ThÇn Thô sö dông TriÖu Håi Phï triÖu håi ra Thñ VÖ, mua Thñ VÖ TriÖu Håi Phï cÇn cã 300 ®iÓm ThÇn Méc. "
function main()
	local nNpcIndex = GetLastDiagNpc()
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end

	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = %szDlgText
	tbDailog:AddOptEntry("Ta muèn vµo bang héi thµnh b¶o thµnh nµy", EnterCastle, {nNpcIndex})
	tbDailog:AddOptEntry("Ta muèn nhËn ThÇn Méc LÖnh", ExchangeTreePoint, {})
	tbDailog:AddOptEntry("Ta muèn nhËn bang héi thµnh b¶o Thñ VÖ triÖu håi  phï", ApplyGuardToken)
	tbDailog:AddOptEntry("Ta muèn xem sè ®iÓm thÇn méc cña m×nh", GetTreePoint)
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog)
	tbDailog:Show()
end

function GetTreePoint()
	local nTreePoint = GetTask(TSK_TREEPOINT)
	Talk(1, "", format("Sè ®iÓm thÇn méc cña ng­¬i lµ %d ®iÓm", nTreePoint))
end

function ApplyGuardToken()
	g_AskClientNumberEx(1, 100, "NhËp vµo sè l­îng muèn nhËn", {GiveGuardToken, {}})
end

function GiveGuardToken(nCount)
	local nPrice = 200
	local nTreePoint = GetTask(TSK_TREEPOINT)
	if CalcFreeItemCellCount() < ceil(nCount/50) then
		Talk(1, "", "Chç trèng hµnh trang kh«ng ®ñ.")
		return
	end
	if nTreePoint < nPrice*nCount then
		Talk(1, "", "§iÓm thÇn méc cña ng­¬i kh«ng ®ñ")
		return
	end
	SetTask(TSK_TREEPOINT, nTreePoint-nPrice*nCount)
	local tbAward = {
		{szName = "Bang héi thµnh b¶o Thñ VÖ triÖu håi phï", tbProp = {6, 1, 3204, 1, 0, 0}, nCount = nCount,},
	}
	tbAwardTemplet:GiveAwardByList(tbAward, "NhËn ®­îc bang héi thµnh b¶o Thñ VÖ triÖu håi phï")
end

function CreateGuideNpc()
	local tbNpc = %tbGuideNpc
	local nPosPathCount = getn(%tbGuideNpc.tbPos)
	for i = 1, nPosPathCount do
		local nMapId, nX, nY = unpack(%tbGuideNpc.tbPos[i])
		basemission_CallNpc(tbNpc, nMapId, nX*32, nY*32)
	end
end

function CreateGuideNpcInside()
	local tbNpc = %tbGuideNpcInside
	local nPosPathCount = getn(%tbGuideNpcInside.tbPos)
	for i = 1, nPosPathCount do
		local nMapId, nX, nY = unpack(%tbGuideNpcInside.tbPos[i])
		basemission_CallNpc(tbNpc, nMapId, nX*32, nY*32)
	end
end

function EnterCastle(nNpcIndex)
	local szTongName = GetTongName()
	if szTongName == nil or szTongName == "" then
		Talk(1, "", "Ng­¬i vÉn ch­a gia nhËp bang héi, kh«ng thÓ vµo")
		return
	end
	local nX32,nY32, nMapIndex = GetNpcPos(nNpcIndex)
	local nMapId = SubWorldIdx2ID(nMapIndex)
	local nCityId = %tbCity[nMapId][1]
	local szCityTong, _ = GetCityOwner(nCityId)
	if szCityTong == nil or szCityTong == "" then
		Talk(1, "", "Thµnh nµy t¹m thêi kh«ng cã bang héi chiÕm gi÷, kh«ng thÓ vµo bang héi thµnh b¶o thµnh nµy")
		return
	end
	local nWeek = tonumber(GetLocalDate("%w"))
	local bOpend = TongCastle:IsInOpenTime("personroom")
	if not bOpend then
		--Talk(1, "", "½ñÌì¾ÙÐÐÆß³Ç´óÕ½£¬°ï»á³Ç±¤ÔÝÊ±¹Ø±Õ¡£")
		Talk(1, "", "Thêi gian më Thµnh B¶o Bang Héi lµ tõ 18:00 ®Õn 01:00 thø 4, thø 7, chñ nhËt hµng tuÇn, c¸c thêi gian kh¸c ngoµi thêi gian trªn th× kh«ng thÓ ®I vµo.")
		return
	end
	local nTransMapId = %tbCity[nMapId][2]
	local szTongName = GetTongName()
	local _, nTmpX, nTmpY = GetWorldPos()
	SetTempRevPos(nMapId, nTmpX*32, nTmpY*32)	
	if szCityTong == szTongName then
		NewWorld(nTransMapId, 1311, 3515)
	else
		local nX, nY = unpack(%tbTranPos[random(1, getn(%tbTranPos))])
		NewWorld(nTransMapId, nX, nY)
	end
end

function ExchangeTreePoint()
	local nX32,nY32, nMapIndex = GetNpcPos(nNpcIndex)
	local nMapId = SubWorldIdx2ID(nMapIndex)
	local szTongMaster = GetTongMaster()
	local szTongName = GetTongName()
	local szPlayerName = GetName()
	if szTongMaster ~= szPlayerName then
		Talk(1, "", "ChØ cã bang chñ míi  cã thÓ sö dông tÝnh n¨ng nµy")
		return
	end
	local handle = OB_Create()
	ObjBuffer:PushObject(handle, szPlayerName)
	ObjBuffer:PushObject(handle, nMapId)
	ObjBuffer:PushObject(handle, szTongName)
	RemoteExecute("\\script\\mission\\tongcastle\\tongcastle.lua", "tbS3TongCastle:GetCurTreePoint", handle)
	OB_Release(handle)
end


function ExchangeDialog(ParamHandle)
	local szPlayerName = ObjBuffer:PopObject(ParamHandle)
	local nMapId = ObjBuffer:PopObject(ParamHandle)
	local nSumTreePoint = ObjBuffer:PopObject(ParamHandle)
	local nPlayerIndex = SearchPlayer(szPlayerName)
	if nPlayerIndex > 0 then
		local szTitle = format("Sè ®iÓm thÇn méc bang héi cßn l¹i:%d", nSumTreePoint)
		local nMaxCount = 100
		local tbOpt = {}
		for i = 1, getn(%tbTreeItem) do
			local szOption = format("NhËn %s", %tbTreeItem[i].szName)
			tinsert(tbOpt, {szOption, g_AskClientNumberEx, {1, nMaxCount, "NhËp vµo sè l­îng muèn nhËn", {ApplyTreeToken, {nMapId, i, %tbTreeItem[i].nPrice}}}})
		end
		tinsert(tbOpt, {"KÕt thóc ®èi tho¹i"})
		CallPlayerFunction(nPlayerIndex, CreateNewSayEx, szTitle, tbOpt)
	end
end

function ApplyTreeToken(nMapId, nType, nPrice, nCount)
	if CalcFreeItemCellCount() < ceil(nCount/50) then
		Talk(1, "", "Chç trèng hµnh trang kh«ng ®ñ.")
		return
	end
	local szPlayerName = GetName()
	local szTongName = GetTongName()
	local handle = OB_Create()
	ObjBuffer:PushObject(handle, szPlayerName)
	ObjBuffer:PushObject(handle, nMapId)
	ObjBuffer:PushObject(handle, nPrice)
	ObjBuffer:PushObject(handle, nCount)
	ObjBuffer:PushObject(handle, nType)
	ObjBuffer:PushObject(handle, szTongName)
	RemoteExecute("\\script\\mission\\tongcastle\\tongcastle.lua", "tbS3TongCastle:DelTreePoint", handle)
	OB_Release(handle)
end

function GiveTreeToken(ParamHandle)
	local szPlayerName = ObjBuffer:PopObject(ParamHandle)
	local nMapId = ObjBuffer:PopObject(ParamHandle)
	local nCount = ObjBuffer:PopObject(ParamHandle)
	local nType = ObjBuffer:PopObject(ParamHandle)
	local nPlayerIndex = SearchPlayer(szPlayerName)
	if nPlayerIndex > 0 then
		if nCount <= 0 then
			CallPlayerFunction(nPlayerIndex, Talk, 1, "", "§iÓm thÇn méc kh«ng ®ñ, kh«ng thÓ ®æi lÖnh bµi")
		else
			local szItemName = %tbTreeItem[nType].szName
			local nItemId = %tbTreeItem[nType].nId
		 	local tbAward = {
		 		{szName = szItemName, tbProp = {6, 1, nItemId, 1, 0, 0}, nCount = nCount,},
		 	}
		 	CallPlayerFunction(nPlayerIndex, tbAwardTemplet.GiveAwardByList, tbAwardTemplet, tbAward, format("NhËn ®­îc %s", szItemName))
		end
	end
end

--(nÎªÕ¼Áì³ÇÊÐ:·ïÏè 1,³É¶¼ 2,´óÀí 3,ãê¾© 4,ÏåÑô 5,ÑïÖÝ 6,ÁÙ°² 7)
function TestGetCurTreePoint()
	local szTongName = GetTongName()
	if szTongName == nil or szTongName == "" then
		Msg2Player("Kh«ng cã bang héi")
		return
	end
	local szPlayerName = GetName()
	local handle = OB_Create()
	ObjBuffer:PushObject(handle, szPlayerName)
	ObjBuffer:PushObject(handle, szTongName)
	RemoteExecute("\\script\\mission\\tongcastle\\tongcastle.lua", "tbS3TongCastle:TestGetCurTreePoint", handle)
	OB_Release(handle)
end

function TestShowTreePoint(ParamHandle)
	local szPlayerName = ObjBuffer:PopObject(ParamHandle)
	local nSumTreePoint = ObjBuffer:PopObject(ParamHandle)
	local nPlayerIndex = SearchPlayer(szPlayerName)
	if nPlayerIndex > 0 then
		CallPlayerFunction(nPlayerIndex, Msg2Player, format("<color=yellow>%d<color>®iÓm thÇn méc hiÖn t¹i", nSumTreePoint))
	end
end

function TestGetTongTreePoint()
	local szTongName = GetTongName()
	if szTongName == nil or szTongName == "" then
		Msg2Player("Kh«ng cã bang héi")
		return
	end
	local szPlayerName = GetName()
	local handle = OB_Create()
	ObjBuffer:PushObject(handle, szPlayerName)
	ObjBuffer:PushObject(handle, szTongName)
	RemoteExecute("\\script\\mission\\tongcastle\\tongcastle.lua", "tbS3TongCastle:TestGetTreePoint", handle)
	OB_Release(handle)
end

function ResHaha(ParamHandle)
	local szPlayerName = ObjBuffer:PopObject(ParamHandle)
	local szMsg = ObjBuffer:PopObject(ParamHandle)
	local nPlayerIndex = SearchPlayer(szPlayerName)
	if nPlayerIndex > 0 then
		CallPlayerFunction(nPlayerIndex, Msg2Player, szMsg)
	end
end

--AutoFunctions:Add(CreateGuideNpc)
--AutoFunctions:Add(CreateGuideNpcInside)
