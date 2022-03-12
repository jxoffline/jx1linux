--½ÓÈÎÎñµÄNpc
--¡¤²ÎÓëµÄÍæ¼ÒµÈ¼¶±ØĞë´óÓÚ40¼¶£»
--¡¤ËÎ·½µÄÍæ¼Ò±ØĞëÒªµ½ºâÉ½¶À¹Â½£´¦±¨Ãû£»
--¡¤½ğ·½µÄÍæ¼Ò±ØĞëÒªµ½ãê¾©ÑÃÃÅ¿Ú½ğ¹úÎä½«´¦±¨Ãû£»
--¡¤±¨ÃûÊ±ĞèÒª½»ÄÉÒ»¶¨µÄ½ğÇ®£»
-- Update by Dan_Deng(2003-10-23) Í¨¹ı¶Ô»°ÇĞ»»µ½Õ½³¡ÍâµÄ£¬ĞèÒª¸ü¸ÄÕ½¶·×´Ì¬Îª1

Include("\\script\\missions\\ËÎ½ğÕ½³¡PKÕ½\\ËÎ½ğÕ½³¡Í·ÎÄ¼ş.lua");


function main()


local State = GetMissionV(1) 

--Î´¿ªÊ¼
if (State == 0 ) then 
	Say("§¹i qu©n cña ta vÉn ch­a xuÊt ph¸t! H·y t¹m thêi nghØ ng¬i ®îi tin nhĞ!",0);
--	NewWorld(44, 1585,3215)
	NewWorld(100,1406,3486)
	SetFightState(1)
	return
end;

--Òì³£Çé¿öÖ±½ÓÍË³ö
if (State > 2) then
--	NewWorld(44, 1585,3215)
	NewWorld(100,1406,3486)
	SetFightState(1)
	return
end;

local GroupV = GetTask(SJTASKVLAUE);
result = 0;
--Èç¹û¸ÃÍæ¼ÒÊÇÒÑ¾­±¨Ãû¹ıµÄ£¬¶ÏÏßÖØÁ¬½øÀ´µÄ£¬ÔòÈÓ½øÈ¥
result = CheckLastBattle(2, State)
if (result == 1) then
	return
end

if (result == 2) then
	--´Ë¾ä»°ÊÇµĞ·½Íæ¼ÒÓë¶Ô·½µÄ±¨ÃûNpcµÄ¶Ô»°
	--±ÈÈç ÄãÃÇÕâĞ©ËÎ¹úµÄ²İÃñ!ÎÒÃÇ´ó½ğ¹ú½«Ê¿ÃÇ¸÷¸÷ÉÆÕ½ÖÇÓÂ,ÌúÆï×İºá......µÈ£¬ÓĞµÃÊÇÑÛÉ«¿´
	Say("Kim quèc chóng ta, ai còng lµ dòng sÜ thiÖn chiÕn, triÒu ®×nh thèi n¸t Tèng quèc c¸c ng­¬i sao xøng lµ ®èi thñ!",0)
end

--±¨ÃûÊ±ÆÚ
if (State == 1 or State == 2) then 
	MSDIdx = PIdx2MSDIdx(1, PlayerIndex);
	if (MSDIdx > 0) then 
		nGroup = GetMSIdxGroup(1, MSDIdx);
 		
 		if ( nGroup == 2 ) then 
 		--´Ë¾ä»°ÊÇ±¾·½ÒÑ±¨ÃûµÄÍæ¼ÒÓë±¨ÃûNpcµÄ¶Ô»°
    		Say("ThÒ chÕt còng trung thµnh víi §¹i Kim! §i nµo! Hìi c¸c dòng sÜ Kim quèc!",0)
  		else
    		Say("Kim quèc chóng ta, ai còng lµ dòng sÜ thiÖn chiÕn, triÒu ®×nh thèi n¸t Tèng quèc c¸c ng­¬i sao xøng lµ ®èi thñ!",0);
  		end
	
		return
	end;
end;

if (State == 1) then
	if (GetMSPlayerCount(1,2) >= MAX_J_COUNT) then
		Say("Qu©n lùc cña ta hiÖn giê ®· d­ søc tiªu diÖt Tèng qu©n. Tr¸ng sÜ xin ®îi trËn sau nhĞ!", 0)
	return
	end;
	
	--±ÈÈç,Ä¿Ç°ËÎ¹ú¹úÁ¦²»Õñ£¬ËÎ¹ú°ÙĞÕÉúÁéÍ¿Ì¿£¬ÎÒÃÇ´ó½ğ¹ú¡£¡£¡£¡£
	Say("Tèng triÒu ®· ®Õn lóc b¹i vong! C¸c ng­¬i cã muèn cïng chóng ta h­ëng vinh hoa phó quı kh«ng? ChØ cÇn ®¼ng cÊp trªn 40, ñng hé 3000 l­îng lµ cã thÓ x«ng pha giÕt ®Şch!",2, "Ta tham gia. /Yes", "§Ó ta suy nghÜ l¹i!/No");
end;

--½»Õ½Ê±ÆÚ
if (State == 2) then 
	--´ËÎªÔÚÕ½¶·ÕıÊ½´òÏìÖ®ºó£¬ÆäËüÎ´±¨ÃûÍæ¼ÒÓë±¨ÃûNpcµÄ¶Ô»°
	Say("TiÒn ph­¬ng ®ang diÔn ra chiÕn tranh, c¸c vŞ h­¬ng th©n xin t×m n¬i kh¸c l¸nh n¹n ",0);
	return 
end;

end;

function Yes()
if (GetMissionV(1) ~= 1) then
	return
end
if (GetLevel() >= 40) then 
  if (Pay(MS_SIGN_MONEY) == 1) then
  Msg2Player("Hoan nghªnh b¹n gia nhËp! C¸c dòng sÜ Kim quèc! H·y tiÕn vµo chiÕn tr­êng! ");
  V = GetMissionV(6);
  SetMissionV(6, V + 1);
  SJ_JoinJ();
  SetTask(SJKILLNPC,0);
  SetTask(SJKILLPK,0);
  --CheckGoFight()
  return 
  end;
end;

Say("B¹n ch­a ®ñ 40 cÊp hoÆc kh«ng mang ®ñ tiÒn",0);
end;

function No()
Say("Mau vÒ suy nghÜ ®i! Thêi gian cßn l¹i kh«ng nhiÒu ®©u!",0);
end;

