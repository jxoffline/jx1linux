Include("\\script\\missions\\leaguematch\\tb_head.lua")
--==============Í¬ÏµË«ÈËÈüÏà¹ØÊı¾İ===============

-- LLG_ALLINONE_TODO_20070802

--È«²¿Í¬ÏµË«ÈËÈüÏà¹ØÊı¾İ
local nTmpLadderBase	= 10238
local WLLS_DATA = {
	
	name = "Song ®Êu (Cïng hÖ)",
	
	--µØÍ¼ĞÅÏ¢
	match_type = {
		{
			name = "hÖ Kim",
			level = 1,
			ladder = nTmpLadderBase,
			map = {{396, 560, 397, ""}},
		},
		{
			name = "hÖ Méc",
			level = 1,
			ladder = nTmpLadderBase + 1,
			map = {{398, 561, 399, ""}},
		},
		{
			name = "hÖ Thñy",
			level = 1,
			ladder = nTmpLadderBase + 2,
			map = {{400, 562, 401, ""}},
		},
		{
			name = "hÖ Háa",
			level = 1,
			ladder = nTmpLadderBase + 3,
			map = {{402, 563, 403, ""}},
		},
		{
			name = "hÖ Thæ ",
			level = 1,
			ladder = nTmpLadderBase + 4,
			map = {{404, 564, 405, ""}},
		},
		{
			name = "hÖ Kim",
			level = 2,
			ladder = nTmpLadderBase + 5,
			map = {{540, 570, 541, ""}},
		},
		{
			name = "hÖ Méc",
			level = 2,
			ladder = nTmpLadderBase + 6,
			map = {{542, 571, 543, ""}},
		},
		{
			name = "hÖ Thñy",
			level = 2,
			ladder = nTmpLadderBase + 7,
			map = {{544, 572, 545, ""}},
		},
		{
			name = "hÖ Háa",
			level = 2,
			ladder = nTmpLadderBase + 8,
			map = {{546, 573, 547, ""}},
		},
		{
			name = "hÖ Thæ ",
			level = 2,
			ladder = nTmpLadderBase + 9,
			map = {{548, 574, 549, ""}},
		},
	},
	
	award_rank = {
		{	--ÅÅĞĞ½±Àø£¬ĞÂĞã
			{1, 4000},	--µÚ1Ãû
			{2, 3000},	--µÚ2Ãû
			{3, 2500},	--µÚ3Ãû
			{4, 2000},	--µÚ4Ãû
			{8, 1500},	--µÚ5-8Ãû
			{16, 1250},	--µÚ9-16Ãû
			{32, 1000},	--µÚ17-32Ãû
			{64, 750},	--µÚ33-64Ãû
			{128, 500},	--µÚ65-128Ãû
			{256, 250},	--µÚ129-256Ãû
		}, {	--ÁªÈü
			{1, 8000},	--µÚ1Ãû
			{2, 6000},	--µÚ2Ãû
			{3, 5000},	--µÚ3Ãû
			{4, 4000},	--µÚ4Ãû
			{8, 3000},	--µÚ5-8Ãû
			{16, 2500},	--µÚ9-16Ãû
			{32, 2000},	--µÚ17-32Ãû
			{64, 1500},	--µÚ33-64Ãû
			{128, 1000},	--µÚ65-128Ãû
			{256, 500},	--µÚ129-256Ãû
		}
	},
	
	max_member = 2,	--Ã¿¸öÕ½¶ÓµÄ×î´óÈËÊı
	
	text_main = {	--officerÖ÷¶Ô»°£¨Ä©Î²²îÒì²¿·Ö£©
		"Thi ®Êu lÇn nµy lµ §ång hÖ song ®Êu",
		"Thi ®Êu lÇn nµy lµ §ång hÖ song ®Êu",
	},
	
	addmem_ex	= ", vµ ph¶i lµ ng­êi ch¬i <color=red>cïng hÖ<color> víi nhau",	--×é½¨Õ½¶Ó¶îÍâÒªÇó£¨¿ÉÑ¡£©

	--====Functions====
	--·µ»Øµ±Ç°½ÇÉ«¿ÉÒÔ²Î¼ÓµÄ±ÈÈüÀàĞÍ£¬nilÎª²»ÄÜ²ÎÈü
	player_type = function()
		local nLevel = wlls_player_level()
		if (nLevel <= 0) then
			return nil
		end
		local nSeries = GetSeries() + 1
		if (nSeries <= 0) then
			wlls_error_log("GetSeries() = "..(nSeries - 1))
			return nil
		end
		return (nLevel - 1) * 5 + nSeries
	end,
	
	--ÎÒµÄÕ½¶Ó
	npc_mylg = function()
		local str_des = wlls_get_desc(1)
		local n_lid, n_mtype, n_job, str_lgname, n_memcount = wlls_lg_info()
		if (FALSE(n_lid)) then
			wlls_descript("<enter>  LÇn nµy"..str_des.." lµ <color=red>§ång hÖ song ®Êu<color>. B¹n cã thÓ tù lËp chiÕn ®éi cña m×nh hoÆc gia nhËp chiÕn ®éi cña ng­êi kh¸c. Sau ®ã do ®éi tr­ëng ®Õn gÆp "..str_des.."§èi tho¹i víi Quan viªn, chän '§éi thi ®Êu"..str_des.."Thµnh viªn mçi chiÕn ®éi lµ <color=red>2 ng­êi<color> vµ ph¶i lµ ng­êi cïng hÖ víi nhau",
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
			"C¸c b­íc thµnh lËp chiÕn ®éi: trong <color=red>thêi gian nghØ vµ thêi gian thi ®Êu<color>, Ng­¬i ®Òu cã thÓ tæ ®éi víi ng­êi ch¬i kh¸c <color=red>cïng hÖ<color>, lùa chän ®ång ı cho ®ång ®éi gia nhËp chiÕn ®éi cña m×nh. <enter>"..
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
		if (nMType ~= wlls_player_type()) then
		 	return wlls_npcname().."Xin lçi! §éi viªn trong nhãm:"..GetName().."<color=red>§¼ng cÊp<color> hoÆc <color=red>ngò hµnh<color> cña hai ®éi kh«ng hîp lÖ, kh«ng thÓ thµnh lËp chiÕn ®éi!"
		end
	end,
}	--WLLS_DATA

tmp_process_data(WLLS_DATA)	
wllstab_additem(6, WLLS_DATA)
