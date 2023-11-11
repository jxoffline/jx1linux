Include("\\script\\lib\\common.lua")
Include("\\script\\global\\rename_head.lua")

--»î¶¯¶¨Òå
EVENTS_TB = {
--	{
--		--ÏÔÊ¾»î¶¯Ìõ¼ş
--		ndate = {051101, 051131},	--ÆğÖ¹ÈÕÆÚ£¬¿ÉÑ¡
--		ntime = {2000, 2359},		--ÆğÖ¹Ê±¼ä£¬¿ÉÑ¡
--		level = {1, 200},			--ÆğÖ¹¼¶±ğ£¬¿ÉÑ¡
--		taskequal = {taskid, taskvalue},	--ÈÎÎñ±äÁ¿ÏàµÈ£¬¿ÉÑ¡
--		tasknot = {taskid, taskvalue},		--ÈÎÎñ±äÁ¿²»µÈ£¬¿ÉÑ¡
--		checkfunc = func			--¼ì²âº¯Êı£¬¿ÉÑ¡¡£º¯Êı·µ»Ønil±íÊ¾²»´¥·¢£¬·ñÔò´¥·¢
--		
--		--»î¶¯ÃèÊö
--		name = "Ä³Ä³»î¶¯",			--»î¶¯Ãû³Æ£¬±ØĞè
--		describe = "¼òµ¥ËµÃ÷ÎÄ×Ö",	--»î¶¯ËµÃ÷£¬Ò²¿ÉÒÔÓÃÒ»¸öº¯Êı·µ»Ø×Ö·û´®£¬¿ÉÑ¡
--		detail =
--[[¡¡¡¡ÕâÀï¿ÉÒÔĞ´ºÜ¶àÎÄ×Ö£¬ÏêÏ¸ÃèÊöÄãµÄ»î¶¯¡£
--¡¡¡¡·½À¨ºÅµÄĞÎÊ½¿ÉÒÔ×ÔÓÉ»»ĞĞ¡£
--¡¡¡¡Ò²¿ÉÒÔÓÃÒ»¸öº¯Êı·µ»Ø×Ö·û´®]],	--»î¶¯ÏêÇé£¬¿ÉÑ¡ \___¶şÕßÖ»¿ÉÑ¡ÆäÒ»
--		callback = nil,				--»Øµ÷º¯Êı£¬¿ÉÑ¡ /
--		link = nil,					--Describe¶Ô»°linkĞÅÏ¢£¬¿ÉÑ¡£¨Ê¹ÓÃdetailÊ±ÓĞĞ§£©
--	},
	{
		ndate = {070414,070424},
		name = "Mïng 3 th¸ng 3",
		describe = "Tõ ngµy <color=yellow>14/4/2007<color> ®Õn <color=yellow>24/4/2007<color>, trong thêi gian ho¹t ®éng, tÊt c¶ ng­êi ch¬i trong qu¸ tr×nh ®¸nh qu¸i luyÖn c«ng sÏ cã c¬ héi nhÆt ®­îc <color=yellow>Tói hµng hãa<color>. Mang tói hµng hãa vµ ng©n l­îng ®Õn NPC B¸n hµng rong t¹i c¸c ®¹i thµnh thŞ ®Ó ®æi lÊy <color=yellow>Bao ®ùng nguyªn liÖu<color>.",
	},
	{	--3¼¶ÒÔÇ°ÁúÎå½ÌÓıÈÎÎñ
		level = {1, 3},
		tasknot = {1014, 2},
		name = "NhiÖm vô s¬ nhËp ",
		describe = "Long Ngò cung cÊp nhiÖm vô S¬ nhËp",
		callback = Uworld1000_word,
	},
	{	--ÎäÁÖÁªÈü¡ª¡ªĞÂĞã
		level = {80, 119},
		name = "Vâ l©m liªn ®Êu, vâ l©m liªn ®Êu 'KiÖt xuÊt'",
		describe = "B¹n cã thÓ ®Õn gÆp Quan viªn b¸o danh tham gia liªn ®Êu Vâ l©m.",
		detail =
[[Vâ l©m tû vâ ®ang trong giai ®o¹n chuÈn bŞ. §¼ng cÊp cña b¹n cã thÓ tham gia <color=yellow>Vâ L©m T©n Tó Liªn Tr¹i<color>.
VŞ trİ cña Sø gi¶ liªn ®Êu t©n tó lµ: <color=yellow>BiÖn Kinh (222, 191)<color>, <color=yellow>L©m An (182, 204)<color>.]],
	},
	{	--ÎäÁÖÁªÈü¡ª¡ª¸ß¼¶
		level = {120, 200},
		name = "Vâ l©m liªn ®Êu, vâ l©m liªn ®Êu 'KiÖt xuÊt'",
		describe = "B¹n cã thÓ ®Õn gÆp Quan viªn b¸o danh tham gia liªn ®Êu Vâ l©m.",
		detail =
[[Vâ l©m tû vâ ®ang trong giai ®o¹n chuÈn bŞ. §¼ng cÊp cña b¹n cã thÓ tham gia <color=yellow>Vâ L©m Liªn Tr¹i<color>.
VŞ trİ cña Sø gi¶ liªn ®Êu lµ: <color=yellow>§¹i Lı (200, 197)<color>, <color=yellow>D­¬ng Ch©u (219, 190)<color>.]],
	},
	{	--»Ô»ÍÖ®Ò¹
		name = "§ªm Huy Hoµng",
		describe = "Vâ L©m Minh chñ §éc C« KiÕm  më ho¹t ®éng mang tªn '§ªm Huy Hoµng' vµo mçi tèi 7 giê 30 phót. ",
		detail =
[[Tr­íc m¾t lµ thêi gian m­a thuËn giã hßa. §Ó ®¸p t¹ thŞnh t×nh cña c¸c nh©n sü vâ l©m trªn giang hå, Vâ l©m minh chñ truyÒn nh©n më ra ho¹t ®éng '§ªm Huy Hoµng'. Ho¹t ®éng b¾t ®Çu vµo 19h30 mçi tèi. Mçi ®ît ho¹t ®éng diÔn ra trong 30 phót. Néi dung cô thÓ cã thÓ ®Õn t×m LÔ Quan ®Ó t×m hiÓu.]],
	},

	-- {
	-- 	name = "<#>½ÇÉ«¸ÄÃû",
	-- 	describe = "<#>ÓÉÓÚÔÚ²¢·ş¹ı³ÌÖĞ£¬ÄúµÄ½ÇÉ«ÃûÓëÆäËûÍæ¼ÒµÄ½ÇÉ«Ãû³öÏÖÁËÖØÃûÇé¿ö£¬Òò´ËÏµÍ³ÒÑ°ïÄú×Ô¶¯¸üÃû£¬Èç¹ûÄúĞèÒªÖØĞÂ¸Ä±ä½ÇÉ«ÃûµÄ»°£¬Çëµ½¸÷ĞÂÊÖ´åµÄĞÂÊÖÍÆ¹ãÔ±´¦Ñ¡ÔñĞŞ¸Ä½ÇÉ«Ãû¡£ÄúÖ»ÄÜ¸ü¸ÄÒ»´Î½ÇÉ«Ãû£¬ËùÒÔÇë×ĞÏ¸ÔÄ¶ÁÏàÓ¦ËµÃ÷¡£",
	-- },
	-- {
	-- 	name = "<#>°ï»á¸ÄÃû",
	-- 	describe = "ÓÉÓÚÔÚ²¢·ş¹ı³ÌÖĞ£¬ÄúËùÔÚµÄ°ï»á£¬°ï»áÃûÓëÆäËû°ï»áÃû³öÏÖÁËÖØÃûÇé¿ö£¬Òò´ËÏµÍ³ÒÑ°ïÄúËùÔÚµÄ°ï»á×Ô¶¯¸üÃû£¬Èç¹û°ïÖ÷ĞèÒªÖØĞÂ¸Ä±ä°ï»áÃûµÄ»°£¬Çëµ½¸÷ĞÂÊÖ´åµÄĞÂÊÖÍÆ¹ãÔ±´¦Ñ¡ÔñĞŞ¸Ä°ï»áÃû¡£°ïÖ÷Ö»ÄÜ¸ü¸ÄÒ»´Î°ï»áÃû£¬ËùÒÔÇë×ĞÏ¸ÔÄ¶ÁÏàÓ¦ËµÃ÷¡£",
	-- },
}

