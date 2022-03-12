--====»î¶¯×Ô¶¨Òå²¿·Ö,Ò»°ãÒÔGameID×÷ÎªTableÏÂ±ê====--

STORM_GAMEID_MAX	= 4	--¿ÉÄÜ´æÔÚµÄGameID×î´óÖµ

TB_STORM_POINT = {}	--»ı·Ö±í

TB_STORM_POINT[1] = {	--ËÎ½ğ»ı·Ö±í
	{	--¹Ì¶¨¶áÆìÄ£Ê½
		{60, 16000},
		{50, 10000},
		{40, 5500},
		{30, 4000},
		{20, 2000},
		{10, 500},
		{0, 0}
	}, {--Ëæ»ú¶áÆìÄ£Ê½
		{60, 15000},
		{50, 10000},
		{40, 4500},
		{30, 3000},
		{20, 1500},
		{10, 300},
		{0, 0}
	}, {--ÔªË§Ä£Ê½
		{60, 14500},
		{50, 10000},
		{40, 4500},
		{30, 2000},
		{20, 500},
		{10, 200},
		{0, 0}
	}, {--É±Â¾Ä£Ê½
		{60, 14000},
		{50, 9000},
		{40, 4000},
		{30, 1500},
		{20, 300},
		{10, 50},
		{0, 0}
	}
}

TB_STORM_POINT[2] = {	--É±ÊÖÊÔÁ¶»ı·Ö±í
	{60, 1350},
	{59, 1200},
	{50, 950},
	{40, 700},
	{30, 400},
	{20, 200},
	{10, 0},
}

TB_STORM_POINT[3] = {	--ĞÅÊ¹ÈÎÎñ»ı·Ö±í
	{60, 500},
	{50, 400},
	{40, 300},
	{30, 200},
	{20, 100},
	{10, 30},
	{0, 0}
}

TB_STORM_POINT[4] = {	--Ò°ÛÅÈÎÎñ»ı·Ö±í
	{60, 30000000},
	{55, 18000000},
	{50, 12000000},
	{40, 6000000},
	{30, 3000000},
	{20, 500000},
	{10, 300000},
	{0, 0}
}

--¸÷ÖÖ»î¶¯µÄÎÄ×ÖÃèÊö
TB_STORM_DESCRIBE = {"ChiÕn tr­êng Tèng Kim", "s¸t thñ ", "NhiÖm vô Tİn Sø ", "NhiÖm vô D· TÈu"}

--¸÷ÖÖ»î¶¯µ±ÈÕ¿ÉÒÔ½øĞĞµÄ´ÎÊı
TB_STORM_TRYTIMES = {1, 2, 1, 1}

--¿ªÊ¼ÌôÕ½ºóµÄ¶Ô»°
TB_STORM_DIALOG = {
	"  Sau khi khiªu chiÕn, ng­êi nhËn ®iÓm tİch lòy Tèng Kim lÇn nµy sÏ ®­îc ®æi thµnh ®iÓm tİch lòy Phong Ba. §iÓm tİch lòy Tèng Kim cña b¹n hiÖn t¹i lµ: <color=yellow>%d<color>",
	"Kh«ng truy hái nhiÖm vô s¸t thñ ",
	"NhiÖm vô Tİn Sø ch­a b¾t ®Çu",
	"  Sau khi khiªu chiÕn, hÖ thèng sÏ c¨n cø trong mét giê, sè l­îng hoµn thµnh nhiÖm vô vµ ®é khã chuyÓn ®æi thµnh tİch lòy Phong Ba h«m nay."
}

