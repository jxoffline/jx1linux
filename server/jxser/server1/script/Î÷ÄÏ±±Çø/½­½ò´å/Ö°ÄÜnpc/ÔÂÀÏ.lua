-- ÔÂÀÏ.lua ½á»éÉêÇëÈËNPC£¬NPCËùÔÚµØ´ı¶¨
-- By: Dan_Deng(2003-12-27)
-- Uworld67 == GetTask(67)¡¡¸÷×ÖÎ»ÒâÒå£º1-7(½á»éÈÎÎñ¸÷×´Ì¬)£¬8-15(½á»é´ÎÊı)£¬16-23(´ı¶¨)£¬24(»é·ñ)£¬25-32(´ı¶¨)
-- PS£º2£¨ÊÇ·ñËÍ¹ı½äÖ¸£©
-- GetTaskTemp(5)£º¼ÇÂ¼ÊÇ·ñÒÑÌáÇ×£¨»ò±»ÌáÇ×£©
-- GetTaskTemp(6)£º¼ÇÂ¼ÌáÇ×ÕßµÄÔÚÏßID
-- GetTaskTemp(7)£º¼ÇÂ¼±»ÌáÇ×ÕßµÄÔÚÏßID
-- ½á»éÌõ¼ş£ºÎ´»é, µÈ¼¶>=20, ÄĞ·½×ö¶Ó³¤, ÄĞ·½È¥ÕÒÔÂÀÏËµ»°, È»ºóÅ®·½ÔÙÈ¥Ëµ»°£¬½ÓÊÜÇóÇ×
-- By: Dan_Deng(2004-03-02) ÖØĞ´½Å±¾½á¹¹£¬ÒÔ±ãÎ¬»¤
-- Update: Dan_deng(2004-03-02) Ğ­ÒéÀë»é
-- Update: Fanghao_Wu(2004-8-20) ÆßÏ¦ËÍÀñ
-- Update: ×Ó·ÇÓã (2007-10-12) ĞŞ¸ÄĞŞ¸´»é×´Ì¬

Include("\\script\\global\\teamhead.lua");
Include("\\script\\event\\valentine2007\\event.lua");
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\activitysys\\answer.lua")

TK_DATE_APPLYDIV = 1779; --µ¥·½Àë»éÈÎÎñºÅ
TOTALSEC_OF_DAY = 60 * 60 * 24; -- 1ÌìµÈÓÚ¶àÉÙÃë£¬ÓÃÓÚ°ÑÌìÊı×ª³ÉÃë
COSTOFSIMGLEDIV = 1000000; --µ¥·½Àë»é»¨·Ñ

function main(sel)
	if (check_married() == 1) then
		SetTask(67, SetBit(GetTask(67), 24, 0));
		Msg2Player("<color=yellow>T×nh tr¹ng h«n phèi cña b¹n ®· thay ®æi<color>");
	end;
	
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end

	local tbDailog = DailogClass:new(szNpcName)
	
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog)
	
	if (GetSex() == 0) and (GetTaskTemp(5) == 1) then	
		tbDailog.szTitleMsg = "<#><npc>ı trung nh©n cña ng­¬i vÉn ch­a tr¶ lêi ng­¬i, cã cÇn mêi c« ta nhanh nhanh mét chót kh«ng?"
		tbDailog:AddOptEntry("Ta nghÜ viÖc cÇu h«n cña ta qu¸ ®­êng ®ét, ng­êi cã thÓ hñy bá cho ta ®­îc kh«ng?", male_cancel)
		tbDailog:AddOptEntry("§­îc, ta ®i thö xem", male_hurry)
	elseif (GetSex() == 1) and (GetTaskTemp(5) == 1) then	
		tbDailog.szTitleMsg = "<#><npc>anh ta ®ang ®îi ng­¬i tr¶ lêi k×a, ®· suy nghÜ kü lµ muèn cïng víi anh ta ®i suèt cuéc ®êi hay ch­a?"
		tbDailog:AddOptEntry("V©ng, Ta nguyÖn suèt ®êi n©ng kh¨n söa ¸o cho anh ta, cïng nhau ®i hÕt cuéc ®êi.", female_yes)
		tbDailog:AddOptEntry("Kh«ng! Ta kh«ng muèn trong lóc bång bét ®­a ra quyÕt ®Şnh c¶ ®êi ng­êi m×nh.", female_cancel)
	else
		tbDailog.szTitleMsg = "<#><npc>Thùc ra l·o giµ nµy suèt ngµy bËn rén, nh­ng cã thÓ xem vµ gi¶i quyÕt ®­îc t×nh duyªn cña ng­êi trÎ tuæi."
		tbDailog:AddOptEntry("Ta ®· cã ı trung nh©n, muèn cÇu h«n víi c« Êy", Qmarry)
		tbDailog:AddOptEntry("Tİnh cña chóng ta kh«ng hîp nhau, muèn li h«n cho råi.", divorce)
		tbDailog:AddOptEntry("Phu Thª chóng t«i c·i v· suèt ngµy, xin NguyÖt L·o gióp t«i vµi lêi khuyªn.", fix_marry)
		tbDailog:AddOptEntry("Xin ®¬n ph­¬ng ly h«n", singlediv_apply)
		tbDailog:AddOptEntry("Thñ tôc xĞt xö ®¬n ph­¬ng ly h«n.", sure_process_dinglediv)
		tbDailog:AddOptEntry("Kh«ng cã g×, ta chØ qua ®­êng mµ th«i.", no)
	end
	
	tbDailog:Show()
end
-----------µ¥·½ÃæÀë»é----------------
--ÉêÇëµ¥·½ÃæÀë»é
function singlediv_apply()
	if (check_marrystate() == 0) then
		return
	end;
	
	local nDays = get_passdays();
	local str = "Thêi gian xin ly h«n ch­a ®ñ <color=yellow>1 ngµy<color>, ";
	if (nDays > 0) then
		str = format("Ng­¬i xin ly h«n ®· ®­îc <color=yellow>%d ngµy<color> råi, ",nDays);
	end;
	if (GetTask(TK_DATE_APPLYDIV) ~= 0) then
		Say(format("NguyÖt L·o: %s kh«ng cÇn ph¶i xin ly h«n n÷a.", str), 0);
		return
	end;
	
	Say(format("Tr¨m n¨m tu míi cã thÓ cïng thuyÒn, ngµn kiÕp tu míi cã thÓ nªn duyªn.Trong biÓn ng­êi mªnh m«ng, gÆp nhau, th­¬ng yªu nhau h¸ ph¶i chuyÖn dÔ dµng! §¬n ph­¬ng ly h«n cÇn n¹p phİ  <color=yellow>%d l­îng<color>. Ng­¬i thËt sù muèn ®o¹n tuyÖt mèi duyªn nµy chø?",COSTOFSIMGLEDIV), 2,
		"Xin ly h«n ®¬n ph­¬ng/makesure_apply",
		"§Ó ta xem l¹i/no");
