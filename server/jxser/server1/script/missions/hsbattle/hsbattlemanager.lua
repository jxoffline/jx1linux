--²ÎÈüÁ÷³Ì
--1¡¢ÓëÖ÷Èë¿ÚµÄNpc¶Ô»°£¬Ñ¡Ôñ½øÈëµÚ¼¸¸öÕ½Çø
--2¡¢Èç¹û·ûºÏ²ÎÈüÌõ¼şÔò½øÈëÕ½ÇøÄÚ£¨ÁíÒ»ÕÅµØÍ¼£©£¬²¢ÒÔ0ÕóÓªÄ£Ê½½øÈë
--3¡¢Íæ¼ÒÓëÁ½±ßµÄNpc¶Ô»°£¬×ÔÓÉÑ¡Ôñ²ÎÓëµÄÕóÓª¡£
--4¡¢Íæ¼ÒPkËÀÍöºó½«×Ô¶¯±»ÈÔ³ö³¡Íâ£¬µ«ÔÚ±¾µØÍ¼ÄÚ
--5¡¢µ±Íæ¼ÒËÀÍöÊ±£¬»á×Ô¶¯ÏòÍ¬µØÍ¼µÄËùÓĞÍæ¼Ò¹«²¼µ±Ç°µÄÕ½¿ö¡£
--6¡¢Èç¹û¿ÉÒÔ£¬¿ÉÒÔ´ÓNpc¶Ô»°ÖĞÁË½âµ±Ç°µÄ×ÜÅÅĞĞ
--7¡¢±ÈÈü¿ÉÒÔ°´ÕÕµÈ¼¶·Ö³É¸÷ÖÖÈü³¡
--ÈëÕ½ÇøµÄNpc¡¢Ñ¡ÔñÕóÓªµÄNpc

Include("\\script\\missions\\hsbattle\\hshead.lua");
Include("\\script\\tong\\tong_header.lua");
Include("\\script\\missions\\huashanqunzhan\\dailog.lua");
MapTab = {};
MapCount = 1;
MapTab[1]= {212, 1577, 3288};

function main()
--[DinhHQ]
--20110330: change request 30/03/2011
--do
	--Talk(1, "", "Chøc n¨ng t¹m ®ãng")
	--return
--end
	local tbSay = 
	{
		"<dec><npc>§¹i hiÖp t×m ta cã viÖc g×?",
		"L«i ®µi Hoa S¬n tuyÖt ®Ønh/HSBattle_Dailog_Main",
	}
	tinsert(tbSay, "L«i ®µi Hoa S¬n/#huashanqunzhan_SignUpMain(1)")
	tinsert(tbSay, "KÕt thóc ®èi tho¹i/OnCancel")
	CreateTaskSay(tbSay)
end;


function HSBattle_Dailog_Main()
	--ÉèÖÃ·µ»Øµã
	SetTask(300, 2);
	SetTask(301, 2605);
	SetTask(302, 3592);
	idx = SubWorldID2Idx(MapTab[1][1]);
	if (idx == -1) then 
		Say("HiÖn giê vÉn ch­a cã ai b¸o danh L«i ®µi ®¬n ®Êu! NghÜa sÜ cã muèn thö tµi kh«ng?",0)
		return
	end
	
	OldSubWorld = SubWorld;
	SubWorld = idx;
	ms_state = GetMissionV(MS_STATE);
	if (ms_state == 0) then 
		Say("HiÖn giê vÉn ch­a cã bang héi nµo b¸o danh thi ®Êu! NghÜa sÜ cã muèn thö tµi kh«ng?", 3, "§­îc th«i!/OnRegister", "Quy t¾c bang héi l«i ®µi nh­ thÕ nµo? /OnHelp", "§Ó ta suy nghÜ l¹i!/OnCancel");
	elseif (ms_state == 1) then
		OnReady();
	elseif (ms_state == 2) then 
		OnFighting();
	else
		ErrorMsg(2)
	end;
	
	SubWorld = OldSubWorld;
end


