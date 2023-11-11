-- IB°ï»áµØÍ¼¹ÜÀí

IncludeLib("TONG");
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\tong\\tong_header.lua");
Include("\\script\\tong\\addtongnpc.lua");


TONGMAP_PRICE_ITEM		=	{ 4, 1290, 1, -1, "Thanh ®ång ®Ønh" };
TONGMAP_CREATE_PRICE	=	4;
TONGMAP_CHANGE_PRICE	=	10;
TONGMAP_RECHARGE_PRICE	=	1;

TONGMAP_CREATE_WEEK		=	2;

DAY_SECOND_SUM			=	60 * 60 * 24;						-- 1ÌìµÄÃëÊý
WEEK_SECOND_SUM			=	DAY_SECOND_SUM * 7;					-- 1ÖÜµÄÃëÊý


-- °ï»áµØÍ¼¹ÜÀí
function tongmap_management()
	local _, nTongID = GetTongName();
	if (nTongID == 0 or TONGM_GetFigure(nTongID, GetTongMemberID()) ~= TONG_MASTER) then
		CreateTaskSay({"<dec><npc>ChØ cã bang chñ míi cã thÓ x©y dùng khu vùc cho bang", "§­îc!/cancel"});
		return
	end
	local aryTalk  = {};
	if (TONG_GetTongMap(nTongID) == 0) then
		tinsert(aryTalk, "<dec><npc>BÊt kú bang héi nµo ®Òu cã thÓ x©y dùng khu vùc riªng. X©y dùng khu vùc riªng cÇn cã <color=yellow>4 Thanh §ång §Ønh<color>, thêi gian sö dông lµ <color=yellow>2 tuÇn<color>. Thanh §ång §Ønh cã thÓ kÐo dµi thêi gian sö dông khu vùc bang héi, mçi Thanh §ång §Ønh cã t¸c dông kÐo dµi thêi gian sö dông 1 tuÇn.");
		tinsert(aryTalk, "Vµo xem thö/tongmap_preview_1");
		tinsert(aryTalk, "X©y dùng khu vùc bang héi/tongmap_create_1");
	else
		tinsert(aryTalk, "<dec><npc>Khu vùc bang héi cña b¹n cã thêi h¹n sö dông lµ <color=yellow>"..tongmap_get_expire_date(nTongID).."<color>");
--		tinsert(aryTalk, "Ç¨ÒÆ°ï»áµØÍ¼/tongmap_change_1");
		tinsert(aryTalk, "KÐo dµi thêi gian sö dông khu vùc bang héi./tongmap_recharge_1");
	end
	tinsert(aryTalk, "Hñy bá /cancel");
	CreateTaskSay(aryTalk);
end
		
-- Ô¤ÀÀ°ï»áµØÍ¼
function tongmap_preview_1()
	local aryTalk  =
	{
		"<dec><npc>Lùa chän khu vùc muèn xem",
	};
	for nMapCopyId, szMapCopyName in aDynMapCopyName do
		tinsert(aryTalk, szMapCopyName.."/#tongmap_preview_2("..nMapCopyId..")");
	end
	tinsert(aryTalk, "Hñy bá /cancel");
	CreateTaskSay(aryTalk);
end
function tongmap_preview_2(nMapCopyId)
	local pos = GetMapEnterPos(nMapCopyId);
	NewWorld(nMapCopyId, pos.x, pos.y);
end

-- ´´½¨°ï»áµØÍ¼
function tongmap_create_1()
	local aryTalk  =
	{
		"<dec><npc>H·y lùa chän khu vùc muèn x©y dùng<enter>X©y dùng khu vùc bang héi cÇn cã"..TONGMAP_CREATE_PRICE.."c¸i"..TONGMAP_PRICE_ITEM[5]..", cã thÓ sö dông trong 2 tuÇn. :",
	};
	for nMapCopyId, szMapCopyName in aDynMapCopyName do
		tinsert(aryTalk, szMapCopyName.."/#tongmap_create_2("..nMapCopyId..")");
	end
	tinsert(aryTalk, "Hñy bá /cancel");
	CreateTaskSay(aryTalk);