end;

--È·ÈÏÉêÇë£ºµ¥·½ÃæÀë»é
function makesure_apply()
	local nDate = GetCurServerTime();
	SetTask(TK_DATE_APPLYDIV, nDate);
	
	WriteLog(format("%s\tAccount:%s[Name:%s] ®· xin ly h«n ®¬n ph­¬ng.",
				GetLocalDate("%Y-%m-%d %H:%M:%S"),
				GetAccount(),
				GetName() ));	
	Say("NguyÖt L·o: Tuy ng­¬i ®· quyÕt, nh­ng chØ e sau nµy l¹i hèi hËn, ta sÏ cho ng­¬i thêi gian ®Ó suy nghÜ l¹i, mét tuÇn sau h·y ®Õn gÆp ta.", 0);
	informother(Say, format("Phèi ngÉu %s ®· ®Õn gÆp NguyÖt L·o xin ®¬n ph­¬ng ly h«n, 1 tuÇn sau sÏ tù ®éng <color=yellow>®o¹n tuyÖt quan hÖ phèi ngÉu<color>.",GetName()), 0);
end;

--Í¨ÖªÅäÅ¼
function informother(proc, ...)
	local Lover = GetMateName();
	if (Lover == "") then 
		return 1
	end;
	
	local nOldPlayer = PlayerIndex
	local nIdx = SearchPlayer(Lover);
	if (nIdx <= 0) then
		return 1;
	end;
	
	if (not proc or type(proc) ~= "function") then
		return 1;
	end;
	PlayerIndex = nIdx;
	call(proc, arg);
	
	PlayerIndex = nOldPlayer;
end;


--ÉêÇëµ¥·½ÃæÀë»é
function sure_process_dinglediv()
	if (check_marrystate() == 0) then
		return
	end;
	
	if (GetTask(TK_DATE_APPLYDIV) == 0) then
		Say("NguyÖt L·o: Ng­¬i muèn xin ®¬n ph­¬ng ®o¹n tuyÖt quan hÖ phèi ngÉu?", 2,
			"Xin ly h«n ®¬n ph­¬ng/singlediv_apply",
			"Nh©n tiÖn ghĞ qua th«i/no");
		return
	end;
	
	local nDays = get_passdays();
	local str = "Thêi gian xin ly h«n ch­a ®ñ <color=yellow>1 ngµy<color>, ";
	if (nDays > 0) then
		str = format("ng­¬i xin ly h«n chØ míi <color=yellow>%d ngµy<color>, ",nDays);
	end;
	if (nDays < 7) then
		Say(format("NguyÖt L·o: Ng­¬i nãng lßng qu¸ råi, %s vÉn ch­a ®ñ 1 tuÇn, h·y quay vÒ suy nghÜ cho kü.",str), 0);
		return 0;
	end;
	
	Say(format("Tr¨m n¨m tu míi cã thÓ cïng thuyÒn, ngµn kiÕp tu míi cã thÓ nªn duyªn.Trong biÓn ng­êi mªnh m«ng, gÆp nhau, th­¬ng yªu nhau h¸ ph¶i chuyÖn dÔ dµng! §¬n ph­¬ng ly h«n cÇn n¹p phİ  <color=yellow>%d l­îng<color>. Ng­¬i thËt sù muèn ®o¹n tuyÖt mèi duyªn nµy chø?", COSTOFSIMGLEDIV), 2,
		"Lµm thñ tôc ly h«n ®¬n ph­¬ng/process_dinglediv",
		"§Ó ta xem l¹i/no");
end;

--½øĞĞµ¥·½ÃæÀë»é
function process_dinglediv()
	if (GetCash() < COSTOFSIMGLEDIV) then
		Say(format("NguyÖt L·o: §¬n ph­¬ng ly h«n cÇn n¹p <color=yellow>%d<color> l­îng, tiÒn ng­¬i mang theo ch­a ®ñ!",COSTOFSIMGLEDIV), 0);
		return 0;
	end;
	
	if (Pay(COSTOFSIMGLEDIV) == 0) then
		return
	end;
	
	divorce_dateproc(PlayerIndex);
	WriteLog(format("%s\tAccount:%s[Name:%s] ®· tiÕn hµnh ®¬n ph­¬ng ly h«n.",
				GetLocalDate("%Y-%m-%d %H:%M:%S"),
				GetAccount(),
				GetName() ));
	Say("NguyÖt L·o: HiÖn giê ng­¬i ®· ly h«n råi, ng­¬i cã thÓ ®i t×m t×nh yªu ®İch thùc ®Ó chung sèng nh÷ng ngµy cßn l¹i.", 0);
	
	Msg2Player(format("§· n¹p <color=yellow>%d l­îng<color> lÖ phİ ®¬n ph­¬ng ly h«n.", COSTOFSIMGLEDIV));
	Msg2Player("T×nh tr¹ng h«n nh©n hiÖn t¹i lµ ®éc th©n.");
	informother(divorce_dateproc);
	informother(Say, format("Phèi ngÉu %s ®· ®Õn gÆp NguyÖt L·o xin <color=yellow>®¬n ph­¬ng ly h«n<color>, ®o¹n tuyÖt quan hÖ phèi ngÉu víi b¹n.",GetName()), 0);
end;

--»ñµÃÉêÇëÁË¶àÉÙÌì
function get_passdays()
	local nApplyDate = GetTask(TK_DATE_APPLYDIV);
	local nDate = GetCurServerTime();
	if (nApplyDate == 0 or nDate < nApplyDate) then
		return -1;
	end;
	
	local nDays = floor((nDate - nApplyDate) / TOTALSEC_OF_DAY);
	return nDays;
end;

--ÉèÖÃµ¥·½Àë»éÉèÖÃ
function divorce_dateproc()
	local nWorld67 = GetTask(67);
	nWorld67 = SetBit(nWorld67,24,0);
	SetTask(TK_DATE_APPLYDIV, 0);
	UnMarry();
	
	nRepute = GetRepute();				-- ÉùÍûÏà¹Ø´¦Àí
	if (nRepute > 10) then
		nRepute = 10;
	end;
	AddRepute(-1 * nRepute)								-- ÉùÍû10µã(²»×ã10µãÔò½µÎª0);
	
	nDivorceTimes = GetByte(nWorld67,2) + 1
	if (nDivorceTimes > 100) then
		nDivorceTimes = 100;
	end;
	nWorld67 = SetByte(nWorld67, 2, nDivorceTimes);
	SetTask(67,nWorld67);
