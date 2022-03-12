-- ÎÄ¼þÃû¡¡£ºsapling.lua
-- ´´½¨Õß¡¡£ºzhongchaolong
-- ´´½¨Ê±¼ä£º2008-01-16 10:54:26
--´Ó 2008Äê02ÔÂ02ºÅ ¨C 2008Äê03ÔÂ02ºÅ 24µã00
--ÐÔÖÊ:
--- ¿É½»Ò×, °ÚÌ¯, ·ÏÆú, Âô shop = 0 Á½.
--- ²»¿ÉÒÔµþ¼Ó

--½çÏÞ: 
--- Ê¹ÓÃµÀ¾ßÊ±²»ÏÞÖÆ½ÇÉ«µÈ¼¶.
--- Ã¿½ÇÉ«Ã¿ÌìÖ»¿ÉÖÖ8¿Ã.
--Ê¹ÓÃ·½·¨: ÓÒ½¡µã»÷


--Include("\\script\\event\\springfestival08\\luckplanting\\head.lua")
Include("\\script\\event\\springfestival08\\luckplanting\\treehead.lua")
Include("\\script\\global\\judgeoffline_limit.lua")
IncludeLib("ITEM")
--Event trång c©y may m¾n - Modified by DinhHQ - 20110518

nTSK_USE_COUNT_LIMIT = 2728
nUSE_COUNT_LIMIT = 500

function main(nItemIndex)
	local n_item_date = tonumber(FormatTime2String("%Y%m%d%H%M",ITEM_GetExpiredTime(nItemIndex)));
	local n_cur_date = tonumber(GetLocalDate("%Y%m%d%H%M"));
	if n_cur_date > n_item_date then		
		Msg2Player("VËt phÈm ®· qu¸ h¹n, kh«ng thÓ sö dông.")
		return 1;
	end
	
	if (GetTask(nTSK_USE_COUNT_LIMIT) >= nUSE_COUNT_LIMIT) then
		Talk(1, "", "Trång c©y ®¹t ®Õn giíi h¹n, kh«ng thÓ trång thªm!")
		return 1
	end
	
	if not sapling_checkmap() then
		Msg2Player("ChØ cã thÓ sö dông ë t©n thñ th«n vµ thµnh thÞ.")
		return 1
	end
	
	if offlineCheckPermitRegion() == 0 then
		Msg2Player("Tèt nhÊt kh«ng nªn trång c©y gÇn khu vùc ®«ng ng­êi.")
		return 1;
	end
	
	SetTask(nTSK_USE_COUNT_LIMIT, GetTask(nTSK_USE_COUNT_LIMIT) + 1)
	local _, nX, nY = GetWorldPos();
	if (plantTree_0801(1, SubWorld, nX*32, nY*32, format("C©y cña %s",GetName()), FileName2Id(GetName()), GetRoleCreateTimeData() ) == 0) then
		return 1;
	end;
	return 0
end

function bak_main(nItemIndex)
do return end
	local nData_E			= GetItemParam(nItemIndex, 1);
	local nUseCountLimit	= 8
	local nDate				= tonumber(GetLocalDate("%y%m%d"))
	local nDateYmd			= tonumber(GetLocalDate("%Y%m%d"))
	local nTSKV				= GetTask(TSK_sapling_UseCountLimit)
	
	if nData_E <= nDateYmd then
		Msg2Player("VËt phÈm nµy ®· qu¸ h¹n, kh«ng thÓ sö dông.", 0)
		return 0;
	end
	if not sapling_checkmap() then
		Msg2Player("ChØ cã thÓ sö dông ë khu vùc phi chiÕn ®Êu cña c¸c th«n trÊn.")
		return 1
	end
	
	if offlineCheckPermitRegion() == 0 then
		Msg2Player("Tèt nhÊt kh«ng nªn trång c©y gÇn khu vùc ®«ng ng­êi.")
		return 1;
	end
	
	if nDate ~= floor(nTSKV/256) then
		nTSKV = nDate * 256 --ÇåÁã²¢¸üÐÂÊ±¼ä
	end
	if mod(nTSKV,256) >= nUseCountLimit then --´ÎÊý
		Say(format("B¹n h«m nay ®· trång <color=yellow>%d<color> c©y, ngµy mai h·y trång tiÕp nhÐ!", nUseCountLimit), 0)
		return 1;
	end
	
	--²úÉú
	local _, nX, nY = GetWorldPos();
	--local nNpcIdx = AddNpc(711, 1, SubWorld, (nX-1)*32, (nY-1)*32, 1, format("%sµÄÊ÷",GetName()));
	if (plantTree_0801(1, SubWorld, (nX+random(-2,2))*32, (nY+random(-2,2))*32, format("C©y cña %s",GetName()), FileName2Id(GetName()), GetRoleCreateTimeData() ) == 0) then
		return 1;
	end;
	
	SetTask(TSK_sapling_UseCountLimit, nTSKV+1);
end

function sapling_checkmap()
	local tbCityMap = 
	{
		[174]	= 1,--Long tuyÒn
		[121]	= 1, --Long M«n
		[153]	= 1, --Th¹ch Cæ
		[101]	= 1,--®¹o h­¬ng th«n
		[99]	= 1, --VÜnh L¹c
		[100]	= 1,--Chu Tiªn TrÊn
		[20]	= 1, --giang t©n
		[53]	= 1, --Ba L¨ng
		[11]	= 1,
		[1]		= 1,
		[37]	= 1,
		[176]	= 1,
		[162]	= 1,
		[78]	= 1,
		[80]	= 1,
	}
	return tbCityMap[SubWorldIdx2ID(SubWorld)] and (GetFightState() == 0)
end