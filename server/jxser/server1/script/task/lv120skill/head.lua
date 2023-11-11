Include("\\script\\global\\login_head.lua")
-- 120¼¶¼¼ÄÜÈÎÎñÍ·ÎÄ¼ş

LV120_SKILL_STATE = 2450	-- ´æ·Åµ±Ç°ÈÎÎñ×´Ì¬µÄÈ«¾ÖÈÎÎñ±äÁ¿£¬³õÊ¼ÖµÎª1£¬Îª0±íÊ¾ÈÎÎñÒÑ¾­Íê³É
LV120_SKILL_ID = 2463		-- ¼ÍÂ¼Íæ¼Ò120¼¶¼¼ÄÜID
LOCK_MAP_SEQUENCE =		-- ´æ·Å½âËøÍ¼Ë³ĞòµÄÈ«¾ÖÈÎÎñ±äÁ¿
{
	{2451, 2452, 2453, 2454, 2455, 2456},	-- µÚÒ»ÖØËø½âËøÍ¼Ë³Ğò
	{2457, 2458, 2459, 2460, 2461, 2462},	-- µÚ¶şÖØËø½âËøÍ¼Ë³Ğò
}

DGJ_WULINMIJI	= {6, 1, 1120}	-- ²»Ì«Ñ°³£µÄÎäÁÖÃØ¼®
COFFIN_MAP		= {6, 1, 1119}	-- ãê¾©¶«²¿ÊÂ·¢µãµØÍ¼
COFFIN			= {6, 1, 1121}	-- ÉñÃØ¹×Ä¾
LOCK_MAP1		= {6, 1, 1122}	-- ¹×Ä¾½âËøÍ¼ µÚÒ»ÖØËø
LOCK_MAP2		= {6, 1, 1123}	-- ¹×Ä¾½âËøÍ¼ µÚ¶şÖØËø
CADAVER			= {6, 1, 1124}	-- ÆæÒìËÀÊ¬
LV120SKILLBOOK	= {6, 1, 1125}	-- 120¼¶¼¼ÄÜ¾÷Òª

COFFIN_POSITION = {37, 1832, 3439, 6, 6}	-- ¹×²ÄËùÔÚÎ»ÖÃ{µØÍ¼, X×ø±ê, Y×ø±ê, XÎó²î, YÎó²î}

LV120SKILL_NEW_NPC =	-- ĞÂ½¨NPCÁĞ±í
{	-- ¸ñÊ½ {NpcId, MapId, X, Y, Name, Script},
	{1203, 57, 1583, 3203, " ", "\\script\\task\\lv120skill\\npc\\ºâÉ½´óÌü_¶À¹Â½£µÄÎäÁÖÃØ¼®.lua"},
}

ORG_WULIMIJI	= {6, 1, 26}		-- ÆÕÍ¨µÄÎäÁÖÃØ¼®
BANRUOXINJING	= {6, 1, 12}		-- °ãÈôĞÄ¾­
XISUIJING		= {6, 1, 22}		-- Ï´Ëè¾­
XINGHONGBAOSHI	= {4, 353, 1}		-- ĞÉºì±¦Ê¯
CRYSTAL =
{
	{4, 238, 1},		-- À¶Ë®¾§
	{4, 239, 1},		-- ×ÏË®¾§
	{4, 240, 1},		-- ÂÌË®¾§
}
BLUE_C = 1
PURPLE_C = 2
GREEN_C = 3

LOCK_MAP1_KEY =			-- µÚÒ»ÖØËø´ğ°¸
{
	{1,  CRYSTAL[GREEN_C]},
	{3,  CRYSTAL[PURPLE_C]},
	{11, CRYSTAL[BLUE_C]},
	{14, CRYSTAL[BLUE_C]},
	{22, CRYSTAL[PURPLE_C]},
	{24, CRYSTAL[GREEN_C]},
}

LOCK_MAP2_KEY =			-- µÚ¶şÖØËø´ğ°¸
{
	{2,  CRYSTAL[GREEN_C]},
	{6,  CRYSTAL[PURPLE_C]},
	{10, CRYSTAL[BLUE_C]},
	{15, CRYSTAL[BLUE_C]},
	{19, CRYSTAL[GREEN_C]},
	{23, CRYSTAL[PURPLE_C]},
}

FACTION_TEXT = 			-- ÃÅÅÉÏà¹ØÎÄ±¾¶¨Òå
{
	[0] = {"<link=image[0,14]:\\spr\\npcres\\enemy\\enemy037\\enemy037_pst.spr>", "HuyÒn nh©n ph­¬ng tr­îng", "Ph­¬ng tr­îng"},	-- ÉÙÁÖ
	[1] = {"<link=image[0,11]:\\spr\\npcres\\enemy\\enemy084\\enemy084_pst.spr>", "D­¬ng Anh", "Bang chñ "},		-- ÌìÍõ
	[2] = {"<link=image[0,13]:\\spr\\npcres\\enemy\\enemy077\\enemy077_pst.spr>", "§­êng Cõu", "Ch­ëng m«n"},		-- ÌÆÃÅ
	[3] = {"<link=image[0,12]:\\spr\\npcres\\enemy\\enemy091\\enemy091_pst.spr>", "H¾c DiÖn Lang Qu©n", "Gi¸o chñ"},	-- Îå¶¾
	[4] = {"<link=image[0,11]:\\spr\\npcres\\enemy\\enemy055\\enemy055_pst.spr>", "Thanh HiÓu S­ Th¸i ", "Ch­ëng m«n"},	-- ¶ëáÒ
	[5] = {"<link=image[0,9]:\\spr\\npcres\\enemy\\enemy098\\enemy098_pst.spr>", "Do·n Hµm Yªn", "Ch­ëng m«n"},		-- ´äÑÌ
	[6] = {"<link=image[0,19]:\\spr\\npcres\\enemy\\enemy071\\enemy071_pst.spr>", "Hµ Nh©n Ng· ", "Bang chñ "},	-- Ø¤°ï
	[7] = {"<link=image[0,9]:\\spr\\npcres\\enemy\\enemy103\\enemy103_pst.spr>", "Hoµn Nhan Hoµnh LiÖt", "Gi¸o chñ"},	-- ÌìÈÌ
	[8] = {"<link=image[0,13]:\\spr\\npcres\\enemy\\enemy046\\enemy046_pst.spr>", "§¹o NhÊt Ch©n Nh©n", "Ch­ëng m«n"},	-- Îäµ±
	[9] = {"<link=image[0,22]:\\spr\\npcres\\enemy\\enemy065\\enemy065_pst.spr>", "TuyÒn C¬ Tö ", "Ch­ëng m«n"},	-- À¥ÂØ
}

