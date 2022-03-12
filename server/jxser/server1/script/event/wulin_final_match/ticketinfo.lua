IncludeLib("ITEM")
Include("\\script\\tong\\tong_header.lua");

MAX_FACTION_TICKET = 5
--0ÉÙÁÖ£¬1ÌìÍõ£¬2ÌÆÃÅ£¬3Îå¶¾£¬4¶ëáÒ£¬5´äÑÌ£¬6Ø¤°ï£¬7ÌìÈÌ£¬8Îäµ±£¬9À¥ÂØ£¬-1°×Ãû
TAB_TICKETINFO = 
{
{"Thi ®Êu m«n ph¸i ThiÕu L©m", MAX_FACTION_TICKET, "Danh s¸ch m«n ph¸i thi ®Êu", 1, "wl_get", {6,1,407,1}, 11},
{"Thi ®Êu m«n ph¸i Thiªn V­¬ng", MAX_FACTION_TICKET, "Danh s¸ch m«n ph¸i thi ®Êu", 1, "wl_get", {6,1,408,1}, 12},
{"Thi ®Êu m«n ph¸i §­êng M«n", MAX_FACTION_TICKET, "Danh s¸ch m«n ph¸i thi ®Êu", 1, "wl_get", {6,1,409,1}, 13},
{"Thi ®Êu m«n ph¸i Ngò §éc", MAX_FACTION_TICKET, "Danh s¸ch m«n ph¸i thi ®Êu", 1, "wl_get", {6,1,410,1}, 14},
{"Thi ®Êu m«n ph¸i Nga My", MAX_FACTION_TICKET, "Danh s¸ch m«n ph¸i thi ®Êu", 1, "wl_get", {6,1,411,1}, 15},
{"Thi ®Êu m«n ph¸i Thóy Yªn", MAX_FACTION_TICKET, "Danh s¸ch m«n ph¸i thi ®Êu", 1, "wl_get", {6,1,412,1}, 16},
{"Thi ®Êu m«n ph¸i C¸i Bang", MAX_FACTION_TICKET, "Danh s¸ch m«n ph¸i thi ®Êu", 1, "wl_get", {6,1,413,1}, 17},
{"Thi ®Êu m«n ph¸i Thiªn NhÉn", MAX_FACTION_TICKET, "Danh s¸ch m«n ph¸i thi ®Êu", 1, "wl_get", {6,1,414,1}, 18},
{"Thi ®Êu m«n ph¸i Vâ §ang", MAX_FACTION_TICKET, "Danh s¸ch m«n ph¸i thi ®Êu", 1, "wl_get", {6,1,415,1}, 19},
{"Thi ®Êu m«n ph¸i C«n L«n", MAX_FACTION_TICKET, "Danh s¸ch m«n ph¸i thi ®Êu", 1, "wl_get", {6,1,416,1}, 20},

{"Song ®Êu", 5, "Song ®Êu", 2, "wl_getdoubleticket", {6,1,417,1}, 21},
{"Ngò hµnh ®Êu", 3, "Ngò hµnh ®Êu", 10, "wl_getfiveticket",{6,1,418,1}, 22},
{"ThËp toµn ®Êu", 2, "ThËp toµn ®Êu", 20, "wl_gettenticket",{6,1,419,1}, 23},
{"ThËp lôc ®Êu", 2, "ThËp lôc ®Êu", 32, "wl_getsixteenticket",{6,1,420,1}, 24},
};



function FALSE(nValue)
	if (nValue == 0 or nValue == nil) then
		return 1
	else
		return nil
	end
end

--¼ÇÂ¼µ±Ç°Íæ¼Ò£¨Áì¶Ó£©Ä¿Ç°ÒÑ¾­ÁìÁË¸÷Àà±ÈÈüµÄ¶àÉÙÕÅÆ±ÁË£¿
TK_WL_TICKET_FACTION1 = 1603;
TK_WL_TICKET_FIVE = TK_WL_TICKET_FACTION1 + 10;
TK_WL_TICKET_TEN = TK_WL_TICKET_FIVE + 1;
TK_WL_TICKET_SIXTEEN = TK_WL_TICKET_TEN + 1;

