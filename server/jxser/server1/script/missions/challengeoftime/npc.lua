-- description	: ´´½¨NPC
-- author		: wangbin
-- datetime		: 2005-06-06

Include("\\script\\battles\\battlehead.lua")
Include("\\script\\missions\\challengeoftime\\include.lua")
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\activitysys\\config\\32\\talkdailytask.lua")

-- ¹ÖÎïÊýÁ¿<=>Î»ÖÃÎÄ¼þ
map_posfiles = {
	[8] = {"\\settings\\maps\\challengeoftime\\lineup8.txt", 1},	
	[16] = {"\\settings\\maps\\challengeoftime\\lineup16.txt", 1},	
	[20] = {"\\settings\\maps\\challengeoftime\\lineup20.txt", 1},
	[24] = {"\\settings\\maps\\challengeoftime\\lineup24.txt", 1},
	[32] = {"\\settings\\maps\\challengeoftime\\lineup32.txt", 1},
	[40] = {"\\settings\\maps\\challengeoftime\\lineup40.txt", 1},
	[56] = {"\\settings\\maps\\challengeoftime\\lineup56.txt", 1}
};

-- NPCµÄID¿ÉÒÔÎªÈýÖÖÀàÐÍ£ºÊý×Ö¡¢±í¸ñ¡¢º¯Êý
-- NPC²ÎÊý¸÷ÁÐµÄº¬Òå£º<NPCÀàÐÍÊýÁ¿>, <½±Àø>, <ºóÐø´¦Àí¡¢ID¡¢Ãû×Ö¡¢µÈ¼¶¡¢ÎåÐÐ¡¢ÊÇ·ñBOSS(0,1)¡¢ÊýÁ¿¡¢Î»ÖÃ>
-- ³õ¼¶¹ÖÎï

