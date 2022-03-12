Include("\\script\\missions\\datusha\\datusha.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\log.lua")
IncludeLib("SETTING")
COST_MONEY = 100000
MAX_AWARD_COUNT = 100
DaTuShaRankAward = 
{
	[1] = 8e6,
	[2] = 7e6,
	[3] = 6e6,
	[4] = 5e6,
	[5] = 45e5,
	[6] = 4e6,
	[7] = 35e5,
	[8] = 3e6,
	[9] = 25e5,
	[10] = 15e5,
}
LastManAward = 
{
	[1]={szName="§å Phæ Tö M·ng Kh«i",tbProp={6,1,2714,1,0,0},nRate = 2.0,},
	[2]={szName="§å Phæ Tö M·ng Y",tbProp={6,1,2715,1,0,0},nRate = 2.0,},
	[3]={szName="§å Phæ Tö M·ng Yªu §¸i",tbProp={6,1,2717,1,0,0},nRate = 2.0,},
	[4]={szName="§å Phæ Tö M·ng Hé UyÓn",tbProp={6,1,2718,1,0,0},nRate = 2.0,},
	[5]={szName="§å Phæ Tö M·ng Béi",tbProp={6,1,2720,1,0,0},nRate = 2.0,},	
	[6]={szName="§å Phæ Tö M·ng Hµi",tbProp={6,1,2716,1,0,0},nRate = 2.0,},	
	[7]={szName="§å Phæ Tö M·ng H¹ng Liªn",tbProp={6,1,2719,1,0,0},nRate = 2.0,},	
	[8]={szName="§å Phæ Tö M·ng Th­îng Giíi ChØ",tbProp={6,1,2721,1,0,0},nRate = 0.5,},	
	[9]={szName="§å Phæ Tö M·ng H¹ Giíi ChØ",tbProp={6,1,2722,1,0,0},nRate = 0.5,},	
	[10]={szName="§å Phæ Tö M·ng KhÝ Giíi",tbProp={6,1,2723,1,0,0},nRate = 0.5,},
	[11]={szName="Tö M·ng LÖnh",tbProp={6,1,2350,1,0,0},nCount=1,nRate=0.5},
	[12]={szName="Qu¶ Hoµng Kim",tbProp={6,1,907,1,0,0},nCount=1,nRate=19, nExpiredTime = 10080},	
	[13]={nExp_tl=1,nRate = 65,nCount = 10000000,},	
}

TotalRankAward = 
{
	{
		{nExp_tl = 32e6},
		{
			{szName="Cµn Kh«n Song TuyÖt Béi",tbProp={6,1,2219,1,0,0},nRate = 5.0, nExpiredTime = 43200}
		}
	},
	{nExp_tl = 28e6},
	{nExp_tl = 24e6},
	{nExp_tl = 20e6},
	{nExp_tl = 18e6},
	{nExp_tl = 16e6},
	{nExp_tl = 14e6},
	{nExp_tl = 12e6},
	{nExp_tl = 10e6},
	{nExp_tl = 8e6},
}
function DaTuShaClass:Join()
	local pDungeon = DungeonList[896]
	if pDungeon then
		local nMapId, nX, nY = GetWorldPos()
		pDungeon.tbPlayer[GetName()] = {tbSignUpPos={nMapId, nX, nY}}
		
		pDungeon:GotoDaTuSha();
	end
end

