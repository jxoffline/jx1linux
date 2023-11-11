-- Ñ×µÛ±¦²Ø
-- by Ğ¡ÀË¶à¶à
-- 2007.10.24
-- ÎÒ..
-- ÕıÔÚ³¢ÊÔ×Å..
-- Ñ°ÕÒ×ÅÊôÓÚÎÒµÄÌìµØ..

IncludeLib("RELAYLADDER")
IncludeLib("FILESYS")
IncludeLib("TITLE");
IncludeLib("SETTING");

-- Message khi giÕt ®­îc Boss cuèi tİnh n¨ng Viªm §Õ -Modifiled by AnhHH - 20110725
Include("\\script\\lib\\objbuffer_head.lua")

YDBZ_MISSION_MATCH			= 50		-- ±ÈÈümission
YDBZ_TIMER_MATCH				= 87		-- ±ÈÈü¿ªÊ¼¶¨Ê±Æ÷
YDBZ_TIMER_FIGHTSTATE 	= 89		-- ¼ì²âÍæ¼ÒÕ½¶·×´Ì¬¼ÆÊ±Æ÷
YDBZ_NPC_BOSS_COUNT			= 1			-- Õù¶áµØbossÊıÁ¿¼ÆËã
YDBZ_VARV_STATE 				= 4			-- mission×´Ì¬£¬1±íÊ¾±¨Ãû£¬2×¼±¸½×¶Î£¬Í£Ö¹±¨Ãû£¬3¿ªÊ¼±ÈÈü
YDBZ_SIGNUP_WORLD				= 5			-- ±¨ÃûµØÍ¼
YDBZ_SIGNUP_POSX				= 6			-- ±¨ÃûµØµãµÄX×ø±ê
YDBZ_SIGNUP_POSY				= 7			-- ±¨ÃûµØµãµÄY×ø±ê 
YDBZ_NPC_COUNT					= {8,9,10}		-- ¸÷Ğ¡¹ØĞ¡¹Öµş¼Ó
YDBZ_NPC_BOSS_COUNT			= 11		-- Õù¶áµØboss
YDBZ_NPC_WAY						= {12,13,14}	-- ´ïµ½µÄ¹Ø
YDBZ_STATE_SIGN					= 15 		--½ø¶È,YDBZ_STATE_SIGN
YDBZ_TEAM_COUNT					= 16		--²Î¼ÓÕù¶áµÄ¶ÓÎéÊı£¬¼ÆËãÆ÷
YDBZ_TEAM_SUM						=	17		--²Î¼ÓÕù¶áµÄ¶ÓÎé×ÜÊı£¬³£Á¿
YDBZ_NPC_TYPE						= {
	{20,21,22,23,24,25,26,27,28,29},		--AÂ·¼ÇÂ¼¹ÖÎïÀàĞÍ			
	{30,31,32,33,34,35,36,37,38,39},		--BÂ·¼ÇÂ¼¹ÖÎïÀàĞÍ	
	{40,41,42,43,44,45,46,47,48,49},		--CÂ·¼ÇÂ¼¹ÖÎïÀàĞÍ	
}


YDBZ_TEAM_NAME					= {1,2,3}						--A¶ÓÎéÃû	--B¶ÓÎéÃû	--C¶ÓÎéÃû					