FACTION_BOOK =			-- ÃÅÅÉ¼¼ÄÜÊé
{
	[0] = {{6, 1, 56}, {6, 1, 57}, {6, 1, 58}},				-- ÉÙÁÖ
	[1] = {{6, 1, 37}, {6, 1, 38}, {6, 1, 39}},				-- ÌìÍõ
	[2] = {{6, 1, 27}, {6, 1, 28}, {6, 1, 45}, {6, 1, 46}},	-- ÌÆÃÅ
	[3] = {{6, 1, 47}, {6, 1, 48}, {6, 1, 49}},				-- Îå¶¾
	[4] = {{6, 1, 42}, {6, 1, 43}, {6, 1, 59}},				-- ¶ëáÒ
	[5] = {{6, 1, 40}, {6, 1, 41}},							-- ´äÑÌ
	[6] = {{6, 1, 54}, {6, 1, 55}},							-- Ø¤°ï
	[7] = {{6, 1, 35}, {6, 1, 36}, {6, 1, 53}},				-- ÌìÈÌ
	[8] = {{6, 1, 33}, {6, 1, 34}},							-- Îäµ±
	[9] = {{6, 1, 50}, {6, 1, 51}, {6, 1, 52}},				-- À¥ÂØ
}

DIALOG_UI_TEXT =			-- ¶Ô»°UIÏÔÊ¾
{
	{"<link=image[0,10]:\\spr\\npcres\\enemy\\enemy111\\enemy111_pst.spr>", "§éc C« KiÕm"},			-- 1 ¶À¹Â½£
	{"<link=image[0,9]:\\spr\\npcres\\passerby\\passerby040\\passerby040s2.spr>", "Xa phu BiÖn Kinh"},	-- 2 ãê¾©³µ·ò
	{"<link=image[0,9]:\\spr\\npcres\\passerby\\passerby072\\passerby072s1.spr>", "Gi?ThÇn To¸n"},	-- 3 ¼ÖÉñËã
	{"<link=image:\\spr\\Ui3\\120¼¶¼¼ÄÜÈÎÎñ\\task_wulin.spr>", "Vâ L©m MËt TŞch"},						-- 4 ²»Ñ°³£µÄÎäÁÖÃØ¼®
	{"<link=image:\\spr\\Ui3\\120¼¶¼¼ÄÜÈÎÎñ\\bianjing_southeast.spr>", "B¶n ®å n¬i ph¸t sinh sù viÖc xa phu BiÖn Kinh"},	-- 5 ãê¾©¶«²¿ÊÂ·¢µãµØÍ¼
	{"<link=image:\\spr\\Ui3\\120¼¶¼¼ÄÜÈÎÎñ\\task_coffin.spr>", "Quan tµi thÇn bİ"},					-- 6 ÉñÃØ¹×Ä¾
	{"<link=image:\\spr\\Ui3\\120¼¶¼¼ÄÜÈÎÎñ\\task_lockinfo.spr>", "B¶n ®å gi¶i táa quan tµi"},				-- 7 ¹×Ä¾½âËøÍ¼
	{"<link=image:\\spr\\Ui3\\120¼¶¼¼ÄÜÈÎÎñ\\task_corpse.spr>", "C­¬ng Thi"},					-- 8 ÆæÒìËÀÊ¬£¨ÔË¹¦Ç°£©
	{"<link=image:\\spr\\Ui3\\120¼¶¼¼ÄÜÈÎÎñ\\task_corpse1.spr>", "C­¬ng Thi"},					-- 9 ÆæÒìËÀÊ¬£¨ÔË¹¦ºó£©
	{"<link=image:\\spr\\Ui3\\120¼¶¼¼ÄÜÈÎÎñ\\task_stunt.spr>", "Kü n¨ng cÊp 120"},				-- 10 120¼¶¼¼ÄÜ¾öÒª
	{"<link=image:\\spr\\Ui3\\120¼¶¼¼ÄÜÈÎÎñ\\»ú¹ØËø1-01.spr>", "M¶nh 1 b¶n ®å gi¶i táa quan tµi"},			-- 11-16 ¹×Ä¾½âËøÍ¼Ò» ËéÆ¬
	{"<link=image:\\spr\\Ui3\\120¼¶¼¼ÄÜÈÎÎñ\\»ú¹ØËø1-02.spr>", "M¶nh 1 b¶n ®å gi¶i táa quan tµi"},
	{"<link=image:\\spr\\Ui3\\120¼¶¼¼ÄÜÈÎÎñ\\»ú¹ØËø1-03.spr>", "M¶nh 1 b¶n ®å gi¶i táa quan tµi"},
	{"<link=image:\\spr\\Ui3\\120¼¶¼¼ÄÜÈÎÎñ\\»ú¹ØËø1-04.spr>", "M¶nh 1 b¶n ®å gi¶i táa quan tµi"},
	{"<link=image:\\spr\\Ui3\\120¼¶¼¼ÄÜÈÎÎñ\\»ú¹ØËø1-05.spr>", "M¶nh 1 b¶n ®å gi¶i táa quan tµi"},
	{"<link=image:\\spr\\Ui3\\120¼¶¼¼ÄÜÈÎÎñ\\»ú¹ØËø1-06.spr>", "M¶nh 1 b¶n ®å gi¶i táa quan tµi"},
	{"<link=image:\\spr\\Ui3\\120¼¶¼¼ÄÜÈÎÎñ\\»ú¹ØËø2-01.spr>", "M¶nh 2 b¶n ®å gi¶i táa quan tµi"},			-- 17-22 ¹×Ä¾½âËøÍ¼¶ş ËéÆ¬
	{"<link=image:\\spr\\Ui3\\120¼¶¼¼ÄÜÈÎÎñ\\»ú¹ØËø2-02.spr>", "M¶nh 2 b¶n ®å gi¶i táa quan tµi"},
	{"<link=image:\\spr\\Ui3\\120¼¶¼¼ÄÜÈÎÎñ\\»ú¹ØËø2-03.spr>", "M¶nh 2 b¶n ®å gi¶i táa quan tµi"},
	{"<link=image:\\spr\\Ui3\\120¼¶¼¼ÄÜÈÎÎñ\\»ú¹ØËø2-04.spr>", "M¶nh 2 b¶n ®å gi¶i táa quan tµi"},
	{"<link=image:\\spr\\Ui3\\120¼¶¼¼ÄÜÈÎÎñ\\»ú¹ØËø2-05.spr>", "M¶nh 2 b¶n ®å gi¶i táa quan tµi"},
	{"<link=image:\\spr\\Ui3\\120¼¶¼¼ÄÜÈÎÎñ\\»ú¹ØËø2-06.spr>", "M¶nh 2 b¶n ®å gi¶i táa quan tµi"},
}

