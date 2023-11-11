Include("\\script\\missions\\leaguematch\\tb_head.lua")
--==============»ìºÏµ¥ÈËÈüÏà¹ØÊı¾İ===============


--È«²¿»ìºÏµ¥ÈËÈüÏà¹ØÊı¾İ
local WLLS_DATA = {
	
	name = "<<Î´·­Òë>>",
	
	--µØÍ¼ĞÅÏ¢
	match_type = {
		{
			name = "",
			level = 1,
			ladder = 10235,
			map = {
				{396, 560, 397, "(1)"},
				{398, 561, 399, "(2)"},
				{400, 562, 401, "(3)"},
				{402, 563, 403, "(4)"},
				{404, 564, 405, "(5)"},
				{406, 565, 407, "(6)"},
				{408, 566, 409, "(7)"},
				{410, 567, 411, "(8)"},
			},
		},
		{
			name = "",
			level = 2,
			ladder = 10236,
			map = {
				{540, 570, 541, "(1)"},
				{542, 571, 543, "(2)"},
				{544, 572, 545, "(3)"},
				{546, 573, 547, "(4)"},
				{548, 574, 549, "(5)"},
				{550, 575, 551, "(6)"},
				{552, 576, 553, "(7)"},
				{554, 577, 555, "(8)"},
			},
		},
	},
	
	award_rank = {
		{	--ÅÅĞĞ½±Àø£¬ĞÂĞã
			{1, 4000},	--µÚ1Ãû
			{2, 3000},	--µÚ2Ãû
			{3, 2500},	--µÚ3Ãû
			{4, 2000},	--µÚ4Ãû
			{8, 1750},	--µÚ5-8Ãû
			{16, 1500},	--µÚ9-16Ãû
			{32, 1250},	--µÚ17-32Ãû
			{64, 1000},	--µÚ33-64Ãû
			{128, 750},	--µÚ65-128Ãû
			{256, 500},	--µÚ129-256Ãû
			{512, 250},	--µÚ257-512Ãû
		}, {	--ÁªÈü
			{1, 8000},	--µÚ1Ãû
			{2, 6000},	--µÚ2Ãû
			{3, 5000},	--µÚ3Ãû
			{4, 4000},	--µÚ4Ãû
			{8, 3500},	--µÚ5-8Ãû
			{16, 3000},	--µÚ9-16Ãû
			{32, 2500},	--µÚ17-32Ãû
			{64, 2000},	--µÚ33-64Ãû
			{128, 1500},--µÚ65-128Ãû
			{256, 1000},--µÚ129-256Ãû
			{512, 500},	--µÚ257-512Ãû
		}
	},
	
	max_member = 1,	--Ã¿¸öÕ½¶ÓµÄ×î´óÈËÊı
	
	text_main = {	--officerÖ÷¶Ô»°£¨Ä©Î²²îÒì²¿·Ö£©
		"LÇn nµy lµ ®¬n ®Êu tù do, c¸c hiÖp kh¸ch h·y cè g¾ng luyÖn tËp, chê ngay vinh quy",
		"LÇn nµy lµ ®¬n ®Êu tù do, c¸c hiÖp kh¸ch h·y cè g¾ng luyÖn tËp, chê ngay vinh quy",
	},
	
	--====Functions====
	--ÎÒµÄÕ½¶Ó
	npc_mylg = function()
		local str_des = wlls_get_desc(1)
		local n_lid, n_mtype, n_job, str_lgname, n_memcount = wlls_lg_info()
		if (FALSE(n_lid)) then
			wlls_descript("<enter>  LÇn nµy"..str_des.."lµ <color=red>®¬n ®Êu tù do<color>, kh«ng cÇn ph¶i lËp chiÕn ®éi. HÖ thèng sÏ ghi nhí lÇn thi ®Êu ®Çu tiªn cña b¹n")
			return
		end
	
		local n_mytype = LG_GetLeagueTask(n_lid, WLLS_LGTASK_STYPE)
		local n_level, n_group = wlls_getcityinfo()
		local n_next = GetGlbValue(GLB_WLLS_NEXT)
		local str = "<enter>ChiÕn ®éi cña b¹n hiÖn lµ:<color=yellow>"..str_lgname.."<color><enter>"
		if (n_mytype ~= n_next) then
			str = str .. "<enter>    <color=yellow><<Î´·­Òë>>"..WLLS_TAB[n_next].name.."<color><color=yellow>, nÕu muèn thi ®Êu mïa sau, xin h·y lËp chiÕn ®éi míi.<color><enter>"
		end
		local tb_option = {}
		str = str.."<enter>   Trong thêi gian <color=red>t¹m nghØ<color> hoÆc <color=red>ch­a tham gia thi ®Êu mïa tr­íc<color>, b¹n cã thÓ rêi chiÕn ®éi, chiÕn ®éi sÏ tù ®éng gi¶i t¸n<color>."
		tb_option[getn(tb_option)+1] = "Rêi khái ®éi/wlls_want2leaveleague"
		tb_option[getn(tb_option)+1] = "Xem chiÕn tİch cña ®éi/wlls_query_mylg"
		tb_option[getn(tb_option)+1] = "Ta chØ tiÖn ghĞ qua/OnCancel"
		wlls_descript(str, tb_option)
	end,
	
	--¼ì²éµ±Ç°½ÇÉ«ÊÇ·ñ¿ÉÒÔ¼ÓÈëÖ¸¶¨µÄÕ½¶Ó
	check_addmem = function(n_capidx, n_lid, n_mtype)
		return "Kh«ng thÓ gia nhËp ®éi ®¬n ®Êu!"
	end,
	
}	--WLLS_DATA

tmp_process_data(WLLS_DATA)	
wllstab_additem(5, WLLS_DATA)
