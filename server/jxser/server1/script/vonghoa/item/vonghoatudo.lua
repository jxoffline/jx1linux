Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\vonghoa\\item\\head.lua")
--Include("\\script\\vonghoa\\item\\yanhua.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\functionlib.lua")

 tbAwardEXPTuDo=
 {
 	{nExp_tl=5000000, nRate = 80},
 	{nExp_tl=5500000, nRate = 15},
 	{nExp_tl=6000000, nRate = 5},
 };
  tbAwardItemTuDo=
  {
  	{szName = "HuyÒn Viªn LÖnh", tbProp = {6, 1, 2351, 1, 0, 0}, nCount = 1, nRate = 0.2},	
  	{szName = "Th­¬ng Lang LÖnh", tbProp = {6, 1, 2352, 1, 0, 0}, nCount = 1, nRate = 0.5},	
  	{szName = "V©n Léc LÖnh", tbProp = {6, 1, 2353, 1, 0, 0}, nCount = 1, nRate = 1},	
  	{szName = "Thanh C©u LÖnh", tbProp = {6, 1, 2369, 1, 0, 0}, nCount = 1, nRate = 1},	
  	{szName = "Hçn Nguyªn Linh Lé", tbProp = {6, 1, 2312, 1, 0, 0}, nCount = 1, nRate = 15},	
  	{szName = "HuyÒn Thiªn CÈm Nang", tbProp = {6, 1, 2355, 1, 0, 0}, nCount = 1, nRate = 10},	
  	{szName = "ThÇn N«ng Ch©n §¬n", tbProp = {6, 1, 2113, 1, 0, 0}, nCount = 1, nRate = 3},	
  	{szName = "NÕn B¸t Tr©n Phóc NguyÖt", tbProp = {6, 1, 1817, 1, 0, 0}, nCount = 1, nRate = 10},	
  	{szName = "Khiªu ChiÕn LÔ Bao", tbProp = {6, 1, 2006, 1, 0, 0}, nCount = 1, nRate = 7},	
  	{szName = "B¸ch Niªn Tr©n Lé", tbProp = {6, 1, 2266, 1, 0, 0}, nCount = 1, nRate = 12},	
  	{szName = "Long HuyÕt Hoµn", tbProp = {6, 1, 2117, 1, 0, 0}, nCount = 1, nRate = 2},	
  	{szName = "Thiªn Long LÖnh", tbProp = {6, 1, 2256, 1, 0, 0}, nCount = 1, nRate = 5},	
  	{szName = "B¹ch Cèt LÖnh", tbProp = {6, 1, 2255, 1, 0, 0}, nCount = 1, nRate = 2},	
  	{szName = "H¶i Long Ch©u", tbProp = {6, 1, 2115, 1, 0, 0}, nCount = 1, nRate = 3.3},	
  	{szName = "Tiªn Th¶o Lé (®Æc biÖt)", tbProp = {6, 1, 1181, 1, 0, 0}, nCount = 1, nRate =5 },	
  	{szName = "ThÝ LuyÖn ThiÕp", tbProp = {6, 1, 2317, 1, 0, 0}, nCount = 1, nRate = 5},	
  	{szName = "Qu¶ Huy Hoµng (cao cÊp)", tbProp = {6, 1, 906, 1, 0, 0}, nCount = 1, nRate = 10,nExpiredTime = 10080},	
  	{szName = "B¸ch Niªn Huy Hoµng qu¶", tbProp = {6, 1, 2269, 1, 0, 0}, nCount = 1, nRate = 5},	
  	{szName = "Thiªn Niªn Huy Hoµng qu¶", tbProp = {6, 1, 2270, 1, 0, 0}, nCount = 1, nRate = 2},	
  	{szName = "V¹n Niªn Huy Hoµng qu¶", tbProp = {6, 1, 2271, 1, 0, 0}, nCount = 1, nRate = 1},	
  };
   function tbRandom(tbAward)
 	local nRanVar =random(1,100);
	local num = 0; row = 0
	for row=1,getn(tbAward) do
		num = num + tbAward[row].nRate;
		if nRanVar <= num then
			return row
		end
	end
 end
 
function  main(nItemIndex)
	local nItemData	= tonumber(FormatTime2String("%Y%m%d%H%M",ITEM_GetExpiredTime(nItemIndex)));
	local nDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	
	
	if nDate > nItemData then
		Msg2Player("VËt phÈm qu¸ h¹n sö dông, tù ®éng mÊt ®i.")
		return 0;
	end
	if (GetTask(Task_IsCurUse_VongHoa) ~= 0) then
		Talk(1,"","B¹n ®ang sö dông vËt phÈm !")
		return 1
	end
	if (GetTask(Task_BeUse_VongHoa) >= nMaxEXP) then
		Talk(1,"","Sö dông vßng hoa ®¹t tèi ®a ®iÓm kinh nghiÖm !")
		return 1
	end
	if (GetLevel() < 50) then
		Talk(1,"","§¼ng cÊp nhá h¬n 50 kh«ng thÓ sö dông !")
		return 1
	end
	if CalcFreeItemCellCount() < 5 then
			Talk(1, "", "Hµnh trang kh«ng ®ñ 5 « trèng.");
			return 1
	end
	
	local nPlayerIndex = SearchPlayer(GetName())
	if(nPlayerIndex > 0)then
		local nValue = tbRandom(tbAwardEXPTuDo)
		if (nValue==nil) then
					nValue = 1
		end
		SetTask(Task_BeUse_VongHoa, GetTask(Task_BeUse_VongHoa) + tbAwardEXPTuDo[nValue].nExp_tl/10000)
		lib:DoFunByPlayer(nPlayerIndex, tbAwardTemplet.GiveAwardByList, tbAwardTemplet,tbAwardEXPTuDo[nValue] , "NhËn EXP sö dông vßng hoa tù do")
		lib:DoFunByPlayer(nPlayerIndex, tbAwardTemplet.GiveAwardByList, tbAwardTemplet,tbAwardItemTuDo , "nhËn th­ëng Item sö dông vßng hoa tù do")
	end
end