function OnHelp()
	Talk(8, "",	"L«i ®µi bang héi lµ n¬i häc hái vâ nghÖ gi÷a c¸c bang héi trªn giang hå! §©y sÏ lµ n¬i thi ®Êu c«ng b»ng",	"Muèn tham gia L«i ®µi bang héi, tr­íc hÕt ph¶i gÆp ta ®Ó xin phĞp! Ng­êi xin phĞp ph¶i lµ bang chñ cña bang héi thi ®Êu!",	"Sau khi tæ ®éi, ®éi tr­ëng 2 bªn sÏ ®Õn b¸o danh. Bang chñ hai bªn  mçi ng­êi ph¶i ®Æt c­îc thi ®Êu 1000 v¹n l­îng. ",	"Sau khi ®Æt c­îc xong, xin phĞp thi ®Êu ®· hoµn thµnh. Trong lóc cã 2 bang héi kh¸c ®ang thi ®Êu, kh«ng cho phĞp b¸o danh",	"Xin phĞp thµnh c«ng xong, thµnh viªn cña hai bang héi cã10 phót gia nhËp ®Êu tr­êng. Sau ®ã thi ®Êu sÏ chİnh thøc b¾t ®Çu!" ,"Th¾ng b¹i phô thuéc vµo ®iÓm tİch lòy thi ®Êu cña hai bªn. Mçi thµnh viªn bang héi lµm träng th­¬ng ®èi ph­¬ng sÏ ®­îc 3 ®iÓm, ®èi ph­¬ng bŞ trõ 1 ®iÓm", 	"KÕt thóc thi ®Êu, bang héi nµo tİch lòy ®iÓm cao h¬n sÏ giµnh th¾ng lîi!",	"Ngoµi ra, trong lóc thi ®Êu mét bªn nµo kh«ng cßn thµnh viªn nµo ë l¹i ®Êu tr­êng th× th¾ng lîi sÏ thuéc vÒ bªn kia. ","Bang héi chiÕn th¾ng cã thÓ thu håi 500 v¹n l­îng, ngoµi ra cßn ®­îc 400 v¹n l­îng tiÒn th­ëng vµ 12.000 ®iÓm kinh nghiÖm bang héi; bªn thua cuéc sÏ kh«ng lÊy l¹i ®­îc tiÒn ®· ®ãng, mµ cßn bŞ trõ 14.000 ®iÓm kinh nghiÖm bang héi. ");
end;

function OnRegister()
--±¨Ãû
	if (GetTeamSize()  ~= 2) then
		ErrorMsg(1)
		return
	else
		if (IsCaptain() ~= 1) then 
			ErrorMsg(5)
			return
		end;
		
		OldPlayer = PlayerIndex;
		for i = 1, 2 do 
			PlayerIndex = GetTeamMember(i);
			if (GetTongFigure() ~= TONG_MASTER or GetCash() < MS_SIGN_MONEY) then 
				PlayerIndex = OldPlayer
				ErrorMsg(2)
				return
			end;
		end;
		PlayerIndex = OldPlayer;
		
		TongIdTab = {};
		TongNameTab = {};
		for i = 1, 2 do 
			PlayerIndex = GetTeamMember(i);
				if (Pay(MS_SIGN_MONEY) == 0) then
					WriteLog(GetTongName().."Bang héi giao"..MS_SIGN_MONEY.."Thao t¸c phİ thi ®Êu l«i ®µi bang héi kh«ng thµnh c«ng!!!! ");
					PlayerIndex = OldPlayer
					ErrorMsg(3)
					return
				else
					TongNameTab[i], TongIdTab[i] =  GetTongName();
					WriteLog(TongNameTab[i].."Bang héi giao"..MS_SIGN_MONEY.."Thµnh c«ng thao t¸c phİ thi ®Êu l«i ®µi cña bang héi! ");
				end;
		end;
		PlayerIndex = OldPlayer;
		
		OldSubWorld = SubWorld;
		idx = SubWorldID2Idx(MapTab[1][1]);
		if (idx == -1) then
			ErrorMsg(3) 
			return
		end;
		SubWorld = idx;
		
		OpenMission(MISSIONID);
		for i  = 1, 2 do 
			SetMissionV(MS_TONG1ID + i - 1, TongIdTab[i]);
		end;
		
		SetMissionS(1, TongNameTab[1]); --1¡¢2Á½¸öMissionString´æ·Å°ï»áµÄÃû³Æ
		SetMissionS(2, TongNameTab[2]);
		
		str = "<#> b¾t ®Çu l«i ®µi Bang héi, hai bªn lµ "..TongNameTab[1].."<#> víi"..TongNameTab[2];
		AddGlobalNews(str);
		SubWorld = OldSubWorld;
		Msg2Team("C¸c b¹n ®· hoµn tÊt b¸o danh! Xin h·y chuÈn bŞ! Sau 10 phót n÷a sÏ chİnh thøc khai chiÕn");
		Say("C¸c b¹n ®· hoµn tÊt b¸o danh! Xin h·y chuÈn bŞ! Sau 10 phót n÷a sÏ chİnh thøc khai chiÕn",0);
	end;
