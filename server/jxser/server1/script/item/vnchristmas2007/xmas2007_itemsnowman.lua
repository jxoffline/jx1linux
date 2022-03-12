-- ÎÄ¼þÃû¡¡£ºxmas2007_itemsnowman.lua
-- ´´½¨Õß¡¡£ºzhongchaolong
-- ´´½¨Ê±¼ä£º2007-12-01 16:05:50

IncludeLib("NPCINFO")
IncludeLib("TASKSYS")
Include("\\script\\global\\forbidmap.lua");
Include("\\script\\event\\xmas07_makesnowman\\head.lua")
Include("\\script\\lib\\pay.lua")

xmas2007_SnowManItem_forbitmap = {44, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219, 220, 221, 222, 223, 326, 327, 328, 329, 330, 331, 334, 335, 337, 338, 339, 344, 345, 346, 347, 348, 349, 350, 351, 352, 353, 354, 355, 356, 357, 358, 359, 360, 361, 362, 363, 364, 365, 366, 367, 368, 369, 370, 371, 372, 373, 374}

xmas2007_tbSnowManBoss = 
{
	--[ÎïÆ·PID] = {Ãû³Æ,bossID}
	[1634] = {szName = "Hoµng TuyÕt Nh©n", nBossId = 1329},
	[1635] = {szName = "Tö TuyÕt Nh©n", nBossId = 1330},
	[1636] = {szName = "Lôc TuyÕt Nh©n", nBossId = 1331},
}
xmas2007_SnowManItem_tbItemList = 
{
	--[ÎïÆ·PID] = {Ãû³Æ,ÎïÆ·prop£¬¸ÅÂÊ%}
	[1634] = {
		{"Tö Thñy Tinh",{4,238,1,1,0,0},6.00},
		{"Lôc Thñy Tinh",{4,239,1,1,0,0},5.00},
		{"Lam Thñy Tinh",{4,240,1,1,0,0},5.00},
		{"Tiªn Th¶o Lé ®Æc biÖt",{6,1,1181,1,0,0},5.00},
		{"Tiªn Th¶o Lé ",{6,1,71,1,0,0},10.00},
		{"Phóc Duyªn Lé (§¹i) ",{6,1,124,1,0,0},30.00},
		{"Tinh Hång B¶o Th¹ch",{4,353,1,1,0,0},5.60},
		{"An bang b¨ng tinh th¹ch h¹ng liªn",{0,164},0.01},
		{"An bang kª huyÕt th¹ch giíi chØ",{0,167},0.02},
		{"An bang cóc hoa th¹ch chØ hoµn",{0,165},0.02},
		{"An bang ®iÒn hoµng th¹ch ngäc béi",{0,166},0.05},
		{"§Þnh quèc « sa ph¸t qu¸n",{0,160},0.06},
		{"§Þnh quèc thanh sa tr­êng sam",{0,159},0.06},
		{"§Þnh quèc ng©n tµm yªu ®¸i",{0,163},0.06},
		{"§Þnh quèc xÝch quyªn nhuyÔn ngoa",{0,161},0.06},
		{"§Þnh quèc tö ®»ng hé uyÓn",{0,162},0.06},
		{"Hoa TuyÕt ",{6,0,1013,1,0,0},8.25},
		{"Quµ mµu Xanh",{6,0,1012,1,0,0},8.25},
		{"Hoa hång",{6,0,20,1,0,0},8.25},
		{"MÆt n¹ - TuÇn Léc",{0,11,405,1,0,0},0.60},
		{"MÆt n¹ - ¤ng Giµ N«el (Hång phÊn) ",{0,11,398,1,0,0},0.45},
		{"MÆt n¹ - ¤ng Giµ N«el (xanh) ",{0,11,397,1,0,0},0.45},
		{"MÆt n¹ - ¤ng Giµ N«el (tr¾ng) ",{0,11,399,1,0,0},0.45},
		{"MÆt n¹ - ¤ng Giµ N«el (vµng) ",{0,11,400,1,0,0},0.45},
		{"MÆt n¹ - ¤ng Giµ N«el (®á) ",{0,11,394,1,0,0},0.45},
		{"MÆt n¹ - Thiªn Sø Gi¸ng Sinh (®á) ",{0,11,395,1,0,0},0.45},
		{"MÆt n¹ - Thiªn Sø Gi¸ng Sinh (xanh) ",{0,11,401,1,0,0},0.45},
		{"MÆt n¹ - Thiªn Sø Gi¸ng Sinh (tr¾ng) ",{0,11,403,1,0,0},0.45},
		{"MÆt n¹ - Thiªn Sø Gi¸ng Sinh (vµng) ",{0,11,404,1,0,0},0.45},
		{"MÆt n¹ - Thiªn Sø Gi¸ng Sinh (Hång phÊn) ",{0,11,402,1,0,0},0.45},
		{"MÆt n¹ - Tinh Linh (®á) ",{0,11,423,1,0,0},0.45},
		{"MÆt n¹ - Tinh Linh (Lôc) ",{0,11,396,1,0,0},0.45},
		{"MÆt n¹ - Tinh Linh (vµng) ",{0,11,424,1,0,0},0.45},
		{"MÆt n¹ - Tinh Linh (tÝm) ",{0,11,422,1,0,0},0.45},
		{"MÆt n¹ Hoµng TuyÕt Nh©n",{0,11,425,1,0,0},0.45},
		{"MÆt n¹ Tö TuyÕt Nh©n",{0,11,426,1,0,0},0.45},
		{"MÆt n¹ Lôc TuyÕt Nh©n",{0,11,427,1,0,0},0.45},
	},
	[1636] =
	{
		{"Tiªn Th¶o Lé ®Æc biÖt",{6,1,1181,1,0,0},0.50},
		{"Tiªn Th¶o Lé ",{6,1,71,1,0,0},9.50},
		{"B¸ch Qu¶ Lé ",{6,1,73,1,0,0},10.00},
		{"Thiªn s¬n  B¶o Lé ",{6,1,72,1,0,0},10.00},
		{"Phóc Duyªn Lé (§¹i) ",{6,1,124,1,0,0},5.00},
		{"Phóc Duyªn Lé (Trung) ",{6,1,123,1,0,0},10.00},
		{"QuÕ Hoa Töu",{6,1,125,1,0,0},5.00},
		{"MÆt n¹ - TuÇn Léc",{0,11,405,1,0,0},12.50},
		{"Hoa TuyÕt ",{6,0,1013,1,0,0},12.50},
		{"Quµ mµu Xanh",{6,0,1012,1,0,0},8.25},
		{"Hoa hång",{6,0,20,1,0,0},12.50},
	}
}
function main(nItemIndex)
	local _, _, PID			= GetItemProp(nItemIndex);
	local szItemName		= GetItemName(nItemIndex);
	local tbSnowManBossInfo	= xmas2007_tbSnowManBoss[PID];
	local nCurExp			= GetTask(xmas2007_SnowManItem_TSK_ExpLimit);
	local nExp				= 1000000
	local nTotalRate		= 100000;
	local nRate				= floor(nTotalRate*5/100)
	if xmas07_makeSnowMan_isUsePeriod() == 0 then
		Msg2Player("VËt phÈm ®· qu¸ h¹n sö dông, sÏ bÞ mÊt ®i.")
		return 0
	end
	if xmas2007_SnowManItem_CheckForbitMap() == 1 then
		return 1
	end
	if IsCharged() == 0 or GetLevel() < 50 then
		Msg2Player("Ng­êi ch¬i cÊp 50 trë lªn ®· n¹p thÓ míi cã thÓ sö dông vËt phÈm nµy.")
		return 1;
	end
	if nCurExp >= xmas2007_SnowManItem_ExpMax then
		Msg2Player("Sö dông ng­êi TuyÕt ®· v­ît giíi h¹n ®iÓm kinh nghiÖm, kh«ng thÓ sö dông n÷a.")
		return 1;
	else
		AddOwnExp(nExp);
		SetTask(xmas2007_SnowManItem_TSK_ExpLimit,nCurExp+nExp);
	end
	
	
	WriteLog(format("[%s]\t%s\tName:%s\tAccount:%s\tUse a %s.",xmas07_makeSnowMan_ActName,
            GetLocalDate("%Y-%m-%d %H:%M"),GetName(), GetAccount(),szItemName ))
	if random(1,nTotalRate) <= nRate then
		local W,X,Y=GetWorldPos()
		local nSeries = random(0,4)
		AddNpcEx(tbSnowManBossInfo.nBossId, 90, nSeries, SubWorld, X*32, Y*32,1, tbSnowManBossInfo.szName, 2)
		
		WriteLog(format("[%s]\t%s\tName:%s\tAccount:%s\tcall a boss %s.",xmas07_makeSnowMan_ActName,
            GetLocalDate("%Y-%m-%d %H:%M"),GetName(), GetAccount(),szItemName ))
	end
	xmas2007_SnowManItem_GiveRandomItem(xmas2007_SnowManItem_tbItemList[PID])
	return 0;
