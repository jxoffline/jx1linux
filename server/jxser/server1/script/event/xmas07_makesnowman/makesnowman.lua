-- ÎÄ¼þÃû¡¡£ºmakesnowman.lua
-- ´´½¨Õß¡¡£ºzhongchaolong
-- ´´½¨Ê±¼ä£º2007-11-23 10:56:30

Include("\\script\\event\\xmas07_makesnowman\\head.lua")
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\lib\\basic.lua");
function main()
	xmas07_makeSnowMan_main()
end
function xmas07_makeSnowMan_main()
	if xmas07_makeSnowMan_isActPeriod() == 0 then
		Say(format("Ho¹t ®éng <color=yellow>%s<color> ®· kÕt thóc!",xmas07_makeSnowMan_ActName),0)
		return 0;
	end
	local tbDialog =
	{
		"<dec><npc>Ha ha, gi¸ng sinh vui vÎ!",
		"Ta muèn t×m hiÓu néi dung ho¹t ®éng/xmas07_makeSnowMan_Content",
		"Ta muèn t¹o ng­êi tuyÕt./xmas07_makeSnowMan_wantCompose",
		"KÕt thóc ®èi tho¹i/OnCancel",
	}

	CreateTaskSay(tbDialog)
end
function xmas07_makeSnowMan_Content()
	local tbDialog =
	{
		"<dec><npc>Tõ <color=red>0h00 ngµy 08-12-2007 ®Õn 24h00 ngµy 13-01-2008<color>, c¸c vâ l©m nh©n sü khi ®¸nh qu¸i sÏ cã c¬ héi nhÆt ®­îc <color=yellow>“Hép quµ gi¸ng sinh”<color>, më hép quµ gi¸ng sinh sÏ ngÉu nhiªn nhËn ®­îc nguyªn liÖu t¹o ng­êi tuyÕt. Sau khi thu thËp ®ñ nguyªn liÖu cã thÓ ®Õn ®©y ®Ó chÕ t¹o <color=yellow>Ng­êi TuyÕt <color> c¸c lo¹i.<enter>ë khu vùc bªn ngoµi thµnh, sö dông  “Hoµng TuyÕt Nh©n”, “Tö TuyÕt Nh©n” hoÆc “Lôc TuyÕt Nh©n” cã thÓ nhËn ®­îc <color=red>1000000 ®iÓm kinh nghiÖm<color> vµ 1 <color=red>vËt phÈm ngÉu nhiªn<color>, dÜ nhiªn nÕu may m¾n cã thÓ gäi ra <color=yellow>Boss TuyÕt Nh©n<color>, ®¸nh b¹i Boss TuyÕt Nh©n sÏ cã c¬ héi nhËn ®­îc phÇn th­ëng cã gi¸ trÞ.",
		"Ha ha, ta hiÓu råi/xmas07_makeSnowMan_main"
	}
	CreateTaskSay(tbDialog)
end
function xmas07_makeSnowMan_wantCompose()
	local tbDialog = 
	{
		"<dec><npc>C¸c vâ l©m nh©n sü khi ®¸nh qu¸i sÏ cã c¬ héi nhÆt ®­îc <color=yellow>B¨ng Tinh<color> hÖ kim, méc, thñy, háa, thæ. Sö dông c¸c lo¹i b¨ng tinh kh¸c nhau sÏ chÕ t¹o ®­îc Ng­êi TuyÕt kh¸c nhau, ®¹i hiÖp muèn lo¹i nµo?",
		"Ta muèn chÕ t¹o 'Hoµng TuyÕt Nh©n'/#xmas2007_makeSnowMan_compose([[Yellow]])",
		"Ta muèn chÕ t¹o 'Tö TuyÕt Nh©n'/#xmas2007_makeSnowMan_compose([[Purple]])",
		"Ta muèn chÕ t¹o 'Lôc TuyÕt Nh©n'/#xmas2007_makeSnowMan_compose([[Green]])",
		"Lóc kh¸c quay l¹i/OnCancel"
	}
	CreateTaskSay(tbDialog)
end
xmas2007_makeSnowMan_tbItem =
{
	{1, {6,1,1634,1,0,0}, "Hoµng TuyÕt Nh©n"},
	{1, {6,1,1635,1,0,0}, "Tö TuyÕt Nh©n"},
	{1, {6,1,1636,1,0,0}, "Lôc TuyÕt Nh©n"},
}
xmas2007_makeSnowMan_tbMaterial =
{
	{0, {6,1,1633,nil,nil,nil}, "Ngò S¾c B¨ng Tinh"},
	{0, {6,1,1628,nil,nil,nil}, "Kim B¨ng Tinh"},
	{0, {6,1,1629,nil,nil,nil}, "Méc B¨ng Tinh"},
	{0, {6,1,1630,nil,nil,nil}, "Thñy B¨ng Tinh"},
	{0, {6,1,1631,nil,nil,nil}, "Háa B¨ng Tinh"},
	{0, {6,1,1632,nil,nil,nil}, "Thæ B¨ng Tinh"},
}
xmas2007_makeSnowMan_Recipe =
{
	Yellow	= {tbItemList = {1,2,3,4,5,6}, nMoney = 0, tbResult = xmas2007_makeSnowMan_tbItem[1]},		--1ÎåÉ«±ù¾§ + 2 ½ð±ù¾§ + 3 Ä¾±ù¾§ + 4 Ë®±ù¾§ + 5 »ð±ù¾§ + 6 ÍÁ±ù¾§
	Purple	= {tbItemList = {0,2,3,4,5,6}, nMoney = 0, tbResult = xmas2007_makeSnowMan_tbItem[2]},		--0ÎåÉ«±ù¾§ + 2 ½ð±ù¾§ + 3 Ä¾±ù¾§ + 4 Ë®±ù¾§ + 5 »ð±ù¾§ + 6 ÍÁ±ù¾§
	Green	= {tbItemList = {0,2,3,4,5,6},nMoney = 100000, tbResult = xmas2007_makeSnowMan_tbItem[3]},	--10 ÍòÁ½ + 0ÎåÉ«±ù¾§ + 2 ½ð±ù¾§ + 3 Ä¾±ù¾§ + 4 Ë®±ù¾§ + 5 »ð±ù¾§ + 6 ÍÁ±ù¾§
}

