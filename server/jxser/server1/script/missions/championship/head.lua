Include("\\script\\lib\\file.lua")
IncludeLib("RELAYLADDER")
IncludeLib("TITLE")
IncludeLib("ITEM")

BID_DATA = "\\data\\tongbid.dat"
LEVELTOP10 = "\\data\\bestlevel.dat"
LEADER_MEMBER = "\\data\\leadmember.dat"
BID_LEADER = "\\data\\bidleader.dat"

TITLETIME = 30 * 24 * 60 * 60 * 18
FRAME2TIME = 18
TRYOUT_TIMER_1 = 20 * FRAME2TIME; --20Ãë¹«²¼Ò»ÏÂÕ½¿ö
TRYOUT_TIMER_2 = 4 * 60 * 60 * FRAME2TIME; --Îª4Ð¡Ê±

MATCH_TIMER_1 = 10 * FRAME2TIME; --5Ãë¹«²¼Ò»ÏÂÕ½¿ö
MATCH_TIMER_2 = 10 * 60 * FRAME2TIME; --Îª10·ÖÖÓ

CP_ONEDAY_MAXROUND = floor(TRYOUT_TIMER_2  / (MATCH_TIMER_2 + 5 * 60 * FRAME2TIME))

Faction = {
			{"\\data\\shaolin_top5.dat", "ShaoLin_Top5", "ThiÕu L©m"},
			{"\\data\\tianwang_top5.dat", "TianWang_Top5", "Thiªn V­¬ng"},
			{"\\data\\tangmen_top5.dat", "TangMen_Top5", "§­êng M«n"},
			{"\\data\\wudu_top5.dat", "Wudu_Top5", "Ngò §éc"},
			{"\\data\\emei_top5.dat", "EMei_Top5", "Nga Mi"},
			{"\\data\\cuiyan_top5.dat", "CuiYan_Top5", "Thóy Yªn"},
			{"\\data\\gaibang_top5.dat", "GaiBang_Top5", "C¸i Bang"},
			{"\\data\\tianren_top5.dat", "TianRen_Top5", "Thiªn NhÉn"},
			{"\\data\\wudang_top5.dat", "WuDang_Top5", "Vâ §ang"},
			{"\\data\\kunlun_top5.dat", "KunLun_Top5", "C«n L«n"}
		  }
FactionTitle = {
				"Vâ L©m §¹i héi ThiÕu L©m cao thñ ",
				"Vâ L©m §¹i héi Thiªn V­¬ng cao thñ ",
				"Vâ L©m §¹i héi §­êng M«n cao thñ ",
				"Vâ L©m §¹i héi Ngò §éc cao thñ ",
				"Vâ L©m §¹i héi Nga Mi cao thñ ",
				"Vâ L©m §¹i héi Thóy Yªn cao thñ ",
				"Vâ L©m §¹i héi C¸i Bang cao thñ ",
				"Vâ L©m §¹i héi Thiªn NhÉn  cao thñ ",
				"Vâ L©m §¹i héi Vâ §ang cao thñ ",
				"Vâ L©m §¹i héi C«n L«n cao thñ ",
				}
