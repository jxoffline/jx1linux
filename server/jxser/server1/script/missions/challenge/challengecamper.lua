--CheckCondition() ĞèÒª¸Ãº¯ÊıÓÃÓÚ¼ì²éÊÇ·ñ·ûºÏ¼ÓÈëÌõ¼ş

Include("\\script\\missions\\challenge\\challengehead.lua");

function main()

	V = GetMissionV(MS_STATE);
	
	--Èç¹û±¨Ãû½×¶ÎµÄ»°£¬Í¨ÖªÊ£ÓàÊ±¼ä
	--Èç¹ûÕ½¶·½×¶ÎµÄ»°£¬Í¨ÖªÕ½¶·Ê£ÓàÊ±¼ä
	if (V == 1) then 
		V1 = GetMissionV(MS_NEWSVALUE);
		RestTime = (GO_TIME - V1) * 20;
		RestMin, RestSec = GetMinAndSec(RestTime);
		str = "<#> Tr­êng ®Êu ®ang trong giai ®o¹n b¸o danh, thêi gian b¸o danh cßn l¹i:"..RestMin.."<#> phót "..RestSec.."<#> gi©y ";
		Msg2Player(str);
	elseif(V == 2) then
		gametime = (floor(GetMSRestTime(MISSIONID,11) / 18));
		RestMin, RestSec = GetMinAndSec(gametime);
		str = "<#> Tr­êng ®Êu ®ang trong giai ®o¹n chiÕn ®Êu, thêi gian chiÕn ®Êu cßn l¹i:"..RestMin.."<#> phót "..RestSec.."<#> gi©y ";
		Msg2Player(str);
	end
	
	--À©Õ¹µã6µÄÖµÈç¹ûÎª1£¬±íÊ¾¸Ã½ÇÉ«ÊôÓÚÕ½Çø¹ÜÀíÔ±¡£¿ÉÒÔÏòNpcÄÃÈë³¡µÀ¾ß
	if (GetExtPoint(6) == 1 or GetCamp() == 6 ) then 
		Say("Huynh lµ ng­êi qu¶n lı chiÕn tr­êng ë ®©y? Ta cã thÓ gióp g× kh«ng?", 7 ,  "CÇm lÊy vò khİ cña phe vµng /GetYellow", "CÇm lÊy vò khİ cña phe tİm /GetPurple" , "CÇm lÊy vò khİ cña ng­êi bªn c¹nh /GetWhite", "Bá hÕt tÊt c¶ vò khİ trong ng­êi ra /ClearItems", "Vµo ®Êu tr­êng /GoWarCenter", "Rêi khái ®Êu tr­êng /LeaveCenter",  "§Ó ta nghÜ l¹i xem /OnCancel");
		return
	end;
	
	--±¨Ãû½×¶Î	
	if (V == 1) then
		HaveCamp1 = HaveItem(350);--»Æ·½
		HaveCamp2 = HaveItem(347);--×Ï·½
		HaveCamp3 = HaveItem(348);--¼ÇÕß
		
		--Èç¹ûÃ»ÓĞÈÎºÎµÄÈë³¡µÀ¾ßµÄ»°
		if (HaveCamp1 == 0 and HaveCamp2 == 0 and HaveCamp3 == 0) then 
			Say("B¹n kh«ng cã bÊt cø 'Anh hïng lÖnh bµi' nµo, kh«ng thÓ vµo trong!", 0)
			return
		end;
		if (GetTeamSize() == 0)  then
			Say("B¹n ch­a lËp ®éi ngò, ch­a thÓ vµo trong!",0);
			return
		end;
		
		str1 = "<#> §éi cña ng­¬i cã"..GetTeamSize().."<#> ng­êi! Ng­¬i muèn gia nhËp phe nµo?";
		Say(str1 ,4, "ta muèn gia nhËp vµo phe vµng /JoinYellow", "ta muèn gia nhËp vµo phe tİm /JoinPurple", "ta muèn vµo ®Ó tham quan /JoinWhite", "§Ó ta nghÜ l¹i xem /OnCancle");
	
	elseif (V == 2) then --¿ªÕ½½×¶Î
		HaveCamp3 = HaveItem(348);
		if (HaveCamp3 == 1) then
			Say("B¹n hiÖn ®ang cã DiÖp Lôc Anh Hïng lÖnh. Muèn vµo tham chiÕn hay ra khái ®©y?", 3, "§Õn trung t©m cña ®Êu tr­êng /GoWarCenter", "Rêi khái khu vùc ®Êu tr­êng /LeaveWar", "§Ó ta nghÜ l¹i xem /OnCancel");
		end;
	elseif (V == 0) then
		Say("Thêi gian b¸o danh trËn khiªu chiÕn lµn nµy vÇn ch­a ®Õn! ",0);
	end;
	
