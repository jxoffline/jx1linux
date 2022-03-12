IncludeLib("LEAGUE")
IncludeLib("TONG")
Include("\\script\\missions\\citywar_arena\\head.lua");
Include("\\script\\missions\\citywar_global\\head.lua");
Include("\\script\\missions\\citywar_global\\citywar_function.lua");
Include("\\script\\task\\system\\task_string.lua")
Include("\\script\\lib\\common.lua")
Include("\\script\\missions\\citywar_global\\ladder.lua")
MapTab = {};
MapTab[1]= {213, 1633, 3292};
MapTab[2]= {214, 1633, 3292};
MapTab[3]= {215, 1633, 3292};
MapTab[4]= {216, 1633, 3292};
MapTab[5]= {217, 1633, 3292};
MapTab[6]= {218, 1633, 3292};
MapTab[7]= {219, 1633, 3292};
MapTab[8]= {220, 1633, 3292};
MapCount = getn(MapTab);

LGTSK_QINGTONGDING_COUNT = 1;	--±¨Ãû¾ºÍ¶µÄ ÌôÕ½ÁîÊýÁ¿
LGTSK_CITYWAR_SIGNCOUNT = 2;	--µ±Ç°¾ºÍ¶µÄ´ÎÊý

LEAGUETYPE_CITYWAR_SIGN = 508;
LEAGUETYPE_CITYWAR_FIRST = 509;
nCityWar_Item_ID_G = 6		--¹¥³ÇÕ½ÐÅÎïG ID
nCityWar_Item_ID_D = 1	--¹¥³ÇÕ½ÐÅÎïD ID
nCityWar_Item_ID_P = 1499		--¹¥³ÇÕ½ÐÅÎïP ID
TIAOZHANLING_TASK_DATE = 1839 --ÌôÕ½Áî¼ÇÂ¼ÁìÈ¡Ê±ÆÚ,1.Ê±¼ä(Äê%y),2.Ê±¼ä(ÔÂ)£¬3.Ê±¼ä(ÈÕ),4.ÁìÈ¡´ÎÊý
TIAOZHANLING_TASK_COUNT = 1840 --ÌôÕ½Áî½»ÄÉ´ÎÊý
	
function OnCancel()
end;

function PreEnterGame()
	--Èç¹ûÍæ¼ÒËùÔÚ°ï»áÕýÔÚ½øÐÐÀÞÌ¨Èü,Ôò×Ô¶¯½øÈë¸Ã³¡µØ
	TongName, result = GetTong()
	if (TongName ~= "") then
		for i = 0, 7 do
			if (IsArenaBegin(i) == 1) then
				Tong1, Tong2 = GetArenaBothSides(i);
				if (Tong1 == TongName or Tong2 == TongName) then
					EnterBattle(i);
					return
				end;
			end;
		end;
	end;

	--·ñÔò,ÇëÍæ¼Ò×Ô¼ºÑ¡Ôñ½øÈëÄÄÒ»¸ö
	EnterGame();
end;

function EnterGame()
	ExtraArenaInfo = {"<#> (Kho¶ng trèng) ", "<#> (Kho¶ng trèng) ", "<#> (Kho¶ng trèng) ", "<#> (Kho¶ng trèng) ", "<#> (Kho¶ng trèng) ", "<#> (Kho¶ng trèng) ", "<#> (Kho¶ng trèng) ", "<#> (Kho¶ng trèng) "};
	for i = 0, 7 do
		if (IsArenaBegin(i) == 1) then
			Tong1, Tong2 = GetArenaBothSides(i);
			ExtraArenaInfo[i + 1] = " ("..Tong1.." vs "..Tong2..") "
		end;
	end;

	Say("B¹n muèn vµo c«ng thµnh chiÕn dù tuyÓn thi ®Êu l«i ®µi kh«ng??", 9, "<#> L«i ®µi 1"..ExtraArenaInfo[1].."/EnterBattle", "<#> L«i ®µi 2"..ExtraArenaInfo[2].."/EnterBattle", "<#> L«i ®µi 3"..ExtraArenaInfo[3].."/EnterBattle", "<#> L«i ®µi 4"..ExtraArenaInfo[4].."/EnterBattle", "<#> L«i ®µi 5"..ExtraArenaInfo[5].."/EnterBattle", "<#> L«i ®µi 6"..ExtraArenaInfo[6].."/EnterBattle", "<#> L«i ®µi 7"..ExtraArenaInfo[7].."/EnterBattle", "<#> L«i ®µi 8"..ExtraArenaInfo[8].."/EnterBattle","Kh«ng ®i n÷a/OnCancel");
end;

function EnterBattle(nBattleId)

	if (IsArenaBegin(nBattleId) ~= 1) then 
		return 
	end;

	SetFightState(0)
	--ÉèÖÃ·µ»Øµã
	M,X,Y = GetWorldPos();
	SetTask(300, M);
	SetTask(301, X);
	SetTask(302, Y);

	NewWorld(MapTab[nBattleId + 1][1], MapTab[nBattleId + 1][2], MapTab[nBattleId + 1][3]);
end;


-- function main()
	--
--	ArenaMain();
-- end

--±¨ÃûÖ¸¶¨³ÇÊÐÀÞÌ¨Èü [wxb 2004-3-31](·ÏÆú2006-11-22)
function SignupACity(sel)
	CityID = sel + 1;
	if (IsSigningUp(CityID) == 1) then
		SetTaskTemp(15, CityID);
		AskClientForNumber("SignUpFinal", 1000000, 99999999, "Xin nhËp sè tiÒn ®Êu thÇu vµo:");
	else
		Say("<#><"..GetCityAreaName(CityID).."<#> >thµnh, b¸o danh trËn L«i ®µi ch­a b¾t ®Çu ", 0);
	end;
end;

--±¨ÃûÎ¨Ò»µÄÕýÔÚ±¨Ãû½×¶ÎµÄÀÞÌ¨Èü [wxb 2004-3-31](·ÏÆú2006-11-22)
function SignUpTheOne()
	CityID = 0;
	for i = 1, 7 do
		if (IsSigningUp(i) == 1) then
			CityID = i;
		end;
	end;

	if (IsSigningUp(CityID) == 1) then
		SetTaskTemp(15, CityID);
		AskClientForNumber("SignUpFinal", 1000000, 99999999, "Xin nhËp sè tiÒn ®Êu thÇu vµo:");
	else
		Say("<#><"..GetCityAreaName(CityID).."<#> >thµnh, b¸o danh trËn L«i ®µi ch­a b¾t ®Çu ", 0);
	end;
end;

--Íæ¼ÒÊäÈëÍ¶±ê½ðºóµ½ÕâÀï [wxb 2004-3-31](·ÏÆú2006-11-22)
function SignUpFinal(Fee)
	CityID = GetTaskTemp(15);
	SignUpCityWarArena(CityID, Fee);
end;