end;

--¼ì²é»éÒöºÍÉêÇëµ¥·½ÃæÀë»éµÄ×´Ì¬
function check_marrystate()
	local nLvl = GetLevel();
	local nSex = GetSex();
	local bMarried = GetBit(GetTask(67),24);
	
	if (nLvl < 20) then
		Say("NguyÖt L·o: §õng ®ïa víi ta, ng­¬i vÉn ch­a ®Õn tuæi thµnh gia lËp thÊt.", 0);
		return 0;
	end;
	
	local str = "C« n­¬ng";
	if (nSex == 1) then
		str = "chµng trai";
	end;
	
	if (bMarried == 0) then
		Say(format("NguyÖt L·o: §õng ®ïa víi ta, ng­¬i vÉn ch­a kÕt h«n mµ l¹i xin ly h«n, h·y mau ®i t×m %s ®Ó kÕt h«n ®i.", str), 0);
		return 0;
	end;
	return 1;
end;
function check_married_team()
	local nOldPlayer = PlayerIndex;
	local nTeamSize = GetTeamSize();
	if (nTeamSize ~= 2) then
		return 1;
	end;
	local mem = {};
	mem[1] = GetTeamMember(1);
	mem[2] = GetTeamMember(2);
	local szName = "";
	for i = 1, nTeamSize do
		PlayerIndex = mem[i];
		if (check_married() == 1) then --Èç¹ûµ¥·½ÃæÀë»éÁË
			szName = GetName();
			SetBit(GetTask(67),24,0);
			SetTask(67,1);
		end;
		PlayerIndex = nOldPlayer;
	end;
	if (szName == "") then
		return 1
	end;
	
	local str = format("<color=yellow>Tr¹ng th¸i h«n nh©n %s ®· thay ®æi<color>",szName)
	for i = 1, nTeamSize do
		OtherPlayer(mem[i], Msg2Player, str);
	end;
	return 1;
end;


function check_married()
	if (GetMateName() == "" and GetBit(GetTask(67),24) == 1) then
		return 1;
	end;
	return 0;
end;

----------------------- ÆßÏ¦»î¶¯ÓÃ9¿é°®ÁµÇÉ¿ËÁ¦»»È¡½±Àø ------------------
function chocolate()
	Say("9 miÕng s« c« la cã thÓ ®æi 999 v¹n ®iÓm kinh nghiÖm, còng cã thÓ nhËn lÊy nh÷ng phÈn th­ëng bÊt ngê, ng­¬i chän lo¹i nµo?",3,"§æi 999 v¹n ®iÓm kinh nghiÖm/chocolate_exp","§æi phÇn th­ëng vËt phÈm/chocolate_gift","Kh«ng cã g×, ta chØ ®i ngang qua th«i!/no");
end

function chocolate_exp()
	local nNowDate = tonumber(date("%d"));
	if(CalcEquiproomItemCount( 6, 1, 833, 1) < 9) then
		Say("H×nh nh­ trªn ng­¬i kh«ng cã ®ñ 9 miÕng s« c« la th× ph¶i? Nhí ®Êy mét miÕng còng kh«ng thÓ thiÕu ®ã!",0);
		return
	end
	if(GetTask(1564) == nNowDate) then
		if(GetTask(1565) > 0) then
			Say("NÕu lÊy s« c« la ®æi ®iÓm kinh nghiÖm th× mét ngµy chØ cã thÓ ®æi mét lÇn th«i, h¬n n÷a ng­êi giµ  ®õng nªn ¨n nhiÒu ®å ngät.",0);
			return
		end
		ConsumeEquiproomItem( 9, 6, 1, 833, 1);
		AddOwnExp(9990000);
		SetTask(1565,GetTask(1565)+1);
	else
		ConsumeEquiproomItem( 9, 6, 1, 833, 1);
		AddOwnExp(9990000);
		SetTask(1565,1);
		SetTask(1564,nNowDate);
	end
end

function chocolate_gift()
	if(CalcEquiproomItemCount( 6, 1, 833, 1) < 9) then
		Say("H×nh nh­ trªn ng­¬i kh«ng cã ®ñ 9 miÕng s« c« la th× ph¶i? Nhí ®Êy mét miÕng còng kh«ng thÓ thiÕu ®ã!",0);
		return
	end
	ConsumeEquiproomItem( 9, 6, 1, 833, 1);	
	local i = random(1,1000);
	if(i <= 300) then
		AddEventItem(353);
		Msg2Player("B¹n nhËn ®­îc 1 Tinh Hång B¶o Th¹ch");
		WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: T¹i lÔ héi th¸ng b¶y nhËn ®­îc mét viªn Tinh Hång B¶o Th¹ch");	
	elseif(i > 300 and i <= 460) then
		AddEventItem(238);
		Msg2Player("B¹n nhËn ®­îc 1 Lam Thñy Tinh");
		WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: T¹i lÔ héi th¸ng b¶y nhËn ®­îc mét viªn Lam Thñy Tinh");		
	elseif(i > 460 and i <= 620) then
		AddEventItem(240);
		Msg2Player("B¹n nhËn ®­îc 1 Lôc Thñy Tinh");
		WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: T¹i lÔ héi th¸ng b¶y nhËn ®­îc  mét viªn Lôc Thñy Tinh");		
	elseif(i > 620 and i <= 800) then
		AddEventItem(239);
		Msg2Player("B¹n nhËn ®­îc 1 Tö Thñy Tinh");
		WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: T¹i lÔ héi th¸ng b¶y nhËn ®­îc mét viªn Tö Thñy Tinh");		
	elseif(i > 800 and i <= 949) then
		AddItem(6,1,147,6,0,0);
		Msg2Player("B¹n nhËn ®­îc 1 HuyÒn Tinh Kho¸ng Th¹ch cÊp 6");
		WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: T¹i lÔ héi th¸ng b¶y nhËn ®­îc mét viªn HuyÒn Tinh Kho¸ng Th¹ch cÊp 6 ");		
	elseif(i > 949 and i <= 979) then
		AddItem(6,1,147,7,0,0);
		Msg2Player("Ng­êi nhËn ®­îc mét viªn HuyÒn Tinh Kho¸ng Th¹ch cÊp 7");
		WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: T¹i lÔ héi th¸ng b¶y nhËn ®­îc mét viªn HuyÒn Tinh Kho¸ng Th¹ch cÊp 7");		
	elseif(i > 979 and i <= 989) then
		AddItem(6,1,147,8,0,0);
		Msg2Player("B¹n nhËn ®­îc 1 HuyÒn Tinh Kho¸ng Th¹ch cÊp 8");
		WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: T¹i lÔ héi th¸ng b¶y nhËn ®­îc mét viªn HuyÒn Tinh Kho¸ng Th¹ch cÊp 8");		
	elseif(i > 989 and i <= 990) then
		AddItem(6,1,147,9,0,0);
		Msg2Player("B¹n nhËn ®­îc 1 HuyÒn Tinh Kho¸ng Th¹ch cÊp 9");
		WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: T¹i lÔ héi th¸ng b¶y nhËn ®­îc mét viªn HuyÒn Tinh Kho¸ng Th¹ch cÊp 9");		
	elseif(i > 990 and i <= 1000) then
		AddItem(6,1,398,9,0,0);
		Msg2Player("B¹n nhËn ®­îc 1 Kho¸ng Th¹ch ThÇn Bİ.");
		WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: T¹i lÔ héi th¸ng b¶y nhËn ®­îc mét viªn Kho¸ng Th¹ch ThÇn Bİ ");		
	else
	end
