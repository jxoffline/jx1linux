-- ÄÚ¸óÉĞÊé£ºÌì×ÓÏµÍ³Èë¿Ú
-- By: wangbin(2009-5-24)

Include("\\script\\nationalwar\\head.lua")
Include( "\\script\\lib\\say.lua" )
Include("\\script\\item\\tianziyuxi.lua")
IncludeLib("ITEM")
Include("\\script\\lib\\awardtemplet.lua")

function main()
	Say("Néi c¸c th­îng th­ hÇu chØ",
		7,
		"Thiªn Tö ®¨ng c¬/nw_enthrone",
		"Thiªn Tö ngù chØ/nw_emperororder",
		"Quèc V­¬ng chiÕu th­/nw_kingorder",
		"L·nh phÇn th­ëng/nw_accept",
		"Lßng d©n lµ c¸n c©n chuÈn mùc/nw_comment",
		"ThiÕt bót trùc th­ (sö kı)/nw_history",
		"Ta chØ ®Õn ch¬i/Cancel")
end

-- Ìì×ÓµÇ»ù
function nw_enthrone()
	if (NW_IsEmperor() == 1) then
		Say("LÔ ®¨ng c¬ ®· diÔn ra råi, lÏ nµo bÖ h¹ quªn råi?")
		return
	end
	local result = NW_GetTask(NW_TASKNO_WARRESULT)
	if (result == 0 and NW_GetEmperorName() == "") then
		Say("VŞ anh hïng nµy cã chİ khİ h¬n ng­êi, nh­ng h·y ®îi thêi c¬ ®·.")
	elseif (result == 1 or result == 2) then
		local master = ""
		local side = 0
		if (result == 1) then
			-- ËÎÓ®
			_, master = GetCityOwner(CITYIDX_LINAN)
			side = 1
		else
			-- ½ğÓ®
			_, master = GetCityOwner(CITYIDX_BIANJING)
			side = 0
		end
		if (GetName() ~= master) then
			Say("§­¬ng kim Thiªn Tö kh«ng ph¶i ng­êi b×nh th­êng ®¶m ®­¬ng ®­îc")
		else
			NW_Enthrone(side)
			NW_SetTask(NW_TASKNO_WARRESULT, 100 + result)
		end
	else
		Say("§­¬ng kim Thiªn Tö anh minh, ng­¬i h·y chÊp nhËn sù thËt ®i.")
	end
end

-- Ìì×ÓÚÍÖ¼
function nw_emperororder()
	Say("Thiªn Tö ngù chØ",
		7,
		"§Æt quèc hiÖu/nw_emperororder_setnationtitle",
		"Kh¾p chèn mõng vui/nw_emperororder_congratulate",
		"§¹i x¸ thiªn h¹/nw_emperororder_absolve",
		"Thiªn Tö chiÕu th­/nw_emperororder_message",
		"Quyªn tiÒn/nw_emperororder_levy",
		"CÊm nãi/nw_emperororder_forbidtalkdlg",
		"Ta chØ ®Õn ch¬i/Cancel")
end

-- ¹úÍõÚ¯Êé
function nw_kingorder()
	Say("Ng­êi ®øng ®Çu mét n­íc, cã quyÒn h¹n cao nhÊt",
		3,
		"Phong ®¹i thÇn/nw_kingorder_instate",
		"§iÒu chØnh thuÕ suÊt/nw_kingorder_taxdlg",
		"Kh«ng lµm g×./Cancel")
end

-- ÁìÈ¡
function nw_accept()
	Say("Tr¸ng sü xuÊt trËn, giÕt ®Şch lËp c«ng",
		5,
		"NhËn lÖnh bµi quèc chiÕn/nw_accept_token",
		"NhËn phÇn th­ëng Hoµng §Õ/nw_accept_domainring",
		--New emperor award - Modified By DinhHQ - 20120726
		--"NhËn phÇn th­ëng Thiªn Tö/nw_accept_empirering",
		"NhËn phÇn th­ëng Thiªn Tö/VnEmperorNewAward",
		"NhËn thiªn tö ngäc tû/nw_accept_empireseal",
		"Ta chØ ghĞ qua xem/Cancel")
end

-- ÁìÈ¡/¹úÕ½ÁîÅÆ
function nw_accept_token()
	city = GetCityArea()
	if (city ~= CITYIDX_LINAN and city ~= CITYIDX_BIANJING) then
		Say("N¬i ®©y lÏ nµo kh«ng thuéc khu vùc tèng kim?")
		return
	end
	tong, master = GetCityOwner(city)
	if (GetTong() ~= tong) then
		Say("Nh×n ng­¬i kh«ng gièng nh­ thÇn d©n n­íc ta, lÏ nµo ng­¬i lµ gian tÕ cña ®Şch?")
		return
	end
	if (master ~= GetName() and NW_GetDuty() == NWPOSITION_NONE) then
		Say("Ng­êi kh«ng liªn quan kh«ng thÓ tham dù quèc gia ®¹i sù!")
		return
	end
	local free = CalcFreeItemCellCount()
	if (free == 0) then
		Say("Hµnh trang kh«ng ®ñ chç trèng, s¾p xÕp l¹i råi ®Õn nhËn l¹i.")
		return
	end
	local count = 10
	if (free < count) then
		count = free
	end
	local token = TAB_TOKEN[city]
	for i = 1, count do
		local item = AddItem(token[1], token[2], token[3], 1, 0, 0)
		if (item ~= 0) then
			local timeout = GetLocalTime() + SECONDS_ONEDAY
			ITEM_SetExpiredTime2(item, timeout)
			SyncItem(item)
		end
	end
	Say(format("§©y lµ <color=red>%d<color> quèc chiÕn lÖnh bµi. Cã thÓ nhËn thªm nÕu muèn.", count))