LV120SKILL_LIST =			-- 120¼¶¼¼ÄÜÁĞ±í
{
	[0] = {709, 1, 0, 120, "Kü n¨ng cÊp 120", "§¹i Thõa Nh­ Lai Chó"},	-- ÉÙÁÖ
	[1] = {708, 1, 1, 120, "Kü n¨ng cÊp 120",	"§¶o H­ Thiªn"},		-- ÌìÍõ
	[2] = {710, 1, 2, 120, "Kü n¨ng cÊp 120",	"Mª ¶nh Tung"},		-- ÌÆÃÅ
	[3] = {711, 1, 3, 120, "Kü n¨ng cÊp 120",	"HÊp Tinh YÓm"},		-- Îå¶¾
	[4] = {712, 1, 4, 120, "Kü n¨ng cÊp 120",	"BÕ NguyÖt PhÊt TrÇn"},	-- ¶ëáÒ
	[5] = {713, 1, 5, 120, "Kü n¨ng cÊp 120",	"Ngù TuyÕt Èn"},		-- ´äÑÌ
	[6] = {714, 1, 6, 120, "Kü n¨ng cÊp 120",	"Hçn Thiªn Khİ C«ng"},	-- Ø¤°ï
	[7] = {715, 1, 7, 120, "Kü n¨ng cÊp 120",	"Ma ¢m PhÖ Ph¸ch"},	-- ÌìÈÌ
	[8] = {716, 1, 8, 120, "Kü n¨ng cÊp 120",	"XuÊt ø BÊt NhiÔm"},	-- Îäµ±
	[9] = {717, 1, 9, 120, "Kü n¨ng cÊp 120",	"L­ìng Nghi Ch©n Khİ"},	-- À¥ÂØ
}

g_DescTable = {}		-- È«¾ÖÁÙÊ±¶Ô»°×Ö·û´®Êı×é

function init_lv120skill()					-- ³õÊ¼»¯ÈÎÎñ
	if (GetTask(LV120_SKILL_STATE) == 0) then
		SetTask(LV120_SKILL_STATE, 1)
	end
	SyncTaskValue(LV120_SKILL_STATE)
	SyncTaskValue(LV120_SKILL_ID);
	lv120skill_debug()	-- ×Ô¶¯´¦ÀíÒì³£
end

function describe_talk(tDialog, szCall)		-- ¶Ô»°º¯Êı
	local i = 0
	if (getn(tDialog) == 0) then return end
	repeat
		i = i + 1
	until (g_DescTable[i] == nil)
	g_DescTable[i] = tDialog
	if (szCall == nil) then szCall = "" end
	describe_basic(1, i, szCall)	
end

function describe_basic(nSeq, idxTable, szCallback)		-- ¶Ô»°µİ¹éº¯Êı£¨ÄÚ²¿£©
	local tDialog = g_DescTable[idxTable]
	if (nSeq == getn(tDialog)) then
		if (szCallback == "") then
			Describe(tDialog[nSeq], 1, "KÕt thóc ®èi tho¹i/quit")
		else
			Describe(tDialog[nSeq], 1, "TiÕp tôc ®èi tho¹i /"..szCallback)
		end
		g_DescTable[idxTable] = nil
		return
	end
	Describe(tDialog[nSeq], 1, "TiÕp tôc ®èi tho¹i /#describe_basic("..(nSeq + 1)..", "..idxTable..", [["..szCallback.."]])")
end

function npc_string(nNpc, szDisplay, bFaction)			-- »ñµÃNPC¶ÔÍæ¼ÒËµ»°µÄ×Ö·û´®
	local tab = DIALOG_UI_TEXT[nNpc]
	if (bFaction ~= nil) then
		tab = FACTION_TEXT[nNpc]
	end
	return tab[1]..tab[2].."<link>:"..szDisplay
end

function speak_string(nNpc, szDisplay, bFaction)		-- »ñµÃÍæ¼Ò¶ÔNPCËùËµ»°µÄ×Ö·û´®
	local tab = DIALOG_UI_TEXT[nNpc]
	if (bFaction ~= nil) then
		tab = FACTION_TEXT[nNpc]
	end
	return tab[1]..GetName().."<link>:"..szDisplay
end

function self_string(nNpc, szDisplay, bFaction)			-- »ñµÃÍæ¼Ò×Ô°××Ö·û´®
	if (nNpc == 0) then		-- 0±íÊ¾ÎŞÍ¼Ê¾
		return "<color=orange>"..szDisplay.."<color>"
	end
	local tab = DIALOG_UI_TEXT[nNpc]
	if (bFaction ~= nil) then
		tab = FACTION_TEXT[nNpc]
	end
	return tab[1].."<link><color=orange>"..szDisplay.."<color>"
end

function add_lv120skillnpc()			-- Ìí¼ÓÈÎÎñNPC
	for i = 1, getn(LV120SKILL_NEW_NPC) do
		local Tab = LV120SKILL_NEW_NPC[i]
		local idxMap = SubWorldID2Idx(Tab[2]);
		if (idxMap >= 0) then
			local idxNpc = AddNpc(Tab[1], 1, idxMap, Tab[3] * 32, Tab[4] * 32, 1, Tab[5])
			SetNpcScript(idxNpc, Tab[6])
		end
	end
end

function generate_sequence(tab)			-- Éú³ÉËæ»úĞòÁĞ

	local nCount = getn(tab)
	local temp, nSeq, bAct = {}, 0, 0

	for i = 1, nCount do
		tinsert(temp, i)
		if (GetTask(tab[i]) < 1) or (GetTask(tab[i]) > getn(tab)) then bAct = 1 end	-- Èç¹ûÓĞ²»ºÏ·¨±àÂëÔòÈ«²¿ÖØ½¨
	end

	if (bAct == 1) then
		for i = 1, nCount do
			nSeq = random(1, getn(temp))
			SetTask(tab[i], temp[nSeq])
			SyncTaskValue(tab[i])
			tremove(temp, nSeq)
		end
	end