end
----------------------- ÆßÏ¦»î¶¯ÓÃ9¿é°®ÁµÇÉ¿ËÁ¦»»È¡½±Àø ------------------

----------------------- Í¨ÓÃ¹¦ÄÜº¯Êı ------------------
function default_talk()			-- È±Ê¡¶Ô»°
	Talk(1,"","NÕu hai bªn ®· cã ı víi nhau, chØ cÇn ®· tr­ëng thµnh vµ ch­a kÕt h«n víi ai, cïng nhau ®Õn ®©y ta sÏ t¸c hîp l­¬ng duyªn. Ng­¬i h·y nãi ı muèn cÇu th©n víi ta, ta sÏ thay ng­¬i chuyÓn cho ng­êi Êy, gióp ng­¬i t¸c thµnh h«n sù!")
end

function check_team()
	Player1_ID = GetTeamMember(1)
	Player2_ID = GetTeamMember(2)
-- ²éÑ¯¶ÓÎéÖĞµÄÅ®ĞÔ³ÉÔ±£¬ÈôÓĞÔò¼ÇÂ¼ËıµÄIDµ½ÁÙÊ±±äÁ¿
	if (OtherPlayer(Player2_ID,GetSex) == 1) then
		His_ID = Player1_ID
		Her_ID = Player2_ID
		Her_world67 = OtherPlayer(Her_ID,GetTask,67)
		His_world67 = OtherPlayer(His_ID,GetTask,67)
	elseif (OtherPlayer(Player1_ID,GetSex) == 1) then
		His_ID = Player2_ID
		Her_ID = Player1_ID
		Her_world67 = OtherPlayer(Her_ID,GetTask,67)
		His_world67 = OtherPlayer(His_ID,GetTask,67)
	else
		His_ID = 0
		Her_ID = 0
	end
	return His_ID,Her_ID,His_world67,Her_world67
end

function do_qmarry_cancel()
	His_ID,Her_ID,His_world67,Her_world67 = check_team()
	if (OtherPlayer(His_ID,GetTaskTemp,0,5) == 1) and (OtherPlayer(Her_ID,GetTaskTemp,0,5) == 1) and (OtherPlayer(Her_ID,GetTaskTemp,0,6) == His_ID) and (OtherPlayer(His_ID,GetTaskTemp,0,7) == Her_ID) then	-- Ë«·½Êı¾İÄÜ¶ÔÉÏ£¬ÔÊĞíÉ¾³ı
		OtherPlayer(His_ID,SetTaskTemp,5,0)
		OtherPlayer(His_ID,SetTaskTemp,6,0)
		OtherPlayer(His_ID,SetTaskTemp,7,0)
		OtherPlayer(Her_ID,SetTaskTemp,5,0)
		OtherPlayer(Her_ID,SetTaskTemp,6,0)
		OtherPlayer(Her_ID,SetTaskTemp,7,0)
--		Msg2Player("Çó»éÈ¡Ïû³É¹¦¡£")
--	else
--		Msg2Player("ÎŞ·¨È¡ÏûÇó»é¡£")
	end
end

function OtherPlayer_talk(PlayerId, msg)		-- Îª±ğÈË·¢ÏûÏ¢
	OldPlayer = PlayerIndex
	PlayerIndex = PlayerId
	Talk(1,"",msg)
	PlayerIndex = OldPlayer
end
----------------------- Çó»éÏà¹Ø -----------------------
function Qmarry()			-- Çó»éÒÔ¼°½á»éºÏ·¨ĞÔ¼ì²â
	if (GetFaction() == "shaolin") or (GetFaction() == "emei") then		-- ºÍÉĞÄá¹Ã²»×¼½á»é
		Talk(1,"","Ng­¬i lµ ng­êi xuÊt gia sao d¸m nghÜ ®Õn chuyÖn hång trÇn? Hay ®· vøt bá hÕt m«n quy?")
	elseif (GetSex() == 1) then											-- ÆÕÍ¨µÄ¶ÔÅ®ĞÔµÄËµ»°
		Talk(1,"","ChuyÖn thµnh th©n nµy, ®­êng ®­êng lµ mét c« g¸i nh­ ng­¬i sao l¹i chñ ®éng th¸i qu¸ vËy? H·y ®Ó t©n lang ®Õn cÇu th©n!")
	elseif (GetTeamSize() ~= 2) or (IsCaptain() ~= 1) then		-- (¶ÓÎéÈËÔ±²»¶Ô)»ò(×Ô¼º²»ÊÇ¶Ó³¤)£¬×ªÈ±Ê¡¶Ô»°
		default_talk()
	else					-- ¼ì²â¸÷ÖÖÌõ¼ş£¬²¢ÇÒ¿ªÊ¼Çó»é¹ı³Ì
		His_ID,Her_ID,His_world67,Her_world67 = check_team();
--		check_married_team();
		if (Her_ID == 0) then				-- ¶ÓÎéÖĞÎŞÅ®ĞÔ³ÉÔ±£¬×ªÈ±Ê¡¶Ô»°
			Talk(1,"","Hai vŞ ®­êng ®­êng lµ ®¹i nam nh©n l¹i muèn kÕt h«n g× chø? §õng ®em l·o giµ nµy ra ®ïa giìn!")