--°ïÖúNpcµÄÎÄ×Ö
TB_STORM_HELP = {
	"  Sau khi chiÕn tr­êng Tèng Kim b¾t ®Çu tõ phót phót thø 10, 20, 30, b¹n sÏ nhËn ®­îc khiªu chiÕn Phong Ba qua c¸c giai ®o¹n <color=red> tham gia nhËn th­ëng <color>___tİch lòy Phong Ba, tæng céng <color=yellow>40<color> phót. NhËn ®­îc <color=red>tİch lòy Tèng Kim <color>còng cã thÓ ®æi ra tİch lòy Phong Ba (Cao nhÊt<color=yellow>60<color>®iÓm) .%s<enter>",
	"  Tham gia nhiÖm vô s¸t thñ cã thÓ nhËn ®­îc <color=red>phÇn th­ëng tham gia <color>___tİch lòy Phong Ba <color=yellow>40<color> ®iÓm. Thµnh c«ng x«ng ¶i <color=red>tr­íc thêi gian<color>, cã thÓ ®æi thµnh tİch lòy Phong Ba (Cao nhÊt <color=yellow>60<color> ®iÓm) . Mçi ngµy hai trËn s¸t thñ, lÊy trËn <color=red>thµnh tİch tèt nhÊt<color> tİnh tİch lòy Phong Ba. S¸t thñ cao cÊp mçi ng­êi mçi ngµy chØ nhËn ®­îc cao nhÊt <color=yellow>100<color> ®iÓm tİch lòy Phong Ba, s¸t thñ s¬ cÊp cao nhÊt nhËn ®­îc <color=yellow>90<color> ®iÓm.",
	"NhiÖm vô Tİn Sø ",
	"  B¾t ®Çu khiªu chiÕn Phong Ba lËp tøc nhËn ®­îc <color=red>phÇn th­ëng tham gia <color>___Tİch lòy Phong Ba <color=yellow>40<color> ®iÓm. §ång thêi c¨n cø theo b¹n trong <color=red>vßng mét giê <color> (Thêi gian trªn m¹ng, thêi gian rêi m¹ng vÉn t¨ng kinh nghiÖm) , hoµn thµnh nhiÖm vô <color=red>sè l­îng vµ ®é khã<color>, cã thÓ nhËn ®­îc tİch lòy Phong Ba t­¬ng øng (Cao nhÊt <color=yellow>60<color> ®iÓm) . Trong hÖ thèng chuçi nhiÖm vô D· TÈu, mçi ng­êi mçi ngµy nhËn ®­îc tİch lòy Phong Ba cao nhÊt <color=yellow>100<color>®iÓm.<enter>"
}

--====Task Value====--
STORM_TASKID_BASE	= 1661-1	--TaskIDÆğÊ¼Öµ
--¸÷¸ö»î¶¯µÄ¿ÉÓÃTask±äÁ¿¿Õ¼ä£¬Ôİ¶¨Ã¿¸ö»î¶¯ĞèÒª7¸öTask±äÁ¿
TB_STORM_TASKID = {
	{STORM_TASKID_BASE + 21, STORM_TASKID_BASE + 22, STORM_TASKID_BASE + 23, STORM_TASKID_BASE + 24, STORM_TASKID_BASE + 25, STORM_TASKID_BASE + 26, STORM_TASKID_BASE + 45},
	{STORM_TASKID_BASE + 27, STORM_TASKID_BASE + 28, STORM_TASKID_BASE + 29, STORM_TASKID_BASE + 30, STORM_TASKID_BASE + 31, STORM_TASKID_BASE + 32, STORM_TASKID_BASE + 46},
	nil,	--ĞÅÊ¹ÈÎÎñÔİÍ£	{STORM_TASKID_BASE + 33, STORM_TASKID_BASE + 34, STORM_TASKID_BASE + 35, STORM_TASKID_BASE + 36, STORM_TASKID_BASE + 37, STORM_TASKID_BASE + 38},
	{STORM_TASKID_BASE + 39, STORM_TASKID_BASE + 40, STORM_TASKID_BASE + 41, STORM_TASKID_BASE + 42, STORM_TASKID_BASE + 43, STORM_TASKID_BASE + 44, STORM_TASKID_BASE + 47}
}

--====Ê±¼ä/³¡´ÎÅĞ¶Ïº¯Êı====--
--¸ù¾İ²»Í¬gameid£¬·µ»ØÏàÓ¦µÄnowtime
function storm_gettime(gameid)
	if (gameid == 1) then
		return BT_GetGameData(GAME_KEY)
	elseif (gameid == 2) then
		return GetTask(STORM_TASKID_GAMEID_SS)
	elseif (gameid == 3) then
		return GetGameTime()
	elseif (gameid == 4) then
		return 1
	else
		print("error gameid!")
		return nil
	end
end

