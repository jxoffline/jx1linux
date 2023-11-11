-- ÎÄ¼şÃû¡¡£ºevent.lua
-- ´´½¨Õß¡¡£ºzhongchaolong
-- ´´½¨Ê±¼ä£º2008-01-16 10:57:44
--ÁìÈ¡µØµã: ´åÕòµÄÀñ¹Ù¡£²»ÄÜÔÚÆß´ó³ÇÊĞµÄÀñ¹ÙÁìÈ¡
--ÒªÇó£ºÃ¿ÈÕÃ¿ÕËºÅÖ»ÄÜÁìÈ¡4´Î
--ÁìÈ¡Ê±¼ä: Ã¿Ìì21µã00 ¨C 22µã00
--ÁìÈ¡Ê±ÏŞ: ´Ó 2008Äê02ÔÂ02ºÅ ¨C 2008Äê03ÔÂ02ºÅ 24µã00
--Ê¹ÓÃÊ±ÏŞ: ´Ó 2008Äê02ÔÂ02ºÅ ¨C 2008Äê03ÔÂ02ºÅ 24µã00
Include("\\script\\event\\springfestival08\\luckplanting\\head.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\pay.lua")

local _FormatTimeHMToSring = function(nTimeHM)
	local nMinute = floor(nTimeHM / 100)
	local nSecond = mod(nTimeHM , 100)
	szMsg = format("%02d:%02d", nMinute, nSecond)
	return szMsg
end
function luckplanting_0801_main()
	local nDate		= tonumber(GetLocalDate("%y%m%d"))
	local nTimeHM	= tonumber(GetLocalDate("%H%M"))
	local nTSKV		= GetTask(TSK_luckplanting_0801)
	local nWeek		= tonumber(GetLocalDate("%w"))
	local tbWeek = {[5] = 1, [6] = 1, [0] = 1}
	if luckplanting_0801_CheckMap() ~= 1 then
		Say("Xin lçi, viÖc nµy ta kh«ng râ, ®¹i hiÖp h·y ®Õn t©n thñ th«n hái th¨m.", 0)
		return 0;
	end
	
	--Ã¿Ìì21µã00 ¨C 22µã00
	if nTimeHM < luckplanting_0801_GiveTime_S or nTimeHM > luckplanting_0801_GiveTime_E then
		Say(format("Mçi ngµy vµo thêi ®iÓm %s - %s míi ph©n ph¸t mÇm c©y.",%_FormatTimeHMToSring(luckplanting_0801_GiveTime_S), %_FormatTimeHMToSring(luckplanting_0801_GiveTime_E)),  0)
		return 0;
	end
	
	if GetLevel() < 80 or IsCharged() == 0 then
		Say("Xin lçi, ®¼ng cÊp cña b¹n ch­a ®¹t 80 cÊp vµ/hoÆc ch­a n¹p thÎ.", 0)
		return 0;
	end
	
	
	if not luckplanting_0801_IsActDay() then
		Say(format("Ho¹t ®éng <color=yellow>%s<color> vÉn ch­a b¾t ®Çu.",luckplanting_0801_szActName), 0)
		return 0;
	end
	if nDate ~= floor(nTSKV/256) then
		nTSKV = nDate * 256 --ÇåÁã²¢¸üĞÂÊ±¼ä
	end
	if mod(nTSKV,256) >= TSKV_luckplanting_0801 then --´ÎÊı
		Say(format("B¹n h«m nay ®· nhËn lÊy <color=yellow>%d<color> lÇn, ngµy mai h·y quay l¹i nhĞ.", TSKV_luckplanting_0801), 0)
		return 0;
	end
	local tbItem = {szName="C©y con", tbProp={6, 1, 1642, 1, 0, 0}, nExpiredTime = 20090105}
	tbAwardTemplet:GiveAwardByList(tbItem, "luckplanting")
	
	SetTask(TSK_luckplanting_0801, nTSKV+1);
end

function luckplanting_0801_IsActDay()
	local nDate		= tonumber(GetLocalDate("%y%m%d"))
	
	local nWeek		= tonumber(GetLocalDate("%w"))
	local tbWeek = {[5] = 1, [6] = 1, [0] = 1}
	return nDate >= luckplanting_0801_Time_S and nDate <= luckplanting_0801_Time_E and tbWeek[nWeek]
end

function luckplanting_0801_CheckMap()
	local tbCityMap = 
	{
		[174]	=1,
		[121]	=1,
		[153]	=1,
		[101]	=1,
		[99]	=1,
		[100]	=1,
		[20]	=1,
		[53]	=1,
	}
	return tbCityMap[SubWorldIdx2ID(SubWorld)]
end
         