end
function tongmap_create_2(nMapCopyId)
	local aryTalk  = 
	{
		"<dec><npc>Ng­¬i x¸c ®Þnh muèn x©y dùng  "..aDynMapCopyName[nMapCopyId].." Chän khu vùc nµy? <enter>X©y dùng khu vùc bang héi cÇn cã"..TONGMAP_CREATE_PRICE.."c¸i"..TONGMAP_PRICE_ITEM[5].." cã thÓ sö dông trong  2 tuÇn.",
		"X¸c nhËn/#tongmap_create_3("..nMapCopyId..")",
		"Hñy bá /cancel",
	};
	CreateTaskSay(aryTalk);
end
function tongmap_create_3(nMapCopyId)
	local _, nTongID = GetTongName();
	if (nTongID == 0 or TONGM_GetFigure(nTongID, GetTongMemberID()) ~= TONG_MASTER) then
		return
	end
	if (TONG_GetTongMap(nTongID) ~= 0) then
		CreateTaskSay({"<dec><npc>Quý bang ®· cã khu vùc bang héi råi.", "§­îc!/cancel"});
		return
	end
	if (CalcEquiproomItemCount(TONGMAP_PRICE_ITEM[1], TONGMAP_PRICE_ITEM[2], TONGMAP_PRICE_ITEM[3], TONGMAP_PRICE_ITEM[4]) < TONGMAP_CREATE_PRICE) then
		CreateTaskSay({"<dec><npc>X©y dùng khu vùc bang héi cÇn 4 Thanh §ång §Ønh!", "§­îc!/cancel"});
		return
	end
	-- ¿ÛÇ®
	if (ConsumeEquiproomItem(TONGMAP_CREATE_PRICE, TONGMAP_PRICE_ITEM[1], TONGMAP_PRICE_ITEM[2], TONGMAP_PRICE_ITEM[3], TONGMAP_PRICE_ITEM[4]) ~= 1) then
		WriteLog("[ERR] Lçi x¶y ra khi trõ chi phÝ x©y dùng bang héi!\t"..GetAccount().."("..GetName()..")");
		return
	end
	-- ´´½¨µØÍ¼
	TONG_ApplyCreatMap(nTongID, nMapCopyId);
	-- ÉèÖÃÓÐÐ§ÈÕÆÚ
	local szExpireDate = tongmap_add_expire_date(nTongID, TONGMAP_CREATE_WEEK);
	CreateTaskSay({"<dec><npc>X©y dùng thµnh c«ng khu vùc bang héi, cã hiÖu lùc ®Õn <color=yellow>"..szExpireDate.."<color>", "TiÕp tóc gia h¹n/tongmap_recharge_1", "Rêi khái/cancel"});
end

