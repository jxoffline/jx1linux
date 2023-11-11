Include("\\script\\activitysys\\npcdailog.lua")
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\missions\\zhaojingling\\head.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\objbuffer_head.lua")

local tbPaiMingAward = 
{
	[1] = 
	{
		nExp_tl = 20e6	
	},
	[2] = 
	{
		nExp_tl = 15e6
	},
	[3] = 
	{
		nExp_tl = 13e6
	},
	[4] = 
	{
		nExp_tl = 10e6
	},
	[5] = 
	{
		nExp_tl = 8e6
	},
	[6] = 
	{
		nExp_tl = 6e6
	},
	[7] = 
	{
		nExp_tl = 5e6
	},
	[8] = 
	{
		nExp_tl = 4e6
	},
	[9] = 
	{
		nExp_tl = 3e6
	},
	[10] = 
	{
		nExp_tl = 2e6
	},
}

local tbAllPaiMingAward = 
{
	[1]={
		[1]={szName="ChÝ T«n BÝ B¶o",tbProp={6,1,2375,1,0,0},nRate = 20.0,nCount = 3,},
		[2]={szName="Tµi B¶o Thñy TÆc",tbProp={6,1,2376,1,0,0},nRate = 40.0,nCount = 4,},
		[3]={nJxb=1,nRate = 20.0,nCount = 30000000,},
		[4]={nExp_tl=1,nRate = 20.0,nCount = 60000000,},
	},
	[2]={
		[1]={szName="ChÝ T«n BÝ B¶o",tbProp={6,1,2375,1,0,0},nRate = 20.0,nCount = 2,},
		[2]={szName="Tµi B¶o Thñy TÆc",tbProp={6,1,2376,1,0,0},nRate = 40.0,nCount = 3,},
		[3]={nJxb=1,nRate = 20.0,nCount = 24000000,},
		[4]={nExp_tl=1,nRate = 20.0,nCount = 48000000,},
	},
	[3]={
		[1]={
			[1]={szName="ChÝ T«n BÝ B¶o",tbProp={6,1,2375,1,0,0},},
			[2]={szName="Tµi B¶o Thñy TÆc",tbProp={6,1,2376,1,0,0},},
			nRate = 25.0,
		},
		[2]={szName="Tµi B¶o Thñy TÆc",tbProp={6,1,2376,1,0,0},nRate = 25.0,},
		[3]={nJxb=1,nRate = 25.0,nCount = 22000000,},
		[4]={nExp_tl=1,nRate = 25.0,nCount = 44000000,},
	},
	[4]={
		[1]={szName="Tµi B¶o Thñy TÆc",tbProp={6,1,2376,1,0,0},nRate = 33.0,nCount = 2,},
		[2]={nJxb=1,nRate = 33.0,nCount = 18000000,},
		[3]={nExp_tl=1,nRate = 34.0,nCount = 36000000,},
	},
	[5]={
		[1]={szName="Tµi B¶o Thñy TÆc",tbProp={6,1,2376,1,0,0},nRate = 33.0,nCount = 2,},
		[2]={nJxb=1,nRate = 33.0,nCount = 16000000,},
		[3]={nExp_tl=1,nRate = 34.0,nCount = 32000000,},
	},
	[6]={
		[1]={szName="ChÝ T«n BÝ B¶o",tbProp={6,1,2375,1,0,0},nRate = 33.0,},
		[2]={nJxb=1,nRate = 33.0,nCount = 12000000,},
		[3]={nExp_tl=1,nRate = 34.0,nCount = 24000000,},
	},
	[7]={
		[1]={szName="Tµi B¶o Thñy TÆc",tbProp={6,1,2376,1,0,0},nRate = 33.0,},
		[2]={nJxb=1,nRate = 33.0,nCount = 10000000,},
		[3]={nExp_tl=1,nRate = 34.0,nCount = 20000000,},
	},
	[8]={
		[1]={szName="Tµi B¶o Thñy TÆc",tbProp={6,1,2376,1,0,0},nRate = 33.0,},
		[2]={nJxb=1,nRate = 33.0,nCount = 8000000,},
		[3]={nExp_tl=1,nRate = 34.0,nCount = 16000000,},
	},
	[9]={
		[1]={nJxb=1,nRate = 50.0,nCount = 5000000,},
		[2]={nExp_tl=1,nRate = 50.0,nCount = 10000000,},
	},
	[10]={
		[1]={nJxb=1,nRate = 50.0,nCount = 3000000,},
		[2]={nExp_tl=1,nRate = 50.0,nCount = 6000000,},
	},
}

local szRemoteScript = "\\script\\event\\zhaojingling\\event.lua"

function dialogmain()
	local tbOpt = {}
	local szTitleMsg = "<npc>Chµng trai trÎ, ng­¬i muèn huÊn luyÖn n¨ng lùc ph¶n øng cña m×nh kh«ng? Thö t×m cµng nhiÒu <color=yellow> Méc Nh©n <color> nhÐ, sÏ nhËn ®­îc phÇn th­ëng"
	local szTitleMsg = format("%s, mçi ngµy ng­¬i chØ cã <color=yellow>%d<color>lÇn c¬ héi cã thÓ tham gia miÔn phÝ, cè g¾ng tËp luyÖn ®i nhÐ!", szTitleMsg, MAXGAMETIME)
	tinsert(tbOpt, {"Ta muèn thö xem", onok})
	tinsert(tbOpt, {"NhËn l·nh phÇn th­ëng", getaward})
