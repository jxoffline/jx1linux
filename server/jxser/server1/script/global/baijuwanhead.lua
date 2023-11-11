--baijuwanhead.lua
--¶¨Òå³£Á¿

AEXP_SMALL_TIME_TASKID		= 1801;							-- ¼ÇÂ¼ Ğ¡°×¾Ô£¨ÒÔ´ËÎª±¶ÊıµÄ£© ¾­Ñé¹Ò»úÊ£ÓàÊ±¼ä
AEXP_TASKID 				= 605;							-- ¼ÇÂ¼ ´ó°×¾Ô£¨Ğ¡°×¾ÔµÄ1.5±¶£©Ê£Óà¹Ò»úÊ±¼äÈÎÎñ±äÁ¿
AEXP_SPECIAL_TIME_TASKID	= 2317;							-- ¼ÇÂ¼ ÌØĞ§´ó°×¾Ô£¨Ğ¡°×¾ÔµÄ2±¶Ğ§¹û£©¾­Ñé¹Ò»úÊ£ÓàÊ±¼ä
AEXP_TIANXING_TIME_TASKID	= 2655;							-- ¼ÇÂ¼ ÌìĞÇ°×¾ÔÍè£¨Ğ¡°×¾ÔµÄ5±¶£©Ê£Óà¹Ò»úÊ±¼äÈÎÎñ±äÁ¿

AEXP_SMALL_SKILL_TASKID 	= 1802							-- ¼ÇÂ¼ ¼¼ÄÜĞ¡°×¾Ô£¨ÒÔ´ËÎª±¶ÊıµÄ£© ¼¼ÄÜ¹Ò»úÊ£ÓàÊ±¼ä
AEXP_SKILL_TIME_TASKID		= 2315;							-- ¼ÇÂ¼ ¼¼ÄÜ´ó°×¾Ô£¨¼¼ÄÜĞ¡°×¾ÔµÄ1.5±¶Ğ§¹û£©Ê£Óà¹Ò¼¼ÄÜÊ±¼äÈÎÎñ±äÁ¿
AEXP_SPECIAL_SKILL_TASKID	= 2318;							-- ¼ÇÂ¼ ÌØĞ§¼¼ÄÜ´ó°×¾Ô£¨¼¼ÄÜĞ¡°×¾ÔµÄ2±¶Ğ§¹û£©¼¼ÄÜ¹Ò»úÊ£ÓàÊ±¼ä

AEXP_SKILL_ID_TASKID		= 2316;							-- ¼ÇÂ¼ÀëÏß¹Ò¼¼ÄÜÉı¼¶µÄ¼¼ÄÜIDÈÎÎñ±äÁ¿

AEXP_FREQ					= 5;							-- ¿Û³ıÊ±Ã¿´ÎÑ­»·¿Û³ıÊ±¼ä£¬¾­ÑéÃ¿5·ÖÖÓÔö¼ÓÒ»´Î
FRAME2TIME					= 18;							-- ½«Ê±¼ä×ª»¯ÎªÕìÊı£¬18ÕìÏàµ±ÓÚÓÎÏ·ÖĞ1ÃëÖÓ
AEXP_MAXTIME				= 10000 * 3600 * FRAME2TIME;	-- ÓÃ»§¿ÉÒÔÀÛ»ıµÄ×î´óÊ±¼ä
AEXP_BIGCHANGE				= 8 * 3600 * FRAME2TIME;	    -- Ò»¸ö´ó°×¾ÔÍèÔö¼ÓµÄÊ±¼ä	8Ğ¡Ê±
AEXP_SMALLCHANGE 			= AEXP_BIGCHANGE	    		-- Ò»¸ö°×¾ÔÍèÔö¼ÓµÄÊ±¼ä
AEXP_SKILLCHANGE			= AEXP_BIGCHANGE				-- Ò»¸ö¼¼ÄÜ´ó°×¾ÔÍèÔö¼ÓµÄÊ±¼ä
AEXP_SPECIALCHANGE			= AEXP_BIGCHANGE				-- Ò»¸öÌØĞ§°×¾ÔÍèÔö¼ÓµÄÊ±¼ä
AEXP_SPECIALSKILLCHANGE 	= AEXP_BIGCHANGE				-- Ò»¸öÌØĞ§¼¼ÄÜ´ó°×¾ÔÍèÔö¼ÓµÄÊ±¼ä

