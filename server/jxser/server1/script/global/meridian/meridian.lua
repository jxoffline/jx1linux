Include("\\script\\global\\meridian\\lang.lua")

--»¤Âöµ¤µÄID
local tbHuMaiDan = {6, 1, 3203};

local tbLevel2Item = 
{
--§iÒu chØnh kinh m¹ch - by NgaVN 
	[5] = {szName = "HuyÕt Long §»ng cÊp 4", tbProp = {6, 1, 30289,4}, nCount = 10}, --Item cÊp 4
	[6] = {szName = "HuyÕt Long §»ng cÊp 5", tbProp = {6, 1, 30289,5}, nCount = 10}, --Item cÊp 5
	[7] = {szName = "HuyÕt Long §»ng cÊp 6", tbProp = {6, 1, 30289,6}, nCount = 10}, --Item cÊp 6
	[8] = {szName = "HuyÕt Long §»ng cÊp 2", tbProp = {6, 1, 3328,2}, nCount = 10},
	[9] = {szName = "HuyÕt Long §»ng cÊp 8", tbProp = {6, 1, 30289,8}, nCount = 10}, --Item cÊp 8
	[10] = {szName = "HuyÕt Long §»ng cÊp 9", tbProp = {6, 1, 30289,9}, nCount = 10},--Item cÊp 9
	[11] = {szName = "HuyÕt Long §»ng cÊp 5", tbProp = {6, 1, 3328,5}, nCount = 10},
	[12] = {szName = "HuyÕt Long §»ng cÊp 6", tbProp = {6, 1, 3328,6}, nCount = 10},
	[13] = {szName = "HuyÕt Long §»ng cÊp 12", tbProp = {6, 1, 30289,12}, nCount = 10},--Item cÊp 12
	[14] = {szName = "HuyÕt Long §»ng cÊp 8", tbProp = {6, 1, 3328,8}, nCount = 10},
	[15] = {szName = "HuyÕt Long §»ng 14", tbProp = {6, 1, 30289,14}, nCount = 10},--Item cÊp 14
	[16] = {szName = "HuyÕt Long §»ng cÊp 10", tbProp = {6, 1, 3328,10}, nCount = 10},
}

--³åÑ¨¼ì²é
function MeridianLevelUpCheck(nMeridianIndex, nNewLevel, nNeedZY, nNeedHMD, nZYTaskID,nWay)
	
	--Temporarily close 4 meridians - Modified By admin
	--if nMeridianIndex >= 1 and nMeridianIndex < 5 then
	--	Msg2Player(MSG_CLOSE_MERIDIANS);
	--	return 0;
	--end
	if nWay == 1 then
		local tbItem = %tbLevel2Item[nNewLevel]
		if not tbItem then
			Msg2Player("HuyÕt Long §»ng kh«ng cã hiÖu qu¶ ®èi víi tÇng kinh m¹ch nµy")
			return 0;
		end
		--ÐèÒª»¤Âöµ¤ÊýÁ¿
		if CalcItemCount(3, tbItem.tbProp[1], tbItem.tbProp[2], tbItem.tbProp[3], tbItem.tbProp[4]) < tbItem.nCount then
			Msg2Player(format("§¹i hiÖp h·y kiÓm tra l¹i trong hµnh trang HuyÕt Long §»ng ®· chÝnh x¸c hay ch­a, cÇn ph¶i %d c¸i %s.", tbItem.nCount, tbItem.szName));
			return 0;
		end
	end
	
	--ÐèÒªÕæÔªÊýÁ¿
	if GetTask(nZYTaskID) < nNeedZY then
		Msg2Player(format("Muèn xung huyÖt vÞ nµy cÇn %d ®iÓm Ch©n Nguyªn, Ch©n Nguyªn cña c¸c h¹ kh«ng ®ñ!", nNeedZY));
		return 0;
	end
	--ÐèÒª»¤Âöµ¤ÊýÁ¿
	if CalcItemCount(3, %tbHuMaiDan[1], %tbHuMaiDan[2], %tbHuMaiDan[3], -1) < nNeedHMD then
		Msg2Player(format("Muèn xung huyÖt vÞ nµy cÇn %d Hé M¹ch §¬n, Hé M¹ch §¬n cña c¸c h¹ kh«ng ®ñ!", nNeedHMD));
		return 0;
	end
	return 1;
end