MAX_TICKETCOUNT = 1
function ticket()
	Say("   Bæn quan cã thÓ gióp ®­îc g× ®©y?", 2, "Ta muèn nhËn vĞ vµo ®Êu tr­êng/wl_gettickets", "Kh«ng cÇn/OnCancel")
end

function wl_gettickets()
	if (wl_checkzoneleader() == 0) then
		return
	end
	local tickettab ={};
	tickettab[1] = "VĞ vµo ®Êu tr­êng m«n ph¸i/wl_getfactionsticket";
	for i = 1, getn(TAB_TICKETINFO) - 10  do 
		tickettab[ getn( tickettab ) + 1 ] = TAB_TICKETINFO[10 + i  ][1].."/"..TAB_TICKETINFO[10 + i ][5]
	end
	
	tickettab[getn(tickettab)+ 1] = "Ta suy nghÜ mét chót/OnCancel"--"»ñÈ¡±ÈÈüÈë³¡È¯ÓĞÊ²Ã´ÓÃ´¦/wl_tickethelp";
	Say("Ng­¬i cÇn vĞ vµo lo¹i h×nh thi ®Êu nµo?", getn(tickettab), tickettab);
end

--»ñÈ¡Ê®¸öÃÅÅÉµÄÄ³¸öÃÅÆ±×ÜÈë¿Úº¯Êı
function wl_getfactionsticket()
	local tabticket={};
	for i = 1, 10 do 
		tabticket[i] = TAB_TICKETINFO[i][1].."/#wl_getticket("..i..")"
	end
	tabticket[getn(tabticket)+ 1] = "Cho ta suy nghÜ chót!/OnCancel";
	Say("   Ng­¬i muèn nhËn ®­îc vĞ vµo thi ®Êu cña m«n ph¸i nµo?", getn(tabticket), tabticket);
end

--»ñÈ¡Ä³¸öÃÅÅÉµÄÃÅÆ±
function wl_getticket( matchtype)
	if (wl_checkzoneleader(matchtype) == 0) then
		return
	end

	local zoneid = wl_zonename2zoneid(GetTong())
	
	local lid = 0;
	if (matchtype <= 10) then
		lid = LG_GetLeagueObj(matchtype + 10, GetTong().."Danh s¸ch m«n ph¸i thi ®Êu"..matchtype.."_"..	TAB_TICKETINFO[1][2])
	else
		lid = LG_GetLeagueObj(matchtype + 10, GetTong()..TAB_TICKETINFO[matchtype][3]..TAB_TICKETINFO[matchtype][2])
	end
	if (lid > 0) then
		Say("Xin lçi! Sè ng­êi tham gia môc thi ®Êu nµy ®· ®ñ, kh«ng thÓ nhËn t­ c¸ch tham gia n÷a! Chi tiÕt cã thÓ xem danh s¸ch sè ng­êi ®· b¸o danh cña khu vùc.", 0);
		return
	end
	
	local usedcount = GetTask(TK_WL_TICKET_FACTION1 + matchtype - 1)
	if (usedcount >= TAB_TICKETINFO[matchtype][2]) then
		Say("Xin lçi!".."Sè l­îng phiÕu t­ c¸ch tham gia lín nhÊt cña môc nµy lµ "..TAB_TICKETINFO[matchtype][2]..", b¹n ®· nhËn xong phiÕu t­ c¸ch tham gia môc thi ®Êu nµy! Kh«ng thÓ nhËn n÷a!",0)
		return
	end
--	local usedcount = GetTask(TK_WL_TICKET_FACTION1 + matchtype - 1)
--	if (usedcount >= MAX_TICKETCOUNT) then
--		Say("ÎäÁÖ´ó»á¹ÙÔ±£º¶Ô²»Æğ£¡¸ÃÏîÈüÄãÄÜÁìÈ¡µÄ×î´ó×Ê¸ñÆ±ÊıÁ¿ÊÇ"..MAX_TICKETCOUNT..",ÄúÒÑ¾­ÁìÍê¸ÃÏîÈüµÄ×Ê¸ñÆ±ÁË£¬²»ÄÜÔÙÁìÁË¡£",0)
--		return
--	end
	
	local tabticketinfo = {};
	for i = 1, TAB_TICKETINFO[matchtype][2] - usedcount do 
		tabticketinfo[i] = "Ta muèn l·nh tr­íc"..i.."Më /#wl_suregetticket("..matchtype..","..i..")"
	end
	tabticketinfo[getn(tabticketinfo)+ 1] = "Ta suy nghÜ mét chót/OnCancel"