--			default_talk()
		elseif (OtherPlayer(Her_ID,GetFaction) == "emei") then		-- ²»×¼È¢Äá¹Ã
			Talk(1,"","Muèn c­íi ni c« sao? NÕu c¸c ng­¬i thËt t©m yªu nhau, tèt nhÊt h·y ®Õn khuyªn c« ta hoµn tôc!")
		elseif (GetBit(His_world67,24) == 1) then				-- ÄĞ·½ÒÑ»é
			Talk(1,"","Ng­¬i ®· cã thª tö råi! LÏ nµo l¹i muèn tam thª tø thiÕp!?")
		elseif (GetBit(Her_world67,24) == 1) then		-- Å®·½ÒÑ»é
			Talk(1,"","<#> Ng­êi ta"..OtherPlayer(Her_ID,GetName).."<#> ®· g¶ qua råi, sao cã thÓ mét vî g¶ cho hai chång ®­îc!")
		elseif (GetLevel() < 20) or (OtherPlayer(Her_ID,GetLevel) < 20) then		-- ÓĞÈËµÈ¼¶²»¹»
			Talk(1,"","Tuæi ng­¬i cßn nhá, viÖc h«n nh©n ®¹i sù ®îi ®Õn lóc tr­ëng thµnh h·y tİnh!")
		else									-- ·ûºÏËùÓĞÌõ¼ş
			SetTaskTemp(7,Her_ID)
			SetTaskTemp(6,His_ID)
			Say("Chµng trai trÎ! Cã ph¶i muèn kÕt duyªn cïng c« g¸i bªn c¹nh ng­¬i?",2,"D¹! Con muèn hái c­íi c« ta/qmarry_get","Kh«ng, chóng ta chØ t×nh cê ®i ngang qua th«i/qmarry_no")
		end
	end
end

function qmarry_get()			-- ÄĞ·½£ºÆô¶¯ÌáÇ×
	SetTaskTemp(5,1)
	His_ID,Her_ID,His_world67,Her_world67 = check_team()
	if (GetTeamSize() ~= 2) or (GetTaskTemp(7) ~= Her_ID) then			-- ¶ÓÎé·¢ÉúÁË¸Ä±ä£¬¾Ü¾ø¡£¡£¡£
		Talk(1,"","Ng­¬i do dù qu¸ l©u, c« n­¬ng ®ã ®· ®i mÊt råi!")
	else
		Her_Name = OtherPlayer(Her_ID,GetName)
		Talk(1,"","<#> Tèt! Ng­¬i vµ "..Her_Name.."<#> qu¶ nhiªn trêi sinh mét cÆp, ta lËp tøc ®Õn nãi víi c« Êy xem ı kiÕn thÕ nµo.")
		Msg2Player("<#> B¹n quyÕt ®Şnh cÇu h«n "..Her_Name.."<#> ®em t©m t­ cña m×nh nãi cho NguyÖt H¹ L·o Nh©n nghe xong, b¾t ®Çu im lÆng chê ®îi sù ph¶n øng cña c« ta.")
		OtherPlayer(Her_ID,Msg2Player,GetName().."<#> cÇu h«n víi ng­¬i, ng­¬i ®ång ı g¶ cho anh ta kh«ng? Mau ®em nh÷ng t©m t­ trong lßng nãi  cho NguyÖt H¹ L·o Nh©n nghe ®i.")
		OtherPlayer(Her_ID,SetTaskTemp,5,1)
		OtherPlayer(Her_ID,SetTaskTemp,6,His_ID)
		OtherPlayer(Her_ID,SetTaskTemp,7,Her_ID)
	end
end

function male_cancel()			-- ÄĞ·½£ºÈ¡ÏûÌáÇ×
	do_qmarry_cancel()
	Talk(1,"","C­ìng Ğp kh«ng h¹nh phóc, nÕu c« ta nhÊt thêi ch­a thÓ quyÕt ®Şnh ®­îc th× ®µnh ph¶i ®îi 1 thêi gian sau hay tİnh!")
	Msg2Player("Ng­êi ®Ñp tr­íc mÆt ng­¬i l¹i tá vÎ nhót nh¸t, bá ı niÖm cÇu h«n víi c« Êy.")
	OtherPlayer(Her_ID,Msg2Player,GetName().."<#> t­ chèi lêi cÇu h«n cña b¹n.")		-- ÏûÏ¢ÊÇ·¢µ½Å®·½£¬×¢ÒâÏûÏ¢ÄÚÈİÏà·û
end

function male_hurry()		-- Çó»é£º´ß´Ù
	Her_ID = GetTaskTemp(7)
	OtherPlayer(Her_ID,Msg2Player,GetName().."<#> cÇu hån víi ng­¬i, ng­¬i ®ång ı g¶ cho anh ta kh«ng? Mau ®em nh÷ng t©m t­ trong lßng nãi  cho NguyÖt H¹ L·o Nh©n nghe ®i!")
end

----------------------- ´ğ¸´Çó»é¡¢È·ÈÏ»éÒö -------------
function female_cancel()		-- Å®·½£º¾Ü¾øÌáÇ×
	do_qmarry_cancel()
	Talk(1,"","Ng­¬i kh«ng b»ng lßng, ta ®µnh ph¶i b¸o tin nµy cho h¾n th«i!")
	Msg2Player("Con cãc mµ cø t­ëng lµ Thiªn nga? B¹n ®· ko do dù cù tuyÖt ngay lêi cÇu h«n nµy.")
	OtherPlayer(His_ID,Msg2Player,GetName().."<#> ®· cù tuyÖt lêi cÇu h«n cña ng­¬i, tiÓu tö tiÕp tôc cè g¾ng lªn!")
end

