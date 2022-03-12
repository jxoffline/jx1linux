IncludeLib("ITEM")
Include("\\script\\tong\\tong_award_head.lua");-- byÖ¾É½£¬°ï»áÖÜÄ¿±ê¹±Ï×¶È
Include("\\script\\item\\huihuangzhiguo_advance.lua")
Include("\\script\\activitysys\\g_activity.lua")

function main()
	
	if (0 == GetCamp()) then
		Msg2Player("B¹n ch­a gia nhËp m«n ph¸i, kh«ng thÓ h¸i qu¶.")
		return
	end
	if (0 == GetFightState() or GetLife(0) <= 0) then
		Msg2Player("kh«ng thÓ h¸i qu¶.")
		return
	end

	local GREADSEED_SEEDID_TASKID = 2310;
	local GREADSEED_TIME_TASKID = 2311;
	local nTime = GetCurrentTime();
	local nNpcIdx = GetLastDiagNpc();
	local nPlayerLevel = GetLevel();
	local nGetSeedLevel;
	
	if (GetNpcParam(nNpcIdx, 4) == 1) then
		return
	end
	
	if (nPlayerLevel < 90) then
		nGetSeedLevel = 1;
	elseif (nPlayerLevel >= 90 and nPlayerLevel < 120) then
		nGetSeedLevel = 2;
	elseif (nPlayerLevel >= 120) then
		nGetSeedLevel = 3;
	end
	
	if (nGetSeedLevel ~= GetNpcParam(nNpcIdx, 1)) then -- Èç¹û¼¶±ð²»¶Ô,²»ÄÜ½øÐÐÊ°È¡
		--ÕâÀï¸æËßÍæ¼Ò¼¶±ð²»¶Ô,²»ÄÜÊ°È¡
		if (1 == GetNpcParam(nNpcIdx, 1)) then
			Msg2Player("Lo¹i qu¶ nµy ng­êi ch¬i tõ cÊp 90 trë xuèng cã thÓ h¸i!")
		elseif (2 == GetNpcParam(nNpcIdx, 1)) then
			Msg2Player("Lo¹i qu¶ nµy ng­êi ch¬i tõ cÊp 90 ®Õn cÊp 119 míi cã thÓ h¸i.")
		else
			Msg2Player("Lo¹i qu¶ nµy ng­êi ch¬i tõ cÊp 120 trë lªn míi cã thÓ h¸i!")
		end
		return
	end;
	
	if (GetNpcParam(nNpcIdx, 2) == GetTask(GREADSEED_SEEDID_TASKID)) then
		if (nTime >= GetTask(GREADSEED_TIME_TASKID) + 10) then
			-- ÐÂ¹ûÊµ
			if (huihuangzhiguo_advance:GetGuoZiAvd() == 0) then
				-- ¾É¹ûÊµ
				local nItemIndex = AddItem(6,1,904 + nGetSeedLevel - 1,1,0,0,0);
				ITEM_SetExpiredTime(nItemIndex, 10080);
	--			local nowdate = tonumber(GetLocalDate("%y%m%d"))
	--			SetSpecItemParam(nItemIndex, 1, nowdate)
				SyncItem(nItemIndex)
				Msg2Player("B¹n nhËn ®­îc mét qu¶ Huy Hoµng ");
			end
			SetTask(GREADSEED_TIME_TASKID, 0);
			SetTask(GREADSEED_SEEDID_TASKID, 0);
			DelNpc(nNpcIdx)
			SetNpcParam(nNpcIdx, 4, 1)
			tongaward_goldenseed();-- byÖ¾É½£¬°ï»áÖÜÄ¿±ê¹±Ï×¶È
			
			G_ACTIVITY:OnMessage("CaiJiHuiHuangZhiGuo");

		else	--Ê±¼äÃ»µ½10ÃëÖÓ;
			Msg2Player(format("B¹n ®· chän qu¶ nµy, %d gi©y sau míi cã thÓ h¸i qu¶!",
						(10 - (nTime - GetTask(GREADSEED_TIME_TASKID)))
							))
			return
		end;
	else
		Msg2Player("B¹n chän qu¶ nµy, 10 gi©y sau qu¶ chÝn cã thÓ h¸i ®­îc.")
		SetTask(GREADSEED_TIME_TASKID, nTime);
		SetTask(GREADSEED_SEEDID_TASKID, GetNpcParam(nNpcIdx, 2));
	end;
end;