end;

function ClearItems()
	ClearItem(347);
	ClearItem(348);
	ClearItem(350);
end;

function ClearItem(ItemId)

Count = GetItemCount(ItemId);
if (Count >= 1) then
	for i = 1, Count do 
		DelItem(ItemId)
	end;
end;

end;


function JoinYellow()
	if (HaveItem(350) >= 1) then
		CheckAndJoinCamp(1)		
	else
		Say("B¹n kh«ng cã ¸m Hoµng Anh Hïng lÖnh, kh«ng thÓ vµo trong!",0);
	end;
end;

function JoinPurple()
	if (HaveItem(347) >= 1) then
		CheckAndJoinCamp(2)		
	else
		Say("B¹n kh«ng cã HuyÕt Hång Anh Hïng lÖnh, kh«ng thÓ vµo trong!",0);
	end;
end;

function JoinWhite()
	if (HaveItem(348) >= 1) then 
		CheckAndJoinCamp(6)
	else
		Say("B¹n kh«ng cã DiÖp Lôc Anh Hïng lÖnh, kh«ng thÓ vµo trong!", 0);
	end;
end;


function GetYellow()
	AddEventItem(350);
end;

function GetPurple()
	AddEventItem(347);
end;

function GetWhite()
	AddEventItem(348);
end;


function OnCancel()

end;

function GoWarCenter()
	AddMSPlayer(MISSIONID, 6);
	SetCurCamp(0)
	NewWorld(CS_CampPos2[1], CS_CampPos2[2], CS_CampPos2[3]);
end;

function LeaveCenter()
	LeaveGame(0)	
	SetCurCamp(GetCamp())
end;


function CheckAndJoinCamp(Camp)
	
	if (IsCaptain() == 0) then
		Say("B¹n ch­a lËp ®éi ngò hoÆc kh«ng ph¶i lµ ®éi tr­ëng, kh«ng thÓ vµo trong! ",0);
		return
	else
		bHaveJoin = GetMissionV(MS_S_JOINED + Camp - 1);
		if (bHaveJoin == 1) then 
			Say("HiÖn ®· cã 1 ®éi kh¸c sö dông Anh Hïng lÖnh cïng mµu vµo tham chiÕn råi ", 0);
		return
		end;
	end;
				
	Size = GetTeamSize();
	if (Size > MAX_MEMBER_COUNT) then
		Say("Nh©n sè trong tæ cña b¹n v­ît h¬n h¹n ®Şnh, xin ®iÒu chØnh l¹i råi míi vµo thi ®Êu!" , 0);
		return
	else
		OldPlayer = PlayerIndex;
		W,X,Y = GetWorldPos();
		Size = GetTeamSize();
		
		for i = 1, Size do 
			PIdx = GetTeamMember(i);
			if (PIdx > 0) then 
				PlayerIndex = PIdx;
				W1,X,Y = GetWorldPos();
				if (W1 ~= W) then 
					PlayerIndex = OldPlayer
					Say("Tæ cña b¹n hiÖn cã 1 ng­êi kh«ng ë trong khu vùc chuÈn bŞ, xin ®iÒu chØnh l¹i råi míi vµo thi ®Êu!",0);
					return
				end;
			end
		end;
		
		PlayerIndex = OldPlayer;
		
		if (Camp == 1) then 
			DelItem(350);
		elseif (Camp == 2) then 
			DelItem(347)
		else
			DelItem(348)
		end

		JoinCampInTeam(Camp);
	end;
	
end;

function JoinCampInTeam(Camp)
	OldPlayer = PlayerIndex;
	local TeamTab = {};
	Size = GetTeamSize();
	Joined = 0;
	for i = 1, Size do 
		TeamTab[i] = GetTeamMember(i);
	end;
	for i = 1, Size do
		PlayerIndex = TeamTab[i];		
		if (Camp ~= 6 and GetLevel() < 30) then 
			Msg2MSAll(MISSIONID, GetName().."<#> ch­a h¬n cÊp 30, kh«ng thÓ tham gia!");
		else
			Joined = Joined + 1;
			JoinCamp(Camp)
		end;
	end;
	if (Joined >= 1) then
		SetMissionV(MS_S_JOINED + Camp - 1, 1);	
	end;

	PlayerIndex = OldPlayer;
	
end;
