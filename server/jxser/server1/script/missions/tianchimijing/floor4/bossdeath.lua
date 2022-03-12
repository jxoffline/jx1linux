Include("\\script\\lib\\droptemplet.lua")
Include("\\script\\lib\\awardtemplet.lua")
local nDistance = 20 * 20

function AnnounceLuckyAward(strAwardName)		
	local strMsg = format("Tæ ®éi cña <color=yellow>%s<color> ®· tiªu diÖt thµnh c«ng boss %s, giµnh ®­îc phÇn th­ëng ®Æc biÖt lµ <color=yellow>%s<color>", GetName(), "Hoµng Nhan Qu¶ng D­¬ng", strAwardName)
	Msg2Team(strMsg)			
	Msg2SubWorld(strMsg)
	AddGlobalNews(strMsg)	
end

function OnDeath(nNpcIndex,nBelongerIndex)
	local szName = GetNpcName(nNpcIndex)
	local nX, nY, nMapIndex = GetNpcPos(nNpcIndex)
	local nMapId = SubWorldIdx2ID(nMapIndex)
	if (szName ~= "Hoµng Nhan Qu¶ng D­¬ng" or nMapId ~= 947) then
		return
	end
	--§iÒu chØnh phÇn th­ëng r¬i ra tõ boss Hoµng Nhan Qu¶ng - Modified By ThanhLD - 20140422
	local tbAwardForNew = 
	{		
			[1] = {{szName="XÝch L©n LÖnh",tbProp={6,1,3393,1,0,0},nCount=1,nRate=0.4},},
			[2] = {{szName="M¶nh XÝch L©n",tbProp={6,1,3391,1,0,0},nCount=1,nRate=3},},
			[3] = {{szName="XÝch L©n Kim Bµi",tbProp={6,1,3392,1,0,0},nCount=1,nRate=4},},
			[4] = {{szName="XÝch L©n Tr¶o",tbProp={6,1,3394,1,0,0},nCount=1,nRate=7},},
			[5] = {{szName="XÝch L©n Gi¸c",tbProp={6,1,3395,1,0,0},nCount=1,nRate=4},},
			[6] = {{szName="XÝch L©n T×nh",tbProp={6,1,3396,1,0,0},nCount=1,nRate=2.5},},
			[7] = {{szName="B¹ch Hæ Ph¸t Qu¸n - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.6,tbParam={2,0,0,0,0,0},CallBack = function(nItemIdx, nPlayerIdx)AnnounceLuckyAward("B¹ch Hæ Ph¸t Qu¸n") end},},
			[8] = {{szName="B¹ch Hæ Kim Kh¶i - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.3,tbParam={6,0,0,0,0,0},CallBack = function(nItemIdx, nPlayerIdx)AnnounceLuckyAward("B¹ch Hæ Kim Kh¶i ") end},},
			[9] = {{szName="B¹ch Hæ Yªu §¸i - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.6,tbParam={5,0,0,0,0,0},CallBack = function(nItemIdx, nPlayerIdx)AnnounceLuckyAward("B¹ch Hæ Yªu §¸i ") end},},
			[10] = {{szName="B¹ch Hæ H¹ng Liªn - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.6,tbParam={1,0,0,0,0,0},CallBack = function(nItemIdx, nPlayerIdx)AnnounceLuckyAward("B¹ch Hæ H¹ng Liªn ") end},},
			[11] = {{szName="B¹ch Hæ Ngäc Béi - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.6,tbParam={9,0,0,0,0,0},CallBack = function(nItemIdx, nPlayerIdx)AnnounceLuckyAward("B¹ch Hæ Ngäc Béi ") end},},
			[12] = {{szName="B¹ch Hæ Hµi - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.6,tbParam={8,0,0,0,0,0},CallBack = function(nItemIdx, nPlayerIdx)AnnounceLuckyAward("B¹ch Hæ Hµi ") end},},
			[13] = {{szName="B¹ch Hæ Hé UyÓn - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.6,tbParam={4,0,0,0,0,0},CallBack = function(nItemIdx, nPlayerIdx)AnnounceLuckyAward("B¹ch Hæ Hé UyÓn ") end},},
			[14] = {{szName="B¹ch Hæ Th­îng Giíi ChØ - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.6,tbParam={3,0,0,0,0,0},CallBack = function(nItemIdx, nPlayerIdx)AnnounceLuckyAward("B¹ch Hæ Th­îng Giíi ChØ ") end},},
			[15] = {{szName="B¹ch Hæ H¹ Giíi ChØ - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.6,tbParam={10,0,0,0,0,0},CallBack = function(nItemIdx, nPlayerIdx)AnnounceLuckyAward("B¹ch Hæ H¹ Giíi ChØ ") end},},
			[16] = {{szName="B¹ch Hæ KhÝ Giíi - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.2,tbParam={7,0,0,0,0,0},CallBack = function(nItemIdx, nPlayerIdx)AnnounceLuckyAward("B¹ch Hæ KhÝ Giíi ") end},},
			[17] = {{szName="XÝch L©n Ph¸t Qu¸n - Tù chän hÖ ph¸i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.07,tbParam={2,0,0,0,0,0},CallBack = function(nItemIdx, nPlayerIdx)AnnounceLuckyAward("XÝch L©n Ph¸t Qu¸n ") end},},
			[18] = {{szName="XÝch L©n Kim Kh¶i - Tù chän hÖ ph¸i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.04,tbParam={6,0,0,0,0,0},CallBack = function(nItemIdx, nPlayerIdx)AnnounceLuckyAward("XÝch L©n Kim Kh¶i ") end},},
			[19] = {{szName="XÝch L©n Yªu §¸i - Tù chän hÖ ph¸i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.07,tbParam={5,0,0,0,0,0},CallBack = function(nItemIdx, nPlayerIdx)AnnounceLuckyAward("XÝch L©n Yªu §¸i ") end},},
			[20] = {{szName="XÝch L©n H¹ng Liªn - Tù chän hÖ ph¸i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.07,tbParam={1,0,0,0,0,0},CallBack = function(nItemIdx, nPlayerIdx)AnnounceLuckyAward("XÝch L©n H¹ng Liªn ") end},},
			[21] = {{szName="XÝch L©n Ngäc Béi - Tù chän hÖ ph¸i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.07,tbParam={9,0,0,0,0,0},CallBack = function(nItemIdx, nPlayerIdx)AnnounceLuckyAward("XÝch L©n Ngäc Béi ") end},},
			[22] = {{szName="XÝch L©n Hµi - Tù chän hÖ ph¸i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.07,tbParam={8,0,0,0,0,0},CallBack = function(nItemIdx, nPlayerIdx)AnnounceLuckyAward("XÝch L©n Hµi  ") end},},
			[23] = {{szName="XÝch L©n Hé UyÓn - Tù chän hÖ ph¸i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.07,tbParam={4,0,0,0,0,0},CallBack = function(nItemIdx, nPlayerIdx)AnnounceLuckyAward("XÝch L©n Hé UyÓn ") end},},
			[24] = {{szName="XÝch L©n Th­îng Giíi ChØ - Tù chän hÖ ph¸i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.06,tbParam={3,0,0,0,0,0},CallBack = function(nItemIdx, nPlayerIdx)AnnounceLuckyAward("XÝch L©n Th­îng Giíi ChØ ") end},},
			[25] = {{szName="XÝch L©n H¹ Giíi ChØ - Tù chän hÖ ph¸i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.06,tbParam={10,0,0,0,0,0},CallBack = function(nItemIdx, nPlayerIdx)AnnounceLuckyAward("XÝch L©n H¹ Giíi ChØ") end},},
			[26] = {{szName="XÝch L©n KhÝ Giíi - Tù chän hÖ ph¸i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.03,tbParam={7,0,0,0,0,0},CallBack = function(nItemIdx, nPlayerIdx)AnnounceLuckyAward("XÝch L©n KhÝ Giíi ") end},},
			[27] = {{szName="Cµn Kh«n Song TuyÖt Béi",tbProp={6,1,2219,1,0,0},nCount=1,nRate=0.6,nExpiredTime=43200},},
			[28] = {{szName="Cèng HiÕn LÔ bao",tbProp={6,1,30214,1,0,0},nCount=1,nRate=10,nExpiredTime=10080},},
			[29] = {{szName="KiÕn ThiÕt LÔ Bao",tbProp={6,1,30216,1,0,0},nCount=1,nRate=10,nExpiredTime=10080},},
			[30] = {{szName="ChiÕn BÞ LÔ Bao",tbProp={6,1,30218,1,0,0},nCount=1,nRate=10,nExpiredTime=10080},},
			[31] = {{szName="Bao D­îc hoµn ",tbProp={6,1,910,1,0,0},nCount=1,nRate=15,nExpiredTime=20160},},
			[32] = {{szName="B¹ch Hæ Trïng LuyÖn Ngäc",tbProp={6,1,3187,1,0,0},nCount=1,nRate=3},},
			[33] = {{szName="M¹c B¾c TruyÒn Tèng LÖnh",tbProp={6,1,1448,1,0,0},nCount=1,nRate=5,nExpiredTime=20160},},
			[34] = {{szName="Vâ L©m MËt TÞch",tbProp={6,1,26,1,0,0},nCount=1,nRate=5},},
			[35] = {{szName="TÈy Tñy Kinh",tbProp={6,1,22,1,0,0},nCount=1,nRate=5},},
			[36] = {{szName="Thiªn Linh §¬n",tbProp={6,1,3022,1,0,0},nCount=1,nRate=5,nExpiredTime=10080},},
			[37] = {{szName="§¹i lùc hoµn lÔ bao",tbProp={6,1,2517,1,0,0},nCount=1,nRate=7,nExpiredTime=10080},},
			[38] = {{szName="Phi tèc hoµn lÔ bao",tbProp={6,1,2520,1,0,0},nCount=1,nRate=7,nExpiredTime=10080},},
			[39] = {{szName="Qu¶ Hoµng Kim",tbProp={6,1,907,1,0,0},nCount=1,nRate=10,nExpiredTime=10080},},
			
	}
		
	local tbAwardForOld = 
	{
		{szName = "ChÝ T«n BÝ B¶o", tbProp = {6,1,2375,1,0,0}, nRate = 50},
		{szName = "Vâ L©m MËt TÞch", tbProp = {6,1,26,1,0,0}, nRate = 10},
		{szName = "TÈy Tñy Kinh", tbProp = {6,1,22,1,0,0}, nRate = 10},
		{szName = "Tö M·ng LÖnh", tbProp = {6,1,2350,1,0,0}, nRate = 0.5},
		{szName = "HuyÒn Viªn LÖnh", tbProp = {6, 1, 2351, 1, 0, 0}, nRate = 10},
		{szName = "Th­¬ng Lang LÖnh", tbProp = {6,1,2352,1,0,0}, nRate = 9.5},
		{szName = "Tiªn Th¶o Lé ®Æc biÖt", tbProp = {6,1,1181,1,0,0}, nRate = 10},		
	}
	--local nBelongerIndex = GetPlayerIndex(nNpcIndex)
	--DynamicExecuteByPlayer(nBelongerIndex, "\\script\\lib\\awardtemplet.lua", "tbAwardTemplet:GiveAwardByList", tbAwardForOld, "É±ËÀÌì³ØÃØ¾³ËÄ²ãbossÍêÑÕ¹ãÑô»ñµÃ½±Àø", 10)
	tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex, tbAwardForNew, "Boss tÇng 4 Thiªn Tr× MËt C¶nh r¬i ra", 1)
	local nOldPlayer = PlayerIndex
	local tbExpAward = {szName = "§iÓm Kinh NghiÖm", nExp = 20e6}
	local nNpcX, nNpcY, nNpcMapIdx = GetNpcPos(nNpcIndex) 
	if GetTeamSize() <= 1 then
		tbAwardTemplet:Give(tbExpAward, 1, {"ThienTriMatCanh", "KillBossExp"})
	else
		local nTeamSize = GetTeamSize()
		for i = 1, nTeamSize do
			PlayerIndex = GetTeamMember(i)
			local nX, nY, nMapIndex = GetPos()
			if PlayerIndex > 0 and GetLife(0) > 0 and CheckDistance(nNpcX, nNpcY, nX, nY) == 1 then
				tbAwardTemplet:Give(tbExpAward, 1, {"ThienTriMatCanh", "KillBossExp"})
			end
		end
	end
	PlayerIndex = nOldPlayer
end

function GetPlayerIndex(nNpcIndex)
	local nPlayerIndex = PlayerIndex
	local nTeamSize = CallPlayerFunction(nPlayerIndex, GetTeamSize)
	if nTeamSize == 0 then
		return nPlayerIndex
	else
		local tbTeamIndex = {}
		local nPlayerNum = 0
		local nNpcX, nNpcY, nNpcMapIdx = GetNpcPos(nNpcIndex)
		for i=1,nTeamSize do
			local nTeamMember = CallPlayerFunction(nPlayerIndex, GetTeamMember, i)
			local nX, nY, nMapIndex = CallPlayerFunction(nTeamMember, GetPos)
			if (nMapIndex >= 0 and nMapIndex == nNpcMapIdx) then			 
				if CheckDistance(nNpcX, nNpcY, nX, nY) == 1 then
					nPlayerNum = nPlayerNum + 1
					tbTeamIndex[nPlayerNum] = nTeamMember
				end		
			end
		end
		if nPlayerNum > 1 then
			local nRandomIdx = random(1, nPlayerNum)
			return tbTeamIndex[nRandomIdx]
		else
			return tbTeamIndex[1]
		end
	end
end

function CheckDistance(nX1, nY1, nX2, nY2)
	local nTempDis = ((nX1 - nX2)/32)^2 + ((nY1 - nY2)/32)^2
	if nTempDis <= %nDistance then
		return 1
	end
end