end



function xmas2007_SnowManItem_CheckForbitMap()
	local W,X,Y=GetWorldPos()
	local nMapId = W;
	local i;
	if ( GetFightState() == 0 ) then	--·ÇÕ½¶·Çø½ûÓÃ
		Msg2Player("Kh«ng ë trong tr¹ng th¸i chiÕn ®Êu th× kh«ng thÓ sö dông");
		return 1
	end
	for i = 249, 318 do	--Ï´ËèµºÉ½¶´
		if ( i == nMapId ) then
			Msg2Player("N¬i ®©y kh«ng thÓ sö dông vËt phÈm nµy ");
			return 1
		end
	end	
	for i = 375, 415 do	--ÐÂÔöËÎ½ðÕ½³¡µØÍ¼ ËÍÐÅÈÎÎñµØÍ¼ ±ÈÎä´ó»áµØÍ¼
		if ( i == nMapId ) then
			Msg2Player("N¬i ®©y kh«ng thÓ sö dông vËt phÈm nµy ");
			return 1
		end
	end	

	for i = 1, getn( xmas2007_SnowManItem_forbitmap ) do		--ÌØÊâµØÍ¼½ûÓÃ
		if( xmas2007_SnowManItem_forbitmap[i] == nMapId ) then
			Msg2Player("N¬i ®©y kh«ng thÓ sö dông vËt phÈm nµy ");
			return 1
		end
	end
	
	if (CheckAllMaps(nMapId) == 1) then
		Msg2Player("TriÖu håi lÖnh bµi kh«ng thÓ sö dông t¹i khu vùc ®Æc thï nµy.");
		return 1
	end
	return 0		
end