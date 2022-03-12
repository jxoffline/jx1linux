
Include("\\script\\event\\other\\xunmashu\\class.lua")
Include("\\script\\lib\\awardtemplet.lua")
IncludeLib("FILESYS")

IL("LEAGUE")
local _ShowMsg2All = function(nItemIndex)
	local szItemName = GetItemName(nItemIndex)
	local szMsg = format("Cao thñ <color=green>%s<color> ®· thu ®­îc <color=green>%s<color>.Xin ®­îc chóc mõng!", GetName(), szItemName)
	AddGlobalNews(szMsg)
	LG_ApplyDoScript(0, "", "", "\\script\\event\\card.lua", "colork_bless_anywhere", szMsg, "", "")
end

local _AddCurExp = function(self, nItemCount, szLogTitle)
	
	local nExp = self.nParam * nItemCount;
	local nRate = 1e6
	
	local nRemainExp = (tbXunMaShu0903.tbTask.nMaxExpFromOther - tbXunMaShu0903.tbTask:GetCurExpFromOther()) * nRate
	
	
	if nRemainExp < nExp then
		nExp = nRemainExp
		Msg2Player(format("§· ®¹t ®Õn kinh nghiÖm cao nhÊt, lÇn nµy chØ thu ®­îc %d kinh nghiÖm.", nExp))
	end
	if nExp > 0 then
		tbAwardTemplet:GiveAwardByList({nExp = nExp}, szLogTitle)
		tbXunMaShu0903.tbTask:AddCurExpFromOther(floor(nExp/1e6))
	end
end

local _LoadItemAwardFromFile = function (szPath)
	
	if TabFile_Load(szPath, szPath) == 0 then
		_tbSilverBoxItemAward = nil;
		WriteLog(format("[%s]\t Load setting file is fail","award silver box"))
		return 0;
	end
	_tbSilverBoxItemAward = {}
	local nCount = TabFile_GetRowCount(szPath)
	
	nTotalRate	= TabFile_GetCell(szPath, nCount, "nRate")
	for i = 2, nCount-2 do --×îºóÒ»¸ö²»¶Á£¬Îª²»ÖÐ½±
		local tbItem = {}
		tbItem.szName	= TabFile_GetCell(szPath, i, "szName")
		tbItem.nQuality	= tonumber(TabFile_GetCell(szPath, i, "nQuality"))
		
		tbItem.tbProp		= {}
		tbItem.tbProp[1]	= tonumber(TabFile_GetCell(szPath, i, "nItemGenre"))
		tbItem.tbProp[2]	= tonumber(TabFile_GetCell(szPath, i, "nDetailType"))
		tbItem.tbProp[3]	= tonumber(TabFile_GetCell(szPath, i, "nParticularType"))
		tbItem.tbProp[4]	= tonumber(TabFile_GetCell(szPath, i, "nLevel"))
		tbItem.tbProp[5]	= tonumber(TabFile_GetCell(szPath, i, "nSeries"))
		tbItem.tbProp[6]	= tonumber(TabFile_GetCell(szPath, i, "nLuckly"))
		
		tbItem.nRate = (tonumber(TabFile_GetCell(szPath, i, "nRate")) / nTotalRate) * 100
		
		tinsert(_tbSilverBoxItemAward, i-1, tbItem)
	end
	--_tbSilverBoxItemAward.nTotalRate = nTotalRate
end


local _CheckItemAward = function()
	local nTotalRate = 0
	for i=1, getn(_tbSilverBoxItemAward) do
		local tbItem = _tbSilverBoxItemAward[i]
		nTotalRate = nTotalRate + floor(tbItem.nRate*10000000/100)
	end
	
end

if not _tbSilverBoxItemAward or getn(_tbSilverBoxItemAward) == 0 then
	
	_LoadItemAwardFromFile("\\settings\\event\\shenmibaoxiang\\shenmibaoiangaward.txt")
	_tbSilverBoxItemAward[1].CallBack = _ShowMsg2All
	
	_tbSilverBoxItemAward[3].CallBack = _ShowMsg2All
	
	_tbSilverBoxItemAward[4].CallBack = _ShowMsg2All
	
	--_CheckItemAward()
end



local tbExpAward = 
{
	{pFun = _AddCurExp, nParam = 20e6, nRate = 2},
	{pFun = _AddCurExp, nParam = 15e6, nRate = 5},
	{pFun = _AddCurExp, nParam = 10e6, nRate = 34},
	{pFun = _AddCurExp, nParam = 5e6, nRate = 59},
}



function main(nItemIndex)
	
	
	if not _tbSilverBoxItemAward or getn(_tbSilverBoxItemAward) == 0 then
		WriteLog(format("[%s]\t Load setting file is failed forbit use","award silver box"))
		return 1
	end
	
	if GetItemParam(nItemIndex, 1) ~= 0 and GetItemParam(nItemIndex, 1) <= tonumber(GetLocalDate("%Y%m%d")) then
		Talk(1,"", "VËt phÈm nµy ®· hÕt h¹n")
		return 0
	end
	
	local bRet, szFailMsg = tbXunMaShu0903:IsPlayerEligible() 
	
	if bRet ~= 1 then
		Talk(1, "", szFailMsg.."Kh«ng ®­îc sö dông vËt phÈm nµy.")
		return 1
	end
	
	
	if CalcFreeItemCellCount() < 10 then
		Talk(1, "", format("Hµnh trang cÇn Ýt nhÊt %d « trèng.", 10))
		return 1
	end
	
	
	local szItemGroupName = format("%s vµ %s", "Hoµng Kim B¶o r­¬ng", "B¶o r­¬ng B¹ch Kim")
	if tbXunMaShu0903.tbTask:CheckExpFromOther() ~= 1 then
		Msg2Player(format("Th«ng qua sö dông %s nhiÒu nhÊt chØ cã thÓ thu ®­îc %u kinh nghiÖm. Ng­¬i ®· ®¹t kinh nghiÖm cao nhÊt, kh«ng thÓ thu thªm kinh nghiÖm n÷a.", szItemGroupName, tbXunMaShu0903.tbTask.nMaxExpFromOther * 1e6) )
	else
		tbAwardTemplet:GiveAwardByList(%tbExpAward, "use bai jin bao xiang")	
	end
	tbAwardTemplet:GiveAwardByList(_tbSilverBoxItemAward, "use bai jin bao xiang")
	
	
end