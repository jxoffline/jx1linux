-------------------------------------------------------------------------
-- FileName		:	lib_messenger.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-06 14:25:25
-- Desc			:	ĞÅÊ¹ÈÎÎñÖĞ¹ÖÎïËÀÍöºó×é¶ÓµÄËùÓĞÍæ¼ÒÈÎÎñ±äÁ¿½Ô¸Ä±äµÄÀà
-------------------------------------------------------------------------

-- messengertask1 £ºĞÅÊ¹ÈÎÎñÍ³Ò»Ê¹ÓÃµ±Ç°¹Ø¿¨É±¹Ö¼ÇÊıÆ÷
-- mssengertask2   £ºÏà¶ÔÈÎÎñ¹Ø¿¨É±¹Ö¼ÇÊıÆ÷
-- taskgiveexp  £ºµ±Ç°µØÍ¼Ïà¶Ô¹ÖÎïËÀÍöµÄ¾­Ñé½±Àø

Include("\\script\\event\\great_night\\huangzhizhang\\event.lua") --Ôö¼Ó»Ô»ÍÖ®Ò¹»î¶¯
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\tong\\tong_award_head.lua")		--By Liao Zhishan

function SetMessengerPlayer(messengertask1,messengertask2,taskgiveexp,MapId) --´ó¹Ö¹Òµôºóµ÷ÓÃµÄ¸ø¶ÓÄÚËùÓĞÍæ¼Ò¼Ó¾­ÑéºÍÉ±¹Ö¼ÇÊıµÄ½Å±¾
	local nPreservedPlayerIndex = PlayerIndex
	local nMemCount = GetTeamSize()
	taskgiveexp = taskgiveexp * greatnight_huang_event(2)
	
		if (nMemCount == 0 ) then
			myMemberTask = GetTask(messengertask1) + 1
			myMemberTaskTwo = GetTask(messengertask2) + 1
			nt_setTask(messengertask1,myMemberTask )
			nt_setTask(messengertask2,myMemberTaskTwo )
			if ( nt_getTask(1273) < 140000000 ) then
				AddOwnExp(taskgiveexp)
				local today_exp = nt_getTask(1273)
				nt_setTask(1273,today_exp+taskgiveexp)
			end
				PlayerIndex = nPreservedPlayerIndex;
			return
		else
			for i = 1, nMemCount do
				PlayerIndex = GetTeamMember(i)
				local prize_mapid,prize_mapx,prize_mapy= GetWorldPos() --»ñµÃµ±Ç°Íæ¼ÒËùÔÚÎ»ÖÃ
				if ( MapId == prize_mapid ) and ( nt_getTask(1201) == 20 or nt_getTask(1202) == 20 or nt_getTask(1203) == 20 ) then   --ÅĞ¶ÏÊÇ·ñÔÚÉ±ËÀ¹ÖÎïµÄÍæ¼ÒµÄËùÔÚµØÍ¼
					myMemberTask = GetTask(messengertask1) + 1
					myMemberTaskTwo = GetTask(messengertask2) + 1
					nt_setTask(messengertask1,myMemberTask )
					nt_setTask(messengertask2,myMemberTaskTwo )
					if ( nt_getTask(1273) < 140000000 ) then
						AddOwnExp(taskgiveexp)
						local today_exp = nt_getTask(1273)
						nt_setTask(1273,today_exp+taskgiveexp)
					end
				end
			end
			PlayerIndex = nPreservedPlayerIndex;
			return
		end
		
	if ( nt_getTask(1273) >= 140000000 ) then
		Msg2Player("Xin lçi! §iÓm kinh nghiÖm h«m nay b¹n nhËn ®­îc trong ¶i Tİn sø ®· v­ît qu¸ giíi h¹n. Ngµy mai h·y ®Õn, c¸m ¬n!")
	end
end;

function messenger_killbugbear_inteam(taskgiveexp,BMapId)  --Ğ¡¹Ö¹Òµôºóµ÷ÓÃµÄ¸ø¶ÓÄÚËùÓĞÍæ¼Ò¼Ó¾­ÑéµÄ½Å±¾
	local nPreservedPlayerIndex = PlayerIndex
	local nMemCount = GetTeamSize()
	local nTaskExp = taskgiveexp * greatnight_huang_event(2)
	
	if ( nt_getTask(1273) < 140000000 ) then
		if (nMemCount == 0 ) then
			AddOwnExp(nTaskExp)	
			AddExp_Skill_Extend(taskgiveexp)
			local today_exp = nt_getTask(1273)
			nt_setTask(1273,today_exp+taskgiveexp)
			PlayerIndex = nPreservedPlayerIndex;
			return
		else
			for i = 1, nMemCount do
				PlayerIndex = GetTeamMember(i)
				local prize_mapid,prize_mapx,prize_mapy= GetWorldPos() --»ñµÃµ±Ç°Íæ¼ÒËùÔÚÎ»ÖÃ
				if ( BMapId == prize_mapid ) and ( nt_getTask(1201) == 20 or nt_getTask(1202) == 20 or nt_getTask(1203) == 20 ) and (nt_getTask(1273) < 140000000) then   --ÅĞ¶ÏÊÇ·ñÔÚÉ±ËÀ¹ÖÎïµÄÍæ¼ÒµÄËùÔÚµØÍ¼
					AddOwnExp(nTaskExp)
					AddExp_Skill_Extend(taskgiveexp)
					local today_exp = nt_getTask(1273)
					nt_setTask(1273,today_exp+taskgiveexp)
				end
			end
			PlayerIndex = nPreservedPlayerIndex;
			return
		end
	elseif ( nt_getTask(1273) >= 140000000 ) then
		Msg2Player("Xin lçi! §iÓm kinh nghiÖm h«m nay b¹n nhËn ®­îc trong ¶i Tİn sø ®· v­ît qu¸ giíi h¹n. Ngµy mai h·y ®Õn, c¸m ¬n!")
	end
