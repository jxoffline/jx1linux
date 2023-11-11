--ÍË³öÓÎÏ·ºóµÄÖØÉúµãID,Ò²¾ÍÊÇ±¨ÃûµÄÄÇ¸öµØ·½°É
CS_RevId = 20
CS_RevData = 10;

--¼ÓÈëË«·½ÕóÓªÊ±µÄÎ»ÖÃ
CampPos1 = {1536 , 3223 }; 	--»ÆÉ«
CampPos2 = {1563 , 3195 }; 	--×ÏÉ«
CampPos0 = {1633 , 3292 }; --½øÈëÈü³¡Ê±µÄ×ø±ê

FRAME2TIME = 18;
--ÓÎÏ·µÄ×î´óÈËÊı
MAX_MEMBER_COUNT = 16;
MS_STATE = 1;
MS_TONG1ID = 10;--Á½¸ö°ï»áµÄ°ï»áID
MS_TONG2ID = 11;

WIN_TONGEXP = 1200;
LOSE_TONGEXP = 1400;

MS_TOTALPK = 250;--¼ÇÂ¼Íæ¼Ò´òËÀÆäËüÍæ¼ÒµÄ×Ü´ÎÊı
MS_TOTALKO = 251;--¼ÇÂ¼Íæ¼ÒÔÚPKÕ½ÒÛÖĞ±»´òËÀµÄ×Ü´ÎÊı

MS_TONG1VALUE = 13; --¼ÇÂ¼°ï»á1µÄ±ÈÈüµ±Ç°µÄ»ı·Ö
MS_TONG2VALUE = 14;
MS_ARENAID = 15;

PKWINBONUS = 3;
LOSEBONUS = 1;

TIMER_1 = 20 * FRAME2TIME; --20Ãë¹«²¼Ò»ÏÂÕ½¿ö
TIMER_2 = 25 * 60  * FRAME2TIME; -- ½»Õ½×ÜÊ±¼äÎª1Hour
GO_TIME =  480 * FRAME2TIME  / TIMER_1; -- ±¨ÃûÊ±¼äÎª10

MS_NEWSVALUE = 9; --ÈÎÎñÖĞ´æ·ÅĞÂÎÅ±äÁ¿µÄµØ·½
JOINSTATE = 242;
MISSIONID = 5;
WORLDIDXBEGIN = 213;

function GetLeavePos()
	return GetTask(300), GetTask(301), GetTask(302);
end;

-------------------------------------------------------------------------
--Íæ¼ÒÒªÇóÀë¿ªÓÎÏ·
function LeaveGame()
	camp = GetCamp();--»Ö¸´Ô­Ê¼ÕóÓª
	SetRevPos(CS_RevId, CS_RevData)
	SetPunish(1)--ÉèÖÃPK³Í·£
	SetPKFlag(0)--¹Ø±ÕPK¿ª¹Ø
	SetTaskTemp(JOINSTATE, 0);
	ForbidChangePK(0);
	SetFightState(0);
	
	SetCurCamp(camp);
	SetLogoutRV(0);--ÉèÖÃÖØÉúµã
	SetCreateTeam(1);
	SetDeathScript("");--ÉèÖÃËÀÍö½Å±¾Îª¿Õ
	NewWorld(GetLeavePos())
end;

function GameOver()
	PTab = {};
	for i = 1, 500 do 
		idx , pidx = GetNextPlayer(MISSIONID, idx, 0);
		if (idx == 0 ) then 
			break
		end
		PTab[i] = pidx;
	end
	
	PCount = getn(PTab);
	OldPlayer = PlayerIndex;
	for i  = 1, PCount do 
		PlayerIndex = PTab[i]
		LeaveGame()
	end;
	PlayerIndex = OldPlayer;
end;
-------------------------------------------------------------------------