function female_yes()			-- Å®·½£º½ÓÊÜÌáÇ×
	His_ID,Her_ID,His_world67,Her_world67 = check_team()
	His_Name	= OtherPlayer(His_ID,GetName)
	Her_Name	= GetName()
	if (GetBit(Her_world67,24) == 1) then				-- ÒÑ»é
		Talk(1,"","Ng­¬i ®· cã phu qu©n, sao cßn muèn lÊy ng­êi kh¸c?")
	elseif (GetTeamSize() ~= 2) then		-- ¶ÓÎéÈËÊıÒÑ¸Ä±ä
		Talk(1,"","Ta cßn ch­a thÊy t©n lang cña ng­¬i. NÕu ng­¬i muèn ta t¸c hîp, ph¶i cïng nhau ®Õn nãi chuyÖn víi ta!")
	elseif (His_ID ~= GetTaskTemp(6)) then			-- ¶Ó³¤²»ÊÇÇó»éÕß
		Talk(1,"","H×nh nh­ ng­¬i muèn cÇu h«n víi ng­êi kh¸c ch¨ng? Rèt cuéc ng­¬i muèn lÊy ai ®©y? Ta cã chót m¬ hå!")
	else				-- Êı¾İÒÑ¾­¶ÔÉÏ£¬½øĞĞ½á»é´¦Àí
		DoMarry(GetTeam())
		
				-- ÔÚÕâÀïÅĞ¶Ï»éÒö¹ØÏµÊÇ·ñÕæÕıÈ·Á¢£¬·ñÔòÖ±½Ó·µ»Ø by zero 2007/06/27
		local szMaleName, szFemaleName = "","";
		local nOldPlayerIndex = PlayerIndex;
		
			PlayerIndex = His_ID;
			szMaleName = GetMateName();
			PlayerIndex = nOldPlayerIndex;
			szFemaleName = GetMateName();
			
		if szMaleName == "" or szFemaleName=="" then
			Msg2Player("<color=yellow>Ch­a t¹o ®­îc quan hÖ phèi ngÉu, h·y thö l¹i sau!<color>");
			OtherPlayer(His_ID, Msg2Player, "<color=yellow>Ch­a t¹o ®­îc quan hÖ phèi ngÉu, h·y thö l¹i sau!<color>");
			return
		end;
		
		
		SetTaskTemp(5,0)		--È¡ÏûÇó»é×´Ì¬
		SetTaskTemp(6,0)
		SetTaskTemp(7,0)
		OtherPlayer(His_ID,SetTaskTemp,5,0)
		OtherPlayer(His_ID,SetTaskTemp,6,0)
		OtherPlayer(His_ID,SetTaskTemp,7,0)
		Her_world67 = SetBit(Her_world67,24,1)		-- ÉèÖÃ½á»é±äÁ¿
		His_world67 = SetBit(His_world67,24,1)
		if (GetBit(Her_world67,2) == 0) and (GetLevel() >= 50) then		-- Å®·½ËÍ½äÖ¸
			Her_world67 = SetBit(Her_world67,2,1)		-- ÉèÖÃ½á»é±äÁ¿£¨ÒÑËÍ½äÖ¸£©
			present_ring(Her_ID)
		end
		if (GetBit(His_world67,2) == 0) and (OtherPlayer(His_ID,GetLevel) >= 50) then		-- ÄĞ·½ËÍ½äÖ¸
			His_world67 = SetBit(His_world67,2,1)		-- ÉèÖÃ½á»é±äÁ¿£¨ÒÑËÍ½äÖ¸£©
			present_ring(His_ID)
		end
		SetTask(67,Her_world67)
		OtherPlayer(His_ID,SetTask,67,His_world67)

		Msg2Player("<#> B¹n ®· chÊp nhËn lêi cÇu h«n cña "..His_Name.."<#> chóc mõng hai  vŞ b¸ch niªn giai l·o, tr¨m n¨m h¹nh phóc!")
		OtherPlayer(His_ID, Msg2Player, Her_Name.."<#> ®· tiÕp nhËn lêi cÇu h«n cña b¹n, chóc mõng hai vŞ b¸ch niªn giai l·o, tr¨m n¨m h¹nh phóc!")
		OtherPlayer_talk(His_ID, "Chóc mõng hai vŞ, d©y t¬ hång ®· th¾t chÆt mèi l­¬ng duyªn nµy råi!")
		OtherPlayer_talk(Her_ID, "Chóc mõng hai vŞ, d©y t¬ hång ®· th¾t chÆt mèi l­¬ng duyªn nµy råi!")
		AddGlobalCountNews("<#> chóng ta cïng chóc mõng"..His_Name.."<#> víi"..GetName().."<#> hai vŞ t©n nh©n vÜnh kÕt ®ång t©m, b¸ch niªn giai l·o!",3)
		
	end
end

function present_ring(PlayerId)			-- ËÍ½äÖ¸£¨ÅĞ¶Ï¡¢ÖÃ±äÁ¿ÒÑÒÆÖÁ½á»é¹ı³ÌÖĞ£©
	OldPlayer = PlayerIndex
	PlayerIndex = PlayerId

	item_level = floor(GetLevel() / 10) + 2
	if (item_level > 10) then
		item_level = 10
	end
--	item_lucky = (item_level - 3) * 5
	p = {0,0,0,0,0,0}
	j = item_level - 6
	if (j > 6) then j = 6 end
	for i=1,j do
		if (item_level - i - 2 < 0) then
			p[i] = 0
		else
			p[i] = item_level - i - 2
		end
	end
	AddItem(0,3,0,item_level,random(0,4),5,p[1],p[2],p[3],p[4],p[5],p[6])
	Msg2Player("NguyÖt L·o tÆng cho b¹n mét chiÕc nhÉn ")
	PlayerIndex = OldPlayer
end

----------------------- ĞŞ¸´»éÒö¹ØÏµ -------------------
function fix_marry()
	if( GetTeamSize() == 2 ) then
		His_ID,Her_ID,His_world67,Her_world67 = check_team()
		His_Name = GetName()
		Her_Name = OtherPlayer(Her_ID,GetName)
		if (His_ID ~= 0) and (Her_ID ~= 0) and (GetBit(His_world67,24) == 1) and (GetBit(Her_world67,24) == 1) and (OtherPlayer(His_ID,GetMateName) == "") and (OtherPlayer(Her_ID,GetMateName) == "") then		-- ÒìĞÔ¡¢Á½ÈË¶ÓÎé¡¢¾ùÒÑ»é£¬ÔòÊÓÎªÔÊĞíĞŞ¸´
			Talk(1,"","Vî chång c·i nhau lµ chuyÖn b×nh th­êng, chĞn trong sãng cßn khua, ®õng v× chuyÖn nµy mµ thï hËn nhau. Nµo, l¹i ®©y! N¾m tay nhau hßa gi¶i!")
			DoMarry(GetTeam())
			Msg2Player("<#> B¹n vµ "..Her_Name.."<#> ®· phôc håi quan hÖ phèi ngÉu")
			OtherPlayer(Her_ID,Msg2Player,"<#> B¹n vµ "..His_Name.."<#> ®· phôc håi quan hÖ phèi ngÉu")
		elseif (GetBit(GetTask(67),24) == 1) and (GetMateName() == "") then			-- ¿ÉÄÜĞŞ¸´£¬µ«¶Ô·½Ìõ¼ş²»³ÉÁ¢
			if (GetSex() == 0) then
				Talk(1,"","Vî chång c·i nhau lµ chuyÖn b×nh th­êng, chĞn trong sãng cßn khua. ThÕ nµy nhĞ, ng­¬i d¾t vî tíi ®©y ®Ó ta khuyªn nhñ c« ta!")
			else
				Talk(1,"","Vî chång c·i nhau lµ chuyÖn b×nh th­êng, chĞn trong sãng cßn khua. ThÕ nµy nhĞ, ng­¬i cïng chång tíi ®©y ®Ó ta khuyªn nhñ h¾n!")
			end
		else			-- ×Ô¼ºÌõ¼ş²»³ÉÁ¢
			if (GetSex() == 0) then
				Talk(1,"","Râ rµng lµ kh«ng cã chuyÖn g×, chµng trai trÎ ®Şnh trªu cît giµ nµy ch¨ng?")
			else
				Talk(1,"","Râ rµng lµ kh«ng cã chuyÖn g×, c« n­¬ng ®õng nãi dèi!")
			end
		end
	else
		if (GetSex() == 0) then
			Talk(1,"","Vî chång c·i nhau lµ chuyÖn b×nh th­êng, chĞn trong sãng cßn khua. ThÕ nµy nhĞ, ng­¬i d¾t vî tíi ®©y ®Ó ta khuyªn nhñ c« ta!")
		else
			Talk(1,"","Vî chång c·i nhau lµ chuyÖn b×nh th­êng, chĞn trong sãng cßn khua. ThÕ nµy nhĞ, ng­¬i cïng chång tíi ®©y ®Ó ta khuyªn nhñ h¾n!")
		end
	end
