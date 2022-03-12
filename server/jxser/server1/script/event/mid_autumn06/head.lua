--by ÁÎÖ¾É½ [2006-09-12]
--2006ÖÐÇï»î¶¯Ö®×öµÆÁý»î¶¯,¹«¹²Êý¾Ý
--Illustration: µÆÁý -- lightcage au06- -- midautumn2006

if (not __H_MIDAUTUMN_06__) then
	__H_MIDAUTUMN_06__ = 1;

Include([[\script\lib\pay.lua]]);
Include([[\script\lib\gb_taskfuncs.lua]]);

EXP_AWARD_LIMIT = 50000000;
AU06_TK_EXP = 1776;

AU06_BEGINDATE = 20060930;
AU06_ENDDATE = 20061013;

AU06_COLORED_LIMITED = 3000;


--µÆÁýÊý¾Ý±í
tab_Lightcage = {
--		1	2		3		4		5		6		7	8		9
	{1229, 1221, "Lång ®Ìn b­¬m b­ím", "GiÊy kiÕng vµng (VËt liÖu lµm lång ®Ìn)", 1000, 1241, 1235, "B¸nh trung thu th­êng", 2},
	{1230, 1222, "Lång ®Ìn ng«i sao", "GiÊy kiÕng lam (VËt liÖu lµm lång ®Ìn)", 2000, 1242, 1236, "B¸nh trung thu ®Ëu xanh", 2},
	{1231, 1223, "Lång ®Ìn èng", "GiÊy kiÕng lôc (VËt liÖu lµm lång ®Ìn)", 3000, 1243, 1237, "B¸nh trung thu nh©n trøng", 2},
	{1232, 1224, "Lång ®Ìn trßn", "GiÊy kiÕng ®á (VËt liÖu lµm lång ®Ìn)", 4000, 1244, 1238, "B¸nh trung thu ®Æc biÖt", 2},
	{1233, 1225, "Lång ®Ìn c¸ chÐp", "GiÊy kiÕng cam (VËt liÖu lµm lång ®Ìn)", 5000, 1245, 1239, "B¸nh trung thu h¹t sen", 1},
	{1234, 1225, "Lång ®Ìn kÐo qu©n", "GiÊy kiÕng cam (VËt liÖu lµm lång ®Ìn)", 5000, 1245, 1240, "B¸nh trung thu con heo", 5},
}

tab_BasicMaterial = {
	{1226, "Thanh tre (VËt liÖu lµm lång ®Ìn)"},
	{1227, "D©y cãi (VËt liÖu lµm lång ®Ìn)"},
	{1228, "NÕn"},
}

--ÊÇ·ñÔÚ»î¶¯ÆÚ¼ä ·µ»Ø£º1ÔÚ ,0 ²»ÔÚ»î¶¯ÆÚ¼ä
function au06_is_inperiod()
	if (gb_GetTask("midautumn2006_city_all", 1) ~= 0) then
		return 0
	end;
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nDate >= AU06_BEGINDATE and nDate <= AU06_ENDDATE) then --
		return 1;
	end;
	return 0;
end;

--ÊÇ·ñÎª50¼¶³äÖµÓÃ»§
function au06_IsPayed_player()
	if (IsCharged() == 0) then
		return 0;
	end;
	return 1;
end;

function oncancel()
end;

end;	--//end of __H_MIDAUTUMN_06__