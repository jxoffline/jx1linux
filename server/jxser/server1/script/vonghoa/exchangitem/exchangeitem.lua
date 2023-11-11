Include("\\script\\task\\system\\task_string.lua");

tbFormulaList = 
{
	[1] =
	{
		tbMaterial = 
		{
			{szName="Hoa Cóc Vµng", tbProp={6, 1, 1064, 1}, nCount = 1},
			{szName="Hoa Cóc Tr¾ng", tbProp={6, 1, 1065, 1}, nCount = 1},
			{szName="Hoa Cóc TÝm", tbProp={6, 1, 1066, 1}, nCount = 1},
			
		},
		tbProduct =
		{
			{szName="Vßng Hoa Quèc Kh¸nh",  tbProp={6, 1, 30033, 1, 0, 0}, nExpiredTime = 20100920},
		},	
	},
	[2] =
	{
		tbMaterial = 
		{
			{szName="Hoa Cóc Vµng", tbProp={6, 1, 1064, 1}, nCount = 1},
			{szName="Hoa Cóc Tr¾ng", tbProp={6, 1, 1065, 1}, nCount = 1},
			{szName="Hoa Cóc TÝm", tbProp={6, 1, 1066, 1}, nCount = 1},
			{szName="Hoa Hång", tbProp={6, 1, 1438, 1}, nCount = 1},
		},
		tbProduct =
		{
			{szName="Vßng Hoa §éc LËp",  tbProp={6, 1, 30034, 1, 0, 0}, nExpiredTime = 20100920},
		},	
	},
	[3] =
	{
		tbMaterial = 
		{
			{szName="Hoa Cóc Vµng", tbProp={6, 1, 1064, 1}, nCount = 1},
			{szName="Hoa Cóc Tr¾ng", tbProp={6, 1, 1065, 1}, nCount = 1},
			{szName="Hoa Cóc TÝm", tbProp={6, 1, 1066, 1}, nCount = 1},
			{szName="Hoa Hång", tbProp={6, 1, 1438, 1}, nCount = 1},
		},
		tbProduct =
		{
			{szName="Vßng Hoa Tù Do",  tbProp={6, 1, 30035, 1, 0, 0}, nExpiredTime = 20100920},
		},	
	},
}


function ExChangeItem_main()
	
	local tbOpp = {}
	local str = "<#> §¹i hiÖp muèn ®æi phÇn th­ëng nµo ?";
	tinsert(tbOpp,"Ta muèn ®æi Vßng Hoa Quèc Kh¸nh(1 Hoa Cóc Vµng + 1 Hoa Cóc Tr¾ng + 1 Hoa Cóc TÝm + 2 V¹n)/#DoExChangeItem(1)");
	tinsert(tbOpp,"Ta muèn ®æi Vßng Hoa §éc LËp(1 Hoa Cóc Vµng + 1 Hoa Cóc Tr¾ng + 1 Hoa Cóc TÝm + 1 Hoa Hång §á)/#DoExChangeItem(2)");
	tinsert(tbOpp,"Ta muèn ®æi Vßng Hoa Tù Do((1 Hoa Cóc Vµng + 1 Hoa Cóc Tr¾ng + 1 Hoa Cóc TÝm + 1 Hoa Hång §á)/#DoExChangeItem(3)");
	tinsert(tbOpp, "<#>Tho¸t/OnCancel")
	if ( getn( tbOpp ) == 0 ) then
		Say(str, 0);
		return
	end;
	Say( str, getn( tbOpp ), tbOpp )
end



function DoExChangeItem(numIndexExchange)
	if (CheckMaterial(numIndexExchange)~=1) then
		Talk(1, "", "Kh«ng ®ñ nguyªn liÖu ®æi vËt phÈm, xin ®¹i hiÖp kiÓm tra l¹i");
		return
	end
	if CalcFreeItemCellCount() < 5 then
		Talk(1, "", "Hµnh trang kh«ng ®ñ 5 « trèng.");
		return
	end
	if (numIndexExchange == 1) then
		if (GetCash() < 20000 ) then
			Talk(1, "", "§æi Vßng Hoa Quèc Kh¸nh cÇn 2 v¹n l­îng !");
			return
		end
		if Pay(20000) ~= 1 then
			Msg2Player("Trõ ng©n l­îng thÊt b¹i !")
			return
		end
	end
	
	
	ConsumeMaterial(numIndexExchange)--trõ nguyªn liÖu trong hµnh trang ng­êi ch¬i
	AddItemExchange(numIndexExchange)
end

function ConsumeMaterial(numtbMaterial)
	local tbMaterial = tbFormulaList[numtbMaterial].tbMaterial
	for i=1,getn(tbMaterial) do
		local tbItem = tbMaterial[i]
		local tbProp = tbItem.tbProp
		local numItem = tbItem.nCount
		if ConsumeEquiproomItem(numItem, tbProp[1], tbProp[2], tbProp[3], tbProp[4]) ~= 1 then
			WriteLog(date("%Y%m%d %H%M%S").."\t".."§æi Vßng Hoa"..GetAccount().."\t"..GetName().."\t".."§æi vËt phÈm thÊt b¹i !")	
			return
		end
	end
end


function CheckMaterial(numtbMaterial)
	local tbMaterial = tbFormulaList[numtbMaterial].tbMaterial
	for i=1,getn(tbMaterial) do
		local tbItem = tbMaterial[i]
		local tbProp = tbItem.tbProp
		local numItem = tbItem.nCount
		local nCurCount = CalcEquiproomItemCount(tbProp[1], tbProp[2], tbProp[3], tbProp[4])
		if (nCurCount < numItem) then
			return 0
		end
	end
	return 1
end

function AddItemExchange(numtbMaterial)
	local tbProduct = tbFormulaList[numtbMaterial].tbProduct
	for i=1,getn(tbProduct) do
		local tbItem = tbProduct[i]
		local tbProp = tbItem.tbProp
		local nExpiredTime = tbItem.nExpiredTime
		local nIndex = AddItem(tbProp[1], tbProp[2], tbProp[3], tbProp[4],tbProp[5],tbProp[6])
		ITEM_SetExpiredTime(nIndex, 20100919);
		SyncItem(nIndex)
		local strItem = GetItemName(nIndex)
		Msg2Player("B¹n nhËn ®­îc "..strItem)
		WriteLog(date("%Y%m%d %H%M%S").."\t".."§æi Vßng Hoa"..GetAccount().."\t"..GetName().."\t".."§æi vËt phÈm  "..strItem)
	end
end


function OnCancel()
end 