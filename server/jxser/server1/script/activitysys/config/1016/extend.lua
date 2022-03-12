Include("\\script\\activitysys\\config\\1016\\head.lua");
Include("\\script\\activitysys\\config\\1016\\variables.lua");
Include("\\script\\activitysys\\config\\1016\\awardlist.lua");
Include("\\script\\dailogsys\\dailogsay.lua");
Include("\\script\\lib\\awardtemplet.lua");
Include( "\\script\\activitysys\\config\\1016\\callboss.lua");
Include("\\script\\vng_lib\\bittask_lib.lua")
IncludeLib("SETTING");

pActivity.nPak = curpack()

--Sö dông Item
function pActivity:UseTieuHuyenBT()
	if not tbVNG_BitTask_Lib:CheckBitTaskValue(%tbBITTSK_LIMIT_3,%tbBITTSK_LIMIT_3.nMaxValue,"§· ®¹t ®Õn giíi h¹n, kh«ng thÓ sö dông tiÕp","<") then
		return
	end
	--ngau nhiªn exp
	local rtotal = 10000000
	local rcur=random(1,rtotal);
	local rstep=0;
	local tbItem = %tbAward_TieuHuyenBT_Exp
	local nRandResult = 0
	for i=1,getn(tbItem) do
		rstep=rstep+floor(tbItem[i].nRate*rtotal/100);
		if(rcur <= rstep) then
			nRandResult = tbItem[i].nExp
			break
		end
	end
	local nCurTskVal = tbVNG_BitTask_Lib:getBitTask(%tbBITTSK_LIMIT_3)
	local nNextExp = nRandResult
	-- Lan su dung cuoi cung vuot qua gioi han
	if floor(nNextExp/1e6) + nCurTskVal > %tbBITTSK_LIMIT_3.nMaxValue then
		nNextExp = (%tbBITTSK_LIMIT_3.nMaxValue - nCurTskVal)*1e6
	end
	
	tbVNG_BitTask_Lib:addTask(%tbBITTSK_LIMIT_3, floor(nNextExp/1e6))	
	tbAwardTemplet:Give({szName = "§iÓm kinh nghiÖm", nExp=nNextExp}, 1, {%EVENT_LOG_TITLE, "SuDungTieuHuyenBangTinhNhanExp"})
	Msg2Player(format("B¹n ®· nhËn ®­îc <color=yellow>%s<color> exp , b¹n cßn cã thÓ nhËn ®­îc thªm <color=yellow>%s<color> exp tõ TiÓu HuyÒn B¨ng Tinh hay Méc HuyÒn B¨ng Tinh.", nCurTskVal*1e6, (%tbBITTSK_LIMIT_3.nMaxValue - nCurTskVal)*1e6))	
	tbAwardTemplet:Give(%tbAward_Old, 1, {%EVENT_LOG_TITLE, "SuDungTieuHuyenBangTinhNhanItem"})
	nCurTskVal = tbVNG_BitTask_Lib:getBitTask(%tbBITTSK_LIMIT_3)
	
end


-- Khi Boss c©y chÕt
function OnDeath(nNpcIdx)
	local szPlayerName = GetName()
	if (szPlayerName ~= %TreeBossOwner.PlayerName[nNpcIdx]) then
		nTimerId =  %TreeBossOwner.Timer[nNpcIdx]
		DelTimer(nTimerId)	
		%TreeBossOwner.PlayerName[nNpcIdx] =nil	
		%TreeBossOwner.TreeName[nNpcIdx] = nil
		%TreeBossOwner.Timer[nNpcIdx] = nil		
		Msg2Player("§¸nh c©y cña ng­êi kh¸c kh«ng nhËn ®­îc g×")
		return
	end
	
	local szTreeName = %TreeBossOwner.TreeName[nNpcIdx]
	
	if (szTreeName == "Méc Lam B¨ng Tinh") then
		 tbAwardTemplet:Give(tbAward_BossTree_1, 1, {EVENT_LOG_TITLE, 	format("Kill Tree Boss %s",szTreeName )}) 		
	 end 
	 if (szTreeName == "Méc Hoµng B¨ng Tinh") 	then 
	 	tbAwardTemplet:Give(tbAward_BossTree_2, 1, {EVENT_LOG_TITLE, format("Kill Tree Boss %s",szTreeName )}) 	 
	end 
	if (szTreeName == "Méc HuyÒn B¨ng Tinh") then 
		tbAwardTemplet:Give(tbAward_BossTree_3, 1, {EVENT_LOG_TITLE, format("Kill Tree Boss %s",szTreeName )})
		if ( CalcFreeItemCellCount()  < 1) then
			Talk (1,"","Hµnh trang ®· ®Çy nªn phÇn th­ëng ®· bÞ mÊt")
			return
		end
		pActivity:UseTieuHuyenBT() 
	end	
	
	nTimerId =  %TreeBossOwner.Timer[nNpcIdx]
	DelTimer(nTimerId)	
	%TreeBossOwner.PlayerName[nNpcIdx] =nil 
	%TreeBossOwner.TreeName[nNpcIdx] = nil 
	%TreeBossOwner.Timer[nNpcIdx] = nil

end