tbFightNpc = {
	[1] = {
		tbNormalNpc = {
			-- 1
			{1, {1.5, 0, nil},
				{nil, 975, "S­¬ng §ao ", 75, -1, 0, 16, func_npc_getpos}},
			-- 2
			{1, {1.5, 0, nil},
				{nil, 976, "Phi Sa", 75, -1, 0, 16, func_npc_getpos}},
			-- 3
			{1, {3, 0, nil},
				{nil, 977, "S­¬ng Liªm", 75, -1, 0, 20, func_npc_getpos}},
			-- 4
			{2,	{9, 0, nil},
				{nil, 975, "S­¬ng §ao ", 75, func_npc_getseries, 0, 16, func_npc_getpos},
				{func_npc_proceed, func_npc_getid, func_npc_getname, 75, func_npc_getseries, 1, 1, {1568, 3227}}},
			-- 5
			{1, {3, 0, nil},
				{nil, 978, "Thõa Phong", 75, -1, 0, 20, func_npc_getpos}},
			-- 6
			{1, {4.5, 0, nil},
				{nil, 979, "Thñy Hån", 75, 1, 0, 24, func_npc_getpos}},
			-- 7
			{1, {4.5, 0, nil},
				{nil, 980, "ThÇn Tý ", 75, 3, 0, 24, func_npc_getpos}},
			-- 8
			{2,	{6, 10, nil},
				{nil, 976, "Phi Sa", 75, func_npc_getseries, 0, 16, func_npc_getpos},
				{func_npc_proceed, func_npc_getid, func_npc_getname, 75, func_npc_getseries, 1, 1, {1568, 3227}}},
			-- 9
			{1, {5, 0, nil},
				{nil, 981, "Tranh H¸n", 75, 2, 0, 32, func_npc_getpos}},
			-- 10
			{1, {5, 0, nil},
				{nil, 982, "Ph¸ Lang", 75, 4, 0, 32, func_npc_getpos}},
			-- 11
			{2,	{9, 0, nil},
				{nil, 977, "S­¬ng Liªm", 75, func_npc_getseries, 0, 16, func_npc_getpos},
				{func_npc_proceed, func_npc_getid, func_npc_getname, 75, func_npc_getseries, 1, 1, {1568, 3227}}},
			-- 12
			{1, {6, 0, nil},
				{nil, 983, "¶nh C«n", 75, 0, 0, 40, func_npc_getpos}},
			-- 13
			{2,	{6, 10, nil},
				{nil, 978, "Thõa Phong", 75, func_npc_getseries, 0, 16, func_npc_getpos},
				{func_npc_proceed, func_npc_getid, func_npc_getname, 75, func_npc_getseries, 1, 1, {1568, 3227}}},
			-- 14
			{1,	{4.5, 0, nil},
				{nil, 987, "Giang TrÇm YÕn", 75, -1, 0, 20, func_npc_getpos}},
			-- 15
			{1,	{6, 0, nil},
				{nil, 984, "§ao Tö ", 75, -1, 0, 32, func_npc_getpos}},
			-- 16
			{2,	{9, 0, nil},
				{nil, 979, "Thñy Hån", 75, func_npc_getseries, 0, 16, func_npc_getpos},
				{func_npc_proceed, func_npc_getid, func_npc_getname, 75, func_npc_getseries, 1, 1, {1568, 3227}}},
			-- 17
			{1,	{4.5, 0, nil},
				{nil, 988, "C« Dù  TÈu", 75, -1, 0, 20, func_npc_getpos}},
			-- 18
			{2,	{6, 10, nil},
				{nil, 980, "ThÇn Tý ", 75, func_npc_getseries, 0, 16, func_npc_getpos},
				{func_npc_proceed, func_npc_getid, func_npc_getname, 75, func_npc_getseries, 1, 1, {1568, 3227}}},
			-- 19
			{1,	{4.5, 0, nil},
				{nil, 989, "Ch­ëng B¸t Ph­¬ng", 75, -1, 0, 20, func_npc_getpos}},
			-- 20
			{1,	{6, 0, nil},
				{nil, 985, "Lang bæng", 75, -1, 0, 24, func_npc_getpos}},
			-- 21
			{2,	{10.5, 0, nil},
				{nil, 981, "Tranh H¸n", 75, func_npc_getseries, 0, 16, func_npc_getpos},
				{func_npc_proceed, func_npc_getid, func_npc_getname, 75, func_npc_getseries, 1, 1, {1568, 3227}}},
			-- 22
			{1,	{4.5, 0, nil},
				{nil, 990, "TiÔn Than Thª ", 75, -1, 0, 20, func_npc_getpos}},
			-- 23
			{1,	{4.5, 0, nil},
				{nil, 991, "NhËm T«ng Hoµnh", 75, -1, 0, 20, func_npc_getpos}},
			-- 24
			{1,	{7.5, 30, nil},
				{nil, 992, "§å Tµn Sinh", 75, -1, 0, 20, func_npc_getpos}},
			-- 25
			{2,	{9, 0, nil},
				{nil, 984, "§ao Tö ", 75, func_npc_getseries, 0, 16, func_npc_getpos},
				{func_npc_proceed, func_npc_getid, func_npc_getname, 75, func_npc_getseries, 1, 1, {1568, 3227}}},
			-- 26
			{1, {7.5, 0, nil},
				{nil, 986, "H¾c C©n", 75, -1, 0, 56, func_npc_getpos}},
			-- 27
			{2, {24, 15, nil},
				{nil, 1006, "NhiÕp ThÝ TrÇn", 75, -1, 0, 1, {1568, 3227}},
				{nil, 985, "Lang bæng", 75, -1, 0, 16, func_npc_getpos}},
			-- 28
			{1, {0, 0, nil},
				{nil, 993, func_npc_get_eachname, 75, -1, 1, 8, func_npc_getpos}},
		}, --tbNormalNpc
		
		tbHidenNpc = {
			-- ÌôÕ½ÉÍ½ðÊ®´óÁÔÈËÅÅÐÐ°ñÍæ¼Ò
			{1,	{0, 0, nil}, {nil, {994, 1001}, {func_ladder_getname, 10119}, 75, func_npc_getseries, 1, 1, {1568, 3227}}},
			-- ÌôÕ½³õ¼¶Ê±¼äµÄÌôÕ½ÅÅÐÐ°ñÍæ¼Ò
			{1,	{0, 0, nil}, {nil, {994, 1001}, {func_ladder_getname, 10179}, 75, func_npc_getseries, 1, 1, {1568, 3227}}}
		},--tbHidenNpc
		
	}, -- [1]
	[2] = {
		tbNormalNpc = {
			-- 1
			{1, {2, 0, nil},
				{nil, 1007, "S­¬ng §ao ", 95, -1, 0, 16, func_npc_getpos}},
			-- 2
			{1, {2, 0, nil},
				{nil, 1008, "Phi Sa", 95, -1, 0, 16, func_npc_getpos}},
			-- 3
			{1, {3, 0, nil},
				{nil, 1009, "S­¬ng Liªm", 95, -1, 0, 20, func_npc_getpos}},
			-- 4
			{2, {9, 0, nil},
				{nil, 1007, "S­¬ng §ao ", 95, func_npc_getseries, 0, 16, func_npc_getpos},
				{func_npc_proceed, func_npc_getid, func_npc_getname, 95, func_npc_getseries, 1, 1, {1568, 3227}}},
			-- 5
			{1, {3, 0, nil},
				{nil, 1010, "Thõa Phong", 95, -1, 0, 20, func_npc_getpos}},
			-- 6
			{1, {5, 0, nil},
				{nil, 1011, "Thñy Hån", 95, 1, 0, 24, func_npc_getpos}},
			-- 7
			{1, {5, 0, nil},
				{nil, 1012, "ThÇn Tý ", 95, 3, 0, 24, func_npc_getpos}},
			-- 8
			{2, {9, 15, nil},
				{nil, 1008, "Phi Sa", 95, func_npc_getseries, 0, 16, func_npc_getpos},
				{func_npc_proceed, func_npc_getid, func_npc_getname, 95, func_npc_getseries, 1, 1, {1568, 3227}}},
			-- 9
			{1, {6, 0, nil},
				{nil, 1013, "Tranh H¸n", 95, 2, 0, 32, func_npc_getpos}},
			-- 10
			{1, {6, 0, nil},
				{nil, 1014, "Ph¸ Lang", 95, 4, 0, 32, func_npc_getpos}},
			-- 11
			{2, {12, 0, nil},
				{nil, 1009, "S­¬ng Liªm", 95, func_npc_getseries, 0, 16, func_npc_getpos},
				{func_npc_proceed, func_npc_getid, func_npc_getname, 95, func_npc_getseries, 1, 1, {1568, 3227}}},
			-- 12
			{1, {9, 0, nil},
				{nil, 1015, "¶nh C«n", 95, 0, 0, 40, func_npc_getpos}},
			-- 13
			{2, {9, 15, nil},
				{nil, 1010, "Thõa Phong", 95, func_npc_getseries, 0, 16, func_npc_getpos},
				{func_npc_proceed, func_npc_getid, func_npc_getname, 95, func_npc_getseries, 1, 1, {1568, 3227}}},
			-- 14
			{1, {6, 0, nil},
				{nil, 1019, "Giang TrÇm YÕn", 95, -1, 0, 20, func_npc_getpos}},
			-- 15
			{1, {9, 0, nil},
				{nil, 1016, "§ao Tö ", 95, -1, 0, 32, func_npc_getpos}},
			-- 16
			{2, {14, 0, nil},
				{nil, 1011, "Thñy Hån", 95, func_npc_getseries, 0, 16, func_npc_getpos},
				{func_npc_proceed, func_npc_getid, func_npc_getname, 95, func_npc_getseries, 1, 1, {1568, 3227}}},
			-- 17
			{1, {6, 0, nil},
				{nil, 1020, "C« Dù  TÈu", 95, -1, 0, 20, func_npc_getpos}},
			-- 18
			{2, {12, 20, nil},
				{nil, 1012, "ThÇn Tý ", 95, func_npc_getseries, 0, 16, func_npc_getpos},
				{func_npc_proceed, func_npc_getid, func_npc_getname, 95, func_npc_getseries, 1, 1, {1568, 3227}}},
			-- 19
			{1, {6, 0, nil},
				{nil, 1021, "Ch­ëng B¸t Ph­¬ng", 95, -1, 0, 20, func_npc_getpos}},
			-- 20
			{1, {8, 0, nil},
				{nil, 1017, "Lang bæng", 95, -1, 0, 24, func_npc_getpos}},
			-- 21
			{2, {14, 0, nil},
				{nil, 1013, "Tranh H¸n", 95, func_npc_getseries, 0, 16, func_npc_getpos},
				{func_npc_proceed, func_npc_getid, func_npc_getname, 95, func_npc_getseries, 1, 1, {1568, 3227}}},
			-- 22
			{1, {6, 0, nil},
				{nil, 1022, "TiÔn Than Thª ", 95, -1, 0, 20, func_npc_getpos}},
			-- 23
			{1, {6, 0, nil},
				{nil, 1023, "NhËm T«ng Hoµnh", 95, -1, 0, 20, func_npc_getpos}},
			-- 24
			{1, {10, 20, nil},
				{nil, 1024, "§å Tµn Sinh", 95, -1, 0, 20, func_npc_getpos}},
			-- 25
			{2, {15, 0, nil},
				{nil, 1016, "§ao Tö ", 95, func_npc_getseries, 0, 16, func_npc_getpos},
				{func_npc_proceed, func_npc_getid, func_npc_getname, 95, func_npc_getseries, 1, 1, {1568, 3227}}},
			-- 26
			{1, {9, 0, nil},
				{nil, 1018, "H¾c C©n", 95, -1, 0, 56, func_npc_getpos}},
			-- 27
			{2, {32, 32, nil},
				{nil, 1038, "NhiÕp ThÝ TrÇn", 95, -1, 1, 1, {1568, 3227}},
				{nil, 1017, "Lang bæng", 95, -1, 0, 16, func_npc_getpos}},
			-- 28
			{1, {0, 0, nil},
				{nil, 1025, func_npc_get_eachname, 75, -1, 1, 8, func_npc_getpos}},
		}, -- tbFightNpc

		tbHidenNpc = {
			-- ÌôÕ½ÉÍ½ðÊ®´óÁÔÈËÅÅÐÐ°ñÍæ¼Ò
			{1,	{0, 0, nil}, {nil, {1026, 1033}, {func_ladder_getname, 10119}, 75, -1, 1, 1, {1568, 3227}}},
			-- ÌôÕ½¸ß¼¶Ê±¼äµÄÌôÕ½ÅÅÐÐ°ñÍæ¼Ò
			{1,	{0, 0, nil}, {nil, {1026, 1033}, {func_ladder_getname, 10180}, 75, -1, 1, 1, {1568, 3227}}}
		} ,--tbHidenNpc
	}, --[2]
}