YDBZ_TEAMS_TASKID				=	1851			-- ¼ÇÂ¼Íæ¼ÒËùÔÚgroupÈÎÎñ±äÁ¿
YDBZ_PLAY_LIMIT_COUNT   = 1852			-- ²Î¼Ó´ÎÊı±äÁ¿£¬1£¬½ñÄêµÄµÚ¼¸ÖÜ£¬2´ÎÊı £¬3ÈÕ £¬4´ÎÊı
YDBZ_ITEM_YANDILING			= 1853			-- Ñ×µÛÁîÊ¹ÓÃ±äÁ¿¼ÇÂ¼,1Ñ×µÛÁî 2¼ÇÂ¼ÁÙÊ±ÕóÓª
YDBZ_MISSIOM_PLAYER_KEY = 1854			-- Ñ×µÛ¼ÇÂ¼Íæ¼ÒÉíÉÏµÄkey
YDBZ_ITEM_YANDILING_SUM	= 1855			-- Ñ×µÛÁîÊ¹ÓÃ×ÜÊı
YDBZ_LIMIT_SIGNUP				= 5					-- ¿ªÊ¼Ë¢¹ÖÖ®¼äµÄÊ±¼ä£º10Ãë
YDBZ_LIMIT_FINISH 			= 30 * 60		-- ÈÎÎñÊ±¼äÆÚÏŞ£¨Ãë£©£º30·ÖÖÓ
YDBZ_LIMIT_BOARDTIME		= 5	* 60		-- ¹«¸æÊ±¼ä,Ã¿5·ÖÖÓ¹«¸æÒ»´ÎÊ±¼ä
YDBZ_TIME_WAIT_STATE1		= 10				-- É±ÍêÕù¶áµØbossºóµÈ¼¶10Ãë½øÈëÕù¶á½×¶Î
YDBZ_TIME_WAIT_STATE3		= 30				-- ´³¹Ø³É¹¦½áÊøºó£¬µÈ´ı30Ãë±»´«ËÍ³ö³¡µØ
YDBZ_LIMIT_SETFIGHTSTATE= 3					-- Õù¶á½×¶Î£¬Íæ¼Ò±»É±ºóÎŞµĞ×´Ì¬Ê±¼ä3Ãë
YDBZ_LIMIT_TEAMS_COUNT	= 15				-- ¶ÓÎéÊıÁ¿µÄ×î´óÏŞÖÆ
YDBZ_LIMIT_PLAYER_LEVEL = 120				-- Íæ¼Ò×îµÍµÈ¼¶ÏŞÖÆ
YDBZ_LIMIT_WEEK_COUNT		= 10 				-- Ò»ÖÜ²Î¼Ó×î´ó´ÎÊı
YDBZ_LIMIT_DAY_COUNT		= 4 				-- Ã¿Ìì²Î¼Ó×î´ó´ÎÊı
YDBZ_PAIHANG_ID					=	10252			--ÅÅĞĞ°ñID
YDBZ_LIMIT_ITEM					= {{6,1,1604},1,"Anh Hïng ThiÕp"}	--ĞèÒªĞÅÎï£¬Ó¢ĞÛÌû£¬tb1£¬Í¼Æ×ID£¬tb2£¬ĞèÒªÊıÁ¿
YDBZ_LIMIT_DOUBEL_ITEM	= {{6,1,1617},1,"Viªm §Õ LÖnh"}	--Ñ×µÛÁî£¬¿É»ñµÃË«±¶µÄ½±Àø
YDBZ_AWARD_EXP 					= 600000									--Ã¿Í¨¹ıÒ»¹ØÕû¶Ó»ñµÃµÄ¾­Ñé
YDBZ_Faninl_AWARD_EXP		=	300000									--Õù¶áµØboss¾­Ñé
YDBZ_KILLPLAYER_EXP 		= 200000									--É±ËÀÒ»¸öµĞÈË»ñµÃ¾­Ñé£¨É±Íæ¼ÒµÃ¾­Ñé£©
YDBZ_KILLLASTBOSS_EXP		= 1000000									--É±ËÀ×îÖÕboss»ñµÃ¾­Ñé
YDBZ_BOAT_POS 					=													--Íæ¼Ò±»´«ËÍ±¦²Ø³¡µÄ3¸öµãx,y×ø±ê¡£
{
	[1]={60032,104832},
	[2]={59744,123296},
	[3]={52960,121952},
}
YDBZ_FIGHTING_RELIFT = 		--Íæ¼ÒÕù¶áÇø´«ËÍµãºÍÖØÉúµã£¬Ëæ»ú
{
	[1]=
	{
		{57408,112000},
		{57504,112160},
		{57664,112160},
	},
	[2]=
	{
		{58016,114464},
		{57888,114688},
		{58048,114784},
	},
	[3]=
	{
		{56288,112544},
		{56160,112736},
		{56320,112736},
	},
}
-- ±ÈÈüµØÍ¼ID
YDBZ_MAP_MAP = {
	853,
	854,
	855,
	856,
	857,
	858,
	859,
	860,
	861,
	862,
};

-- Message khi giÕt ®­îc Boss cuèi tİnh n¨ng Viªm §Õ -Modifiled by AnhHH - 20110725
local  _Message =  function (nItemIndex)
	local handle = OB_Create()
	local msg = format("Chóc mõng cao thñ <color=yellow>%s<color> thuéc tæ ®éi tiªu diÖt [L­¬ng Mi Nhi] ®· nhËn ®­îc phÇn th­ëng [%s] " ,GetName(),GetItemName(nItemIndex))
	local _, nTongId = GetTongName()
	if (nTongId ~= 0) then
		Msg2Tong(nTongId, msg)
	end
	ObjBuffer:PushObject(handle, msg)
	RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
	OB_Release(handle)
	Msg2Team(msg)
	Msg2SubWorld(msg)
	AddGlobalNews(msg)
end

