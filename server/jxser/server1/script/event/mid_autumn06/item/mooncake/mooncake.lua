--by ÁÎÖ¾É½ [2006-09-12]
--2006ÖĞÇï»î¶¯Ö®³ÔÔÂ±ı£¬³ÔÁËµÃµ½ÏàÓ¦µÄ½±Àø
--Illustration: µÆÁı -- lightcage au06- -- midautumn2006

if (not __H_ITEM_MOONCAKE__) then
	__H_ITEM_MOONCAKE__ = 1;
	
Include([[\script\event\mid_autumn06\head.lua]]);
	
--nIndex
tab_Exp = {
	20000 ,
	40000 ,
	100000 ,
	500000 ,
	1000000 ,
	2000000 ,
}

--ÖĞÇï»î¶¯Èë¿Úº¯Êı
function main()
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nDate < AU06_BEGINDATE or nDate >= 20061117 or 
			gb_GetTask("midautumn2006_city_all", 1) ~= 0) then
		Say("B¸nh Trung thu chØ ®­îc dïng tõ 30/9 ®Õn 16/11.B¸nh Trung thu chØ ®­îc dïng tõ 30/9 ®Õn 16/11.", 0);
		return 1;
	end;
	
	if (au06_IsPayed_player() == 0) then
		Say("ChØ cã ng­êi ch¬i n¹p thÎ míi cã thÓ ¨n b¸nh trung thu", 0);
		return 1;
	end;
	
	if (not nIndex) then
		return 1;
	end;
	
	local nCount = getn(tab_Exp);
	if (nIndex > nCount) then
		nIndex = nCount;
	elseif (nIndex < 1) then
		nIndex = 1;
	end;
	
	local nExp = GetTask(AU06_TK_EXP);
	if (nExp >= EXP_AWARD_LIMIT) then
		Say("Mçi ng­êi chØ cã thÓ nhËn ®­îc <color=red>"..EXP_AWARD_LIMIT.."<color> ®iÓm kinh nghiÖm tõ b¸nh trung thu mµ th«i.", 0);
		return 1;
	end;
	--¸øÓè½±Àø
	SetTask(AU06_TK_EXP, nExp + tab_Exp[nIndex]);
	AddOwnExp(tab_Exp[nIndex]);
	
	--¹«¸æÌáÊ¾
	Msg2Player("B¹n nhËn ®­îc<color=yellow>"..tab_Exp[nIndex].."<color> ®iÓm kinh nghiÖm.")
	return 0;
end

end; --//end of __H_ITEM_MOONCAKE__