--²éÑ¯×òÌì¾ºÍ¶ÌôÕ½ÁîµÄÇé¿ö
function citywar_CheckVotes()
	local nCityId = getSigningUpCity(1);
	local tbVotes = citywar_tbLadder:GetInfo()
	local szMsg = format("<dec><npc>Bªn d­íi lµ bang héi tham gia ®Êu gi¸ khiªu chiÕn lÖnh <%s>: <enter>%s%s%s<enter>", GetCityAreaName(nCityId), strfill_center("STT",4, " "), strfill_center("Bang héi", 20, " "), strfill_center("Sè l­îng", 20, " "))
	local res = {}
	for i = 1, getn(tbVotes) do
		tinsert(res, strfill_center(i, 4, " "))
		tinsert(res, strfill_center(tbVotes[i].szName, 20, " "))
		tinsert(res, strfill_center(tbVotes[i].nValue, 20, " "))
		tinsert(res, "<enter>")
	end
	PushString(szMsg)
	for i = 1, getn(res) do
		AppendString(res[i])
	end
	szMsg = PopString()
	TaskSayList(szMsg, "C¸m ¬n! Ta ®· râ råi./OnCancel")
end
--Èë¿Ú
function ArenaMain()
	local nCityId = getSigningUpCity(1);--GetArenaTargetCity()
	if (tonumber(GetLocalDate("%H"))>= 18 and tonumber(GetLocalDate("%H")) < 19 and getSignUpState(nCityId) == 1) then
		Say(format("HiÖn t¹i c«ng thµnh chiÕn thµnh <%s> ®ang cho b¸o danh, ng­¬i muèn ®¨ng ký kh«ng?",GetCityAreaName(nCityId)), 7, "B¸o danh c«ng thµnh chiÕn/SignUpCityWar", "Ta muèn xem t×nh h×nh b¸o danh c«ng thµnh chiÕn/ViewCityWarTong","Ta muèn xem sè l­îng khiªu chiÕn lÖnh cña bang/ViewTiaoZhanLing","T×m hiÓu t×nh h×nh c«ng thµnh chiÕn/GameInfo", "Sù nghÞ Thµnh chiÕn lÖnh bµi/TokenCard", "Mua dông cô hç trî C«ng thµnh chiÕn/AskDeal", "Kh«ng muèn g× c¶ /OnCancel");
	else
		Say("§©y lµ n¬i nghÞ sù c«ng thµnh chiÕn, ng­¬i ®Õn cã viÖc g×?",
			7,
			"Ta ®Õn giao lÖnh bµi/GiveTiaoZhanLing",
			"Xem t×nh h×nh ®Êu gi¸ khiªu chiÕn lÖnh/citywar_CheckVotes" ,
			"Ta muèn xem sè l­îng khiªu chiÕn lÖnh cña bang/ViewTiaoZhanLing",
			"T×m hiÓu t×nh h×nh c«ng thµnh chiÕn/GameInfo",
			"Sù nghÞ Thµnh chiÕn lÖnh bµi/TokenCard",
			"Mua dông cô hç trî C«ng thµnh chiÕn/AskDeal",
			"Kh«ng muèn g× c¶ /Cancel");
	end;
end;

--²é¿´ÒÑ¾­±¨Ãû²Î¼Ó¹¥³ÇÕ½µÄ°ï»á
function ViewCityWarTong()
	local caption = nil
	local nCityId = getSigningUpCity(1);
	local nlgID = LG_GetLeagueObj(LEAGUETYPE_CITYWAR_SIGN, cityid_to_lgname(nCityId)) 
	--LEAGUETYPE_CITYWAR_SIGN, cityid_to_lgname(nCityId),
	local nlgcount = LG_GetMemberCount(nlgID)
	if nlgcount == 0 then
		caption = "<dec>HiÖn tai ch­a cã bang héi nµo b¸o danh c«ng thµnh."	
	else
		caption = "<dec>Bang héi b¸o danh c«ng thµnh chiÕn: \n"
		PushString(caption)
		for nindex=0,nlgcount do
			szTongName = LG_GetMemberInfo(nlgID,nindex)
			AppendString("<color=yellow>")
			AppendString(szTongName)
			AppendString("<color>\t")
		end
		caption = PopString()
	end
	local option = {"Trë vÒ/ArenaMain", "Tho¸t ra/OnCancel"}
	TaskSay(caption, option)
end

--½»ÄÉÌôÕ½Áî
function GiveTiaoZhanLing()
	if checkBangHuiLimit() == 0 then
			Say("Xin lçi! §¹i hiÖp ch­a gia nhËp bang héi nµo c¶!",0);
			return 0;
	end
	local nDate = tonumber(tonumber(GetLocalDate("%y"))..tonumber(GetLocalDate("%m"))..tonumber(GetLocalDate("%d")));
	local nLibao = GetTask(TIAOZHANLING_TASK_DATE);
	local nOlddate = tonumber(GetByte(nLibao,1)..GetByte(nLibao,2)..GetByte(nLibao,3));
	local nCount = GetTask(TIAOZHANLING_TASK_COUNT);
	if ( nOlddate == nDate and nCount >= 300) then
			Say("Mçi ngµy giao n¹p tèi ®a 300 lÖnh bµi. H«m nay ng­¬i ®· giao 300 lÖnh bµi råi, ngµy mai h·y tiÕp tôc.",0)
			return 0;
	end
	if ( nOlddate ~= nDate ) then
		SetTask(TIAOZHANLING_TASK_DATE,SetByte(GetTask(TIAOZHANLING_TASK_DATE),1,tonumber(GetLocalDate("%y"))));
		SetTask(TIAOZHANLING_TASK_DATE,SetByte(GetTask(TIAOZHANLING_TASK_DATE),2,tonumber(GetLocalDate("%m"))));
		SetTask(TIAOZHANLING_TASK_DATE,SetByte(GetTask(TIAOZHANLING_TASK_DATE),3,tonumber(GetLocalDate("%d"))));
		SetTask(TIAOZHANLING_TASK_COUNT,0);
	end

	local szlgname = GetTongName();
	--****ÅÐ¶ÏÊÇ·ñ´´½¨ÁË¸ÃÉçÍÅ
	checkCreatLG(szlgname);
	
	--**ÅÐ¶ÏÊÇ·ñ¼ÓÈëÁË¸ÃÉçÍÅ
	checkJoinLG(szlgname);
	local szTongName, nTongID = GetTongName();
	local nsum = LG_GetMemberTask(TIAOZHANLING_LGTYPE,TIAOZHANLING_LGName,szTongName,LGTSK_TIAOZHANLING_COUNT)
	if nsum >= 2000000000 then   --ÉÏÏÞ´ï20ÒÚÔò²»ÄÜÔÙÌá½»
		Say("Tæng sè vâ l©m lÖnh ®· ®¹t giíi h¹n. Lóc kh¸c thö l¹i vËy.",0)
		return 0;
	end
	--**Ìá½»ÌôÕ½Áî
	GiveItemUI("Giao nép khiªu chiÕn lÖnh", "Khiªu chiÕn lÖnh cã thÓ ®æi 50000 ®iÓm kinh nghiÖm, dïng ®Ó b¸o danh c«ng thµnh chiÕn cho bang héi.", "sure_GiveTiaoZhanLing", "OnCancel");