end

-- ÁìÈ¡/ÁìÈ¡µÛ»Ê½±Àø
function nw_accept_domainring()
		
	local nWeek = tonumber(GetLocalDate("%w"));	 
	local nTime = tonumber(GetLocalDate("%H%M%S"));
	local nHour = tonumber(GetLocalDate("%H"));	
	
	local nWiner = mod(NW_GetTask(NW_TASKNO_WARRESULT), 100);
	local city   = GetCityArea()

	if (city ~= CITYIDX_LINAN and city ~= CITYIDX_BIANJING) then
		Say("N¬i ®©y lÏ nµo kh«ng thuéc khu vùc tèng kim?")
		return
	end
	
	if nWiner ~= 1 and nWiner ~= 2 then
		Say("VÉn ch­a ®Şnh ®o¹t ®­îc ai lµ thiªn tö")
		return
	end

	if nWiner == 1 and city ~= CITYIDX_BIANJING then
		Say("PhÇn th­ëng dµnh cho ng­êi cã hïng t©m tr¸ng chİ dµnh l¹i giang s¬n, xin h·y ®Õn thµnh thŞ cña m×nh ®Ó lÜnh th­ëng!")
		return
	end
	
	if nWiner == 2 and city ~= CITYIDX_LINAN then
		Say("PhÇn th­ëng dµnh cho ng­êi cã hïng t©m tr¸ng chİ dµnh l¹i giang s¬n, xin h·y ®Õn thµnh thŞ cña m×nh ®Ó lÜnh th­ëng!")
		return
	end
	
	tong, master = GetCityOwner(city)
	if (NW_IsEmperor() == 1) then
		Say("Thiªn Tö ®¸ng nhËn <color=red>phÇn th­ëng Thiªn Tö<color>.")
	elseif (GetTong() ~= tong) then
		Say("Nh×n bé d¹ng lËp lê cña ng­êi, h¼n lµ lµ gian tÕ cña ®Şch?")
	elseif (master ~= GetName()) then
		Say("Ng­êi kh«ng liªn quan kh«ng thÓ tham dù quèc gia ®¹i sù!")
	elseif (NW_GetTask(NW_TASKNO_GETDOMAINRING) ~= 0) then
		Say("Quèc chñ ®· nhËn th­ëng råi.")
	elseif (nWeek == 1 and nTime >= 120000 and nTime <= 223000) then
		Say("ChiÕn sù cÊp b¸o, xin mêi bÖ h¹ nghªnh chiÕn.")
	else
		local free = FindFreeRoomByWH(2, 3)
		if (free ~= 1) then
			Say("Hµnh trang kh«ng ®ñ chç trèng, s¾p xÕp l¹i råi ®Õn nhËn l¹i.")
			return
		end
		
		local item = AddItem(0,10,7,1,0,0)
		if (item == 0) then
			WriteLog(format("[NW]Failed to give king-ring[AddItem(0,10,7,1,0,0)] to %s", GetName()))
			Say("Cã ®iÒu g× ®ã kh«ng æn, b¶o vËt t¹m thêi kh«ng thÓ giao cho ng­¬i ®­îc.")
		else
			
			if nWeek == 0 then	nWeek = 7;	end
			if nWeek == 1 and	nHour < 21	then	nWeek = 8;	end
			local nExpiredDate = FormatTime2Date((8 - nWeek) * 24 * 60 *60 + GetCurServerTime());
		
			ITEM_SetExpiredTime(item, nExpiredDate, 120000)
			SyncItem(item)
			
			NW_SetTask(NW_TASKNO_GETDOMAINRING, 1)
			WriteLog(format("[NW]Give king-ring[AddItem(0,10,7,1,0,0)] to %s", GetName()))
			Say("PhÇn th­ëng lµ <color=red>Phiªn Vò<color>, xin mêi quèc chñ nhËn lÊy.")
		end
		
		
	end
end