function about(nStep)
	
	local szTitle = ""
	local tbOpt = {}	
	if nStep == 0 then
		szTitle = "<npc>Thêi gian ho¹t ®éng mçi ngµy vµo lóc 12:00, 19:00, 20:00, 21:00, tÊt c¶ ng­êi ch¬i cÊp 120 trë lªn cã thÓ ®Õn b¸o danh víi ta, thêi gian b¸o danh lµ 10 phót, b¸o danh cÇn ph¶i giao nép 10 v¹n l­îng. Sau khi ho¹t ®éng b¾t ®Çu cã thÓ sö dông kü n¨ng cña b¶n th©n ®Ó tham chiÕn, thêi gian lo¹n chiÕn lµ 30 phót, mçi mét ng­êi ®Òu cã 5 c¬ héi phôc sinh, sau khi ho¹t ®éng kÕt thóc c¨n cø vµo ®iÓm tÝch lòy ®Ó nhËn th­ëng."
		tinsert(tbOpt, {"Cöu Ch©u Cèc lµ mét n¬i nh­ thÕ nµo", about, {1}})
		tinsert(tbOpt, {"Cã phÇn th­ëng g× kh«ng", about, {2}})
	elseif nStep == 1 then
		szTitle = "<npc>Cöu Ch©u Cèc lµ mét n¬i bÝ mËt mµ mÊy n¨m gÇn ®©y triÒu ®×nh dïng ®Ó huÊn luyÖn nh÷ng ®¹i néi cao thñ, trong Cèc c¨n cø vµo tªn gäi cña ng­êi x­a lµ Cöu Ch©u ®Ó chia thµnh 9 khu vùc. Sau khi b¾t ®Çu tØ vâ, b¾t ®Çu tõ thø 3, c¸ch nhau 3 phót, sÏ cã 1 khu vùc bÞ b¨ng hµn ngµn n¨m bao bäc l¹i, nÕu nh­ kh«ng kÞp thêi ch¹y tho¸t khái n¬i ®ã sÏ bÞ ®ãng b¨ng mµ chÕt. §Õn phót thø 30 nÕu nh­ kh«ng ph©n th¾ng b¹i t×m ra ng­êi cuèi cïng, tÊt c¶ nh÷ng ng­êi ë trong Cèc ®Òu bÞ ®ãng b¨ng. Trong Cèc quanh n¨m ®µy ®Æc s­¬ng mï vµ gi¸ l¹nh. Hçn chiÕn ë trong gi¸ l¹nh ®ã võa bÞ b¨ng gi¸ uy hiÕp võa nguy hiÓm v« cïng."
		tinsert(tbOpt, {"§èi tho¹i trë l¹i tÇng tr­íc", about, {0}})	
	elseif nStep == 2 then
		szTitle = "<npc>Mçi l­ît ho¹t ®éng cã thÓ c¨n cø theo ®iÓm tÝch lòy cña l­ît nµy ®Ó nhËn th­ëng; nÕu nh­ ng­¬i lµ ng­êi cuèi cïng duy nhÊt trong l­ît nµy “ H¹nh Tån Gi¶”, còng cã thÓ nhËn ®­îc phÇn th­ëng v­ît møc cña “ Dòng Sü Cuèi Cïng”. Mçi ngµy sÏ c¨n cø vµo ®iÓm tÝch lòy mµ ng­¬i nhËn ®­îc trong ngµy ®Ó tiÕn hµnh xÕp h¹ng, sÏ th­ëng phÇn th­ëng dòng sü cña b¶ng xÕp h¹ng top 10."
		tinsert(tbOpt, {"§èi tho¹i trë l¹i tÇng tr­íc", about, {0}})
	end
	tinsert(tbOpt, {"KÕt thóc ®èi tho¹i"})
	CreateNewSayEx(szTitle, tbOpt)	
end

function check_rank()
	
	local szMsg = format("Tæng ®iÓm tÝch lòy cña ng­¬i lµ <color=green>%d<color><enter>", GetPlayerTotalScores())
	
	local szName, nValue = Ladder_GetLadderInfo(LadderId, 1);
	
	if (szName == nil or szName == "" or nValue == nil) then
		return Talk(1, "", szMsg.."T¹m thêi ch­a cã b¶ng xÕp h¹ng top 10.")
	end
	
	szMsg = szMsg.."B¶ng xÕp h¹ng top 10: <enter>"	
	szMsg = szMsg..format("%s%s%s<enter>", strfill_center("Thø h¹ng", 6, " "), strfill_center("Tªn", 10, " "), strfill_center("Tæng tÝch lòy", 8, " "))
	for i=1, 10 do
		local szName, nValue = Ladder_GetLadderInfo(LadderId, i);
		if szName and szName ~= "" and nValue > 0 then
			szMsg = szMsg..format("%s%s%s<enter>", strfill_center(tostring(i), 6, " "), strfill_center(szName, 10, " "), strfill_center(tostring(nValue), 8, " "))
		end
	end
	local tbOpt = 
	{
		{"Trë l¹i", dialog_main},
		{"KÕt thóc ®èi tho¹i"},
	}
	CreateNewSayEx("<npc>"..szMsg, tbOpt)
end

