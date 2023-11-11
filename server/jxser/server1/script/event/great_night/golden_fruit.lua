IncludeLib("ITEM")
Include("\\script\\tong\\tong_award_head.lua");-- byÖ¾É½£¬°ï»áÖÜÄ¿±ê¹±Ï×¶È
Include("\\script\\lib\\progressbar.lua")
Include("\\script\\lib\\awardtemplet.lua")

--	local GREADSEED_SEEDID_TASKID = 2310;
--	local GREADSEED_TIME_TASKID = 2311;

local _Limit = function(nNpcIdx)
	
	if (0 == GetCamp()) then
		Msg2Player("B¹n ch­a gia nhËp m«n ph¸i, kh«ng thÓ h¸i qu¶.")
		return
	end

	if (0 == GetFightState() or GetLife(0) <= 0 or GetProtectTime() > 0 ) then
		Msg2Player("kh«ng thÓ h¸i qu¶.")
		return
	end
	
	local nPlayerLevel = GetLevel();
	local nGetSeedLevel = nil;
	if (nPlayerLevel < 90) then
		nGetSeedLevel = 1;
	elseif (nPlayerLevel >= 90 and nPlayerLevel < 120) then
		nGetSeedLevel = 2;
	elseif (nPlayerLevel >= 120) then
		nGetSeedLevel = 3;
	end
	
	if (nGetSeedLevel ~= 3) then -- Èç¹û¼¶±ð²»¶Ô,²»ÄÜ½øÐÐÊ°È¡
		--ÕâÀï¸æËßÍæ¼Ò¼¶±ð²»¶Ô,²»ÄÜÊ°È¡
		Msg2Player("Lo¹i qu¶ nµy ng­êi ch¬i ph¶i tõ cÊp 120 trë lªn míi cã thÓ h¸i ®­îc ")
		return
	end;
	
	return nGetSeedLevel
end

local _GetFruit = function(nNpcIdx, dwNpcId)
	
	if nNpcIdx <= 0 or GetNpcId(nNpcIdx) ~= dwNpcId then
		return 0
	end
	local nGetSeedLevel = %_Limit(nNpcIdx)
	
	if nGetSeedLevel == nil then
		return 0
	end
	
	
	DelNpc(nNpcIdx)
	--Qu¶ §¹i Hoµng Kim - Modified by DinhHQ - 20130516
	local tbGoldenFruits = 
	{
		{szName = "Qu¶ Hoµng Kim", tbProp = {6,1,907,1,0,0,0}, nExpiredTime = 10080, nRate = 80},
		{szName = "Qu¶ §¹i Hoµng Kim", tbProp = {6,1,30438,1,0,0,0}, nExpiredTime = 10080, nRate = 20}
	}
	tbAwardTemplet:Give(tbGoldenFruits, 1, {"§ªm Huy Hoµng", "H¸i qu¶ huy hoµng"})
	
	--T¹m ®ãng tÝnh n¨ng ch­a ho¹t ®éng - Modified by DinhHQ - 20110427
	--tbAwardTemplet:GiveAwardByList({tbProp = {6,1,2804,1,0,0,0}}, "§ªm Huy Hoµng", 30);
	
	tongaward_goldenseed();-- byÖ¾É½£¬°ï»áÖÜÄ¿±ê¹±Ï×¶È
	--Msg2Player("ÄãµÃµ½ÁËÒ»¸ö»Æ½ðÖ®¹û¡£");
	AddGlobalNews(format("§¹i hiÖp %s ®· h¸i ®­îc qu¶ Hoµng Kim!!!",GetName()));
end


local _OnBreak = function()
	Msg2Player("Thu thËp ®øt ®o¹n")
end

function main()
	local nNpcIdx = GetLastDiagNpc();
	local dwNpcId = GetNpcId(nNpcIdx)
	
	if %_Limit(nNpcIdx) == nil then
		return
	end
	--¿ªÆô½ø¶ÈÌõ
	tbProgressBar:OpenByConfig(2, %_GetFruit, {nNpcIdx, dwNpcId}, %_OnBreak)
end;