end

function add_item(tab)							-- Ìí¼ÓµÀ¾ß
	return AddItem(tab[1], tab[2], tab[3], 1, 0, 0)
end

function display_clip(nLockMap, nSeq, szCall)	-- ÏÔÊ¾Ò»ÕÅËéÆ¬
	local nIndex = 10 + 6 * (nLockMap - 1) + GetTask(LOCK_MAP_SEQUENCE[nLockMap][nSeq])
	Describe(DIALOG_UI_TEXT[nIndex][1]..DIALOG_UI_TEXT[nIndex][2].."<link>", 2, "Trë l¹i/"..szCall, "§ãng/quit")
end

function lv120skill_report()					-- ÏòÕÆÃÅ±¨¸æÇé¿ö
	local tDialog
	local nFaction = GetLastFactionNumber()
	local szCall = FACTION_TEXT[nFaction][3]
	if (nFaction == 0) or (nFaction == 8) or (nFaction == 6) or (nFaction == 4) then	-- ÕıÅÉ
		tDialog =
		{
			npc_string(nFaction, "¸i chµ, th× ra ng­¬i còng ®· biÕt ®­îc c¨n c¬ c©u chuyÖn råi! GÇn ®©y giang hå ®ét nhiªn biÕn ®æi, trong Tèng quèc tõ ®Çu ®Õn cuèi ®Òu bao trïm mét ®¸m m©y u ¸m, ta còng ®· nghi sím ®iÒu nµy, nh­ng v× th©n lµ"..szCall.."  kh«ng tiÖn tæ chøc ®iÒu tra viÖc nµy. Sau ®ã mét sè vŞ Èn sü giang hå cña bæn m«n lÇn l­ît t¸i xuÊt giang hå, ngÊm ngÇm ®iÒu tra sù viÖc nµy. Bän hä ph¸t hiÖn manh mèi cµng ngµy cµng lé râ h¬n, c¸c manh mèi nµy ®Òu ngÊm ngÇm ¸m chØ chñ m­u lµ: Thiªn NhÉn Gi¸o!", 1),
			speak_string(nFaction, "Xem ra ch©n t­íng ®· lé râ hoµn toµn, ®İch thŞ ®©y lµ Thiªn NhÉn chñ m­u! ChØ cã ®iÒu c¸c lo¹i ®éng vËt ph¸t ®iªn vµ c¸c vÕt ®¸nh trªn x¸c chÕt ch­a xuÊt hiÖn trªn giang hå lÇn nµo, ngoµi ra xuÊt hiÖn rÊt nhiÒu con d¬i dŞ th­êng, ph¶i ch¨ng ®©y lµ lo¹i tµ thuËt míi cña Thiªn NhÉn?", 1),
			npc_string(nFaction, "§Ó b¶o vÖ §¹i Tèng vµ b¶o vÖ chİnh nghÜa ta ®· chuÈn bŞ ®èi s¸ch cho viÖc nµy. Ta vµ mét sè cao thñ bÕ quan s¸ng chÕ ra mét chiªu thøc tuyÖt häc th­îng thõa. Ng­¬i th©n thÕ 1 m×nh mµ t×m ra ®­îc mét ®Çu mèi rÊt quan träng, thËt ®¸ng khen th­ëng. Nay ta quyÕt ®Şnh truyÒn ng­¬i mãn vâ c«ng th­îng thõa nµy, hi väng sau nµy ng­¬i lÊy nhiÖm vô cña thiªn h¹ sÏ lµ nhiÖm vô cña m×nh.", 1),
			speak_string(nFaction, "§a t¹ "..szCall.."Tu©n theo"..szCall.."gi¸o huÊn.", 1),
			npc_string(nFaction, "Do thêi gian gÊp g¸p, nªn c«ng lùc cña mãn vâ c«ng nµy chØ truyÒn cho ng­¬i mét phÇn, sau nµy dùa vµo cÇn cï siªng n¨ng cña ng­¬i mµ ph¸t triÓn mãn vâ c«ng nµy lªn.  Chiªu vâ c«ng nµy chØ truyÒn cho ng­¬i, nh÷ng ®Ö tö vµ c¸c m«n ph¸i kh¸c vÉn cßn ch­a ®­îc biÕt ®©u. §Ó tr¸nh tai v¸ch m¹ch dõng,  ta ®· viÕt tÊt c¶ nh÷ng khÈu quyÕt cÇn thiÕt råi, ng­¬i tù nghiªn cøu nhĞ. D­a vµo tè chÊt hiÖn t¹i cña ng­¬i sÏ rÊt dÔ dµng lÜnh ngé. µ ®óng råi,   ng­¬i ®i chuÈn bŞ <color=white> tÊt c¶ kü n¨ng cña bæn m«n thµnh 1 quyÓn<color>.", 1),
			speak_string(nFaction, "Nghe"..szCall.." dÆn dß, ®Ö tö liÒn tøc tèc ®Õn ®©y phôc mÖnh.", 1),
		}
	elseif (nFaction == 2) or (nFaction == 1) or (nFaction == 5) then					-- ÖĞÁ¢
		tDialog =
		{
			npc_string(nFaction, "¸i chµ, th× ra ng­¬i còng ®· biÕt ®­îc c¨n c¬ c©u chuyÖn råi! GÇn ®©y giang hå ®ét nhiªn biÕn ®æi mét c¸ch bÊt th­êng, sù sinh tån cña bæn m«n bao trïm mét ®¸m m©y u ¸m, vÊn ®Ò nµy ta còng ®· liÖu tr­íc, nh­ng v× th©n lµ"..szCall.."  kh«ng tiÖn tæ chøc ®iÒu tra viÖc nµy. Sau ®ã mét sè vŞ Èn sü giang hå cña bæn m«n lÇn l­ît t¸i xuÊt giang hå, ngÊm ngÇm ®iÒu tra sù viÖc nµy. Bän hä ph¸t hiÖn manh mèi cµng ngµy cµng lé râ h¬n, c¸c manh mèi nµy ®Òu ngÊm ngÇm ¸m chØ chñ m­u lµ: Thiªn NhÉn Gi¸o!", 1),
			speak_string(nFaction, "Xem ra ch©n t­íng ®· lé râ hoµn toµn, ®İch thŞ ®©y lµ Thiªn NhÉn chñ m­u! ChØ cã ®iÒu c¸c lo¹i ®éng vËt ph¸t ®iªn vµ c¸c vÕt ®¸nh trªn x¸c chÕt ch­a xuÊt hiÖn trªn giang hå lÇn nµo, ngoµi ra xuÊt hiÖn rÊt nhiÒu con d¬i dŞ th­êng, ph¶i ch¨ng ®©y lµ lo¹i tµ thuËt míi cña Thiªn NhÉn?", 1),
			npc_string(nFaction, "§Ó tr¸nh Thiªn NhÉn g©y bÊt lîi cho ta, ta ®· tiÕn hµnh tİch cùc ©m thÇm ®iÒu tra. Ta vµ mét sè cao thñ bÕ quan s¸ng chÕ ra mét chiªu thøc tuyÖt häc th­îng thõa. Ng­¬i th©n thÕ 1 m×nh mµ t×m ra ®­îc mét ®Çu mèi rÊt quan träng, thËt ®¸ng khen th­ëng. Nay ta quyÕt ®Şnh truyÒn ng­¬i mãn vâ c«ng th­îng thõa nµy, hi väng sau nµy ng­¬i gióp bæn m«n vinh danh thiªn h¹.", 1),
			speak_string(nFaction, "§a t¹ "..szCall.."Tu©n theo"..szCall.."gi¸o huÊn.", 1),
			npc_string(nFaction, "Do thêi gian gÊp g¸p, nªn c«ng lùc cña mãn vâ c«ng nµy chØ truyÒn cho ng­¬i mét phÇn, sau nµy dùa vµo cÇn cï siªng n¨ng cña ng­¬i mµ ph¸t triÓn mãn vâ c«ng nµy lªn.  Chiªu vâ c«ng nµy chØ truyÒn cho ng­¬i, nh÷ng ®Ö tö vµ c¸c m«n ph¸i kh¸c vÉn cßn ch­a ®­îc biÕt ®©u. §Ó tr¸nh tai v¸ch m¹ch dõng,  ta ®· viÕt tÊt c¶ nh÷ng khÈu quyÕt cÇn thiÕt råi, ng­¬i tù nghiªn cøu nhĞ. D­a vµo tè chÊt hiÖn t¹i cña ng­¬i sÏ rÊt dÔ dµng lÜnh ngé. µ ®óng råi,   ng­¬i ®i chuÈn bŞ <color=white> tÊt c¶ kü n¨ng cña bæn m«n thµnh 1 quyÓn<color>.", 1),
			speak_string(nFaction, "Nghe"..szCall.." dÆn dß, ®Ö tö liÒn tøc tèc ®Õn ®©y phôc mÖnh.", 1),
		}
	elseif (nFaction == 3) or (nFaction == 9) then										-- Ğ°ÅÉ
		tDialog =
		{
			npc_string(nFaction, "¸i chµ, th× ra ng­¬i còng ®· biÕt ®­îc c¨n c¬ c©u chuyÖn råi! GÇn ®©y giang hå ®ét nhiªn biÕn ®æi mét c¸ch bÊt th­êng, c¬ héi ®Ó bæn m«n vang danh lóc thêi lo¹n nµy,  nh­ng v× th©n lµ"..szCall.."  kh«ng tiÖn tæ chøc ®iÒu tra viÖc nµy. Sau ®ã mét sè vŞ Èn sü giang hå cña bæn m«n lÇn l­ît t¸i xuÊt giang hå, ngÊm ngÇm ®iÒu tra sù viÖc nµy. Bän hä ph¸t hiÖn manh mèi cµng ngµy cµng lé râ h¬n, c¸c manh mèi nµy ®Òu ngÊm ngÇm ¸m chØ chñ m­u lµ: Thiªn NhÉn Gi¸o!", 1),
			speak_string(nFaction, "Xem ra ch©n t­íng ®· lé râ hoµn toµn, ®İch thŞ ®©y lµ Thiªn NhÉn chñ m­u! ChØ cã ®iÒu c¸c lo¹i ®éng vËt ph¸t ®iªn vµ c¸c vÕt ®¸nh trªn x¸c chÕt ch­a xuÊt hiÖn trªn giang hå lÇn nµo, ngoµi ra xuÊt hiÖn rÊt nhiÒu con d¬i dŞ th­êng, ph¶i ch¨ng ®©y lµ lo¹i tµ thuËt míi cña Thiªn NhÉn?", 1),
			npc_string(nFaction, "Bæn m«n lÏ nµo l¹i lµ ng­êi ®Õn sau? V× v©y ta ®· ngÊm ngÇm ®iÒu tra, ®ång thêi cã dù ®Şnh : kh«ng ®Ó cho Thiªn NhÉn g©y bÊt lîi víi ta, lîi dông thêi thÕ hçn lo¹n næi danh thiªn h¹, vµ lµm anh hïng thêi lo¹n, ha ha ha. Ta vµ mét sè cao thñ bÕ quan s¸ng chÕ ra mét chiªu thøc tuyÖt häc th­îng thõa. Ng­¬i ®¬n th­¬ng ®éc m· mµ ®iÒu tra ®­îc ngän nghµnh nh­ vËy, rÊt ®¸ng khen"..szCall.."N¨m ®ã rÊt nhiÒu anh hïng gan d¹ míi cã thÓ ®¶m ®­¬ng, nh­ng ng­¬i chØ mét th©n mét m×nh ®iÒu tra ®­îc manh mèi quan träng nh­ v¹y, thËt ®¸ng khen th­ëng. Ta quyÕt ®Şnh truyÒn mãn vâ c«ng tuyÖt häc l¹i cho ng­¬i, sau nµy gióp ta vang danh thiªn h¹ nhĞ.", 1),
			speak_string(nFaction, "§a t¹ "..szCall.."Tu©n theo"..szCall.."gi¸o huÊn.", 1),
			npc_string(nFaction, "Do thêi gian gÊp g¸p, nªn c«ng lùc cña mãn vâ c«ng nµy chØ truyÒn cho ng­¬i mét phÇn, sau nµy dùa vµo cÇn cï siªng n¨ng cña ng­¬i mµ ph¸t triÓn mãn vâ c«ng nµy lªn.  Chiªu vâ c«ng nµy chØ truyÒn cho ng­¬i, nh÷ng ®Ö tö vµ c¸c m«n ph¸i kh¸c vÉn cßn ch­a ®­îc biÕt ®©u. §Ó tr¸nh tai v¸ch m¹ch dõng,  ta ®· viÕt tÊt c¶ nh÷ng khÈu quyÕt cÇn thiÕt råi, ng­¬i tù nghiªn cøu nhĞ. D­a vµo tè chÊt hiÖn t¹i cña ng­¬i sÏ rÊt dÔ dµng lÜnh ngé. µ ®óng råi,   ng­¬i ®i chuÈn bŞ <color=white> tÊt c¶ kü n¨ng cña bæn m«n thµnh 1 quyÓn<color>.", 1),
			speak_string(nFaction, "Nghe"..szCall.." dÆn dß, ®Ö tö liÒn tøc tèc ®Õn ®©y phôc mÖnh.", 1),
		}
	elseif (nFaction == 7) then															-- ÌìÈÌ
		tDialog =
		{
			npc_string(nFaction, "ThËt kh«ng hæ danh ®Ö tö cña Thiªn NhÉn Gi¸o, kh«ng cã c¸i g× qua ®­îc m¾t ng­¬i! Thêi gian gÇn ®©y giang hå bçng nhiªn ®¹i lo¹n, thËt kh«ng nghÜ tíi  ®©y lµ nh÷ng hµnh vi nµy cña Thiªn NhÉn Gi¸o ta g©y ra, ha ha. Ng­¬i ®· ®o¸n ®­îc th× ta còng kh«ng giÊu ng­¬i lµm g×.  GÇn ®©y Thiªn NhÉn Gi¸o ®· l«i kĞo kh«ng İt vâ l©m cao thñ ®· Èn danh, luyÖn thµnh 1 thuËt ©m tµ cùc m¹nh.  Nh÷ng ®éng vËt ph¸t cuång vµ nh÷ng thi thÓ dŞ th­êng n»m trong q uan tµi lµ thµnh qu¶ cña ta, vµ còng tá râ ®¹i Kim quèc cña chóng ta sÏ tiÕn hµnh mét cuéc chinh ph¹t.", 1),
			speak_string(nFaction, "Gi¸o chñ anh minh, ta sÏ v× ®¹i nghiÖp cña kim quèc tËn t©m tËn lùc thèng nhÊt thiªn h¹.", 1),
			npc_string(nFaction, "LÇn ho¹t ®éng nµy v« cïng kİn ®¸o, tin tøc nµy còng kh«ng lan truyÒn trong m«n ph¸i, cã ng­êi võa míi hĞ lé th«ng tin liÒn tøc th× chÕt lu«n. Nh÷ng x¸c chÕt ®ã lµ nh÷ng gi¸n ®iÖp ph¸i tõ Tèng quèc, võa vÆn ®Ó ta dïng lµm vËt thİ nghiÖm. Ta lµm cÈn thËn nh­ vËy nh­ng còng kh«ng chØ ng­¬i v¹ch trÇn sù viÖc, may mµ ng­¬i lµ ng­êi cña bæn m«n. Nh­ng mµ ng­¬i h÷u dòng h÷u m­u gan d¹ h¬n ng­êi cã thÓ giao ®­îc nhiÖm vô lín, ha ha. Nay ta truyÒn cho ng­¬i mãn tuyÖt häc nµy, vµ ®õng nªn phô sù tİn nhiÖm cña Kim Quèc!", 1),
			speak_string(nFaction, "§a t¹ "..szCall.."Tu©n theo"..szCall.."gi¸o huÊn.", 1),
			npc_string(nFaction, "Do thêi gian gÊp g¸p, nªn c«ng lùc cña mãn vâ c«ng nµy chØ truyÒn cho ng­¬i mét phÇn, sau nµy dùa vµo cÇn cï siªng n¨ng cña ng­¬i mµ ph¸t triÓn mãn vâ c«ng nµy lªn.  Chiªu vâ c«ng nµy chØ truyÒn cho ng­¬i, nh÷ng ®Ö tö vµ c¸c m«n ph¸i kh¸c vÉn cßn ch­a ®­îc biÕt ®©u. §Ó tr¸nh tai v¸ch m¹ch dõng,  ta ®· viÕt tÊt c¶ nh÷ng khÈu quyÕt cÇn thiÕt råi, ng­¬i tù nghiªn cøu nhĞ. D­a vµo tè chÊt hiÖn t¹i cña ng­¬i sÏ rÊt dÔ dµng lÜnh ngé. µ ®óng råi,   ng­¬i ®i chuÈn bŞ <color=white> tÊt c¶ kü n¨ng cña bæn m«n thµnh 1 quyÓn<color>.", 1),
			speak_string(nFaction, "Nghe"..szCall.." dÆn dß, ®Ö tö liÒn tøc tèc ®Õn ®©y phôc mÖnh.", 1),
		}
	end
	describe_talk(tDialog)
	SetTask(LV120_SKILL_STATE, 18)
	SyncTaskValue(LV120_SKILL_STATE)
