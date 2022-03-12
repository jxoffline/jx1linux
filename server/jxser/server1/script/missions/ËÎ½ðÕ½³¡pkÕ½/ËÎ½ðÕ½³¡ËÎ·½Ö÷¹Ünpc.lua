--½ÓÈÎÎñµÄNpc
--¡¤²ÎÓëµÄÍæ¼ÒµÈ¼¶±ØĞë´óÓÚ40¼¶£»
--¡¤ËÎ·½µÄÍæ¼Ò±ØĞëÒªµ½ºâÉ½¶À¹Â½£´¦±¨Ãû£»
--¡¤½ğ·½µÄÍæ¼Ò±ØĞëÒªµ½ãê¾©ÑÃÃÅ¿Ú½ğ¹úÎä½«´¦±¨Ãû£»
--¡¤±¨ÃûÊ±ĞèÒª½»ÄÉÒ»¶¨µÄ½ğÇ®£»

Include("\\script\\missions\\ËÎ½ğÕ½³¡PKÕ½\\ËÎ½ğÕ½³¡Í·ÎÄ¼ş.lua");

function main()

local State = GetMissionV(1) 

--Î´¿ªÊ¼
if (State == 0 ) then 
	Say("§¹i qu©n cña ta vÉn ch­a xuÊt ph¸t! H·y t¹m thêi nghØ ng¬i ®îi tin nhĞ!",0);
	NewWorld(78,1768,3098)
	SetFightState(1)
	return
end;

--Òì³£Çé¿öÖ±½ÓÍË³ö
if (State > 2) then
	NewWorld(78,1768,3098)
	SetFightState(1)
	return
end;


local GroupV = GetTask(SJTASKVLAUE);
--Èç¹û¸ÃÍæ¼ÒÊÇÒÑ¾­±¨Ãû¹ıµÄ£¬¶ÏÏßÖØÁ¬½øÀ´µÄ£¬ÔòÈÓ½øÈ¥
result = CheckLastBattle(1, State);
if (result == 1) then
	return
end

if (result == 2) then
	--´Ë¾ä»°ÊÇµĞ·½Íæ¼ÒÓë¶Ô·½µÄ±¨ÃûNpcµÄ¶Ô»°
	Say("Ng­êi Kim bän ng­¬i, x©m l­îc giang s¬n, giÕt h¹i ®ång bµo ta! Ta thÒ quyÕt cïng bän ng­¬i mét mÊt mét cßn!",0)
end


--±¨ÃûÊ±ÆÚ
if (State == 1 or State == 2) then 
	MSDIdx = PIdx2MSDIdx(1, PlayerIndex);
	if (MSDIdx > 0) then 
		nGroup = GetMSIdxGroup(1, MSDIdx);
 		
	if ( nGroup == 1) then 
    		Say("Quèc gia h­ng vong, hÊt phu h÷u tr¸ch! B©y giê lµ lóc ta vµ c¸c ng­¬i b¸o ¬n ®Êt n­íc!",0)
  		else
    		Say("Ng­êi Kim bän ng­¬i, x©m l­îc giang s¬n, giÕt h¹i ®ång bµo ta! Ta thÒ quyÕt cïng bän ng­¬i mét mÊt mét cßn!",0)
  		end
	
		return
	end;
end;

if (State == 1) then
	if (GetMSPlayerCount(1,1) >= MAX_S_COUNT) then
		Say("Qu©n lùc cña ta hiÖn giê ®· d­ søc tiªu diÖt Kim qu©n. Tr¸ng sÜ xin ®îi trËn sau nhĞ!", 0)
	return
	end;
	
	Say("Quèc gia h­ng vong, hÊt phu h÷u tr¸ch! B©y giê lµ lóc ta vµ c¸c ng­¬i b¸o ¬n ®Êt n­íc! ChØ cÇn ®¼ng cÊp trªn 40, ñng hé 3000 l­îng lµ cã thÓ x«ng pha giÕt ®Şch!",2,"Ta tham gia. /Yes", "§Ó ta suy nghÜ l¹i!/No");
end;

--½»Õ½Ê±ÆÚ
if (State == 2) then 
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
  Msg2Player("Hoan nghªnh ng­¬i gia nhËp. c¸c Anh hïng §¹i Tèng, h·y nhanh chãng tiÕn ra chiÕn tr­êng. ");
  V = GetMissionV(5);
  SetMissionV(5, V + 1);
  AddMSPlayer(1,1);
  SJ_JoinS();
  SetTask(SJKILLNPC,0);
  SetTask(SJKILLPK,0);
  --CheckGoFight()
  return 
  end;
end;

Say("B¹n ch­a ®ñ 40 cÊp hoÆc kh«ng mang ®ñ tiÒn! ",0);

end;

function No()
Say("Mau vÒ suy nghÜ ®i! Thêi gian cßn l¹i kh«ng nhiÒu ®©u!",0);
end;
