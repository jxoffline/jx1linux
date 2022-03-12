-- Ñ×µÛ±¦²Ø
-- by Ð¡ÀË¶à¶à
-- 2007.10.24
-- ÎÒ..
-- ÕýÔÚ³¢ÊÔ×Å..
-- Ñ°ÕÒ×ÅÊôÓÚÎÒµÄÌìµØ..


Include("\\script\\missions\\yandibaozang\\include.lua")
Include("\\script\\missions\\yandibaozang\\npc_death.lua")
Include("\\script\\missions\\yandibaozang\\doubleexp.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

function OnDeath(index)
	local oldsubworld = SubWorld
	local nteams = GetCurCamp()
	local szname1 = GetName()
	local szplayname1 = GetMissionS(YDBZ_TEAM_NAME[nteams])
	--print(nteams, szname1, "OnDeath")
	local nidx = NpcIdx2PIdx(index);
	if nidx > 0 then
		local oldplayindex = PlayerIndex
		PlayerIndex = nidx
		local nkills = GetTask(YDBZ_TEAMS_TASKID)
		local nteams2 = GetCurCamp()
		local szplayname2 = GetMissionS(YDBZ_TEAM_NAME[nteams2])
		local szname2 = GetName()
		SetTask(YDBZ_TEAMS_TASKID,(nkills + 1))
		local nexp = YDBZ_KILLPLAYER_EXP
		local szdstr = ""
		if YDBZ_sdl_getTaskByte(YDBZ_ITEM_YANDILING,1) == 1 then
			nexp = YDBZ_KILLPLAYER_EXP * 2
			szdstr = "<color=yellow>[Viªm §Õ LÖnh cã hiÖu lùc]<color>"
		end
		nexp = YDBZ_checkdoubleexp(nexp)
		AddOwnExp(nexp)
		--Msg2Player(format("%sÄã»ñµÃÁË<color=yellow>%s<color>¾­Ñé¡£",szdstr,nexp))
		local szstr = format("<color=yellow>%s<color> thµnh viªn<color=yellow>%s<color> ®¸nh träng th­¬ng <color=yellow>%s<color>  cña tæ ®éi<color=yellow>%s<color>, sè ng­êi PK t¨ng lªn <color=yellow>%s<color>, %s thu ®­îc <color=yellow>%s<color> kinh nghiÖm.",szplayname2,szname2,szplayname1,szname1,(nkills + 1),szdstr,nexp)
		Msg2MSAll(YDBZ_MISSION_MATCH,szstr)
		PlayerIndex = oldplayindex
	end


	local g = YDBZ_ZUANYONG_ITEM[1][2]
	local d = YDBZ_ZUANYONG_ITEM[1][3]
	local p = YDBZ_ZUANYONG_ITEM[1][4]
	local numzimu = CalcItemCount(-1,g,d,p,-1)
	--local numbeibao = CalcItemCount(23,g,d,p,-1)
	
	if (numzimu >= 1) then
			Msg2Player(format("Trªn hµnh trang ®¹i hiÖp cã <color=yellow>%s<color>, cã thÓ håi sinh ®­îc 1 lÇn. T¹i n¬i xuÊt ph¸t cña b¶o tµng bÊm håi sinh.",YDBZ_ZUANYONG_ITEM[1][1]))
			ConsumeItem(-1,1,g,d,p,-1)
			if GetMissionV(YDBZ_STATE_SIGN) == 2 or GetMissionV(YDBZ_STATE_SIGN) == 3 then
				local nlimittime = GetMSRestTime(YDBZ_MISSION_MATCH,YDBZ_TIMER_FIGHTSTATE)
				if nlimittime <= 1 then
					StopMissionTimer(YDBZ_MISSION_MATCH,YDBZ_TIMER_FIGHTSTATE)
					StartMissionTimer(YDBZ_MISSION_MATCH,YDBZ_TIMER_FIGHTSTATE,YDBZ_LIMIT_SETFIGHTSTATE*18)
				end
			end
			return
	end
	local world = GetMissionV(YDBZ_SIGNUP_WORLD);
	local pos_x = GetMissionV(YDBZ_SIGNUP_POSX);
	local pos_y = GetMissionV(YDBZ_SIGNUP_POSY); 
	DelMSPlayer(YDBZ_MISSION_MATCH,PlayerIndex,nteams)
	SubWorld = oldsubworld
	local szteamnametalk = {}
	local szteamlast = {}
	local szstr = format("<color=blue>Tæ ®éi %s<color> cã thµnh viªn<color=blue>%s<color> ®· tö trËn.",szplayname1,szname1)
	Msg2Player(szstr)
	Msg2MSAll(YDBZ_MISSION_MATCH,szstr);
	szstr = "<color=yellow>T×nh h×nh tæ ®éi: <color>\n"
	for i=1,3 do
			szteamnametalk[i] = GetMissionS(YDBZ_TEAM_NAME[i])
			szteamlast[i]	 = GetMSPlayerCount(YDBZ_MISSION_MATCH,i)
			local szyellow = ""
			if i == 1 then
				szyellow = "gold"
			elseif i == 2 then
				szyellow = "pink"
			elseif i == 3 then
				szyellow = "green"
			end
			if szteamnametalk[i] ~= "" then
				szstr = szstr .. format("\t\t<color=%s>Tæ ®éi %s cßn l¹i thµnh viªn: %s ng­êi<color>\n",szyellow,szteamnametalk[i],szteamlast[i])
			end
	end
	Msg2MSAll(YDBZ_MISSION_MATCH,szstr);
	--DelMSPlayer(YDBZ_MISSION_MATCH,nteams);
	NewWorld(world, pos_x, pos_y);
	SetLogoutRV(0);
	--SubWorld = oldsubworld
	--YDBZ_restore(PlayerIndex,YDBZ_MISSION_MATCH,nteams)
--	SubWorld = oldsubworld
--	if GetMSPlayerCount(YDBZ_MISSION_MATCH,nteams) == 0 then
--		local pname = GetMissionS(YDBZ_TEAM_NAME[nteams])
--		--broadcast(format("%sµÄ¶ÓÎé£¬ÔÚÑ×µÛ±¦²ØÖÐ²»Ð¡ÐÄÈ«²¿ÕóÍöÁË¡£",nteams))
--		Msg2MSAll(YDBZ_MISSION_MATCH,format("<color=yellow>%s<color>µÄ¶ÓÎé£¬ÔÚÑ×µÛ±¦²ØÖÐ²»Ð¡ÐÄÈ«²¿ÕóÍöÁË¡£",pname))
--		SetMissionS(YDBZ_TEAM_NAME[nteams],"")
--		local nteamscount = GetMissionV(YDBZ_TEAM_COUNT)
--		print(nteamscount,SubWorld)
--		SetMissionV(YDBZ_TEAM_COUNT,(nteamscount-1))
--	end
--	if GetMissionV(YDBZ_TEAM_COUNT) == 1 and GetMissionV(YDBZ_STATE_SIGN) == 1 then
--		local nidx = NpcIdx2PIdx(index);
--		local world,x,y;
--		if nidx > 0 then 
--			PlayerIndex = nidx
--			world,x,y = GetWorldPos();
--			x = x * 32
--			y = y * 32 
--			print(world)
--		else
--			x, y, world = GetNpcPos(index);
--			print("NPC")
--		end
--		print(x,y,world)
--		YDBZ_add_final_npc(world,x,y)
--		Msg2MSAll(YDBZ_MISSION_MATCH,"Ñ×µÛ±¦²Ø×îÉî´¦µÄ<color=yellow>ÁºÃÄ¶ù<color>±»ÕÙ»½³öÀ´ÁË")
--		SetMissionV(YDBZ_STATE_SIGN,2)
--	end
end