-- Ð¡Äôß±³¾ ºÍ ÐÂboss
map_new_Ncp = {
	[1] = {nil, 1673, "TiÓu NhiÕp ThÝ TrÇn", 95, -1, 1, 1, {1568, 3227}},
	[2] = { nNpcId = 1674, nLevel = 95,	bNoRevive = 1, szName = "V­ît ¶i_Cæ B¸ch",	nIsboss = 1,},
	[3] = { nNpcId = 1675, nLevel = 95,	bNoRevive = 1, szName = "V­ît ¶i_HuyÒn Gi¸c §¹i S­",	nIsboss = 1,},
	[4] = { nNpcId = 1676, nLevel = 95,	bNoRevive = 1, szName = "V­ît ¶i_§­êng BÊt NhiÔm",	nIsboss = 1,},
	[5] = { nNpcId = 1677, nLevel = 95,	bNoRevive = 1, szName = "V­ît ¶i_Lam Y Y",	nIsboss = 1,},
	[6] = { nNpcId = 1678, nLevel = 95,	bNoRevive = 1, szName = "V­ît ¶i _Thanh HiÓu S­ Th¸i",	nIsboss = 1,},
	[7] = { nNpcId = 1679, nLevel = 95,	bNoRevive = 1, szName = "V­ît ¶i_Chung Linh Tó",	nIsboss = 1,},
	[8] = { nNpcId = 1680, nLevel = 95,	bNoRevive = 1, szName = "V­ît ¶i_Hµ Nh©n Ng¶",	nIsboss = 1,},
	[9] = { nNpcId = 1681, nLevel = 95,	bNoRevive = 1, szName = "V­ît ¶i _§oan Méc DuÖ",	nIsboss = 1,},
	[10] = { nNpcId = 1682, nLevel = 95,	bNoRevive = 1, szName = "V­ît ¶i_§¹o Thanh Ch©n Nh©n",	nIsboss = 1,},
	[11] = { nNpcId = 1683, nLevel = 95,	bNoRevive = 1, szName = "V­ît ¶i _Toµn C¬ Tö",	nIsboss = 1,},
};