EVENT_HINT_LINK = "<link=image[0,1]:\\spr\\npcres\\enemy\\enemy060\\enemy060_st.spr>C¸c ho¹t ®éng gÇn ®©y ®­îc s¾p xÕp:<link>"
EVENT_HINT_TIMES = 3	--Ã¿ÌìÉÏÏßÌáÊ¾´ÎÊı

--Èç¹ûÓĞ½Ï¸´ÔÓµÄ»î¶¯ĞèÒª×Ô¶¨ÒåÒ»Ğ©º¯Êı¡£ÇëÔÚÏÂÃæInclude£¬²¢Ê¹ÓÃ£º
--	if EVENTS_TB then EVENTS_TB[getn(EVENTS_TB)+1] = {¡­¡­} end
--µÄ·½Ê½Ìí¼Ó
--=================================================================
Include("\\script\\task\\newtask\\education\\dragonfive.lua")
Include("\\script\\event\\great_night\\huangzhizhang\\event.lua")
--=================================================================

--µÇÂ½Ê±µ÷ÓÃµÄº¯Êı
function event_hint_login(bExchangeIn)
	-- ¿ç·ş¹ıÀ´µÄ¾Í²»ÓÃÔÙÌáÊ¾ÁË
	if (bExchangeIn == 1) then
		return
	end
	local n_date = tonumber(GetLocalDate("%y%m%d"));
	local n_time = tonumber(GetLocalDate("%H%M"));
	local n_times;
	if (GetTask(2308) ~= n_date) then	--²»ÊÇ½ñÌìµÇÂ½µÄ
		SetTask(2308, n_date);
		SetTask(2309, 0);
		n_times = 0;
	else
		n_times = GetTask(2309);
	end
	if (n_times >= EVENT_HINT_TIMES) then	--ÒÑ´ïµ½ÌáÊ¾´ÎÊı£¬²»ÔÙÌáÊ¾
		return
	end
	
	local n_level = GetLevel();
	local tb = {};
	for i = 1, getn(EVENTS_TB) do
		if event_hint_check(EVENTS_TB[i], n_date, n_time, n_level) then	--·ûºÏÌõ¼ş
			tb[getn(tb)+1] = i;
		end
	end
	if (getn(tb) == 1) then	--Ö»ÓĞÒ»¸ö»î¶¯£¬Ö±½ÓÏÔÊ¾ÏêÇé
		event_show_detail(tb, 1);
	elseif (getn(tb) > 0) then	--¶à¸ö»î¶¯
		event_show_all(tb);
	end
	
	SetTask(2309, n_times + 1)
	
	bingfu_hint()	--²¢·ş¸üÃû£¬ÁÙÊ±Ìí¼ÓµÄ¸ßÓÅÏÈ¼¶ÉÏÏßÌáÊ¾£¬²»ÊôÓÚ¹æ·¶µÄÊ¹ÓÃ