CP_TASKID_REGIST = 1083		--1£º±¨¹ýÃû£»9£ºÈ¡ÏûÁËÔ¤Ñ¡Èü×Ê¸ñ
CP_TASKID_POINT = 1084		--¼ÇÂ¼Ô¤Ñ¡ÈüµÃ·Ö
CP_TASKID_TITLE = 1085		--9£º¼ÇÂ¼ÒÑÈ¡µÃ¾öÈüÈ¦×Ê¸ñ
CP_TASKID_BID = 1086		--
CP_TASKID_ENEMY = 1087		--Ô¤ÈüÊ±¶ÔÊÖµÄÕóÓªºÅ
CP_TASKID_ROUND = 1088		--²ÎÈüµÄ´ÎÊý
CP_TASKID_WIN = 1089		--Ó®µÄ´ÎÊý
CP_TASKID_LOSE = 1090		--ÊäµÄ´ÎÊý£»µôÏßÅÐÊä£¬µ«ÎÞ·¨¼ÇÂ¼
CP_TASKID_TIE = 1091		--Æ½¾ÖµÄ´ÎÊý
CP_TASKID_FLAG = 1092		--Õý³£ÍË³öÈü³¡µÄ±ê¼Ç£¬ÔÚÏÂÒ»Èë³¡Ê±Ë¢ÐÂ
CP_TASKID_BACKCONT = 1093	--¶ÔÓÚ²ÎÓëÍ¶±êµÄÍæ¼Ò¸ù¾ÝÍ¶±ê×Ü½ð¶î£¬ÅÐ¶ÏÄÜÈ¡¼¸´Î
CP_TASKID_LOGOUT = 1094		--Îª 0 Ê±±íÃ÷Õý³£ÍË³ö£¬Îª 1 Ê±±íÊ¾·ÇÕý³£ÍË³ö£¨Èçµ±»ú¡¢Î´±£´æÊý¾Ý¡¢·þÎñÆ÷Ô­Òò£©
CP_CASH = 100000
CP_MAXROUND = 30
CP_PLNUM_LIMT = 10
CP_PLNUM_LIMT_ESPECIAL = 4	--Îå¶¾¡¢ÌÆÃÅ¡¢À¥ÂØÈËÊýÏÞÖÆ ÖÁÉÙ4ÈË
CP_MAPPOS_IN = {1508,3026}
CP_MAPPOS_OUT = {1472,3243}
CP_MAPPOS_PRE = {1596,2977}
CP_MAPTAB = {
				{396, 397, "ThiÕu L©m"},
				{398, 399, "Thiªn V­¬ng"},
				{400, 401, "§­êng M«n"},
			 	{402, 403, "Ngò §éc"},
			 	{404, 405, "Nga Mi"},
			 	{406, 407, "Thóy Yªn"},
			 	{408, 409, "C¸i Bang"},
			 	{410, 411, "Thiªn NhÉn"},
			 	{412, 413, "Vâ §ang"},
			 	{414, 415, "C«n L«n"}
			 }
			 
CP_AWARD_ITEM = {
					{"Tö Thñy Tinh", {4, 239}, 10},
					{"Lam Thñy Tinh", {4, 238}, 10},
					{"Lôc Thñy Tinh", {4, 240}, 10},
					{"Tinh Hång B¶o Th¹ch", {4, 353}, 10},
					{"HuyÒn Tinh Kho¸ng Th¹ch cÊp 4", {6, 1, 147, 4, 0, 0}, 5},
					{"HuyÒn Tinh Kho¸ng Th¹ch cÊp 5", {6, 1, 147, 5, 0, 0}, 100},
					{"HuyÒn Tinh Kho¸ng Th¹ch cÊp 6", {6, 1, 147, 6, 0, 0}, 300},
					{"§¹i Phóc Duyªn Lé ", {6, 1, 124, 1, 0, 0}, 100},
					{"Trung  Phóc Duyªn Lé ", {6, 1, 123, 1, 0, 0}, 200},
					{"TiÓu Phóc Duyªn Lé ", {6, 1, 122, 1, 0, 0}, 400},
					{"Tiªn Th¶o Lé ", {6, 1, 71, 1, 0, 0}, 1000},
					{"Thiªn s¬n  B¶o Lé ", {6, 1, 72, 1, 0, 0}, 1125},
					{"§¹i B¹ch C©u hoµn", {6, 1, 130, 1, 0, 0}, 200},
					{"Hoa hång", {6, 0, 20, 1, 0, 0}, 1700},
					{"T©m T©m T­¬ng ¸nh phï ", {6, 1, 18, 1, 0, 0}, 1700},
					{"LÖnh bµi Phong L¨ng §é", {4, 489}, 300},
					{"Ph¸o Hoa", {6, 0, 11, 1, 0, 0}, 1700},
				}