AEXP_INTERVAL		= 5 * 60 * FRAME2TIME;		    -- Ôö¼Ó¾­ÑéµÄÖÜÆÚ
--´ó°×¾ÔÍèµÄÏêÏ¸ĞÅÏ¢
AEXP_BIG_NGENTYPE 	= 6;
AEXP_BIG_DETAILTYPE	= 1;
AEXP_BIG_PARTYPE 	= 130;
--°×¾ÔÍèµÄÏêÏ¸ĞÅÏ¢
AEXP_SMALL_NGENTYPE 	= 6;
AEXP_SMALL_DETAILTYPE	= 1;
AEXP_SMALL_PARTYPE		= 74;
--¼Ó¾­ÑéµÄµÈ¼¶ÏŞÖÆ
AEXP_NEEDLEVEL					= 50;
AEXP_NEEDLEVEL_PARTNER	= 10;	--Í¬°éÔÚÍĞ¹ÜÊ±»ñµÃ¾­ÑéµÄ×îµÍµÈ¼¶
AEXP_OFFLINE_PLAYERCOUNT_LIMIT	= 600;				-- µ±Ò»Ì¨·şÎñÆ÷µÄÈËÊı³¬¹ı´ËÊıÄ¿£¬Ôò²»ÔÊĞíÍæ¼ÒÔÚÕâÌ¨·şÎñÆ÷ÄÚ½øĞĞÀëÏßÍĞ¹Ü
AEXP_OFFLINE_PLAYERCOUNT_SPECIAL = 750;				--×¨ÓÃÍĞ¹Ü·şÎñÆ÷ÔÊĞíÍĞ¹ÜµÄÈËÊı
AEXP_INVALIDTIMEBEGIN 			= 18;		        --ÀëÏß¹Ò»úÎŞĞ§µÄÆğÊ¼Ê±¼ä
AEXP_INVALIDTIMEEND 			= 24;		        --ÀëÏß¹Ò»úÎŞĞ§µÄÖÕÖ¹Ê±¼ä

AEXP_TEMPOFFLINETASKID 			= 170;				--Ê¹ÓÃ°×¾ÔÍèÊ±µÄÈÎÎñ±äÁ¿

AEXP_120SKILL_UPGRADE_EXP = 137500;					--120¼¼ÄÜÊìÁ·¶ÈÌáÉıÎª¶¨Öµ

--ÀëÏß¹Ò¼¼ÄÜ¸÷¼¼ÄÜ¼¶±ğ¶ÔÓ¦µÄÊìÁ·¶ÈÌáÉı±ÈÀı
ARY_UPGRADE_SKILL_EXP_PERCENT = {	0.0775,	0.0388,	0.0258,	0.0194,	0.0155,	0.013,	0.0111,	0.0097,	0.0086,	0.0039,
									0.0035,	0.0032,	0.0030,	0.0028,	0.0026,	0.0024,	0.0023,	0.0022,	0.0020	};
--ÀëÏß¹Ò¼¼ÄÜ¿ÉÌáÉıµÄ¼¼ÄÜID
ARY_UPGRADE_SKILL = { 318, 319, 321, 322, 323, 325, 339, 302, 342, 353, 355, 328, 380, 336, 337, 357, 359, 362, 361, 368, 365, 375, 372, 709, 708, 710, 711, 712, 713, 714, 715, 716, 717 };

		--¶ÔÓ¦ÃÅÅÉ			1   0    2    3    4    5    6    7    8    9
ARY_120SKILLID = { 708, 709, 710, 711, 712, 713, 714, 715, 716, 717 };
-- 150¼¶¼¼ÄÜ
ARY_UPGRADE_SKILL_150 = {1055,1056,1057,1059,1060,1058,1066,1067,1069,1070,1071,1061,1062,1114,1063,1065,1075,1076,1074,1073,1079,1078,1080,1081,}

--Include("\\script\\missions\\boss\\makeboss_head.lua")
IncludeLib("SETTING")