--	tinsert(tbOpt, {"²é¿´Ç°Ò»ÌìµÄÇ°Ê®Ãû", querytopten})
	tinsert(tbOpt, {"VÒ viÖc huÊn luyÖn Méc Nh©n", detail})	
	tinsert(tbOpt, {"Ta hiÖn t¹i rÊt bËn, khi kh¸c sÏ quay l¹i.", oncancel})
	CreateNewSayEx(szTitleMsg, tbOpt)
end

function onok()
	local tbOpt = {}
	tinsert(tbOpt, {"§­îc!", wantjoin})
	tinsert(tbOpt, {"Ta cã viÖc gÊp, h·y ®îi ta tÝ", oncancel})
	CreateNewSayEx("<npc>Ng­¬i qua bªn kia chuÈn bÞ ®i, ®îi mét l¸t sÏ b¾t ®Çu chuÈn bÞ", tbOpt)
end

function wantjoin()
	if checkjoingame() ~= 1 then
		return
	end
	dojoingame()
end

function detail()
	local tbOpt = {}
	tinsert(tbOpt, {"Ta biÕt råi!", oncancel})
	CreateNewSayEx("<npc>HuÊn luyÖn Méc Nh©n mét trËn lµ<color=yellow>15<color> phót, trong ®ã cã<color=yellow>5<color> phót chuÈn bÞ, sau khi b¸o danh tham gia ng­¬i sÏ ®­îc ®­a ®Õn b¶n ®å chuÈn bÞ, sau khi ho¹t ®éng b¾t ®Çu ng­¬i  sÏ ®­îc ®­a vµo ®Êu tr­êng huÊn luyÖn,nÕu nh­ ë ®ã ng­¬I nh×n thÊy <color=yellow> Méc Nh©n<color>chØ cÇn dïng chuét<color=yellow> click chuét tr¸i <color> lªn nã lµ ®­îc, tuy nhiªn ng­¬I sÏ bÞ ng­êi ch¬i kh¸c c¶n trë, trong lóc nµy ng­¬i cã thÓ sö dông ®¹o cô ®Ó øng phã víi t×nh h×nh nh­ vËy, chØ cÇn ng­¬I t×m ®­îc nhiÒu <color=yellow> Méc Nh©n<color> sÏ nhËn ®­îc phÇn th­ëng ®¸ng kÓ", tbOpt)
end

function oncancel()
end

function checkjoingame()
	if PlayerFunLib:CheckTotalLevel(MINLEVEL, "CÊp 125 vµ cÊp 125 trë lªn hoÆc nh÷ng tr¸ng sü ®· trïng sinh míi ®­îc tham gia ho¹t ®éng Méc Nh©n nµy", ">=") ~= 1 then
		return
	end
	local nCurHour = tonumber(GetLocalDate("%H"))
	if nCurHour >= 0 and nCurHour < 12 then
		Talk(1, "", "Mçi ngµy vµo lóc 12:00 ®Õn 24:00 b¾t ®Çu ho¹t ®éng B¾t Méc Nh©n, hiÖn t¹i kh«ng ph¶i lµ thêi gian diÔn ra ho¹t ®éng")
		return
	end
	local nTimes = GetTaskA(TSK_PLAYTIMES, TSK_DAYKEY)
	if nTimes >= MAXGAMETIME then
		Talk(1, "", "Mçi ngµy chØ cã thÓ tham gia 3 trËn ®Êu, ngµy mai h·y ®Õn nhÐ")
		return
	end
	
	if GetTask(TSK_RANK) ~= 0 and GetTask(TSK_COUNT_ONETIME) > 0 then
		Talk(1, "", "CÇn ph¶i nhËn phÇn th­ëng cña trËn ngµy h«m qua míi tiÕp tôc tham gia ®­îc, nhanh ®i nhËn th­ëng ®i")
		return
	end

	return 1
end

function dojoingame()
	local nMapId, nX, nY = GetWorldPos()
	SetTask(TSK_LEAVERMAPID, nMapId)
	SetTask(TSK_LEAVERPOSX, nX)
	SetTask(TSK_LEAVERPOSY, nY)
	DynamicExecuteByPlayer(PlayerIndex, "\\script\\missions\\zhaojingling\\templet\\gametemplet.lua", "GameTemplet:MoveTo", PREPARE_MAP, POSPATH, 2, PREPAREPOSENDLINE)	
end

function getaward()
	local tbOpt = {}
	tinsert(tbOpt, {"NhËn th­ëng xÕp h¹ng mçi trËn", getonetimeaward})
	--Change request 14/7/2011 - Modified by DinhHQ - 20110714
