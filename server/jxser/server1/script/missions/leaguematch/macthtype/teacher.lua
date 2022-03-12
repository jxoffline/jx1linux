Include("\\script\\missions\\leaguematch\\tb_head.lua")
--==============Ê¦Í½Ë«ÈËÈüÏà¹ØÊı¾İ===============


--È«²¿Ê¦Í½Ë«ÈËÈüÏà¹ØÊı¾İ
local WLLS_DATA = {
	
	name = "Song ®Êu s­ ®å",
	
	--µØÍ¼ĞÅÏ¢
	match_type = {
		{
			name = "",
			level = 1,
			ladder = 10221,
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
			ladder = 10222,
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
	
	--°ïÖúÎÄ×Ö£¨Ö÷ÒªµÄ°ïÖúÎÄ×ÖÔÚnormal.luaÖĞ£¬ÕâÀïÖ»Ğ´ÌØÒìµÄ²¿·Ö£©
	help_msg = {
		["Giíi thiÖu thi ®Êu Vâ l©m kiÖt xuÊt"]	=
			{
				"    Thi ®Êu lÇn nµy lµ <color=red>S­ ®å song ®Êu<color>. Ng­êi ch¬i ®Õn gÆp <color=red>Sø gi¶ KiÖt xuÊt<color> b¸o danh thµnh lËp chiÕn ®éi, sau ®ã vµo Héi tr­êng liªn ®Êu KiÖt xuÊt tiÕn hµnh thi ®Êu. §éi tr­ëng (S­ phô) ®¼ng cÊp tõ 80- 119, ®éi viªn (®å ®Ö) tõ 50- 90",
				"    Thi ®Êu lÇn nµy lµ <color=red>S­ ®å song ®Êu<color>. Ng­êi ch¬i ®Õn gÆp <color=red>Sø gi¶ KiÖt xuÊt<color> b¸o danh thµnh lËp chiÕn ®éi, sau ®ã vµo Héi tr­êng liªn ®Êu KiÖt xuÊt tiÕn hµnh thi ®Êu. §éi tr­ëng (S­ phô) ®¼ng cÊp tõ 120 trë lªn, ®éi viªn (®å ®Ö) tõ 50- 90",
			},
		["Qu¸ tr×nh thµnh lËp ®éi thi ®Êu"]	= "    Ng­êi ch¬i cã thÓ tù lËp chiÕn ®éi hoÆc gia nhËp chiÕn ®éi ng­êi kh¸c. §éi tr­ëng ph¶i lµ ®å ®Ö ch­a xuÊt s­. §éi tr­ëng ®Õn gÆp <s> ®Ó b¸o danh thi ®Êu",
		["Rêi khái ®éi thi ®Êu"]	= "    Trong <color=red>giai ®o¹n nghØ c¸ch kho¶ng<color>, ng­êi ch¬i cã thÓ tïy ı tho¸t ly chiÕn ®éi. Trong giai ®o¹n thi ®Êu, nÕu chiÕn ®éi cña m×nh <color=red>ch­a ®Õn lóc thi ®Êu<color>, ng­êi ch¬i cã thÓ tù ı rêi khái chiÕn ®éi, nÕu ®· ®Êu råi th× kh«ng thÓ rêi ®éi. <color=yellow>Sau khi rêi khái chiÕn ®éi sÏ kh«ng ®­îc nhËn phÇn th­ëng xÕp h¹ng<color>. NÕu ®éi tr­ëng rêi khái ®éi th× chiÕn ®éi sÏ bŞ gi¶i t¸n. <color=yellow>nÕu chiÕn ®éi kh«ng cßn ai th× sÏ tù ®éng bŞ gi¶i t¸n<color>. Mçi lÇn liªn ®Êu kÕt thóc, chiÕn ®éi nµo kh«ng phï hîp cho lÇn sau còng sÏ tù ®éng bŞ gi¶i t¸n",
	},
	
	text_main = {	--officerÖ÷¶Ô»°£¨Ä©Î²²îÒì²¿·Ö£©
		"Thi ®Êu lÇn nµy lµ <color=red>S­ ®å song ®Êu<color>. ",
		"Thi ®Êu lÇn nµy lµ <color=red>S­ ®å song ®Êu<color>. ",
	},
	
	text_creat = "    Sau khi lËp chiÕn ®éi tham gia S­ ®å song ®Êu b¹n cã thÓ <color=red>tù m×nh lµ ®éi tr­ëng<color>. NÕu cã s­ phô th× ph¶i do <color=red>­ phô m×nh lµ ®éi tr­ëng<color>.<enter>"
		.."nÕu ch­a ®Õn lóc thi ®Êu<color> vµ <color=red>ch­a ®Êu qua trËn nµo<color>, b¹n cß thÓ rêi khái chiÕn ®éi. NÕu S­ phô rêi khái chiÕn ®éi, ®éi ®ã lËp tøc bŞ gi¶i t¸n. Ng­¬i x¸c ®Şnh lËp chiÕn ®éi cho m×nh chø?",
	
	--====Functions====
	--ÎÒµÄÕ½¶Ó
	npc_mylg = function()
		local str_des = wlls_get_desc(1)
		local n_lid, n_mtype, n_job, str_lgname, n_memcount = wlls_lg_info()
		if (FALSE(n_lid)) then
			wlls_descript("<enter>    LÇn nµy "..str_des.."Khi <color=red>song ®Êu s­ ®å<color>, b¹n cã thÓ chän lËp chiÕn ®éi, còng cã thÓ gia nhËp chiÕn ®éi kh¸c. §éi tr­ëng gia nhËp ®éi viªn cÇn ph¶i lµ ®å ®Ö ch­a xuÊt s­ cña ®éi tr­ëng. Sau khi ®éi tr­ëng vµ ®å ®Ö tæ chøc ®éi xong, vµ "..str_des.."§èi tho¹i víi Quan viªn, chän '§éi thi ®Êu"..str_des.."cña t«i', chän nh÷ng ®éi h÷u gia nhËp trong ®éi m×nh lµ ®­îc. Thµnh viªn ®éi thi ®Êu nhiÒu nhÊt <color=red>2 ng­êi<color>",
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
	
	--¼ì²éµ±Ç°½ÇÉ«ÊÇ·ñ¿ÉÒÔ¼ÓÈëÖ¸¶¨µÄÕ½¶Ó
	check_addmem = function(n_capidx, n_lid, n_mtype)
		local n_oldidx = PlayerIndex
		PlayerIndex = n_capidx
		local n_lid = LG_GetLeagueObjByRole(1, GetName())	--Ê¦Í½¹ØÏµÕ½¶Ó
		local n_num = GetTask(1403)	--TKID_APPRENTICE_COUNT = 1403 --ÊÕÍ½µÜ×ÜÊı
		PlayerIndex = n_oldidx
		if (FALSE(n_lid) or n_num <= 0) then	
			return "Xin lçi! b¹n ch­a nhËn ®å ®Ö, kh«ng thÓ lËp nhãm víi bÊt kú ®éi viªn kh¸c."
		end
		if (n_lid ~= LG_GetLeagueObjByRole(1, GetName())) then
			return " Xin lçi! "..GetName().."Kh«ng ph¶i lµ ®å ®Ö cña b¹n, kh«ng thÓ gia nhËp ®éi thi ®Êu cña b¹n."
		end
		if (GetLevel() > 90) then
			return " Xin lçi! "..GetName().."Qu¸ cÊp 90, kh«ng thÓ lµm ®å ®Ö gia nhËp ®éi thi ®Êu ®­îc."
		end
		if (GetLevel() < 50) then
			return " Xin lçi! "..GetName().."Ch­a ®ñ cÊp 50, kh«ng thÓ gia nhËp ®éi thi ®Êu."
		end
	end,
	
}	--WLLS_DATA

tmp_process_data(WLLS_DATA)	
wllstab_additem(3, WLLS_DATA)
