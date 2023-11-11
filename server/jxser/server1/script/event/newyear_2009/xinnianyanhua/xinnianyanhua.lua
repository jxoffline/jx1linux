Include("\\script\\lib\\string.lua");
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\event\\newyear_2009\\taskctrl.lua");
Include("\\script\\lib\\gb_taskfuncs.lua")

yanhua_gbtask	= "newyear0901";

tb_yanhua_specialreward	=
{
	{szName	= "ThÇn bÝ kho¸ng th¹ch", 		tbProp = {6, 1, 398, 1, 0, 0}},
	{szName = "ThÇn bÝ kho¸ng th¹ch", 		tbProp = {6, 1, 398, 1, 0, 0}},
	{szName = "HuyÒn Tinh Kho¸ng Th¹ch cÊp 6", 	tbProp = {6, 1, 147, 6, 0, 0}},
	{szName = "HuyÒn Tinh Kho¸ng Th¹ch cÊp 6", 	tbProp = {6, 1, 147, 6, 0, 0}},
	{szName = "HuyÒn Tinh Kho¸ng Th¹ch cÊp 6", 	tbProp = {6, 1, 147, 6, 0, 0}},
	{szName = "HuyÒn Tinh Kho¸ng Th¹ch cÊp 6", 	tbProp = {6, 1, 147, 6, 0, 0}},
	{szName = "HuyÒn Tinh Kho¸ng Th¹ch cÊp 6", 	tbProp = {6, 1, 147, 6, 0, 0}},
	{szName = "HuyÒn Tinh Kho¸ng Th¹ch cÊp 6", 	tbProp = {6, 1, 147, 6, 0, 0}},
	{szName = "HuyÒn Tinh Kho¸ng Th¹ch cÊp 6", 	tbProp = {6, 1, 147, 6, 0, 0}},
	{szName = "HuyÒn Tinh Kho¸ng Th¹ch cÊp 6",	tbProp = {6, 1, 147, 6, 0, 0}},
	{szName = "HuyÒn Tinh Kho¸ng Th¹ch cÊp 6", 	tbProp = {6, 1, 147, 6, 0, 0}},
	{szName = "HuyÒn Tinh Kho¸ng Th¹ch cÊp 6", 	tbProp = {6, 1, 147, 6, 0, 0}},
	{szName = "HuyÒn Tinh Kho¸ng Th¹ch cÊp 7", 	tbProp = {6, 1, 147, 7, 0, 0}},
	{szName = "HuyÒn Tinh Kho¸ng Th¹ch cÊp 7", 	tbProp = {6, 1, 147, 7, 0, 0}},
	{szName = "HuyÒn Tinh Kho¸ng Th¹ch cÊp 7", 	tbProp = {6, 1, 147, 7, 0, 0}},
	{szName = "HuyÒn Tinh Kho¸ng Th¹ch cÊp 7", 	tbProp = {6, 1, 147, 7, 0, 0}},
	{szName = "HuyÒn Tinh Kho¸ng Th¹ch cÊp 7", 	tbProp = {6, 1, 147, 7, 0, 0}},
	{szName = "HuyÒn Tinh Kho¸ng Th¹ch cÊp 8", 	tbProp = {6, 1, 147, 8, 0, 0}},
	{szName = "HuyÒn Tinh Kho¸ng Th¹ch cÊp 8", 	tbProp = {6, 1, 147, 8, 0, 0}},
	{szName = "Vâ L©m MËt TÞch", 		tbProp = {6, 1, 26, 1, 0, 0}},
	{szName = "Vâ L©m MËt TÞch", 		tbProp = {6, 1, 26, 1, 0, 0}},
	{szName = "TÈy Tñy Kinh", 		tbProp = {6, 1, 22, 1, 0, 0}},
	{szName = "TÈy Tñy Kinh", 		tbProp = {6, 1, 22, 1, 0, 0}},
	{szName="An Bang B¨ng Tinh Th¹ch H¹ng Liªn",	nQuality=1,	tbProp={0, 164}},
	{szName="An Bang Kª HuyÕt Th¹ch Giíi ChØ ", nQuality=1, tbProp={0, 167}},
	{szName="An Bang Cóc Hoa Th¹ch ChØ hoµn", nQuality=1, tbProp={0, 165}},
	{szName="An Bang Cóc Hoa Th¹ch ChØ hoµn", nQuality=1, tbProp={0, 165}},
	{szName="Nhu T×nh C©n Quèc Nghª Th­êng", 	nQuality=1, tbProp={0, 190}},
	{szName="Tö Thñy Tinh", 			tbProp={4, 239, 1, 1, 0, 0}},
	{szName="Tö Thñy Tinh", 			tbProp={4, 239, 1, 1, 0, 0}},
	{szName="Tö Thñy Tinh", 			tbProp={4, 239, 1, 1, 0, 0}},
	{szName="Tö Thñy Tinh", 			tbProp={4, 239, 1, 1, 0, 0}},
	{szName="Tö Thñy Tinh", 			tbProp={4, 239, 1, 1, 0, 0}},
	{szName="Lam Thñy Tinh", 			tbProp={4, 238, 1, 1, 0, 0}},
	{szName="Lam Thñy Tinh", 			tbProp={4, 238, 1, 1, 0, 0}},
	{szName="Lam Thñy Tinh", 			tbProp={4, 238, 1, 1, 0, 0}},
	{szName="Lam Thñy Tinh", 			tbProp={4, 238, 1, 1, 0, 0}},
	{szName="Lam Thñy Tinh", 			tbProp={4, 238, 1, 1, 0, 0}},
	{szName="Lôc Thñy Tinh", 			tbProp={4, 240, 1, 1, 0, 0}},
	{szName="Lôc Thñy Tinh", 			tbProp={4, 240, 1, 1, 0, 0}},
	{szName="Lôc Thñy Tinh", 			tbProp={4, 240, 1, 1, 0, 0}},
	{szName="Lôc Thñy Tinh", 			tbProp={4, 240, 1, 1, 0, 0}},
	{szName="Lôc Thñy Tinh", 			tbProp={4, 240, 1, 1, 0, 0}},
	{nExp = 20000000},
	{nExp = 20000000},
	{nExp = 10000000},
	{nExp = 10000000},
	{nExp = 10000000},
	{nExp = 10000000},
	{nExp = 10000000},
	{nExp = 5000000},
	{nExp = 5000000},
	{nExp = 5000000},
	{nExp = 5000000},
	{nExp = 5000000},
	{nExp = 5000000},
	{nExp = 5000000},
	{nExp = 5000000},
	{nExp = 5000000},
	{nExp = 5000000},
};