end

function lv120skill_submit()				-- Ìá½»±¾ÅÉÈ«²¿¼¼ÄÜÊéUI
	GiveItemUI("Giao toµn bé s¸ch kü n¨ng cña bæn m«n", "Bá tÊt c¶ s¸ch kü n¨ng cña bæn m«n vµo th× thu ®­îc bİ quyÕt kü n¨ng cÊp 120.", "submit_skillbook", "quit")
end

function submit_skillbook(nCount)			-- Ìá½»±¾ÅÉÈ«²¿¼¼ÄÜÊé

	local nFaction = GetLastFactionNumber()
	local szCall = FACTION_TEXT[nFaction][3]
	local idxBook, g, d, p = 0, 0, 0, 0
	local book, temp = {}, {}

	if (nCount == 0) then
		lv120skill_submit()
		return
	end

	for i = 1, getn(FACTION_BOOK[nFaction]) do
		tinsert(temp, FACTION_BOOK[nFaction][i])
	end

	for i = 1, nCount do
		idxBook = GetGiveItemUnit(i)
		g, d, p = GetItemProp(idxBook)
		for j = 1, getn(temp) do
			if (g == temp[j][1]) and (d == temp[j][2]) and (p == temp[j][3]) then
				tremove(temp, j)
				tinsert(book, idxBook)
				break
			end
		end
	end

	if (getn(temp) == 0) then
		local tDialog =
		{
			npc_string(nFaction, "ThËt kh«ng hæ danh nh©n tµi khã gÆp, hµnh sù thËt lµ lanh lÑ…..  Ta ®· ®­a cho ng­¬i bİ quyÕt råi ng­¬i tù ®i nghiªn cøu 1 lóc lµ cã thÓ lÜnh ngé 1 trong sè tuyÖt chiªu.", 1),
			speak_string(nFaction, "§a t¹ "..szCall.."C¸m ¬n ®· chØ d¹y, b©y giê ta ®i tu luyÖn ®©y.", 1),
			self_string(10, "Sau mét håi quanh co, ®¹i hiÖp ®· ®¹t ®­îc mét tuyÖt kü th­îng thõa trong vâ l©m……"),
		}
		describe_talk(tDialog)
		for i = 1, getn(book) do
			if (RemoveItemByIndex(book[i]) ~= 1) then		-- È¡×ßÍæ¼ÒÉíÉÏµÄ¼¼ÄÜÊé
				WriteLog("NhiÖm vô kü n¨ng cÊp 120 - Göi cho bæn m«n ph¸i tÊt c¶ s¸ch kü n¨ng -- Xãa bá c¸c s¸ch kü n¨ng dŞ th­êng.  Player ="..GetName().." Time = "..date("%y.%m.%d"))
				Msg2Player("HÖ thèng ph¸t sinh lçi, xin mêi liªn hÖ víi nhµ ph¸t hµnh ®Ó gi¶i quyÕt vÊn ®Ò nµy!")
				return
			end
		end
		idxBook = add_item(LV120SKILLBOOK)	-- »ñµÃ120¼¶¼¼ÄÜÊé
		Msg2Player("Ng­¬i thu ®­îc 1"..GetItemName(idxBook))
		SetTask(LV120_SKILL_STATE, 19)
		SyncTaskValue(LV120_SKILL_STATE)
	else
		Describe("CÇn ph¶i bá vµo 1 cuèn cã tÊt c¶ kü n¨ng, ®Ó cho"..szCall.." ®Ó lµm thµnh s¸ch tuyÖt kü th­îng thõa cÊp 120.", 2, "Lµm l¹i/lv120skill_submit", "§ãng/quit")
	end