end;

function messenger_killnpc_jifen(realjifen,BMapId)
	local nPreservedPlayerIndex = PlayerIndex
	local nMemCount = GetTeamSize()
	local Uworld1205 = nt_getTask(3000)
	local Uworld1274 = nt_getTask(1274)
	local nOrgRealjifen = realjifen;
	local nBeishu = greatnight_huang_event(2);
	realjifen = realjifen * nBeishu
	
	local xianzhijifen = 3500 
	if ( nBeishu == 2 or nBeishu == 3 ) then
		  xianzhijifen = 7000
	end
	
	if ( nt_getTask(1274) < xianzhijifen ) then
		if (nMemCount == 0 ) then
			nt_setTask(3000,Uworld1205+realjifen)
			nt_setTask(1274,Uworld1274+realjifen)
			if ( nt_getTask(1224) == 0 ) then
				nt_setTask(1223,nt_getTask(1223)+realjifen)
			end
			if (nBeishu > 0) then
				nOrgRealjifen = floor(nOrgRealjifen / nBeishu);
			end;
			tongaward_message(nOrgRealjifen);	--by Ğ¡É½
			PlayerIndex = nPreservedPlayerIndex;
			return
		else
			local i = random(1,nMemCount)
			PlayerIndex = GetTeamMember(i)
			local Uworld1205 = nt_getTask(3000)
			local Uworld1274 = nt_getTask(1274)
			local prize_mapid,prize_mapx,prize_mapy= GetWorldPos() --»ñµÃµ±Ç°Íæ¼ÒËùÔÚÎ»ÖÃ
			if ( BMapId == prize_mapid ) and ( nt_getTask(1201) == 20 or nt_getTask(1202) == 20 or nt_getTask(1203) == 20 ) and ( nt_getTask(1274) < xianzhijifen ) then   --ÅĞ¶ÏÊÇ·ñÔÚÉ±ËÀ¹ÖÎïµÄÍæ¼ÒµÄËùÔÚµØÍ¼
				nt_setTask(3000,Uworld1205+realjifen)
				nt_setTask(1274,Uworld1274+realjifen)
				if ( nt_getTask(1224) == 0 ) then
					nt_setTask(1223,nt_getTask(1223)+realjifen)
				end
				if (nBeishu > 0) then
					nOrgRealjifen = floor(nOrgRealjifen / nBeishu);
				end;
				tongaward_message(nOrgRealjifen);	--by Ğ¡É½
			end
			PlayerIndex = nPreservedPlayerIndex;
			return
		end
	elseif ( nt_getTask(1274) >= xianzhijifen ) then
		Msg2Player("Xin lçi! §iÓm kinh nghiÖm h«m nay b¹n nhËn ®­îc trong ¶i Tİn sø ®· v­ît qu¸ giíi h¹n. Ngµy mai h·y ®Õn, c¸m ¬n!")
	end
end

function SetTask2Team(nGetTaskid, nRealTaskid, nGoalIdx)
	local nDate = tonumber(GetLocalDate("%y%d%m"));
	local nPreservedPlayerIndex = PlayerIndex
	local nMemCount = GetTeamSize()
	
	local ntaskidx = GetTask(nGetTaskid);
	if (nMemCount == 0 ) then
		if (ntaskidx == nGoalIdx) then
			SetTask(nRealTaskid, GetTask(nRealTaskid) + 1);
		end
	else
		for i = 1, nMemCount do
			PlayerIndex = GetTeamMember(i)
			local prize_mapid,prize_mapx,prize_mapy= GetWorldPos() --»ñµÃµ±Ç°Íæ¼ÒËùÔÚÎ»ÖÃ
			local nmembertaskidx = GetTask(nGetTaskid);
			if (nmembertaskidx == nGoalIdx and nmembertaskidx == ntaskidx) then   --ÅĞ¶ÏÊÇ·ñÔÚÉ±ËÀ¹ÖÎïµÄÍæ¼ÒµÄËùÔÚµØÍ¼
				SetTask(nRealTaskid, GetTask(nRealTaskid) + 1);
			end
		end
		PlayerIndex = nPreservedPlayerIndex;
	end
end