-- ÐÂµØÍ¼´«ËÍnpc
map_transfer_npc = {
	[1] = { nNpcId = 1684,	bNoRevive = 1, szName = "V­ît ¶i_Ng­êi tiÕp dÉn MËt Phßng", szScriptPath = "\\script\\missions\\challengeoftime\\npc\\transfer.lua"},
}

-- Ëæ»ú½±Àø£¬Ëæ»ú»ùÊýÎª100000
map_random_awards = {
	100000,													-- Ëæ»ú»ùÊýÎª100000
	{0.005, 		{"Tinh Hång B¶o Th¹ch",		353}},					-- ÐÉºì±¦Ê¯
	{0.005, 		{"Lam Thñy Tinh", 			238}},					-- À¼Ë®¾§
	{0.005, 		{"Tö Thñy Tinh", 			239}},					-- ×ÏË®¾§
	{0.005, 		{"Lôc Thñy Tinh", 			240}},					-- ÂÌË®¾§
	{0.0005, 	{"Vâ L©m MËt TÞch", 		6, 1, 26, 1, 0, 0}},	-- ÎäÁÖÃØ¼®
	{0.0005, 	{"TÈy Tñy Kinh",			6, 1, 22, 1, 0, 0}},	-- Ï´Ëè¾­
	{0.2, 		{"Phóc Duyªn Lé (§¹i) ",	6, 1, 124, 1, 0, 0}},	-- ¸£ÔµÂ¶£¨´ó£©
	{0.19587, 		{"Phóc Duyªn Lé (Trung) ", 	6, 1, 123, 1, 0, 0}},	-- ¸£ÔµÂ¶£¨ÖÐ£©
	{0.18, 		{"Phóc Duyªn Lé (TiÓu) ",	6, 1, 122, 1, 0, 0}},	-- ¸£ÔµÂ¶£¨Ð¡£©
	{0.15, 	{"Tiªn Th¶o Lé",			6, 1, 71, 1, 0, 0}},	-- ÏÉ²ÝÂ¶
	{0.1, 		{"Thiªn s¬n  B¶o Lé ",		6, 1, 72, 1, 0, 0}},	-- ÌìÉ½ÓñÂ¶
	{0.1, 		{"B¸ch Qu¶ Lé",			6, 1, 73, 1, 0, 0}},	-- °Ù¹ûÂ¶
--	{0.00, 		{"´ó°×¾ÔÍè",		6, 1, 130, 1, 0, 0}},	-- ´ó°×¾ÔÍè
	{0.05, 		{"LÖnh bµi Phong L¨ng §é",		489}},					-- ·çÁê¶ÉÁîÅÆ
	--{0.0005, 	{" §å phæ Hoµng Kim - §Þnh Quèc Thanh Sa Tr­êng Sam",	0, 159}},				-- ¶¨¹úÖ®ÇàÉ´³¤ÉÀ
	--{0.0005, 	{"§Þnh Quèc ¤ Sa Ph¸t Qu¸n",	0, 160}},				-- ¶¨¹úÖ®ÎÙÉ°·¢¹Ú
	--{0.0005,		{"§Þnh Quèc XÝch Quyªn NhuyÔn Ngoa",	0, 161}},				-- ¶¨¹úÖ®³à¾îÈíÑ¥
	--{0.0005,		{" §å phæ Hoµng Kim - §Þnh Quèc Tö §»ng Hé uyÓn",	0, 162}},				-- ¶¨¹úÖ®×ÏÌÙ»¤Íó
	--{0.0005,		{" §å phæ Hoµng Kim - §Þnh Quèc Ng©n Tµm Yªu ®¸i",	0, 163}},				-- ¶¨¹úÖ®Òø²ÏÑü´ø
	--{0.0001,	{"An Bang B¨ng Tinh Th¹ch H¹ng Liªn",0, 164}},				-- °²°îÖ®±ù¾§Ê¯ÏîÁ´
	--{0.0001,	{" §å phæ Hoµng Kim - An Bang Cóc Hoa Th¹ch ChØ hoµn",0, 165}},				-- °²°îÖ®¾Õ»¨Ê¯Ö¸»·
	--{0.0001,	{" §å phæ Hoµng Kim - An Bang §iÒn Hoµng Th¹ch Ngäc Béi",0, 166}},				-- °²°îÖ®Ìï»ÆÊ¯ÓñÅå
	--{0.0001,	{" §å phæ Hoµng Kim - An Bang Kª HuyÕt Th¹ch Giíi ChØ ",0, 167}},				-- °²°îÖ®¼¦ÑªÊ¯½äÖ¸
	--{0.00001, {"Méng Long Kim Ti ChÝnh Hång Cµ Sa",	0, 2}},				-- ÃÎÁúÖ®½ðË¿ÕýºìôÂôÄ
	--{0.00001, {"Tø Kh«ng Gi¸ng Ma Giíi ®ao",	0, 11}},				-- ËÄ¿ÕÖ®½µÄ§½äµ¶
	--{0.00001,	{"Phôc Ma Tö Kim C«n",	0, 6}},				-- ·üÄ§Ö®×Ï½ð¹÷
	--{0.00001,	{"KÕ NghiÖp B«n L«i Toµn Long th­¬ng",	0, 21}},				-- ¼ÌÒµÖ®±¼À××êÁúÇ¹
	--{0.00001,	{"Ngù Long L­îng Ng©n B¶o ®ao",	0, 26}},				-- ÓùÁúÖ®ÁÁÒø±¦µ¶
	--{0.00001,	{"§Þa Ph¸ch H¾c DiÖm Xung Thiªn Liªn",0, 87}},				-- µØÆÇÖ®ºÚÑæ³åÌìÁ´
	--{0.00001,	{"B¨ng Hµn §¬n ChØ Phi §ao",0, 71}},				-- ±ùº®Ö®µ¯Ö¸·Éµ¶
	--{0.00001,	{"S©m Hoang Phi Tinh §o¹t Hån",0, 81}},				-- É­»ÄÖ®·ÉÐÇ¶á»ê
	--{0.00001,	{"Thiªn Quang §Þnh T©m Ng­ng ThÇn Phï ",0, 77}},				-- Ìì¹âÖ®¶¨ÐÄÄýÉñ·û
	--{0.00001, {"Chó Ph­îc DiÖt L«i C¶nh Phï ",	0, 67}},				-- Öä¸¿Ö®ÃðÀ×¾±·û
	--{0.00001, {"Minh ¶o Tµ S¸t §éc NhËn",	0, 61}},				-- Ú¤»ÃÖ®Ð°É²¶¾ÈÐ
	--{0.00001,	{"Tª Hoµng Phông Nghi ®ao",	0, 46}},				-- ÆÜ»ËÖ®·ïÒÇµ¶
	--{0.00001,	{"BÝch H¶i Uyªn ¦¬ng Liªn Hoµn ®ao",	0, 51}},				-- ±Ìº£Ö®Ô§ÑìÁ¬»·µ¶
	--{0.00001,	{"V« Ma Hång Truy NhuyÔn Th¸p hµi",	0, 40}},				-- ÎÞ÷ÊÖ®ºìç»Èí¶NÐ¬
	--{0.00001,	{"V« Ma TÈy T­îng Ngäc KhÊu ",0, 39}},				-- ÎÞ÷ÊÖ®Ï´ÏóÓñ¿Û
	--{0.00001,	{"CËp Phong Tam Thanh Phï ",0, 122}},				-- ¼°·áÖ®ÈýÇå·û
	--{0.00001,	{"Vô ¶o B¾c Minh §¹o qu¸n",0, 136}},				-- Îí»ÃÖ®±±Ú¤µÀ¹Ú
	--{0.00001,	{"S­¬ng Tinh Thiªn Niªn Hµn ThiÕt",0, 126}},				-- Ëª¾§Ö®Ç§Äêº®Ìú
	--{0.00001,	{"L«i Khung Thiªn §Þa Hé phï ",	0, 132}},				-- À×ñ·Ö®ÌìµØ»¤·û
	--{0.00001,	{"Ma ThÞ s¬n  H¶i Phi Hång Lý ",	0, 115}},				-- Ä§ÊÈÖ®É½º£·ÉºèÂÄ
	--{0.00001,	{"Ma Hoµng ¸n XuÊt Hæ H¹ng Khuyªn",	0, 107}},				-- Ä§»ÍÖ®°´³ö»¢ÏîÈ¦
	--{0.00001,	{"§ång Cõu Kh¸ng Long Hé UyÓn",0, 94}},				-- Í¬³ðÖ®¿ºÁú»¤ÊÖ
	--{0.00001,	{"§Þch Kh¸i Lôc Ngäc Tr­îng",0, 96}},				-- µÐâéÖ®ÂÌÓñÕÈ
};