end

function sure_GiveTiaoZhanLing(nCount)
	if nCount <= 0 then
		Say("ThËt ®¸ng tiÕc, ng­¬i ch­a giao vËt phÈm nhiÖm vô cho ta",2,"Giao l¹i vËt phÈm/GiveTiaoZhanLing","§Ó ta suy nghÜ l¹i/OnCancel");
		return 0;
	end
	for i = 1, nCount do
		local nItemidx = GetGiveItemUnit(i);
		local g, d, p = GetItemProp(nItemidx);
		if (g ~= nCityWar_Item_ID_G or d ~= nCityWar_Item_ID_D or p ~= nCityWar_Item_ID_P) then
			Say("Ta kh«ng nhËn nh÷ng thø kh¸c, chØ cÇn ®­a ta <color=yellow>Khiªu chiÕn lÖnh<color> lµ ®­îc råi.", 2,"Giao l¹i vËt phÈm/GiveTiaoZhanLing","§Ó ta suy nghÜ l¹i/OnCancel");
			return 0;
		end;
	end;
	local nDate = tonumber(tonumber(GetLocalDate("%y"))..tonumber(GetLocalDate("%m"))..tonumber(GetLocalDate("%d")));
	local nLibao = GetTask(TIAOZHANLING_TASK_DATE);
	local nOlddate = tonumber(GetByte(nLibao,1)..GetByte(nLibao,2)..GetByte(nLibao,3));
	local nCountall = GetTask(TIAOZHANLING_TASK_COUNT);
	if ( nOlddate == nDate and nCountall+nCount > 300) then
			Say(format("ThËt ®¸ng tiÕc, h«m nay ng­¬i ®· nép vµo %d khiªu chiÕn lÖnh, chØ cÇn nép %d lÖnh bµi n÷a lµ ®­îc råi.",nCountall,300-nCountall),0)
			return 0;
	end
	if ( nOlddate ~= nDate ) then
		SetTask(TIAOZHANLING_TASK_DATE,SetByte(GetTask(TIAOZHANLING_TASK_DATE),1,tonumber(GetLocalDate("%y"))));
		SetTask(TIAOZHANLING_TASK_DATE,SetByte(GetTask(TIAOZHANLING_TASK_DATE),2,tonumber(GetLocalDate("%m"))));
		SetTask(TIAOZHANLING_TASK_DATE,SetByte(GetTask(TIAOZHANLING_TASK_DATE),3,tonumber(GetLocalDate("%d"))));
		SetTask(TIAOZHANLING_TASK_COUNT,0);
	end
	local nCityId = getSigningUpCity(1);
	local szTongName, nTongID = GetTongName();
	--local szplayName = GetName()
	--local nlg = LG_GetLeagueObj(TIAOZHANLING_LGTYPE,TIAOZHANLING_LGName);
	--local nlid = LG_GetLeagueObjByRole(TIAOZHANLING_LGTYPE, szTongName);
	--local nCurCount = LG_GetMemberTask(TIAOZHANLING_LGTYPE, szTongName, szplayName, LGTSK_QINGTONGDING_COUNT);
	local nCurCount = LG_GetMemberTask(TIAOZHANLING_LGTYPE,TIAOZHANLING_LGName,szTongName,LGTSK_TIAOZHANLING_COUNT)
	--ConsumeEquiproomItem(nCount, nCityWar_Item_ID_G, nCityWar_Item_ID_D, nCityWar_Item_ID_P, -1);
	for i = 1, nCount do
		local nItemidx = GetGiveItemUnit(i);
		RemoveItemByIndex(nItemidx)
	end;
	SetTask(TIAOZHANLING_TASK_COUNT,nCountall+nCount);
	--LG_ApplyAppendMemberTask(LEAGUETYPE_CITYWAR_SIGN, cityid_to_lgname(nCityId), szTongName, LGTSK_CITYWAR_SIGNCOUNT, 1, "", "")
	
	LG_ApplyAppendMemberTask(TIAOZHANLING_LGTYPE,TIAOZHANLING_LGName, szTongName, LGTSK_TIAOZHANLING_COUNT, nCount, "", "");
	
	
	--print(TIAOZHANLING_LGTYPE,TIAOZHANLING_LGName, szTongName, LGTSK_TIAOZHANLING_COUNT, nCount, "", "")
	--Ôö¼Ó¾­Ñé,Ìá½»1¸öÔö¼Ó5Íò¾­Ñé
	nAddExp = nCount * 50000
	AddOwnExp(nAddExp)
	Msg2Player(format("B¹n ®· nép vµo %d khiªu chiÕn lÖnh, nhËn ®­îc %d ®iÓm kinh nghiÖm",nCount,nAddExp))
	WriteLog(format("[C«ng thµnh chiÕn_giao khiªu chiÕn lÖnh]Date:%s Account:%s Name:%s Tong:%s Count:%d Exp:%d",GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName(),szTongName,nCount,nAddExp))
end;

--²éÑ¯ÌôÕ½Áî
function ViewTiaoZhanLing()
		local szTongName, nTongID = GetTongName();
		if (nTongID == 0 or ( GetTongFigure() ~= TONG_MASTER and GetTongFigure() ~= TONG_ELDER)) then
			Say("ThËt ®¸ng tiÕc, chØ cã bang chñ vµ tr­ëng l·o míi cã thÓ xem th«ng tin sè l­îng Khiªu ChiÕn LÖnh.", 0);
			return 0
		end
		--local szlgname = GetTongName();
		--****ÅÐ¶ÏÊÇ·ñ´´½¨ÁË¸ÃÉçÍÅ
		checkCreatLG(szTongName);
	
		--**ÅÐ¶ÏÊÇ·ñ¼ÓÈëÁË¸ÃÉçÍÅ
		checkJoinLG(szTongName);
		--local nCityId = getSigningUpCity(1);
		--local szTongName, nTongID = GetTongName();
		--local nlg = LG_GetLeagueObj(TIAOZHANLING_LGTYPE, szTongName);
		--local szplayName = GetName()
		--local nlid = LG_GetLeagueObjByRole(TIAOZHANLING_LGTYPE, szTongName);
		--Msg2Player(nlid)
		--local nCurCount = LG_GetMemberTask(nlid, LGTSK_TIAOZHANLING_COUNT)
		local nCurCount = LG_GetMemberTask(TIAOZHANLING_LGTYPE,TIAOZHANLING_LGName,szTongName,LGTSK_TIAOZHANLING_COUNT)
		
		Say(format("QuÝ bang ®· nép vµo <color=yellow>%d<color> khiªu chiÕn lÖnh.",nCurCount),0)
end