--³åÑ¨¿ÛÎïÆ·¼°ÌáÊ¾
function MeridianLevelUp(nMeridianIndex, nAcupIndex, nSuccessRate, nRollBackLevel, szMeridianName, szAcupName, nNeedZY, nNeedHMD, nZYTaskID, nWay)
	if HaveMagic(1993) >= 0 then
		nSuccessRate = nSuccessRate * 0.5
	end
	if HaveMagic(1994) >= 0 then
		nSuccessRate = nSuccessRate * 0.5
	end
	if MeridianLevelUpCheck(nMeridianIndex, nAcupIndex, nNeedZY, nNeedHMD, nZYTaskID, nWay) == 0 then
		return 0;
	end
	if GetCash() > 500000 then
		Pay(500000)	-- Tr¶ 50 v¹n ®Ó t¨ng rate
		Msg2Player("Tr¶ <color=yellow>50 v¹n l­îng <color>®Ó t¨ng kh¶ n¨ng xung m¹ch thµnh c«ng.")
		nSuccessRate = nSuccessRate * 1.2
	end
	local bProtection = nil;
	if nWay == 1 then
		local tbItem = %tbLevel2Item[nAcupIndex]
		ConsumeItem(3, tbItem.nCount, tbItem.tbProp[1], tbItem.tbProp[2], tbItem.tbProp[3], tbItem.tbProp[4])
		bProtection = 1
		nRollBackLevel = nAcupIndex - 1
	end
	
	if ConsumeItem(3, nNeedHMD, %tbHuMaiDan[1], %tbHuMaiDan[2], %tbHuMaiDan[3],-1) ~= 1 then
		return 0;
	end
	
	SetTask(nZYTaskID, GetTask(nZYTaskID) - nNeedZY);
	
	if random(1, 10000) <= nSuccessRate then
		Msg2Player(format("[%s] huyÖt vÞ [%s] ®· xung huyÖt thµnh c«ng, tiªu hao %d ®iÓm Ch©n Nguyªn vµ %d Hé M¹ch §¬n!", szMeridianName, szAcupName, nNeedZY, nNeedHMD));
		return 1;
	else
		if bProtection then
			Msg2Player("Do cã HuyÕt Long §»ng b¶o hé, kinh m¹ch kh«ng bÞ tæn thÊt.")
		end
		if nRollBackLevel == nAcupIndex - 1 then
			Msg2Player(format("[%s] huyÖt vÞ [%s] xung huyÖt thÊt b¹i, tiªu hao %d ®iÓm Ch©n Nguyªn vµ %d Hé M¹ch §¬n!", szMeridianName, szAcupName, nNeedZY, nNeedHMD));
		elseif nRollBackLevel == 0 then
			Msg2Player(format("[%s] huyÖt vÞ [%s] xung huyÖt thÊt b¹i, tiªu hao %d ®iÓm Ch©n Nguyªn vµ %d Hé M¹ch §¬n! [%s] ®¼ng cÊp h¹ xuèng %d cÊp!", szMeridianName, szAcupName, nNeedZY, nNeedHMD, szMeridianName, nRollBackLevel));
		else
			Msg2Player(format("[%s] huyÖt vÞ [%s] xung huyÖt thÊt b¹i, tiªu hao %d ®iÓm Ch©n Nguyªn vµ %d Hé M¹ch §¬n! [%s] ®¼ng cÊp h¹ xuèng %d cÊp!", szMeridianName, szAcupName, nNeedZY, nNeedHMD, szMeridianName, nRollBackLevel));
		end
		return -1, nRollBackLevel;
	end
end

--¾­ÂöµÈ¼¶¿ª·ÅËæÊ±¼äÖá¿ª·Å
function MeridianLevelTimeLineCheck(nLevel)
	return 1;
end

--³åÑ¨³É¹¦µÄ»Øµ÷
function OnLevelUpSuccess()
	SetUpSkillIDAndLevel();
end

--³åÑ¨Ê§°ÜµÄ»Øµ÷
function OnLevelUpFailed()
	SetUpSkillIDAndLevel();
end

--»ñÈ¡¸÷¾­ÂöµÄÆ½¾ùµÈ¼¶
function GetAvgMeridianLevel()
	local nTotal = 0
	for i= 4001, 4008 do 
		nTotal = nTotal + GetTask(i)
	end
	return floor(nTotal / 8)
end

--ÃÅÅÉID£¨GetLastFactionNumber()£©¶ÔÓ¦½ø½×¼¼ÄÜID
tbFactionToSkillId = {
	[1] = 1220,
	[2] = 1221,
	[3] = 1223,
	[4] = 1222,
	[5] = 1224,
	[6] = 1225,
	[7] = 1227,
	[8] = 1226,
	[9] = 1228,
	[10] = 1229,
	[11] = 1370,
	[12] = 1986,
};


--¸ù¾Ý¾­ÂöµÄÆ½¾ùµÈ¼¶ºÍ½ÇÉ«µÄÃÅÅÉÀ´ÉèÖÃ½ø½×¼¼ÄÜ
function SetUpSkillIDAndLevel()
	local nSkillLevel = %GetAvgMeridianLevel();
	if HaveMagic(1993) >= 0 then
		nSkillLevel = nSkillLevel + 1
	end
	if HaveMagic(1994) >= 0 then
		nSkillLevel = nSkillLevel + 1
	end
	local nFaction = GetLastFactionNumber();
	local nSkillID = %tbFactionToSkillId[nFaction + 1];
	if nSkillID then
		if HaveMagic(nSkillID) < nSkillLevel then
			AddMagic(nSkillID, nSkillLevel);
			Msg2Player(format("Ng­¬i nhËn ®­îc vâ c«ng thÊt truyÒn cña m«n ph¸i <color=yellow>cÊp %d<color>, më trang kÜ n¨ng ra xem.", nSkillLevel));
		end
	end
end