-- »ñÈ¡NPCµÄID
function get_npc_id(item, index)
	local id = item[NPC_ATTRIDX_ID];
	local id_type = type(id);
	if (id_type == "function") then
		return id(item, index);
	elseif (id_type == "number") then
		return id;
	elseif (id_type == "table") then
		local pos = random(1, getn(id));
		return id[pos];
	end
end

-- »ñÈ¡NPCµÄÃû×Ö
function get_npc_name(item, index)
	local name = item[NPC_ATTRIDX_NAME];
	local name_type = type(name);

	if (name_type == "string") then
		return name;
	elseif (name_type == "function") then
		return name(item, index);
	elseif (name_type == "table") then
		local func = name[1];
		return func(item, index);
	else
		return nil;
	end
end

-- »ñÈ¡NPCµÄ¼¶±ð
function get_npc_level(item, index)
	return item[NPC_ATTRIDX_LEVEL];
end

-- »ñÈ¡NPCµÄÎåÐÐ
function get_npc_series(item, index)
	local series = item[NPC_ATTRIDX_SERIES];
	local series_type = type(series);
	if (series_type == "function") then
		return series(item, index);
	elseif (series_type == "number") then
		if (series < 0) then
			local pos = random(1, getn(map_series));
			return map_series[pos];
		else
			return series;
		end
	else
		return nil;
	end
