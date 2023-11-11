Include("\\script\\vng_event\\ngusackettinh\\head.lua")
Include("\\script\\vng_event\\ngusackettinh\\item\\crystal_head.lua")

tbNSKT_Crystal5Col = {}

function main(itemidx)
	--kiem tra dieu kien su dung vat pham
	if(tbNSKT_Crystal:checkCondition() == 0)then
		Talk(1, "", "B¹n kh«ng ®ñ ®iÒu kiÖn sö dông vËt phÈm! Yªu cÇu cÊp ®é trªn 50 vµ ®·  n¹p thÎ.")
		return 1
	end
	-- het event, vat pham het han su dung
	if (tbNSKT_Crystal:isExpired(itemidx) == 1) then
		Msg2Player("VËt phÈm qu¸ h¹n sö dông, tù ®éng mÊt ®i.")
		return 0; -- delete item
	end
	-- su dung vat pham thanh cong, xoa item
	local nResult, szErrorMessage = tbNSKT_Crystal5Col:UseItem()
	if (nResult == 1)then
		return 0;	
	else
		if( szErrorMessage ~= nil) then
			Talk(1, "", szErrorMessage)
			return 1 -- khong delete item	
		end
	end
end

--su dung item, gia tri tra ve:
function tbNSKT_Crystal5Col:UseItem()
	if (tbNSKT_Crystal:isMaxItemUse() == 1 ) then	
		return 0, "§¹i hiÖp ®·  ®¹t tèi ®a sö dông vËt phÈm nµy!"
	end
	if (tbNSKT_Crystal:checkBag(6) == 0)then
		return 0, "§Ó b¶o vÖ tµi s¶n, xin vui lßng chõa 6 « trèng trong hµnh trang råi míi sö dông vËt phÈm nµy!" --hanh trang khong du khoang trong, kh«ng xãa vËt phÈm
	end
			
	--Tao bang phan thuong kinh nghiem
	local tbExp = {
							{n_Exp =25e6, n_Rate = 40},
							{n_Exp =30e6, n_Rate = 45},
							{n_Exp =40e6, n_Rate = 12},
							{n_Exp =50e6, n_Rate = 2},
							{n_Exp =100e6, n_Rate = 1}	
						};							
	local nTaskValue = GetBitTask(tbNSKT_Crystal.nTaskID, tbNSKT_Crystal.nStartBit, tbNSKT_Crystal.nEndBit)
	local nTemp = (tbNSKT_Crystal.nMaxExp  - nTaskValue) * tbNSKT_Crystal.nScaleFactor
	--neu tbExp = nil, khong phat thuong, tra ve 1 de xoa vat pham
	if (not tbExp) then
		return 1;
	end
	-- khong cho kinh nghiem vuot qua gioi han 8 ti
	for i = 1, getn(tbExp) do
		if (nTemp < tbExp[i].n_Exp) then
			tbExp[i].n_Exp = nTemp
		end
	end		
	
	local tbAward = {}
	for i = 1, getn(tbExp) do
		tbAward[i] = 
			{
				[1] = {nExp = tbExp[i].n_Exp},					
				[2] = 
						{
							pFun = function (tbItem, nItemCount, szLogTitle)
								%tbNSKT_Crystal:addTask(%tbExp[%i].n_Exp)
							end
						},
				nRate = tbExp[i].n_Rate,
			}
	end
	--ket thuc tao bang phan thuong kinh nghiem		

	--Tao bang pham thuong vat pham
	local tbItemAward = 
	{
		{szName="HuyÒn Viªn LÖnh",tbProp={6,1,2351,1,0,0},nRate=2,nCount=1},
		{szName="B¹ch C©u Hoµn ®Æc biÖt",tbProp={6,1,1157,1,0,0},nRate=6,nCount=1},
		{szName="Thiªn tinh b¹ch c©u hoµn",tbProp={6,1,2183,1,0,0},nRate=8,nCount=1},
		{szName="Hçn Nguyªn Linh Lé",tbProp={6,1,2312,1,0,0},nRate=3,nCount=5},
		{szName="Phó Quý CÈm H¹p",tbProp={6,1,2402,1,0,0},nRate=5,nCount=5},
		{szName="V¹n Niªn Huy Hoµng qu¶",tbProp={6,1,2271,1,0,0},nRate=9.3,nCount=2},
		{szName="Ng©n l­îng",nJxb=5000000,nRate=10,nCount=1},
		{szName="Ng©n l­îng",nJxb=10000000,nRate=2,nCount=1},
		{szName="Ng©n l­îng",nJxb=20000000,nRate=1,nCount=1},
		{szName="Ng©n l­îng",nJxb=50000000,nRate=0.2,nCount=1},
		{szName="H¶i long ch©u",tbProp={6,1,2115,1,0,0},nRate=2,nCount=3},
		{szName="Long HuyÕt Hoµn",tbProp={6,1,2117,1,0,0},nRate=2,nCount=3},
		{szName="ThÇn Hµnh Phï",tbProp={6,1,1266,1,0,0},nRate=1.5,nCount=1,nExpiredTime=14400},
		{szName="CÈm nang thay ®æi trêi ®Êt",tbProp={6,1,1781,1,0,0},nRate=5,nCount=5,tbParam={60}},
		{szName="LÖnh Bµi TriÖu Håi",tbProp={6,1,30074,1,0,0},nRate=16,nCount=1,nExpiredTime=tbNSKT_head.nItemExpiredTime},
		{szName="Thiªn Long LÖnh",tbProp={6,1,2256,1,0,0},nRate=2,nCount=5},
		{szName="Tø H¶i Tiªu Diªu §¬n LÔ Hép",tbProp={6,1,2398,1,0,0},nRate=1,nCount=1},
		{szName="Ngò Ch©u L¨ng Kh«ng §¬n LÔ Hép",tbProp={6,1,2399,1,0,0},nRate=1,nCount=1},
		{szName="Cöu Thiªn V©n Du §¬n LÔ Hép",tbProp={6,1,2400,1,0,0},nRate=1,nCount=1},
		{szName="B¸ch niªn thÊt tinh th¶o",tbProp={6,1,1674,1,0,0},nRate=0.5,nCount=1},
		{szName="Thiªn niªn thÊt tinh th¶o",tbProp={6,1,1675,1,0,0},nRate=0.3,nCount=1},
		{szName="V¹n Niªn Ngò Th¸i Hoa",tbProp={6,1,2265,1,0,0},nRate=0.2,nCount=1},
		{szName="MÆt n¹ Nguyªn so¸i",tbProp={0,11,447,1,0,0},nRate=4,nCount=1},
		{szName="Thiªn S¬n TuyÕt Liªn",tbProp={6,1,1431,1,0,0},nRate=1,nCount=1},
		{szName="Tiªn Th¶o Lé ®Æc biÖt",tbProp={6,1,1181,1,0,0},nRate=4,nCount=2},
		{szName="§¹i lùc hoµn lÔ bao",tbProp={6,1,2517,1,0,0},nRate=5,nCount=5},
		{szName="Phi tèc hoµn lÔ bao",tbProp={6,1,2520,1,0,0},nRate=5,nCount=5},
		{szName="Qu¶ Hoµng Kim",tbProp={6,1,907,1,0,0},nRate=2,nCount=1,nExpiredTime=10080},
	}
	--ket thuc tao bang phan thuong vat pham	
	
	--vat pham thuong ngoi sao may man	
	local tbStarAward =
		{
			[1] = {szName="Ng«i Sao May M¾n",tbProp={6,1,30078,1,0,0},nCount=1,nExpiredTime=tbNSKT_head.nItemExpiredTime},
			nRate = 100
		}
		
	--tang thuong
	if (tbAward)then
		tbNSKT_Crystal:giveAward(tbAward, "PhÇn th­ëng EXP kÕt tinh ngò s¾c");	
	end
	if(tbStarAward)then
		tbNSKT_Crystal:giveAward(tbStarAward, "PhÇn th­ëng ng«i sao may m¾n kÕt tinh ngò s¾c");
	end		
	if (tbItemAward)then
		tbNSKT_Crystal:giveAward(tbItemAward, "PhÇn th­ëng kÕt tinh ngò s¾c");
	end
	return 1;		
end