if (GetProductRegion() == "cn_ib") then
	Include("\\script\\item\\ib\\zimudai.lua");
end

--²éÑ¯Ê£ÓàÊ±¼ä
function get_left_time()
	--°×¾ÔÍè
	local nSmallExpSpareTime = GetTask(AEXP_SMALL_TIME_TASKID);
	local nSmallExpSpareTime_Hours, nSamllExpSpareTime_Minutes = getFrame2MinAndSec(nSmallExpSpareTime);					--¸øÓÃ»§ÌáÊ¾ÏÔÊ¾µ½·ÖÖÓ
	
	--¼¼ÄÜ°×¾ÔÍè
	local nSamllSkillSpareTime = GetTask(AEXP_SMALL_SKILL_TASKID);
	local nSamllSkillSpareTime_Hours, nSamlllSkillSpareTime_Minutes = getFrame2MinAndSec(nSamllSkillSpareTime);	--¸øÓÃ»§ÌáÊ¾ÏÔÊ¾µ½·ÖÖÓ
	
	--ÆÕÍ¨´ó°×¾ÔÍè
	local nExpSpareTime = GetTask(AEXP_TASKID);
	local nExpSpareTime_Hours, nExpSpareTime_Minutes = getFrame2MinAndSec(nExpSpareTime);					--¸øÓÃ»§ÌáÊ¾ÏÔÊ¾µ½·ÖÖÓ
	
	--¼¼ÄÜ´ó°×¾ÔÍè
	local nSkillExpSpareTime = GetTask(AEXP_SKILL_TIME_TASKID);
	local nSkillExpSpareTime_Hours, nSkillExpSpareTime_Minutes = getFrame2MinAndSec(nSkillExpSpareTime);	--¸øÓÃ»§ÌáÊ¾ÏÔÊ¾µ½·ÖÖÓ
	
	--ÌØĞ§´ó°×¾ÔÍè
	local nSpecialExpSpareTime = GetTask(AEXP_SPECIAL_TIME_TASKID);
	local nSpecialExpSpareTime_Hours, nSpecialExpSpareTime_Minutes = getFrame2MinAndSec(nSpecialExpSpareTime);
	
	--ÌØĞ§¼¼ÄÜ´ó°×¾ÔÍè
	local nSpecialSkillSpareTime = GetTask(AEXP_SPECIAL_SKILL_TASKID);
	local nSpecialSkillSpareTime_Hours, nSpecialSkillSpareTime_Minutes = getFrame2MinAndSec(nSpecialSkillSpareTime);
	
	-- ÌìĞÇ°×¾ÔÍè
	local nTianxingExpSpareTime = GetTask(AEXP_TIANXING_TIME_TASKID);
	local nTianxingExpSpareTime_Hours, nTianxingExpSpareTime_Minutes = getFrame2MinAndSec(nTianxingExpSpareTime);
	

if (GetProductRegion() == "cn_ib") then
	--°ÚÌ¯
	local restStall = GetTask(AEXP_STALL_TIME_TASKID)
	local nStall_Hour, nStall_Min = getFrame2MinAndSec(restStall)

	--ÅîÀ³ÏÉ²İÂ¶
	local nXianCaoTime = GetTask(AEXP_XIANCAO_TIME_TASKID);
	local nXianCao_Hour, nXianCao_Min = getFrame2MinAndSec(nXianCaoTime);