-- ÁìÈ¡/ÁìÈ¡Ìì×Ó½±Àø
function nw_accept_empirering()
	--Change emperor ring and horse award - modified By DinhHQ -  20120726
	do return end
	local nWeek = tonumber(GetLocalDate("%w"));	 
	local nTime = tonumber(GetLocalDate("%H%M%S"));
	local nHour = tonumber(GetLocalDate("%H"));		
	
	city = GetCityArea()
	if (city ~= CITYIDX_LINAN and city ~= CITYIDX_BIANJING) then
		Say("N¬i ®©y lÏ nµo kh«ng thuéc khu vùc tèng kim?")
	elseif (NW_IsEmperor() ~= 1) then
		Say("<color=red>PhÇn th­ëng cña thiªn tö<color> chØ cã thÓ Thiªn Tö míi nhËn ®­îc, ng­¬i lµ ai mµ d¸m m¹o danh Thiªn Tö!")
	elseif (NW_GetTask(NW_TASKNO_GETEMPIRERING) ~= 0) then
		Say("BÖ h¹ ®· nhËn th­ëng råi.")
	elseif (nWeek == 1 and nTime >= 120000 and nTime <= 223000) then
		Say("ChiÕn sù cÊp b¸o, xin mêi bÖ h¹ chuÈn bŞ nghªnh chiÕn.")
	else
		local free = FindFreeRoomByWH(2, 4)
		if (free ~= 1) then
			Say("Hµnh trang kh«ng ®ñ chç trèng, s¾p xÕp l¹i råi ®Õn nhËn l¹i.")
			return
		end
		
		if nWeek == 0 then	nWeek = 7;	end
		if nWeek == 1 and	nHour < 21	then	nWeek = 8;	end
		local nExpiredDate = FormatTime2Date((8 - nWeek) * 24 * 60 *60 + GetCurServerTime());
		
		local itemHorse = AddItem(0,10,7,1,0,0)
		if (itemHorse == 0) then
			WriteLog(format("[NW]Failed to give emperor-ring[AddItem(0,10,7,1,0,0)] to %s", GetName()))
			Say("Cã ®iÒu g× ®ã kh«ng æn, b¶o vËt t¹m thêi kh«ng thÓ giao cho ng­¬i ®­îc.")
			return
		end
		WriteLog(format("[NW]Give king-ring[AddItem(0,10,7,1,0,0)] to %s", GetName()))
		ITEM_SetExpiredTime(itemHorse, nExpiredDate, 120000)
		SyncItem(itemHorse)
		
		-- ÒÑ¾­³É¹¦ÁìÈ¡µ½²¿·ÖÎïÆ·
		NW_SetTask(NW_TASKNO_GETEMPIRERING, 1) 
		
		local itemBeijin = AddGoldItem(0,142)
		if (itemBeijin == 0) then
			WriteLog(format("[NW]Failed to give emperor-ring[AddGoldItem(0,142)] to %s", GetName()))
			Say("Cã ®iÒu g× ®ã kh«ng æn, b¶o vËt t¹m thêi kh«ng thÓ giao cho ng­¬i ®­îc.")
			return
		end
		WriteLog(format("[NW]Give king-ring[AddGoldItem(0,142)] to %s", GetName()))
		ITEM_SetExpiredTime(itemBeijin, nExpiredDate, 120000)
		SyncItem(itemBeijin)
		
		local itemYaDian = AddGoldItem(0,141)
		if (itemYaDian == 0) then
			WriteLog(format("[NW]Failed to give emperor-ring[AddGoldItem(0,141)] to %s", GetName()))
			Say("Cã ®iÒu g× ®ã kh«ng æn, b¶o vËt t¹m thêi kh«ng thÓ giao cho ng­¬i ®­îc.")
			return
		end
		WriteLog(format("[NW]Give king-ring[AddGoldItem(0,141)] to %s", GetName()))
		ITEM_SetExpiredTime(itemYaDian, nExpiredDate, 120000)
		SyncItem(itemYaDian)
		
		Say("PhÇn th­ëng cña bÖ h¹ lµ <color=red>V« danh giíi chØ, v« danh chØ hoµn, phiªn vò<color>.")
	end
end

-- ÁìÈ¡/ÁìÈ¡Ìì×ÓÓñçô
function nw_accept_empireseal()
	
	local nWeek = tonumber(GetLocalDate("%w"));	 
	local nTime = tonumber(GetLocalDate("%H%M%S"));
	
	city = GetCityArea()
	if (city ~= CITYIDX_LINAN and city ~= CITYIDX_BIANJING) then
		Say("N¬i ®©y lÏ nµo kh«ng thuéc khu vùc tèng kim?")
	elseif (NW_IsEmperor() ~= 1) then
		Say("ChØ cã Thiªn Tö míi thÓ mang ®­îc Thiªn Tö ngäc tû, ng­¬i thËt to gan d¸m gi¶ m¹o Thiªn Tö!")
	elseif (NW_GetTask(NW_TASKNO_GETEMPIRESEAL) ~= 0) then
		Say("BÖ h¹ ®· nhËn <color=red>Thiªn Tö ngäc tû<color> råi.")
	elseif (nWeek == 1 and nTime >= 120000 and nTime <= 223000) then
		Say("ChiÕn sù cÊp b¸o, xin mêi bÖ h¹ chuÈn bŞ nghªnh chiÕn.")
	else
		local free = CalcFreeItemCellCount()
		if (free == 0) then
			Say("Hµnh trang kh«ng ®ñ chç trèng, s¾p xÕp l¹i råi ®Õn nhËn l¹i.")
			return
		end
		local itemidx = AddItem(6, 1, 2059, 1, 0, 0)
		if (itemidx == 0) then
			WriteLog(format("[NW]Failed to give emperor-seal[Item(6,1,2059,1,0,0)] to %s", GetName()))
			Say("Cã ®iÒu g× ®ã kh«ng æn, b¶o vËt t¹m thêi kh«ng thÓ giao cho ng­¬i ®­îc.")
		else
			WriteLog(format("[NW]Give emperor-seal[Item(6,1,2059,1,0,0)] to %s", GetName()))
			tbItemTianZiYuXi:GiveCallBack(itemidx)
			NW_SetTask(NW_TASKNO_GETEMPIRESEAL, 1)
			Say("§©y lµ Thiªn Tö ngäc tû, xin mêi bÖ h¹ nhËn lÊy.")
		end
	end
end

-- ÃñĞÄÊÇ¸Ë³Ó
function nw_comment()
	Say("Tuy r»ng quyÒn thÕ cña Thiªn Tö cao nh­ng còng kh«ng thÓ xem th­êng lßng d©n ®­îc.",
		3,
		"NhËn xĞt ®­¬ng kim Thiªn Tö/nw_comment_commit",
		"Xem kÕt qu¶ nhËn xĞt/nw_comment_query",
		"Kh«ng cã viÖc g×/Cancel")
end

-- Ìú±ÊÖ±Êé
function nw_history()
	Say("Hµo kiÖt tuy nhiÒu, nh­ng trong lŞch sö chØ l­u danh, tõ cæ chİ kim cã mÊy ng­êi?",
		4,
		"LŞch sö thiªn tö/nw_history_emperor",
		"Tèng quèc sö kı/nw_history_song",
		"Kim quèc sö kı/nw_history_jin",
		"Ta chØ ®Õn t­ëng niÖm mét lóc./Cancel")
end

