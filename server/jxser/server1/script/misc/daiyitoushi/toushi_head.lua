-- ====================== ÎÄ¼þÐÅÏ¢ ======================

-- ½£ÏÀÇéÔµÍøÂç°æÒ»¡°´øÒÕÍ¶Ê¦¡±Í·ÎÄ¼þÎÄ¼þ

-- Edited by ×Ó·Çô~
-- 2008/02/28 12:10

-- ======================================================

IncludeLib("FILESYS");
IncludeLib("SETTING");
Include("\\script\\global\\skills_table.lua");				-- ¸÷ÃÅÅÉ¡¢¸÷µÈ¼¶¼¼ÄÜ×Ü±í
Include("\\script\\task\\system\\task_string.lua");			-- ¶Ô»°ÎÄ×Ö´¦Àí
Include("\\script\\lib\\common.lua");						--


FILE_SKILLEXP			= "\\settings\\npc\\player\\magic_level_exp.txt";
TB_TOUSHI_SKILLEXP		= {};

function toushiLoadMagicLevelExp()
	local b1			= TabFile_Load(FILE_SKILLEXP, "DaiYiTouShiLevelExp");
	
	if b1~=1 then
		print("Error!!!! Load Magic_Level_Exp File Error!!!");
		return
	end
	
	local nRowCount = TabFile_GetRowCount("DaiYiTouShiLevelExp")
	local nColCount = TabFile_GetColCount("DaiYiTouShiLevelExp")
	
	for y = 2, nRowCount do
		local nSkill				= tonumber(TabFile_GetCell("DaiYiTouShiLevelExp", y, "MAGICID"));
		TB_TOUSHI_SKILLEXP[nSkill]	= {};
		
		for k = 1, nColCount - 3 do
			TB_TOUSHI_SKILLEXP[nSkill][k]	= tonumber(TabFile_GetCell("DaiYiTouShiLevelExp", y, "LEVEL"..k));
		end
	end
end
toushiLoadMagicLevelExp();

LV120_SKILL_ID				=	2463					-- ¼ÍÂ¼Íæ¼Ò120¼¶¼¼ÄÜID
TSK_LV150_SKILL				=	2885					-- 150¼¶¼¼ÄÜÈÎÎñTaskID
TSK_TOUSHI_FLAG				=	1881					-- ¡°´øÒÕÍ¶Ê¦¡±ÍË³öÃÅÅÉµÄ±ê¼Ç
													--	 0£ºÎ´ÉêÇë×ªÍ¶ÃÅÅÉ»ò×ªÍ¶ÃÅÅÉ³É¹¦£¨Óë×ªÖ°´ÎÊýÒ»Æð¾ö¶¨£©£»1£º³É¹¦ÉêÇë×ªÍ¶ÃÅÅÉ£»
TSK_ZHENPAILINGDAN_USECNT	=	1882;
TSK_TOUSHI_COUNT			=	1883;					-- ¡°´øÒÕÍ¶Ê¦¡±×ªÖ°µÄ´ÎÊý
TSK_LAST_CHANGE_FACTION     =   2604;                   -- ÉÏ´Î×ªÃÅÅÉÊ±¼ä Ïà¶ÔÊ±¼ä(µ¥Î»:Ãë)

TOUSHI_FACTION_CHUSHI	=	70*256;					-- ÃÅÅÉÈÎÎñ³öÊ¦×´Ì¬
TOUSHI_FACTION_HUISHI	=	80*256;					-- ÃÅÅÉÈÎÎñ³öÊ¦×´Ì¬
TOUSHI_90SKILL_TASK		=	255;					-- 90¼¶¼¼ÄÜÈÎÎñ×´Ì¬
TOUSHI_150SKILL_TASKSTATE	=	14;					-- 150¼¶¼¼ÄÜÈÎÎñ×´Ì¬
TOUSHI_COLDDOWN_TIME    =   60*24*60*60;                     -- ×ªÃÅÅÉÀäÈ´Ê±¼ä(µ¥Î»:Ãë)

TOUSHI_UNKNOWN		= -1;				-- Î´Öª´íÎó
TOUSHI_SUCCEED		= 1;				-- Ìõ¼þÅÐ¶Ï³É¹¦
TOUSHI_LVLERR		= 2;				-- ½ÇÉ«µÈ¼¶²»Âú×ã
TOUSHI_FLAGERR		= 3;				-- ½ÇÉ«²»¾ßÓÐ×ªÍ¶Ê¦ÃÅµÄ±ê¼Ç£¨×Ê¸ñ£©
TOUSHI_LGERR		= 4;				-- ½ÇÉ«²»Âú×ã½âÉ¢»òÍË³öÕ½¶ÓÌõ¼þ
TOUSHI_EQUIPERR		= 5;				-- ½ÇÉ«²»Âú×ãÐ¶ÏÂ×°±¸Ìõ¼þ
TOUSHI_REDOERR		= 6;				-- ½ÇÉ«ÒÑ×ªÍ¶¹ýÐÂÊ¦ÃÅ£¬²»ÄÜÔÙ´Î×ªÍ¶
TOUSHI_EQFACTERR	= 7;				-- ×ªÍ¶ÃÅÅÉ²»ÄÜÊÇµ±Ç°ÃÅÅÉ
TOUSHI_MALEERR		= 8;				-- ´äÑÌ¶ëÃ¼²»½ÓÊÜÄÐµÜ×Ó
TOUSHI_FEMALEERR	= 9;				-- ÉÙÁÖÅÉ²»½ÓÊÜÅ®µÜ×Ó
TOUSHI_TWFEMALEERR	= 10;				-- Å®ÐÔ½ÇÉ«Ã»ÓÐ¡°ÑîçøµÄÐÅÎï¡±²»ÄÜ¼ÓÈëÌìÍõ°ï
TOUSHI_NOFACTERR	= 11;				-- °×Ãû½ÇÉ«²»ÄÜ¡°´øÒÕÍ¶Ê¦¡±
TOUSHI_NOFREEBAG	= 12;				-- ±³°ü¿Õ¼ä²»×ã
TOUSHI_TIMEERR	    = 13;				-- ×ªÃÅÅÉÀäÈ´Ê±¼äÎ´µ½
TOUSHI_NO_HUASHAN_ITEM = 14
TOUSHI_TRANSLIFE_COUNT_LIMIT = 15
TRANS_COUNT_LIMIT = 5

