--Íæ¼ÒËÀÍö½Å±¾

Include("\\script\\missions\\tongwar\\match\\head.lua")

function OnDeath(Launcher)
	
	State = GetMissionV(MS_STATE) ;
	if (State ~= 2) then
		return
	end;

	PlayerIndex1 = NpcIdx2PIdx(Launcher);
	OrgPlayer  = PlayerIndex;
	DeathName = GetName();
	deathcamp = GetCurCamp();
	currank = tongwar_getdata(TONGWAR_RLTASK_CURRANK)
	

	if (PlayerIndex1 > 0) then
		PlayerIndex = PlayerIndex1;
		launchrank = tongwar_getdata(TONGWAR_RLTASK_CURRANK)
		if (GetCurCamp() ~= deathcamp) then
			LaunName = GetName();
			
			--¸üÐÂÉ±NpcÊýÄ¿ºÍÅÅÐÐ°ñ
			tongwar_setdata(TONGWAR_RLTASK_KILLPLAYER, tongwar_getdata(TONGWAR_RLTASK_KILLPLAYER) + 1); --¼ÇÂ¼Íæ¼ÒÉ±ÆäËüÍæ¼ÒµÄ×ÜÊý
			serieskill = tongwar_getdata(TONGWAR_RLTASK_SERIESKILL) + 1;
			tongwar_setdata(TONGWAR_RLTASK_SERIESKILL, serieskill); --¼ÇÂ¼Íæ¼Òµ±Ç°µÄÁ¬Õ¶Êý
		
		if (TAB_SERIESKILL[launchrank][currank] == 1) then
			serieskill_r = GetTask(TV_SERIESKILL_REALY) 
			serieskill_r = serieskill_r + 1
			SetTask(TV_SERIESKILL_REALY,serieskill_r)
			if (mod(serieskill_r, 3) == 0) then
				if (deathcamp == 1) then
					bt_addtotalpoint(tongwar_GetTypeBonus(BONUS_MAXSERIESKILL))
					but_addmissionpoint(tongwar_GetTypeBonus(BONUS_MAXSERIESKILL))
					Msg2Player("<color=yellow> b¹n nhËn ®­îc ®iÓm tÝch lòy Liªn tr¶m "..tongwar_GetTypeBonus(BONUS_MAXSERIESKILL))
				else
					bt_addtotalpoint(tongwar_GetTypeBonus(BONUS_MAXSERIESKILL))
					but_addmissionpoint(tongwar_GetTypeBonus(BONUS_MAXSERIESKILL))
					Msg2Player("<color=yellow> b¹n nhËn ®­îc ®iÓm tÝch lòy Liªn tr¶m "..tongwar_GetTypeBonus(BONUS_MAXSERIESKILL))
				end
			end
			if (mod(tongwar_getdata(TONGWAR_RLTASK_KILLPLAYER), 5) == 0) then
				tongwar_setdata(TONGWAR_RLTASK_MAXDEATH, GetTask(TONGWAR_RLTASK_MAXDEATH) + 1)
				Msg2Player("<color=green>Sè lÇn tö vong t¨ng lªn:"..(GetTask(TONGWAR_RLTASK_MAXDEATH)- GetTask(TONGWAR_RLTASK_NDEATH)).."lÇn")
			end
		end
			
		if (tongwar_getdata(TONGWAR_RLTASK_MAXSERIESKILL) < serieskill) then 
				tongwar_setdata(TONGWAR_RLTASK_MAXSERIESKILL, serieskill) -- Í³¼ÆÍæ¼ÒµÄ×î´óÁ¬Õ¶Êý
		end
			
		local rankradio = 1;
			
		if ( RANK_PKBONUS[launchrank] == nil or RANK_PKBONUS[launchrank][currank] == nil) then
			rankradio = 1
			print("battle rank tab error!!!please check it !")
		else
			rankradio = RANK_PKBONUS[launchrank][currank]
		end
		local earnbonus = 0
		if (deathcamp == 1) then
			earnbonus = floor(tongwar_GetTypeBonus(BONUS_KILLPLAYER) * rankradio)
		else
			earnbonus = floor(tongwar_GetTypeBonus(BONUS_KILLPLAYER) * rankradio)
		end
		bt_addtotalpoint(earnbonus)
		but_addmissionpoint(earnbonus)
			
			local rankname = "";
			rankname = tbRANKNAME[currank]
			launchrank = tongwar_getdata(TONGWAR_RLTASK_CURRANK);
			launrankname = tbRANKNAME[launchrank]
			BT_SortLadder();
			BT_BroadSelf();
		
			if (GetCurCamp()  == 1) then
				str  = GetMissionS(MS_S_CITYNAME_S)..launrankname..LaunName.." giÕt ®­îc"..GetMissionS(MS_S_CITYNAME_J)..rankname..DeathName..", tæng PK lµ "..tongwar_getdata(TONGWAR_RLTASK_KILLPLAYER);
			else
				str  = GetMissionS(MS_S_CITYNAME_J)..launrankname..LaunName.." giÕt ®­îc"..GetMissionS(MS_S_CITYNAME_S)..rankname..DeathName..", tæng PK lµ "..tongwar_getdata(TONGWAR_RLTASK_KILLPLAYER);
			end
			Msg2Player("<color=pink> Chóc mõng! B¹n ®· h¹ ®­îc:"..rankname..DeathName..", Tæng PK lµ "..tongwar_getdata(TONGWAR_RLTASK_KILLPLAYER));
			Msg2MSAll(MISSIONID, str);
		end
		PlayerIndex = OrgPlayer;
	end;

	tongwar_setdata(TONGWAR_RLTASK_NDEATH, tongwar_getdata(TONGWAR_RLTASK_NDEATH) + 1)
	tongwar_setdata(TONGWAR_RLTASK_SERIESKILL, 0)
	SetTask(TV_SERIESKILL_REALY,0)
	Msg2Player("<color=green>Sè lÇn tö vong cßn l¹i:"..(GetTask(TONGWAR_RLTASK_MAXDEATH)- GetTask(TONGWAR_RLTASK_NDEATH)).."lÇn")
	BT_SortLadder();
	BT_BroadSelf();
	sf_onplayerleave()
	tongwar_setdata(TONGWAR_RLTASK_LASTDTIME, GetGameTime())
end