-- Ìì×ÓÚÍÖ¼/ÉèÁ¢¹úºÅ
function nw_emperororder_setnationtitle()
	if (NW_IsEmperor() ~= 1) then
		Say("Quèc hiÖu chØ cã ®­¬ng kim Thiªn Tö míi lËp ®­îc.")
	else
--		local year, mon, day, hour, min, sec, wday = MakeDateTime(7)
--		if (wday == 0 or wday > 2) then

		if 	NW_GetTask(NW_TASKNO_NATIONALTITLE) ~= 0 then
			Say("BÈm bÖ h¹, quèc hiÖu ®· loan kh¾p bèn bÓ råi, kh«ng thÓ söa ®­îc n÷a.")
		else
			nw_emperororder_inputtitle()
		end
	end
end

-- Ìì×ÓÚÍÖ¼/ÉèÁ¢¹úºÅ£ºµ¯³öÊäÈë¿ò
function nw_emperororder_inputtitle()
--	AskClientForString(
--		"nw_oninputnationtitle",
--		"",
--		1,
--		NW_MAXLEN_NATIONTITLE,
--		"Çë±İÏÂÊäÈë¹úºÅ£º")

	Say(
		"Xin mêi bÖ h¹ chän quèc hiÖu",
		5,
		format("%s/#nw_oninputnationtitle(\"%s\")", "KimLong", "KimLong"),
		format("%s/#nw_oninputnationtitle(\"%s\")", "ThanhLong", "ThanhLong"),
		format("%s/#nw_oninputnationtitle(\"%s\")", "B¹chLong", "B¹chLong"),
		format("%s/#nw_oninputnationtitle(\"%s\")", "HáaLong", "HáaLong"),
		format("%s/#nw_oninputnationtitle(\"%s\")", "H¾cLong", "H¾cLong")
		)
end

-- Ìì×ÓÚÍÖ¼/ÉèÁ¢¹úºÅ£º»Øµ÷º¯Êı
function nw_oninputnationtitle(title)
	if (NW_IsEmperor() ~= 1) then
		Say("C¸c h¹ d¸m gi¶ m¹o ®­¬ng kim Thiªn Tö!")
		return
	end
	local len = strlen(title)
	if (len == 0) then
		nw_emperororder_inputtitle()
	elseif (len > NW_MAXLEN_NATIONTITLE) then
		Say("BÈm bÖ h¹! Quèc hiÖu nµy qu¸ dµi råi, b¸ch tİnh kh«ng thÓ nhí ®­îc ®©u.",
			2,
			"Xin mêi nhËp l¹i/nw_emperororder_inputtitle",
			"§Ó ta suy nghÜ thªm/Cancel")
	elseif (NW_CheckText(title) ~= 1) then
		Say("Quèc hiÖu nµy ph¶i truyÒn miÖng vÒ sau, uy danh thiªn h¹,tø h¶i quy phôc",
			2,
			"Xin mêi nhËp l¹i/nw_emperororder_inputtitle",
			"§Ó ta suy nghÜ thªm/Cancel")
	else
		local emperor = NW_GetEmperorName()
		AddGlobalCountNews(format("[Thay ®æi chiªu thŞ] Thiªn Tö <color=red>%s<color> thay ®æi quèc hiÖu thµnh \"<color=red>%s<color>\".", emperor, title), 5)
		NW_SetNationTitle(title)
		NW_SetTask(NW_TASKNO_NATIONALTITLE, 1)
		Say("ThÇn lÜnh chØ.")
	end
end

--Ìì×ÓÚÍÖ¼/ÆÕÌìÍ¬Çì
function nw_emperororder_congratulate()
	if (NW_IsEmperor() ~= 1) then
		Say("LÔ nghi ®ãn tiÕp ph¶i do Thiªn Tö chñ tr×!")
		return
	end
	local time = GetCurServerTime()
	if (time <= NW_GetTask(NW_TASKNO_CONGRATULATION) + SECONDS_ONEWEEK) then
		Say("BÖ h¹, lÔ nghi qu¸ nhiÒu sÏ rÊt hao tµi tèn cña mµ kh«ng hîp lı.")
	else
		Say("B©y giê lµ giê tèt, bÖ h¹ muèn cö hµnh lÔ nghi?",
			2,
			"Tu©n lÖnh!/nw_emperororder_congratulate_inputwords",
			"Kh«ng /Cancel")
	end
end

-- Ìì×ÓÚÍÖ¼/ÆÕÌìÍ¬Çì£ºÉè¶¨ºØ´Ê
function nw_emperororder_congratulate_inputwords()
	AskClientForString(
		"nw_emperororder_congratulate_words",
		"",
		1,
		NW_MAXLEN_CONGRATULATIONWORDS,
		"Xin mêi bÖ h¹ viÕt lêi chóc mõng:")
end

-- Ìì×ÓÚÍÖ¼/ÆÕÌìÍ¬Çì£ºÉè¶¨ºØ´Ê
function nw_emperororder_congratulate_words(words)
	if (NW_IsEmperor() ~= 1) then
		Say("C¸c h¹ d¸m gi¶ m¹o ®­¬ng kim Thiªn Tö!")
		return
	end
	local len = strlen(words)
	if (len == 0) then
		Say("Tai thÇn kh«ng ®­îc tèt l¾m, xin mêi bÖ h¹ nãi l¹i thªm mét lÇn n÷a.")
	elseif (len > NW_MAXLEN_CONGRATULATIONWORDS) then
		Say("Lêi chóc dµi qu¸ sÏ lµm b¸ch tİnh rÊt khã nhí.")
	elseif (NW_CheckText(words) ~= 1) then
		Say("Lêi chóc cã tõ kh«ng hîp lı l¾m, xin bÖ h¹ h·y suy xĞt l¹i.")
	else
		-- ³ÖĞø30·ÖÖÓ
		NW_OpenCongratulation(words, 30)
		NW_SetTask(NW_TASKNO_CONGRATULATION, GetCurServerTime())
		AddGlobalCountNews(format("[Kh¾p chèn mõng vui] sÏ ®­îc ph¸t t¹i kªnh thÕ giíi\"<color=red>%s<color>\" chóc mõng thiªn tö ®Òu sÏ ®­îc phong th­ëng!", words), 10)
		Say("ThÇn lÜnh chØ vµ sÏ ®i thu xÕp ngay lËp tøc.")
	end