end

function calc_item(tab)
	return	CalcItemCount(-1, tab[1], tab[2], tab[3], -1)
end

-- ½â¾öÈÎÎñÒì³£
function lv120skill_debug()
	local state = GetTask(LV120_SKILL_STATE)
	if (state <= 1) or (state >= 19) then return end
	if (state == 5) then debug_item(DGJ_WULINMIJI) return end
	if (state == 9) then debug_item(COFFIN_MAP) return end
	if (state >= 10) and (state <= 15) then debug_item(COFFIN) return end
	if (state == 16) then debug_item(CADAVER) return end
end

function debug_item(Item)
	if (calc_item(Item) < 1) then
		if (CalcFreeItemCellCount() < 1) then
			Msg2Player("Trong nhiÖm vô kü n¨ng cÊp 120 xuÊt hiÖn lçi, xin mêi dän dÑp l¹i hµnh trang, xuÊt hiÖn mét « trèng ®ång thêi xin mêi ®¨ng nhËp trë l¹i ®Ó hÖ thèng tr¶ l¹i ®å ®· mÊt cho ®¹i hiÖp.")
			return
		end
		local idxItem = add_item(Item)
		Msg2Player("§¹i hiÖp ®· thu ®­îc ®å võa mêi bŞ mÊt"..GetItemName(idxItem)..", b©y giê cã thÓ tiÕp tôc nhiÖm vô kü n¨ng 120.")
	end