end;

function OnReady()
	str = "<#> HiÖn t¹i l«i ®µi Bang héi ®ang trong giai ®o¹n vµo ®Êu tr­êng, mêi"..GetMissionS(1).."<#> víi"..GetMissionS(2).." thµnh viªn Bang héi <#> nhanh chãng vµo ®Êu tr­êng, chuÈn bŞ b¾t ®Çu thi ®Êu!";
	Say(str, 2, "Ta thİch hîp víi ®iÒu kiÖn, ta muèn vµo ®Êu tr­êng /OnJoin", "Ta muèn nh©n c¬ héi nµy ®Ó gióp mäi ng­êi trong bang héi trë nªn m¹nh mÏ. /OnCancel");
end;

function ErrorMsg(ErrorId)
if (ErrorId == 1) then 
	Say("Bang chñ hai bªn muèn xin phĞp thi ®Êu tr­íc hÕt ph¶i lËp nhãm råi míi xin phĞp. ",0)
elseif (ErrorId == 2) then 
	Say("Bang chñ b¸o danh cÇn ph¶i lµ ®éi tr­ëng cña ®éi ngò hiÖn t¹i vµ ph¶i mang theo ®ñ 500 v¹n l­îng",0)
elseif (ErrorId == 3) then 
	Say("B¸o danh xuÊt hiÖn trôc trÆc. Xin liªn hÖ ng­êi qu¶n lı!",0);
elseif (ErrorId == 4) then 
	Say("B¹n kh«ng ph¶i lµ thµnh viªn cña 2 bang héi ®ang thi ®Çu, kh«ng thÓ vµo trong!", 0);
elseif(ErrorId == 5) then 
	Say("Bang chñ b¸o danh cÇn ph¶i lµ ®éi tr­ëng cña ®éi ngò hiÖn t¹i",0);
else
	
end;

return
end;

function OnJoin()
	idx = SubWorldID2Idx(MapTab[1][1]);
	if (idx == -1) then 
		return
	end
	
	OldSubWorld = SubWorld;
	SubWorld = idx;
	
	if (GetTongName() == GetMissionS(1)) then 
		JoinCamp(1)
	elseif (GetTongName() == GetMissionS(2)) then 
		JoinCamp(2)
	else
		ErrorMsg(4)
	end;
	
	ms_state = GetMissionV(MS_STATE);
	if (ms_state == 2) then
		SetFightState(1)
	elseif(ms_state == 1) then  
		SetFightState(0)
	else
		return
	end;
	SubWorld=OldSubWorld
	
end;

function OnFighting()
	str = "<#> HiÖn t¹i l«i ®µi Bang héi ®ang tiÕn hµnh thi ®Êu, mêi"..GetMissionS(1).."<#> víi"..GetMissionS(2).."<#> thµnh viªn Bang héi vµo ®Êu tr­êng thi ®Êu!";
	Say(str, 2, "Ta thİch hîp víi ®iÒu kiÖn, ta muèn vµo ®Êu tr­êng /OnJoin", "Ta kh«ng phï hîp víi ®iÒu kiÖn, ta kh«ng muèn vµo! /OnCancel");
end;

function OnCancel()
end;