end

-- Ìì×ÓÚÍÖ¼/´óÉâÌìÏÂ
function nw_emperororder_absolve()
	if (NW_IsEmperor() ~= 1) then
		if (NW_InEmperorTong() ~= 1 or NW_GetDuty() ~= NWPOSITION_MINISTER) then
			Say("§¹i x¸ thiªn h¹ lµ quyÒn h¹n cña Thiªn ö")
			return
		end
	end
	local time = GetCurServerTime()
	if (time <= NW_GetTask(NW_TASKNO_ABSOLVE) + SECONDS_ONEWEEK) then
		Say("BÖ h¹ tõ bi, kh¾p thÕ gian ®Òu biÕt. Nh­ng lo¹i h×nh ngôc nµy kh«ng thÓ láng lÎo ®­îc")
	else
		Say("ThÇn lÜnh chØ, ®· x¸ ph¹m nh©n thiªn h¹")
		NW_SetTask(NW_TASKNO_ABSOLVE, time)
		AddGlobalCountNews("[§¹i x¸ thiªn h¹] TÊt c¶ ph¹m nh©n nhÊt th¶y miÔn téi, ®Òu cã thÓ ®èi tho¹i víi lao ®Çu ®Ó xin vÒ nhµ.", 3)
	end
end

-- Ìì×ÓÚÍÖ¼/Ä¼¾è
function nw_emperororder_levy()
	if (NW_IsEmperor() ~= 1) then
		Say("§©y lµ quyÒn h¹n thiªn tö")
		return		
	end
	local time = GetCurServerTime()
	if (time <= NW_GetTask(NW_TASKNO_LEVY) + SECONDS_ONEWEEK) then
		Say("BÖ h¹ ®· quyªn tiÒn mét lÇn, quyªn tiÒn thªm lÇn n÷a sÏ g©y ai o¸i cho d©n")
	else
		NW_SetTask(NW_TASKNO_LEVY, time)
		NW_Levy(10000, 80)
		AddGlobalCountNews("[Thiªn Tö quyªn tiÒn] Thiªn Tö cã chØ tÊt c¶ thÇn d©n quyªn tiÒn, kh«ng ai ®­îc phĞp kh¸ng chØ.", 3)
	end
end

-- Ìì×ÓÚÍÖ¼/Ìì×ÓÚ¯Êé
function nw_emperororder_message()
	if (NW_IsEmperor() ~= 1) then
		if (NW_InEmperorTong() ~= 1 or NW_GetDuty() ~= NWPOSITION_MINISTER) then
			Say("ChiÕu th­ thiªn h¹ lµ quyÒn h¹n cña Thiªn ö")
			return
		end
	end
	local currtime = GetCurServerTime()
	local tasktime = NW_GetTask(NW_TASKNO_MESSAGETIME)
	if (tasktime ~= 0 and currtime <= tasktime + SECONDS_ONEWEEK and
		NW_GetTask(NW_TASKNO_MESSAGECOUNT) >= NW_MAXCOUNT_MESSAGE) then
		Say("BÖ h¹ ph¸t qu¸ nhiÒu chiÕu th­, b¸ch tİnh ®Òu kh«ng muèn nghe.")
	else
		nw_emperororder_inputmessage()
	end
end

-- Ìì×ÓÚÍÖ¼/Ìì×ÓÚ¯Êé£ºÊäÈëÄÚÈİ
function nw_emperororder_inputmessage()
	AskClientForString(
		"nw_emperororder_onmessage",
		"",
		NW_MINLEN_MESSAGE,
		NW_MAXLEN_MESSAGE,
		"BÖ h¹ h¹ chiÕu th­:")
end

-- Ìì×ÓÚÍÖ¼/Ìì×ÓÚ¯Êé£ºÄÚÈİ¼ì²é
function nw_emperororder_onmessage(msg)
	local len = strlen(msg)
	if (len < NW_MINLEN_MESSAGE or len > NW_MAXLEN_MESSAGE) then
		Say("ChiÕu th­ lµ ph¸t ng«n cña Thiªn Tö, ng¾n qu¸ hay dµi qu¸ th× kh«ng thÓ biÓu ®¹t th¸nh ı.",
			2,
			"Xin mêi nhËp l¹i/nw_emperororder_inputmessage",
			"§Ó ta suy nghÜ l¹i/Cancel")
	elseif (NW_CheckText(msg) ~= 1) then
		Say("ChiÕu th­ cã mét sè tõ kh«ng æn, xin bÖ h¹ h·y suy xĞt l¹i.",
			2,
			"Xin mêi nhËp l¹i/nw_emperororder_inputmessage",
			"§Ó ta suy nghÜ l¹i/Cancel")
	else
		local currtime = GetCurServerTime()
		local tasktime = NW_GetTask(NW_TASKNO_MESSAGETIME)
		local count = 1
		if (tasktime == 0 or currtime > tasktime + SECONDS_ONEWEEK) then
			NW_SetTask(NW_TASKNO_MESSAGETIME, currtime)
			NW_SetTask(NW_TASKNO_MESSAGECOUNT, count)
		else
			count = NW_GetTask(NW_TASKNO_MESSAGECOUNT) + 1
			NW_SetTask(NW_TASKNO_MESSAGECOUNT, count)
		end
		AddGlobalCountNews(format("[Thiªn Tö chiÕu th­] <color=red>%s<color>", msg), 3)
		Say(format("ThÇn ®· nhí råi, tuÇn nµy bÖ h¹ cßn cã thÓ göi thªm <color=red>%d<color> lÇn", NW_MAXCOUNT_MESSAGE - count))
	end
