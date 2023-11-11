--¹¥³ÇÕ½ ÖÐ×ªµØÍ¼to³ÇÕ½µØÍ¼£¨¹¥³Ç·½£©
--Trap ID£º¹¥³ÇÕ½
Include("\\script\\missions\\citywar_global\\head.lua");
Include("\\script\\missions\\citywar_city\\head.lua");
Include("\\script\\missions\\citywar_city\\camper.lua");

function main()
	SubWorldOld = SubWorld-- ¼ÇÂ¼Ô­Ê¼µÄSubWorld
	WorldID = SubWorldIdx2ID(SubWorld); --»ñµÃµ±Ç°µØÍ¼µÄIDºÅ
	
	idx = SubWorldID2Idx(221); --»ñµÃÖ÷Õ½³¡µÄÊÇ·ñÔÚ±¾·þÎñÆ÷ÖÐ
	
	if (idx < 0) then 
		return --²»´æÔÚÔò·µ»Ø
	end;
	
	SubWorld = idx;
	if (GetMissionV(MS_STATE) == 0) then 
		Say("Phe ta hiÖn ®ang tËp hîp chuÈn bÞ vµo ®Êu tr­êng! Xin mäi ng­êi h·y b×nh tÜnh, chuÈn bÞ tinh thÇn!", 0);
		SubWorld = SubWorldOld;
		return
	end
	
	
	if (WorldID == 222) then  --Èç¹ûµ±Ç°Î»ÖÃÊÇÔÚÊØ·½µÄºó·½£¬Ôò±íÊ¾¼ÓÈëºó·½
		CheckAndJoin(1)
		SubWorld = SubWorldOld;
	else					--Èç¹ûµ±Ç°Î»ÖÃÊÇÔÚ¹¥·½µÄºó·½£¬Ôò±íÊ¾Òª¼ÓÈë¹¥·½
		--T = GetMissionV(MS_NEWSVALUE);
	
		--ÊØ·½ÏÈ¹¥·½5·ÖÖÓÈë³¡
		--if (T < 5) then 
		--	Say("Ä¿Ç°ÎÒ·½¾ü¶ÓÕýÔÚ¾Û¼¯£¬¼´¿Ì¿ÉÒÔ½øÈëÕ½³¡£¬Çë´ó¼ÒÑø¾«ÐîÈñ¡¢ÉÔ°²ÎðÔê£¡",0)
		--	return
		--end;
	
		CheckAndJoin(2)
		SubWorld = SubWorldOld;
	end;
end;

function CheckAndJoin(Camp)
	if (GetTongName() == GetMissionS(Camp)) then  --ÊôÓÚ¸Ã°ï»áÔò±íÊ¾Íæ¼ÒÎªÕý¹æ¾ü£¬ÔÊÐí½øÈë
		if (GetJoinTongTime() >= 7200) then
			if (GetTask(TV_TASKKEY) ~= GetMissionV(MS_KEY)) then
				BT_SetData(PL_KEYNUMBER, 0)
				BT_SetData(PL_TOTALPOINT, 0)
				SetTask(1017, 0)
				SetTask(TV_SERIESKILL_REALY,0)
				BT_SetData(PL_BATTLECAMP, 0)
				SetTask(TV_TASKKEY , GetMissionV(MS_KEY));
				BT_LeaveBattle()
				BT_ClearPlayerData()
			end;
			JoinCamp(Camp, 1);
		else
			if (JoinWithCard(Camp, 0) == 0) then 
				Say("Thêi gian b¹n gia nhËp bang héi qu¸ ng¾n, kh«ng thÓ tham gia chiÕn ®Êu!", 0);
			end;
		end;
	else
		JoinWithCard(Camp, 1)
	end;
end;

--return 0 ±íÊ¾¿¨¶¼Ã»ÓÐ£¬ 1±íÊ¾ÓÐ¿¨
function JoinWithCard(Camp, UI)
	CityID = GetWarOfCity();
	--Èç¹ûÒÑÊ¹ÓÃ¹ýÆ±Èë³¡¹ý£¬ÔòÖ±½Ó·ÅÐÐ
	if (GetTask(TV_TASKKEY) == GetMissionV(MS_KEY) and GetTask(TV_TASKVALUE) == Camp) then
		JoinCamp(Camp,2)
	else
		if (CityID == 0) then 
			print("Error! CityID == 0");
			return 0
		end;
	
		--Èç¹ûÃ»ÓÐÆ±Ôò²»ÈÃ½ø
		CardItemID = 0;
		Camp = 1;
		if (GetItemCountEx(CardTab[CityID * 2 - 1]) >= 1) then 
			CardItemID = CardTab[CityID * 2 - 1];
			Camp = 2;
		elseif (GetItemCountEx(CardTab[CityID * 2]) >= 1) then
			CardItemID = CardTab[CityID * 2];
			Camp = 1;
		else
			if (UI == 1) then
				Say("Ng­¬i kh«ng cã lÖnh bµi lµm sao vµo ®­îc! §i ®i!", 0);
			end

			SetPos(OuterPos[1][2], OuterPos[1][3])
			return 0
		end;

		life = GetItemLife(CardItemID);
		life = floor(life / 1440);
		if (life > 5) then
			DelItemEx(CardItemID);
			Say(format("LÖnh bµi nµy tõ %d ngµy tr­íc ®· hÕt h¹n, kh«ng thÓ dïng ®­îc", life), 0);
			SetPos(OuterPos[1][2], OuterPos[1][3])
		else
			DelItemEx(CardItemID);
			BT_SetData(PL_KEYNUMBER, 0)
			BT_SetData(PL_TOTALPOINT, 0)
			SetTask(1017, 0)
			SetTask(TV_SERIESKILL_REALY,0)
			SetTask(TV_TASKID, MISSIONID)
			SetTask(TV_TASKKEY , GetMissionV(MS_KEY));
			SetTask(TV_TASKVALUE, Camp)
			SetTask(TV_CITYID, CityID)
			BT_LeaveBattle()
			BT_ClearPlayerData()
			JoinCamp(Camp,2)
		end
	end;
	return 1
end;
