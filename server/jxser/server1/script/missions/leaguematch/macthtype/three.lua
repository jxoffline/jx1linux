Include("\\script\\missions\\leaguematch\\tb_head.lua")
--==============ÈıÈËÈüÏà¹ØÊı¾İ===============


--È«²¿ÈıÈËÈüÏà¹ØÊı¾İ
local WLLS_DATA = {
	
	name = "§Êu ba ng­êi",
	
	--µØÍ¼ĞÅÏ¢
	match_type = {
		{
			name = "",
			level = 1,
			ladder = 10223,
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
			ladder = 10224,
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
			{8, 1500},	--µÚ5-8Ãû
			{16, 1000},	--µÚ9-16Ãû
			{32, 750},	--µÚ17-32Ãû
			{64, 500},	--µÚ33-64Ãû
			{128, 250},	--µÚ65-128Ãû
		}, {	--ÁªÈü
			{1, 8000},	--µÚ1Ãû
			{2, 6000},	--µÚ2Ãû
			{3, 5000},	--µÚ3Ãû
			{4, 4000},	--µÚ4Ãû
			{8, 3000},	--µÚ5-8Ãû
			{16, 2000},	--µÚ9-16Ãû
			{32, 1500},	--µÚ17-32Ãû
			{64, 1000},	--µÚ33-64Ãû
			{128, 500},	--µÚ65-128Ãû
		}
	},
	
	max_member = 3,	--Ã¿¸öÕ½¶ÓµÄ×î´óÈËÊı
	
	text_main = {	--officerÖ÷¶Ô»°£¨Ä©Î²²îÒì²¿·Ö£©
		"Thi ®Êu vâ l©m kiÖt xuÊt lÇn nµy lµ <color=red>Tam nh©n ®Êu<color>",
		"Thi ®Êu vâ l©m kiÖt xuÊt lÇn nµy lµ <color=red>Tam nh©n ®Êu<color>",
	},
	
	--====Functions====
	--ÎÒµÄÕ½¶Ó
	npc_mylg = function()
		local str_des = wlls_get_desc(1)
		local n_lid, n_mtype, n_job, str_lgname, n_memcount = wlls_lg_info()
		if (FALSE(n_lid)) then
			wlls_descript("<enter>  LÇn nµy"..str_des.."Trong <color=red>®Êu 3 ng­êi<color>, b¹n cã thÓ chän ®éi lËp nhãm, còng cã thÓ gia nhËp chiÕn ®éi kh¸c. Sau khi ®éi tr­ëng vµ ng­êi ch¬i tæ chøc ®éi xong, vµ "..str_des.."§èi tho¹i víi Quan viªn, chän '§éi thi ®Êu"..str_des.."chän hµng chiÕn ®éi', gia nhËp ®éi h÷u vµo ®éi cña m×nh lµ ®­îc. Thµnh viªn chiÕn ®éi nhiÒu nhÊt lµ <color=red>3 ng­êi<color>.",
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
			"Qu¸ tr×nh thµnh viªn lËp nhãm: Trong <color=red>thêi gian nghØ ng¬i vµ thêi gian thi ®Êu<color>, b¹n cã thÓ cïng víi ng­êi ch¬i kh¸c lËp nhãm, chän nh÷ng ®éi h÷u gia nhËp vµo ®éi thi ®Êu.<enter>"..
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
	
}	--WLLS_DATA

tmp_process_data(WLLS_DATA)	
wllstab_additem(4, WLLS_DATA)