--¹ØÓÚÁîÅÆµÄ´¦Àí start************************************************
function TokenCard()
	Say("Thµnh ChiÕn lÖnh bµi dµnh cho nh÷ng ng­êi muèn vµo chi viÖn cho bang héi c«ng thñ thµnh! Xin cho hái môc ®Ých cña nghÜa sÜ?", 4, "Mua Thµnh chiÕn lÖnh bµi/BuyCard", "Thö lÖnh bµi/CheckCard", "Tr¶ l¹i lÖnh bµi/ReturnCard", "Kh«ng lµm g× c¶ /OnCancel");
end;

function BuyCard()
	if (GetName() == GetTongMaster()) then
		TongName, result = GetTong()
		for i = 1, 7 do
			Tong1, Tong2 = GetCityWarBothSides(i);
			if (Tong1 == TongName) then
				SetTaskTemp(15, CardTab[i * 2 - 1]);
				str_format = format("Th× ra ®¹i hiÖp lµ ng­êi khiªu chiÕn thµnh %s, lîi h¹i qu¸, ë ®©y cã b¸n lÖnh bµi c«ng thµnh cã hiÖu lùc trong 5 ngµy dµnh liªn minh cña quÝ bang, mçi lÖnh bµi gi¸ %s l­îng.",GetCityAreaName(i),CardPrice);
				Say(str_format, 2, "Mua mét Ýt/DealBuyCard", "T¹m thêi kh«ng cÇn/OnCancel");
				return
			elseif (Tong2 == TongName) then
				SetTaskTemp(15, CardTab[i * 2]);
				str_format = format("Th× ra ®¹i hiÖp lµ th¸i thó thµnh %s, t¹i ®©y cã b¸n lÖnh bµi thñ thµnh cã hiÖu lùc 5 ngµy dµnh cho liªn minh cña quÝ bang, mçi lÖnh bµi gi¸ %s l­îng.",GetCityAreaName(i),CardPrice);
				Say(str_format, 2, "Mua mét Ýt/DealBuyCard", "T¹m thêi kh«ng cÇn/OnCancel");
				return
			end;
		end;
		Say("B¹n kh«ng cã quan hÖ g× víi c¸c bang ph¸i c«ng thñ thµnh! Kh«ng thÓ sö dông Thµnh chiÕn lÖnh bµi!", 0);
	else
		Say("ChØ cã bang chñ míi ®­îc mua Thµnh ChiÕn lÖnh bµi", 0);
	end;
end;

function DealBuyCard(CardID)
	AskClientForNumber("PayForCard", 1, 30, "B¹n cÇn bao nhiªu?");
end;

function PayForCard(count)
	CardItemID = GetTaskTemp(15);
	if (CardItemID > 0 and count > 0) then
		if (Pay(count * CardPrice) ~= 0) then
			for i = 1,count do
				AddEventItem(CardItemID);
			end;
			Say("Xin h·y gi÷ kü! LÖnh bµi nµy dïng ®Ó kiÓm chøng ®ång minh trªn chiÕn tr­êng! Xin chó ý thêi gian trªn lÖnh bµi, chØ cã hiÖu lùc 5 ngµy, nÕu qu¸ thêi gian sÏ kh«ng sö dông ®­îc,cã thÓ quay l¹i ®©y tr¶ l¹i vµ lÊy l¹i phÝ ", 0);
		end;
	end;
end;

function CheckCard()
	count = 0;
	CardItemID = 0;
	for i=1,14 do
		newcount = count + GetItemCountEx(CardTab[i])
		if (newcount > count) then
			CardItemID = CardTab[i];
			count = newcount;
		end;
	end;
	if (count == 0) then
		Say("B¹n kh«ng hÒ cã lÖnh bµi nµo trong ng­êi!", 0);
	elseif (count > 1) then
		Say("B¹n mang qu¸ nhiÒu Thµnh ChiÕn lÖnh bµi, kh«ng biÕt b¹n muèn kiÓm chøng c¸i nµo! Xin chØ mang mét lÖnh bµi th«i!", 0);
	elseif (CardItemID ~= 0) then
		life = GetItemLife(CardItemID);
		if (life < 0) then
			Say("T×nh tr¹ng tÊm lÖnh bµi nµy lµ.......", 0);
		elseif (life < 7200) then
			Say(format("Sè lÖnh bµi c«ng thµnh nµy ph¶i ®­îc ph¸t tr­íc %s ngµy, hiÖn vÉn cßn hiÖu lùc.",floor(life/1440)), 0)
		else
			Say(format("Sè lÖnh bµi c«ng thµnh nµy ph¶i ®­îc ph¸t tr­íc %s ngµy, hiÖn ®· qu¸ h¹n, kh«ng cßn hiÖu lùc sö dông.",floor(life/1440)), 0);
		end;
	end;
end;

function ReturnCard()
	count = 0;
	for i=1,14 do
		count = count + GetItemCountEx(CardTab[i]);
	end;
	if (count <= 0) then
		Say("B¹n kh«ng hÒ cã lÖnh bµi nµo trong ng­êi!", 0);
	else
		str_format = format("LÖnh bµi c«ng thµnh ®­îc thu l¹i víi gi¸ %s l­îng, ng­¬i ®ång ý tr¶ l¹i kh«ng?",count*ReturnCardPrice);
		Say(str_format, 2, "ta muèn tr¶ l¹i /DealReturnCard", "Kh«ng, ta chØ hái chót th«i/OnCancel");
	end;
end;

function DealReturnCard()
	money = 0;
	for i=1,14 do
		count = GetItemCountEx(CardTab[i]);
		if (count > 0) then
			money = money + count * ReturnCardPrice;
			for j=1,count do DelItemEx(CardTab[i]) end;
		end;
	end;
	Earn(money);
end;
--¹ØÓÚÁîÅÆµÄ´¦Àí end**************************************************

--AskDeal¹¥³ÇÕ½¸¨ÖúµÀ¾ß ×ªµ½citywar_global\\citywar_function.lua

--ÁË½â¹¥³ÇÕ½Çé¿ö start************************************************
function GameInfo()
Say("Muèn t×m hiÓu th«ng tin thµnh thÞ nµo?", 9, GetCityAreaName(1).."/CityInfo", GetCityAreaName(2).."/CityInfo", GetCityAreaName(3).."/CityInfo", GetCityAreaName(4).."/CityInfo", GetCityAreaName(5).."/CityInfo", GetCityAreaName(6).."/CityInfo", GetCityAreaName(7).."/CityInfo", "Trë vÒ/ArenaMain", "Kh«ng cÇn ®©u/OnCancel");
end;

--"Èü³Ì°²ÅÅ/ArenaInfo", 
--"±ÈÎä½á¹û/AllArenaInfo", 
function CityInfo(nSel)
	local nCityId =  nSel + 1;
	SetTaskTemp(245, nCityId);
	if (nCityId < 1 or nCityId > 7) then 
		return
	end;
	Say(format("Muèn t×m hiÓu th«ng tin g× vÒ c«ng thµnh chiÕn %s?",GetCityAreaName(nCityId)), 4, 
		"T×nh h×nh b¸o danh/RegisterInfo", 
		"C«ng thµnh chiÕn sù /CityWarInfo", 
		"Trë vÒ/GameInfo", 
		"Kh«ng cÇn ®©u/OnCancel");