end

function quit()
end


-- 120¼¶¼¼ÄÜÊé¶Ò»»
function lvl120skill_learn()
	Describe("Cã ®iÒu g× nan gi¶i kh«ng?",4,
		"Ta muèn ®æi s¸ch kü n¨ng cÊp 120/lvl120skill_getbook",
		"Lµm sao ®Ó häc ®­îc kü n¨ng cÊp 120/lvl120skill_learninfo",
		"C¸ch luyÖn kü n¨ng cÊp 120/lvl120skill_skillinfo",
		"§Ó ta suy nghÜ kü l¹i xem/no");
end;

function lvl120skill_skillinfo()
	local szInfo = format("%s%s%s%s%s%s%s%s%s%s",
			"<enter><color=green>1. §¸nh qu¸i nhËn ®­îc <color>",
			"<enter>Qu¸i t¹i c¸c khu vùc luyÖn cÊp: ®¸nh qu¸i th­êng, boss xanh, boss Hoµng Kim;",
			"<enter>Qu¸i trong ho¹t ®éng: ®¸nh qu¸i trong c¸c ho¹t ®éng 'V­ît ¶i thø nhÊt', 'Boss s¸t thñ';",
			"<enter>Qu¸i trong nhiÖm vô: ®¸nh qu¸i trong c¸c nhiÖm vô Hoµng Kim;",
			"<enter>ChiÕn tr­êng Tèng Kim: sö dông ®iÓm tİch lòy ®Ó ®æi ®iÓm kinh nghiÖm, tuy nhiªn kh«ng thÓ v­ît qua giíi h¹n qui ®Şnh mçi ngµy.", 
			"<enter><color=green>2. Chøc n¨ng ñy th¸c<color>",
			"<enter>Sö dông B¹ch C©u Hoµn kü n¨ng, §¹i B¹ch C©u Hoµn kü n¨ng, §¹i B¹ch C©u Hoµn kü n¨ng ®Æc biÖt.",
			"<enter>B¹ch C©u Hoµn kü n¨ng: sau khi sö dông sÏ n©ng cao ®é rÌn luyÖn kü n¨ng 120, mçi 5 phót th× ®é rÌn luyÖn sÏ t¨ng mét lÇn;",
			"<enter>§¹i B¹ch C©u Hoµn kü n¨ng: hiÖu qu¶ gÊp r­ìi B¹ch C©u Hoµn kü n¨ng th­êng, mçi 5 phót th× ®é rÌn luyÖn sÏ t¨ng mét lÇn;",
			"<enter>§¹i B¹ch C©u hoµn kü n¨ng ®Æc biÖt: hiÖu qu¶ gÊp ®«i B¹ch C©u Hoµn kü n¨ng th­êng, mçi 5 phót th× ®é rÌn luyÖn sÏ t¨ng mét lÇn;"
			);
	Describe(szInfo,
		2,
		"Trë vÒ/lvl120skill_learn",
		"KÕt thóc ®èi tho¹i/no")
