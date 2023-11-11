Include("\\script\\lib\\awardtemplet.lua")

tbItemAward = {
	{szName = "Tö M·ng LÖnh", tbProp = {6, 1, 2350, 1, 0, 0}, nRate = 0.01},	
	{szName = "HuyÒn Viªn LÖnh", tbProp = {6, 1, 2351, 1, 0, 0}, nRate = 0.05},	
	{szName = "Th­¬ng Lang LÖnh", tbProp = {6, 1, 2352, 1, 0, 0}, nRate = 1},	
	{szName = "V©n Léc LÖnh", tbProp = {6, 1, 2353, 1, 0, 0}, nRate = 3},	
	{szName = "Hçn Nguyªn Linh Lé", tbProp = {6, 1, 2312, 1, 0, 0}, nRate = 10},	
	{szName = "§¹i Lùc hoµn", tbProp = {6, 0, 3, 1, 0, 0}, nRate = 5},	
	{szName = "Phi Tèc hoµn", tbProp = {6, 0, 6, 1, 0, 0}, nRate = 5},	
	{szName = "Qu¶ Hoµng Kim", tbProp = {6, 1, 907, 1, 0, 0}, nRate = 10, nExpiredTime = 10080},	
	{szName = "Thiªn Niªn Huy Hoµng qu¶", tbProp = {6, 1, 2270, 1, 0, 0}, nRate = 20},	
	{szName = "V¹n Niªn Huy Hoµng qu¶", tbProp = {6, 1, 2271, 1, 0, 0}, nRate = 7.94},	
	{szName = "B¸ch Niªn Huy Hoµng qu¶", tbProp = {6, 1, 2269, 1, 0, 0}, nRate = 30},	
	{szName = "ThÇn bİ kho¸ng th¹ch", tbProp = {6, 1, 398, 1, 0, 0}, nRate = 1},	
	{szName = "HuyÒn Ch©n §¬n", tbProp = {6, 1, 1678, 1, 0, 0}, nRate = 5, tbParam={15e8}},	
	{szName = "Tö Kim Ch©n §¬n", tbProp = {6, 1, 2263, 1, 0, 0}, nRate = 2, tbParam={20e8}},	
}

tbExpAward = {szName = "§iÓm kinh nghiÖm", nExp_tl = 50000000}

TASK_USECOUNT = 2789
TASK_MONTH = 2790


function main(nItemIndex)
	local nMonth =tonumber(GetLocalDate("%m"))

	local n_item_date = tonumber(FormatTime2String("%Y%m%d%H%M",ITEM_GetExpiredTime(nItemIndex)));
	local n_cur_date = tonumber(GetLocalDate("%Y%m%d%H%M"));
	if n_cur_date > n_item_date then
		Msg2Player("VËt phÈm qu¸ h¹n sö dông, tù ®éng mÊt ®i.")
		return 0;
	end
	
	if CalcFreeItemCellCount() < 1 then
		Talk(1, "", "Hµnh trang §¹i hiÖp kh«ng ®ñ 1 « trèng!.");
		return 1
	end
	
	if (GetTask(TASK_MONTH) ~= nMonth) then
		SetTask(TASK_MONTH, nMonth)
		SetTask(TASK_USECOUNT, 0)
	end
	
	if (GetTask(TASK_USECOUNT) < 9) then
		SetTask(TASK_USECOUNT, GetTask(TASK_USECOUNT)+1)
		tbAwardTemplet:GiveAwardByList(tbExpAward , "NhËn th­ëng Hång Bao C©u L¹c Bé");
		tbAwardTemplet:GiveAwardByList(tbItemAward , "NhËn th­ëng Hång Bao C©u L¹c Bé");
		return 0
	else
		Msg2Player("VËt phÈm chØ cã thÓ sö dông tèi ®a 9 lÇn trong mét th¸ng!")
		return 1
	end
	
end