end

----------------------- Àë»éÏà¹Ø -----------------------
function divorce()
	if (GetTeamSize() == 2) and (IsCaptain() == 1) then		-- ×é¶Ó¡¢ÈËÊıÎª2¡¢×Ô¼ºÊÇ¶Ó³¤
		His_ID,Her_ID,His_world67,Her_world67 = check_team()
		His_Name = OtherPlayer(His_ID,GetName)
		Her_Name = OtherPlayer(Her_ID,GetName)
		if (GetBit(His_world67,24) == 1) and (OtherPlayer(His_ID,GetMateName) == Her_Name) and (GetBit(Her_world67,24) == 1) and (OtherPlayer(Her_ID,GetMateName) == His_Name) then		-- Ë«·½½á»é¹ØÏµÕıÈ·
			Say("Ly h«n kh«ng ph¶i lµ trß ®ïa, ng­êi trong giang hå sÏ v× chuyÖn ly h«n mµ ®¸nh gi¸ thÊp c¸c ng­¬i. Cã muèn suy nghÜ l¹i kh«ng?",2,"Chóng ta ®· quyÕt ®Şnh råi, xin lµm thñ tôc ly dŞ ®i!/divorce_yes","§Ó ta suy nghÜ kü l¹i xem/no")
		else
			Talk(1,"","Rèt cuéc ng­¬i muèn ly h«n víi ai? Ng­êi nµy vèn kh«ng ph¶i lµ ng­êi phèi ngÉu cña ng­¬i!")
		end
	else
		Talk(1,"","NÕu nhÊt ®Şnh muèn ly h«n, ph¶i cïng vî ng­¬i ®Õn lµm thñ tôc ly h«n!")
	end
end

function divorce_yes()
	His_ID,Her_ID,His_world67,Her_world67 = check_team()
	if (GetTeamSize() ~= 2) or (His_ID == 0) or (Her_ID == 0) or (OtherPlayer(His_ID,GetMateName) ~= Her_Name) or (OtherPlayer(Her_ID,GetMateName) ~= His_Name) then			-- ¸´²é×é¶Ó×´Ì¬
		Talk(1,"","Ng­¬i do d­ qu¸ l©u, phèi ngÉu cña ng­¬i ®· ®i råi!")
	elseif (GetCash() >= 50000) then
		Pay(50000)
		UnMarry(GetTeam())						-- ½â³ı»éÒö¹ØÏµ]
--Msg2Player("His_world67="..His_world67.."  Her_world67="..Her_world67)
		His_repute = OtherPlayer(His_ID,GetRepute)				-- ÄĞ·½Ïà¹Ø´¦Àí
		if (His_repute > 10) then His_repute = 10 end
		OtherPlayer(His_ID,AddRepute,-1 * His_repute)								-- ¼õÄĞ·½ÉùÍû10µã(²»×ã10µãÔò½µÎª0)
		His_DivorceTimes = GetByte(His_world67,2) + 1								-- ¼ÆËãÀë»é´ÎÊı
		if (His_DivorceTimes > 100) then His_DivorceTimes = 100 end			-- ³¬¹ı100´Î²»ÔÙ¼ÇÂ¼
		His_world67 = SetByte(His_world67,2,His_DivorceTimes)						-- Àë»é´ÎÊıĞ´Èë
		His_world67 = SetBit(His_world67,24,0)											-- »éÒö×´Ì¬
--Msg2Player("His_world67="..His_world67)
		OtherPlayer_talk(His_ID,"NÕu vËy…HiÖn t¹i h«n nh©n cña hai ng­¬i ®· ®­îc hñy bá! Ng­¬i ®· kh«i phôc tù do råi.")		-- ÎªË«·½·¢Àë»éÏûÏ¢
		Her_repute = OtherPlayer(Her_ID,GetRepute)				-- Å®·½Ïà¹Ø´¦Àí
		if (Her_repute > 10) then Her_repute = 10 end
		OtherPlayer(Her_ID,AddRepute,-1 * Her_repute)								-- ¼õÅ®·½ÉùÍû10µã(²»×ã10µãÔò½µÎª0)
		Her_DivorceTimes = GetByte(Her_world67,2) + 1
		if (Her_DivorceTimes > 100) then Her_DivorceTimes = 100 end
		Her_world67 = SetByte(Her_world67,2,Her_DivorceTimes)
		Her_world67 = SetBit(Her_world67,24,0)
--Msg2Player("Her_world67="..Her_world67)

		OtherPlayer(His_ID,SetTask,67,His_world67)
		OtherPlayer(Her_ID,SetTask,67,Her_world67)
		OtherPlayer_talk(Her_ID,"NÕu vËy…HiÖn t¹i h«n nh©n cña hai ng­¬i ®· ®­îc hñy bá! Ng­¬i ®· kh«i phôc tù do råi.")
	else
		Talk(1,"","Ng­¬i ch­a mang ®ñ phİ thñ tôc, cÇn ph¶i cã 5 v¹n l­îng lµm thñ tôc!")
	end
end