end;

function lvl120skill_learninfo()
	Describe("Nh÷ng cao thñ ®¹t cÊp 120 cã thÓ ®Õn m«n ph¸i cña m×nh ®Ó ®æi s¸ch kü n¨ng cÊp 120. Sau khi sö dông s¸ch sÏ häc ®­îc kü n¨ng cÊp 120, mçi nh©n vËt chØ cã thÓ ®æi mét lÇn. <enter>§Ó ®æi lÊy s¸ch cÇn ph¶i thu thËp ®ñ: 1 quyÓn Bµn Nh­îc T©m Kinh, 1 bé s¸ch kü n¨ng 90 cña m«n ph¸i m×nh, 1 viªn Tinh Hång B¶o Th¹ch vµ 1 viªn Thñy Tinh.", 
		2,
		"Trë vÒ/lvl120skill_learn",
		"KÕt thóc ®èi tho¹i/no")
end;

function lvl120skill_getbook()
	-- Ô­ÈÎÎñ½øĞĞµ½19½áÊø£¬±£³ÖÔ­Öµ£¬¶Ò»»¼¼ÄÜÊé³É¹¦£¬Ö±½ÓÉèÎª19
	local nstate = GetTask(LV120_SKILL_STATE);
	local nlevel = GetLevel();
	local nfact = GetLastFactionNumber();
	if (nstate == 19) then
		Describe("ThËt ®¸ng tiÕc, ng­¬i ®· ®æi s¸ch kü n¨ng 120 råi.",1 , "KÕt thóc ®èi tho¹i/no");
	elseif (nlevel < 120) then
		Describe("§¼ng cÊp ch­a ®ñ 120, kh«ng ®ñ ®iÒu kiÖn ®æi s¸ch.",1 , "KÕt thóc ®èi tho¹i/no");
	elseif (nfact < 0 or nfact > 9) then
		Describe("Ng­¬i ch­a gia nhËp m«n ph¸i, kh«ng ®ñ ®iÒu kiÖn ®æi s¸ch.",1 , "KÕt thóc ®èi tho¹i/no");
	else
		if (lvl120skill_delallitem() == 1) then
			SetTask(LV120_SKILL_STATE, 19);
			add_item(LV120SKILLBOOK);
			Msg2Player("§æi s¸ch kü n¨ng cÊp 120 thµnh c«ng!")
			WriteLog(format("[LvL120Skill]\t%s\tName:%s\tAccount:%s\tget a lvl120skillbook",
				GetLocalDate("%Y-%m-%d %X"),GetName(), GetAccount()))
		else
			Describe("ThËt ®¸ng tiÕc, vËt phÈm mang ®Õn kh«ng ®óng yªu cÇu, h·y kiÓm tra l¹i!", 1,"KÕt thóc ®èi tho¹i/no");
			Msg2Player("VËt phÈm cÇn thu thËp: 1 quyÓn Bµn Nh­îc T©m Kinh, 1 bé s¸ch kü n¨ng 90 cña m«n ph¸i m×nh, 1 viªn Tinh Hång B¶o Th¹ch vµ 1 viªn Thñy Tinh.");
		end;
	end;
end;
-- 120¼¶¼¼ÄÜÊé¶Ò»»

function lvl120skill_delallitem()
	if (lvl120skill_calccount(BANRUOXINJING) < 1) then
		return 0;
	end;
	local nfact = GetLastFactionNumber();
	for i = 1, getn(FACTION_BOOK[nfact]) do
		if (lvl120skill_calccount(FACTION_BOOK[nfact][i]) < 1) then
			return 0;
		end;
	end;

	if (lvl120skill_calccount(XINGHONGBAOSHI) < 1) then
		return 0;
	end;
	
	if (lvl120skill_calccrystal() < 1) then
		return 0;
	end;
	
	lvl120skill_delitem(BANRUOXINJING, 1);
	for i = 1, getn(FACTION_BOOK[nfact]) do
		lvl120skill_delitem(FACTION_BOOK[nfact][i], 1);
	end;
	lvl120skill_delitem(XINGHONGBAOSHI, 1);
	lvl120skill_delscrystal(1);
	return 1;
end;

function lvl120skill_calccount(tb_item)
	return CalcEquiproomItemCount(tb_item[1], tb_item[2], tb_item[3], -1);
end;
function lvl120skill_delitem(tb_item, ncount)
	if (ncount <= 0) then
		return 0;
	end;
	local np = ConsumeEquiproomItem(ncount, tb_item[1], tb_item[2], tb_item[3], -1);
	if (np == 1) then
		WriteLog(format("[LvL120Skill]\t%s\tName:%s\tAccount:%s\tDeleteItem Count=%d,G=%d,D=%d,P=%d,L=%d",
					GetLocalDate("%Y-%m-%d %X"),GetName(), GetAccount(),
					ncount, tb_item[1], tb_item[2], tb_item[3], -1));
	else
		print(format("Error!!!! DeleteItem Fail!!! Count=%d,G=%d,D=%d,P=%d,L=%d",
				ncount, tb_item[1], tb_item[2], tb_item[3], -1));
	end;
end;
function lvl120skill_calccrystal()
	local nsum = 0;
	for i = 1, getn(CRYSTAL) do
		nsum = nsum + lvl120skill_calccount(CRYSTAL[i]);
	end;
	return nsum;
end;
function lvl120skill_delscrystal(ncount)
	for i = 1, getn(CRYSTAL) do
		local ncrst = lvl120skill_calccount(CRYSTAL[i]);
		if (ncrst > ncount) then
			ncrst = ncount;
		end;
		lvl120skill_delitem(CRYSTAL[i], ncrst);
		ncount = ncount - ncrst;
		if (ncount <= 0) then
			break
		end;
	end;
end;



-- //Ô½ÄÏ°æ²»´¦ÀíÉÏÏßÊ±ÈÎÎñ±äÁ¿³õÊ¼»¯
if (GetProductRegion() ~= "vn") then
	login_add(init_lv120skill, 2)
end