--±È½Ï nowtime Óë starttime £¬ÅĞ¶ÏÊÇ·ñ»¹ÔÚÓÎÏ·Ê±¼äÄÚ
--·µ»Ø1±íÊ¾»¹¿ÉÒÔ¼ÇÂ¼»ı·Ö£¬·µ»Ønil±íÊ¾ÒÑ¾­³¬Ê±
function storm_gametime(gameid, starttime, nowtime)
	if (gameid == 1) then
		return starttime == nowtime	--Í¬Ò»³¡ËÎ½ğ´óÕ½
	elseif (gameid == 2) then
		return starttime == nowtime	--Í¬Ò»³¡É±ÊÖÊÔÁ¶
	elseif (gameid == 3) then
		return nowtime > starttime - 3600	--µ¹¼ÆÊ±Ã»ÓĞ³¬¹ı1Ğ¡Ê±
	elseif (gameid == 4) then
		--return nowtime < starttime + 3600	--ÏµÍ³Ê±¼äÃ»ÓĞ³¬¹ı1Ğ¡Ê±
		return TM_GetRestCount(STORM_TIMERID_YS) ~= nil	--¼ÆÊ±Æ÷»¹´æÔÚ
	else
		print("error gameid!")
		return nil
	end
end

--====½±Àø²¿·Ö====--
--½±Æ·¸ñÊ½£º{{½±Æ·ÀàĞÍ£¬¾ßÌåÎïÆ·£¬ÊıÁ¿}£¬{½±Æ·ÀàĞÍ£¬¾ßÌåÎïÆ·£¬ÊıÁ¿}£¬......}
--	½±Æ·ÀàĞÍ£º	1¡¢AddItem£»2¡¢AddGoldItem£»3¡¢·ÇÎïÆ·£»4¡¢Ëæ»úÎïÆ·
--	¾ßÌåÎïÆ·£º	Òò½±Æ·ÀàĞÍµÄ²»Í¬¶øÓĞ²»Í¬ÒâÒåºÍ¸ñÊ½
--		AddItem£º		º¬6¸ö²ÎÊıµÄÊı×é£¬±íÊ¾AddItem(x1,x2,x3,x4,x5,x6)µÄ6¸ö²ÎÊı
--		AddGoldItem£º	º¬2¸ö²ÎÊıµÄÊı×é£¬±íÊ¾AddGoldItem(x1,x2)µÄ2¸ö²ÎÊı
--		·ÇÎïÆ·£º		1¡¢AddOwnExp
--		Ëæ»úÎïÆ·£º		¸ñÊ½Í¬½±Æ·¸ñÊ½£¬¼¸ÂÊÆ½¾ù
--	ÊıÁ¿£º	Èç¹ûÊÇAddOwnExp£¬Ôò±íÊ¾ÊÇ¾­ÑéÖµ

--ÈÕ·ç±©»ı·Ö½±Àø
TB_STORM_AWARD_DAY = {
	--ĞèÒª»ı·Ö	½±ÀøÃû³Æ	½±Æ·
	{300,	"1 viªn HuyÒn Tinh cÊp 10 + 3000w kinh nghiÖm",	{{1,{6,1,147,10,0,0},1},{3,1,30000000}}},
	{270,	"1 ThÇn Bİ Kho¸ng th¹ch + 1200w kinh nghiÖm",	{{1,{6,1,398,0,0,0},1},	{3,1,12000000}}},
	{240,	"1 viªn HuyÒn Tinh cÊp 6 + 800w kinh nghiÖm",		{{1,{6,1,147,6,0,0},1},	{3,1,8000000}}},
	{210,	"Mét hång bao thÇn bİ + 500w kinh nghiÖm",	{{1,{6,1,402,0,0,0},1},	{3,1,5000000}}},
	{180,	"1 viªn HuyÒn Tinh cÊp 5 + 300w kinh nghiÖm",		{{1,{6,1,147,5,0,0},1},	{3,1,3000000}}},
	{150,	"Ba Tiªn Th¶o lé + 150 kinh nghiÖm",		{{1,{6,1,71,0,0,0},3},	{3,1,1500000}}},
	{120,	"Hai Tiªn Th¶o lé + 100w kinh nghiÖm",		{{1,{6,1,71,0,0,0},2},	{3,1,1000000}}},
	{80,	"1 Tiªn Th¶o lé + 50w kinh nghiÖm ",		{{1,{6,1,71,0,0,0},1},	{3,1,500000}}}
}