end

-- Ìì×ÓÚÍÖ¼/½ûÑÔ
function nw_emperororder_forbidtalkdlg()
	if (NW_IsEmperor() ~= 1) then
		Say("C¸c h¹ d¸m gi¶ m¹o ®­¬ng kim Thiªn Tö!")
		return
	end
	local tasktime = NW_GetTask(NW_TASKNO_FORBIDCHATTIME)
	local currtime = GetCurServerTime()
	if (tasktime ~= 0 and currtime < tasktime + SECONDS_ONEDAY) then
		Say("BÖ h¹ vÉn cßn ®ang giËn, xin mêi ®îi mäi viÖc ngu«i ®i ®·.")
	else
		Say("MÆc dï bÖ h¹ cã thÓ cÊm nãi mét ng­êi, nh­ng lßng ng­êi cã thÓ luËn ®o¸n. Xin bÖ h¹ h·y thËn träng khi hµnh sù",
			2,
			"Ta ®· quyÕt ®Şnh råi/nw_emperororder_forbidtalk",
			"§Ó ta suy nghÜ l¹i/Cancel")
	end
end

-- Ìì×ÓÚÍÖ¼/½ûÑÔ£ºµ¯³öÊäÈë¿ò
function nw_emperororder_forbidtalk()
	AskClientForString(
		"nw_emperororder_forbidtalk_input",
		"",
		1,
		32,
		"Xin mêi nhËp tªn cÇn cÊm nãi:")
end

-- Ìì×ÓÚÍÖ¼/½ûÑÔ£ºÊäÈëÍæ¼ÒÃû×Ö
function nw_emperororder_forbidtalk_input(name)
	NW_ForbidChat(name, 30)
	local currtime = GetCurServerTime()
	NW_SetTask(NW_TASKNO_FORBIDCHATTIME, currtime)
	AddGlobalCountNews(format("[ChiÕu th­ thiªn h¹]\"<color=red>%s<color>\"Chäc gi©n Thiªn Tö, cÊm nãi nöa giê thŞ uy.", name), 3)
	Say(format("ThÇn lÜnh chØ: CÊm nãi <color=red>%s<color> trong vßng nöa giê.", name))
end

-- ÃñĞÄÊÇ¸Ë³Ó/ÆÀÒéµ±½ñÌì×Ó
function nw_comment_commit()
	Say("C«ng ®¹o tù cã t¹i mçi ng­êi, Thiªn Tö tuy quyÒn cao uy nghiªm nh­ng còng kh«ng thÓ tù lõa dèi b¶n th©n.",
		3,
		"T¸n d­¬ng Thiªn Tö/nw_comment_celebratedlg",
		"Tè c¸o Thiªn Tö/nw_comment_criticizedlg",
		"Kh«ng cã viÖc g×/Cancel")
end

-- ÃñĞÄÊÇ¸Ë³Ó/²éÑ¯ÆÀÒé½á¹û
function nw_comment_query()
	local emperor = NW_GetEmperorName()
	if (emperor == "") then
		Say("HiÖn t¹i vÉn ch­a cã thiªn tö, b¸ch tİnh rÊt chê mong mét minh qu©n thèng nhÊt thiªn h¹")
		return
	end
	local goodness, badness = NW_GetRemark()
	local value = floor(goodness - badness)
	local title = ""
	if (value > 3000) then
		title = "Th¸nh Qu©n"
	elseif (value >= 1001) then
		title = "Minh qu©n"
	elseif (value >= 101) then
		title = "H÷u vŞ"
	elseif (value >= -100) then
		title = "Thanh tŞnh"
	elseif (value >= -1000) then
		title = "V« vŞ"
	elseif (value >= -3000) then
		title = "Dung qu©n"
	else
		title = "H«n qu©n"
	end
	Say(format("§­¬ng kim Thiªn Tö lµ <color=yellow>%s<color>, thiÖn ¸c lµ <color=yellow>%d<color>, vÒ phİa <color=yellow>%s<color>.", emperor, value, title))
end

-- ÃñĞÄÊÇ¸Ë³Ó/ÆÀÒéµ±½ñÌì×Ó/ËÌÑïÌì×Ó£º¸øÓè½çÃæ
function nw_comment_celebratedlg()
	local emperor = NW_GetEmperorName()
	if (emperor == "") then
		Say("HiÖn t¹i vÉn ch­a cã thiªn tö, b¸ch tİnh rÊt chê mong mét minh qu©n thèng nhÊt thiªn h¹")
		return
	end
	GiveItemUI(
		"T¸n d­¬ng Thiªn Tö",
		"§­¬ng kim Thiªn Tö anh minh, th­ëng thiÖn lÖnh ®Ó t¸n d­¬ng",
		"nw_comment_celebrate",
		"Cancel")
end

-- ÃñĞÄÊÇ¸Ë³Ó/ÆÀÒéµ±½ñÌì×Ó/ËÌÑïÌì×Ó
function nw_comment_celebrate(count)
	local total_count = 0
	for i = 1, count do
		local item = GetGiveItemUnit(i);
		local genre, detail, particular = GetItemProp(item)
		if (genre ~= 6 or detail ~= 1 or particular ~= 197) then
			Say("ChØ cã thÓ dïng th­ëng thiÖn lÖnh ®Ó t¸n d­¬ng Thiªn Tö")
			return
		else
			total_count = total_count + GetItemStackCount(item)
		end
	end
	for i = 1, count do
		local item = GetGiveItemUnit(i);
		RemoveItemByIndex(item)
	end
	NW_RemarkEmperor(total_count)
	nw_comment_query()
