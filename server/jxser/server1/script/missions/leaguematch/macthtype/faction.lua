Include("\\script\\missions\\leaguematch\\tb_head.lua")
--==============ÃÅÅÉµ¥ÏîÈüÏà¹ØÊı¾İ===============

--È«²¿ÃÅÅÉµ¥ÏîÈüÏà¹ØÊı¾İ
local nTmpLadderBase	= 10201
local WLLS_DATA = {
	
	name = "Danh s¸ch m«n ph¸i thi ®Êu",
	
	--µØÍ¼ĞÅÏ¢
	match_type = {
		{
			name = "ThiÕu L©m",
			level = 1,
			ladder = nTmpLadderBase,
			map = {{396, 560, 397, ""}},
		},
		{
			name = "Thiªn V­¬ng",
			level = 1,
			ladder = nTmpLadderBase + 1,
			map = {{398, 561, 399, ""}},
		},
		{
			name = "§­êng M«n",
			level = 1,
			ladder = nTmpLadderBase + 2,
			map = {{400, 562, 401, ""}},
		},
		{
			name = "Ngò §éc",
			level = 1,
			ladder = nTmpLadderBase + 3,
			map = {{402, 563, 403, ""}},
		},
		{
			name = "Nga Mi",
			level = 1,
			ladder = nTmpLadderBase + 4,
			map = {{404, 564, 405, ""}},
		},
		{
			name = "Thóy Yªn",
			level = 1,
			ladder = nTmpLadderBase + 5,
			map = {{406, 565, 407, ""}},
		},
		{
			name = "C¸i Bang",
			level = 1,
			ladder = nTmpLadderBase + 6,
			map = {{408, 566, 409, ""}},
		},
		{
			name = "Thiªn NhÉn",
			level = 1,
			ladder = nTmpLadderBase + 7,
			map = {{410, 567, 411, ""}},
		},
		{
			name = "Vâ §ang",
			level = 1,
			ladder = nTmpLadderBase + 8,
			map = {{412, 568, 413, ""}},
		},
		{
			name = "C«n L«n",
			level = 1,
			ladder = nTmpLadderBase + 9,
			map = {{414, 569, 415, ""}},
		},
		{
			name = "ThiÕu L©m",
			level = 2,
			ladder = nTmpLadderBase + 10,
			map = {{540, 570, 541, ""}},
		},
		{
			name = "Thiªn V­¬ng",
			level = 2,
			ladder = nTmpLadderBase + 11,
			map = {{542, 571, 543, ""}},
		},
		{
			name = "§­êng M«n",
			level = 2,
			ladder = nTmpLadderBase + 12,
			map = {{544, 572, 545, ""}},
		},
		{
			name = "Ngò §éc",
			level = 2,
			ladder = nTmpLadderBase + 13,
			map = {{546, 573, 547, ""}},
		},
		{
			name = "Nga Mi",
			level = 2,
			ladder = nTmpLadderBase + 14,
			map = {{548, 574, 549, ""}},
		},
		{
			name = "Thóy Yªn",
			level = 2,
			ladder = nTmpLadderBase + 15,
			map = {{550, 575, 551, ""}},
		},
		{
			name = "C¸i Bang",
			level = 2,
			ladder = nTmpLadderBase + 16,
			map = {{552, 576, 553, ""}},
		},
		{
			name = "Thiªn NhÉn",
			level = 2,
			ladder = nTmpLadderBase + 17,
			map = {{554, 577, 555, ""}},
		},
		{
			name = "Vâ §ang",
			level = 2,
			ladder = nTmpLadderBase + 18,
			map = {{556, 578, 557, ""}},
		},
		{
			name = "C«n L«n",
			level = 2,
			ladder = nTmpLadderBase + 19,
			map = {{558, 579, 559, ""}},
		},
	},
	
	award_rank = {
		{	--ÅÅĞĞ½±Àø£¬ĞÂĞã
			{1, 1500},	--µÚ1Ãû
			{2, 1000},	--µÚ2Ãû
			{3, 800},	--µÚ3Ãû
			{4, 600},	--µÚ4Ãû
			{8, 400},	--µÚ5-8Ãû
			{16, 300},	--µÚ9-16Ãû
			{32, 250},	--µÚ17-32Ãû
			{64, 200},	--µÚ33-64Ãû
			{128, 150},	--µÚ65-128Ãû
		}, {	--ÁªÈü
			{1, 3000},	--µÚ1Ãû
			{2, 2000},	--µÚ2Ãû
			{3, 1600},	--µÚ3Ãû
			{4, 1200},	--µÚ4Ãû
			{8, 800},	--µÚ5-8Ãû
			{16, 600},	--µÚ9-16Ãû
			{32, 500},	--µÚ17-32Ãû
			{64, 400},	--µÚ33-64Ãû
			{128, 300},	--µÚ65-128Ãû
		}
	},
	
	max_member = 1,	--Ã¿¸öÕ½¶ÓµÄ×î´óÈËÊı
	
	text_main = {	--officerÖ÷¶Ô»°£¨Ä©Î²²îÒì²¿·Ö£©
		"Vâ l©m liªn ®Êu kiÖt xuÊt lÇn nµy lµ M«n ph¸i ®¬n ®Êu, chän ra  ng­êi xuÊt s¾c nhÊt trong mçi m«n ph¸i",
		"Vâ l©m liªn ®Êu kiÖt xuÊt lÇn nµy lµ M«n ph¸i ®¬n ®Êu, chän ra  ng­êi xuÊt s¾c nhÊt trong mçi m«n ph¸i",
	},
	
	--====Functions====
	--·µ»Øµ±Ç°½ÇÉ«¿ÉÒÔ²Î¼ÓµÄ±ÈÈüÀàĞÍ£¬nilÎª²»ÄÜ²ÎÈü
	player_type = function()
		local n_level = wlls_player_level()
		if (n_level <= 0) then
			return nil
		end
		local n_fact = GetLastFactionNumber() + 1
		if (n_fact <= 0) then
			wlls_descript("<enter>  §©y lµ cuéc thi gi÷a c¸c m«n ph¸i, ng­¬i kh«ng m«n kh«ng ph¸i kh«ng ®­îc tham gia.")
			return nil
		end
		return (n_level - 1) * 10 + n_fact
	end,
	
	--ÎÒµÄÕ½¶Ó
	npc_mylg = function()
		local str_des = wlls_get_desc(1)
		local n_lid, n_mtype, n_job, str_lgname, n_memcount = wlls_lg_info()
		if (FALSE(n_lid)) then
			wlls_descript("<enter>  LÇn nµy"..str_des.."v× <color=red>®¬n ®Êu m«n ph¸i<color>, nÕu b¹n lÇn ®Çu tham gia thi ®Êu, hÖ thèng sÏ lËp cho b¹n mét chiÕn ®éi.")
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
	
}	--WLLS_DATA

tmp_process_data(WLLS_DATA)	
wllstab_additem(2, WLLS_DATA)