end

-- NPCµÄºóÐø´¦Àí£¨ÀÛ¼Óµ±Ç°Ê¹ÓÃµÄÍæ¼ÒË÷Òý£©
function npc_proceed(item)
	local proceed = item[NPC_ATTRIDX_PROCEED];
	local proceed_type = type(proceed);
	if (proceed_type == "function") then
		proceed(item);
	end
end

-- »ñÈ¡NPCµÄÊýÁ¿
function get_npc_count(item)
	return item[NPC_ATTRIDX_COUNT];
end

-- »ñÈ¡NPCµÄÎ»ÖÃ
function get_npc_pos(item, index)
	local pos = item[NPC_ATTRIDX_POSITION];
	local pos_type = type(pos);
	if (pos_type == "table") then
		return pos[1], pos[2];
	elseif (pos_type == "function") then
		return pos(item, index);
	else
		return nil;
	end
end

-- ÊÇ·ñBOSS
function get_npc_isboss(item)
	return item[NPC_ATTRIDX_ISBOSS];
end

-- µ±Ç°NPCÉèÖÃ±í
function GetNpcList()
	local nLevel = GetMatchLevel()
	if nLevel > getn(tbFightNpc) then
		return {}
	end
	return tbFightNpc[nLevel].tbNormalNpc