end	

	local nSkillExpID = GetTask(AEXP_SKILL_ID_TASKID);
	local szSkillExpName = "";
	if (nSkillExpID ~= 0) then
		szSkillExpName = "<color=yellow>"..GetSkillName(nSkillExpID).."<color>";
	else
		szSkillExpName = "<color=blue>Ch­a chän kü n¨ng<color>";
	end
	
	local szmsg = format("Thêi gian ñy th¸c rêi m¹ng cßn: Thiªn tinh b¹ch c©u hoµn <color=red>%d<color>tiÕng <color=red>%d<color> phót"..
	"<enter>§¹i B¹ch CÇu Hoµn §Æc BiÖt<color=red>%d<color>giê<color=red>%d<color>phót"..
	"<enter>§¹i B¹ch CÇu Hoµn ñy th¸c<color=red>%d<color>giê<color=red>%d<color>phót"..
	"<enter>B¹ch CÇu Hoµn ñy th¸c<color=red>%d<color>giê<color=red>%d<color>phót"..
	"<enter>§é thuÇn thôc kü n¨ng(%s): §ai B¹ch CÇu Hoµn kü n¨ng ®Æc hiÖu<color=red>%d<color>giê<color=red>%d<color>phót"..
	"<enter>§¹i B¹ch CÇu Hoµn Kü N¨ng<color=red>%d<color>giê<color=red>%d<color>phót"..
	"<enter>Bach CÇu Hoµn Kü N¨ng<color=red>%d<color>giê<color=red>%d<color>phót"..
	"<enter>Khi ñy th¸c nÕu nh­ cã hiÖu qu¶ cu¶ Thiªn Tinh B¹ch CÇu Hoµn, ­u tiªn hiÖu qu¶ cña lo¹i B¹ch cÇu Hoµn nµy vµ kinh nghiÖm vµ sÏ trõ ®i thêi gian hiÖu qu¶ t­¬ng øng.",
	 				nTianxingExpSpareTime_Hours, nTianxingExpSpareTime_Minutes,
					nSpecialExpSpareTime_Hours,nSpecialExpSpareTime_Minutes,
					nExpSpareTime_Hours,nSamllExpSpareTime_Minutes,
					nSmallExpSpareTime_Hours,nExpSpareTime_Minutes,
					szSkillExpName, nSpecialSkillSpareTime_Hours,nSpecialSkillSpareTime_Minutes,
					nSkillExpSpareTime_Hours,nSkillExpSpareTime_Minutes,
					nSamllSkillSpareTime_Hours,nSamlllSkillSpareTime_Minutes);
	
	Describe(szmsg, 1, "KÕt thóc ®èi tho¹i/cancel");
end


--°ïÖú¹¦ÄÜ
function help()
	Talk(1,"help1","H­íng dÉn ñy th¸c: B¹n cã thÓ vµo Kú Tr©n C¸c ®Ó mua B¹ch C©u Hoµn (t¨ng kinh nghiÖm) vµ B¹ch C©u Hoµn kü n¨ng (t¨ng thôc luyÖn kü n¨ng).");
end
function help1()
	Talk(1,"help2","1 viªn <color=blue>B¹ch C©u Hoµn<color> cã thÓ ñy th¸c trong <color=red>8 giê<color>. Thêi gian ñy th¸c cã thÓ céng dån. B¹n còng cã thÓ xem th«ng tin thêi gian cña m×nh trªn vËt phÈm còng nh­ ë giao diÖn ñy th¸c.");
end

function help2()
	Talk(1,"help3","H¹n chÕ sö dông: B¹n cã thÓ ë c¸c thµnh thŞ, th«n trÊn vµ thËp ®¹i m«n ph¸i, chän tho¸t ra giao diÖn (B»ng c¸ch nhÊn Esc hiÖn ra ra giao diÖn) trong ®ã ta chän rêi m¹ng vÉn t¨ng kinh nghiÖm, lËp tøc vµo tr¹ng th¸i rêi m¹ng vÉn t¨ng kinh nghiÖm.");
end
function help3()
	Talk(2,"help4", "HiÖu qu¶ sö dông B¹ch C©u Hoµn: Sau khi b­íc vµo tr¹ng th¸i ñy th¸c rêi m¹ng, thêi gian ñy th¸c b¾t ®Çu ®­îc tİnh. HÖ thèng sÏ ghi nhí tr¹ng th¸i hiÖn t¹i cña b¹n (bao gåm tr¹ng th¸i ngåi b¸n hµng). Khi ñy th¸c, ng­êi ch¬i cÊp <color=red>d­íi 50<color> sÏ kh«ng nhËn ®­îc kinh nghiÖm.","<color=red>Ng­êi ch¬i <color=red>cÊp tõ 50 trë lªn<color>, cø mçi <color=red>5 phót<color> sÏ nhËn ®­îc ®iÓm kinh nghiÖm t­¬ng øng. ë tr¹ng th¸i ñy th¸c rêi m¹ng, cã thÓ sö dông c¸c vËt phÈm t¨ng kinh nghiÖm kh¸c (nh­ Tiªn Th¶o Lé, b¸nh B¸t Tr©n Phóc NguyÖt), thêi gian hiÖu qu¶ cña nh÷ng vËt phÈm vÉn bŞ gi¶m ®i. §ång thêi, ë tr¹ng th¸i ñy th¸c, thêi gian thêi ch¬i cña b¹n vÉn bŞ khÊu trõ.");