--ÁÙÊ±Êı×é£ºÒ»Ì×°²°î
tmp_ab = {
	{2,{0,164},1},
	{2,{0,165},1},
	{2,{0,166},1},
	{2,{0,167},1}
}
--ÖÜ·ç±©ÅÅÃû½±Àø
TB_STORM_AWARD_WEEK = {
	--ĞèÒªÅÅÃû£¨¸ºÊı£©	½±ÀøÃû³Æ	½±Æ·
	{-1,	"Mét bé An Bang", 	tmp_ab},
	{-10,	"NhËn ®­îc mét bé An Bang", {{4,tmp_ab,1}}}
}

--ÁÙÊ±Êı×é£º¼¼ÄÜ+1´ó»Æ½ğ
tmp_jydhj = {
	{2,{0,4},1},	{2,{0,9},1},	{2,{0,15},1},	{2,{0,19},1},	{2,{0,24},1},
	{2,{0,30},1},	{2,{0,35},1},	{2,{0,38},1},	{2,{0,43},1},	{2,{0,50},1},
	{2,{0,55},1},	{2,{0,59},1},	{2,{0,63},1},	{2,{0,68},1},	{2,{0,74},1},
	{2,{0,80},1},	{2,{0,84},1},	{2,{0,88},1},	{2,{0,95},1},	{2,{0,100},1},
	{2,{0,105},1},	{2,{0,109},1},	{2,{0,113},1},	{2,{0,120},1},	{2,{0,125},1},
	{2,{0,130},1},	{2,{0,135},1},	{2,{0,138},1}
}
--ÁÙÊ±Êı×é£º´ó»Æ½ğ
tmp_dhj = {
	{2,{0,2},1},	{2,{0,6},1},	{2,{0,11},1},	{2,{0,16},1},	{2,{0,21},1},
	{2,{0,26},1},	{2,{0,31},1},	{2,{0,39},1},	{2,{0,42},1},	{2,{0,46},1},
	{2,{0,51},1},	{2,{0,60},1},	{2,{0,61},1},	{2,{0,67},1},	{2,{0,71},1},
	{2,{0,76},1},	{2,{0,81},1},	{2,{0,87},1},	{2,{0,92},1},	{2,{0,96},1},
	{2,{0,101},1},	{2,{0,106},1},	{2,{0,115},1},	{2,{0,119},1},	{2,{0,121},1},
	{2,{0,126},1},	{2,{0,132},1},	{2,{0,136},1}
}
--ÔÂ·ç±©ÅÅÃû½±Àø
TB_STORM_AWARD_MONTH = {
	--ĞèÒªÅÅÃû£¨¸ºÊı£©	½±ÀøÃû³Æ	½±Æ·
	{-1,	"NhÉn §¹i M¹ Hæ mét cÆp",		{{2,{0,197},1},	{2,{0,202},1}}},
	{-1,	"Kü n¨ng ngÉu nhiªu + 1 Hoµng Kim",	{{4,tmp_jydhj,1}}},
	{-10,	"NgÉu nhiªn mét Hoµng Kim",		{{4,tmp_dhj,1}}}
}

--½±Àø×Ü±í
TB_STORM_AWARD = {
	--1ÎÄ×ÖÃèÊö	2½±Àø·½Ê½	3ÊÇ·ñÁìÈ¡¹ıµÄTaskID		4»ı·ÖTaskID/ÅÅÃûLadderID	5½±Àø±í
	{"H«m nay",	0,		STORM_TASKID_DAY_AWARD,		STORM_TASKID_DAY_POINT,		TB_STORM_AWARD_DAY},
	{"TuÇn tr­íc",	1,		STORM_TASKID_WEEK_AWARD,	2,							TB_STORM_AWARD_WEEK},
	{"Th¸ng tr­íc",	1,		STORM_TASKID_MONTH_AWARD,	3,							TB_STORM_AWARD_MONTH},
	{"h«m qua",	0,		STORM_TASKID_DAY_LASTAWARD,	STORM_TASKID_DAY_LASTPOINT,	TB_STORM_AWARD_DAY}
	--½±Àø·½Ê½£º	0¡¢°´»ı·Ö£»1¡¢°´ÅÅÃû
	--ÅÅÃûLadderID£ºÔİÊ±ÓÃ2¡¢3·Ö±ğ´ú±íÉÏÖÜ¡¢ÉÏ¸öÔÂÅÅÃû
}

