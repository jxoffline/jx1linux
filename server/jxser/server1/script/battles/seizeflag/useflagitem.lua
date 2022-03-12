IncludeLib("BATTLE");
IncludeLib("SETTING");
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\seizeflag\\head.lua")

InDist=4;--´ïµ½Ä¿µÄµØ·¶Î§

function main()
--¿´Íæ¼Òµ±Ç°Î»ÖÃÊÇ·ñ´¦ÔÚ¶áÆìµØÍ¼ÉÏ
	W,X,Y=GetWorldPos();
	X = floor(X / 8);
	Y = floor(Y / 16);

	X1 = floor(BT_GetData(PL_PARAM1) / (32*8))
	Y1 = floor(BT_GetData(PL_PARAM2) /(32*16))

	if (X1 == 0 or Y1 == 0) then
		Msg2Player("B¹n hiÖn ch­a ®o¹t cê, kh«ng thÓ sö dông Cê hiÖu!")--??Ã»ÓÐÊ¹ÓÃÆì±êµÄÌáÊ¾ÐÅÏ¢
		return 1
	end
	strmsg = "B¹n cÇn ph¶i chuyÓn So¸i kú ®Õn <color=yellow>"..X1..","..Y1.."<color>";
	Dist=floor(sqrt((X-X1)*(X-X1)+(Y-Y1)*(Y-Y1)));
	
	if(Dist>=InDist) then
				Msg2Player(strmsg)
				return 1
	else
		BT_SetData(PL_SNAPFLAG, BT_GetData(PL_SNAPFLAG) + 1);
		bt_addtotalpoint(BT_GetTypeBonus(PL_SNAPFLAG, GetCurCamp()))
		BT_SortLadder();
		BT_BroadSelf();
		
		if (GetCurCamp() == 1) then
			sf_setflagposinfo(1, 0, 0)
			BT_SetGameData(GAME_CAMP1, BT_GetGameData(GAME_CAMP1) + 1)
		elseif(GetCurCamp() == 2) then
			sf_setflagposinfo(2, 0, 0)
			BT_SetGameData(GAME_CAMP2, BT_GetGameData(GAME_CAMP2) + 1)
		end;
		BT_BroadGameDataToAll();
		
		if (GetCurCamp() == 1) then
			SetMissionV(MS_TOTALFLAG_S, GetMissionV(MS_TOTALFLAG_S) + 1)
		else
			SetMissionV(MS_TOTALFLAG_J, GetMissionV(MS_TOTALFLAG_J) + 1)
		end
		--Èç¹ûÊÇ¹Ì¶¨Ä£Ê½Ê±£¬½«×Ô¶¯Éú³ÉÏÂÒ»¸öÆì
		if (GetMissionV(MS_FLAGMODE) == 1) then
			if (GetCurCamp() == 1 and  GetMissionV(MS_TOTALFLAG_S) < TOTALFLAG_FIX) then
				sf_createflag(GetCurCamp(), BT_GetGameData(GAME_CAMP1AREA), BT_GetGameData(GAME_CAMP2AREA))
			elseif(GetCurCamp() == 2 and  GetMissionV(MS_TOTALFLAG_J) < TOTALFLAG_FIX) then
				sf_createflag(GetCurCamp(), BT_GetGameData(GAME_CAMP2AREA), BT_GetGameData(GAME_CAMP1AREA))
			end
			BT_BroadGameDataToAll()
		end;


		RestoreOwnFeature();
		AddSkillState(460, 1, 0, 0 ) --ÑÕÉ«¹â»·£¬·Ö±çµÐÎÒ
		AddSkillState(656, 30, 0, 0) --½µÍæ¼ÒµÄËÙ¶È
		AddSkillState(461, 1, 0, 0) --ÑÕÉ«¹â»·£¬·Ö±çµÐÎÒ
		
		OldPlayer = PlayerIndex
		
		local award_snapflag = 50 * bt_getgn_awardtimes()
		
		if (GetCurCamp()==1) then
			sf_setflagplayer(1, 0)
			Msg2MSAll(MISSIONID, "phe Tèng <color=yellow>"..GetName().."<color> ®· chuyÓn thµnh c«ng 1 So¸i Kú ");--×óÏÂ½ÇµÄ¼´Ê±Õ½¿ö£º"GetCamp·½Íæ¼ÒGetName()³É¹¦ÔËËÍË§Æìµ½´ïÄ¿µÄµØ£¡"
			Msg2MSAll(MISSIONID, "phe Tèng mçi ng­êi nhËn ®­îc <color=yellow>"..award_snapflag.."<color> ®iÓm tÝch lòy");
			local idx = 0;
			for i = 1 , 500 do 
				idx, pidx = GetNextPlayer(MISSIONID,idx, 1);
				if (pidx > 0) then
					PlayerIndex = pidx
					bt_addtotalpoint(award_snapflag)
				end
				
				if (idx <= 0) then 
			 		break
			 	end;
			end 
		else
			sf_setflagplayer(2, 0)
			Msg2MSAll(MISSIONID, "phe Kim<color=yellow>"..GetName().."<color> ®· chuyÓn thµnh c«ng 1 So¸i Kú ");--×óÏÂ½ÇµÄ¼´Ê±Õ½¿ö£º"GetCamp·½Íæ¼ÒGetName()³É¹¦ÔËËÍË§Æìµ½´ïÄ¿µÄµØ£¡"
			Msg2MSAll(MISSIONID, "phe Kim mçi ng­êi nhËn ®­îc <color=yellow>"..award_snapflag.."<color> ®iÓm tÝch lòy");
			local idx = 0;
			for i = 1 , 500 do 
				idx, pidx = GetNextPlayer(MISSIONID,idx, 2);
				if (pidx > 0) then
					PlayerIndex = pidx
					bt_addtotalpoint(award_snapflag)
				end
				
				if (idx <= 0) then 
			 		break
			 	end;
			end 
		end
		
		PlayerIndex = OldPlayer
		
		BT_SetData(PL_PARAM1 ,0)
		BT_SetData(PL_PARAM2, 0)
		ST_SyncMiniMapObj(-1, -1);
		--ÏµÍ³Í¨¸æ£ºX·½£¨¸ÃÍæ¼ÒËùÔÚ·½£©XX£¨Íæ¼ÒÃû£©³É¹¦ÔËËÍË§Æìµ½´ïÄ¿µÄµØ£¬Ä¿Ç°X£¨¸ÃÍæ¼ÒËùÔÚ·½£©·½¶áµÃµÄË§ÆìÊýÁ¿Îª£ºXX¡£
		return 0
	end
end
	
	