CP_FORBID_ITEM = {
					{	"C«ng Tèc hoµn", {6, 1, 218, 1, 0, 0}, 511	},
					{	"Bµo Tèc hoµn", {6, 1, 219, 1, 0, 0}, 512	},
					{	"Phæ Phßng hoµn", {6, 1, 220, 1, 0, 0}, 513	},
					{	"§éc Phßng hoµn", {6, 1, 221, 1, 0, 0}, 514	},
					{	"B¨ng Phßng hoµn", {6, 1, 222, 1, 0, 0}, 515	},
					{	"Háa Phßng hoµn", {6, 1, 223, 1, 0, 0}, 516	},
					{	"L«i Phßng hoµn", {6, 1, 224, 1, 0, 0}, 517	},
					{	"Gi¶m Th­¬ng hoµn", {6, 1, 225, 1, 0, 0}, 518	},
					{	"Gi¶m H«n hoµn", {6, 1, 226, 1, 0, 0}, 519	},
					{	"Gi¶m §éc hoµn", {6, 1, 227, 1, 0, 0}, 520	},
					{	"Gi¶m B¨ng hoµn", {6, 1, 228, 1, 0, 0}, 521	},
					{	"Phæ C«ng hoµn", {6, 1, 229, 1, 0, 0}, 522	},
					{	"§éc C«ng hoµn", {6, 1, 230, 1, 0, 0}, 523	},
					{	"B¨ng C«ng hoµn", {6, 1, 231, 1, 0, 0}, 524	},
					{	"Háa C«ng hoµn", {6, 1, 232, 1, 0, 0}, 525	},
					{	"L«i C«ng hoµn", {6, 1, 233, 1, 0, 0}, 526	},
					{	"Tr­êng MÖnh hoµn", {6, 1, 234, 1, 0, 0}, 527	},
					{	"Tr­êng Néi hoµn", {6, 1, 235, 1, 0, 0}, 528	},
					{	"Yªn Hång ®an", {6, 1, 115, 1, 0, 0}, 450	},
					{	"X¸ Lam ®an", {6, 1, 116, 1, 0, 0}, 451	},
					{	"Néi Phæ hoµn", {6, 1, 117, 1, 0, 0}, 453	},
					{	"Néi §éc hoµn", {6, 1, 118, 1, 0, 0}, 454	},
					{	"Néi B¨ng hoµn", {6, 1, 119, 1, 0, 0}, 455	},
					{	"Néi Háa hoµn", {6, 1, 120, 1, 0, 0}, 456	},
					{	"Néi L«i hoµn", {6, 1, 121, 1, 0, 0}, 457	},
					{	"Tr­êng MÖnh hoµn", {6, 0, 1, 1, 0, 0}, 256	},
					{	"Gia Bµo hoµn", {6, 0, 2, 1, 0, 0}, 257	},
					{	"§¹i Lùc hoµn", {6, 0, 3, 1, 0, 0}, 258	},
					{	"Cao ThiÓm hoµn", {6, 0, 4, 1, 0, 0}, 259	},
					{	"Cao Trung hoµn", {6, 0, 5, 1, 0, 0}, 260	},
					{	"Phi Tèc hoµn", {6, 0, 6, 1, 0, 0}, 261	},
					{	"B¨ng Phßng hoµn", {6, 0, 7, 1, 0, 0}, 262	},
					{	"L«i Phßng hoµn", {6, 0, 8, 1, 0, 0}, 263	},
					{	"Háa Phßng hoµn", {6, 0, 9, 1, 0, 0}, 264	},
					{	"§éc Phßng hoµn", {6, 0, 10, 1, 0, 0}, 265	},
					{	"B¸nh ch­ng H¹t dÎ ", {6, 0, 60, 1, 0, 0}, 401	},
					{	"B¸nh ch­ng ThÞt heo", {6, 0, 61, 1, 0, 0}, 402	},
					{	"B¸nh ch­ng ThÞt bß ", {6, 0, 62, 1, 0, 0}, 403	},
					{	"B¸ch Qu¶ Lé ", {6, 1, 73, 1, 0, 0}, 442	},
					{	"C¸t t­êng hång bao", {6, 1, 19, 1, 0, 0}, 442	},
					{"Hoµng Kim B¶o H¹p",	{6,	1,	69,	1,	0,	0},	442}
				}