function round_award()
	local pDungeon = DungeonList[MAP_ID]
	if pDungeon then
		return Talk(1, "", "§ang trong thêi gian tû vâ kh«ng thÓ nhËn th­ëng")
	end
	if not DaTuShaClass.Rank then
		return
	end
	local szCurName = GetName()
	if DaTuShaClass.Scores[szCurName] == nil or DaTuShaClass.Scores[szCurName] == 0 then
		return Talk(1, "", "Ng­¬i vÉn ch­a tham gia thÝ luyÖn Cöu Ch©u Cèc")
	end
	
	if DaTuShaClass.Scores[szCurName] < 0 then
		return Talk(1, "", "§¹i hiÖp ®· nhËn phÇn th­ëng nµy råi.")
	end
	local nCount = getn(DaTuShaClass.Rank)
	if nCount > MAX_AWARD_COUNT then
		nCount = MAX_AWARD_COUNT
	end
	local nRank = nil
	for i=1, nCount do
		local szName = DaTuShaClass.Rank[i][1]
		if (szCurName == szName) then
			nRank = i
			break
		end
	end
	if nRank then
		Msg2Player(format("XÕp h¹ng trËn nµy cña ng­¬i lµ %d, ®©y lµ phÇn th­ëng tÆng cho ng­¬i xin h·y nhËn lÊy.", nRank))
		local nAwardCount = getn(DaTuShaRankAward)
		local nExp = DaTuShaRankAward[nRank]
		if nRank > nAwardCount then
			nExp = DaTuShaRankAward[nAwardCount]
		end
		if nExp then
			tbAwardTemplet:Give({nExp_tl = nExp}, 1, {"Lo¹n ChiÕn Cöu Ch©u Cèc","PhÇn th­ëng cè ®Þnh"})
			DaTuShaClass.Scores[szCurName] = -1
		end
	else
		 Talk(1, "", format("XÕp h¹ng cña ng­¬i trong trËn nµy kh«ng n»m trong %d danh s¸ch", MAX_AWARD_COUNT))
	end	
end

function last_man_award()
	local LastMan = DaTuShaClass.LastMan
	if LastMan and LastMan.szName and LastMan.szName == GetName() and LastMan.bFlag == nil then
		if CalcFreeItemCellCount() < 1 then
			return Talk(1, "",  format("Hµnh trang cÇn <color=yellow>%d<color> « trèng.", 1))
		end
		
		tbAwardTemplet:Give(LastManAward, 1, {"Lo¹n ChiÕn Cöu Ch©u Cèc","PhÇn th­ëng cña dòng sü cuèi cïng"})
		LastMan.bFlag = 1
	else
		Talk(1, "", "Ng­¬i kh«ng phï hîp víi ®iÒu kiÖn nhËn th­ëng hoÆc lµ ®· nhËn th­ëng råi.")
	end
end

function final_award()
	local nHour = tonumber(GetLocalDate("%H"))
	local nDate = tonumber(GetLocalDate("%Y%m%d"))
	
	if not(nHour > 21 and nHour < 24) then
		return Talk(1, "", "HiÖn t¹i kh«ng ph¶i lµ thêi gian nhËn th­ëng tæng xÕp h¹ng.")
	end
	if GetTask(TSK_FINAL_AWARD) == nDate then
		return Talk(1, "", "§¹i hiÖp ®· nhËn phÇn th­ëng nµy råi.")
	end
	
	if CalcFreeItemCellCount() < 1 then
		return Talk(1, "",  format("Hµnh trang cÇn <color=yellow>%d<color> « trèng.", 1))
	end
	
	local nRank = nil
	for i=1, 10 do
		local szName, nValue = Ladder_GetLadderInfo(LadderId, i);
		if szName == GetName() and nValue > 0 then
			nRank = i
			break
		end
	end
	if nRank and TotalRankAward[nRank] then
		tbAwardTemplet:Give(TotalRankAward[nRank], 1, {"Lo¹n ChiÕn Cöu Ch©u Cèc","PhÇn th­ëng cña dòng sü cuèi cïng"})
		SetTask(TSK_FINAL_AWARD, nDate)
	else
		return Talk(1, "", "Ng­¬i kh«ng n»m trong top 10 b¶ng xÕp h¹ng.")
	end
end