tb_yanhua_randomaward	= tb_yanhua_specialreward;

function newyear0901_yanhua_dialogmain(nItemIndex, szDescLink)
	local n_dateD	= tonumber(GetLocalDate("%Y%m%d"));
	if (gb_GetTask(yanhua_gbtask, 1) ~= n_dateD) then
		gb_SetTask(yanhua_gbtask, 1, n_dateD);
		gb_SetTask(yanhua_gbtask, 2, 0);
		gb_SetTask(yanhua_gbtask, 3, 0);
		newyear0901_random_spaward();
	end
	
	nItemIndex = nItemIndex or -1
	szDescLink = szDescLink or "<npc>"
	local tbTalk = {"<dec>"..szDescLink.."Trong thêi gian ho¹t ®éng ng­êi ch¬i tÆng ta 1 Ph¸t Tµi Hång Bao th× sÏ cã thÓ nhËn ®­îc 1 Ph¸o Hoa ®ång thêi cã c¬ héi nhËn ®­îc phÇn quµ ®Æc biÖt. Chó ý: mçi ngµy chØ cã thÓ sö dông 1 Ph¸t Tµi Hång Bao, nh÷ng phÇn th­ëng ®Æc biÖt chØ  nhËn ®­îc sau 21:00.",
		"TÆng Ph¸t Tµi Hång Bao/newyear0901_give_facaihongbao",
		"NhËn phÇn th­ëng ®Æc biÖt/newyear0901_get_specialaward",
		"Ta chØ tiÖn ®­êng ®Õn ch¬i./OnCancel"};
	CreateTaskSay(tbTalk);
end

