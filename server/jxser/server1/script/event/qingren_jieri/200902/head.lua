Include("\\script\\lib\\basic.lua");
Include("\\script\\lib\\pay.lua");
Include("\\script\\lib\\awardtemplet.lua");
Include("\\script\\task\\system\\task_string.lua");

VALENTINE2009_START					= 20090213	-- »î¶¯¿ªÊ¼ÈÕÆÚ
VALENTINE2009_END					= 20090215	-- »î¶¯½áÊøÈÕÆÚ
VALENTINE2009_ITEM_END				= 20090216	-- ÎïÆ·ÓÐÐ§ÆÚ
VALENTINE2009_MAX_DRAW_NUM			= 9			-- ×î´óÁìÈ¡ÊýÁ¿
VALENTINE2009_MAX_USE_NUM			= 9			-- ×î´óÊ¹ÓÃÊýÁ¿
VALENTINE2009_START_TIME			= 200000	-- »î¶¯¿ªÊ¼Ê±¼ä
VALENTINE2009_END_TIME				= 210000	-- »î¶¯½áÊøÊ±¼ä
VALENTINE2009_LEVEL_LIMIT			= 50		-- µÈ¼¶ÏÞÖÆ
VALENTINE2009_AWARD_ROSENUM			= 9			-- ½±ÀøµÄÃµ¹åÊý
VALENTINE2009_AWARD_EXP				= 2000000	-- ½±ÀøµÄ¾­ÑéÖµ
VALENTINE2009_AWARD_EXP_LIMIT		= 54000000	-- ×î´óµÄ½±Àø¾­Ñé

VALENTINE2009_TIME_GROW_B			= 20*18		-- µÚÒ»´Î³É³¤Ê±¼ä			
VALENTINE2009_TIME_WATER_START		= 40*18		-- ¿ªÊ¼½½Ë®Ê±¼ä
VALENTINE2009_TIME_WATER_END		= 50*18		-- ½áÊø½½Ë®Ê±¼ä
VALENTINE2009_TIME_GROW_C			= 70*18		-- µÚ¶þ´Î³É³¤Ê±¼ä
VALENTINE2009_TIME_GROW_D			= 90*18		-- ¿ª»¨Ê±¼ä
VALENTINE2009_TIME_DISAPPEAR		= 120*18	-- ÏûÊ§Ê±¼ä

VALENTINE2009_EDITION				= 1552		-- »î¶¯°æ±¾ºÅ
VALENTINE2009_DATE					= 1553		-- »î¶¯ÈÕÆÚ
VALENTINE2009_DRAW_NUM				= 1560		-- µ±ÈÕÁìÈ¡µÄÊýÄ¿
VALENTINE2009_USE_NUM				= 1561		-- µ±ÈÕÊ¹ÓÃµÄÊýÄ¿
VALENTINE2009_EXPERIENCE			= 1562		-- ×Ü¹²»ñµÃµÄ¾­Ñé

VALENTINE2009_NPC_NAME_BOY			= 1			-- ÄÐº¢Ãû
VALENTINE2009_NPC_NAME_GIRL			= 2			-- Å®º¢Ãû
VALENTINE2009_NPC_HAS_WATER			= 3			-- ÊÇ·ñÒÑ¾­½½Ë®
VALENTINE2009_NPC_STEP				= 4			-- Ä¿Ç°´¦ÓÚµÄ²½Öè
VALENTINE2009_NPC_NAME_BOY2			= 5		-- ÄÐº¢Ãû2
VALENTINE2009_NPC_NAME_GIRL2		= 6			-- Å®º¢Ãû2
VALENTINE2009_NPC_STEP_A			= 1			-- ÐÎÌ¬A
VALENTINE2009_NPC_STEP_B			= 2			-- ÐÎÌ¬B
VALENTINE2009_NPC_STEP_WATER_START	= 3			-- ¿ªÊ¼½½Ë®
VALENTINE2009_NPC_STEP_WATER_END	= 4			-- ½áÊø½½Ë®
VALENTINE2009_NPC_STEP_C			= 5			-- ÐÎÌ¬C
VALENTINE2009_NPC_STEP_D			= 6			-- ÐÎÌ¬D

