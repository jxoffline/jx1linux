--ÌôÕ½ÈüÄ£Ê½

--1¡¢ÓÉGM¸ø¸÷¸öÇøµÄ¸ßĞ£¸ºÔğÈË.ÕÊºÅ¼Ó¸½¼Óµã
--2¡¢¸ßĞ£¸ºÔğÈËÔÚ±ÈÈü±¨Ãû½×¶Îµ½Èü³¡£¬ÓëNpc¶Ô»°»ñµÃµÀ¾ß£¬·Ö±ğÊÇÕı¡¢Ğ°¡¢°×¡¢Èı¸öÕóÓª²»Í¬µÄÃÅÅÆ¡£
--3¡¢¸ºÔğÈËÄÃµ½µÀ¾ßºó½»¸ø±ÈÈüË«·½µÄ¶Ó³¤¡£
--4¡¢¶Ó³¤µÃµ½µÀ¾ßºó£¬×é¶Ó×ÔÒÑµÄ5ÈË¶ÓÎé¡£È»ºóÄÃÆ±½ø³¡¡£
--5¡¢½ø³¡ºó£¬×÷ÈüÇ°×¼±¸¡£
--6¡¢±ÈÈü½áÊøºó¡£¸ºÔğÈË¼ÇÂ¼±ÈÈü³É¼¨£¬Ïò¹Ù·½Í¨±¨¡£


--±£´æµ±Ç°¼¤»îµÄÈÎÎñÊôÓÚÄÄÒ»ÖÖÈÎÎñµÄMissionV±äÁ¿index £¬ÒòÎªÑİÎä³¡³¡µØÄ¿Ç°ÓÃÓÚÆÕÍ¨ÑİÎä³¡ºÍ¸ßĞ£ÌôÕ½ÈüÖĞ£¬
--Í¬Ò»Ê±¶ÎÖ»ÄÜÓĞÒ»¸öÓÃ´¦¡£ËùÒÔÓÃÕâ¸ö±äÁ¿À´Çø·Ö¡£
--0±íÊ¾Ã»ÓĞÈÎÎñÈÎÎñ¼¤»î£¬1±íÊ¾ÆÕÍ¨ÑİÎä³¡£¬2±íÊ¾¸ßĞ£ÌôÕ½Èü

ACTIVEMISSION = 40;

FRAME2TIME = 18;	--18Ö¡ÓÎÏ·Ê±¼äÏàµ±ÓÚ1ÃëÖÓ

TIMER_1 = 20 * FRAME2TIME; --20Ãë¹«²¼Ò»ÏÂÕ½¿ö
TIMER_2 = 20 * 60  * FRAME2TIME; -- ½»Õ½×ÜÊ±¼äÎª20·ÖÖÓ
GO_TIME =  300 * FRAME2TIME  / TIMER_1; -- ±¨ÃûÊ±¼äÎª°ëĞ¡Ê±

MS_STATE = 1; --ÈÎÎñÖĞ¼ÇÂ¼ÈÎÎñ×´Ì¬µÄ±äÁ¿ID
--¸Ã±äÁ¿Ö¸ÏòµÄ×´Ì¬Öµ0±íÊ¾Õ½ÒÛÎª´ò¿ª£¬1±íÊ¾Õ½ÒÛ±¨ÃûÖĞ£¬2±íÊ¾Õ½ÒÛÕ½¶·½øĞĞÖĞ£¬3±íÊ¾Õ½ÒÛ¸Õ¸Õ½áÊøÁË

MS_STORETASKID = 240;
MS_S_DEATHCOUNT = 3; --ÈÎÎñÖĞ¼ÇÂ¼1Íæ¼ÒÉËÍöÊıÁ¿µÄ±äÁ¿ID
MS_J_DEATHCOUNT = 4; --ÈÎÎñÖĞ¼ÇÂ¼2Íæ¼ÒÉËÍöÊıÁ¿µÄ±äÁ¿ID

MS_S_SIGHCOUNT  = 5;--ÈÎÎñÖĞËÎ·½¹²±¨ÃûµÄÈËÊı
MS_J_SIGHCOUNT  = 6;--ÈÎÎñÖĞ½ğ·½¹²±¨ÃûµÄÈËÊı
MS_S_JOINED = 7;  --ÈÎÎñÖĞËÎ·½ÒÑ¾­½øÈë±ÈÈü³¡µØ±äÁ¿ID
MS_J_JOINED = 8;  --ÈÎÎñÖĞ½ğ·½ÒÑ¾­½øÈë±ÈÈü³¡µØ±äÁ¿ID

MS_NEWSVALUE = 10; --ÈÎÎñÖĞ´æ·ÅĞÂÎÅ±äÁ¿µÄµØ·½
PLAYER_KILLCOUNT = 240; --ÁÙÊ±±äÁ¿,temptask
PLAYER_DEATHCOUNT = 241;
JOINSTATE = 242;
MISSIONID = 4;


