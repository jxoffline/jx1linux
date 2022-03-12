Include("\\script\\activitysys\\config\\1029\\head.lua")
Include("\\script\\lib\\log.lua")

pActivity.EVENT_LOG_TITLE = "Shangyuetuanyuan"
local nEndDate = floor(pActivity.nEndDate / 10000)
local ITEM = {}
local AWARD = {}

pActivity.ITEM = ITEM
pActivity.AWARD = AWARD
pActivity.MIN_LEVEL = 30

pActivity.TASK = {
	LvDouMoonCake = 1,
	LianZiMoonCake = 2,
	JiRouMoonCake = 3,
}

pActivity.MaxLvDouMoonCake = 68
pActivity.MaxLianZiMoonCake = 68
pActivity.MaxJiRouMoonCake = 68


local pAnnouce1 = function(tbItem, nCount)
	local szMsg = format("Chóc mõng hiÖp sÜ %s hû kÕt tiªn duyªn, ë %s gÆp Thá Ngäc Tiªn Tö, Thá Ngäc Tiªn Tö thÊy hiÖp sÜ rÊt %s quen m¾t, ®Æc biÖt tÆng %d tiÒn v¹n!", GetName(), SubWorldName(SubWorld), GetName(), tbItem.nCount)
	AddGlobalNews(szMsg)
end

local pAnnouce2 = function(tbItem, nCount)
	local szMsg = format("Chóc mõng hiÖp sÜ %s hû kÕt tiªn duyªn, t¹i %s gÆp gì Thá Ngäc Tiªn Tö, nhËn ®­îc quµ tÆng cña Thá Tiªn %d tiÒn v¹n.", GetName(), SubWorldName(SubWorld), tbItem.nCount)
	AddGlobalNews(szMsg)
end

local pLog = function(tbItem, nCount)
	%tbLog:PlayerActionLog(tbItem.EVENT_LOG_TITLE, tbItem.szLog)
end

pActivity.tbYuTu = {
	Param_Id = 1,
	Param_Finish = 2,
	nTime = 600 * 18,
	szName = "Thá Ngäc Tiªn tö",
	nId = 2132,
	
	Question = {
		{
			szQuestion = "<npc> Vâ L©m TruyÒn Kú n¨m nµo cã mÆt ë ViÖt Nam?",
			Candidate = {"A. N¨m 2004", "B. N¨m 2005", "C. N¨m 2006"},
			nAnswer = 2,
		},
		{
			szQuestion = "<npc> Vâ L©m TruyÒn Kú cã tÊt c¶ bao nhiªu m«n ph¸i?",
			Candidate = {"A. 9", "B. 8", "C. 10"},
			nAnswer = 3,
		},
		{
			szQuestion = "<npc> Trong Vâ L©m TruyÒn Kú, hai m«n ph¸i nµo thuéc hÖ háa?",
			Candidate = {"A. C¸i Bang vµ Thiªn V­¬ng", "B. C¸i Bang vµ Thiªn NhÉn ", "C. C«n L«n vµ Thiªn NhÉn "},
			nAnswer = 2,
		},
	},
	tbTooLate = {
		szTitle = "<npc> VÞ hiÖp sÜ nµy ®· chËm mét b­íc, ®· cã hiÖp sÜ may m¾n tr¶ lêi ®óng c©u hái cña ta vµ nhËn ®­îc phÇn th­ëng råi.",
		tbOpt = {{" §ãng"}},
	},
	tbWrongAnswer = {
		szTitle = "<npc> VÞ hiÖp sÜ nµy tr¶ lêi kh«ng ®óng råi! H·y nghÜ cÈn thËn råi tr¶ lêi ta nhÐ!",
		tbOpt = {{" §ãng"}},
	},
}

ITEM.LvDouMoonCake = {szName="B¸nh ®Ëu xanh", tbProp={6,1,1510,1,0,0}, nExpiredTime=nEndDate}
ITEM.LianZiMoonCake = {szName="B¸nh h¹t sen", tbProp={6,1,1511,1,0,0}, nExpiredTime=nEndDate}
ITEM.JiRouMoonCake = {szName="B¸nh Trung Thu gµ n­íng", tbProp={6,1,1512,1,0,0}, nExpiredTime=nEndDate}
ITEM.Fen = {szName="Bét", tbProp={6,1,1503,1,0,0}, nExpiredTime=nEndDate}
ITEM.Tang = {szName=" §­êng tinh", tbProp={6,1,1504,1,0,0}, nExpiredTime=nEndDate}
ITEM.Egg = {szName=" Trøng gµ", tbProp={6,1,1505,1,0,0},  nExpiredTime=nEndDate}
ITEM.LvDou = {szName="§Ëu xanh", tbProp={6,1,1506,1,0,0}, nExpiredTime=nEndDate}

AWARD["5xMap"] = {
	{szName=ITEM.Fen.szName,	tbProp=ITEM.Fen.tbProp,		nExpiredTime=nEndDate, nCount=1, nRate=0.4},
	{szName=ITEM.Tang.szName,	tbProp=ITEM.Tang.tbProp,	nExpiredTime=nEndDate, nCount=1, nRate=0.2},
	{szName=ITEM.Egg.szName,	tbProp=ITEM.Egg.tbProp,		nExpiredTime=nEndDate, nCount=1, nRate=0.1},
}