VALENTINE2009_ITEM_ZHONGZI		= {6, 1, 1927, 1, 0, 0}		-- ÇéÈËÖÖ×Ó
VALENTINE2009_ITEM_TIANXIAN		= {6, 1, 1928, 1, 0, 0}		-- ÌìÏÉË®
VALENTINE2009_ITEM_ROSE			= {6, 0, 20  , 1, 0, 0}		-- Ãµ¹å»¨
VALENTINE2009_NPC_ID 			= {1252, 1253, 1254, 1255} 	-- NPCµÄID
VALENTINE2009_AREA 				= {11,1,37,176,162,78,80,174,121,153,101,99,100,20,53,54,175,55} -- »î¶¯¿ª·ÅµÄµØÍ¼

VALENTINE2009_TALK_MAIN = 
{
	"<color=green>20:00 ®Õn 21:00<color> mçi ngµy tõ 13-02-2009 ®Õn 15-02-2009, c¸c vÞ vâ l©m nh©n sü nhËn nhiÒu nhÊt <color=green>9<color> h¹t gièng t×nh yªu hoÆc Thiªn Tiªn Thñy, c¸c h¹ cã muèn nhËn kh«ng?",
	"Ta muèn nhËn h¹t c©y t×nh nh©n.",
	"Ta muèn nhËn Thiªn Tiªn Thñy.",
	"Ta chØ tiÖn ®­êng ®Õn ch¬i.",
}

VALENTINE2009_TALK_GOODS = 
{
	"H¹t c©y t×nh nh©n",
	"Thiªn Tiªn Thñy",
	"Hoa Hång",
}

VALENTINE2009_TALK_TREENAME			= "C©y t×nh nh©n"
VALENTINE2009_TALK_PLANT			= "Trång ®­îc 1 C©y T×nh Nh©n"
VALENTINE2009_TALK_WATER			= "T­íi n­íc thµnh c«ng"

VALENTINE2009_TALK_ERROR_ANSWER 	= "Ta ®· biÕt råi. "
VALENTINE2009_TALK_ERROR_SEX		= "HiÖp kh¸ch chØ cã thÓ nhËn h¹t c©y t×nh nh©n, n÷ hiÖp chØ cã thÓ nhËn Thiªn Tiªn Thñy, ng­¬i ®õng cã nhËn nhÇm nhÐ!"
VALENTINE2009_TALK_ERROR_LEVEL		= "ChØ cã ng­êi ch¬i cÊp 50 trë lªn míi cã thÓ tham gia ho¹t ®éng, xin h·y cè g¾ng h¬n n÷a!"
VALENTINE2009_TALK_ERROR_PAY		= "ChØ cã ng­êi ch¬i ®· nép thÎ míi cã thÓ tham dù ho¹t ®éng."
VALENTINE2009_TALK_ERROR_MAXNUM		= "Mçi ngµy chØ nhËn nhiÒu nhÊt 9 lÇn, xin h·y ®îi ngµy mai råi nhËn tiÕp."
VALENTINE2009_TALK_ERROR_DATE		= "ChØ cã thÓ nhËn ë thêi ®iÓm ho¹t ®éng tõ 13-02-2009 ®Õn 15-02-2009."
VALENTINE2009_TALK_ERROR_TIME		= "ChØ cã thÓ nhËn tõ 20:00 ®Õn 21:00"
VALENTINE2009_TALK_ERROR_NOTMAN		= "ChØ hiÖp kh¸ch míi cã thÓ sö dông h¹t c©y t×nh nh©n!"
VALENTINE2009_TALK_ERROR_DIE		= "H¹t c©y t×nh nh©n nµy ®· ë tr¹ng th¸i kh« hÐo råi."
VALENTINE2009_TALK_ERROR_MAXUSE		= "Mçi ngµy chØ cã thÓ sö dông 9 lÇn, xin mêi ®îi ngµy mai råi h·y tiÕp tôc."
VALENTINE2009_TALK_ERROR_TEAM		= "ChØ cã 1 tæ ®éi gåm nh©n vËt nam vµ n÷ míi cã thÓ sö dông!"
VALENTINE2009_TALK_ERROR_AREA 		= "ChØ trång c©y ®­îc ë t¹i th«n trÊn vµ thµnh thÞ!"
VALENTINE2009_TALK_ERROR_FIGHT		= "Kh«ng thÓ trång c©y ë tr¹ng th¸i chiÕn ®Êu!"
VALENTINE2009_TALK_ERROR_ARID		= "B×nh Thiªn Tiªn Thñy ®· c¹n n­íc råi!"
VALENTINE2009_TALK_ERROR_NOWATER	= "Hµnh trang cña ng­¬i vÉn ch­a cã Thiªn Tiªn Thñy, xin h·y kiÓm tra l¹i nhÐ!"
