--¼ÓÈëÄ³Ò»·½µÄNpc¶ÔÓ¦½Å±¾
--BattleIdÍâ²¿µÄÈ«¾Ö±äÁ¿£¬±íÊ¾µ±Ç°ÌôÕ½ÈüµØÍ¼µÄ±àºÅ(1-8)

--HaveBeginWar(CityID) -- CityID(1-7)		//ÏÖÔÚÄ³¸ö³ÇÊĞÊÇ·ñÒÑ¿ªÕ½,·µ»ØÖµÎªÒ»¸öBOOLÖµ
--GetCityAreaName(CityID)					//È¡1µ½7µÄ³ÇÇøÃû³Æ,·µ»ØÖµÎªÒ»¸ö×Ö·û´®
--GetCityWarBothSides(CityID)				//»ñµÃ¹¥»÷·½ÓëÊØ·½µÄ°ï»áÃû,·µ»ØÁ½¸ö×Ö·û´®,°´´ÎĞò·Ö±ğ´ú±í¹¥»÷·½ºÍÊØ·½
--NotifyWarResult(CityID, WarResult)		//±ÈÈü½áÊøÖ®ºó£¬Í¨ÖªRelay±ÈÈü½á¹û(WarResultÎªBOOLÖµ±íÊ¾¹¥³Ç·½ÊÇ·ñÊ¤Àû)
--GetCityWarTongCamp(TongName)				//»ñµÃ²ÎÓë¹¥³ÇÕ½Ïà¹Ø»î¶¯µÄ°ï»áÕóÓª£¬·µ»ØINT¼´ÕóÓª´ú±íÖµ
--IsArenaBegin(ArenaID) -- ArenaID(0-7)		//»ñµÃµ±Ç°¸÷¸öÀŞÌ¨³¡ÇøÊÇ·ñ¿ªÊ¼£¬·µ»ØBOOL
--GetArenaCityArea(nArenaID)				//»ñµÃµ±Ç°ÕıÔÚ½øĞĞµÄÀŞÌ¨ÈüÊÇÕë¶ÔÄÄ¸ö³ÇÇø,·µ»ØÖµÎªCityID
--GetArenaBothSides(ArenaID)				//»ñµÃÄ³Ò»³¡ÀŞÌ¨ÈüË«·½µÄÃû³Æ,·µ»ØÁ½¸ö×Ö·û´®,°´´ÎĞò·Ö±ğ´ú±í¼×·½ÒÒ·½
--NotifyArenaResult(ArenaID, ArenaResult)	//Í¨ÖªÒ»³¡ÀŞÌ¨Èü½áÊøµÄ±ÈÈü½á¹û¸øRelay, ArenaResultÎªBOOLÖµ±íÊ¾µÄ¼×·½ÊÇ·ñ»ñÊ¤
--GetArenaLevel()							//»ñµÃµ±Ç°ÀŞÌ¨ÈüËùÔÚÂÖ´Î£¬·µ»ØÖµ 0:±ÈÈüÒÑ¾­½áÊø»òÕßÉĞÎ´¿ªÊ¼£¬1:µÚÒ»ÂÖ£¬2/3/4/5ÒÔ´ËÀàÍÆ
--GetArenaTotalLevel()						//»ñµÃµ±Ç°ÀŞÌ¨ÈüµÄ×ÜÂÖ´Î
--GetCurArenaInfo()							//»ñµÃµ±Ç°ÂÖ´ÎµÄÈü³Ì
--GetArenaTotalLevelByCity(CityID)			//»ñµÃÄ³¸ö³ÇÊĞÀŞÌ¨ÈüµÄ×ÜÂÖ´Î
--GetArenaInfoByCity(CityID, ArenaLevel)	//»ñµÃÄ³¸ö³ÇÊĞÀŞÌ¨Èü¹ûµÄÊı¾İ,ArenaLevel: 0-Based

Include("\\script\\missions\\citywar_arena\\head.lua");
Include("\\script\\lib\\common.lua")
function main()
	ms_state = GetMissionV(MS_STATE);
	if (ms_state == 0) then 
		WorldID = SubWorldIdx2ID(SubWorld);
		ArenaID = WorldID - 213;
		if (IsArenaBegin(ArenaID) ~= 0) then
			Tong1, Tong2 = GetArenaBothSides(ArenaID);
			Tong1 = safeshow(Tong1)
			Tong2 = safeshow(Tong2)
			Say(Tong1.."vµ"..Tong2.."LËp tøc chuÈn bŞ chiÕn ®Êu, ®Êu tr­êng ®ang chuÈn bŞ, mäi ng­êi h·y s½n sµng ", 0);
		else
			Say("Thêi gian chiÕn ®Êu vÉn ch­a ®Õn!", 1, "BiÕt råi, ta ®i tr­íc ®©y /OnCancel");
		end;
	elseif (ms_state == 1) then
		OnReady();
	elseif (ms_state == 2) then 
		OnFighting();
	else
		ErrorMsg(3)
	end;
end;

