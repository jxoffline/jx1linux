Include("\\script\\task\\newtask\\branch\\branch_bwsj.lua")
Include("\\script\\missions\\bw\\bwhead.lua");


szCaptainName = {};
function main()
--do Talk(1, "", "Chøc n¨ng ®· ®ãng.") return end
	--ÉèÖÃ·µ»Øµã
	x,y,z = GetWorldPos();
	SetTask(BW_SIGNPOSWORLD, x);
	SetTask(BW_SIGNPOSX, y);
	SetTask(BW_SIGNPOSY, z);
	szCaptainName = bw_getcaptains(); --»ñÈ¡Á½¶Ó¶Ó³¤µÄÃû×Ö£»

	idx = SubWorldID2Idx(BW_COMPETEMAP[1]);
	if (idx == -1) then
		ErrorMsg(3) 
		return
	end;
	
	OldSubWorld = SubWorld;
	SubWorld = idx;
	local MemberCount =GetMissionV(MS_MAXMEMBERCOUNT)
	ms_state = GetMissionV(MS_STATE);
	if (ms_state == 0) then 
		Say("§©y lµ ®Êu tr­êng thi ®Êu l«i ®µi, n¬i cho c¸c nh©n sÜ trªn giang hå ®¬n ®Êu hoÆc tæ chøc ®éi thi ®Êu, hiÖn t¹i ch­a ai b¸o danh thi ®Êu, c¸c h¹ muèn b¸o danh kh«ng? <color=yellow>HiÖn t¹i l«i ®µi më cöa miÔn phÝ<color>", 3, "§­îc th«i!/OnRegister", "Quy t¾c thi ®Êu ra sao?/OnHelp", "§Ó ta suy nghÜ l¹i!/OnCancel");
	elseif (ms_state == 1) then
		Say("§©y lµ ®Êu tr­êng l«i ®µi, hiÖn t¹i ®éi <color=yellow>"..szCaptainName[1].."<color> vµ ®éi <color=yellow>"..szCaptainName[2].."<color> thi ®Êu <color=yellow>"..MemberCount.." vs "..MemberCount.."<color>, ng­¬i cã yªu cÇu g× kh«ng?",4,"Ta lµ ®éi tr­ëng, muèn biÕt sè thø tù vµo ®Êu tr­êng./OnShowKey", "Ta lµ tuyÓn thñ, muèn vµo ®Êu tr­êng./OnEnterMatch", "Ta muèn xem trËn ®Êu nµy./OnLook", "Ta kh«ng høng thó víi trËn ®Êu nµy./OnCancel")
	elseif (ms_state == 2) then 
		OnFighting();
	else
		ErrorMsg(2)
	end;
	SubWorld = OldSubWorld;
end;

function OnRegister()
	--±¨Ãû
	if (GetTeamSize()  ~= 2) then
		Say("Muèn b¸o danh thi ®Êu cÇn ph¶i lµ <color=yellow>§éi tr­ëng<color> cña hai bªn, ®éi ngò cña ng­¬i h×nh nh­ kh«ng ®ñ <color=yellow>2<color> ng­êi.", 0);
		return
	end;

	if (IsCaptain() ~= 1) then 
		ErrorMsg(5)
		return
	end;

	Say("C¸c h¹ muèn ®Êu l«i ®µi, sè ng­êi ®«i bªn nhiÒu nhÊt bao nhiªu?", 9, "Th«i khái!/OnCancel", "1 vs 1/#SignUpFinal(1)", "2 vs 2/#SignUpFinal( 2 )", "3 vs 3/#SignUpFinal( 3 )","4 vs 4/#SignUpFinal( 4 )","5 vs 5/#SignUpFinal( 5 )","6 vs 6/#SignUpFinal( 6 )","7 vs 7/#SignUpFinal( 7 )","8 vs 8/#SignUpFinal( 8 )");
end;