end;

function RegisterInfo()
	local nCityId = GetTaskTemp(245);
	
	if (nCityId < 1 or nCityId > 7) then 
		return
	end;
	
	local nHour = tonumber(GetLocalDate("%H"));
	if (nHour<18 or nHour>=19) then
		Say("HiÖn t¹i kh«ng ph¶i lµ thêi gian b¸o danh c«ng thµnh chiÕn.", 2, "Trë vÒ/GameInfo", "Kh«ng cÇn ®©u/OnCancel");
		return 0;
	end;
	if (nCityId ~= getSigningUpCity(1) or getSignUpState(nCityId) ~= 1) then
		Say(format("HiÖn t¹i c«ng thµnh chiÕn <%s> kh«ng ë giai ®o¹n b¸o danh.",GetCityAreaName(nCityId)), 2, "Trë vÒ/GameInfo", "Kh«ng cÇn ®©u/OnCancel");
		return 0;
	end;
	
	local szElector = getCityWarElector(cityid_to_lgname(nCityId))--"<ÔÝÎÞ>"
	if (szElector == "" or szElector == nil) then
		szElector = "<T¹m thêi kh«ng>";
	end;
Say(format("C«ng thµnh chiÕn <%s> ®ang ®­îc chuÈn bÞ, bang héi thi ®ua lÖnh bµi xÕp h¹ng thø nhÊt lµ : %s<color=red><enter>NÕu cã bang nµo cã sè l­îng lÖnh bµi b»ng víi bang xÕp thø 1, th× hÖ thèng sÏ ngÉu nhiªn chän ra bang c«ng thµnh cho ngµy mai.<color>",GetCityAreaName(nCityId),szElector), 2, "Trë vÒ/GameInfo", "Kh«ng cÇn ®©u/OnCancel");
end;


function getCityWarElector(szLeagueName)
	local leagueObj = LG_GetLeagueObj(LEAGUETYPE_CITYWAR_FIRST, szLeagueName)

	if (leagueObj == 0) then
		return 
	end;
	local nMem = LG_GetMemberCount(leagueObj);
	if (nMem < 1) then
		return
	end;
	local szMem = "";
	local tbMem = {};
	for i = 0, nMem - 1 do
		szMem = LG_GetMemberInfo(leagueObj, i);
		ncount = LG_GetMemberTask(LEAGUETYPE_CITYWAR_SIGN, szLeagueName, szMem, LGTSK_QINGTONGDING_COUNT);
		if (getn(tbMem) == 0) then
			tbMem[1] = {szMem, ncount};
		else
			if (ncount == tbMem[1][2]) then
				tbMem[getn(tbMem) + 1] = {szMem, ncount};
			elseif (ncount > tbMem[1][2]) then
				tbMem = {};
				tbMem[getn(tbMem) + 1] = {szMem, ncount};
			end;
		end;
	end;
	--local szMem = LG_GetMemberInfo(leagueObj, 0)
	return tbMem[random(getn(tbMem))][1];
	--return LG_GetMemberInfo(leagueObj, 0)
end;

--Èü³Ì°²ÅÅ-(·ÏÆú2006-11-22)
function ArenaInfo()
	nCityId = GetTaskTemp(245);
	
	if (nCityId < 1 or nCityId > 7) then 
		return
	end;
	Say(GetArenaSchedule(nCityId), 0);
end;

function AllArenaInfo()
	nCityId = GetTaskTemp(245);
	
	if (nCityId < 1 or nCityId > 7) then 
		return
	end;
	--Say(GetArenaInfoByCity(nCityId), 0);
end;

function CityWarInfo()
	local nCityId = GetTaskTemp(245);
	
	if (nCityId < 1 or nCityId > 7) then 
		return
	end;
	local str_format = format("C«ng thµnh chiÕn <%s> ngµy mai: ",GetCityAreaName(nCityId));
	local str1, str2 = GetCityWarBothSides(nCityId);
	if (str1 ~= "" and str2 ~= "" ) then
		if (nCityId == getSigningUpCity(2)) then
			str_format = format("C«ng thµnh chiÕn <%s> h«m nay: ",GetCityAreaName(nCityId));
			if (HaveBeginWar(nCityId) == 1) then 
				str_format = format("Tr­íc m¾t <%s> ®ang ë giai ®o¹n c«ng thµnh chiÕn: ",GetCityAreaName(nCityId));
			end;
		end;
		str_format = format("Phe thñ %s lµ %s, phe c«ng lµ %s!",str_format,str2,str1);
		Say(str_format , 2, "Trë vÒ/GameInfo", "Kh«ng cÇn ®©u/OnCancel");
	else
		Say(format("Tr­íc m¾t %s ch­a b­íc vµo giai ®o¹n c«ng thµnh chiÕn!",GetCityAreaName(nCityId)) , 2, "Trë vÒ/GameInfo", "Kh«ng cÇn ®©u/OnCancel");
	end;
end;


--ÁË½â¹¥³ÇÕ½Çé¿ö end**************************************************

--ÁìÈ¡¹¥³ÇÐÅÎï start**************************************************
	function checkIsTakeQingtongDing(szTongName, nTongID, nCityId)
		if (nTongID == 0 or GetTongMaster()~= GetName()) then
			Say("ChØ cã bang chñ bang b¸o danh c«ng thµnh vµ bang thÊt b¹i trong cuéc thi thè lÖnh bµi míi cã thÓ nhËn l¹i tÝn vËt.", 0);
			return 0;
		end;
		if (nCityId < 1 or nCityId > 7) then
			return 0;
		end;
		
		local nHour = tonumber(GetLocalDate("%H"));
		if (nHour < 19) then
			Say("Thêi gian nhËn l¹i tÝn vËt c«ng thµnh chiÕn ®· hÕt, trong kho¶ng thêi gian tõ 19h00 ®Õn 24h00 mçi ngµy, bang héi tranh ®ua lÖnh bµi thÊt b¹i cã thÓ ®Õn chç ta ®Ó nhËn l¹i khiªu chiÕn lÖnh.", 0)
			return 0;
		end;
		
		if (getSignUpState(nCityId) == 1) then
			Say(format("B¸o danh tham gia tranh ®ua lÖnh bµi thµnh %s cho ngµy mai vÉn ch­a kÕt thóc, h·y tiÕp tôc tham gia.",GetCityAreaName(nCityId)), 0);
			return 0;
		end;
		
		local szChallenger = GetCityWarBothSides(nCityId);
		if (szChallenger == szTongName) then
			Say(format("QuÝ bang ®· trë thµnh bang c«ng thµnh %s vµo ngµy mai, tÝn vËt c«ng thµnh ta ®· giao l¹i cho th¸i thó råi.",GetCityAreaName(nCityId)), 0);
			return 0;
		end;
		
		local szChallenger = GetCityOwner(nCityId);
		if (szChallenger == szTongName) then
			Say(format("Ng­¬i ®· lµ th¸i thó thµnh %s, kh«ng cÇn ph¶i nhËn tÝn vËt c«ng thµnh n÷a.",GetCityAreaName(nCityId)), 0);
			return 0;
		end;
		
		local nlid = LG_GetLeagueObjByRole(LEAGUETYPE_CITYWAR_SIGN, szTongName);
		if (FALSE(nlid)) then
			Say("Ch­a b¸o danh tham gia c«ng thµnh chiÕn ngµy mai, ë ®©y kh«ng cã tÝn vËt cña ng­¬i.", 0);
			return 0;
		end;
		return 1;
	end;
	
	function getSignUpState(nCityId)
		return LG_GetLeagueTask(LEAGUETYPE_CITYWAR_SIGN, cityid_to_lgname(nCityId), 1);
	end;
	