end

-- µ±Ç°Òþ²ØNPCÉèÖÃ±í
function GetHidenNpcList()
	local nLevel = GetMatchLevel()
	if nLevel > getn(tbFightNpc) then
		return {}
	end
	return tbFightNpc[nLevel].tbHidenNpc
end

-- »ñÈ¡Åú´ÎÊýÁ¿
function get_batch_count()
	return getn(GetNpcList())
end

-- ¸ù¾ÝÉè¶¨´´½¨NPC£¬·µ»Ø´´½¨µÄNPCµÄÊýÁ¿
function add_npc(item)
	local npc_count = get_npc_count(item);			-- NPCÊýÁ¿
	local res_count = 0;							-- ²úÉúµÄNPCÊýÁ¿
	
	for index = 1, npc_count do
		local id = get_npc_id(item, index);			-- NPCµÄID
		local level = get_npc_level(item, index);	-- NPCµÈ¼¶
		local isboss = get_npc_isboss(item, index);	-- ÊÇ·ñboss
		local series = get_npc_series(item, index);
		local name = get_npc_name(item, index);
		local px, py = get_npc_pos(item, index);
		npc_proceed(item);

		local npc_index = AddNpcEx(
			id,			-- ID
			level,		-- µÈ¼¶
			series,		-- ÎåÐÐ
			SubWorld,	-- µØÍ¼
			px * 32,	-- X×ø±ê
			py * 32,	-- Y×ø±ê
			1,			-- ²»ÖØÉú
			name,		-- Ãû×Ö
			isboss);	-- ÊÇ·ñBOSS
		if (npc_index ~= nil and npc_index > 0) then
			res_count = res_count + 1;
			-- ÉèÖÃËÀÍö½Å±¾
			SetNpcDeathScript(npc_index, SCRIPT_NPC_DEATH);
		else
			-- DEBUG
			local msg = format("Failed to AddNpcEx(%d,%d,%d,%d,%d,%d,%d,%s,%d)!!!",
				id, level, series, SubWorld, px, py, 1, name, isboss);
			print(msg);
		end
	end
	
	return res_count;