---- Ç¨ÒÆ°ï»áµØÍ¼
--function tongmap_change_1()
--	local aryTalk  =
--	{
--		"<dec><npc>ÇëÑ¡ÔñÒªÇ¨ÒÆµ½ÄÄ¸öµØÍ¼£¨¼Û¸ñ "..TONGMAP_CHANGE_PRICE.."¸ö"..TONGMAP_PRICE_ITEM[5].."£©£º",
--	};
--	for nMapCopyId, szMapCopyName in aDynMapCopyName do
--		tinsert(aryTalk, szMapCopyName.."/#tongmap_change_2("..nMapCopyId..")");
--	end
--	tinsert(aryTalk, "È¡Ïû/cancel");
--	CreateTaskSay(aryTalk);
--end
--function tongmap_change_2(nMapCopyId)
--	local aryTalk  = 
--	{
--		"<dec><npc>ÄãÈ·¶¨ÒªÇ¨ÒÆµ½ "..aDynMapCopyName[nMapCopyId].." Õâ¸öµØÍ¼£¨¼Û¸ñ "..TONGMAP_CHANGE_PRICE.."¸ö"..TONGMAP_PRICE_ITEM[5].."£©£¿",
--		"È·¶¨/#tongmap_change_3("..nMapCopyId..")",
--		"È¡Ïû/cancel",
--	};
--	CreateTaskSay(aryTalk);
--end
--function tongmap_change_3(nMapCopyId)
--	local _, nTongID = GetTongName();
--	if (nTongID == 0 or TONGM_GetFigure(nTongID, GetTongMemberID()) ~= TONG_MASTER) then
--		return
--	end
--	if (TONG_GetTongMap(nTongID) == 0) then
--		CreateTaskSay({"<dec><npc>¹ó°ï»¹Ã»ÓÐ°ï»áµØÍ¼£¡", "ºÃµÄ/cancel"});
--		return
--	end
--	if (CalcEquiproomItemCount(TONGMAP_PRICE_ITEM[1], TONGMAP_PRICE_ITEM[2], TONGMAP_PRICE_ITEM[3], TONGMAP_PRICE_ITEM[4]) < TONGMAP_CHANGE_PRICE) then
--		CreateTaskSay({"<dec><npc>Äã²»¹»Ç®Ç¨ÒÆ°ï»áµØÍ¼°¢£¬Í¬Ñ§£¡", "ºÃµÄ/cancel"});
--		return
--	end
--	-- ¿ÛÇ®
--	if (ConsumeEquiproomItem(TONGMAP_CHANGE_PRICE, TONGMAP_PRICE_ITEM[1], TONGMAP_PRICE_ITEM[2], TONGMAP_PRICE_ITEM[3], TONGMAP_PRICE_ITEM[4]) ~= 1) then
--		WriteLog("[ERR] Òì³££¡Ç¨ÒÆ°ï»áµØÍ¼¿Û·ÑÊ§°Ü£¡\t"..GetAccount().."("..GetName()..")");
--		return
--	end
--	-- Ç¨ÒÆµØÍ¼
--	TONG_ApplyChangeMap(nTongID, nMapCopyId);
--end

-- ³äÖµ°ï»áµØÍ¼
function tongmap_recharge_1()
	local _, nTongID = GetTongName();
	if (nTongID == 0 or TONGM_GetFigure(nTongID, GetTongMemberID()) ~= TONG_MASTER) then
		return
	end
	GiveItemUI("Gia h¹n khu vùc bang héi", "H·y ®­a vµo "..TONGMAP_PRICE_ITEM[5]..","..TONGMAP_RECHARGE_PRICE.."c¸i"..TONGMAP_PRICE_ITEM[5].."Cã thÓ gia h¹n sö dông thªm 1 tuÇn. \n".."Cã thêi h¹n sö dông ®Õn "..tongmap_get_expire_date(nTongID), "tongmap_recharge_2", "cancel");
