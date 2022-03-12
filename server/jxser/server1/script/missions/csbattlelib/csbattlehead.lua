--cs¾º¼¼³¡Ä£Ê½
--ÓĞÈËÊıÏŞÖÆ£¬È»ºó½øÈëºó£¬Ë«·½Ñ¡Ôñ¶ÓÎéÕóÓª¡£¿ª´ò£¬Èç¹ûÎ´Ñ¡Îª°×Ãû£¬ÅÔ¹ÛÕß
--¼ÇÂ¼»ı·Ö¡£±ÈÈü¹ı³ÌÖĞ¿ÉÒÔ±ä»»ÕóÓª¡£
--²»ÄÜ×é¶Ó
--±ÈÈüÎŞÊ±¼äÏŞÖÆ£¬Õâ¸ö¼ÇÂ¼»á¼ÇÂ¼ÔÚÍæ¼ÒÊı¾İÖĞ
--µ½Ê±¼ä£¬×Ô¶¯±»ÌßÔ¶´¦¡£
--Èç¹ûÈËÊı²»³¬¹ıÈËÊıÉÏÏŞ£¬Ôò¿ÉÒÔÔÚ±ÈÈü¹ı³ÌÖĞÔÊĞíÆäËüÍæ¼Ò¼ÓÈë¡£
--Íæ¼ÒËÀÍö»áÔÚÆäÖĞÄ³¸öµØ·½ÖØÉú¡£
--Íæ¼ÒÈç¹û¶ÏÏßÔò£¬ÖØÉúµãÔÚÍâ

--±£´æµ±Ç°¼¤»îµÄÈÎÎñÊôÓÚÄÄÒ»ÖÖÈÎÎñµÄMissionV±äÁ¿index £¬ÒòÎªÑİÎä³¡³¡µØÄ¿Ç°ÓÃÓÚÆÕÍ¨ÑİÎä³¡ºÍ¸ßĞ£ÌôÕ½ÈüÖĞ£¬
--Í¬Ò»Ê±¶ÎÖ»ÄÜÓĞÒ»¸öÓÃ´¦¡£ËùÒÔÓÃÕâ¸ö±äÁ¿À´Çø·Ö¡£
--0±íÊ¾Ã»ÓĞÈÎÎñÈÎÎñ¼¤»î£¬1±íÊ¾ÆÕÍ¨ÑİÎä³¡£¬2±íÊ¾¸ßĞ£ÌôÕ½Èü

ACTIVEMISSION = 40;	

FRAME2TIME = 18;	--18Ö¡ÓÎÏ·Ê±¼äÏàµ±ÓÚ1ÃëÖÓ

TIMER_1 = 20 * FRAME2TIME; --20Ãë¹«²¼Ò»ÏÂÕ½¿ö
TIMER_2 = 60 * 60  * FRAME2TIME; -- ½»Õ½Ê±¼äÎª1Ğ¡Ê±

MS_STATE = 1; --ÈÎÎñÖĞ¼ÇÂ¼ÈÎÎñ×´Ì¬µÄ±äÁ¿ID
--¸Ã±äÁ¿Ö¸ÏòµÄ×´Ì¬Öµ0±íÊ¾Õ½ÒÛÎª´ò¿ª£¬1±íÊ¾Õ½ÒÛ±¨ÃûÖĞ£¬2±íÊ¾Õ½ÒÛÕ½¶·½øĞĞÖĞ£¬3±íÊ¾Õ½ÒÛ¸Õ¸Õ½áÊøÁË

MS_STORETASKID = 240;
MS_S_DEATHCOUNT = 3; --ÈÎÎñÖĞ¼ÇÂ¼1Íæ¼ÒÉËÍöÊıÁ¿µÄ±äÁ¿ID
MS_J_DEATHCOUNT = 4; --ÈÎÎñÖĞ¼ÇÂ¼2Íæ¼ÒÉËÍöÊıÁ¿µÄ±äÁ¿ID