function SignUpFinal(MemberCount)
	if (GetTeamSize()  ~= 2) then
		Say("Muèn b¸o danh thi ®Êu cÇn ph¶i lµ <color=yellow>§éi tr­ëng<color> cña hai bªn, ®éi ngò cña ng­¬i h×nh nh­ kh«ng ®ñ <color=yellow>2<color> ng­êi.", 0);
		return
	end;
	
	if (MemberCount <= 0 or MemberCount > 8) then
		return
	end
	
	local OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(BW_COMPETEMAP[1]);
	ms_state = GetMissionV(MS_STATE);

	if (ms_state ~= 0) then 
		ErrorMsg(8)
		return
	end
	OpenMission(BW_MISSIONID);
	local x = GetTask(BW_SIGNPOSWORLD);
	if x == 80 then
		SetMissionS(CITYID,"D­¬ng Ch©u")
	elseif x == 78 then
		SetMissionS(CITYID,"T­¬ng D­¬ng")
	else
		SetMissionS(CITYID,"Thµnh §«")
	end;
	
	local key = {};
	key = bw_getkey();
	SetMissionV(MS_TEAMKEY[1], key[1]);
	SetMissionV(MS_TEAMKEY[2], key[2]);
	
	OldPlayerIndex = PlayerIndex;
	for i = 1, 2 do 
		PlayerIndex = GetTeamMember(i);
		SetMissionS(i, GetName());
		szCaptainName = bw_getcaptains(); --»ñÈ¡Á½¶Ó¶Ó³¤µÄÃû×Ö£»
		if (MemberCount > 1) then
			Msg2Player("§éi h×nh cña c¸c h¹ sè thø tù vµo ®Êu tr­êng lµ: <color=yellow> ["..key[i].."]<color>, xin th«ng b¸o cho thµnh viªn ®éi sè thø tù nµy. Thµnh viªn gÆp C«ng B×nh Tö nhËp sè nµy vµo lµ cã thÓ vµo thi ®Êu.");			
			local szMsg = format("C«ng B×nh Tö: Ng­¬i ®· ®¨ng ký thi ®Êu gi÷a %s vµ %s, h·y mau chãng vµo ®Êu tr­êng,  trËn ®Êu sÏ chÝnh thøc b¾t ®Çu sau %d phót. Sè hiÖu ®Êu tr­êng lµ:<color=yellow>[%d]<color=>, h·y th«ng b¸o sè nµy cho c¸c ®ång ®éi, hä sÏ ph¶i dïng con sè nµy ®Ó vµo ®Êu tr­êng.",MemberCount, MemberCount, floor(GO_TIME/3),key[i])
			Say(szMsg,0)
			
		end
		branchTask_BW1()	--ºÍÈÎÎñÏà¹Ø£¬²Î¼ÓÁË±ÈÈü½øÐÐ¼ÆÊý
	end;
	
	PlayerIndex = OldPlayerIndex;
	SetMissionV(MS_MAXMEMBERCOUNT, MemberCount)
	SubWorld = OldSubWorld;
	str = "<#> HiÖn t¹i"..GetMissionS(CITYID)..szCaptainName[1].."®éi <#> ®Êu víi "..szCaptainName[2].."®éi <#>, l«i ®µi thi ®Êu chuÈn bÞ vµo ®Êu tr­êng, ®éi tr­ëng ®«i bªn lµ "..szCaptainName[1].."<#> vµ "..szCaptainName[2].."<#>. L«i ®µi më cöa miÔn phÝ, hoan nghªnh mäi ng­êi ®Õn xem thi ®Êu.";
	--AddGlobalNews(str);
	local szMsg = format("Ng­¬i ®· ®¨ng ký thi ®Êu gi÷a %s vµ %s, h·y mau chãng vµo ®Êu tr­êng,  trËn ®Êu sÏ chÝnh thøc b¾t ®Çu sau %d phót.",MemberCount, MemberCount, floor(GO_TIME/3))
	Msg2Team(szMsg);
end;