-------------------------------------------------------------------------
--Íæ¼ÒÒªÇóÀë¿ªÓÎÏ·
function LeaveGame(leavetype)
--leavetype = 0±íÊ¾£¬½«Î»ÖÃÉèÔÚµØÍ¼µÄ³¡ÍâÇøÓò£¨·ÇÕ½¶·ÇøÓò£©
--leavetype = 1±íÊ¾£¬½«Î»ÖÃÉèÔÚÁíÒ»¸öµØÍ¼£¬¼´³¹µ×Àë¿ªÕ½³¡
	camp = GetCamp();--»Ö¸´Ô­Ê¼ÕóÓª
	SetRevPos(CS_RevId, CS_RevData)
	SetFightState(1)
	SetPunish(1)--ÉèÖÃPK³Í·£
	SetPKFlag(0)--¹Ø±ÕPK¿ª¹Ø
	SetTaskTemp(JOINSTATE, 0);
	ForbidChangePK(0);
	SetCreateTeam(1);
	if (leavetype == 0) then 
		SetCurCamp(camp)
		SetFightState(0)
		SetPos(CS_OuterPos[2], CS_OuterPos[3]);
	else
		SetCurCamp(camp);
		SetLogoutRV(0);--ÉèÖÃÖØÉúµã
		SetCreateTeam(1);
		SetDeathScript("");--ÉèÖÃËÀÍö½Å±¾Îª¿Õ
		NewWorld(GetLeavePos());
	end;
end;

function GameOver()
	idx = 0;
	OldPlayer = PlayerIndex;
	for i = 1 , 500 do 
		idx, pidx = GetNextPlayer(MISSIONID,idx, 0);
		if (idx == 0) then 
	 		break
	 	end;
	 	PlayerIndex = pidx;
	 	LeaveGame(0);
	end;
	PlayerIndex = OldPlayer;
end;
-------------------------------------------------------------------------

function JoinCamp(Camp)
	--ÔÚµÚ¶şMissionÄÚ¼Óµ±Ç°Íæ¼Ò
	LeaveTeam()
	if (GetMSPlayerCount(MISSIONID,Camp) >= MAX_MEMBER_COUNT) then
		Say("Phe nµy hiÖn ®· ®ñ ng­êi, kh«ng thÓ gia nhËp!",0)
		return
	end;
	
	AddMSPlayer(MISSIONID, Camp);
	SetTaskTemp(JOINSTATE, 1);
	SetCurCamp(Camp);
	
	--ÉèÖÃÓë°ï»áÓĞ¹ØµÄ±äÁ¿£¬²»ÔÊĞíÔÚ¾º¼¼³¡Õ½¸Ä±äÄ³¸ö°ï»áÕóÓªµÄ²Ù×÷
	SetTaskTemp(200,1);

	--ÉèÖÃÕ½¶·×´Ì¬
	SetFightState(0);
	
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
	--Íæ¼ÒËÀÍöºó£¬ÖØÉúµÄµØ·½¾ÍÉèÔÚÍæ¼ÒÏëÍË³öµÄµØµã£¨ÔÚ±¾µØÍ¼ÉÏ·ÇÕ½¶·ÇøÓò)
	W,X,Y = GetWorldPos();
	
	--ÉèÖÃµ±Ç°Íæ¼ÒµÄËÀÍö½Å±¾
	if (Camp == 1) then 
		SetDeathScript("\\script\\missions\\challenge\\challengedeath.lua");
	elseif (Camp == 2) then 
		SetDeathScript("\\script\\missions\\challenge\\challengedeath1.lua");
	end
	
	
	--ÉèÖÃÏÂ´ÎËÀÍöµÄÖØÉúµã
	if (Camp == 1) then
		SetTempRevPos(W, CS_OuterPos[2] * 32, CS_OuterPos[3] * 32);
		str = GetName().."<#> gia nhËp phe Vµng, nh©n sè hiÖn t¹i lµ"..GetMSPlayerCount(MISSIONID,1);
		SetPos(CS_CampPos1[2], CS_CampPos1[3])
	elseif (Camp == 2) then
		SetTempRevPos(W, CS_OuterPos[2] * 32, CS_OuterPos[3] * 32);
		str = GetName().."<#> gia nhËp phe Tİm, nh©n sè hiÖn t¹i lµ"..GetMSPlayerCount(MISSIONID,2);
		SetPos(CS_CampPos2[2], CS_CampPos2[3])
	elseif (Camp == 6) then
		SetTempRevPos(GetTask(300), GetTask(301) * 32, GetTask(302)* 32);
		str = GetName().."<#> tham gia quan chiÕn, nh©n sè hiÖn t¹i lµ"..GetMSPlayerCount(MISSIONID,6);
		SetPos(CS_CampPos0[2], CS_CampPos0[3])
	end;
	
	--ÏòËùÓĞ²ÎÓÚÕß·¢ĞÅÏ¢
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

--ÍË³öÓÎÏ·ºóµÄÖØÉúµãID,Ò²¾ÍÊÇ±¨ÃûµÄÄÇ¸öµØ·½°É
CS_RevId = 80;
CS_RevData = 36;

--Àë¿ª±¾´ÎÓÎÏ·ºóµÄÎ»ÖÃworldid, x, y,Ò»°ã¾ÍÊÇ±¨Ãûµã
--CS_LeavePos = {20, 3546, 6226};

--»á³¡ÍâµÄÎ»ÖÃ
CS_OuterPos = {209, 1548, 3297};


--¼ÓÈëË«·½ÕóÓªÊ±µÄÎ»ÖÃ
CS_CampPos0 = {209, 1631, 3203};   	--°×É«
CS_CampPos1 = {209, 1608, 3167}; 	--»ÆÉ«
CS_CampPos2 = {209, 1674, 3246}; 	--ºìÉ«


--ÓÎÏ·µÄÃ¿Ò»ÕóÓªµÄ×î´óÈËÊı
MAX_MEMBER_COUNT = 5;

MS_CAMP1 = 1; --Ë«·½µÄÕóÓªºÅ
MS_CAMP2 = 2;

function GetLeavePos()
	return GetTask(300), GetTask(301), GetTask(302);
end;