function newyear0901_give_facaihongbao()
	if (GetLevel() < 50 or GetExtPoint(0) < 1) then
		Say("§¹i hiÖp vÉn ch­a ®ñ cÊp 50 hoÆc vÉn ch­a nép thÎ, v× vËy kh«ng thÓ tham gia ho¹t ®éng", 0);
		return
	end
	
	local n_dateD = tonumber(GetLocalDate("%Y%m%d"));
	if (GetTask(newyear0901_TSK_GetYanhuaDate) == n_dateD) then
		Say("§¹i hiÖp h«m nay ®· nép Ph¸t Tµi Hång Bao vµ ®· nhËn qua Ph¸o Hoa Mõng Xu©n råi.", 0);
		return
	end
	
	local n_dateH	= tonumber(GetLocalDate("%H"));
	if (n_dateH >= 21) then
		Say("Thêi gian nhËn Ph¸o Hoa Mõng Xu©n cña h«m nay ®· qua råi, xin mêi ®îi ngµy mai.", 0);
		return
	end
	
	if (CalcFreeItemCellCount() < 1) then
		Say("Hµnh trang cña ®¹i hiÖp kh«ng ®ñ chç trèng!",0);
		return
	end
	
	local nCount = CalcItemCount(3, 6, 1, 1893, -1); -- ·µ»Ø gdpµÀ¾ßµÄ¸öÊý
	if (nCount <= 0) then
		Say("Trªn hµnh trang ®¹i hiÖp vÉn ch­a cã Ph¸t Tµi Hång Bao!", 0);
		return 
	end
	
	local bP = ConsumeItem(3, 1, 6, 1, 1893, -1); --  ·µ»Ø1¿Û³ý³É¹¦£¬·µ»Ø0Ê§°Ü£¬nCountÎªÖ¸¶¨¿Û³ýµÄÊýÁ¿ 
	if (bP <= 0) then
		print("Trõ Ph¸t Tµi Hång Bao thÊt b¹i!");
		return
	end
	
	local n_itemid = AddItem(6, 1, 1929, 1, 0, 0);
	ITEM_SetExpiredTime(n_itemid, 20090216);
	SyncItem(n_itemid);
	Say("Chóc mõng ®¹i hiÖp nhËn ®­îc 1 Ph¸o Hoa Mõng Xu©n.", 0);
	
	AddOwnExp(1000000);
	n_dateD	= tonumber(GetLocalDate("%Y%m%d"));
	SetTask(newyear0901_TSK_GetYanhuaDate, n_dateD);
	gb_SetTask(yanhua_gbtask, 2, gb_GetTask(yanhua_gbtask, 2) + 1);
end

function newyear0901_get_specialaward()
	local n_dateD	= tonumber(GetLocalDate("%Y%m%d"));
	local n_dateH	= tonumber(GetLocalDate("%H"));
	if (n_dateH < 21) then
		Say("B©y giê kh«ng ph¶i lµ thêi gian nhËn th­ëng, xin mêi h·y quay l¹i sau.", 0);
		return
	end
	
	if (GetTask(newyear0901_TSK_GetYanhuaDate) ~= n_dateD) then
		Say("H«m nay ®¹i hiÖp vÉn ch­a nép Ph¸t Tµi Hång Bao cho ta, nªn sÏ kh«ng cã c¬ héi nhËn th­ëng.", 0);
		return
	end
	
	if (GetTask(newyear0901_TSK_GetSpAwardDate)	== n_dateD)	then
		Say("§¹i hiÖp ®· tham dù lÜnh phÇn th­ëng ®Æc biÖt cña h«m nay råi.", 0);
		return
	end
	
	if (gb_GetTask(yanhua_gbtask, 3) >= 60) then
		Say("PhÇn quµ ®Æc biÖt h«m nay ®· ph¸t hÕt råi, xin mêi h·y chê ngµy mai.", 0);
		return
	end
	
	SetTask(newyear0901_TSK_GetSpAwardDate, n_dateD);
	local n_rd_value = random(gb_GetTask(yanhua_gbtask, 2));
	local tb_award = tb_yanhua_randomaward[gb_GetTask(yanhua_gbtask, 3) + 1];
	if (n_rd_value <= 60) then
		tbAwardTemplet:GiveAwardByList(tb_award, "newyear0901_yanhua_specialaward");
		gb_SetTask(yanhua_gbtask, 3, gb_GetTask(yanhua_gbtask, 3) + 1);
		if (tb_award.nExp) then
			Say(format("§¹i hiÖp thu ®­îc %d kinh nghiÖm.", tb_award.nExp));
		else
			Say(format("Chóc mõng ®¹i hiÖp nhËn ®­îc %s", tb_award.szName));
		end
	else
		Say("ThËt ®¸ng tiÕc, ®¹i hiÖp ®· kh«ng nhËn ®­îc phÇn th­ëng ®Æc biÖt cña ngµy h«m nay, h·y cè g¾ng thªm n÷a nhÐ!", 0);
	end
end

function newyear0901_random_spaward()
	local tb_award	= tb_yanhua_specialreward;
	local n_id1		= 0;
	local n_id2		= 0;
	local tb_tmp	= {};
	
	for i = 1, 100 do
		n_id1	= random(getn(tb_award));
		n_id2	= random(getn(tb_award));
		tb_tmp	= tb_award[n_id1];
		tb_award[n_id1] = tb_award[n_id2];
		tb_award[n_id2]	= tb_tmp;
	end
	
	tb_yanhua_randomaward	= tb_award;
end

function newyear0901_yanhua_IsActDate()
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nDate < 20090116 or nDate > 20090215) then
		return 0;
	else
		return 1;
	end
end