end

-- ÃñĞÄÊÇ¸Ë³Ó/ÆÀÒéµ±½ñÌì×Ó/µ¯ÛÀÌì×Ó£º¸øÓè½çÃæ
function nw_comment_criticizedlg()
	local emperor = NW_GetEmperorName()
	if (emperor == "") then
		Say("HiÖn t¹i vÉn ch­a cã thiªn tö, b¸ch tİnh rÊt chê mong mét minh qu©n thèng nhÊt thiªn h¹")
		return
	end
	GiveItemUI(
		"Tè c¸o Thiªn Tö",
		"§­¬ng kim thiªn tö v« ®øc, ph¹t ¸c lÖnh ®Ó tè c¸o",
		"nw_comment_criticize",
		"Cancel")
end

-- ÃñĞÄÊÇ¸Ë³Ó/ÆÀÒéµ±½ñÌì×Ó/µ¯ÛÀÌì×Ó
function nw_comment_criticize(count)
	local total_count = 0
	for i = 1, count do
		local item = GetGiveItemUnit(i);
		local genre, detail, particular = GetItemProp(item)
		if (genre ~= 6 or detail ~= 1 or particular ~= 198) then
			Say("ChØ cã thÓ dïng ph¹t ¸c lÖnh tè c¸o Thiªn Tö")
			return
		else
			total_count = total_count + GetItemStackCount(item)
		end
	end
	for i = 1, count do
		local item = GetGiveItemUnit(i);
		RemoveItemByIndex(item)
	end
	NW_RemarkEmperor(-total_count)
	nw_comment_query()
end

tbHistoryScoreTitle = 
{
    [1] = {nValue = -3000, strTitle = "H«n qu©n"},
    [2] = {nValue = -1001, strTitle = "Dung qu©n"},
    [3] = {nValue = -101, strTitle = "V« vŞ"},
    [4] = {nValue = 100, strTitle = "Thanh tŞnh"},
    [5] = {nValue = 1000, strTitle = "H÷u vŞ"},
    [6] = {nValue = 3000, strTitle = "Minh qu©n"},
    [7] = {nValue = 3000, strTitle = "Th¸nh Qu©n"},
}

tbHistoryCapital = 
{
    [0] = "BiÖn Kinh",
    [1] = "L©m An",
}

function history_page_gen(tb_pageinfo, str_parameter)
    local strContent;
    local tbOption = {"Rêi khái/Cancel",};
    local tbContent = {};
    local tbTianzi = {}
	
	for i = tb_pageinfo.from, tb_pageinfo.to do
	    local strGeneration;
	    tbTianzi.szEmperor, _, tbTianzi.szTitle, tbTianzi.szTong, tbTianzi.nBeginTime, tbTianzi.nSide, tbTianzi.nScore, tbTianzi.nEndTime = NW_EmperorHistory(tb_pageinfo.total - i + 1, str_parameter);
	    local strEmperor;
	    local strBeginTime;
	    local strEndTime;
	    local strTitle;
	    local strTong;
	    local strScore;
	    local strCapital;
	    
	    if (tbTianzi.nEndTime == 0) then
	        strGeneration = "§­¬ng kim th¸nh th­îng";
	    else
	        strGeneration = format("Thiªn Tö ®êi thø <color=red>%d<color>", tb_pageinfo.total - i + 1);
	    end
	    
	    if(tbTianzi.szEmperor == nil or tbTianzi.szEmperor == "") then
            strEmperor = "V« hÖ ";
	        strTitle = "V« hÖ ";
	        strBeginTime = "<color=yellow>V«<color>";
	        strEndTime = "<color=yellow>V«<color>";
	        strTong = "V« hÖ ";
	        strScore = "V« hÖ "
	        strCapital = "V« hÖ "
	    else
	        strEmperor = tbTianzi.szEmperor;
	        strTitle = tbTianzi.szTitle;
	        strBeginTime = format("<color=green>%d<color> n¨m <color=green>%02d<color> th¸ng <color=green>%02d<color> ngµy", floor(tbTianzi.nBeginTime/10000), floor(mod(tbTianzi.nBeginTime,10000)/100), mod(tbTianzi.nBeginTime,100));
	        if (tbTianzi.nEndTime == 0) then
	            strEndTime = "<color=yellow>V«<color>";
	        else
	            strEndTime = format("<color=green>%d<color> n¨m <color=green>%02d<color> th¸ng <color=green>%02d<color> ngµy", floor(tbTianzi.nEndTime/10000), floor(mod(tbTianzi.nEndTime,10000)/100), mod(tbTianzi.nEndTime,100));
	        end
	        
	        strTong = tbTianzi.szTong;
	        for j = 1, getn(tbHistoryScoreTitle) do
                if ((strScore == nil or strScore == "") and tbTianzi.nScore <= tbHistoryScoreTitle[j].nValue) then
                    strScore = tbHistoryScoreTitle[j].strTitle;
                end
            end
            if (strScore == nil or strScore == "") then
                strScore = tbHistoryScoreTitle[getn(tbHistoryScoreTitle)].strTitle;
            end
            strCapital = tbHistoryCapital[tbTianzi.nSide];
	    end
	    tbContent[getn(tbContent) + 1] = 
        {
            format("%s: <color=yellow>%s<color>", strGeneration, strEmperor),
        }
        tbContent[getn(tbContent) + 1] = 
        {
			format("Quèc hiÖu: <color=yellow>%s<color>", strTitle),
        }
        tbContent[getn(tbContent) + 1] = 
        {
            format("§¨ng quang: %s", strBeginTime),
        }   
        tbContent[getn(tbContent) + 1] = 
        {
			format("Bang héi: <color=yellow>%s<color>", strTong),
        }      
        tbContent[getn(tbContent) + 1] = 
        {
            format("Tho¸i vŞ: %s", strEndTime),
        }
        tbContent[getn(tbContent) + 1] = 
        {
            format("Hoµng thµnh: <color=yellow>%s<color>", strCapital),
        }
        tbContent[getn(tbContent) + 1] = 
        {
            format("Ng­êi ®êi ®¸nh gi¸: <color=yellow>%s<color>", strScore),
        }
        tbContent[getn(tbContent) + 1] = 
        {
            "--------------------------------------------",
        }
	end
   
    local var_width = {50}
    local var_align = 1
	
	strContent = maketable(tbContent, var_width, var_align);
	
    return strContent, tbOption;