--	tabticketinfo[1]= "ÎÒÒªÏÈÁì"..MAX_TICKETCOUNT.."ÕÅ/#wl_suregetticket("..matchtype..","..MAX_TICKETCOUNT..")"
--	tabticketinfo[getn(tabticketinfo)+1] = "ÎÒÏÂ´ÎÔÙÁì°É/OnCancel";
	Say("Ng­¬i hiÖn cßn"..(TAB_TICKETINFO[matchtype][2] - usedcount).."Më "..TAB_TICKETINFO[matchtype][1].."phiÕu t­ c¸ch tham gia, ng­¬i muèn nhËn b©y giê kh«ng?", getn(tabticketinfo), tabticketinfo)
--	Say("ÎäÁÖ´ó»á¹ÙÔ±£ºÄã¿ÉÒÔÁìÈ¡<color=yellow> "..MAX_TICKETCOUNT.." <color>ÕÅ"..TAB_TICKETINFO[matchtype][1].."×Ê¸ñÆ±£¬ÄãÒªÏÖÔÚÁìÈ¡Âğ£¿", getn(tabticketinfo), tabticketinfo)
end

--È·¶¨ÒªÄÃ¼¸ÕÅÄ³ÖÖÀàĞÍµÄÃÅÆ±
function wl_suregetticket(matchtype, count)
	local usedcount = GetTask(TK_WL_TICKET_FACTION1 + matchtype - 1)
	if (usedcount >= TAB_TICKETINFO[matchtype][2]) then
		Say("Xin lçi!".."Sè l­îng phiÕu t­ c¸ch tham gia lín nhÊt cña môc nµy lµ "..TAB_TICKETINFO[matchtype][2]..", b¹n ®· nhËn xong phiÕu t­ c¸ch tham gia môc thi ®Êu nµy! Kh«ng thÓ nhËn n÷a!",0)
		return
	end
--	if (usedcount >= MAX_TICKETCOUNT) then
--		Say("ÎäÁÖ´ó»á¹ÙÔ±£º¶Ô²»Æğ£¡".."¸ÃÏîÈüÄãÄÜÁìÈ¡µÄ×î´ó×Ê¸ñÆ±ÊıÁ¿ÊÇ<color=yellow> "..MAX_TICKETCOUNT.." <color>,ÄúÒÑ¾­ÁìÍê¸ÃÏîÈüµÄ×Ê¸ñÆ±ÁË£¬²»ÄÜÔÙÁìÁË¡£",0)
--		return
--	end
	
	local zoneid = wl_zonename2zoneid(GetTong())
	if (zoneid == 0) then
		return
	end
	for i= 1 ,count do 
		nItemIndex = AddItem(TAB_TICKETINFO[matchtype][6][1], TAB_TICKETINFO[matchtype][6][2], TAB_TICKETINFO[matchtype][6][3], 1, 0,0,0)
		ITEM_SetItemExParam(nItemIndex, 1, zoneid)
		ITEM_SetItemExParam(nItemIndex, 2, matchtype)
	end
	SetTask(TK_WL_TICKET_FACTION1 + matchtype - 1 , usedcount + count)
end

--»ñµÃË«ÈËÈüµÄÃÅÆ±
function wl_getdoubleticket()
	wl_getticket(11)
end

--»ñµÃÎåÈËÈüµÄÃÅÆ±
function wl_getfiveticket()
	wl_getticket(12)
end

--»ñµÃÊ®ÈËÈüµÄÃÅÆ±
function wl_gettenticket()
	wl_getticket(13)
end

--»ñµÃÊ®ÁùÈËÈüµÄÃÅÆ±
function wl_getsixteenticket()
	wl_getticket(14)
end


