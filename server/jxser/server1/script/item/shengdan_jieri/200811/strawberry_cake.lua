Include("\\script\\lib\\awardtemplet.lua");
Include("\\script\\item\\shengdan_jieri\\200811\\head.lua");

tb_strawberry_award	=
{
	{szName="HuyÒn tinh kho¸ng th¹ch cÊp 3", 		tbProp={6, 1, 147, 3, 0, 0}, 	nRate = 3},
	{szName="HuyÒn Tinh Kho¸ng Th¹ch cÊp 4", 		tbProp={6, 1, 147, 4, 0, 0},	nRate = 2},
	{szName="HuyÒn Tinh Kho¸ng Th¹ch cÊp 5", 		tbProp={6, 1, 147, 5, 0, 0},	nRate = 0.8},
	{szName="LÖnh bµi vinh dù Hµn thiÕt", 	tbProp={6, 1, 1257, 1, 0, 0},	nRate = 5},
	{szName="LÖnh bµi vinh dù Thanh ®ång",	tbProp={6, 1, 1256, 1, 0, 0}, 	nRate = 2},
	{szName="LÖnh bµi vinh dù B¹ch Ng©n",	tbProp={6, 1, 1255, 1, 0, 0}, 	nRate = 0.8},
	{szName="LÖnh bµi vinh dù Hoµng Kim", 	tbProp={6, 1, 1254, 1, 0, 0}, 	nRate = 0.05},
	{szName="Vâ L©m MËt TÞch", 		tbProp={6, 1, 26, 1, 0, 0},	 	nRate = 0.05},
	{szName="TÈy Tñy Kinh", 			tbProp={6, 1, 22, 1, 0, 0}, 	nRate = 0.05},
	{szName="Bµn Nh­îc T©m Kinh", 		tbProp={6, 1, 12, 1, 0, 0}, 	nRate = 1},
	{szName="ThiÕt La H¸n", 			tbProp={6, 1, 23, 1, 0, 0}, 	nRate = 2},
	{szName="ThÇn bÝ §¹i Hång Bao", 		tbProp={6, 1, 402,1, 0, 0}, 	nRate = 6},
	{szName="§Þnh Quèc ¤ Sa Ph¸t Qu¸n", 	tbProp={0, 160},	nQuality = 1,	nRate = 0.006},
	{szName="§Þnh Quèc Thanh Sa Tr­êng Sam", 	tbProp={0, 159},	nQuality = 1,	nRate = 0.01},
	{szName="§Þnh Quèc Ng©n Tµm Yªu ®¸i", 	tbProp={0, 163}, 	nQuality = 1,	nRate = 0.1},
	{szName="§Þnh Quèc XÝch Quyªn NhuyÔn Ngoa",	tbProp={0, 161}, 	nQuality = 1,	nRate = 0.04},
	{szName="§Þnh Quèc Tö §»ng Hé uyÓn", 	tbProp={0, 162}, 	nQuality = 1,	nRate = 0.1},
	{szName="1 danh väng", 			nRepute = 1, 		nRate = 30},
	{szName="2 danh väng", 			nRepute = 2, 		nRate = 25},
	{szName="3 danh väng", 			nRepute = 3, 		nRate = 19},
	{szName="10 danh väng",			nRepute = 10, 		nRate = 2.494},
	{szName="50 danh väng",		 	nRepute = 50, 		nRate = 0.5},
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
	
	if (50 + GetTask(christmas_getexp_taskid) <= GetTask(christmas_bingjing_taskid))	then
		SetTask(christmas_getexp_taskid, 50 + GetTask(christmas_getexp_taskid));
		AddOwnExp(500000);
		tbAwardTemplet:GiveAwardByList(tb_strawberry_award, "Ho¹t ®éng gi¸ng sinh 2008_B¸nh Kem D©u");	
	else
		Say("§¹i hiÖp ®· thu ®­îc kinh nghiÖm cao nhÊt v× vËy kh«ng thÓ sö dông thªm kem d©u n÷a.", 0);
		return 1;
	end
end