function give_award()
	local szTitle = "<npc>Mçi l­ît ho¹t ®éng cã thÓ c¨n cø theo ®iÓm tÝch lòy cña l­ît nµy ®Ó nhËn th­ëng; nÕu nh­ ng­¬i lµ ng­êi cuèi cïng duy nhÊt trong l­ît nµy “ H¹nh Tån Gi¶”, còng cã thÓ nhËn ®­îc phÇn th­ëng v­ît møc cña “ Dòng Sü Cuèi Cïng”. Mçi ngµy sÏ c¨n cø vµo ®iÓm tÝch lòy mµ ng­¬i nhËn ®­îc trong ngµy ®Ó tiÕn hµnh xÕp h¹ng, sÏ th­ëng phÇn th­ëng dòng sü cña b¶ng xÕp h¹ng top 10."
	local tbOpt = 
	{
		
		{"Ta ®Õn nhËn th­ëng cña mçi trËn", round_award},
		{"Ta ®Õn nhËn th­ëngphÇn th­ëng cña [dòng sü cuèi cïng]" ,last_man_award},
		{"Ta ®Õn nhËn phÇn th­ëng tæng tÝch lòy", final_award},
		{"KÕt thóc ®èi tho¹i"},
	}
	
	CreateNewSayEx(szTitle, tbOpt)
end

function join_datusha()
	local pDungeon = DungeonList[MAP_ID]
	if pDungeon then
		if pDungeon.nState ~= 1 then
			return
		end
	else
		return
	end
	if (ST_GetTransLifeCount() <= 0 and GetLevel() < 120) then
		return Msg2Player(format("CÊp ph¶i ®¹t ®Õn <color=yellow>%d<color>.", 120))
	end
	--Change request July 13, 2011 - Modified by DinhHQ - 20110713
--	if Pay(COST_MONEY) ~= 1 then
--		return Talk(1, "", format("CÇn ph¶i giao nép %d l­îng phÝ b¸o danh", COST_MONEY))
--	end
	if PlayerFunLib:GetTaskDailyCount(2710) >= 1 then
		if (CalcItemCount(-1, 6, 1, 30117, -1) < 1 or ConsumeEquiproomItem(1, 6, 1, 30117, 1) ~= 1) then
			Talk(1, "", "Ng­¬i ®· tham gia mét lÇn miÔn phÝ råi, lÇn nµy tham gia cÇn ph¶i cã 1 Cöu Ch©u LÖnh")
			return
		else
			tbLog:PlayerActionLog("LoanChienCuuChauCoc","TruThanhCong1CuuChauLenh")
		end
	end
	PlayerFunLib:AddTaskDaily(2710, 1)
	pDungeon.tbPlayer[GetName()] = {}
	local nMapId, nX, nY = GetWorldPos()
	pDungeon.tbPlayer[GetName()].tbSignUpPos = {nMapId, nX, nY}
	DynamicExecuteByPlayer(PlayerIndex, "\\script\\huoyuedu\\huoyuedu.lua", "tbHuoYueDu:AddHuoYueDu", "luanzhanjiuzhou")
	pDungeon:GotoDaTuSha()
	--Ghi log tÝnh n¨ng key - Modified By DinhHQ -20120410
	if PlayerFunLib:GetTaskDailyCount(2710) == 1 then
		tbLog:PlayerActionLog("TinhNangKey","BaoDanhLoanChienCuuChauCocMienPhi")
	else
		tbLog:PlayerActionLog("TinhNangKey","BaoDanhLoanChienCuuChauCocThuPhi")
	end
end

function dialog_main()
	local szTitle = "<npc>§Ó chän ra nh÷ng nh©n tµi cho qu©n ®éi, triÒu ®×nh ®· quyÕt ®Þnh tuyÓn chän trong d©n chóng nh÷ng cao thñ trÝ dòng song toµn. Hoan nghªnh c¸c ch­ vÞ ®Õn tham gia b¸o danh."
	local tbOpt = 
	{
		{"Liªn quan ®Õn Lo¹n ChiÕn Cöu Ch©u Cèc", about, {0}},
		{"Ta muèn kiÓm tra xem tæng tÝch lòy vµ top 10 cña ta", check_rank},
		{"Ta ®Õn ®Ó nhËn th­ëng", give_award},
		{"Ta chØ qua ®­êng mµ th«i"},
	}
	local pDungeon = DungeonList[MAP_ID]
	if pDungeon then
		if pDungeon.nState == 1 then
			tinsert(tbOpt, 1, {"B¸o danh tham gia Lo¹n ChiÕn Cöu Ch©u Cèc", join_datusha, {}})
		end
	end
	
	
	CreateNewSayEx(szTitle, tbOpt)	
end

EventSys:GetType("AddNpcOption"):Reg("Ch­ëng §¨ng Cung N÷", "Lo¹n ChiÕn Cöu Ch©u Cèc", dialog_main)