function bw_getkey()
	local key = {};
	key[1] = random(1, 9999)
	key[2] = random(1, 9999)
	
	--±£Ö¤key1 key2>0, key1 ~= key2
	if (key[2] == key[1]) then
		if (key[1] < 9996) then
			key[2] = key[1] + 3
		else
			key[2] = key[1] - 3;
		end
	end
	return key;
end;



function OnHelp()
	Talk(5, "",	"L«i ®µi thi ®Êu lµ n¬i ®Ó c¸c cao thñ thi thè tµi nghÖ víi nhau còng lµ n¬i thi ®Êu c«ng b»ng nhÊt cho ®«i bªn.",	"Muèn tham gia l«i ®µi thi ®Êu, tr­íc tiªn ph¶i ®Õn chç ta xin b¸o danh.",	"Sau khi ®Æt c­îc xong, b¸o danh tham gia l«i ®µi sÏ hoµn tÊt. Lý do ®Êu tr­êng cã giíi h¹n nªn trong lóc ng­êi kh¸c ®ang thi ®Êu, ng­êi kh¸c kh«ng thÓ b¸o danh!",	format("C«ng B×nh Tö: Sau khi ®¨ng ký thµnh c«ng, hai bªn cã thÓ vµo khu vùc chuÈn bÞ, thêi gian chuÈn bÞ lµ <color=yellow>%d<color> phót, sau khi thêi gian chuÈn bÞ kÕt thóc, trËn ®Êu sÏ chÝnh thøc b¾t ®Çu!", floor(GO_TIME/3)) , 	format("C«ng B×nh Tö: Thêi gian thi ®Êu lµ <color=yellow>%d<color> phót, nÕu trong %d phót kh«ng x¸c ®Þnh ®­îc ®éi th¾ng, trËn ®Êu sÏ ®­îc xö hßa.", floor(TIMER_2/(60*FRAME2TIME))-floor(GO_TIME/3), floor(TIMER_2/(60*FRAME2TIME))-floor(GO_TIME/3) ));
end;

function OnEnterMatch()
	local OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(BW_COMPETEMAP[1]);
	if (SubWorld < 0) then
		return
	end;
	
	if ((GetName() == szCaptainName[1]) or (GetName() == szCaptainName[2])) then 
		OnJoin(0)	--ÕâÀïºÅÂëÊ²Ã´¶¼¿ÉÒÔ the only param stand for the group ID;
	else
		Say("Xin nhËp sè thø tù tham gia thi ®Êu l«i ®µi lÇn nµy ®Ó vµo ®Êu tr­êng.",2, "§­îc th«i! §Ó ta nhËp vµo/OnEnterKey", "Quªn sè thø tù råi, ®Ó hái l¹i ®éi tr­ëng/OnCancel")
	end;
	SubWorld = OldSubWorld;
end

function OnEnterKey()
	AskClientForNumber("OnEnterKey1", 0, 10000, "Xin nhËp sè thø tù vµo ®Êu tr­êng:");
end

function OnEnterKey1(Key)
	local OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(BW_COMPETEMAP[1]);
	if (SubWorld < 0) then
		SubWorld = OldSubWorld;
		return
	end;
	if (Key == GetMissionV(MS_TEAMKEY[1])) then
		OnJoin(1)
	elseif (Key == GetMissionV(MS_TEAMKEY[2])) then
		OnJoin(2)
	else
		Say("Xin lçi! NhËp sè thø tù kh«ng ®óng, h·y x¸c nhËn l¹i sè thø tù hoÆc ®Õn hái l¹i ®éi tr­ëng. C¶m ¬n!",0)
	end
	SubWorld = OldSubWorld;
end

function OnLook()
	idx = SubWorldID2Idx(BW_COMPETEMAP[1]);
	OldSubWorld = SubWorld;
	SubWorld = idx;
	local str = szCaptainName[1].."§éi <#> vµ "..szCaptainName[2].."®éi <#> s¾p b¾t ®Çu thi ®Êu l«i ®µi, theo c¸c h¹ ai sÏ dµnh th¾ng lîi chung cuéc?";
	local str1 = "Ta muèn vµo ®Êu tr­êng <#> xem/onwatch";
	Say(str, 2, str1, "Ta ®o¸n kh«ng chÝnh x¸c, kh«ng vµo ®©u/OnCancel");
	SubWorld = OldSubWorld;