function TakeQingtongDing()
	local szTongName, nTongID = GetTongName();
	local nCityId = getSigningUpCity(1);
	if (checkIsTakeQingtongDing(szTongName, nTongID, nCityId) ~= 1) then
		return 0
	end;
	local ncount = LG_GetMemberTask(LEAGUETYPE_CITYWAR_SIGN, cityid_to_lgname(nCityId), szTongName, LGTSK_QINGTONGDING_COUNT);
	
	if (ncount < 1) then
		Say("TÝn vËt b¸o danh c«ng thµnh ta ®· tr¶ l¹i hÕt cho ng­¬i råi.", 0);
	else
		Say(format("Ng­¬i cã %s khiªu chiÕn lÖnh, h·y s¾p xÕp l¹i hµnh trang tr­íc khi nhËn l¹i lÖnh bµi.",ncount), 3, "Ta muèn nhËn l·nh/#sure_takeQingtongDing("..ncount..")", "Trë vÒ/ArenaMain", "L¸t n÷a quay l¹i /OnCancel");
	end;
end;

function sure_takeQingtongDing(ncount)
	local szTongName, nTongID = GetTongName();
	local nCityId = getSigningUpCity(1);
	if (checkIsTakeQingtongDing(szTongName, nTongID, nCityId) == 1) then
		local nFree = CalcFreeItemCellCount();
		if (nFree > 6) then
			local szMsg = format("§©y lµ <color=yellow>%s<color> khiªu chiÕn lÖnh cña ng­¬i.",ncount);
			if (nFree < ncount) then
				szMsg = format("Ng­¬i cã <color=yellow>%s<color> khiªu chiÕn lÖnh, v× hµnh trang kh«ng ®ñ, ta tr¶ l¹i tr­íc %s c¸i. VÉn cßn <color=yellow>%s<color> c¸i ch­a nhËn, h·y nhËn tr­íc 24h00 ngµy h«m nay!",ncount,nFree,(ncount - nFree));
				ncount = nFree;
			end;
			for i =1, ncount do
				AddItem(nCityWar_Item_ID_G,nCityWar_Item_ID_D,nCityWar_Item_ID_P,1,1,1);--qingtongding
			end;
			LG_ApplyAppendMemberTask(LEAGUETYPE_CITYWAR_SIGN, cityid_to_lgname(nCityId), szTongName, LGTSK_QINGTONGDING_COUNT, -nFree);
			WriteLog(format("[Tranh ®ua c«ng thµnh chiÕn]%s Name:%s Account:%s Tong:%s Thµnh thÞ: %s NhËn l¹i khiªu chiÕn lÖnh %s",date(),GetName(),GetAccount(),szTongName,cityid_to_lgname(nCityId),ncount));
			Say(szMsg, 0);
		else
			Say("Hµnh trang kh«ng ®ñ chç trèng. Chó ý lµ tr­íc 24h00 ph¶i ®Õn nhËn l¹i tÝn vËt, nÕu kh«ng sÏ kh«ng thÓ nhËn l¹i n÷a.", 0);
		end;
	end;
end;

--ÁìÈ¡¹¥³ÇÐÅÎï end****************************************************

--±¨Ãû¹¥³ÇÕ½ start****************************************************
function SignUpCityWar()
	local nCityId = getSigningUpCity(1);
	
	local szTongName, nTongID = GetTongName();
	
	if (checkSignUpCityWar(szTongName, nTongID, nCityId) ~= 1) then
		return 0;
	end;
	
	local szMsg = format("<dec>HiÖn t¹i ®ang tiÕn hµnh b¸o danh thµnh %s.",GetCityAreaName(nCityId));
	local szElector = getCityWarElector(cityid_to_lgname(nCityId))--"<ÔÝÎÞ>"
	
	if (szElector == "" or szElector == nil) then
		szElector = "<T¹m thêi kh«ng>";
	end;

	local nlid = LG_GetLeagueObjByRole(LEAGUETYPE_CITYWAR_SIGN, szTongName);
	
	if (FALSE(nlid)) then
		szMsg = szMsg.."ChØ cÇn cã 'Khiªu chiÕn lÖnh' th× cã thÓ tham gia tranh ®ua. Qui t¾c tranh ®ua: Bang héi ch­a chiÕm thµnh cÊp 18 trë lªn cã thÓ sö dông 'Khiªu chiÕn lÖnh' ®Ó tham gia tranh ®ua. Thêi gian tranh ®ua lµ 18h00 ®Õn 19h00 mçi ngµy. Tr­íc 19h00, bang héi nµo ®Æt vµo sè l­îng khiªu chiÕn lÖnh nhiÒu nhÊt sÏ nhËn ®­îc quyÒn c«ng thµnh chiÕn ngµy mai.<color=red><enter>NÕu cã bang héi cã cïng sè lÖnh bµi víi bang xÕp thø 1 th× hÖ thèng sÏ ngÉu nhiªn chän ra mét bang c«ng thµnh cho ngµy mai.<color><enter>Bang héi hiÖn t¹i xÕp thø 1 lµ: "..szElector
	else
		
		local nCount = LG_GetMemberTask(LEAGUETYPE_CITYWAR_SIGN, cityid_to_lgname(nCityId), szTongName, LGTSK_QINGTONGDING_COUNT);
		
		--print(LEAGUETYPE_CITYWAR_SIGN, cityid_to_lgname(nCityId), szTongName, LGTSK_QINGTONGDING_COUNT)
		szMsg = format("%sQui t¾c tranh ®ua : Bang héi ch­a chiÕm thµnh cÊp 18 trë lªn cã thÓ sö dông 'Khiªu chiÕn lÖnh' ®Ó tham gia tranh ®ua. Thêi gian tranh ®ua lµ 18h00 ®Õn 19h00 mçi ngµy. Tr­íc 19h00, bang héi nµo ®Æt vµo sè l­îng khiªu chiÕn lÖnh nhiÒu nhÊt sÏ nhËn ®­îc quyÒn c«ng thµnh chiÕn ngµy mai.<color=red><enter>NÕu cã bang héi cã cïng sè lÖnh bµi víi bang xÕp thø 1 th× hÖ thèng sÏ ngÉu nhiªn chän ra mét bang c«ng thµnh cho ngµy mai.<color><enter>Bang héi hiÖn t¹i xÕp thø 1 lµ: %s<enter>Sè l­îng khiªu chiÕn lÖnh tranh ®ua %s cña quÝ bang lµ: %s",szMsg,szElector,szTongName,nCount)
	end;
	TaskSayList(szMsg, "Ta muèn tranh ®ua lÖnh bµi/want_signupcitywar", "Trë vÒ/ArenaMain", "§Ó ta suy nghÜ l¹i/OnCancel");