TB_TOUSHI_MENPAIXINWU		= {6, 1, 1670}				-- ÃÅÅÉÐÅÎïIDKey
TB_TOUSHI_YANGYINGXINWU		= {6, 1, 1671}				-- ÑîçøÐÅÎïIDKey
TB_TOUSHI_ZHENPAILINGDAN	= {6, 1, 1704, 1, 0, 0}		-- ÕòÅÉÁéµ¤
TB_TOUSHI_ZHENPAILINGYAO	= {6, 1, 1705, 1, 0, 0}		-- ÕòÅÉÁéÒ©
TB_TOUSHI_HIERARCH			= {"Ch­ëng m«n", "Gi¸o chñ", "Bang chñ "};	-- ¸÷ÃÅÅÉ¶ÔÕÆÃÅµÄ²»Í¬³Æºô
TB_TOUSHI_ERR_MSG			= 							-- ´íÎóÌáÊ¾ÐÅÏ¢
	{
		[TOUSHI_UNKNOWN]		= "<dec><npc>Kh«ng thÓ lµm nh­ vËy ®­îc.",
		[TOUSHI_LVLERR]			= "<dec><npc>HiÖn t¹i ng­¬i vÉn ch­a ®ñ {cÊp 120}, h·y ®i rÌn luyÖn thªm ®i!",
		[TOUSHI_FLAGERR]		= "<dec><npc>Muèn gia nhËp bæn bang, ch­ëng m«n cña ng­¬i ®· ®ång ý ch­a?",
		[TOUSHI_LGERR]			= "<dec><npc>Muèn gia nhËp bæn bang, cÇn ph¶i {gi¶i t¸n quan hÖ chiÕn ®éi liªn ®Êu}.",
		[TOUSHI_EQUIPERR]		= "<dec><npc>Muèn gia nhËp bæn bang, cÇn ph¶i cëi hÕt trang bÞ trªn ng­êi xuèng!",
		[TOUSHI_REDOERR]		= "<dec><npc><sex> ®· chuyÓn thµnh c«ng sang m«n ph¸i míi.",
		[TOUSHI_EQFACTERR]		= "<dec><npc>S­ phô cho phÐp ng­¬i xuèng nói t×m con ®­êng vâ häc míi, vµ còng hi väng ng­¬i cã ngµy hïng b¸ thiªn h¹",
		[TOUSHI_MALEERR]		= "<dec><npc>VÞ <sex> ®· t×m ®Êy ®Õn ®©y, ch¾c còng ®· biÕt tÊt c¶ sù viÖc tõ ch­ëng m«n mµ ®Õn. Nh­ng mµ ng­¬i kh«ng phï hîp gia nhËp víi m«n ph¸i.",
		[TOUSHI_TWFEMALEERR]	= "<dec><npc>Ng­¬i vÉn ch­a cã tÝn vËt cña bæn bang chñ, kh«ng thÓ gia nhËp ®­îc m«n ph¸i.",
		[TOUSHI_NOFACTERR]		= "<dec><npc>ThËt lµ kú l¹! Ta nhËn kh«ng ra ng­¬i tu luyÖn vâ c«ng thuéc m«n ph¸i nµo?",
		[TOUSHI_NOFREEBAG]		= "<dec><npc>Hµnh trang kh«ng ®ñ, h·y s¾p xÕp råi quay l¹i nhÐ.",
		[TOUSHI_TIMEERR]		= format("<dec><npc>Sau khi chuyÓn m«n ph¸i <color=green>%d<color> ngµy míi cã thÓ tiÕp tôc chuyÓn.", TOUSHI_COLDDOWN_TIME/(24*60*60)),
		[TOUSHI_NO_HUASHAN_ITEM] = "<dec><npc>trªn ng­êi ng­¬i kh«ng cã Hoa S¬n Kú Th­, kh«ng thÓ gia nhËp ph¸i Hoa S¬n.",
		[TOUSHI_TRANSLIFE_COUNT_LIMIT] = format("CÇn ph¶i trïng sinh Ýt nhÊt %d lÇn míi cã thÓ gia nhËp bæn ph¸i", TRANS_COUNT_LIMIT)
	}

TB_TOUSHI_ERR_MSG[TOUSHI_FEMALEERR] = TB_TOUSHI_ERR_MSG[TOUSHI_MALEERR];