end

--¼ì²éÄ³¸ö»î¶¯ÊÇ·ñĞèÒªÍ¨Öªµ±Ç°Íæ¼Ò
function event_hint_check(tb_event, n_date, n_time, n_level)
	local tb = tb_event.ndate;
	if (tb) then	--ÏŞ¶¨ÈÕÆÚ
		if (n_date < tb[1] or n_date > tb[2]) then	--ÈÕÆÚ²»·û
			return
		end			
	end
	tb = tb_event.ntime;
	if (tb) then	--ÏŞ¶¨Ê±¼ä
		if (n_time < tb[1] or n_time > tb[2]) then	--ÈÕÆÚ²»·û
			return
		end			
	end
	tb = tb_event.level;
	if (tb) then	--ÏŞ¶¨¼¶±ğ
		if (n_level < tb[1] or n_level > tb[2]) then	--¼¶±ğ²»·û
			return
		end			
	end
	tb = tb_event.taskequal
	if (tb) then	--ÈÎÎñ±äÁ¿ÏàµÈ
		if (GetTask(tb[1]) ~= tb[2]) then
			return
		end			
	end
	tb = tb_event.tasknot
	if (tb) then	--ÈÎÎñ±äÁ¿²»µÈ
		if (GetTask(tb[1]) == tb[2]) then
			return
		end			
	end
	local func = tb_event.checkfunc
	if (func) then	--º¯ÊıÅĞ¶Ï
		if (not func()) then
			return
		end			
	end
	return 1
end