end;

function want_signupcitywar()
	--local nCityId = getSigningUpCity(1);
	local szTongName, nTongID = GetTongName();
	--local nlid = LG_GetLeagueObjByRole(LEAGUETYPE_CITYWAR_SIGN, szTongName);
	
	
	local nCurCount = LG_GetMemberTask(TIAOZHANLING_LGTYPE,TIAOZHANLING_LGName,szTongName,LGTSK_TIAOZHANLING_COUNT)
	if nCurCount <= 0 then
		Say("QuÝ bang kh«ng cã khiªu chiÕn lÖnh, kh«ng thÓ giao nép, h·y thu thËp khiªu chiÕn lÖnh råi h·y ®Õn t×m ta.",0)
		return 0
	end
	if nCurCount > 1000000 then
		nCurCount = 1000000
	end
	AskClientForNumber("sure_signupcitywar", 0,nCurCount,"Giao nép khiªu chiÕn lÖnh")
	--if (FALSE(nlid)) then
		--if (GetCash() >= 10000000) then
			--GiveItemUI("¹¥³ÇÕ½ÐÅÎï", "Çë½«¹¥³ÇÕ½ÐÅÎï¡ª¡ªÌôÕ½Áî·Å½øÈ¥°É¡£", "sure_signupcitywar", "OnCancel");
		--else
			--Say("µÚÒ»´Î±¨Ãû¹¥³ÇÕ½ÐèÒª½ÏÄÉ<color=yellow>1000WÁ½<color>Òø×Ó£¬ÄãÉíÉÏÃ»ÓÐ´øÕâÃ´¶àÇ®¡£ÄãÏÈ×¼±¸ºÃ±¨Ãû·ÑÔÙÀ´°É¡£", 0);
		--end;
	--else
		--local nNum = LG_GetMemberTask(LEAGUETYPE_CITYWAR_SIGN, cityid_to_lgname(nCityId), szTongName,LGTSK_CITYWAR_SIGNCOUNT);
		--if (nNum >= 3) then
			--Say("ÄúµÄ¾ºÍ¶´ÎÊýÒÑ¾­´ïµ½<color=yellow>3´Î<color>£¬ÄúÏÖÔÚ²»ÄÜ¼ÌÐøÍ¶×¢£¬ÇëÄúµÈ´ý¾ºÍ¶½á¹ûµÄ¹«²¼¡£", 0);
		--else
			--GiveItemUI("¹¥³ÇÕ½ÐÅÎï", "Ã¿¸öÌôÕ½Áî¿ÉÒÔ»»È¡5Íòµã¾­Ñé£¬ÌôÕ½Áî¿ÉÓÃÀ´±¨Ãû°ï»á¹¥³ÇÕ½¡£", "sure_signupcitywar", "OnCancel");
		--end;
	--end;
end;

function sure_signupcitywar(nCount)
	--Msg2Player(nCount)
	
	local nCityId = getSigningUpCity(1);--GetArenaTargetCity()
	if not (tonumber(GetLocalDate("%H"))>= 18 and tonumber(GetLocalDate("%H")) < 19 and getSignUpState(nCityId) == 1) then
		Talk(1, "", "HiÖn t¹i kh«ng ph¶i lµ thêi gian b¸o danh c«ng thµnh chiÕn.")
		return 1
	end
	
	
	
	
	local szTongName, nTongID = GetTongName();
	local nTongCurCount = LG_GetMemberTask(TIAOZHANLING_LGTYPE,TIAOZHANLING_LGName,szTongName,LGTSK_TIAOZHANLING_COUNT)
	if nCount > nTongCurCount or nCount > 1000000 then
		Say("Khiªu chiÕn lÖnh kh«ng ®ñ, kh«ng thÓ giao nép, xin h·y thu thËp tiÕp råi quay l¹i.",0)
		return 1
	end
	local nCityId = getSigningUpCity(1);
	local nlg = LG_GetLeagueObj(LEAGUETYPE_CITYWAR_SIGN, cityid_to_lgname(nCityId));
	local nlid = LG_GetLeagueObjByRole(LEAGUETYPE_CITYWAR_SIGN, szTongName);
	if (FALSE(nlid)) then
			local nMemberID = LGM_CreateMemberObj() -- Éú³ÉÉçÍÅ³ÉÔ±Êý¾Ý¶ÔÏó(·µ»Ø¶ÔÏóID)
			--ÉèÖÃÉçÍÅ³ÉÔ±µÄÐÅÏ¢(½ÇÉ«Ãû¡¢Ö°Î»¡¢ÉçÍÅÀàÐÍ¡¢ÉçÍÅÃû³Æ)
			LGM_SetMemberInfo(nMemberID, szTongName, 0, LEAGUETYPE_CITYWAR_SIGN, cityid_to_lgname(nCityId));
			LG_AddMemberToObj(nlg, nMemberID);
			local ret = LGM_ApplyAddMember(nMemberID, "", "")
			LGM_FreeMemberObj(nMemberID)
	end;

	--LG_ApplyAppendMemberTask(LEAGUETYPE_CITYWAR_SIGN, cityid_to_lgname(nCityId), szTongName, LGTSK_CITYWAR_SIGNCOUNT, 1, "", "")
	
	local nCurCount = LG_GetMemberTask(LEAGUETYPE_CITYWAR_SIGN, cityid_to_lgname(nCityId), szTongName, LGTSK_QINGTONGDING_COUNT);
	
	--LG_ApplyAppendMemberTask(LEAGUETYPE_CITYWAR_SIGN, cityid_to_lgname(nCityId), szTongName, LGTSK_QINGTONGDING_COUNT, nCount, "", "");
	--print(LEAGUETYPE_CITYWAR_SIGN, cityid_to_lgname(nCityId), szTongName, LGTSK_QINGTONGDING_COUNT, nCount)
	citywar_tbLadder:AddOneInGameServer(nTongID, cityid_to_lgname(nCityId), szTongName, nCount)
	
	
	LG_ApplyAppendMemberTask(TIAOZHANLING_LGTYPE,TIAOZHANLING_LGName, szTongName, LGTSK_TIAOZHANLING_COUNT, -nCount, "", "");
	
	WriteLog(format("[Tranh ®ua c«ng thµnh chiÕn]%s Name:%s Account:%s TongName:%s Thµnh thÞ: %s Sè l­îng tranh ®ua c«ng thµnh: %s",date(),GetName(),GetAccount(),szTongName,cityid_to_lgname(nCityId),(nCount + nCurCount)));
	
	local szFirstTong = checkFirstSignUpChallenger(cityid_to_lgname(nCityId), szTongName, nCount + nCurCount);
	if (szFirstTong == szTongName) then
		Say(format("Sè l­îng khiªu chiÕn lÖnh bang %s hiÖn t¹i lµ: <color=yellow>%s<color> c¸i, t¹m thêi xÕp thø 1, tuy nhiªn, h·y lu«n theo dâi t×nh h×nh biÕn ®éng.",szTongName,(nCount + nCurCount)), 0);
	else
		Say(format("Sè l­îng khiªu chiÕn lÖnh bang %s hiÖn t¹i lµ: <color=yellow>%s<color> c¸i. Bang héi xÕp thø 1 lµ %s, quÝ bang h·y tiÕp tôc nç lùc.",szTongName,(nCount + nCurCount),szFirstTong), 0);
	end;