end

function create_all_npc(npcs)
	local times = npcs[1];
	local count = 0;
	for i = 1, times do
		count = count + add_npc(npcs[i + 2]);
	end
	
	SetMissionV(VARV_NPC_COUNT, count);
	return count;
end

-- ÔÚµØÍ¼ÉÏÉú³ÉNPC
function create_batch_npc(batch)
	local tbNpcList = GetNpcList()
	local npc = tbNpcList[batch]	-- ³õ¼¶¹Ö

	local npc_count = create_all_npc(npc)
	

	
	-- ´³¹Øµ÷Õû by wangjingjun 2011.03.01
	if batch == GetMissionV(VARV_XIAONIESHICHEN_BATCH) and GetMissionV(VARV_BATCH_MODEL) == 1 then

		--add_npc(map_new_Ncp[1])
	--	basemission_CallNpc(map_new_Ncp[1], SubWorldIdx2ID(SubWorld),nX, nY)
		--SetMissionV(VARV_NPC_COUNT, npc_count + 1);
		--WriteLog("TiÓu NhiÕp ThÝ TrÇn ®· tham gia chiÕn cuéc!")
		--Msg2MSAll(MISSION_MATCH, "TiÓu NhiÕp ThÝ TrÇn ®· tham gia chiÕn cuéc!");
	end

	local msg = "XuÊt hiÖn" .. npc_count .. "con qu¸i!"
	Msg2MSAll(MISSION_MATCH, msg)
	
	-- µÚ11¹ØË¢³öÈÕ³£ÈÎÎñ¶Ô»°NPC
	--if (batch == 11) then
		-- ÈÕ³£ÈÎÎñË¢ÐÂ¶Ô»°NPC
	--	%tbTalkDailyTask:AddTalkNpc(SubWorldIdx2ID(SubWorld), SubWorldIdx2ID(SubWorld));
	--end
end


-- Ôö¼Ó´³¹Ø´«ËÍnpc
function add_transfer_npc()
	local nX,nY, nMapIndex = GetPos()
	--basemission_CallNpc(map_transfer_npc[1], SubWorldIdx2ID(nMapIndex),1568*32, 3227*32)
end