--ÏÔÊ¾ËùÓĞ»î¶¯
function event_show_all(tb)
	local str = "<enter>";
	local tb_option = {};
	for i = 1, getn(tb) do
		local tb_event = EVENTS_TB[tb[i]];
		str = str .. "<color=red>" .. tb_event.name .. "<color><enter>";
		if (tb_event.describe) then
			local str_des
			if (type(tb_event.describe) == "function") then
				str_des = tb_event.describe()
			else
				str_des = tostring(tb_event.describe)
			end
			str = str .. "  " .. str_des .. "<color><enter>";
		end
		if (tb_event.detail or tb_event.callback) then
			tb_option[getn(tb_option)+1] = tb_event.name.."Chi tiÕt/#event_show_detail({"..join(tb).."},"..i..")";
		end
	end
	tb_option[getn(tb_option)+1] = "H«m nay khái nh¾c nhë ta/event_hint_stop";
	tb_option[getn(tb_option)+1] = "Ta biÕt råi!/no";
	Describe(EVENT_HINT_LINK..str, getn(tb_option), tb_option);
end

--ÏÔÊ¾Ä³Ò»Ö¸¶¨»î¶¯ÏêÇé£¨È«²¿£¬µ±Ç°µÚ¼¸¸ö£©
function event_show_detail(tb, n)
	local tb_event = EVENTS_TB[tb[n]];
	if (tb_event.callback) then
		tb_event.callback();
	else
		local str = "<enter><color=red>"..tb_event.name.."<color><enter>"
		local tb_option = {};
		if (getn(tb) > 1) then
			tb_option[1] = "ta cßn muèn  t×m hiÓu c¸c ho¹t ®éng kh¸c/#event_show_all({"..join(tb).."})";
		end
		tb_option[getn(tb_option)+1] = "H«m nay khái nh¾c nhë ta/event_hint_stop";
		tb_option[getn(tb_option)+1] = "Ta biÕt råi!/no";
		if (tb_event.link) then
			str = tb_event.link .. str
		else
			str = EVENT_HINT_LINK .. str
		end
		if (tb_event.detail) then
			if (type(tb_event.detail) == "function") then
				str = str .. tb_event.detail()
			else
				str = str .. tb_event.detail
			end
		elseif (tb_event.describe) then
			if (type(tb_event.describe) == "function") then
				str = str .. tb_event.describe()
			else
				str = str .. tostring(tb_event.describe)
			end
		end
		Describe(str, getn(tb_option), tb_option);
	end
end

function event_hint_stop()
	SetTask(2309, EVENT_HINT_TIMES);
end

function bingfu_hint()
	-- ½ÇÉ«¸ÄÃûÌáÊ¾
	local msg = ""
	if (check_renamerole() == 1) then
		msg = msg .. "<#>Trong qu¸ tr×nh s¸t nhËp m¸y chñ, hÖ thèng ®· tù ®éng ®æi tªn nh©n vËt cho b¹n. H·y ®Õn NPC Sø gi¶ t¹i c¸c t©n thñ th«n ®Ó <color=red>®æi l¹i tªn nh©n vËt<color> b¹n muèn."
	end
	-- °ï»á¸ÄÃûÌáÊ¾
	if (check_renametong() == 1) then
		msg = msg .. "<#>Trong qu¸ tr×nh s¸t nhËp m¸y chñ, hÖ thèng ®· tù ®éng ®æi tªn bang héi cña b¹n. H·y ®Õn NPC Sø gi¶ t¹i c¸c t©n thñ th«n ®Ó <color=red>®æi l¹i tªn bang héi<color> b¹n muèn."
	end
	if (check_castellan_remedy() == 1) then
		msg = msg .. "<#>Trong qu¸ tr×nh s¸t nhËp m¸y chñ, hÖ thèng ®· tù ®éng t­íc ®i quyÒn thèng trŞ thµnh thŞ cña bang héi b¹n. H·y ®Õn NPC Sø gi¶ t¹i c¸c t©n thñ th«n ®Ó <color=red>NhËn l¹i båi th­êng t­¬ng øng<color>. Chøc n¨ng nµy chØ cã hiÖu lùc trong vßng <color=red>1 th¸ng kÓ tõ khi s¸t nhËp m¸y chñ<color>."
	end
	
	if (msg ~= "") then
		Say(msg, 1, "<#> BiÕt råi!/cancel")
	end
end

if login_add then login_add(event_hint_login, 0) end

