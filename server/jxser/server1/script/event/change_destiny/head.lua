-- ÄæÌì¸ÄÃü»î¶¯ Í·ÎÄ¼ş
Include("\\script\\task\\metempsychosis\\task_func.lua");

tbChangeDestiny = 
{
	bDeBug		= 0,							-- ÊÇ·ñDeBug°æ±¾
	nStartDate	= 20090828,						-- »î¶¯¿ªÊ¼ÈÕÆÚ
	nCloseDate	= 20091011, 					-- »î¶¯½áÊøÈÕÆÚ
	nNpcResIdx	= 1446,							-- »î¶¯NPCµÄÄ£°æID
	
	nLimit_DayGive = 6,							-- Ò»Ìì×î¶àÉÏ½»6¸ö
	nLimit_TotalGive = 180,						-- ×Ü¹²ĞèÒªÉÏ½»180¸ö
	nLimit_AddSkill = 1,						-- ×î´ó¼¼ÄÜµãµÄÌáÉı·ù¶È
	nLimit_TransTimes = 1,						-- µÚ¼¸´Î×ªÉú
	nLimit_TransLowerBound = 160,				-- ×ªÉúµÈ¼¶ÏÂ½ç
	nLimit_TransUpperBound = 179,				-- ×ªÉúµÈ¼¶ÉÏ½ç
	nLimit_NieShiChen = 1038,					-- ¸ß¼¶´³¹ØÄôß±³¾µÄID
	
	tbItem_ShenLongZhenDan = {6,1,2113},		-- ÉñÅ©Õæµ¤
	tbItem_GaiMingJue = 	 {6,1,2114},		-- ÄæÌì¸ÄÃü¾÷
	
	tbNpcPos = 
	{
		{11,  3134, 4985},						-- ³É¶¼
		{1,   1621, 3144},						-- ·ïÏè
		{37,  1817, 3084},						-- ãê¾©
		{176, 1495, 2971},						-- ÁÙ°²
		{162, 1581, 3235},						-- ´óÀí
		{78,  1519, 3214},						-- ÏåÑô
		{80,  1723, 2973},						-- ÑïÖİ
	},
	
	nStep_free = 0,								-- ¿ÕÏĞÖĞ
	nStep_accepted = 1,							-- ÒÑ¾­½ÓÊÜÈÎÎñ
	nStep_completed = 2,						-- ÒÑ¾­Íê³ÉÈÎÎñ
	nStep_partiallyCompleted_1 = 3,
	nStep_partiallyCompleted_2 = 4,
	nStep_partiallyCompleted_3 = 5,

	
	nMissionID_Battle = 0,						-- ÈÎÎñ:ËÎ½ğÕ½³¡
	nMissionID_NieShiChen = 1,					-- ÈÎÎñ:Äôß±³¾
	nMissionID_WaterThief = 2,					-- ÈÎÎñ:Ë®Ôô
	nMissionID_Killer = 3,						-- ÈÎÎñ:É±ÊÖ
	
	tbMissionInfo = 
	{
		[0] = {3,	"Trong mét trËn Tèng Kim cao cÊp thu ®­îc 3000 ®iÓm tİch lòy",				"§¹i hiÖp ®· nhËn nhiÖm vô 3000 ®iÓm tİch lòy Tèng Kim ë ThÇn N«ng L·o Gia",	},
		[1] = {1,	"ë nhiÖm vô v­ît ¶i cao cÊp ®· ®¸nh b¹i NhiÕp Thİ TrÇn",						"§¹i hiÖp ®· nhËn nhiÖm vô ®¸nh b¹i NhiÕp Thİ TrÇn ë ThÇn N«ng L·o Gia",			},
		[2] = {2,	"§· ®¸nh b¹i Thñy TÆc §Çu LÜnh ë Phong L¨ng §é.",							"§¹i hiÖp ®· nhËn nhiÖm vô ®¸nh b¹i Thñy TÆc §Çu LÜnh ë ThÇn N«ng L·o Gia.",		},
		[3] = {3,	"NhiÖm vô ®¸nh b¹i 4 lÇn s¸t thñ cÊp 90 (NhiÖm vô nµy nhËn NhiÕp Thİ TrÇn)",	"§¹i hiÖp ®· nhËn nhiÖm vô ®¸nh b¹i tø ®¹i s¸t thñ ë ThÇn N«ng L·o Gia",		},
	},
	
	nPlayerTask	= {2622, 2623, 2624, 2626, 2627, 2628},	-- »î¶¯ÈÎÎñ±äÁ¿
	
	nTask_ZhenDan_GiveDate		= 1,			-- ÉÏ´ÎÉÏ½»Õæµ¤ÈÕÆÚ
	nTask_ZhenDan_GiveCount		= 2,			-- ÉÏ´ÎÉÏ½»Õæµ¤ÀÛ»ı¸öÊı
	nTask_ZhenDan_TotalCount	= 3,			-- ×Ü¹²ÉÏ½»Õæµ¤¸öÊı
	nTask_GaiMing_HasReceive	= 4,			-- ÊÇ·ñÁìÈ¡¹ı¸ÄÃü¾÷
	nTask_GaiMing_HasUsed	 	= 5,			-- ÊÇ·ñÊ¹ÓÃ¹ı¸ÄÃü¾÷
	nTask_MissionStart			= 6,			-- ÈÎÎñÎ»¿ªÊ¼¼ÇºÅ
	nTask_Step_Battle			= 6,			-- ÈÎÎñÍê³É²½Öè£¨ËÎ½ğÕ½³¡£©
	nTask_Date_Battle			= 7,			-- ÈÎÎñÍê³ÉÈÕÆÚ£¨ËÎ½ğÕ½³¡£©
	nTask_Step_NieShiChen		= 8,			-- ÈÎÎñÍê³É²½Öè£¨Äôß±³¾£©
	nTask_Date_NieShiChen		= 9,			-- ÈÎÎñÍê³ÉÈÕÆÚ£¨Äôß±³¾£©
	nTask_Step_WaterThief 		= 10,			-- ÈÎÎñÍê³É²½Öè£¨Ë®Ôô£©
	nTask_Date_WaterThief		= 11,			-- ÈÎÎñÍê³ÉÈÕÆÚ£¨Ë®Ôô£©
	nTask_Step_Killer			= 12,			-- ÈÎÎñÍê³É²½Öè£¨É±ÊÖ£©
	nTask_Date_Killer			= 13,			-- ÈÎÎñÍê³ÉÈÕÆÚ£¨É±ÊÖ£©
	
	tbTask = 
	{
		{1, 0,  24},							-- nTask_ZhenDan_GiveDate
		{1, 24, 8 },							-- nTask_ZhenDan_GiveCount
		{2, 0,  16},							-- nTask_ZhenDan_TotalCount
		{2, 16, 8 },							-- nTask_GaiMing_HasReceive
		{2, 24, 8 },							-- nTask_GaiMing_HasUsed
		{3, 0, 	8 },							-- nTask_Step_Battle
		{3, 8, 	24},							-- nTask_Date_Battle
		{4, 0, 	8 },							-- nTask_Step_NieShiChen
		{4, 8, 	24},							-- nTask_Date_NieShiChen
		{5, 0,  8 },							-- nTask_Step_WaterThief
		{5, 8, 	24},							-- nTask_Date_WaterThief
		{6, 0,  8 },							-- nTask_Step_Killer
		{6, 8, 	24},							-- nTask_Date_Killer
	},
	-- ÈÎÎñ±äÁ¿¶ÔÕÕ±í 1:´óÈÎÎñ±äÁ¿Öµ 2:¿ªÊ¼µÄBitÎ»(0-31) 3:ÒªÉèÖÃµÄBitÊıÁ¿(1-32)
}