end
function tongmap_recharge_2(nItemCount)
	local _, nTongID = GetTongName();
	if (nTongID == 0 or TONGM_GetFigure(nTongID, GetTongMemberID()) ~= TONG_MASTER) then
		return
	end
	local aryTongMapItem = {};
	for i = 1, nItemCount do
		local nItemIdx = GetGiveItemUnit(i);
		local nItemGenre, nItemDetailType, nItemParticular = GetItemProp(nItemIdx);
		if (nItemGenre == TONGMAP_PRICE_ITEM[1] and nItemDetailType == TONGMAP_PRICE_ITEM[2]) then
			tinsert(aryTongMapItem, nItemIdx);
		end
	end
	local nRechargeWeek = floor(getn(aryTongMapItem) / TONGMAP_RECHARGE_PRICE);
	if (nRechargeWeek <= 0) then
		local aryTalk =
		{
			"<dec><npc>CÇn ph¶i ®­a vµo tèi thiÓu "..TONGMAP_RECHARGE_PRICE.."c¸i"..TONGMAP_PRICE_ITEM[5]..".",
			"Më l¹i/#tongmap_recharge_1()",
			"Kh«ng cÇn/cancel",
		}
		CreateTaskSay(aryTalk);
		return
	end
	-- ¿ÛÇ®
	for i = 1, nRechargeWeek * TONGMAP_RECHARGE_PRICE do
		if (RemoveItemByIndex(aryTongMapItem[i]) ~= 1) then
			WriteLog("[ERR] Lçi x¶y ra khi khÊu trõ chi phÝ gia h¹n khu vùc bang héi!\t"..GetAccount().."("..GetName()..")");
			return
		end
	end
	-- ÉèÖÃÓÐÐ§ÈÕÆÚ
	local szExpireDate = tongmap_add_expire_date(nTongID, nRechargeWeek);
	CreateTaskSay({"<dec><npc>Gia h¹n thµnh c«ng thªm <color=yellow>"..nRechargeWeek.."<color> tuÇn, cã hiÖu lùc ®Õn <color=yellow>"..szExpireDate.."<color>", "TiÕp tóc gia h¹n/tongmap_recharge_1", "Rêi khái/cancel"});
end

-- Ôö¼Ó°ï»áµØÍ¼ÓÐÐ§ÈÕÆÚ£¨µ¥Î»ÎªÖÜ£©
function tongmap_add_expire_date(nTongID, nRechargeWeek)
	local nExpireTime = TONG_GetTaskValue(nTongID, TONGTSK_MAP_EXPIRE_TIME);
	local nExpireFmtDate = tonumber(FormatTime2String("%Y%m%d", nExpireTime));
	local nNowTime = GetCurServerTime();
	local nNowFmtDate = tonumber(FormatTime2String("%Y%m%d", nNowTime));
	if (nExpireFmtDate < nNowFmtDate) then
		nExpireTime = nNowTime + nRechargeWeek * WEEK_SECOND_SUM;
	else
		nExpireTime = nExpireTime + nRechargeWeek * WEEK_SECOND_SUM;
	end
	TONG_ApplySetTaskValue(nTongID, TONGTSK_MAP_EXPIRE_TIME, nExpireTime);
	return FormatTime2String("%Y-%m-%d", nExpireTime - DAY_SECOND_SUM);
end

-- ¼ì²é°ï»áµØÍ¼ÊÇ·ñÒÑ¹ýÓÐÐ§ÈÕÆÚ
function tongmap_check_expire(nTongID)
	local nNowTime = GetCurServerTime();
	local nNowFmtDate = tonumber(FormatTime2String("%Y%m%d", nNowTime));
	local nExpireTime = TONG_GetTaskValue(nTongID, TONGTSK_MAP_EXPIRE_TIME);
	local nExpireFmtDate = tonumber(FormatTime2String("%Y%m%d", nExpireTime));
	if (nNowFmtDate >= nExpireFmtDate) then
		return 2;			-- ÒÑ¹ýÆÚ
	else
		local nRemindTime = nExpireTime - DAY_SECOND_SUM * 1;			-- 1ÌìÄÚÌáÊ¾¼´½«¹ýÆÚ
		local nRemindFmtDate = tonumber(FormatTime2String("%Y%m%d", nRemindTime));
		if (nNowFmtDate >= nRemindFmtDate) then
			return 1;		-- ¼´½«¹ýÆÚ
		else
			return 0;		-- Õý³£
		end
	end
end

-- »ñÈ¡°ï»áµØÍ¼ÓÐÐ§ÈÕÆÚ
function tongmap_get_expire_date(nTongID)
	return FormatTime2String("%Y-%m-%d", TONG_GetTaskValue(nTongID, TONGTSK_MAP_EXPIRE_TIME) - DAY_SECOND_SUM);
end

function cancel()
end