Include("\\script\\lib\\awardtemplet.lua");
Include("\\script\\item\\newyear_2009\\head.lua");

tb_wangshenghongbao_award	=
{
	{szName="1 danh v‰ng", 			nRepute = 1, 		nRate = 25},
	{szName="2 danh v‰ng", 			nRepute = 2, 		nRate = 20},
	{szName="3 danh v‰ng", 			nRepute = 3, 		nRate = 15},
	{szName="10 danh v‰ng",			nRepute = 10, 		nRate = 3},
	{szName="50 danh v‰ng",		 	nRepute = 50, 		nRate = 0.1},
	{szName="Huy“n tinh kho∏ng thπch c p 3", 		tbProp={6, 1, 147, 3, 0, 0}, 	nRate = 5},
	{szName="Huy“n Tinh Kho∏ng Thπch c p 4", 		tbProp={6, 1, 147, 4, 0, 0},	nRate = 3},
	{szName="Huy“n Tinh Kho∏ng Thπch c p 5", 		tbProp={6, 1, 147, 5, 0, 0},	nRate = 2},
	{szName="T©m T©m T≠¨ng ∏nh phÔ ",		tbProp={6, 1, 18,  1, 0, 0},	nRate = 3},
	{szName="Phi TËc hoµn",			tbProp={6, 0, 6,   1, 0, 0}, 	nRate = 5},
	{szName="ßπi L˘c hoµn",			tbProp={6, 0, 3,   1, 0, 0}, 	nRate = 5},
	{szName="V‚ L©m MÀt Tﬁch", 		tbProp={6, 1, 26, 1, 0, 0},	 	nRate = 0.1},
	{szName="T»y TÒy Kinh", 			tbProp={6, 1, 22, 1, 0, 0}, 	nRate = 0.1},
	{szName="Bµn Nh≠Óc T©m Kinh", 		tbProp={6, 1, 12, 1, 0, 0}, 	nRate = 1},
	{szName="Thi’t La H∏n", 			tbProp={6, 1, 23, 1, 0, 0}, 	nRate = 3},
	{szName="Th«n b› ßπi HÂng Bao", 		tbProp={6, 1, 402,1, 0, 0}, 	nRate = 7.779},
	{szName="ßﬁnh QuËc § Sa Ph∏t Qu∏n", 	tbProp={0, 160},	nQuality = 1,	nRate = 0.008},
	{szName="ßﬁnh QuËc Thanh Sa Tr≠Íng Sam", 	tbProp={0, 159},	nQuality = 1,	nRate = 0.01},
	{szName="ßﬁnh QuËc Ng©n Tµm Y™u Æ∏i", 	tbProp={0, 163}, 	nQuality = 1,	nRate = 0.1},
	{szName="ßﬁnh QuËc X›ch Quy™n Nhuy‘n Ngoa",	tbProp={0, 161}, 	nQuality = 1,	nRate = 0.015},
	{szName="ßﬁnh QuËc Tˆ ßªng HÈ uy”n", 	tbProp={0, 162}, 	nQuality = 1,	nRate = 0.2},
	{szName="Nhu T◊nh C©n QuËc Ngh™ Th≠Íng", 	tbProp={0, 190}, 	nQuality = 1,	nRate = 0.008},
	{szName="Nhu T◊nh  Tu÷ T©m Ng‰c BÈi", 	tbProp={0, 193}, 	nQuality = 1,	nRate = 0.07},
	{szName="Nhu T◊nh  PhÙng Nghi GiÌi Chÿ ", 	tbProp={0, 192}, 	nQuality = 1,	nRate = 0.3},
	{szName="Nhu T◊nh ThÙc N˜ Hπng Li™n", 	tbProp={0, 191}, 	nQuality = 1,	nRate = 0.4},
	{szName="Hi÷p CËt T◊nh ˝ K’t", 	tbProp={0, 189}, 	nQuality = 1,	nRate = 0.01},
	{szName="Hi÷p CËt Thi’t Huy’t Sam", 	tbProp={0, 186}, 	nQuality = 1,	nRate = 0.1},
	{szName="Hi÷p CËt ßan T©m GiÌi", 	tbProp={0, 188}, 	nQuality = 1,	nRate = 0.3},
	{szName="Hi÷p CËt ßa T◊nh Hoµn", 	tbProp={0, 187}, 	nQuality = 1,	nRate = 0.4},
};

tb_tree_itemid	=
{
	[1]	= 1917,
	[2]	= 1918,
};

tb_openhongbao_mapid	=
{
	[11]	= 1,
	[1] 	= 1,
	[37] 	= 1,
	[176] 	= 1,
	[162] 	= 1,
	[78] 	= 1,
	[80] 	= 1,
	[174] 	= 1,
	[121] 	= 1,
	[153] 	= 1,
	[101] 	= 1,
	[99] 	= 1,
	[100] 	= 1,
	[20]	= 1,
	[53] 	= 1,
	[54] 	= 1,
	[175] 	= 1,
	[55] 	= 1,
};

function main()
	newyear0901_resettask();
	
	local ndate = tonumber(GetLocalDate("%Y%m%d"));
	if (ndate >= newyear0901_lazhu_expiredtime) then
		Msg2Player("VÀt ph»m nµy Æ∑ qu∏ hπn.");
		return 0;
	end
	
	if (GetLevel() < 50 or GetExtPoint(0) < 1) then
		Say("ßπi hi÷p v…n ch≠a ÆÒ c p 50 ho∆c v…n ch≠a nπp thŒ, v◊ vÀy kh´ng th” sˆ dÙng Thﬁnh V≠Óng HÂng Bao.", 0);
		return 1;
	end
	
	local subworld, x, y	= GetWorldPos();
	if (tb_openhongbao_mapid[subworld] == nil) then
		Say("Thﬁnh V≠Óng HÂng Bao chÿ sˆ dÙng tπi thµnh thﬁ vµ th´n tr n.", 0);
		return 1;
	end
	
	if (CalcFreeItemCellCount() < 20) then
		Say("Hµnh trang cÒa Æπi hi÷p Æ∑ Æ«y!", 0);
		return 1;
	end
	
	if (100 + GetTask(newyear0901_TSK_GetExp_Hongbao) <= GetTask(newyear0901_TSK_GetExpUpLimit))	then
		SetTask(newyear0901_TSK_GetExp_Hongbao, 100 + GetTask(newyear0901_TSK_GetExp_Hongbao));
		AddOwnExp(1000000);
		
    	subworld = SubWorldID2Idx(subworld);
    	local n_tree_idx		= random(1, 2);
    	local n_itemid 			= tb_tree_itemid[n_tree_idx];
    	local nItemIdx 			= DropItem(subworld, x * 32, y * 32, -1, 6, 1, n_itemid, 1, 0, 0, 0);
			
		tbAwardTemplet:GiveAwardByList(tb_wangshenghongbao_award, "Thﬁnh V≠Óng HÂng Bao");	
	else
		Say("ßπi hi÷p Æ∑ Æπt Æ’n giÌi hπn kinh nghi÷m cao nh t, v◊ vÀy kh´ng th” sˆ dÙng th™m Thﬁnh V≠Óng HÂng Bao.", 0);
		return 1;
	end
end