function JoinCamp(Camp)
	SetFightState(0)
	LeaveTeam()
	if (GetMSPlayerCount(MISSIONID, Camp) >= MAX_MEMBER_COUNT) then
		Say("Phe nµy hiÖn ®· ®ñ ng­êi, kh«ng thÓ gia nhËp!",0)
		return
	end;
	
	AddMSPlayer(MISSIONID, Camp);
	SetTaskTemp(JOINSTATE, 1);
	SetCurCamp(Camp);
	
	--ÉèÖÃÓë°ï»áÓĞ¹ØµÄ±äÁ¿£¬²»ÔÊĞíÔÚÕ½³¡ÖĞ¸Ä±äÄ³¸ö°ï»áÕóÓªµÄ²Ù×÷
	SetTaskTemp(200, 1);
	
	--Íæ¼ÒÍË³öÊ±£¬±£´æRV²¢£¬ÔÚÏÂ´ÎµÈÈëÊ±ÓÃRV(³ÇÊĞÖØÉúµã£¬·ÇÍË³öµã)
	SetLogoutRV(1);
	
	--ÎŞËÀÍö³Í·£
	SetPunish(0);
	
	--¹Ø±Õ×é¶Ó¹¦ÄÜ
	SetCreateTeam(0);
	
	--´ò¿ªPK¿ª¹Ø
	SetPKFlag(1)
	ForbidChangePK(1);
	
	--ÉèÖÃÖØÉúµã£¬Ò»°ãÊÇÑ¡Ôñ½øÈë¸ÃÇøµÄ³ÇÊĞ
	SetRevPos(CS_RevId, CS_RevData);
	
	--ÉèÖÃµ±Ç°Íæ¼ÒµÄËÀÍö½Å±¾
	SetDeathScript("\\script\\missions\\citywar_arena\\death.lua");
	W,X,Y = GetWorldPos();
	--ÉèÖÃÏÂ´ÎËÀÍöµÄÔİÊ±ÖØÉúµã
	if (Camp == 1) then
		SetTempRevPos(GetLeavePos());
		str = GetName().."<#> ®· vµo"..GetMissionS(1).."<#> 1 bªn, sè thµnh viªn hiÖn t¹i"..GetMSPlayerCount(MISSIONID,1);
		SetPos(CampPos1[1], CampPos1[2])
	elseif (Camp == 2) then
		SetTempRevPos(GetLeavePos());
		str = GetName().."<#> ®· vµo"..GetMissionS(2).."<#> 1 bªn, sè thµnh viªn hiÖn t¹i"..GetMSPlayerCount(MISSIONID,2);
		SetPos(CampPos2[1], CampPos2[2])
	else 
		return
	end;
		
	Msg2MSAll(MISSIONID, str);
end;


-------------------------------------------------------------------------
-----½«Ãë´«»»³É·ÖÓëÃë£¬±ÈÈç62s = 1m2s
function GetMinAndSec(nSec)
nRestMin = floor(nSec / 60);
nRestSec = mod(nSec,60)
return nRestMin, nRestSec;
end;
---------------------------------------------------------------------------
--Ê¤Àû·½»ñµÃ1800Íò½ğÇ®£¬»ñµÃ12000°ï»á¾­Ñé£»Ê§°Ü·½¼õÉÙ14000°ï»á¾­Ñé
function WinBonus(camp)
	if (camp == 1) then
		NotifyArenaResult(GetMissionV(MS_ARENAID), 1); --Í¨ÖªµÚÒ»·½Ê¤ÀûÁË
		AddTongExp(GetMissionS(1), WIN_TONGEXP )
	--	SubTongExp(GetMissionS(2), LOSE_TONGEXP)
	else
		NotifyArenaResult(GetMissionV(MS_ARENAID), 0); --Í¨ÖªµÚ¶ş·½Ê¤ÀûÁË
		AddTongExp(GetMissionS(2), WIN_TONGEXP )
	--	SubTongExp(GetMissionS(1), LOSE_TONGEXP)
	end;
end;