--½±Àø
YDBZ_ZUANYONG_ITEM =				--×¨ÓÃÎïÆ·
{
	[1] = {"H×nh nh©n",6,1,1605}, -- 1¹Ì¶¨Îª¿şÀÜ
	[2] = {"Viªm §Õ tr­êng mÖnh hoµn",	6,	0,	1607}, 
	[3] = {"Viªm §Õ gia bµo hoµn",	6,	0,	1608}, 
	[4] = {"Viªm §Õ ®¹i lùc hoµn",	6,	0,	1609}, 
	[5] = {"Viªm §Õ cao thiÓm hoµn",	6,	0,	1610}, 
	[6] = {"Viªm §Õ cao trung hoµn",	6,	0,	1611}, 
	[7] = {"Viªm §Õ phi tèc hoµn",	6,	0,	1612}, 
	[8] = {"Viªm §Õ b¨ng phßng hoµn",	6,	0,	1613}, 
	[9] = {"Viªm §Õ l«i phßng hoµn",	6,	0,	1614}, 
	[10] = {"Viªm §Õ hßa phßng hoµn",	6,	0,	1615}, 
	[11] = {"Viªm §Õ ®éc phßng hoµn",	6,	0,	1616}, 

}

-- µôÂäÎïÆ·
YDBZ_tbaward_item ={
	[1]=--Ğ¡¹Ö
	{
	},
	[2]=--Ğ¡¹Øboss
	{--¼¸ÂÊ%,¸öÊı,ÎïÆ·ID,ÊÇ·ñµôµØÉÏ(0,µôµØÉÏ£¬1Ö±½ÓËæ»úµôÒ»¸ö¶ÓÔ±ÉíÉÏ),Ãû³Æ,Ë«±¶ÍèÊÇ·ñÓĞĞ§
		{50,1,{6,1,1605,1,0,0},1,"H×nh nh©n",1},		--¿şÀÜ
		{100,15,{1, 2, 0, 5, 0, 0},0,"Ngò Hoa Ngäc Lé Hoµn",0}, --Îå»¨
--		{10,1,{6,1,1606,1,0,0},1,"Viªm §Õ §å §»ng",1},			--ËéÆ¬
--		{10,1,{6,0,1591,1,0,0},1,"Ñ×µÛ±¦²Ø×¨ÓÃ³¤ÃüÍè",0},
--		{10,1,{6,0,1592,1,0,0},1,"Ñ×µÛ±¦²Ø×¨ÓÃ¼ÓÅÜÍè",0},
--		{10,1,{6,0,1593,1,0,0},1,"Ñ×µÛ±¦²Ø×¨ÓÃ´óÁ¦Íè",0},
--		{10,1,{6,0,1594,1,0,0},1,"Ñ×µÛ±¦²Ø×¨ÓÃ¸ßÉÁÍè",0},
--		{10,1,{6,0,1595,1,0,0},1,"Ñ×µÛ±¦²Ø×¨ÓÃ¸ßÖĞÍè",0},
--		{10,1,{6,0,1596,1,0,0},1,"Ñ×µÛ±¦²Ø×¨ÓÃ·ÉËÙÍè",0},
--		{10,1,{6,0,1597,1,0,0},1,"Ñ×µÛ±¦²Ø×¨ÓÃ±ù·ÀÍè",0},
--		{10,1,{6,0,1598,1,0,0},1,"Ñ×µÛ±¦²Ø×¨ÓÃÀ×·ÀÍè",0},
--		{10,1,{6,0,1599,1,0,0},1,"Ñ×µÛ±¦²Ø×¨ÓÃ»ğ·ÀÍè",0},
--		{10,1,{6,0,1600,1,0,0},1,"Ñ×µÛ±¦²Ø×¨ÓÃ¶¾·ÀÍè",0},
	},
	[3]=--Õù¶áµØĞ¡boss
	{
		{100,1,{6,1,1605,1,0,0},1,"H×nh nh©n",1},		--¿şÀÜ
		{100,30,{1, 2, 0, 5, 0, 0},0,"Ngò Hoa Ngäc Lé Hoµn",0},--Îå»¨
--		{30,1,{6,1,1606,1,0,0},1,"Viªm §Õ §å §»ng",1}			--ËéÆ¬
	},
	-- Thay ®æi phÇn th­ëng Boss cuèi tİnh n¨ng Viªm §Õ -Modifiled by ThanhLD - 20130417	
	[4]=--×îÖÕboss
	{	
		-- [1] = {{szName="Xİch L©n LÖnh",tbProp={6,1,3393,1,0,0},nCount=1,nRate=0.4},},
		-- [2] = {{szName="M¶nh Xİch L©n",tbProp={6,1,3391,1,0,0},nCount=1,nRate=3},},
		-- [3] = {{szName="Xİch L©n Kim Bµi",tbProp={6,1,3392,1,0,0},nCount=1,nRate=4},},
		-- [4] = {{szName="Xİch L©n Tr¶o",tbProp={6,1,3394,1,0,0},nCount=1,nRate=7},},
		-- [5] = {{szName="Xİch L©n Gi¸c",tbProp={6,1,3395,1,0,0},nCount=1,nRate=4},},
		-- [6] = {{szName="Xİch L©n T×nh",tbProp={6,1,3396,1,0,0},nCount=1,nRate=2.5},},
		-- [7] = {{szName="B¹ch Hæ Ph¸t Qu¸n - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.5,tbParam={2,0,0,0,0,0},CallBack = _Message},},
		-- [8] = {{szName="B¹ch Hæ Kim Kh¶i - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.3,tbParam={6,0,0,0,0,0},CallBack = _Message},},
		-- [9] = {{szName="B¹ch Hæ Yªu §¸i - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.5,tbParam={5,0,0,0,0,0},CallBack = _Message},},
		-- [10] = {{szName="B¹ch Hæ H¹ng Liªn - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.5,tbParam={1,0,0,0,0,0},CallBack = _Message},},
		-- [11] = {{szName="B¹ch Hæ Ngäc Béi - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.5,tbParam={9,0,0,0,0,0},CallBack = _Message},},
		-- [12] = {{szName="B¹ch Hæ Hµi - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.5,tbParam={8,0,0,0,0,0},CallBack = _Message},},
		-- [13] = {{szName="B¹ch Hæ Hé UyÓn - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.5,tbParam={4,0,0,0,0,0},CallBack = _Message},},
		-- [14] = {{szName="B¹ch Hæ Th­îng Giíi ChØ - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.5,tbParam={3,0,0,0,0,0},CallBack = _Message},},
		-- [15] = {{szName="B¹ch Hæ H¹ Giíi ChØ - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.5,tbParam={10,0,0,0,0,0},CallBack = _Message},},
		-- [16] = {{szName="B¹ch Hæ Khİ Giíi - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.2,tbParam={7,0,0,0,0,0},CallBack = _Message},},
		-- [17] = {{szName="Xİch L©n Ph¸t Qu¸n - Tù chän hÖ ph¸i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.04,tbParam={2,0,0,0,0,0},CallBack = _Message},},
		-- [18] = {{szName="Xİch L©n Kim Kh¶i - Tù chän hÖ ph¸i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.02,tbParam={6,0,0,0,0,0},CallBack = _Message},},
		-- [19] = {{szName="Xİch L©n Yªu §¸i - Tù chän hÖ ph¸i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.04,tbParam={5,0,0,0,0,0},CallBack = _Message},},
		-- [20] = {{szName="Xİch L©n H¹ng Liªn - Tù chän hÖ ph¸i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.04,tbParam={1,0,0,0,0,0},CallBack = _Message},},
		-- [21] = {{szName="Xİch L©n Ngäc Béi - Tù chän hÖ ph¸i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.04,tbParam={9,0,0,0,0,0},CallBack = _Message},},
		-- [22] = {{szName="Xİch L©n Hµi - Tù chän hÖ ph¸i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.04,tbParam={8,0,0,0,0,0},CallBack = _Message},},
		-- [23] = {{szName="Xİch L©n Hé UyÓn - Tù chän hÖ ph¸i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.04,tbParam={4,0,0,0,0,0},CallBack = _Message},},
		-- [24] = {{szName="Xİch L©n Th­îng Giíi ChØ - Tù chän hÖ ph¸i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.04,tbParam={3,0,0,0,0,0},CallBack = _Message},},
		-- [25] = {{szName="Xİch L©n H¹ Giíi ChØ - Tù chän hÖ ph¸i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.04,tbParam={10,0,0,0,0,0},CallBack = _Message},},
		-- [26] = {{szName="Xİch L©n Khİ Giíi - Tù chän hÖ ph¸i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.02,tbParam={7,0,0,0,0,0},CallBack = _Message},},
		-- [27] = {{szName="Cµn Kh«n Song TuyÖt Béi",tbProp={6,1,2219,1,0,0},nCount=1,nRate=0.6,nExpiredTime=43200},},
		-- [28] = {{szName="Cèng HiÕn LÔ bao",tbProp={6,1,30214,1,0,0},nCount=1,nRate=10,nExpiredTime=10080},},
		-- [29] = {{szName="KiÕn ThiÕt LÔ Bao",tbProp={6,1,30216,1,0,0},nCount=1,nRate=10,nExpiredTime=10080},},
		-- [30] = {{szName="ChiÕn BŞ LÔ Bao",tbProp={6,1,30218,1,0,0},nCount=1,nRate=10,nExpiredTime=10080},},
		-- [31] = {{szName="Bao D­îc hoµn ",tbProp={6,1,910,1,0,0},nCount=1,nRate=15,nExpiredTime=20160},},
		-- [32] = {{szName="B¹ch Hæ Trïng LuyÖn Ngäc",tbProp={6,1,3187,1,0,0},nCount=1,nRate=3},},
		-- [33] = {{szName="M¹c B¾c TruyÒn Tèng LÖnh",tbProp={6,1,1448,1,0,0},nCount=1,nRate=5,nExpiredTime=20160},},
		-- [34] = {{szName="Vâ L©m MËt TŞch",tbProp={6,1,26,1,0,0},nCount=1,nRate=6},},
		-- [35] = {{szName="TÈy Tñy Kinh",tbProp={6,1,22,1,0,0},nCount=1,nRate=6},},
		-- [36] = {{szName="Thiªn Linh §¬n",tbProp={6,1,3022,1,0,0},nCount=1,nRate=5,nExpiredTime=10080},},
		-- [37] = {{szName="§¹i lùc hoµn lÔ bao",tbProp={6,1,2517,1,0,0},nCount=1,nRate=7,nExpiredTime=10080},},
		-- [38] = {{szName="Phi tèc hoµn lÔ bao",tbProp={6,1,2520,1,0,0},nCount=1,nRate=7,nExpiredTime=10080},},
		-- [39] = {{szName="Qu¶ Hoµng Kim",tbProp={6,1,907,1,0,0},nCount=1,nRate=10,nExpiredTime=10080},},

	},
}

-- 2011.03.23
YDBZ_tbaward_item_ex = 
{
	[1] = {szName="Viªm §Õ Bİ B¶o",tbProp={6,1,2805,1,0,0}},		-- Ñ×µÛÃØ±¦pÓĞ´ıĞŞ¸Ä
}

--
-- NPC±í¸ñÁĞº¬Òå
-- NPC²ÎÊı¸÷ÁĞµÄº¬Òå£ººóĞø´¦Àí¡¢ID¡¢Ãû×Ö¡¢µÈ¼¶¡¢ÎåĞĞ¡¢ÊÇ·ñBOSS(0,1)¡¢ÊıÁ¿¡¢Î»ÖÃ
YDBZ_NPC_ATTRIDX_PROCEED		= 1			-- NPCºóĞø´¦Àí
YDBZ_NPC_ATTRIDX_ID			= 2			-- NPCµÄID
YDBZ_NPC_ATTRIDX_NAME		= 3			-- NPCÃû×Ö
YDBZ_NPC_ATTRIDX_LEVEL		= 4			-- NPCµÈ¼¶
YDBZ_NPC_ATTRIDX_SERIES		= 5			-- NPCÎåĞĞ
YDBZ_NPC_ATTRIDX_ISBOSS		= 6			-- ÊÇ·ñBOSS
YDBZ_NPC_ATTRIDX_COUNT		= 7			-- NPCÊıÁ¿
YDBZ_NPC_ATTRIDX_POSITION	= 8			-- NPCÎ»ÖÃ
--

YDBZ_SCRIPT_NPC_DEATH 	= "\\script\\missions\\yandibaozang\\npc_death.lua"
YDBZ_SCRIPT_PLAYER_DEATH = "\\script\\missions\\yandibaozang\\player_death.lua"
--
---- ÎåĞĞ
YDBZ_map_series = {
	0,	-- ½ğ
	1,	-- Ä¾
	2,	-- Ë®
	3,	-- »ğ
	4,	-- ÍÁ
};


YDBZ_mapfile_trap =
{
	{"\\settings\\maps\\yandibaozang\\trap\\a","\\script\\missions\\yandibaozang\\trap\\a",10,"\\settings\\maps\\yandibaozang\\trap\\clear\\a"},
	{"\\settings\\maps\\yandibaozang\\trap\\b","\\script\\missions\\yandibaozang\\trap\\b",10,"\\settings\\maps\\yandibaozang\\trap\\clear\\b"},
	{"\\settings\\maps\\yandibaozang\\trap\\c","\\script\\missions\\yandibaozang\\trap\\c",10,"\\settings\\maps\\yandibaozang\\trap\\clear\\c"},
}