end
function help4()
	Talk(2,"help5", "HiÖu qu¶ sö dông B¹ch C©u Hoµn kü n¨ng: Sau khi b­íc vµo tr¹ng th¸i ñy th¸c, thêi gian ñy th¸c sÏ b¾t ®Çu ®­îc tİnh. HÖ thèng sÏ ghi nhí tr¹ng th¸i hiÖn t¹i cña b¹n (bao gåm tr¹ng th¸i ngåi b¸n hµng). ë tr¹ng th¸i ñy th¸c, møc ®é luyÖn kü n¨ng cÊp 90 cña b¹n cø mçi 5 phót sÏ tù ®éng t¨ng lªn 1 lÇn.","Trong thêi gian nµy b¹n vÉn cã thÓ chän chøc n¨ng '®é thuÇn thôc kü n¨ng cÊp 90'");
end
function help5()
	Talk(2,"", "Khi thêi gian rêi m¹ng gi¶m xuèng <color=red>0<color>, th× b¹n sÏ tù ®éng rêi m¹ng. Trong lóc b¹n vµo tr¹ng th¸i rêi m¹ng vÉn t¨ng kinh nghiÖm, nÕu bŞ rít m¹ng hoÆc Server b¶o tr×, b¹n sÏ tù ®éng rêi m¹ng, ®ång thêi b¶o l­u l¹i thêi gian cßn l¹i trong lóc rêi m¹ng vÉn t¨ng kinh nghiÖm, vµ kh«ng cã kÕt nèi l¹i.","Khi b¹n ®¨ng nhËp trß ch¬i sÏ tù ®éng kÕt thóc tr¹ng th¸i rêi m¹ng vÉn t¨ng kinh nghiÖm, ®ång thêi b¶o l­u l¹i thêi gian cßn d­ rêi m¹ng vÉn t¨ng kinh nghiÖm.");
end

-- »ñÈ¡Íæ¼Ò¿ÉÒÔÀëÏß¹Ò¼¼ÄÜÉı¼¶µÄ¼¼ÄÜ
function getexpskill()
	local aryExpSkill = {};
	local nExpSkillCount = 0;
	local nAllUpgradeSkillCount = getn(ARY_UPGRADE_SKILL);
	for i = 1, nAllUpgradeSkillCount do
		local nCurSkillID = ARY_UPGRADE_SKILL[i];
		local nCurSkillLevel = GetCurrentMagicLevel(nCurSkillID, 0);
		if (nCurSkillLevel >= 1 and nCurSkillLevel <= getn(ARY_UPGRADE_SKILL_EXP_PERCENT)) then
			nExpSkillCount = nExpSkillCount + 1;
			aryExpSkill[nExpSkillCount] = {};
			aryExpSkill[nExpSkillCount][1] = nCurSkillID;
			aryExpSkill[nExpSkillCount][2] = GetSkillName(nCurSkillID);
		end
	end
	return aryExpSkill;
end

-- Ñ¡ÔñÀëÏßÍĞ¹Ü¼¼ÄÜ
function selectofflineskill()
	local aryExpSkill = getexpskill();
	local nExpSkillCount = getn(aryExpSkill);
	local aryszExpSkill = {};
	local szSayCmd = "Xin lùa chän chøc n¨ng ñy th¸c:";
	for i = 1, nExpSkillCount do
		aryszExpSkill[i] = format("%s/#onSetUpgradeSkill(%d)",aryExpSkill[i][2],aryExpSkill[i][1]);
	end
	tinsert(aryszExpSkill, "Trë l¹i/judgecontion")
	Say(szSayCmd, getn(aryszExpSkill), aryszExpSkill);
