IL("SETTING")
IL("LEAGUE")
Include("\\script\\lib\\gb_modulefuncs.lua")

TSK_VALENTINE2006 = 1552
function valentine_gift2006()
if (gb_GetModule("情人节礼盒") == 1) then
	if (tonumber(GetLocalDate("%y%m%d")) >= 60214 and tonumber(GetLocalDate("%y%m%d")) <= 60221) then
		if (GetLevel() >= 50) then
			if (GetTask(TSK_VALENTINE2006) == 0) then
				if (IsCharged() == 1) then
					AddItem(6,1,1058,1,1,1,1)	--情人节礼盒
					SetTask(TSK_VALENTINE2006, 1)
					Say("<#>礼官：送您<color=yellow>情人节礼盒<color>，快向您的他（她）送上情人节鲜花与甜蜜的祝福吧！", 0)
					Msg2Player("<#>您收到一个<color=yellow>情人节礼盒")
				else
					Say("<#>礼官：仅能冲值用户可以领取情人节礼盒哦。", 0)
				end
			else
				Say("<#>礼官：您已经领取过情人节的礼物了，就不要太贪心哦。", 0)
			end
		else
			Say("<#>礼官：您的等级不够50级不能领取情人节礼物哦。", 0)
		end
	else
		Say("<#>礼官：您来的太晚啦，情人节已经结束喽。", 0)
	end
end
end

function IsCharged()
	if( GetExtPoint( 0 ) >= 1 ) then
		return 1;
	else
		return 0;
	end;
end;