function xmas2007_makeSnowMan_ComposeConfirm(szSelect)
	local tbMaterial = xmas2007_makeSnowMan_tbMaterial;
	local szMaterialList = nil;
	for i=1,getn(tbMaterial) do
		tbMaterial[i][1] = xmas2007_makeSnowMan_Recipe[szSelect].tbItemList[i];
		if tbMaterial[i][1] ~= 0 then
			if not szMaterialList then
				szMaterialList = format("<color=red>%d<color> <color=yellow>%s<color>",tbMaterial[i][1],tbMaterial[i][3])
			else
				szMaterialList = format("%s, <color=red>%d<color> <color=yellow>%s<color>",szMaterialList,tbMaterial[i][1],tbMaterial[i][3])
			end
		end
	end
	local tbAwardItem = xmas2007_makeSnowMan_Recipe[szSelect].tbResult
	local nMoney = xmas2007_makeSnowMan_Recipe[szSelect].nMoney;
	
	if xmas2007_makeSnowMan_CheckMaterial(tbMaterial) ~= 1 then
		Say(format("§¹i hiÖp kh«ng cã ®ñ nguyªn liÖu, cÇn ph¶i cã %s míi cã thÓ chÕ t¹o ®­îc.",szMaterialList), 1 , "ThËt ng¹i qu¸, ta sÏ quay l¹i sau./OnCancel")
		return 0;
	end
	if Pay(nMoney) == 0 then
		Say(format("Kh«ng ®­îc råi, kh«ng mang theo ®ñ tiÒn, cÇn cã <color=yellow>%d<color> l­îng",nMoney),0)
		return 0;
	end
	if nMoney ~= 0 then
		Msg2Player(format("Tiªu phÝ <color=yellow>%d<color> l­îng",nMoney))
	end
	if xmas2007_makeSnowMan_ConsumeMaterial(tbMaterial) ~= 1 then
		Say("ChÕ t¹o thÊt b¹i, mÊt ®i mét sè nguyªn liÖu.",0)
		return 0;
	end
	xmas2007_SnowManItem_AddItem(tbAwardItem[3],tbAwardItem[2]);
	Say(format("¤ng giµ TuyÕt: Ha ha, <color=yellow>%s<color> ®· chÕ t¹o thµnh c«ng, h·y nhËn lÊy!",tbAwardItem[3]))
end
function xmas2007_makeSnowMan_compose(szSelect)
	local tbMaterial = xmas2007_makeSnowMan_tbMaterial;
	local szMaterialList = nil;
	for i=1,getn(tbMaterial) do
		tbMaterial[i][1] = xmas2007_makeSnowMan_Recipe[szSelect].tbItemList[i];
		if tbMaterial[i][1] ~= 0 then
			if not szMaterialList then
				szMaterialList = format("<color=red>%d<color> <color=yellow>%s<color>",tbMaterial[i][1],tbMaterial[i][3])
			else
				szMaterialList = format("%s, <color=red>%d<color> <color=yellow>%s<color>",szMaterialList,tbMaterial[i][1],tbMaterial[i][3])
			end
		end
	end
	local tbAwardItem = xmas2007_makeSnowMan_Recipe[szSelect].tbResult
	local nMoney = xmas2007_makeSnowMan_Recipe[szSelect].nMoney;
	if nMoney ~= 0 then 
		szMaterialList = format("%s, cÇn ph¶i cã <color=yellow>%d<color> l­îng",szMaterialList,nMoney)
	end
	local tbNpcSay =
	{
		format("<dec><npc>ChÕ t¹o <color=yellow>%s<color>, cÇn cã: %s.",tbAwardItem[3],szMaterialList),
		format("ChÕ t¹o ng­êi TuyÕt/#xmas2007_makeSnowMan_ComposeConfirm([[%s]])",szSelect),
		"§Ó ta chuÈn bÞ ®·/OnCancel",
	}
	CreateTaskSay(tbNpcSay)
end

function xmas2007_makeSnowMan_CheckMaterial(tbMaterial)
	for i=1,getn(tbMaterial) do
		local tbItem =  tbMaterial[i]
		local nLevel = tbItem[2][4] or -1
		if tbItem[1] > 0 and CalcEquiproomItemCount(tbItem[2][1],tbItem[2][2],tbItem[2][3],nLevel) < tbItem[1] then
			return 0;
		end
	end
	return 1;
end

function xmas2007_makeSnowMan_ConsumeMaterial(tbMaterial)
	for i=1,getn(tbMaterial) do
		local tbItem =  tbMaterial[i]
		local nLevel = tbItem[2][4] or -1
		--print(tbItem[1],tbItem[2][1],tbItem[2][2],tbItem[2][3],nLevel)
		if tbItem[1] > 0 and ConsumeEquiproomItem(tbItem[1],tbItem[2][1],tbItem[2][2],tbItem[2][3],nLevel) ~= 1 then
			return 0;
		end
	end
	return 1;
end

function OnCancel()
end