end;

function checkSignUpCityWar(szTongName, nTongID, nCityId)
	local nHour = tonumber(GetLocalDate("%H"));
	if (nTongID == 0 or GetTongMaster() ~= GetName()) then
		Say("Ng­¬i kh«ng ph¶i lµ bang chñ. Trong kho¶ng thêi gian tõ 18h00 ®Õn 19h00, bang chñ bang héi ch­a chiÕm thµnh cÊp 18 trë lªn cã thÓ ®Õn b¸o danh tham gia c«ng thµnh chiÕn cho ngµy h«m sau.", 0);
	elseif (nHour < 18 or nHour >= 19) then
		Say("HiÖn t¹i kh«ng ph¶i lµ thêi gian b¸o danh c«ng thµnh chiÕn. Mçi ngµy tõ 18h00 ®Õn 19h00, bang héi ch­a chiÕm thµnh cÊp 18 trë lªn cã thÓ ®Õn ®©y b¸o danh tham gia c«ng thµnh chiÕn cho ngµy h«m sau.", 0);
	elseif (TONG_GetExpLevel(nTongID) < 18) then
		Say("§ßi hái ®¼ng cÊp bang héi ®¹t cÊp 18 trë lªn míi cã thÓ b¸o danh c«ng thµnh chiÕn cho ngµy h«m sau.", 0);
	elseif (checkCityOwner(szTongName) ~= 0) then
		Say("Ng­¬i ®· lµ chñ thµnh, kh«ng cÇn ph¶i b¸o danh c«ng thµnh.", 0);
	elseif (checkCItyChallenger(szTongName) ~= 0) then
			Say(format("Ng­¬i ®· lµ phe khiªu chiÕn %s, kh«ng thÓ tranh ®ua lÖnh bµi trong ngµy h«m nay.",GetCityAreaName(checkCItyChallenger(szTongName))), 0);
	elseif (getSignUpState(nCityId) ~= 1) then
		Say("HiÖn t¹i b¸o danh c«ng thµnh vÉn ch­a b¾t ®Çu, h·y chuÈn bÞ tinh thÇn s½n sµng", 0);
	else
		return 1;
	end;
	return 0;
end;

function checkCityOwner(szTongName)
	for i=1, 7 do
		if (GetCityOwner(i) == szTongName) then
			return i;
		end;
	end;
	return 0;
end;

function checkCItyChallenger(szTongName)
	for i=1, 7 do
		if (GetCityWarBothSides(i) == szTongName) then
			return i;
		end;
	end;
	return 0;
end;

function checkFirstSignUpChallenger(szLeagueName, szTongName, nCurCount)
	local szFirstTong = getCityWarElector(szLeagueName)
	local nlid = LG_GetLeagueObj(LEAGUETYPE_CITYWAR_FIRST, szLeagueName)
	
	if (FALSE(szFirstTong)) then
		local nMemberID = LGM_CreateMemberObj() -- Éú³ÉÉçÍÅ³ÉÔ±Êý¾Ý¶ÔÏó(·µ»Ø¶ÔÏóID)
		--ÉèÖÃÉçÍÅ³ÉÔ±µÄÐÅÏ¢(½ÇÉ«Ãû¡¢Ö°Î»¡¢ÉçÍÅÀàÐÍ¡¢ÉçÍÅÃû³Æ)
		LGM_SetMemberInfo(nMemberID, szTongName, 0, LEAGUETYPE_CITYWAR_FIRST, szLeagueName);
		LG_AddMemberToObj(nlid, nMemberID);
		local ret = LGM_ApplyAddMember(nMemberID, "", "") ;
		
		LGM_FreeMemberObj(nMemberID);
		if (ret == 1) then
			LG_ApplyAppendMemberTask(LEAGUETYPE_CITYWAR_FIRST, szLeagueName, szTongName, LGTSK_QINGTONGDING_COUNT, nCurCount);
		end;
		return szTongName;
	end;
	
	nlid = LG_GetLeagueObj(LEAGUETYPE_CITYWAR_SIGN, szLeagueName);
	local nCount = LG_GetMemberCount(nlid);
	local szTemTong = szFirstTong;
	for i = 0, nCount - 1 do
		local szMem = LG_GetMemberInfo(nlid, i);
		if (szMem == szFirstTong) then
			local nMemCount = LG_GetMemberTask(LEAGUETYPE_CITYWAR_SIGN, szLeagueName, szMem, LGTSK_QINGTONGDING_COUNT);
			
			if (nMemCount <= nCurCount) then
				szTemTong = szTongName;
				break
			end;
		end;
	end;
	
	nlid = LG_GetLeagueObj(LEAGUETYPE_CITYWAR_FIRST, szLeagueName);
	if (szTemTong ~= szFirstTong) then
		local nMemberID = LGM_CreateMemberObj() -- Éú³ÉÉçÍÅ³ÉÔ±Êý¾Ý¶ÔÏó(·µ»Ø¶ÔÏóID)
		--ÉèÖÃÉçÍÅ³ÉÔ±µÄÐÅÏ¢(½ÇÉ«Ãû¡¢Ö°Î»¡¢ÉçÍÅÀàÐÍ¡¢ÉçÍÅÃû³Æ)
		LGM_SetMemberInfo(nMemberID, szTemTong, 0, LEAGUETYPE_CITYWAR_FIRST, szLeagueName);
		LG_AddMemberToObj(nlid, nMemberID);
		local ret = LGM_ApplyAddMember(nMemberID, "", "") ;
		LGM_FreeMemberObj(nMemberID);
		--LG_ApplyDoScript(LEAGUETYPE_CITYWAR_FIRST, szLeagueName, szFirstTong, "\\script\\event\\citywar.lua", "citywar_removemem", szLeagueName.." "..szFirstTong);
		--LGM_ApplyRemoveMember(LEAGUETYPE_CITYWAR_FIRST, szLeagueName, szFirstTong);
	end;
	return getCityWarElector(szLeagueName);
end;
--±¨Ãû¹¥³ÇÕ½ end******************************************************

