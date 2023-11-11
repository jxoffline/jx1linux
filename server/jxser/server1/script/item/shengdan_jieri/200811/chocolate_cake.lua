Include("\\script\\lib\\awardtemplet.lua");
Include("\\script\\item\\shengdan_jieri\\200811\\head.lua");

tb_chocolate_award	=
{
	{szName="1 danh väng", 			nRepute = 1, 		nRate = 9.8545},
	{szName="2 danh väng", 			nRepute = 2, 		nRate = 23},
	{szName="3 danh väng", 			nRepute = 3, 		nRate = 25},
	{szName="10 danh väng",			nRepute = 10, 		nRate = 8},
	{szName="50 danh väng",		 	nRepute = 50, 		nRate = 1},
	{szName="§Þnh Quèc ¤ Sa Ph¸t Qu¸n", 	tbProp={0, 160},	nQuality = 1,	nRate = 0.006},
	{szName="§Þnh Quèc Thanh Sa Tr­êng Sam", 	tbProp={0, 159},	nQuality = 1,	nRate = 0.02},
	{szName="§Þnh Quèc Ng©n Tµm Yªu ®¸i", 	tbProp={0, 163}, 	nQuality = 1,	nRate = 0.1},
	{szName="§Þnh Quèc XÝch Quyªn NhuyÔn Ngoa",	tbProp={0, 161}, 	nQuality = 1,	nRate = 0.04},
	{szName="§Þnh Quèc Tö §»ng Hé uyÓn", 	tbProp={0, 162}, 	nQuality = 1,	nRate = 0.1},
	{szName="An Bang B¨ng Tinh Th¹ch H¹ng Liªn",	tbProp={0, 164},	nQuality = 1,	nRate = 0.005},
	{szName="An Bang Kª HuyÕt Th¹ch Giíi ChØ ",	tbProp={0, 167},	nQuality = 1,	nRate = 0.015},
	{szName="An Bang Cóc Hoa Th¹ch ChØ hoµn",	tbProp={0, 165},	nQuality = 1,	nRate = 0.015},
	{szName="An Bang §iÒn Hoµng Th¹ch Ngäc Béi",	tbProp={0, 166},	nQuality = 1,	nRate = 0.02},
	{szName="§éng S¸t PhØ Thóy Ngäc H¹ng Khuyªn",	tbProp={0, 146},	nQuality = 1,	nRate = 0.007},
	{szName="§éng s¸t b¹ch kim tó phông giíi",	tbProp={0, 145},	nQuality = 1,	nRate = 0.007},
	{szName="§éng s¸t b¹ch kim ®iªu long giíi",	tbProp={0, 143},	nQuality = 1,	nRate = 0.007},
	{szName="§éng s¸t b¹ch ngäc cµn long béi",	tbProp={0, 144},	nQuality = 1,	nRate = 0.007},
	{szName="HuyÒn Tinh Kho¸ng Th¹ch cÊp 6",					tbProp={6, 1, 147, 6, 0, 0},	nRate = 1},
	{szName="HuyÒn Tinh Kho¸ng Th¹ch cÊp 7",					tbProp={6, 1, 147, 7, 0, 0},	nRate = 0.2},
	{szName="HuyÒn Tinh Kho¸ng Th¹ch cÊp 8",					tbProp={6, 1, 147, 8, 0, 0},	nRate = 0.05},
	{szName="TiÓu B¨ng Tinh",						tbProp={6, 1, 1850, 1, 0, 0},	nRate = 0.07,	nExpiredTime = 20090111},
	{szName="ThÇn bÝ kho¸ng th¹ch",						tbProp={6, 1, 398, 1, 0, 0},	nRate = 0.002},
	{szName="NÕn Tr¾ng",						tbProp={6, 1, 1851, 1, 0, 0},	nRate = 6,	nExpiredTime = 20090111},
	{szName="NÕn Xanh",						tbProp={6, 1, 1852, 1, 0, 0},	nRate = 3,	nExpiredTime = 20090111},
	{szName="M¶nh §¹i Nh·n ThÇn Chïy (1/9) /9)",	tbProp={4, 594, 1, 1, 0, 0},	nRate = 0.0015},
	{szName="M¶nh §¹i Nh·n ThÇn Chïy (3/9) /9)",	tbProp={4, 596, 1, 1, 0, 0},	nRate = 0.0015},
	{szName="M¶nh §¹i Nh·n ThÇn Chïy (5/9) /9)",	tbProp={4, 598, 1, 1, 0, 0},	nRate = 0.0015},
	{szName="M¶nh §¹i Nh·n ThÇn Chïy (6/9) /9)",	tbProp={4, 599, 1, 1, 0, 0},	nRate = 0.0015},
	{szName="M¶nh §¹i Nh·n ThÇn Chïy (8/9) /9)",	tbProp={4, 601, 1, 1, 0, 0},	nRate = 0.0015},
	{szName="M¶nh B¨ng hµn ®µn chØ phi ®ao (2/9)",		tbProp={4, 981, 1, 1, 0, 0},	nRate = 0.005},
	{szName="M¶nh B¨ng hµn ®µn chØ phi ®ao (3/9)",		tbProp={4, 982, 1, 1, 0, 0},	nRate = 0.005},
	{szName="M¶nh B¨ng hµn ®µn chØ phi ®ao (4/9)",		tbProp={4, 983, 1, 1, 0, 0},	nRate = 0.005},
	{szName="M¶nh B¨ng hµn ®µn chØ phi ®ao (7/9)",		tbProp={4, 986, 1, 1, 0, 0},	nRate = 0.005},
	{szName="M¶nh B¨ng hµn ®µn chØ phi ®ao (9/9)",		tbProp={4, 988, 1, 1, 0, 0},	nRate = 0.005},
	{szName="M¶nh Tø Kh«ng Gi¸ng Ma Giíi ®ao (1/9) /9)",		tbProp={4, 585, 1, 1, 0, 0},	nRate = 0.005},
	{szName="M¶nh Tø Kh«ng Gi¸ng Ma Giíi ®ao (4/9) /9)",		tbProp={4, 588, 1, 1, 0, 0},	nRate = 0.005},
	{szName="M¶nh Tø Kh«ng Gi¸ng Ma Giíi ®ao (6/9) /9)",		tbProp={4, 590, 1, 1, 0, 0},	nRate = 0.005},
	{szName="M¶nh Tø Kh«ng Gi¸ng Ma Giíi ®ao (8/9) /9)",		tbProp={4, 592, 1, 1, 0, 0},	nRate = 0.005},
	{szName="M¶nh Tø Kh«ng Gi¸ng Ma Giíi ®ao (9/9) /9)",		tbProp={4, 593, 1, 1, 0, 0},	nRate = 0.005},
	{szName="M¶nh U Minh Th­¬ng (2/9) /9)",	tbProp={4, 685, 1, 1, 0, 0},	nRate = 0.008},
	{szName="M¶nh U Minh Th­¬ng (3/9) /9)",	tbProp={4, 686, 1, 1, 0, 0},	nRate = 0.008},
	{szName="M¶nh U Minh Th­¬ng (5/9) /9)",	tbProp={4, 688, 1, 1, 0, 0},	nRate = 0.008},
	{szName="M¶nh U Minh Th­¬ng (6/9) /9)",	tbProp={4, 689, 1, 1, 0, 0},	nRate = 0.008},
	{szName="M¶nh U Minh Th­¬ng (9/9) /9)",	tbProp={4, 692, 1, 1, 0, 0},	nRate = 0.008},
	{szName="M¶nh Thiªn Niªn Hµn ThiÕt (3/9) /9)",		tbProp={4, 704, 1, 1, 0, 0},	nRate = 0.004},
	{szName="M¶nh Thiªn Niªn Hµn ThiÕt (4/9) /9)",		tbProp={4, 705, 1, 1, 0, 0},	nRate = 0.004},
	{szName="M¶nh Thiªn Niªn Hµn ThiÕt (5/9) /9)",		tbProp={4, 706, 1, 1, 0, 0},	nRate = 0.004},
	{szName="M¶nh Thiªn Niªn Hµn ThiÕt (7/9) /9)",		tbProp={4, 708, 1, 1, 0, 0},	nRate = 0.004},
	{szName="M¶nh Thiªn Niªn Hµn ThiÕt (9/9) /9)",		tbProp={4, 710, 1, 1, 0, 0},	nRate = 0.004},
	{szName="M¶nh TÈy T­îng Ngäc KhÊu (2/6) /6)",		tbProp={4, 802, 1, 1, 0, 0},	nRate = 0.005},
	{szName="M¶nh TÈy T­îng Ngäc KhÊu (4/6) /6)",		tbProp={4, 804, 1, 1, 0, 0},	nRate = 0.005},
	{szName="M¶nh TÈy T­îng Ngäc KhÊu (5/6) /6)",		tbProp={4, 805, 1, 1, 0, 0},	nRate = 0.005},
	{szName="M¶nh TÈy T­îng Ngäc KhÊu (6/6) /6)",		tbProp={4, 806, 1, 1, 0, 0},	nRate = 0.005},
	{szName="M¶nh Tª Hoµng Phông NghÜa §ao (1/9) /9)",		tbProp={4, 630, 1, 1, 0, 0},	nRate = 0.01},
	{szName="M¶nh Tª Hoµng Phông NghÜa §ao (3/9) /9)",		tbProp={4, 632, 1, 1, 0, 0},	nRate = 0.01},
	{szName="M¶nh Tª Hoµng Phông NghÜa §ao (4/9) /9)",		tbProp={4, 633, 1, 1, 0, 0},	nRate = 0.01},
	{szName="M¶nh Tª Hoµng Phông NghÜa §ao (6/9) /9)",		tbProp={4, 635, 1, 1, 0, 0},	nRate = 0.01},
	{szName="M¶nh U Lung Kim Xµ Ph¸t §¸i (2/6) /6)",		tbProp={4, 826, 1, 1, 0, 0},	nRate = 0.007},
	{szName="M¶nh U Lung Kim Xµ Ph¸t §¸i (3/6) /6)",		tbProp={4, 827, 1, 1, 0, 0},	nRate = 0.007},
	{szName="M¶nh U Lung Kim Xµ Ph¸t §¸i (4/6) /6)",		tbProp={4, 828, 1, 1, 0, 0},	nRate = 0.007},
	{szName="M¶nh U Lung Kim Xµ Ph¸t §¸i (6/6) /6)",		tbProp={4, 830, 1, 1, 0, 0},	nRate = 0.007},
	{szName="M¶nh §ång Cõu Kh¸ng Long Hé UyÓn (1/6) /6)",		tbProp={4, 855, 1, 1, 0, 0},	nRate = 0.003},
	{szName="M¶nh §ång Cõu Kh¸ng Long Hé UyÓn (2/6) /6)",		tbProp={4, 856, 1, 1, 0, 0},	nRate = 0.003},
	{szName="M¶nh §ång Cõu Kh¸ng Long Hé UyÓn (3/6) /6)",		tbProp={4, 857, 1, 1, 0, 0},	nRate = 0.003},
	{szName="M¶nh §ång Cõu Kh¸ng Long Hé UyÓn (5/6) /6)",		tbProp={4, 859, 1, 1, 0, 0},	nRate = 0.003},
	{szName="M¶nh Ngù Long Thiªn M«n Thóc Yªu Hoµn (1/6)",	tbProp={4, 1152, 1, 1, 0, 0},	nRate = 0.007},
	{szName="M¶nh Ngù long thiªn m«n thóc yªu hoµn (3/6)",	tbProp={4, 1154, 1, 1, 0, 0},	nRate = 0.007},
	{szName="M¶nh Ngù Long Thiªn M«n Thóc Yªu Hoµn (5/6)",	tbProp={4, 1156, 1, 1, 0, 0},	nRate = 0.007},
	{szName="M¶nh Ngù Long Thiªn M«n Thóc Yªu Hoµn (6/6)",	tbProp={4, 1157, 1, 1, 0, 0},	nRate = 0.007},
	{szName="M¶nh L¨ng Nh¹c V« Cùc HuyÒn Ngäc Béi (1/6) /6)",	tbProp={4, 879, 1, 1, 0, 0},	nRate = 0.003},
	{szName="M¶nh L¨ng Nh¹c V« Cùc HuyÒn Ngäc Béi (2/6) /6)",	tbProp={4, 880, 1, 1, 0, 0},	nRate = 0.003},
	{szName="M¶nh L¨ng Nh¹c V« Cùc HuyÒn Ngäc Béi (4/6) /6)",	tbProp={4, 882, 1, 1, 0, 0},	nRate = 0.003},
	{szName="LÖnh bµi vinh dù Hµn thiÕt", 				tbProp={6, 1, 1257, 1, 0, 0},	nRate = 10},
	{szName="LÖnh bµi vinh dù Thanh ®ång",				tbProp={6, 1, 1256, 1, 0, 0}, 	nRate = 1},
	{szName="LÖnh bµi vinh dù B¹ch Ng©n",				tbProp={6, 1, 1255, 1, 0, 0}, 	nRate = 1},
	{szName="LÖnh bµi vinh dù Hoµng Kim", 				tbProp={6, 1, 1254, 1, 0, 0}, 	nRate = 0.02},
	{szName="Vâ L©m MËt TÞch", 					tbProp={6, 1, 26, 1, 0, 0},	 	nRate = 0.1},
	{szName="TÈy Tñy Kinh", 						tbProp={6, 1, 22, 1, 0, 0}, 	nRate = 0.1},
	{szName="Bµn Nh­îc T©m Kinh", 					tbProp={6, 1, 12, 1, 0, 0}, 	nRate = 2},
	{szName="ThiÕt La H¸n", 						tbProp={6, 1, 23, 1, 0, 0}, 	nRate = 5},
	{szName="ThÇn bÝ §¹i Hång Bao", 					tbProp={6, 1, 402,1, 0, 0}, 	nRate = 3},

};

function main(nItemIndex)
	christmas_resettask();
	if GetItemParam(nItemIndex, 1) ~= 0 and GetItemParam(nItemIndex, 1) <= tonumber(GetLocalDate("%Y%m%d")) then
		Talk(1,"", "VËt phÈm nµy ®· hÕt h¹n")
		return 0
	end
	if (CalcFreeItemCellCount() < 20) then
		Say("Hµnh trang cña ®¹i hiÖp ®· ®Çy!", 0);
		return 1;
	end
	if (100 + GetTask(christmas_getexp_taskid) <= GetTask(christmas_bingjing_taskid))	then
		SetTask(christmas_getexp_taskid, 100 + GetTask(christmas_getexp_taskid));
		AddOwnExp(1000000);
		tbAwardTemplet:GiveAwardByList(tb_chocolate_award, "Ho¹t ®éng gi¸ng sinh 2008_B¸nh Kem Socola");
	else
		Say("§¹i hiÖp ®· ®Õn giíi h¹n kinh nghiÖm cao nhÊt, kh«ng thÓ tiÕp tôc sö dông b¸nh kem n÷a.", 0);
		return 1;
	end
end