----------------------- ºÏ»¶°üÏà¹Ø ---------------------
function gather_bonus()
	Say("Kh«ng sai, 3 Bao hîp hoan, 3 kh¨n Uyªn ¦¬ng vµ 3 N¬ t×nh ı th× cã thÓ ®æi 1 viªn Thñy Tinh vµ 1 T©m T©m T­¬ng ¸nh phï; \n 2 Bao hîp hoan, 2 kh¨n Uyªn ¦¬ng vµ 2 N¬ t×nh ı cã thÓ ®æi 1 viªn Ng©n Nguyªn B¶o vµ 1 T©m T©m T­¬ng ¸nh phï; \n 1 Bao hîp hoan, 1 kh¨n Uyªn ¦¬ng vµ 1 N¬  t×nh ı cã thÓ ®æi 1 T©m T©m T­¬ng ¸nh phï. \n ng­¬i muèn ®æi lo¹i nµo?",4,"Ta ®æi Thñy Tinh vµ T©m T©m T­¬ng ¸nh phï /gather_bonus1","Ta ®æi Ng©n Nguyªn B¶o vµ T©m T©m T­¬ng ¸nh phï /gather_bonus2","Ta chØ ®æi T©m T©m T­¬ng ¸nh phï /gather_bonus3","Oh, xin lçi, ta nhí nhÇm!/no")
end

function gather_bonus1()
	if (GetItemCount(344) >= 3) then				-- ºÏ»¶°ü
		if (GetItemCount(345) >= 3) then			-- Ô§ÑìÅÁ
			if (GetItemCount(346) >= 3) then		-- ÇéÒâ½á
				for i=1,3 do
					DelItem(346)
					DelItem(345)
					DelItem(344)
				end
				AddItem(6,1,18,1,0,0,0)			-- ĞÄĞÄÏàÓ¡·û
				i = 238 + random(0,2)		-- Ëæ»ú¸øÒ»¿Å±¦Ê¯
				AddEventItem(i)
				Talk(1,"","Hay l¾m! Ta tÆng ng­¬i 1 viªn thñy tinh vµ 1 tÊm T©m T©m T­¬ng ¸nh Phï. §ång thêi chóc t×nh yªu hai ng­¬i g¾n bã keo s¬n!")
			else
				Talk(1,"","Ng­¬i kh«ng cã 3 c¸i N¬ T×nh ı, t×m ®ñ råi h·y ®æi nhĞ!")
			end
		else
			Talk(1,"","Ng­¬i kh«ng cã 3 c¸i Kh¨n Uyªn ¦¬ng, t×m ®ñ råi h·y ®æi nhĞ!")
		end
	else
		Talk(1,"","Ng­¬i kh«ng cã 3 c¸i Bao hîp hoan, t×m ®ñ råi h·y ®æi nhĞ!")
	end
end

function gather_bonus2()
	if (GetItemCount(344) >= 2) then				-- ºÏ»¶°ü
		if (GetItemCount(345) >= 2) then			-- Ô§ÑìÅÁ
			if (GetItemCount(346) >= 2) then		-- ÇéÒâ½á
				for i=1,2 do
					DelItem(346)
					DelItem(345)
					DelItem(344)
				end
				AddItem(6,1,18,1,0,0,0)			-- ĞÄĞÄÏàÓ¡·û
				AddEventItem(342)
				Talk(1,"","Hay l¾m! Ta tÆng ng­¬i 1 Ng©n Nguyªn b¶o vµ 1 tÊm T©m T©m T­¬ng ¸nh Phï. §ång thêi chóc t×nh yªu hai ng­¬i g¾n bã keo s¬n!")
			else
				Talk(1,"","Ng­¬i kh«ng cã 2 c¸i N¬ T×nh ı, t×m ®ñ råi h·y ®æi nhĞ!")
			end
		else
			Talk(1,"","Ng­¬i kh«ng cã 2 c¸i Kh¨n Uyªn ¦¬ng, t×m ®ñ råi h·y ®æi nhĞ!")
		end
	else
		Talk(1,"","Ng­¬i kh«ng cã 2 c¸i Bao hîp hoan, t×m ®ñ råi h·y ®æi nhĞ!")
	end
end

function gather_bonus3()
	if (HaveItem(344) == 1) then				-- ºÏ»¶°ü
		if (HaveItem(345) == 1) then			-- Ô§ÑìÅÁ
			DelItem(344)
			DelItem(345)
			AddItem(6,1,18,1,0,0,0)			-- ĞÄĞÄÏàÓ¡·û
			Talk(1,"","Hay l¾m! Ta tÆng ng­¬i 1 tÊm T©m T©m T­¬ng ¸nh Phï. §ång thêi chóc t×nh yªu hai ng­¬i g¾n bã keo s¬n!")
		else
			Talk(1,"","Ng­¬i kh«ng cã Kh¨n Uyªn ¦¬ng, t×m ®ñ råi h·y ®æi nhĞ!")
		end
	else
		Talk(1,"","Ng­¬i kh«ng cã Bao hîp hoan, t×m ®ñ råi h·y ®æi nhĞ!")
	end
end

-------------- 2004-8-22 ÆßÏ¦ËÍÀñ»î¶¯ ------------------
function present_QiXi( nPlayerIndex )
	local nPreservedPlayerIndex = PlayerIndex;
	
	PlayerIndex = nPlayerIndex;

	Talk( "H«m nay ®óng vµo r»m th¸ng b¶y, NguyÖt L·o sÏ tÆng mét mãn quµ ®Æc biÖt! Chóc phóc 2 ng­êi ®Çu b¹c r¨ng long!" );
	-- ËÍ2¸ö¡°ĞÄĞÄÏàÓ¡·û¡±
	for i = 1, 2 do
		AddItem( 6, 1, 18, 1, 0, 0 ,0);
	end
	Msg2Player( "B¹n nhËn ®­îc 2 T©m T©m T­¬ng ¸nh phï!" );
	-- ËÍ9¶ä¡°Ãµ¹å»¨¡±
	for i = 1, 9 do
		AddItem( 6, 0, 20, 1, 0, 0 ,0);
	end	
	Msg2Player( "B¹n nhËn ®­îc  9 b«ng hoa hång!" );
	-- 50¼¶ÒÔÉÏÍæ¼Ò¼ÓËÍ1¸ö¡°ÌìÉ½ÓñÂ¶¡±
	if( GetLevel() >= 50 ) then
		AddItem(6, 1, 72, 1, 0, 0, 0);
		Msg2Player( "B¹n nhËn ®­îc mét b×nh Thiªn S¬n B¶o Lé!" );
	end
	
	PlayerIndex = nPreservedPlayerIndex;
end

----------------------- end ----------------------------
function no()
end