end

-- ÉèÖÃÀëÏßÍĞ¹Ü¼¼ÄÜ
function onSetUpgradeSkill(nUpgradeSkillID, funcCallBack)
	SetTask(AEXP_SKILL_ID_TASKID, nUpgradeSkillID);
	funcCallBack();
end

-- ¸ù¾İ¼¼ÄÜ¼¶±ğÊìÁ·¶È×Ô¶¯ÉèÖÃÀëÏß¹Ò¼¼ÄÜÉı¼¶µÄ¼¼ÄÜID
function autosetupgradeskill()
	local nSkillCount = getn(ARY_UPGRADE_SKILL);
	local nUpgradeSkillID = 0;
	local nUpgradeSkillLevel = 0;
	local nUpgradeSkillExp = 0;
	for i = 1, nSkillCount do
		local nCurSkillID = ARY_UPGRADE_SKILL[i];
		local nCurSkillLevel = GetCurrentMagicLevel(nCurSkillID, 0);
		local nCurSkillExp = GetSkillExp(nCurSkillID);
		if (nCurSkillLevel >= 1 and nCurSkillLevel <= getn(ARY_UPGRADE_SKILL_EXP_PERCENT) and
			(nCurSkillLevel > nUpgradeSkillLevel or 
			(nCurSkillLevel == nUpgradeSkillLevel and nCurSkillExp > nUpgradeSkillExp))) then
			nUpgradeSkillID = nCurSkillID;
			nUpgradeSkillLevel = nCurSkillLevel;
			nUpgradeSkillExp = nCurSkillExp;
		end
	end
	SetTask(AEXP_SKILL_ID_TASKID, nUpgradeSkillID);
end

function getFrame2MinAndSec(nframe)
	local minutes = floor(nframe / (FRAME2TIME * 60));		--¸øÓÃ»§ÌáÊ¾ÏÔÊ¾µ½·ÖÖÓ
	local hours = floor(minutes / 60);
	local minutes = minutes - hours * 60; 
	return hours, minutes;
end;

--ÅĞ¶ÏÍæ¼ÒÊÇ·ñ³ä¹ı¿¨
function IsCharged()
	if( GetExtPoint( 0 ) >= 1 ) then
		return 1;
	else
		return 0;
	end
end;

function cancel()
--do nothing
end;

function getBaiJutimeinfo()
										--ÌØĞ§´ó°×¾ÔÍè	ÆÕÍ¨´ó°×¾ÔÍè	°×¾ÔÍè
	local tbAexpTask = {AEXP_TIANXING_TIME_TASKID,AEXP_SPECIAL_TIME_TASKID,AEXP_TASKID, AEXP_SMALL_TIME_TASKID,
											--ÌØĞ§¼¼ÄÜ´ó°×¾ÔÍè	¼¼ÄÜ´ó°×¾ÔÍè	¼¼ÄÜ°×¾ÔÍè
												AEXP_SPECIAL_SKILL_TASKID, AEXP_SKILL_TIME_TASKID, AEXP_SMALL_SKILL_TASKID};
	local tbszItem = {"offlineitem_tianxing", "offlineitem_special",	"offlineitem_normal",	"offlineitem_small",
						"skillofflineitem_special",	"skillofflineitem_normal",	"skillofflineitem_small"};
	local szmsg = "";
	for i = 1, getn(tbAexpTask) do
		local nhour, nminite = getFrame2MinAndSec(GetTask(tbAexpTask[i]));	--¸øÓÃ»§ÌáÊ¾ÏÔÊ¾µ½·ÖÖÓ
		szmsg = format("%s\n          %s lasttime:%d hour %d minite", szmsg, tbszItem[i], nhour, nminite);
	end;
	return szmsg;
end;

function writeUseBaiJulog(szitem, nhour,nmin)
	local szlog = format("[OfflineLive]\t%s\tAccount:%s\tName:%s\tuse<%s>, lasttime %d hour %d minite", 
		GetLocalDate("%Y-%m-%d %X"), GetAccount(), GetName(), szitem, nhour, nmin);
	WriteLog(szlog);
end;