--	tinsert(tbOpt, {"PhÇn th­ëng tæng xÕp h¹ng mçi ngµy", getallpaimingaward})
	CreateNewSayEx("<npc>H·y nhËn hÕt phÇn th­ëng cña trËn tr­íc ®ã råi mãi cã thÓ tiÕp tôc tham gia trËn tiÕp theo", tbOpt)		
end

function checkbox()
	local nWidth = 1
	local nHeight = 1
	local nCount = 2
	if CountFreeRoomByWH(nWidth, nHeight) >= nCount then
		return 1
	else
		local szMsg = format("§Ó b¶o ®¶m tµi s¶n cña ®¹i hiÖp, xin h·y ®Ó trèng %d %dx%d hµnh trang", nCount, nWidth, nHeight)
		Talk(1,"", szMsg)
		return
	end
end

function getonetimeaward()
	local nRank = GetTask(TSK_RANK)
	local nCount = GetTask(TSK_COUNT_ONETIME)
	if nRank <= 0 or nRank > 10 then
		Talk(1, "", "Kh«ng cã phÇn th­ëng ®Ó nhËn")
		return
	end
	if nCount <= 0 then
		Talk(1, "", "Kh«ng cã phÇn th­ëng ®Ó nhËn")
		return		
	end
	
	if checkbox() ~= 1 then
		return
	end
	tbAwardTemplet:GiveAwardByList(%tbPaiMingAward[nRank], "NhËn th­ëng xÕp h¹ng mçi trËn ho¹t ®éng Méc Nh©n")
	SetTask(TSK_RANK, 0)
end

function getallpaimingaward()
	local nIsAward = GetTaskA(TSK_IS_AWARD, TSK_IS_AWARD_DAYKEY)
	if nIsAward > 0 then
		Talk(1, "", "PhÇn th­ëng tæng xÕp h¹ng ®· nhËn råi")
		return
	end
	local obj = ObjBuffer:New()
	obj:Push(GetName())
	DynamicExecute("\\script\\missions\\zhaojingling\\enterdialog.lua",
		"RemoteExecute", %szRemoteScript, "tbJingLing:g2s_GetFormerPaiMing", obj.m_Handle, "receivepaiming", 0)
	obj:Destroy()		
end

function receivepaiming(nParam, ResultHandle)
	local szName = ObjBuffer:PopObject(ResultHandle)
	local nPaiMing = ObjBuffer:PopObject(ResultHandle)
	local nPlayerIndex = SearchPlayer(szName)
	if nPlayerIndex == nil or nPlayerIndex <= 0 then
		return
	end
	if nPaiMing ~= nil and nPaiMing <= 10 then
		if dogetallpaimingaward(nPlayerIndex, nPaiMing) == 1 then
			CallPlayerFunction(nPlayerIndex, AddTaskA, TSK_IS_AWARD, TSK_IS_AWARD_DAYKEY, 1)
			CallPlayerFunction(nPlayerIndex, Msg2Player, format("NhËn th­ëng tæng xÕp h¹ng thø %s", nPaiMing))
		end
	else
		CallPlayerFunction(nPlayerIndex, Talk, 1, "", "Kh«ng cã phÇn th­ëng ®Ó nhËn")
	end
end

function dogetallpaimingaward(nPlayerIndex, nPaiMing)
	if CallPlayerFunction(nPlayerIndex, checkbox) ~= 1 then
		return 
	end 
	CallPlayerFunction(nPlayerIndex, tbAwardTemplet.GiveAwardByList, tbAwardTemplet, %tbAllPaiMingAward[nPaiMing], "NhËn phÇn th­ëng  xÕp h¹ng mçi ngµy ho¹t ®éng Méc Nh©n")
	return 1
end

function querytopten()
	local obj = ObjBuffer:New()
	obj:Push(GetName())
	DynamicExecute("\\script\\missions\\zhaojingling\\enterdialog.lua",
		"RemoteExecute", %szRemoteScript, "tbJingLing:g2s_QueryTopTen", obj.m_Handle, "displaytopten", 0)
	obj:Destroy()			
end

function displaytopten(nParam, ResultHandle)
	local szName = ObjBuffer:PopObject(ResultHandle)
	local nPlayerIndex = SearchPlayer(szName)
	if nPlayerIndex == nil or nPlayerIndex <= 0 then
		return
	end
	
	local tbTopTen = ObjBuffer:PopObject(ResultHandle)
	if tbTopTen == nil then
		CallPlayerFunction(nPlayerIndex, Talk, 1, "", "Tr­íc m¾t vÉn ch­a cã xÕp h¹ng")
		return
	end
	local nCount = getn(tbTopTen)
	if nCount == 0 then
		CallPlayerFunction(nPlayerIndex, Talk, 1, "", "Tr­íc m¾t vÉn ch­a cã xÕp h¹ng")
		return
	end
	local szMsg = format("%-32s%-10s\n", "Tªn", "Sè ®iÓm")
	for i=1, nCount do
		local szTemp = format("%-32s%-10d\n", tbTopTen[i][1], tbTopTen[i][2])
		szMsg = szMsg.. szTemp
	end
	CallPlayerFunction(nPlayerIndex, CreateNewSayEx, szMsg, {{"KÕt thóc ®èi tho¹i"}})
end


