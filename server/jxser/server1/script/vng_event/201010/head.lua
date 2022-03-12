Include("\\script\\lib\\composeex.lua")
Include("\\script\\global\\itemset.lua")
Include("\\script\\item\\class\\virtualitem.lua")
Include("\\script\\lib\\awardtemplet.lua")

Event201010 = {}

Event201010.END_DATE = 20101111

Event201010.tbBuyItem =
{
	["Lam B¨ng Tinh"] =  
		{
			tbFormula = 
			{
				szComposeTitle = format("Ho¹t ®éng th¸ng 10 \t§æi %s", "Lam B¨ng Tinh"),
				nWidth = 1,
				nHeight = 1,
				nFreeItemCellLimit = 1,
				tbMaterial = 
				{
					{szName = "HuyÒn Tinh Kho¸ng Th¹ch", tbProp = {6,1,147,4,0,0}, nCount = 1},
					{szName = "Lam Th¹ch", tbProp = {6,1,30056,1,0,0}, nCount = 1},
				},
				tbProduct = {szName = "Lam B¨ng Tinh", tbProp = {6,1,30059,1,0,0}, nExpiredTime = 20101118},
			},
			pCompos = nil;
		},
	
	["Hoµng B¨ng Tinh"] =  
		{
			tbFormula = 
			{
				szComposeTitle = format("Ho¹t ®éng th¸ng 10 \t§æi %s", "Hoµng B¨ng Tinh"),
				nWidth = 1,
				nHeight = 1,
				nFreeItemCellLimit = 1,
				tbMaterial = 
				{
					{szName = "HuyÒn Tinh Kho¸ng Th¹ch", tbProp = {6,1,147,3,0,0}, nCount = 1},
					{szName = "Lam Th¹ch", tbProp = {6,1,30057,1,0,0}, nCount = 1},
				},
				tbProduct = {szName = "Hoµng B¨ng Tinh", tbProp = {6,1,30060,1,0,0}, nExpiredTime = 20101118},
			},
			pCompos = nil;
		},	
		
	["Tö B¨ng Tinh"] =  
		{
			tbFormula = 
			{
				szComposeTitle = format("Ho¹t ®éng th¸ng 10 \t§æi %s", "Tö B¨ng Tinh"),
				nWidth = 1,
				nHeight = 1,
				nFreeItemCellLimit = 1,
				tbMaterial = 
				{
					{szName = "HuyÒn Tinh Kho¸ng Th¹ch", tbProp = {6,1,147,2,0,0}, nCount = 1},
					{szName = "Tö Th¹ch", tbProp = {6,1,30058,1,0,0}, nCount = 1},
				},
				tbProduct = {szName = "Tö B¨ng Tinh", tbProp = {6,1,30061,1,0,0}, nExpiredTime = 20101118},
			},
			pCompos = nil;
		},		
		
	["Hoµng Th¹ch"] =  
		{
			tbFormula = 
			{
				szComposeTitle = format("Ho¹t ®éng th¸ng 10 \tMua %s", "Hoµng Th¹ch"),
				nWidth = 1,
				nHeight = 1,
				nFreeItemCellLimit = 1,
				tbMaterial = {{nJxb = 5e4, nCount=1}},
				tbProduct = {szName = "Hoµng Th¹ch", tbProp = {6,1,30057,1,0,0}, nExpiredTime = 20101111},
			},
			pCompos = nil;
		},
}

function Event201010:IsActive()
	local now = tonumber(GetLocalDate("%Y%m%d"));
	if (now >= self.END_DATE) then
		return 0;
	end
	return 1;
end

function Event201010:ShowDialog()
	local now = tonumber(GetLocalDate("%Y%m%d"));
	local tbSay = {};
	tbSay[1] = "§¹i hiÖp mua g×?";
	if (now < self.END_DATE) then
		tinsert(tbSay, format("§æi [%s]/#Event201010:BuyItem('%s')","Lam B¨ng Tinh","Lam B¨ng Tinh"));
		tinsert(tbSay, format("§æi [%s]/#Event201010:BuyItem('%s')","Hoµng B¨ng Tinh","Hoµng B¨ng Tinh"));
		tinsert(tbSay, format("§æi [%s]/#Event201010:BuyItem('%s')","Tö B¨ng Tinh","Tö B¨ng Tinh"));
	end
	
	tinsert(tbSay, "Rêi khái/OnExit");
	CreateTaskSay(tbSay);
end

function Event201010:BuyHoangThach()
	local now = tonumber(GetLocalDate("%Y%m%d"));
	local tbSay = {};
	tbSay[1] = "§¹i hiÖp cÇn ®æi g×?!";
	if (now < self.END_DATE) then
		tinsert(tbSay, format("Mua [%s]/#Event201010:BuyItem('%s')","Hoµng Th¹ch","Hoµng Th¹ch"));
	end
	
	tinsert(tbSay, "Rêi khái/OnExit");
	CreateTaskSay(tbSay);
end

function Event201010:BuyItem(szItem)
	local tbItem = self.tbBuyItem[szItem];
	if (tbItem) then
		if (tbItem.pCompos == nil) then
			tbItem.pCompos = tbActivityCompose:new(tbItem.tbFormula, format("Mua [%s]", szItem));
		end
			tbItem.pCompos:ComposeDailog(1);
	end
end

 function Event201010:BuyLamThach()
 	if (Event201010:IsActive() ~= 1) then
 		Talk(1,"", "Ho¹t ®éng th¸ng 10 ®· kÕt thóc!")
 		return
 	end
 	AskClientForNumber("GetLamThach",1,50,"<#>NhËp sè l­îng cÇn mua")
 end
 
 function GetLamThach(nCount)
 	if CalcFreeItemCellCount() < 1 then
		Say("Kh«ng ®ñ 1 « trèng trong hµnh trang cña ®¹i hiÖp!",0)
		return
	end
	
 	local nSum = nCount * 50
 	if (GetEnergy() < nSum) then
 		Talk(1,"", "§¹i hiÖp kh«ng ®ñ tinh lùc, xin kiÓm tra l¹i")
 		return
 	end 
 	
 	ReduceEnergy(nSum)
	tbAwardTemplet:GiveAwardByList({tbProp={6,1,30056,1,0,0}, nExpiredTime=20101111, nCount = nCount} , "Event th¸ng 10 - Mua Lam Th¹ch");
 end