AWARD["6xMap"] = {
	{szName=ITEM.Fen.szName,	tbProp=ITEM.Fen.tbProp,		nExpiredTime=nEndDate, nCount=1, nRate=0.4},
	{szName=ITEM.Tang.szName,	tbProp=ITEM.Tang.tbProp,	nExpiredTime=nEndDate, nCount=1, nRate=0.2},
	{szName=ITEM.Egg.szName,	tbProp=ITEM.Egg.tbProp,		nExpiredTime=nEndDate, nCount=1, nRate=0.1},
}

AWARD["7xMap"] = {
	{szName=ITEM.Fen.szName,	tbProp=ITEM.Fen.tbProp,		nExpiredTime=nEndDate, nCount=1, nRate=0.5},
	{szName=ITEM.Tang.szName,	tbProp=ITEM.Tang.tbProp,	nExpiredTime=nEndDate, nCount=1, nRate=0.3},
	{szName=ITEM.Egg.szName,	tbProp=ITEM.Egg.tbProp,		nExpiredTime=nEndDate, nCount=1, nRate=0.2},
}

AWARD["8xMap"] = {
	{szName=ITEM.Fen.szName,	tbProp=ITEM.Fen.tbProp,		nExpiredTime=nEndDate, nCount=1, nRate=0.8},
	{szName=ITEM.Tang.szName,	tbProp=ITEM.Tang.tbProp,	nExpiredTime=nEndDate, nCount=1, nRate=0.6},
	{szName=ITEM.Egg.szName,	tbProp=ITEM.Egg.tbProp,		nExpiredTime=nEndDate, nCount=1, nRate=0.5},
}

AWARD["9xMap"] = {
	{szName=ITEM.Fen.szName,	tbProp=ITEM.Fen.tbProp,		nExpiredTime=nEndDate, nCount=1, nRate=1.5},
	{szName=ITEM.Tang.szName,	tbProp=ITEM.Tang.tbProp,	nExpiredTime=nEndDate, nCount=1, nRate=1.2},
	{szName=ITEM.Egg.szName,	tbProp=ITEM.Egg.tbProp,		nExpiredTime=nEndDate, nCount=1, nRate=1.0},
}

AWARD["CompseLvDouMoonCake"] = {
	{tbProp=ITEM.LvDouMoonCake.tbProp,		nExpiredTime=nEndDate, nCount=1, nRate=100.0},
}

AWARD["CompseLianZiMoonCake"] = {
	{tbProp=ITEM.LvDouMoonCake.tbProp,		nExpiredTime=nEndDate, nCount=1,  nRate=30.0},
	{
		nRate=70.0;
		{tbProp=ITEM.LianZiMoonCake.tbProp,		nExpiredTime=nEndDate, nCount=1},
		{pFun=pLog, szLog="Chenggongshengjilianziyuebing", EVENT_LOG_TITLE=pActivity.EVENT_LOG_TITLE},
	},
			
}

AWARD["CompseJiRouMoonCake"] = {
	{tbProp=ITEM.LianZiMoonCake.tbProp,		nExpiredTime=nEndDate, nCount=1, nRate=55.0},
	{
		nRate=45.0;
		{tbProp=ITEM.JiRouMoonCake.tbProp,		nExpiredTime=nEndDate, nCount=1},
		{pFun=pLog, szLog="Chenggongshengjikaojiyuebing", EVENT_LOG_TITLE=pActivity.EVENT_LOG_TITLE},
	},
}

AWARD["UseLvDouMoonCake"] = {
	{nExp=20000, nRate=100},
}

AWARD["UseLianZiMoonCake"] = {
	{nExp=40000, nRate=95.0},
	{tbProp={6,1,1097,1,0,0}, nRate=5.0},
}

AWARD["UseJiRouMoonCake"] = {
	{nExp=100000, nRate=85.0},
	{nExp=150000, nRate=14.9},
	{tbProp={6,1,1817,1,0,0}, nRate=0.1},
}

AWARD["YuTuAward"] = {
	{	nRate=0.01,
		[1] = {nJxb=888888},
		[2] = {pFun=pAnnouce1, nCount=888888},
	},
	{	nRate=1.0,
		[1] = {nJxb=388888},
		[2] = {pFun=pAnnouce1, nCount=388888},
	},
	{	nRate=10.0,
		[1] = {nJxb=268888},
		[2] = {pFun=pAnnouce2, nCount=268888},
	},
	{	nRate=20.0,
		[1] = {nJxb=168888},
		[2] = {pFun=pAnnouce2, nCount=168888},
	},
	{	nRate=38.09,
		[1] = {nJxb=88888},
		[2] = {pFun=pAnnouce2, nCount=88888},
	},
	{	nRate=30.90,
		[1] = {nJxb=38888},
		[2] = {pFun=pAnnouce2, nCount=38888},
	},
}