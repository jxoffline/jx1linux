Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\EventThangLong1000\\head.lua")

tbFormulaList = 
{
	[1] =
	{
		tbMaterial = 
		{
			{szName="Long §Çu", tbProp={6, 1, 30045, 1}, nCount = 1},
			{szName="Long Th©n", tbProp={6, 1, 30046, 1}, nCount = 1},
			{szName="Long VÜ", tbProp={6, 1, 30047, 1}, nCount = 1},
			{szName="Th¨ng Thiªn LÖnh(TiÓu)", tbProp={6, 1, 30049, 1}, nCount = 1},
			
		},
		tbProduct =
		{
			{szName="TiÓu Thiªn Niªn Th¨ng Long",  tbProp={6, 1, 30052, 1, 0, 0}, nExpiredTime = 20101025,nCount = 1 },
		},	
	},
	[2] =
	{
		tbMaterial = 
		{
			{szName="Long §Çu", tbProp={6, 1, 30045, 1}, nCount = 1},
			{szName="Long Th©n", tbProp={6, 1, 30046, 1}, nCount = 1},
			{szName="Long VÜ", tbProp={6, 1, 30047, 1}, nCount = 1},
			{szName="Th¨ng Thiªn LÖnh(Trung)", tbProp={6, 1, 30050, 1}, nCount = 1},
		},
		tbProduct =
		{
			{szName="Trung Thiªn Niªn Th¨ng Long",  tbProp={6, 1, 30053, 1, 0, 0}, nExpiredTime = 20101025, nCount = 1},
		},	
	},
	[3] =
	{
		tbMaterial = 
		{
			{szName="Long §Çu", tbProp={6, 1, 30045, 1}, nCount = 1},
			{szName="Long Th©n", tbProp={6, 1, 30046, 1}, nCount = 1},
			{szName="Long VÜ", tbProp={6, 1, 30047, 1}, nCount = 1},
			{szName="Th¨ng Thiªn LÖnh(§¹i)", tbProp={6, 1, 30051, 1}, nCount = 1},
		},
		tbProduct =
		{
			{szName="§¹i Thiªn Niªn Th¨ng Long",  tbProp={6, 1, 30054, 1, 0, 0}, nExpiredTime = 20101025, nCount = 1},
		},	
	},
}


function Event1000_ExChangeItem_main()
	
	local tbOpp = {}
	local str = "<#> §¹i hiÖp muèn ®æi phÇn th­ëng nµo ?";
	tinsert(tbOpp,"TiÓu Thiªn Niªn Th¨ng Long/#SelectExChangeItem(1)");
	tinsert(tbOpp,"Trung Thiªn Niªn Th¨ng Long/#SelectExChangeItem(2)");
	tinsert(tbOpp,"§¹i Thiªn Niªn Th¨ng Long/#SelectExChangeItem(3)");
	tinsert(tbOpp, "<#>Tho¸t/OnCancel")
	if ( getn( tbOpp ) == 0 ) then
		Say(str, 0);
		return
	end;
	Say( str, getn( tbOpp ), tbOpp )
end

 function SelectExChangeItem(nSelect)
 	SetTask(Task_nSelect_Exchange, nSelect)
 	AskClientForNumber("DoExChangeItem",1,50,"<#>NhËp sè l­îng cÇn ®æi")
 	
 end


function DoExChangeItem(nCount)
	local nSelect = GetTask(Task_nSelect_Exchange)
	if (CheckMaterial(nSelect, nCount)~=1) then
		Talk(1, "", "Kh«ng ®ñ nguyªn liÖu ®æi vËt phÈm, xin ®¹i hiÖp kiÓm tra l¹i");
		return
	end
	if CalcFreeItemCellCount() < 5 then
		Talk(1, "", "Hµnh trang kh«ng ®ñ 5 « trèng.");
		return
	end
	ConsumeMaterial(nSelect, nCount)--trõ nguyªn liÖu trong hµnh trang ng­êi ch¬i
	AddItemExchange(nSelect, nCount)
end

function ConsumeMaterial(nSelect, nCount)
	local tbMaterial = tbFormulaList[nSelect].tbMaterial
	for i=1,getn(tbMaterial) do
		local tbItem = tbMaterial[i]
		local tbProp = tbItem.tbProp
		local numItem = tbItem.nCount * nCount
		if ConsumeEquiproomItem(numItem, tbProp[1], tbProp[2], tbProp[3], tbProp[4]) ~= 1 then
			WriteLog(date("%Y%m%d %H%M%S").."\t".."Event 1000 N¨m Th¨ng Long"..GetAccount().."\t"..GetName().."\t".."§æi vËt phÈm thÊt b¹i !")	
			return
		end
	end
end


function CheckMaterial(nSelect, nCount)
	local tbMaterial = tbFormulaList[nSelect].tbMaterial
	for i=1,getn(tbMaterial) do
		local tbItem = tbMaterial[i]
		local tbProp = tbItem.tbProp
		local numItem = tbItem.nCount * nCount
		local nCurCount = CalcEquiproomItemCount(tbProp[1], tbProp[2], tbProp[3], tbProp[4])
		if (nCurCount < numItem) then
			return 0
		end
	end
	return 1
end

function AddItemExchange(nSelect, nCount)
	local tbProduct = tbFormulaList[nSelect].tbProduct
	for i = 1, nCount do
		tbAwardTemplet:GiveAwardByList(tbProduct, "Event 1000 N¨m Th¨ng Long,GhÐp VËt PhÈm");
	end
end


function OnCancel()
end 