CP_TRAPIN = "\\settings\\maps\\championship\\linantoplace_trap.txt"
CP_TRAPOUT = ""
CP_MATCH_POS = "\\settings\\maps\\championship\\champion_gmpos.txt"
CP_TRAPIN_FILE = "\\script\\missions\\championship\\trap\\trap_linantoplace.lua"
CP_TRAPOUT_FILE = "\\script\\missions\\championship\\trap\\trap_placetolinan.lua"
CP_BEGIN_BID_DATE = 5051200
CP_END_BID_DATE = 5051412
CP_UPTO_TRYOUT = 5051620
CP_END_TRYOUT = 5052224

CP_HELP_TRYOUT = {
					"<color=yellow>TrËn dù tuyÓn §¹i héi Vâ l©m kiÖt xuÊt<color>, chän ra <color=yellow>5 h¹ng ®Çu<color> trong thËp ®¹i m«n ph¸i ë mçi khu vùc tham gia trËn dù tuyÓn tuyÓn thñ cña '§¹i héi Vâ L©m toµn khu vùc'. TrËn dù tuyÓn b¾t ®Çu tõ 16/5 ®Õn 22/5 kÕt thóc. Më tõ 20:00 ®Õn 24:00 mçi ngµy; thêi gian b¸o danh 5 phót; thêi gian thi ®Êu 10 phót.",
					"Sau khi trËn dù tuyÓn b¾t ®Çu, ng­êi ch¬i nhá h¬n cÊp 90 cã thÓ b¸o danh thi ®Êu trong §Çu tr­êng §¹i héi Vâ l©m.Ng­êi ch¬i míi tham gia thi ®Êu cÇn nép 10 v¹n l­îng phÝ b¸o danh. Mçi ng­êi ch¬i ®· b¸o danh cã thÓ thi ®Êu nhiÒu nhÊt"..CP_MAXROUND.." trËn. NÕu b¹n kh«ng hµi lßng víi thµnh tÝch cña nh©n vËt nµy, cã thÓ xãa bá t­ c¸ch thi ®Êu cña nh©n vËt, nh­ng nhËn vËt ®· bÞ xãa bá t­ c¸ch thi ®Êu kh«ng thÓ tiÕp tôc b¸o danh thi ®Êu n÷a.",
					"TrËn dù tuyÓn dùa trªn hÖ thèng ®iÓm tÝch lòy ®Ó chän ra 5 h¹ng ®Çu. Ng­êi ch¬i khi thi ®Êu "..CP_MAXROUND.."trong ®Êu tr­êng,  th¾ng 1 trËn ®­îc 3 ®iÓm, hßa 1 trËn ®­îc 1 ®iÓm, b¹i 1 trËn kh«ng ®­îc ®iÓm. §Õn ngµy 23/5, hÖ thèng sÏ chän ra 5 ng­êi ch¬i cã sè ®iÓm tÝch ph©n cao nhÊt ë mçi m«n ph¸i, nhËn ®­îc t­ c¸ch tham gia '§¹i héi Vâ L©m toµn khu vùc'",
					"Mçi ng­êi ch¬i tham gia b¸o danh trong qu¸ tr×nh tham gia nhËn ®­îc gi¶i th­ëng nhÊt ®Þnh. Mçi lÇn tham gia 1 vßng sÏ ®o¹t ®­îc gi¶i th­ëng nhÊt ®Þnh, ngoµi ra ng­êi ch¬i cßn nhËn ®­îc nh÷ng vËt phÈm nh­: Ph¸o hoa, HuyÒn Tinh Kho¸ng Th¹ch, Phóc Duyªn lé, Tiªn Th¶o Lé, Thñy Tinh) "
				}
				