end;

function onwatch()
	OldSubWorld = SubWorld;
	local idx = SubWorldID2Idx(BW_COMPETEMAP[1]);
	if (idx == -1) then
		return
	end;
	SubWorld = idx;
	if (GetName() == szCaptainName[1]) or (GetName() == szCaptainName[2]) then 
		SubWorld = OldSubWorld
		OnJoin(0)	--¶Ó³¤²»ÄÜ½øÐÐ¹ÛÕ½
	else
		OnJoin(3);	--¼ÓÈëµ½¹ÛÖÚµÄ
	end;
end

--to join in a fight group	group --×é
function OnJoin(group)
	idx = SubWorldID2Idx(BW_COMPETEMAP[1]);
	if (idx < 0) then
		return
	end;
	OldSubWorld = SubWorld;
	SubWorld = idx;
	if (GetName() == szCaptainName[1]) then 
		JoinCamp(1)
	elseif (GetName() == szCaptainName[2]) then 
		JoinCamp(2)
	elseif (group == 1 or group == 2) then
		local masteridx = SearchPlayer(GetMissionS(group))
		local masternum = 0
		if (masteridx > 0) then
			if (PIdx2MSDIdx(BW_MISSIONID, masteridx) > 0) then
				masternum = 1
			end
		end
		if (GetMSPlayerCount(BW_MISSIONID, group) - masternum < GetMissionV(MS_MAXMEMBERCOUNT) - 1) then
			JoinCamp(group)
		else
			ErrorMsg(10)
		end;
	elseif (group == 3) then
		JoinCamp(3);
	else
		ErrorMsg(4)
	end;
	SubWorld=OldSubWorld;
end;

function OnFighting()
	str = "<#> HiÖn t¹i"..szCaptainName[1].."§éi <#> vµ "..szCaptainName[2].."®éi <#> ®ang trong thi ®Êu l«i ®µi, ng­¬i h·y ®îi trËn sau. ";
	Say(str, 1, "Ta ®· biÕt råi. /OnCancel");
end;

function OnCancel()
end;

function ErrorMsg(ErrorId)
	if (ErrorId == 1) then 
		Say("B¸o danh tham gia thi ®Êu ph¶i hai ng­êi tæ chøc ®éi sau ®ã míi b¸o danh ®­îc!",0)
	elseif (ErrorId == 2) then 
		Say("Song ph­¬ng tham gia thi ®Êu kh«ng ®em ®ñ ng©n l­îng.",0)
	elseif (ErrorId == 3) then 
		Say("B¸o danh tham gia bÞ lçi, xin liªn hÖ GM!",0);
	elseif (ErrorId == 4) then 
		Say("B¹n kh«ng ph¶i lµ ng­êi b¸o danh thi ®Êu nªn kh«ng thÓ vµo ®Êu tr­êng chØ cã thÓ xem ®Êu th«i!", 0);
	elseif (ErrorId == 5) then 
		Say("Ng­êi b¸o danh ph¶i lµ ®éi tr­ëng",0);
	elseif (ErrorId == 6) then 
		Say("B¹n mang kh«ng ®ñ ng©n l­îng trªn ng­êi!",0);
	elseif (ErrorId == 7) then 
		Say("Xin lçi! B¹n ch­a b¸o danh xem ®Êu!",0);
	elseif (ErrorId == 8) then
		Say("Xin lçi! §Êu tr­êng thi ®Êu ®· cã ng­êi ®¨ng ký tr­íc råi!",0);
	elseif (ErrorId == 9) then 
		Say("Xin lçi! Thi ®Êu ®· b¾t ®Çu, b¹n kh«ng thÓ ®Æt c­îc n÷a!",0);
	elseif (ErrorId == 10) then 
		Say("Sè ng­êi tham gia thi ®Êu ®· ®ñ!",0);
	else
		
	end;
	return
end;