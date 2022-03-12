Include("\\script\\activitysys\\config\\1011\\head.lua");
Include("\\script\\activitysys\\config\\1011\\variables.lua");
Include("\\script\\activitysys\\config\\1011\\awardlist.lua");
Include("\\script\\lib\\log.lua")
pActivity.nPak = curpack()

function pActivity:CheckLevelTranslife(strFailMsg)
	if PlayerFunLib:CheckTotalLevel(150, strFailMsg, ">=") then
		return 1
	end
end

function pActivity:CustomAward1()
	if not tbVNG_BitTask_Lib:CheckBitTaskValue(%tbTSK_INFO_3,%tbTSK_INFO_3.nMaxValue,"§· ®¹t ®Õn giíi h¹n, kh«ng thÓ sö dông tiÕp","<") then
		return
	end
	--exp
	local rtotal = 10000000
	local rcur=random(1,rtotal);
	local rstep=0;
	local tbItem = %tbAward_1
	local nRandResult = 0
	for i=1,getn(tbItem) do
		rstep=rstep+floor(tbItem[i].nRate*rtotal/100);
		if(rcur <= rstep) then
			nRandResult = tbItem[i].nExp
			break
		end
	end
	local nCurTskVal = tbVNG_BitTask_Lib:getBitTask(%tbTSK_INFO_3)
	local nNextExp = nRandResult
	if floor(nNextExp/1e6) + nCurTskVal > %tbTSK_INFO_3.nMaxValue then
		nNextExp = (%tbTSK_INFO_3.nMaxValue - nCurTskVal)*1e6
	end
	tbVNG_BitTask_Lib:addTask(%tbTSK_INFO_3, floor(nNextExp/1e6))
	tbAwardTemplet:Give({szName = "§iÓm kinh nghiÖm", nExp=nNextExp}, 1, {%EVENT_LOG_TITLE, "SuDungQuanTrangNhanExp"})
	nCurTskVal = tbVNG_BitTask_Lib:getBitTask(%tbTSK_INFO_3)
	Msg2Player(format("B¹n ®· nhËn ®­îc <color=yellow>%s<color> exp tõ vËt phÈm %s, b¹n cßn cã thÓ nhËn ®­îc thªm <color=yellow>%s<color> exp tõ vËt phÈm nµy.", nCurTskVal*1e6, "Qu©n Trang", (%tbTSK_INFO_3.nMaxValue - nCurTskVal)*1e6))
	--item	
	tbVNG_BitTask_Lib:addTask(%tbTSK_INFO_4, 1)
	local nCurItemUsedCount = tbVNG_BitTask_Lib:getBitTask(%tbTSK_INFO_4)
	local nIsNormal = mod(nCurItemUsedCount, 33)
	if nIsNormal == 0 and %tbAward_2_Special then
		--phÇn th­ëng ®Æc biÖt		
		tbAwardTemplet:Give(%tbAward_2_Special, 1, {%EVENT_LOG_TITLE, "SuDungQuanTrangNhanItemDB", "Sè l­îng: "..nCurItemUsedCount})		
	else
		--phÇn th­ëng th­êng
		if %tbAward_2_Normal then
			tbAwardTemplet:Give(%tbAward_2_Normal, 1, {%EVENT_LOG_TITLE, "SuDungQuanTrangNhanItem", "Sè l­îng: "..nCurItemUsedCount})
		end
	end
--	local nCurItemUsedCount = tbVNG_BitTask_Lib:getBitTask(%tbTSK_INFO_4)
--	if %tbAward_2[tostring(nCurItemUsedCount)] then
--		tbAwardTemplet:Give(%tbAward_2[tostring(nCurItemUsedCount)], 1, {%EVENT_LOG_TITLE, "SuDungQuanTrangDatMoc"..nCurItemUsedCount})	
--	end
	--Sö dông 2 qu©n trang nhËn ch©n nguyªn ®¬n
	if mod(nCurItemUsedCount, 2) == 0 then
		tbAwardTemplet:Give(%tbAward_4, 1, {%EVENT_LOG_TITLE, "SuDungQuanTrangNhanChanNguyenDon", "Sè l­îng: "..nCurItemUsedCount})
	end
	--Msg2Player(format("Sè l­îng Huy HiÖu §¹i So¸i ®· sö dông: <color=yellow>%d<color> c¸i", nCurItemUsedCount))
	tbLog:PlayerActionLog(%EVENT_LOG_TITLE, "SuDungQuanTrang", "Sè l­îng: "..nCurItemUsedCount)
end