CP_HELP_BID = {
				"<color=yellow>Tranh Tæng L·nh ®éi ®éi cña khu vùc nµy<color>, nhÊt thiÕt lµ Bang chñ míi cã thÓ ®Õn chç cña ta tham gia tranh chøc l·nh ®¹o ®éi nhãm cña toµn Server. TiÒn ®Êu gi¸ mçi lÇn Ýt nhÊt lµ 100 v¹n l­îng, mçi lÇn lÊy ®¬n vÞ 100 v¹n l­îng ®Ó t¨ng thªm. Thêi gian ®Êu gi¸ b¾t ®Çu tõ 12/05/2005 ®Õn 12 h ngµy 14/05 kÕt thóc.",
				"Bang chñ tham gia ®Êu gi¸ xem ng­êi cã tiÒn ®Êu gi¸ cao nhÊt (Kh«ng c«ng bè sè tiÒn cô thÓ) vµ tù biÕt sè tiÒn ®Êu gi¸ cña m×nh. §Õn 12h ngµy 14/5, Bang chñ ®­a møc ®Êu gi¸ cao nhÊt trë thµnh Tæng L·nh ®éi cña khu vùc nµy vµ nhËn ®­îc t­ c¸ch ph¸n quyÕt thi ®Êu víi danh hiÖu lµ Tæng L·nh ®éi. C¹nh tranh thÊt b¹i cÇn ®Õn chç ta nhËn l¹i tiÒn ®Êu gi¸. Mçi lÇn l·nh nhiÒu nhÊt 50 v¹n l­îng, ®¶m b¶o ng­êi ch¬i lu«n cã ®ñ tiÒn.",
				"Tæng L·nh ®éi cã thÓ ph©n ph¸t 29 tÊm Vâ l©m quyÕt ®Êu lÖnh bµi cho ng­êi ch¬i kh¸c t¹i Quan viªn Vâ l©m kiÖt xuÊt. Ng­êi ch¬i ®· cã ®­îc t­ c¸ch ë vßng chung kÕt kh«ng thÓ nhËn t­ c¸ch n÷a."
				}

CP_HELP_FINAL = "<color=yellow>Vâ L©m ®¹i héi<color>, do 90 ng­êi ë mçi khu vùc lµm thµnh 1 nhãm tham gia Vâ l©m ®¹i héi toµn khu vùc. Trong ®ã, 10 ng­êi lµ ThËp ®¹i cao thñ cña khu vùc; 50 ng­êi lµ 5 h¹ng ®Çu trong ThËp ®¹i m«n ph¸i; 30 ng­êi cßn l¹i sÏ bÇu ra 1 ng­êi lµm Tæng L·nh ®éi. Tæng L·nh ®éi cã quyÒn quyÕt ®Þnh ai trong sè 29 ng­êi cßn l¹i cã t­ c¸ch thi ®Êu vßng chung kÕt"

