Include("\\script\\missions\\leaguematch\\tb_head.lua")
--==============»ìºÏË«ÈËÈüÏà¹ØÊı¾İ===============


--È«²¿»ìºÏË«ÈËÈüÏà¹ØÊı¾İ
local WLLS_DATA = {
	
	name = "Song ®Êu",
	
	--µØÍ¼ĞÅÏ¢
	match_type = {
		{
			name = "",
			level = 1,
			ladder = 10248,
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
			ladder = 10249,
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
			{1, 5000},	--µÚ1Ãû
			{2, 4000},	--µÚ2Ãû
			{3, 3500},	--µÚ3Ãû
			{4, 3000},	--µÚ4Ãû
			{8, 2000},	--µÚ5-8Ãû
			{16, 1500},	--µÚ9-16Ãû
			{32, 1000},	--µÚ17-32Ãû
			{64, 500},	--µÚ33-64Ãû
			{128, 250},	--µÚ65-128Ãû
		}, {	--ÁªÈü
			{1, 10000},	--µÚ1Ãû
			{2, 8000},	--µÚ2Ãû
			{3, 7000},	--µÚ3Ãû
			{4, 6000},	--µÚ4Ãû
			{8, 4000},	--µÚ5-8Ãû
			{16, 3000},	--µÚ9-16Ãû
			{32, 2000},	--µÚ17-32Ãû
			{64, 1000},	--µÚ33-64Ãû
			{128, 500},	--µÚ65-128Ãû
		}
	},
	
	max_member = 2,	--Ã¿¸öÕ½¶ÓµÄ×î´óÈËÊı
	
	text_main = {	--officerÖ÷¶Ô»°£¨Ä©Î²²îÒì²¿·Ö£©
		"Liªn ®Êu kiÖt xuÊt kú nµy sÏ theo thÓ thøc song ®Êu. Mäi ng­êi cã thÓ tù do thµnh lËp chiÕn ®éi. H·y nç lùc luyÖn tËp ®Ó sù phèi hîp ¨n ı",
		"Vâ l©m liªn ®Êu kú nµy sÏ theo thÓ thøc song ®Êu. Mäi ng­êi cã thÓ tù do thµnh lËp chiÕn ®éi, h·y nç lùc luyÖn tËp ®Ó sù phèi hîp ¨n ı!",
	},
	
	addmem_ex	= ", yªu cÇu <color=red>nam vµ n÷<color>",	--×é½¨Õ½¶Ó¶îÍâÒªÇó£¨¿ÉÑ¡£©

	--====Functions====
	
	--ÎÒµÄÕ½¶Ó
	npc_mylg = function()
		local str_des = wlls_get_desc(1)
		local n_lid, n_mtype, n_job, str_lgname, n_memcount = wlls_lg_info()
		if (FALSE(n_lid)) then
			wlls_descript("<enter>  LÇn nµy"..str_des.." tham gia <color=red>song ®Êu<color>. Ng­¬i cã thÓ tù s¸ng lËp chiÕn ®éi, còng cã thÓ tham gia chiÕn ®éi cña ng­êi kh¸c. Sau khi ®éi tr­ëng lùa chän tæ ®éi víi ng­êi ch¬i kh¸c, sÏ "..str_des.."§èi tho¹i víi Quan viªn, chän '§éi thi ®Êu"..str_des.."lËp tøc h×nh thµnh chiÕn ®éi. Sè l­îng thµnh viªn tèi ®a lµ <color=red>2 ng­êi<color=red>, b¾t buéc ph¶i kh¸c giíi tİnh.",
				"Ta muèn lËp"..str_des.."nhãm/wlls_want2create",
				"Ta chØ ®Õn xem th«i/OnCancel")
			return
		end
	
	
		local n_mytype = LG_GetLeagueTask(n_lid, WLLS_LGTASK_STYPE)
		local n_level, n_group = wlls_getcityinfo()
		local n_next = GetGlbValue(GLB_WLLS_NEXT)
		local str = "<enter>ChiÕn ®éi cña b¹n hiÖn lµ:<color=yellow>"..str_lgname.."<color><enter>"
		.. "§éi tr­ëng ®éi chiÕn ®Êu:"..join(wlls_get_mems(n_lid), "Thµnh viªn ®éi chiÕn ®Êu:") .. "<enter>"
		if (n_mytype ~= n_next) then
			str = str .. "<enter>    <color=yellow><<Î´·­Òë>>"..WLLS_TAB[n_next].name.."<color><color=yellow>, nÕu muèn thi ®Êu mïa sau, xin h·y lËp chiÕn ®éi míi.<color><enter>"
		end
		local tb_option = {}
		if (n_job == 1 and n_mytype == n_next) then
			str = str.."<enter>   B¹n cã thÓ chän <color=red> gia nhËp vµo ®éi kh¸c<color> hoÆc <color=red>rêi khái ®éi thi ®Êu<color>.<enter><enter>"..
			"C¸c b­íc thµnh lËp chiÕn ®éi: trong kho¶ng <color=red>thêi gian nghØ vµ thêi gian thi ®Êu<color>, ®Òu cã thÓ tæ ®éi víi ng­êi ch¬i kh¸c, <color=red>kh¸c giíi tİnh<color>, lùa chän ®ång ı cho ®ång ®éi gia nhËp chiÕn ®éi cña m×nh. <enter>"..
			"Rêi khái ®éi thi ®Êu: Trong <color=red>thêi gian nghØ ng¬i<color>, b¹n cã thÓ rêi khái ®éi thi ®Êu; trong thêi gian thi ®Êu nÕu ®éi thi ®Êu cña b¹n<color=red> ch­a gia nhËp thi ®Êu kú tr­íc<color>, b¹n cã thÓ rêi khái ®éi thi ®Êu; nÕu ®· cã tham gia th× kh«ng thÓ rêi ®éi. T­ c¸ch ®éi tr­ëng sÏ ®­îc chuyÓn giao l¹i cho thµnh viªn kh¸c, <color=yellow>nÕu kh«ng cã thµnh viªn, chiÕn ®éi sÏ bŞ gi¶i t¸n<color>."
			tb_option[getn(tb_option)+1] = "§Ó ®éi h÷u cña Tagia nhËp vµo ®éi thi ®Êu nµy/wlls_want2addmember"
		else
			str = str.."<enter>       B¹n cã thÓ chän rêi khái nhãm.<enter><enter>"..
			"Rêi khái nhãm:   Trong <color=red>thêi gian nghØ ng¬i<color>, b¹n cã thÓ rêi khái ®éi thi ®Êu; trong thêi gian thi ®Êu nÕu ®éi thi ®Êu m×nh <color=red>ch­a tham gia gi¶i ®Êu tr­íc<color>, b¹n còng cã thÓ rêi khái ®éi thi ®Êu; cßn nÕu ®· gia nhËp thi ®Êu kh«ng thÓ rêi khái ®éi."
		end
		tb_option[getn(tb_option)+1] = "Rêi khái ®éi/wlls_want2leaveleague"
		tb_option[getn(tb_option)+1] = "Xem chiÕn tİch cña ®éi/wlls_query_mylg"
		tb_option[getn(tb_option)+1] = "Ta chØ tiÖn ghĞ qua/OnCancel"
		wlls_descript(str, tb_option)
	end,
	
	--¼ì²éµ±Ç°½ÇÉ«ÊÇ·ñ¿ÉÒÔ¼ÓÈëÖ¸¶¨µÄÕ½¶Ó
	check_addmem = function(nCapIdx, nLGID, nMType)
		print(nMType, wlls_player_type())
		if (nMType ~= wlls_player_type()) then
		 	return "Xin lçi! §éi viªn trong nhãm:"..GetName().." vµ <color=red>lo¹i h×nh tham gia thi ®Êu<color> cña chiÕn ®éi b¹n kh«ng phï hîp! Cho nªn kh«ng thÓ vµo chiÕn ®éi cña b¹n!"
		end
		local nOldIdx = PlayerIndex
		PlayerIndex = nCapIdx
		local nSex	= GetSex()
		PlayerIndex = nOldIdx
		if (nSex == GetSex()) then
			return "Tû vâ lÇn nµy theo thÓ thøc “Nam-N÷ song ®Êu”. Ng­¬i ph¶i t×m mét ®ång ®éi kh¸c giíi!"
		end
	end,
}	--WLLS_DATA

tmp_process_data(WLLS_DATA)	
wllstab_additem(7, WLLS_DATA)