-- »î¶¯ÊÇ·ñ¾ÙĞĞ
function tbChangeDestiny:isCarryOn()
	
	if self.bDeBug == 1 then
		return 1;
	end
	
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	
	if nDate < self.nStartDate or nDate > self.nCloseDate then
		 return 0;
	else	
		 return 1;
	end
end

-- Íæ¼ÒÄÜ·ñ²ÎÓë»î¶¯
function tbChangeDestiny:canJoin()
	
	if self.bDeBug == 1 then
		return 1;
	end
	
	if ST_IsTransLife() ~= 1 then
		return 0;
	end
	
	local nTransLevel = zhuansheng_get_gre(self.nLimit_TransTimes);
	if nTransLevel < self.nLimit_TransLowerBound or nTransLevel > self.nLimit_TransUpperBound then
		return 0;
	end
	
	return 1;
end

-- ÉèÖÃÈÎÎñ±äÁ¿
function tbChangeDestiny:setTask(nTaskIdx, nValue)
	local tbTaskInfo = self.tbTask[nTaskIdx];
	return SetBitTask(self.nPlayerTask[tbTaskInfo[1]], tbTaskInfo[2], tbTaskInfo[3], nValue)
end

-- »ñÈ¡ÈÎÎñ±äÁ¿
function tbChangeDestiny:getTask(nTaskIdx)
	local tbTaskInfo = self.tbTask[nTaskIdx];
	return GetBitTask(self.nPlayerTask[tbTaskInfo[1]], tbTaskInfo[2], tbTaskInfo[3])	
end

-- »ñÈ¡ÈÎÎñµÄÏà¹ØĞÅÏ¢
function tbChangeDestiny:getMissionInfo(nMissionID)
	
	local nMissionID_Step = self.nTask_MissionStart + nMissionID * 2;
	local nMissionID_Date = nMissionID_Step + 1;
	
	local nMissionStep = self:getTask(nMissionID_Step);
	local nMissionDate = self:getTask(nMissionID_Date);
	
	return nMissionStep, nMissionDate;
end

-- ÉèÖÃÈÎÎñµÄÏà¹ØĞÅÏ¢
function tbChangeDestiny:setMissionInfo(nMissionID, nMissionStep, nMissionDate)
	
	local nMissionID_Step = self.nTask_MissionStart + nMissionID * 2;
	local nMissionID_Date = nMissionID_Step + 1;
	
	self:setTask(nMissionID_Step, nMissionStep);
	self:setTask(nMissionID_Date, nMissionDate);
	
end