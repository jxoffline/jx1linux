-------------------------------------------------------------------------
-- FileName		:	lib_killlevel.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-03-31 10:42:00
-- Desc			:	×é¶ÓµÄËùÓÐÍæ¼ÒÈÎÎñ±äÁ¿½Ô¸Ä±äµÄÀà
-------------------------------------------------------------------------

-- myTaskNumber £ºÐèÒª¸Ä±äµÄÈÎÎñ±äÁ¿±àºÅ
-- myOrgValue   £º·ûºÏÌõ¼þµÄÅÐ¶ÏÖµ
-- myTaskValue  £º¸Ä±äºóµÄ±äÁ¿Öµ
-- SetMemberTask µÄ·µ»ØÖµÈç¹ûÊÇ 0 ÔòÖ»¸Ä±ä²»×é¶ÓÍæ¼ÒµÄ±äÁ¿£¬´óÓÚ»òÕßµÈÓÚ 1 ÔòÎª¸Ä±äÁË×é¶ÓÍæ¼Ò±äÁ¿µÄÊýÁ¿
-- ÎÞÂÛÊÇµ¥ÈË»¹ÊÇ×é¶ÓÊ±¶¼Ã»ÓÐ¸Ä±äÍæ¼ÒµÄ±äÁ¿Ê±Ôò·µ»Ø 80
-- ¶øÈÎºÎÌõ¼þ¶¼²»Âú×ãµÄÒì³£´¦ÀíÔò·µ»Ø 110

Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\tong\\tong_award_head.lua")
Include("\\script\\lib\\awardtemplet.lua");		-- ½±ÀøÄ£°å
Include("\\script\\task\\tollgate\\killer\\mibao_head.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

function SetMemberTask(myTaskNumber,myOrgValue,myTaskValue,fnCallback, series)

	local nPreservedPlayerIndex = PlayerIndex
	local nMemCount = GetTeamSize()
	local myMemberTask
	local myChangeMember = 0
	local Uworld1217 = nt_getTask(1217);
	--Just the boss killer receive activity point - Modified By DinhHQ - 20120412
	DynamicExecuteByPlayer(PlayerIndex, "\\script\\huoyuedu\\huoyuedu.lua", "tbHuoYueDu:AddHuoYueDu", "shashourenwu")
	if (nMemCount == 0 ) then
		myMemberTask = GetTask(myTaskNumber)
		if (myMemberTask == myOrgValue) then
			add_shashouling(myOrgValue, series)
			
			nt_setTask(TSKID_KILLERMAXCOUNT, GetTask(TSKID_KILLERMAXCOUNT) + 1);
			
			tongaward_killer()
			nt_setTask(myTaskNumber,myTaskValue);
			--Just the boss killer receive activity point - Modified By DinhHQ - 20120412
--			if myOrgValue >= 141 and myOrgValue <= 160 then --É±ËÀÆÕÍ¨90¼¶ºÍ¸ß¼¶É±ÊÖÈÎÎñµÄboss¼Ó»îÔ¾¶È
--				DynamicExecuteByPlayer(PlayerIndex, "\\script\\huoyuedu\\huoyuedu.lua", "tbHuoYueDu:AddHuoYueDu", "shashourenwu")
--			end
			
			fnCallback()
		end
		
	else
		myMemberTask = GetTask(myTaskNumber)
		if (myMemberTask == myOrgValue) then
			tongaward_killer()
		end
		for i = 1, nMemCount do
			PlayerIndex = GetTeamMember(i)
			myMemberTask = GetTask(myTaskNumber)
			if (myMemberTask == myOrgValue) then	-- ·ûºÏÁËÌõ¼þµÄ¶ÓÓÑ²Å¸Ä±äÈÎÎñ±äÁ¿	
				add_shashouling(myOrgValue, series)
				
				nt_setTask(TSKID_KILLERMAXCOUNT, GetTask(TSKID_KILLERMAXCOUNT) + 1);
				
				nt_setTask(myTaskNumber,myTaskValue)
				myChangeMember = myChangeMember + 1
				--Just the boss killer receive activity point - Modified By DinhHQ - 20120412
--				if myOrgValue >= 141 and myOrgValue <= 160 then --É±ËÀÆÕÍ¨90¼¶ºÍ¸ß¼¶É±ÊÖÈÎÎñµÄboss¼Ó»îÔ¾¶È
--					DynamicExecuteByPlayer(PlayerIndex, "\\script\\huoyuedu\\huoyuedu.lua", "tbHuoYueDu:AddHuoYueDu", "shashourenwu")
--				end
				
				fnCallback();
			end
			
		end
		
		PlayerIndex = nPreservedPlayerIndex;
		
	end
	
end;

function add_shashouling(nvalue, series)
	if ( nvalue >= 1 ) and ( nvalue<= 20  ) then
		-- AddOwnExp(15000)
		-- AddOwnExp(15000)
		AddItem(6,1,399,20,series,0)
		Msg2Player("B¹n nhËn ®­îc 1 s¸t thñ lÖnh cÊp 20")
	elseif ( nvalue >= 21 ) and ( nvalue<= 40  ) then
		-- AddOwnExp(20000)
		-- AddOwnExp(20000)
		AddItem(6,1,399,30,series,0)
		Msg2Player("B¹n nhËn ®­îc 1 s¸t thñ lÖnh cÊp 30")
	elseif ( nvalue >= 41 ) and ( nvalue<= 60  ) then
		-- AddOwnExp(30000)
		-- AddOwnExp(30000)
		AddItem(6,1,399,40,series,0)
		Msg2Player("B¹n nhËn ®­îc 1 s¸t thñ lÖnh cÊp 40")
	elseif ( nvalue >= 61 ) and ( nvalue<= 80  ) then
		-- AddOwnExp(50000)
		-- AddOwnExp(50000)
		AddItem(6,1,399,50,series,0)
		Msg2Player("B¹n nhËn ®­îc 1 s¸t thñ lÖnh cÊp 50")
	elseif ( nvalue >= 81 ) and ( nvalue<= 100  ) then
		AddOwnExp(60000)
		AddItem(6,1,399,60,series,0)
		Msg2Player("B¹n nhËn ®­îc 1 s¸t thñ lÖnh cÊp 60")
	elseif ( nvalue >= 101 ) and ( nvalue<= 120  ) then
		AddOwnExp(80000)
		AddItem(6,1,399,70,series,0)
		Msg2Player("B¹n nhËn ®­îc 1 s¸t thñ lÖnh cÊp 70")
	elseif ( nvalue >= 121 ) and ( nvalue<= 140  ) then
		AddOwnExp(100000)
		AddItem(6,1,399,80,series,0)
		Msg2Player("B¹n nhËn ®­îc 1 s¸t thñ lÖnh cÊp 80")
	elseif ( nvalue >= 141 ) and ( nvalue<= 160  ) then
		AddOwnExp(140000)
		--Ö»ÓÐ×ö90¼¶ÉÏµÄ ²ÅÓÐ¿ÉÄÜÑ§Ï°120¼¶¼¼ÄÜ
		AddExp_Skill_Extend(140000);
		AddItem(6,1,399,90,series,0)
		Msg2Player("Ng­¬i ®­îc mét s¸t thñ lÖnh cÊp 90")
		tbAwardTemplet:GiveAwardByList({{szName = "S¸t thñ bÝ b¶o", tbProp = {6,1,2347,1,1,0}, nRate = 50}}, format("Get %s", "S¸t thñ bÝ b¶o"), 1)
		jiefangri_award()	
	end
end

function jiefangri_award()
	local nLevel = 150
	
	if PlayerFunLib:CheckTotalLevel(nLevel, "", ">=") ~= 1 then
		return
	end

	local tbItem = {
		[1]={szName="Huy Ch­¬ng ChiÕn C«ng",tbProp={6,1,2823,1,0,0},nExpiredTime=20110523},
		[2]={szName="C©y Bót",tbProp={6,1,2825,1,0,0},nExpiredTime=20110523},
		[3]={szName="Phï HiÖu",tbProp={6,1,2826,1,0,0},nExpiredTime=20110523},
	}
	
	local tbshashou = {
		[1] = 2,
		[2] = 1,
		[3] = 2,
	}	
	local tbStartDate = {
		[1] = 201104210000,
		[2] = 201105020000,
		[3] = 201105160000,
		}
		
	local tbMaiDian = {
		[1] = "jiefangri_shashouchanchuzhangongjiangzhang",
		[2] = "jiefangri_shashouchanchuzhibi",
		[3] = "jiefangri_shashouchanchujianzhang",
		}	
	local nEndDate = 201105230000
	local ndate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	
	for i=1,getn(tbStartDate) do
		if ndate >= tbStartDate[i] and ndate <= nEndDate then
			tbAwardTemplet:Give(tbItem[i], tbshashou[i], {"EventChienThang042011", "NhanDuocNguyenLieuTuBossSatThu"})
			AddStatData(tbMaiDian[i], tbshashou[i])
		end
	end
end