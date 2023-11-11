Include("\\script\\global\\login_head.lua")
-- ×ÓÄ¸´ü

DAY_SECOND_SUM			=	60 * 60 * 24;
WEEK_SECOND_SUM			=	DAY_SECOND_SUM * 7;

TASKID_ZMD_EXPIRE_TIME	=	2558;					-- ×ÓÄ¸´üÓÐÐ§ÈÕÆÚÈÎÎñ±äÁ¿


function main(nItemIdx)
	local szMsg = "<#>Tói tö mÉu cã thêi h¹n sö dông lµ: <color=yellow>"..zmd_get_expire_date().."<color>";
	Say(szMsg, 2, "N¹p 1 tuÇn/#recharge("..nItemIdx..")", "Hñy bá /cancel");
	return 1;
end

-- ×ÓÄ¸´ü³äÖµ
function recharge(nItemIdx)
	if (RemoveItemByIndex(nItemIdx) ~= 1) then
		return
	end
	zmd_add_expire_date(1);
	if (GetPartnerBagLevel() ~= 10) then
		SetPartnerBagLevel(10);
	end
	Say("<#>N¹p thµnh c«ng, tói tö mÉu cña ®¹i hiÖp cã thêi h¹n sö dông lµ: <color=yellow>"..zmd_get_expire_date().."<color>", 0);
end

-- ×ÓÄ¸´ü¶¨Ê±¼ì²é
function zmd_check_expire_timer()
	local nExpireState = zmd_check_expire();
	if (nExpireState == 2) then
		if (GetPartnerBagLevel() ~= 0) then
			SetPartnerBagLevel(0);
			Msg2Player("Tói tö mÉu cña ®¹i hiÖp ®· qu¸ h¹n råi");
		end
	elseif (nExpireState == 1) then
		if (random(1, 3) == 1) then
			Msg2Player("Tói tö mÉu cña ®¹i hiÖp sÏ hÕt h¹n trong vßng h«m nay");
		end
	end
end

-- Ôö¼Ó×ÓÄ¸´üÓÐÐ§ÈÕÆÚ£¨µ¥Î»ÎªÖÜ£©
function zmd_add_expire_date(nRechargeWeek)
	local nExpireTime = GetTask(TASKID_ZMD_EXPIRE_TIME);
	local nExpireFmtDate = tonumber(FormatTime2String("%Y%m%d", nExpireTime));
	local nNowTime = GetCurServerTime();
	local nNowFmtDate = tonumber(FormatTime2String("%Y%m%d", nNowTime));
	if (nExpireFmtDate < nNowFmtDate) then
		nExpireTime = nNowTime + nRechargeWeek * WEEK_SECOND_SUM;
	else
		nExpireTime = nExpireTime + nRechargeWeek * WEEK_SECOND_SUM;
	end
	SetTask(TASKID_ZMD_EXPIRE_TIME, nExpireTime);
	return FormatTime2String("%Y-%m-%d", nExpireTime);
end

-- ¼ì²é×ÓÄ¸´üÊÇ·ñÒÑ¹ýÓÐÐ§ÈÕÆÚ
function zmd_check_expire()
	local nNowTime = GetCurServerTime();
	local nNowFmtDate = tonumber(FormatTime2String("%Y%m%d", nNowTime));
	local nExpireTime = GetTask(TASKID_ZMD_EXPIRE_TIME);
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

-- »ñÈ¡×ÓÄ¸´üÓÐÐ§ÈÕÆÚ
function zmd_get_expire_date()
	local nExpireTime = GetTask(TASKID_ZMD_EXPIRE_TIME);
	if (nExpireTime ~= 0) then
		return FormatTime2String("%Y-%m-%d", nExpireTime - DAY_SECOND_SUM);
	else
		return "Ch­a khëi ®éng";
	end
end

function cancel()
end

if (GetProductRegion() == "cn_ib") then
	login_add(zmd_check_expire_timer, 2)
end