function wl_checkzoneleader( matchtype )
--	do return 1 end
	local mon, day, hour = wl_checkfetchtime()
	local openmon, openday = wl_getmatchopenday(1)
	if ( (openmon >= mon and openday > day) or hour < 18 ) then
		if (GetTongFigure() ~= TONG_MASTER and GetTongFigure() ~= TONG_ELDER) then
			Say("Ph¶i lµ Bang chñ hoÆc Tr­ëng l·o cña khu vùc míi ®­îc!", 0)
			return 0
		end

		local zoneid = wl_zonename2zoneid(GetTong());
		if (zoneid == 0) then
			Say("Xin lçi! Ph¶i lµ Bang chñ cña khu vùc thi ®Êu míi cã thÓ nhËn ®­îc!",0)
			return 0
		end
		return 1
	end
	if ( hour >= 18 ) then
		if( not matchtype ) then
			return 1
		end
		
		local nMon = 0
		local nDay = 0;
		if (matchtype > 10) then
			nMon ,nDay = wl_getmatchopenday(matchtype)
		end
		
		if ( matchtype > 0 and matchtype <= 10 ) then
			local nMon1, nDay1 = wl_getmatchopenday(1)
			local nMon2, nDay2 = wl_getmatchopenday(15)
			if ( (nMon1 == mon and nDay1 == day) or ( nMon2 == mon and nDay2 == day ) ) then
				return 1
			end
		elseif ( nMon == mon and nDay == day ) then
		
			return 1
		else
			Say("H«m nay ch­a më thi ®Êu cña"..TAB_TICKETINFO[matchtype][3]..", ng­¬i kh«ng thÓ nhËn vĞ vµo lo¹i thi ®Êu nµy.", 0)
			return 0
		end
	end
	Say("B©y giê kh«ng ph¶i lµ thêi gian l·nh phiÕu thi ®Êu!", 0)
	return 0
end


function wl_checkfetchtime(  )
--	local nTime = GetCurServerTime()
--	local nDate = FormatTime2Number(nTime)
	local nDate = date("%y%m%d%H%M")
	local year = floor( nDate / 100000000 )
	local mon = mod( floor( nDate / 1000000 ), 100 )
	local day = mod( floor( nDate / 10000 ), 100 )
	local hour = mod( floor( nDate / 100 ), 100 )
	return mon, day, hour
end

function wl_getmatchopenday(matchtype)
	if (TAB_SCHEDULE[matchtype] == nil) then
		return 0,0
	end
	local nMon = floor( TAB_SCHEDULE[matchtype] / 100 )
	local nDay = mod( TAB_SCHEDULE[matchtype] , 100 )
	return nMon, nDay
end

TAB_SCHEDULE = 
{
--	{Ñ­»·Èü¿ªÊ¼Ê±¼ä£¬½áÊøÊ±¼ä, ÂÖ´Î,¼ä¸ôÊ±¼ä, ÏìÓ¦º¯Êı},{32Ç¿Èü¿ªÊ¼Ê±¼ä,32Ç¿Èü±ÈÈü½áÊøÊ±¼ä, ÂÖ´Î, ¼ä¸ôÊ±¼ä, ÏìÓ¦º¯Êı},{×îÖÕ¾öÈü¿ªÊ¼Ê±¼ä,½áÊøÊ±¼ä£¬Èí´Î,¼ä¸ôÊ±¼ä,ÏìÓ¦º¯Êı}
[1] = 0712,
[11] = 0714,
[12] = 0715,
[13] = 0716,
[14] = 0717,
[15] = 0713
}

function wl_zonename2zoneid(zonename)
	for i=1, getn(TAB_ZONEINFO) do
		if (TAB_ZONEINFO[i] == zonename) then
			return i
		end
	end
	return 0
end



TAB_ZONEINFO = {
"1-1",
"1-2",
"1-3",
"2-1",
"2-2",
"2-3",
"3-1",
"3-2",
"3-3",
"4-1",
"4-2",
"4-3",
"5-1",
"5-2",
"6-1",
"6-2",
"6-3",
"7-1",
"7-2",
"7-3",
"8-1",
"8-2",
"9-1",
"9-2",
"10-1",
"10-2",
"11-1",
"11-2",
"11-3",
"12-1",
"12-2",
"13-1",
"13-2",
"14-1",
"15-1",
"16-1",
"17-1",
"18-1",
"19-1",
"20-1",
"20-2",
"22-1",

}

function OnCancel()
end