function OnHelp()
	Talk(8, "",	"L«i ®µi bang héi lµ n¬i häc hái vâ nghÖ gi÷a c¸c bang héi trªn giang hå! §©y sÏ lµ n¬i thi ®Êu c«ng b»ng",	"Muèn tham gia L«i ®µi bang héi, tr­íc hÕt ph¶i gÆp ta ®Ó xin phĞp! Ng­êi xin phĞp ph¶i lµ bang chñ cña bang héi thi ®Êu!",	"Sau khi tæ ®éi, ®éi tr­ëng 2 bªn sÏ ®Õn b¸o danh. Bang chñ hai bªn  mçi ng­êi ph¶i ®Æt c­îc thi ®Êu 1000 v¹n l­îng. ",	"Sau khi ®Æt c­îc xong, xin phĞp thi ®Êu ®· hoµn thµnh. Trong lóc cã 2 bang héi kh¸c ®ang thi ®Êu, kh«ng cho phĞp b¸o danh",	"Xin phĞp thµnh c«ng xong, thµnh viªn cña hai bang héi cã10 phót gia nhËp ®Êu tr­êng. Sau ®ã thi ®Êu sÏ chİnh thøc b¾t ®Çu!" ,"Th¾ng b¹i phô thuéc vµo ®iÓm tİch lòy thi ®Êu cña hai bªn. Mçi thµnh viªn bang héi lµm träng th­¬ng ®èi ph­¬ng sÏ ®­îc 3 ®iÓm, ®èi ph­¬ng bŞ trõ 1 ®iÓm", 	"KÕt thóc thi ®Êu, bang héi nµo tİch lòy ®iÓm cao h¬n sÏ giµnh th¾ng lîi!",	"Ngoµi ra, trong lóc thi ®Êu mét bªn nµo kh«ng cßn thµnh viªn nµo ë l¹i ®Êu tr­êng th× th¾ng lîi sÏ thuéc vÒ bªn kia. ","Bang héi chiÕn th¾ng cã thÓ thu håi 1000 v¹n l­îng ®· ®ãng, ngoµi ra cßn ®­îc 800 v¹n l­îng tiÒn th­ëng vµ 12.000 ®iÓm kinh nghiÖm bang héi. Bang héi thua cuéc sÏ kh«ng lÊy l¹i ®­îc tiÒn ®· ®ãng, mµ cßn bŞ trõ 14.000 ®iÓm kinh nghiÖm bang héi");
end;

function OnReady()
	V = GetMissionV(MS_NEWSVALUE);
	RestTime = (GO_TIME - V) * 20;
	
	if (RestTime < 0) then 
		RestTime=0
	end;
	
	RestMin, RestSec = GetMinAndSec(RestTime);

	str = "<#> N¬i nµy ®ang diÔn ra tranh ®Êu"..GetMissionS(3).."<#> c«ng thµnh khiªu chiÕn, hiÖn t¹i bang héi thi ®Êu lµ:"..GetMissionS(1).."<#> víi"..GetMissionS(2).."<#>, thêi gian nhËp tr­êng cßn l¹i"..RestMin.."<#> phót "..RestSec.."<#> gi©y.";
	Say(str, 2, "Ta thİch hîp víi ®iÒu kiÖn, ta muèn vµo ®Êu tr­êng /OnJoin", "ta kh«ng muèn vµo ®Êu tr­êng /OnCancel");
end;

function ErrorMsg(ErrorId)
if (ErrorId == 1) then 
	Say("Bang chñ hai bªn muèn xin phĞp thi ®Êu tr­íc hÕt ph¶i lËp nhãm råi míi xin phĞp. ",0)
elseif (ErrorId == 2) then 
	Say("§Õn b¸o danh ph¶i lµ ®éi tr­ëng cña bang héi muèn thi ®Êu, mçi bang chñ ph¶i mang ®ñ 1000 v¹n l­îng",0)
elseif (ErrorId == 3) then 
	Say("B¸o danh xuÊt hiÖn trôc trÆc. Xin liªn hÖ ng­êi qu¶n lı!",0);
elseif (ErrorId == 4) then 
	Say("B¹n kh«ng ph¶i lµ thµnh viªn cña hai bang héi thi ®Êu hoÆc sè ng­êi trong ®Êu tr­êng ®· ®Çy, kh«ng thÓ vµo ®­îc!", 0);
elseif(ErrorId == 5) then 
	Say("Bang chñ b¸o danh cÇn ph¶i lµ ®éi tr­ëng cña ®éi ngò hiÖn t¹i",0);
else
	
end;

return
end;

function OnJoin()
	if (GetTongName() == GetMissionS(1)) then 
		if (GetJoinTongTime() >= 7200) then
			JoinCamp(1);
		else
			Say("Thêi gian b¹n gia nhËp bang héi qu¸ ng¾n, kh«ng thÓ tham gia chiÕn ®Êu!", 0);
		end;
	elseif (GetTongName() == GetMissionS(2)) then 
		if (GetJoinTongTime() >= 7200) then
			JoinCamp(2);
		else
			Say("Thêi gian b¹n gia nhËp bang héi qu¸ ng¾n, kh«ng thÓ tham gia chiÕn ®Êu!", 0);
		end;
	else
		ErrorMsg(4)
	end;
end;

function OnFighting()
	gametime = (floor(GetMSRestTime(MISSIONID,17)/18));
	RestMin, RestSec = GetMinAndSec(gametime);
	str1 = "<#> nh©n sè 2 bªn hiÖn t¹i lµ:"..GetMSPlayerCount(MISSIONID, 1).."<#> "..GetMSPlayerCount(MISSIONID, 2).."<#>. Thêi gian cßn d­ "..RestMin.."<#> phót "..RestSec.."<#> gi©y.";
	str = "<#> hiÖn t¹i bang héi"..GetMissionS(1).."<#> víi"..GetMissionS(2).."<#> ®ang tiÕn hµnh";
	Say(str..str1, 0);
end;

function OnCancel()

end;