MS_S_SIGHCOUNT  = 5;--ÈÎÎñÖĞËÎ·½¹²±¨ÃûµÄÈËÊı
MS_J_SIGHCOUNT  = 6;--ÈÎÎñÖĞ½ğ·½¹²±¨ÃûµÄÈËÊı

MS_NEWSVALUE = 10; --ÈÎÎñÖĞ´æ·ÅĞÂÎÅ±äÁ¿µÄµØ·½
PLAYER_KILLCOUNT = 240; --ÁÙÊ±±äÁ¿,temptask
PLAYER_DEATHCOUNT = 241;
JOINSTATE = 242;

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
	
	if (leavetype == 0) then 
		SetCurCamp(0)
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
	for i = 1 , 500 do 
		idx, pidx = GetNextPlayer(2,idx, 0);
		if (idx == 0) then 
	 		break
	 	end;
	 	PlayerIndex = pidx;
	 	LeaveGame(1);
	end;
end;
-------------------------------------------------------------------------

function JoinCamp(Camp)
	--ÔÚµÚ¶şMissionÄÚ¼Óµ±Ç°Íæ¼Ò
	LeaveTeam()
	if (GetMSPlayerCount(2,Camp) >= MAX_MEMBER_COUNT) then
		Say("Phe nµy hiÖn ®· ®ñ ng­êi, kh«ng thÓ gia nhËp!",0)
		return
	end;
	AddMSPlayer(2, Camp);
	SetTaskTemp(JOINSTATE, 1);
	SetCurCamp(Camp);
	
	--ÉèÖÃÓë°ï»áÓĞ¹ØµÄ±äÁ¿£¬²»ÔÊĞíÔÚ¾º¼¼³¡Õ½¸Ä±äÄ³¸ö°ï»áÕóÓªµÄ²Ù×÷
	SetTaskTemp(200,1);
	
	--ÉèÖÃÕ½¶·×´Ì¬
	SetFightState(1);
	
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
	SetDeathScript("\\script\\missions\\cs¾º¼¼³¡\\csbattledeath.lua");
	
	--ÉèÖÃÏÂ´ÎËÀÍöµÄÖØÉúµã
	if (Camp == 1) then
		SetTempRevPos(W, CS_OuterPos[2] * 32, CS_OuterPos[3] * 32);
		str = GetName().."<#> gia nhËp phe Vµng, nh©n sè hiÖn t¹i lµ"..GetMSPlayerCount(2,1);
		SetPos(CS_CampPos1[2], CS_CampPos1[3])
	elseif (Camp == 2) then
		SetTempRevPos(W, CS_OuterPos[2] * 32, CS_OuterPos[3] * 32);
		str = GetName().."<#> gia nhËp phe Tİm, nh©n sè hiÖn t¹i lµ"..GetMSPlayerCount(2,2);
		SetPos(CS_CampPos2[2], CS_CampPos2[3])
	elseif (Camp == 4) then
		SetTempRevPos(GetTaskTemp(300), GetTaskTemp(301) * 32, GetTaskTemp(302)* 32);
		str = GetName().."<#> gia nhËp chiÕn ®Êu, nh©n sè hiÖn t¹i lµ"..GetMSPlayerCount(2,4);
		SetPos(CS_CampPos4[2], CS_CampPos4[3])
		SetDeathScript("\\script\\missions\\hsbattle\\hsbattledeath.lua");
	end;
	
	--ÏòµÚ2¸öMission(Ò²¾ÍÊÇÑİÎä³¡)µÄËùÓĞÈË·¢ĞÅÏ¢
	Msg2MSAll(2, str);
	
end;

-------------------------------------------------------------------------
-----½«Ãë´«»»³É·ÖÓëÃë£¬±ÈÈç62s = 1m2s
function GetMinAndSec(nSec)
nRestMin = floor(nSec / 60);
nRestSec = mod(nSec,60)
return nRestMin, nRestSec;
end;
---------------------------------------------------------------------------