end
-- Ìú±ÊÖ±Êé/Ìì×ÓÊ·¼Ç
function nw_history_emperor()
	saypage(NW_EmperorHistoryCount(), 3, "history_page_gen", -1);
end

-- Ìú±ÊÖ±Êé/ËÎ¹úÊ·¼Ç
function nw_history_song()
	saypage(NW_EmperorHistoryCount(1), 3, "history_page_gen", 1);
end

-- Ìú±ÊÖ±Êé/½ğ¹úÊ·¼Ç
function nw_history_jin()
	saypage(NW_EmperorHistoryCount(0), 3, "history_page_gen", 0);
end

-- ¹úÍõÚ¯Êé/·Ö·â´ó³¼
function nw_kingorder_instate()
	Say("Xin h·y bæ vµ miÔn nhiÖm ®¹i thÇn t¹i giao diÖn bang héi")
end

-- ¹úÍõÚ¯Êé/µ÷ÕûË°ÂÊ¶Ô»°
function nw_kingorder_taxdlg()
	city = GetCityArea()
	tong, master = GetCityOwner(city)
	if ((city ~= CITYIDX_LINAN and city ~= CITYIDX_BIANJING) or master ~= GetName()) then
		Say("§Æt ®Şnh thuÕ suÊt kinh thµnh lµ ®Æc quyÒn cña quèc chñ.")
		return
	end
	Say("BÖ h¹ cã muèn ®Æt thuÕ suÊt míi kh«ng?",
		2,
		"Tu©n lÖnh!/nw_kingorder_tax",
		"Kh«ng /Cancel")
end

-- ¹úÍõÚ¯Êé/µ÷ÕûË°ÂÊ¶Ô»°
function nw_kingorder_tax()
	city = GetCityArea()
	OpenCityManageUI(city)
end

function VnEmperorNewAward()	
	local nWeek = tonumber(GetLocalDate("%w"));	 
	local nTime = tonumber(GetLocalDate("%H%M%S"));
	local nHour = tonumber(GetLocalDate("%H"));		
	city = GetCityArea()
	if (city ~= CITYIDX_LINAN and city ~= CITYIDX_BIANJING) then
		Say("N¬i ®©y lÏ nµo kh«ng thuéc khu vùc tèng kim?")
		return
	elseif (NW_IsEmperor() ~= 1) then
		Say("<color=red>PhÇn th­ëng cña thiªn tö<color> chØ cã thÓ Thiªn Tö míi nhËn ®­îc, ng­¬i lµ ai mµ d¸m m¹o danh Thiªn Tö!")
		return
	elseif (NW_GetTask(NW_TASKNO_GETEMPIRERING) ~= 0) then
		Say("BÖ h¹ ®· nhËn th­ëng råi.")
		return
	elseif (nWeek == 1 and nTime >= 120000 and nTime <= 223000) then
		Say("ChiÕn sù cÊp b¸o, xin mêi bÖ h¹ chuÈn bŞ nghªnh chiÕn.")
		return				
	end	
	if CountFreeRoomByWH(3, 3) < 1 then
		Talk(1, "", "§Ó b¶o ®¶m tµi s¶n cña ®¹i hiÖp, xin h·y ®Ó trèng 1 3x3 hµnh trang")
		return
	end
	NW_SetTask(NW_TASKNO_GETEMPIRERING, 1)
	if NW_GetTask(NW_TASKNO_GETEMPIRERING) ~= 1 then
		return
	end
	VnEmperorGiveAward()
end

function VnEmperorGiveAward()
	local tbNewAward = {
		["VoDanhGioiChi"] = {
			{tbProp={0,3621},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3622},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3623},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3624},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3625},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3626},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3627},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3628},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3629},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3630},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3631},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3632},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3633},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3634},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3635},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
		},
		["VoDanhChiHoan"] = {
			{tbProp={0,3636},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3637},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3638},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3639},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3640},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3641},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3642},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3643},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3644},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3645},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3646},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3647},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3648},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3649},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
			{tbProp={0,3650},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=10080},
		},
	}
	local tbHorseAward = {szName="Phong V©n ChiÕn M·",tbProp={0,10,20,1,0,0},nCount=1,nExpiredTime=10080, nBindState = -2}
	local nRand1 = random(1, 15)
	local nRand2 = random(1, 15)
	local tbFinalAward = {
		[1] = tbNewAward["VoDanhGioiChi"][nRand1],
		[2] = tbNewAward["VoDanhChiHoan"][nRand2],
		[3] = tbHorseAward,
	}
	tbAwardTemplet:Give(tbFinalAward, 1, {"ThienTu","NhanPhanThuongThienTu"})
end