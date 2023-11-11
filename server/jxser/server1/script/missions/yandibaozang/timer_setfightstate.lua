--¼ì²âÍæ¼Ò×´Ì¬£¬¸Ä±äÍæ¼ÒÕ½¶·×´Ì¬

Include("\\script\\missions\\yandibaozang\\include.lua")
Include("\\script\\missions\\yandibaozang\\npc.lua")

function OnTimer()
	
	local nstate = GetMissionV(YDBZ_STATE_SIGN)
	if nstate == 1 then
		local nsign = 0
		if GetMissionV(YDBZ_TEAM_COUNT) == 1 then
						local x = 1781 * 32
						local y = 3563 * 32 ;
						--print(x,y,world)
						YDBZ_add_final_npc(SubWorld,x,y)
						Msg2MSAll(YDBZ_MISSION_MATCH,"<color=yellow>L­¬ng Mi Nhi<color> t¹i n¬i s©u th¼m nhÊt cña b¶o tµng Viªm §Õ ®· ®­îc gäi ra")
						SetMissionV(YDBZ_STATE_SIGN,3)
						nsign = 1
		end
		YDBZ_setreliftpos()
		YDBZ_AddYuanJun()
		if nsign == 0 then
			SetMissionV(YDBZ_STATE_SIGN,2)
		end
	elseif nstate == 2 or nstate == 3 then
		local oldPlayerIndex = PlayerIndex
		local idx = 0
		local pidx
		for nj = 1, 100 do
			idx , pidx = GetNextPlayer(YDBZ_MISSION_MATCH, idx,0 );
			if (pidx > 0) then
					PlayerIndex = pidx
					YDBZ_setplayerstate()
			end
			if (idx == 0) then
				break;
			end;
		end
		PlayerIndex = oldPlayerIndex
	elseif nstate == 4 then
		CloseMission(YDBZ_MISSION_MATCH)
	end
	StopMissionTimer(YDBZ_MISSION_MATCH,YDBZ_TIMER_FIGHTSTATE)
end

function YDBZ_setreliftpos()
	local oldplayer = PlayerIndex
	local nteamscount = GetMissionV(YDBZ_TEAM_COUNT)
	local idx = 0
	local pidx
	for nj = 1, 100 do
			idx , pidx = GetNextPlayer(YDBZ_MISSION_MATCH, idx,0);
			if (pidx > 0) then
					PlayerIndex = pidx
					local camp = GetCurCamp()
					YDBZ_setplayerstate()
					local sf_mapid = SubWorldIdx2ID(SubWorld)
					--print(sf_mapid)
					local nlong = getn(YDBZ_FIGHTING_RELIFT[camp])
					local nram = random(1,nlong)
					SetPos(floor(YDBZ_FIGHTING_RELIFT[camp][nram][1]/32), floor(YDBZ_FIGHTING_RELIFT[camp][nram][2]/32));
					SetTempRevPos(sf_mapid,floor(YDBZ_FIGHTING_RELIFT[camp][nram][1]), floor(YDBZ_FIGHTING_RELIFT[camp][nram][2]));
			
			end
			if (idx == 0) then
				break;
			end;
	end
	PlayerIndex = oldplayer	
end

function YDBZ_setplayerstate()
	SetFightState(1)
	SetPKFlag(1)
	ForbidChangePK(1);
	DisabledUseTownP(1)
	ForbidEnmity(1)	
	SetTaskTemp(200,1)
	SetDeathType(-1)	
end

function YDBZ_AddYuanJun()
	for i = 1, 3 do 
		YDBZ_AddNpc_YuanJun(i, i)
	end
end