TB_DAIYITOUSHI_FACTS = 					-- ¸÷ÃÅÅÉ ¼¼ÄÜ ³ÆºÅµÈ
	{
--		{-- 
--			ÃÅÅÉÃû,	ÃÅÅÉID,	ÕóÓª,	Í·ÏÎID,	ÊôÐÔ
--			ÈÎÎñID, 
--			137µÄ±äÁ¿,	137±äÁ¿µÄÖµ,		// ¾ÍÕâÒ»ÏîÀ´Ëµ£¬¸ã²»Ã÷°×ÊÇ×öÊ²Ã´µÄ£¬ÈëÃÅµÄÊ±ºòÉèÖÃ
--			¼¼ÄÜTab,
--			ÈëÃÅ¹«¸æ,
--		},	
		{-- ÉÙÁÖ
			szFacName		=	"shaolin",	nFacNumb	=	0,	nCamp	=	1,	nRankId	=	72,	nSeries	=	0,
			nTaskId_Fact	=	7,
			nTaskId_90Skill	=	122,
			nTaskId_137 	=	137,		nValue_137	=	67,
			tbSkillID		=	{
							[10]	=	{
											14,		-- ÐÐÁú²»Óê[14]
											10,		-- ½ð¸Õ·üÄ§[10]£¨ÈëÃÅ£©
										},
										
							[20]	=	{
											8,		-- ÉÙÁÖÈ­·¨[8]
											4,		-- ÉÙÁÖ¹÷·¨[4]£¨10¼¶£©
											6,		-- ÉÙÁÖµ¶·¨[6]£¨10¼¶£©
										},
										
							[30]	=	{
											15,		-- ²»¶¯Ã÷Íõ[15]£¨20¼¶£©
										},
										
							[40]	=	{
											16,		-- ÂÞººÕó[16]£¨30¼¶£©
										},
										
							[50]	=	{
											20,		-- Ê¨×Óºð [20]£¨40¼¶£©
										},
										
							[60]	=	{
											271,	-- Áú×¦»¢×¥[271]
											11,		-- ºáÉ¨ÁùºÏ [11]£¨50¼¶£©
											19,		-- Ä¦Ú­ÎÞÁ¿ [19]£¨50¼¶£©
										},
										
							[70]	=	{
											273,	-- ÈçÀ´Ç§Ò¶[273]
											21,		-- Ò×½î¾­[21]£¨60¼¶£©
										},
										
							[90]	=	{
											{318, 1, "QuyÒn ph¸p"},	-- ´ïÄ¦¶É½­[318]			Ìí¼ÓÊìÁ·¶È¼¼ÄÜ ÖÁÉÙÌí¼ÓÎª1¼¶
											{319, 1, "C«n ph¸p"},	-- ºáÉ¨Ç§¾ü[319]£¨90¼¶£©
											{321, 1, "§ao ph¸p"},	-- ÎÞÏàÕ¶  [321]£¨90¼¶£©
										},
										
							[120]	=	{
											{709, 1}
										},
										
							[150]	=	{
											{1055, 1, "QuyÒn ph¸p"},	-- ´óÁ¦½ð¸ÕÕÆ[318]			Ìí¼ÓÊìÁ·¶È¼¼ÄÜ ÖÁÉÙÌí¼ÓÎª1¼¶
											{1056, 1, "C«n ph¸p"},	-- Î¤ÍÓÏ×èÆ[319]£¨90¼¶£©
											{1057, 1, "§ao ph¸p"},	-- Èþ½ä¹éìø[321]£¨90¼¶£©
										},
						},
			szMsg = "KÓ tõ h«m nay %s gia nhËp m«n ph¸i ThiÕu L©m, sau nµy nhê c¸c huynh chØ gi¸o!",
		},	
		
		{-- ÌìÍõ
			szFacName		=	"tianwang",	nFacNumb	=	1,	nCamp	=	3,	nRankId	=	69,	nSeries	=	0,
			nTaskId_Fact	=	3,
			nTaskId_90Skill	=	121,
			nTaskId_137		=	137,		nValue_137	=	63,
			tbSkillID		=	{
							[10]	=	{
											34,		-- ¾ªÀ×Õ¶[34]  £¨ÈëÃÅ£©
											30,		-- »Ø·çÂäÑã[30]£¨ÈëÃÅ£©
											29,		-- Õ¶Áú¾÷[29]  £¨ÈëÃÅ£©
										},
										
							[20]	=	{
											26,		-- ÌìÍõ´¸·¨[26]£¨10¼¶£©
											23,		-- ÌìÍõÇ¹·¨[23]£¨10¼¶£©
											24,		-- ÌìÍõµ¶·¨[24]£¨10¼¶£©
										},
										
							[30]	=	{
											33,		-- ¾²ÐÄ¾÷[33]  £¨20¼¶£©
										},
										
							[40]	=	{
											37,		-- ÆÃ·çÕ¶  [37]£¨30¼¶£©
											35,		-- Ñô¹ØÈýµþ[35]£¨30¼¶£©
											31,		-- ÐÐÔÆ¾÷  [31]£¨30¼¶£©
										},
										
							[50]	=	{
											40,		-- ¶Ï»ê´Ì  [40]£¨40¼¶£©
										},
										
							[60]	=	{
											42,		-- ½ðÖÓÕÖ  [42]£¨50¼¶£©
										},
										
							[70]	=	{
											32,		-- ÎÞÐÄÕ¶  [32] £¨60¼¶£©
											36,		-- ÌìÍõÕ½Òâ[36]£¨ÕòÅÉ£©
											41,		-- ÑªÕ½°Ë·½[41] £¨60¼¶£©
											324,	-- ³ËÁú¾÷  [324]£¨60¼¶£©
										},
										
							[90]	=	{
											{322, 1, "§ao ph¸p"},	-- ÆÆÌìÕ¶  £¨90¼¶£©
											{323, 1, "Th­¬ng ph¸p"},	-- ×·ÐÇÖðÔÂ£¨90¼¶£©
											{325, 1, "Chïy ph¸p"},	-- ×··ç¾÷  £¨90¼¶£©
										},
										
							[120]	=	{
											{708, 1}	--
										},
										
							[150]	=	{
											{1058, 1, "§ao ph¸p"},	-- ºÀÐÛÕ¶
											{1060, 1, "Th­¬ng ph¸p"},	-- °ÔÍõöÉ½ð
											{1059, 1, "Chïy ph¸p"},	-- ×Ýºá°Ë»Ä
										},
						},
			szMsg = "KÓ tõ h«m nay %s gia nhËp Thiªn V­¬ng, nhê c¸c s­ huynh chØ gi¸o!",
		},
		
		{-- ÌÆÃÅ
			szFacName		=	"tangmen",	nFacNumb	=	2,	nCamp	=	3,	nRankId	=	76,	nSeries	=	1,
			nTaskId_Fact	=	2,
			nTaskId_90Skill	=	123,
			nTaskId_137		=	137,	nValue_137	=	62,
			tbSkillID		=	{
							[10]	=	{
											45,		-- Åùö¨µ¯[45 ]£¨ÈëÃÅ£©
										},
										
							[20]	=	{
											43,		-- ÌÆÃÅ°µÆ÷[43 ]£¨10¼¶£©
											347,	-- µØÑæ»ð[347]£¨10¼¶£©
										},
										
							[30]	=	{
											303,	-- ¶¾´Ì¹Ç  [303]£¨20¼¶£©
										},
										
							[40]	=	{
											50,		-- ×·ÐÄ¼ý  [50 ]£¨30¼¶£©
											54,		-- ÂþÌì»¨Óê[54 ]£¨30¼¶£©
											47,		-- ¶á»êïÚ  [47 ]£¨30¼¶£©
											343,	-- ´©ÐÄ´Ì  [343]£¨30¼¶£©
										},
										
							[50]	=	{
											345,	-- º®±ù´Ì  [345]£¨40¼¶£©
										},
										
							[60]	=	{
											349,	-- À×»÷Êõ[349]£¨50¼¶£©
										},
										
							[70]	=	{
											249,	-- Ð¡Àî·Éµ¶[249]£¨60¼¶£©
											48,		-- ÐÄÑÛ  [48 ]£¨ÕòÅÉ£©
											58,		-- ÌìÂÞµØÍø[58 ]£¨60¼¶£©
											341,	-- É¢»¨ïÚ  [341]£¨60¼¶£©
										},
										
							[90]	=	{
											{339, 1, "Phi §ao"},	-- Éã»êÔÂÓ°[339]£¨90¼¶£©
											{302, 1, "Ná tiÔn"},	-- ±©ÓêÀæ»¨[302]£¨90¼¶£©
											{342, 1, "Phi Tiªu"},	-- ¾Å¹¬·ÉÐÇ[342]£¨90¼¶£©
											{351,1},	--loan hoan kich
										},
										
							[120]	=	{
											{710, 1}
										},
										
							[150]	=	{
											{1069, 1, "Phi §ao"},	-- ÎÞÓ°´©
											{1070, 1, "Ná tiÔn"},	-- ÌúÁ«ËÄÉ±
											{1071, 1, "Phi Tiªu"},	-- Ç¬À¤Ò»ÖÀ
											1110,	-- Åùö¨ÂÒ»·»÷
										},
						},
			szMsg = "KÓ tõ h«m nay, %s gia nhËp §­êng m«n, c¶m phiÒn c¸c s­ huynh s­ tû chØ gi¸o!",
		},
		
		{-- Îå¶¾
			szFacName		=	"wudu",	nFacNumb	=	3,	nCamp	=	2,	nRankId	=	80,	nSeries	=	1,
			nTaskId_Fact	=	10,
			nTaskId_90Skill	=	124,
			nTaskId_137		=	137,	nValue_137	=	70,
			tbSkillID		=	{
							[10]	=	{
											63,		-- ¶¾É°ÕÆ  [63]£¨ÈëÃÅ£©
											65,		-- Ñªµ¶¶¾É±[65]£¨ÈëÃÅ£©
										},
										
							[20]	=	{
											62,		-- Îå¶¾ÕÆ·¨[62]£¨10¼¶£©
											60,		-- Îå¶¾µ¶·¨[60]£¨10¼¶£©
											67,		-- ¾ÅÌì¿ñÀ×[67]£¨10¼¶£©
										},
										
							[30]	=	{
											70,		-- ³àÑæÊ´Ìì[70]£¨20¼¶£©
											66,		-- ÔÓÄÑÒ©¾­[66]£¨20¼¶£©
										},
										
							[40]	=	{
											68,		-- ÓÄÚ¤÷¼÷Ã[68 ]£¨30¼¶£©
											384,	-- °Ù¶¾´©ÐÄ[384]£¨30¼¶£©
											64,		-- ±ùÀ¶Ðþ¾§[64 ]£¨30¼¶£©
											1029,		-- ÎÞÐÎ¹Æ  [69]£¨30¼¶£©
										},
										
							[50]	=	{
											356,	-- ´©ÒÂÆÆ¼×  [356]£¨40¼¶£©
											73,		-- Íò¹ÆÊ´ÐÄ[73 ]£¨40¼¶£©
										},
										
							[60]	=	{
											72,		-- ´©ÐÄ¶¾´Ì[72]£¨50¼¶£©
											
										},
										
							[70]	=	{
											71,		-- Ììî¸µØÉ·ÊÖ[71 ]£¨60¼¶£©
											75,		-- Îå¶¾Ææ¾­[75]£¨ÕòÅÉ£©
											74,		-- Öì¸òÇàÚ¤  [74 ]£¨60¼¶£©
										},
										
							[90]	=	{
											{353, 1, "Ch­ëng ph¸p"},	-- Òõ·çÊ´¹Ç[353]£¨90¼¶£©
											{355, 1, "§ao ph¸p"},	-- ÐþÒõÕ¶  [355]£¨90¼¶£©
											{390,1},	-- [390]£¨90¼¶£©
										},
										
							[120]	=	{
											{711, 1}
										},
										
							[150]	=	{
											{1066, 1, "Ch­ëng ph¸p"},	-- ÐÎÏú¹ÇÁ¢
											{1067, 1, "§ao ph¸p"},	-- ÓÄ»êÊÉÓ°
										},
						},
			szMsg = "KÓ tõ h«m nay, %s gia nhËp m«n Ngò §éc gi¸o, c¶m phiÒn c¸c s­ huynh s­ tû chØ gi¸o!",
		},
		
		{-- ¶ëÃ¼
			szFacName		=	"emei",	nFacNumb	=	4,	nCamp	=	1,	nRankId	=	64,	nSeries	=	2,
			nTaskId_Fact	=	1,
			nTaskId_90Skill	=	125,
			nTaskId_137		=	137,	nValue_137 = 61,
			tbSkillID		=	{
							[10]	=	{
											85,		-- Ò»Ò¶ÖªÇï[85]£¨ÈëÃÅ£©
											80,		-- Æ®Ñ©´©ÔÆ[80]£¨ÈëÃÅ£©
										},
										
							[20]	=	{
											77,		-- ¶ëáÒ½£·¨[77]£¨10¼¶£©
											79,		-- ¶ëáÒÕÆ·¨[79]£¨10¼¶£©
										},
										
							[30]	=	{
											93,		-- ´Èº½ÆÕ¶É[93]£¨20¼¶£©
										},
										
							[40]	=	{
											385,	-- ÍÆ´°ÍûÔÂ[385]£¨30¼¶£©
											82,		-- ËÄÏóÍ¬¹é[82]£¨30¼¶£©
											89,		-- ÃÎµû    [89]£¨30¼¶£©
										},
										
							[50]	=	{
											86,		-- Á÷Ë®    [86 ]£¨40¼¶£©
										},
										
							[60]	=	{
											92,		-- ·ðÐÄ´ÈÓÓ[92]£¨50¼¶£©
										},
										
							[70]	=	{
											88,		-- ²»Ãð²»¾ø[88]£¨60¼¶£©
											252,	-- ·ð·¨ÎÞ±ß[252]£¨ÕòÅÉ£©
											91,		-- ·ð¹âÆÕÕÕ[91]£¨60¼¶£©
											282,	-- ÇåÒôèó³ª[282]£¨60¼¶£©	
										},
										
							[90]	=	{
											{328, 1, "KiÕm ph¸p"},	-- Èý¶ëö«Ñ©[328]£¨90¼¶£©
											{380, 1, "Ch­ëng ph¸p"},	-- ·çËªËéÓ°[380]£¨90¼¶£©
											{332,1},	-- ÆÕ¶ÉÖÚÉú[332]£¨90¼¶£©
										},
										
							[120]	=	{
											{712, 1}
										},
										
							[150]	=	{
											{1061, 1, "KiÕm ph¸p"},	-- ½£»¨Íì¾§
											{1062, 1, "Ch­ëng ph¸p"},	-- ±ùÓêçó¾§
											{1114, 1, "Hç trî "},	-- ÓñÈªÐÄ¾­
										},
						},
			szMsg = "KÓ tõ h«m nay, %s gia nhËp Nga My ph¸i, c¶m phiÒn c¸c s­ tû chØ gi¸o",
		},
		
		{-- ´äÑÌ
			szFacName		=	"cuiyan",	nFacNumb	=	5,	nCamp	=	3,	nRankId	=	67,	nSeries	=	2,
			nTaskId_Fact	=	6,
			nTaskId_90Skill	=	126,
			nTaskId_137		=	137,	nValue_137	=	66,
			tbSkillID = {
							[10]	=	{
											99,		-- ·ç»¨Ñ©ÔÂ[99 ]£¨ÈëÃÅ£©
											102,	-- ·ç¾í²ÐÑ©[102]£¨ÈëÃÅ£©
										},
										
							[20]	=	{
											95,		-- ´äÑÌµ¶·¨[95 ]£¨10¼¶£©
											97,		-- ´äÑÌË«µ¶[97 ]£¨10¼¶£©
										},
										
							[30]	=	{
											269,	-- ±ùÐÄÙ»Ó°[269]£¨20¼¶£©
										},
										
							[40]	=	{
											105,	-- Óê´òÀæ»¨[105]£¨30¼¶£©
											113,	-- ¸¡ÔÆÉ¢Ñ©[113]£¨30¼¶£©
										},
										
							[50]	=	{
											100,	-- »¤Ìåº®±ù[100]£¨30¼¶£©
										},
										
							[60]	=	{
											109,	-- Ñ©Ó°    [109]£¨40¼¶£©
										},
										
							[70]	=	{
											108,	-- ÄÁÒ°Á÷ÐÇ[108]£¨60¼¶£©
											114,	-- ±ù¹ÇÑ©ÐÄ[114]£¨ÕòÅÉ£©
											111,	-- ±Ìº£³±Éú[111]£¨60¼¶£©
										},
										
							[90]	=	{
											{336, 1, "§ao ph¸p"},	-- ±ù×ÙÎÞÓ°[336]£¨90¼¶£©
											{337, 1, "Song ®ao"},	-- ±ùÐÄÏÉ×Ó[337]£¨90¼¶£©
										},
										
							[120]	=	{
											{713, 1}
										},
										
							[150]	=	{
											{1063, 1, "§ao ph¸p"},	-- ±ùÈ¸Ô½Ö¦
											{1065, 1, "Song ®ao"},	-- Ë®Ó³ÂüÐã
										},
						},
			szMsg = "KÓ tõ h«m nay, %s gia nhËp Thóy Yªn m«n, c¶m phiÒn c¸c s­ tû chØ gi¸o!",
		},
		
		{-- Ø¤°ï
			szFacName		=	"gaibang",	nFacNumb	=	6,	nCamp	=	1,	nRankId	=	78,	nSeries	=	3,
			nTaskId_Fact	=	8,
			nTaskId_90Skill	=	128,
			nTaskId_137		=	137,	nValue_137	=	68,
			tbSkillID		=	{
							[10]	=	{
											122,	-- ¼ûÈËÉìÊÖ[122]£¨ÈëÃÅ£©
											119,	-- ÑØÃÅÍÐ²§[119]£¨ÈëÃÅ£©
										},
										
							[20]	=	{
											116,	-- Ø¤°ïÕÆ·¨[116]£¨10¼¶£©
											115,	-- Ø¤°ï°ô·¨[115]£¨10¼¶£©
										},
										
							[30]	=	{
											129,	-- »¯ÏÕÎªÒÄ[129]£¨20¼¶£©
										},
										
							[40]	=	{
											274,	-- ½µÁúÕÆ[274]£¨30¼¶£©
											124,	-- ´ò¹·Õó[124]£¨30¼¶£©
										},
										
							[50]	=	{
											277,	-- »¬²»ÁôÊÖ[277]£¨40¼¶
										},
										
							[60]	=	{
											128,	-- ¿ºÁúÓÐ»Ú[128]£¨50¼¶£©
											125,	-- °ô´ò¶ñ¹·[125]£¨50¼¶£©
										},
										
							[70]	=	{
											130,	-- ×íµû¿ñÎè[130]£¨ÕòÅÉ£©
											360,	-- åÐÒ£¹¦[360]£¨60¼¶£©
										},
										
							[90]	=	{
											{357, 1, "Ch­ëng ph¸p"},	-- ·ÉÁúÔÚÌì[357]£¨90¼¶£©
											{359, 1, "Bæng ph¸p"},	-- ÌìÏÂÎÞ¹·[359]£¨90¼¶£©
										},
										
							[120]	=	{
											{714, 1}
										},
										
							[150]	=	{
											{1073, 1, "Ch­ëng ph¸p"},	-- Ê±³ËÁùÁú
											{1074, 1, "Bæng ph¸p"},	-- °ôåÄÂÓµØ
										},
						},
			szMsg = "KÓ tõ h«m nay, %s gia nhËp C¸i Bang, c¶m phiÒn c¸c tiÒn bèi chØ gi¸o!",
		},
		
		{-- ÌìÈÌ
			szFacName		=	"tianren",	nFacNumb	=	7,	nCamp	=	2,	nRankId	=	81,	nSeries	=	3,
			nTaskId_Fact	=	4,
			nTaskId_90Skill	=	127,
			nTaskId_137		=	137,	nValue_137 = 64,
			tbSkillID		=	{
							[10]	=	{
											135,	-- ²ÐÑôÈçÑª[135]£¨ÈëÃÅ£©
											145,	-- µ¯Ö¸ÁÒÑæ[145]£¨ÈëÃÅ£©
										},
										
							[20]	=	{
											132,	-- ÌìÈÌÃ¬·¨[132]£¨10¼¶£©
											131,	-- ÌìÈÌµ¶·¨[131]£¨10¼¶£©
											136,	-- »ð·ÙÁ«»ª[136]£¨10¼¶£©
										},
										
							[30]	=	{
											137,	--»ÃÓ°·Éºü[137]£¨20¼¶£©
										},
										
							[40]	=	{
											141,	-- ÁÒ»ðÇéÌì[141]£¨30¼¶£©
											138,	-- ÍÆÉ½Ìîº£[138]£¨30¼¶£©
											140,	-- ·ÉºèÎÞ¼£[140]£¨30¼¶£©
										},
										
							[50]	=	{
											364,	-- ±¯ËÖÇå·ç[364]£¨40¼¶£©
										},
										
							[60]	=	{
											143,	-- À÷Ä§¶á»ê[143]£¨50¼¶£©
										},
										
							[70]	=	{
											142,	-- ÍµÌì»»ÈÕ[142]£¨60¼¶£©
											150,	-- ÌìÄ§½âÌå[150]£¨ÕòÅÉ£©
											148,	-- Ä§ÑæÆßÉ±[148]£¨60¼¶£©
										},
										
							[90]	=	{
											{361, 1, "Th­¬ng ph¸p"},	-- ÔÆÁú»÷  [361]£¨90¼¶£©
											{362, 1, "§ao ph¸p"},	-- ÌìÍâÁ÷ÐÇ[362]£¨90¼¶£©
											{391,1},	-- [391]£¨90¼¶£©
										},
										
							[120]	=	{
											{715, 1}
										},
										
							[150]	=	{
											{1075, 1, "Th­¬ng ph¸p"},	-- ½­º£Å­À½
											{1076, 1, "§ao ph¸p"},	-- ¼²»ðÁÇÔ­
										},
						},
			szMsg = "KÓ tõ h«m nay, %s gia nhËp Thiªn NhÉn gi¸o, b¸i kiÕn c¸c s­ huynh s­ tû!",
		},
		
		{-- Îäµ±
			szFacName		=	"wudang",	nFacNumb	=	8,	nCamp	=	1,	nRankId	=	73,	nSeries	=	4,
			nTaskId_Fact	=	5,
			nTaskId_90Skill	=	129,
			nTaskId_137		=	137,	nValue_137	=	65,
			tbSkillID		=	{
							[10]	=	{
											153,	-- Å­À×Ö¸  [153]£¨ÈëÃÅ£©
											155,	-- ²×º£Ã÷ÔÂ[155]£¨ÈëÃÅ£©
										},
										
							[20]	=	{
											152,	-- Îäµ±È­·¨[152]£¨10¼¶£©
											151,	-- Îäµ±½£·¨[151]£¨10¼¶£©
										},
										
							[30]	=	{
											159,	-- ÆßÐÇÕó  [159]£¨30¼¶£©
										},
										
							[40]	=	{
											164,	-- °þ¼°¶ø¸´[164]£¨30¼¶£©
											158,	-- ½£·É¾ªÌì[158]£¨30¼¶£©
										},
										
							[50]	=	{
											160,	-- ÌÝÔÆ×Ý  [160]£¨40¼¶£©
										},
										
							[60]	=	{
											157,	-- ×øÍûÎÞÎÒ[157]£¨50¼¶£©
										},
										
							[70]	=	{
											165,	-- ÎÞÎÒÎÞ½£[165]£¨60¼¶£©
											166,	-- Ì«¼«Éñ¹¦[166]£¨ÕòÅÉ£©
											267,	-- Èý»·Ì×ÔÂ[267]£¨60¼¶£©
										},
										
							[90]	=	{
											{365, 1, "QuyÒn ph¸p"},	-- ÌìµØÎÞ¼«[365]£¨90¼¶£©
											{368, 1, "KiÕm ph¸p"},	-- ÈË½£ºÏÒ»[368]£¨90¼¶£©
										},
										
							[120]	=	{
											{716, 1}
										},
										
							[150]	=	{
											{1078, 1, "QuyÒn ph¸p"},	-- Ôì»¯Ì«Çå
											{1079, 1, "KiÕm ph¸p"},	-- ½£´¹ÐÇºÓ
										},
						},
			szMsg = "KÓ tõ h«m nay, %s gia nhËp Vâ §ang ph¸i, tham kiÕn c¸c s­ huynh s­ tû!",
		},
		
		{-- À¥ÂØ
			szFacName		=	"kunlun",	nFacNumb	=	9,	nCamp	=	3,	nRankId	=	75,	nSeries	=	4,
			nTaskId_Fact	=	9,
			nTaskId_90Skill	=	130,
			nTaskId_137		=	137,	nValue_137	=	69,
			tbSkillID		=	{
							[10]	=	{
											169,	-- ºô·ç·¨  [169]£¨ÈëÃÅ£©
											179,	-- ¿ñÀ×ÕðµØ[179]£¨ÈëÃÅ£©
										},
										
							[20]	=	{
											167,	-- À¥ÂØµ¶·¨[167]£¨10¼¶£©
											168,	-- À¥ÂØ½£·¨[168]£¨10¼¶£©
											392,	-- ²ø×Ö¾÷[392]£¨10¼¶£©
											171,	-- Çå·ç·û  [171]£¨10¼¶£©
										},
										
							[30]	=	{
											174,	-- î¿°í·û  [174]£¨20¼¶£©
										},
										
							[40]	=	{
											178,	-- Ò»ÆøÈýÇå[178]£¨30¼¶£©
											172,	-- Ñ¸À×Öä  [172]£¨30¼¶£©
											393,	-- È±ÉÙID£¨30¼¶£©
											173,	-- ÌìÇåµØ×Ç[173]£¨30¼¶£©
										},
										
							[50]	=	{
											175,	-- ÆÛº®°ÁÑ©[175]£¨40¼¶£©
											181,	-- ÆúÐÄ·û  [181]£¨40¼¶£©
										},
										
							[60]	=	{
											176,	-- ¿ñ·çÖèµç[176]£¨50¼¶£©
											90,		-- ÃÔ×Ù»ÃÓ°[90 ]£¨50¼¶£©
										},
										
							[70]	=	{
											275,	-- Ëª°ÁÀ¥ÂØ[275]£¨ÕòÅÉ£©
											182,	-- ÎåÀ×Õý·¨[182]£¨60¼¶£©
											630,;	-- µÚÈý×ÊÁÏÆ¬£¬Ôö¼ÓÀ¥ÂØÐÂ¼¼ÄÜ"ÐþÌìÎÞ¼«"
										},
										
							[90]	=	{
											{372, 1, "§ao ph¸p"},	-- °ÁÑ©Ð¥·ç[372]£¨90¼¶£©
											{375, 1, "KiÕm ph¸p"},	-- À×¶¯¾ÅÌì[375]£¨90¼¶£©
											{394,1},	-- [394]£¨90¼¶£©
										},
										
							[120]	=	{
											{717, 1}
										},
										
							[150]	=	{
											{1080, 1, "§ao ph¸p"},	-- ¾ÅÌìî¸·ç
											{1081, 1, "KiÕm ph¸p"},	-- ÌìÀ×ÕðÔÀ
										},
						},
			szMsg = "KÓ tõ h«m nay, %s gia nhËp C«n L«n ph¸i, b¸i kiÕn c¸c vÞ ®¹o huynh!",
		},
        {
            -- Á÷ÅÉÃû£¬Á÷ÅÉ±àºÅ£¬Á÷ÅÉÕóÓª£¬³öÊ¦³ÆºÅ£¬Á÷ÅÉÎåÐÐ
            szFacName = "huashan", nFacNumb = 10, nCamp = 3, nRankId = 89, nSeries = 2,

            nTaskId_Fact    = 3481, -- ÃÅÅÉÈÎÎñ±äÁ¿
            nTaskId_90Skill	= 3486, -- 90¼¼ÄÜÈÎÎñ±äÁ¿
            nTaskId_137     = 137 , -- ³öÊ¦ÈÎÎñ±äÁ¿
            nValue_137      = 71  , -- ³öÊ¦ÈÎÎñ±äÁ¿Öµ
            nJinjieSkillID  = 1370, -- ½ø½×¼¼ÄÜ(ºÆÈ»Ö®Æø)

            -- ÃÅÅÉ¼¼ÄÜ±í
            tbSkillID =
            {
                [10] =
                {
                    1347,	-- °×ºç¹áÈÕ(ÈëÃÅ)
                    1372,	-- Çå·çËÍË¬(ÈëÃÅ)
                },						
                [20] =
                {
                    1349,	-- ½£×Ú×Ü¾÷(10¼¶)
                    1374,	-- ÁúÈÅÉí  (10¼¶)
                },						
                [30] =
                {
                    1350,	-- ÑøÎá½£·¨(20¼¶)
                    1375,   -- º£ÄÉ°Ù´¨(20¼¶)
                },						
                [40] =
                {
                    1351,	-- ½ðÑãºá¿Õ(30¼¶)
                    1376,	-- ÁúÐý½£Æø(30¼¶)
                },						
                [50] =
                {
                    1354,	-- Ï£ÒÄ½£·¨(40¼¶)
                    1378,	-- ÆøÕðÉ½ºÓ(40¼¶)
                },
                [60] =
                {
                    1355,	-- ÌìÀ¤µ¹Ðü(50¼¶)
                    1379,	-- Æø¹á³¤ºç(50¼¶)
                },						
                [70] =
                {
                    1358,	-- »ÃÑÛÔÆäÎ(ÕòÅÉ)
                    1360,	-- ²ÔËÉÓ­¿Í(60¼¶)
                    1380,	-- Ä¦ÔÆ½£Æø(60¼¶)
                },						
                [90] =
                {
                    {1364, 1, "Hoa S¬n KiÕm T«ng"},	-- ¶áÃüÁ¬»·ÈýÏÉ½£(90¼¶)
                    {1382, 1, "Hoa S¬n KhÝ T«ng"},	-- ÅüÊ¯ÆÆÓñ(90¼¶)
                },						
                [120] =
                {
                    {1365, 1}                   -- ×ÏÏ¼½£Æø(120¼¶)
                },
                [150] =
                {
                    {1369, 1, "Hoa S¬n KiÕm T«ng"},	-- ¾Å½£ºÏÒ»
                    {1384, 1, "Hoa S¬n KhÝ T«ng"},	-- Éñ¹âÐýÈÆ
                },
                [180] = 
                {
                	{-1, -1},
                }
            },
            szMsg = "%s b¾t ®Çu tõ h«m nay gia nhËp ph¸i Hoa S¬n, ®Õn gÆp vµ b¸i kiÕn c¸c vÞ s­ huynh, xin c¸c vÞ chiÕu cè!",
        },
	}


TB_WUXING_SKILL_ID	= 
	{
		{nMagicId1	=	445, nMagicId2	=	534},
		{nMagicId1	=	446, nMagicId2	=	535},
		{nMagicId1	=	447, nMagicId2	=	536},
		{nMagicId1	=	448, nMagicId2	=	537},
		{nMagicId1	=	449, nMagicId2	=	538},
	}