function transtoplace()
Say("TrËn dù tuyÓn §¹i héi Vâ l©m kiÖt xuÊt ®· kÕt thóc tèt ®Ñp. HiÖn t¹i cã thÓ ®Õn Quan viªn Vâ l©m kiÖt xuÊt xem kÕt qu¶ thi ®Êu vµ nhËn danh hiÖu t­¬ng øng. Vui lßng chê ®îi Vâ l©m ®¹i héi b¾t ®Çu.", 0)
do return end
	if (GetLevel() < 90) then
		Say("B¹n ph¶i ®¹t ®­îc cÊp 90 trë lªn míi cã thÓ x©m nhËp ®Êu tr­êng Vâ l©m ®¹i héi, h·y tiÕp tôc luyÖn thªm!", 0)
		return
	end
	if (GetLastFactionNumber() == -1) then
		Say("Vâ L©m Minh Chñ cã lÖnh: ChØ cã ng­êi cña ThËp ®¹i ph¸i ®­îc tham gia §¹i héi vâ l©m, ng­¬i kh«ng m«n kh«ng ph¸i kh«ng thÓ tham gia. Sau khi gia nhËp ThËp ®¹i ph¸i míi ®­îc tham gia thi ®Êu!", 0)
		return
	elseif(nt_gettask(CP_TASKID_REGIST) ~= CP_UPTO_TRYOUT) then
		Msg2Player("B¹n ch­a b¸o danh! H·y ®Õn Quan viªn Vâ l©m kiÖt xuÊt b¸o danh tham gia trËn dù tuyÓn!")
		NewWorld(176, 1444, 3256)
	else
		if(GetLastFactionNumber() == 0) then
			NewWorld(CP_MAPTAB[1][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--ÉÙÁÖ
		elseif (GetLastFactionNumber() == 1) then
			NewWorld(CP_MAPTAB[2][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--ÌìÍõ
		elseif (GetLastFactionNumber() == 2) then
			NewWorld(CP_MAPTAB[3][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--ÌÆÃÅ
		elseif (GetLastFactionNumber() == 3) then
			NewWorld(CP_MAPTAB[4][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--Îå¶¾
		elseif (GetLastFactionNumber() == 4) then
			NewWorld(CP_MAPTAB[5][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--¶ëáÒ
		elseif (GetLastFactionNumber() == 5) then
			NewWorld(CP_MAPTAB[6][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--´äÑÌ
		elseif (GetLastFactionNumber() == 6) then
			NewWorld(CP_MAPTAB[7][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--Ø¤°ï
		elseif (GetLastFactionNumber() == 7) then
			NewWorld(CP_MAPTAB[8][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--ÌìÈÌ
		elseif (GetLastFactionNumber() == 8) then
			NewWorld(CP_MAPTAB[9][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--Îäµ±
		elseif (GetLastFactionNumber() == 9) then
			NewWorld(CP_MAPTAB[10][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--À¥ÂØ
		end
		Talk(1, "", "B¹n ®· vµo ®Êu tr­êng Vâ l©m ®¹i héi, h·y ®Õn viªn quan ®Êu tr­êng (189, 188) , (191, 190) , (185, 187) xin tham gia thi ®Êu vßng nµy!")
	end
end

function checkmap(flag)
	local mapid = SubWorldIdx2ID(SubWorld)
	local ladder = 0
	if (mapid == 397 or mapid == 396) then
		mapname = "ThiÕu L©m"
		ladder = 10120
	elseif (mapid == 399 or mapid == 398) then
		mapname = "Thiªn V­¬ng"
		ladder = 10121
	elseif (mapid == 401 or mapid == 400) then
		mapname = "§­êng M«n"
		ladder = 10122
	elseif (mapid == 403 or mapid == 402) then
		mapname = "Ngò §éc"
		ladder = 10123
	elseif (mapid == 405 or mapid == 404) then
		mapname = "Nga Mi"
		ladder = 10124
	elseif (mapid == 407 or mapid == 406) then
		mapname = "Thóy Yªn"
		ladder = 10125
	elseif (mapid == 409 or mapid == 408) then
		mapname = "C¸i Bang"
		ladder = 10126
	elseif (mapid == 411 or mapid == 410) then
		mapname = "Thiªn NhÉn"
		ladder = 10127
	elseif (mapid == 413 or mapid == 412) then
		mapname = "Vâ §ang"
		ladder = 10128
	elseif (mapid == 415 or mapid == 414) then
		mapname = "C«n L«n"
		ladder = 10129
	end
	if (flag == 1) then
		return mapname
	elseif(flag == 2) then
		return ladder
	end
end

function help_bid()
	Talk(1, "help_bid_2", CP_HELP_BID[1])
end

function help_bid_2()
	Talk(2, "", CP_HELP_BID[2], CP_HELP_BID[3])
end
function help_tryout()
	Talk(2, "help_tryout_2", CP_HELP_TRYOUT[1], CP_HELP_TRYOUT[2])
end;

function help_tryout_2()
	Talk(2, "", CP_HELP_TRYOUT[3], CP_HELP_TRYOUT[4])
end

function help_final()
	Talk(1, "", CP_HELP_FINAL)
end

function help_championship()
	Say("B¹n muèn nhËn ®­îc gióp ®ì cña bªn nµo?", 4, "Tranh chÊp Tæng LÜnh ®éi cña khu vùc/help_bid", "trËn dù tuyÓn §¹i héi Vâ l©m kiÖt xuÊt/help_tryout", "Vâ L©m ®¹i héi/help_final", "C¸i nµy ta hiÓu råi!/OnCancel")
end

function validateDate(startt,endt)
	local now = tonumber(date("%y%m%d%H"))
	if(now >= startt and now < endt) then
		return 1
	end
	return nil
end

function AddAword(level, fac, result)
	local awardpro = {}
	if (level >120) then
		level = 120
	end
	aword = (700 + floor((level * 4 - 350) / 5) * 100) * 60 * fac
	AddOwnExp(aword)
	if( result == 0 )then
		return
	end
	for i = 1, getn(CP_AWARD_ITEM) do
		awardpro[i] = CP_AWARD_ITEM[i][3]
	end
	numth = randByProbability(awardpro)
	if (getn(CP_AWARD_ITEM[numth][2]) == 6 ) then
		AddItem(CP_AWARD_ITEM[numth][2][1], CP_AWARD_ITEM[numth][2][2], CP_AWARD_ITEM[numth][2][3], CP_AWARD_ITEM[numth][2][4], CP_AWARD_ITEM[numth][2][5], CP_AWARD_ITEM[numth][2][6])
	else
		AddEventItem(CP_AWARD_ITEM[numth][2][2])
	end
	Msg2Player("B¹n nhËn ®­îc mét"..CP_AWARD_ITEM[numth][1])
end

function randByProbability(aryProbability)
	local nRandNum;
	local nSum = 0;
	local nArgCount = getn( aryProbability );
	for i = 1, nArgCount do
		nSum = nSum + aryProbability[i];
	end
	nRandNum = mod( random( nSum ) + random( 1009 ), nSum ) + 1;
	for i = nArgCount, 1, -1 do
		nSum = nSum - aryProbability[i];
		if( nRandNum > nSum ) then
			return i;
		end
	end
end

-- ÉèÖÃÈÎÎñ×´Ì¬
function nt_settask(nTaskID, nTaskValue)
	SetTask(nTaskID, nTaskValue)
	SyncTaskValue(nTaskID) -- Í¬²½µ½¿Í»§¶Ë
end

-- »ñÈ¡ÈÎÎñ×´Ì¬
function nt_gettask(nTaskID)
	return GetTask(nTaskID)
end


------------------------------------------------------------------------------------------
function GetIniFileData(mapfile, sect, key)
	if (IniFile_Load(mapfile, mapfile) == 0) then 
		print("Load IniFile Error!"..mapfile)
		return ""
	else
		return IniFile_GetData(mapfile, sect, key)	
	end
end


------------------------------------------------------------------------------------
-- ´ò¿ªÒ»¸öÎÄ¼þ
function biwu_loadfile(filename)
	if (IniFile_Load(filename, filename) == 0) then
		File_Create(filename)
	end
end

--»ñµÃÎÄ¼þÖÐµÄszSectionµÄkeyµÄÖµ
function biwu_getdata(filename, szsect, szkey)
	return IniFile_GetData(filename, szsect, szkey)
end

--ÉèÖÃÎÄ¼þÖÐµÄszSectionµÄkeyÖµÎªszValue
function biwu_setdata(filename, szsect, szkey, szvalue)
	IniFile_SetData(filename, szsect, szkey, szvalue)	
end

function biwu_save(filename)
	IniFile_Save(filename, filename)
end

------------------------------------------------------------------------------------
function Sort_Point(array)
	local orgindex = PlayerIndex
	local point_1 = 0
	local point_2 = 0
	local wincount_1 = 0
	local wincount_2 = 0
	local winrate_1 = 0
	local winrate_2 = 0
	for i = 1, getn(array) do
		for j = getn(array), 2, -1 do
			PlayerIndex = array[j]
			point_1 = nt_gettask(CP_TASKID_ROUND)
			wincount_1 = nt_gettask(CP_TASKID_WIN)
			if (point_1 == 0 or wincount_1 == 0) then
				winrate_1 = 0
			else
				winrate_1 = wincount_1/point_1
			end
			
			PlayerIndex = array[j - 1]
			point_2 = nt_gettask(CP_TASKID_ROUND)
			wincount_2 = nt_gettask(CP_TASKID_WIN)
			if (point_2 == 0 or wincount_2 == 0) then
				winrate_2 = 0
			else
				winrate_2 = wincount_2/point_2
			end
			
			if (winrate_1 > winrate_2) then
				a = array[j]
				array[j] = array[j - 1]
				array[j - 1] = a
			end
		end
	end
	PlayerIndex = orgindex
	return array
end

function OnCancel()
end