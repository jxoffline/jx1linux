Include("\\script\\vng_event\\ngusackettinh\\head.lua")
Include("\\script\\vng_event\\ngusackettinh\\item\\crystal_head.lua")

tbNSKT_Crystal4Col = {}

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
	local nResult, szErrorMessage = tbNSKT_Crystal4Col:UseItem()
	if (nResult == 1)then
		return 0;	
	else
		if( szErrorMessage ~= nil) then
			Talk(1, "", szErrorMessage)
			return 1 -- khong delete item	
		end
	end
end

function tbNSKT_Crystal4Col:UseItem()
	if (tbNSKT_Crystal:isMaxItemUse() == 1 ) then	
		return 0, "§¹i hiÖp ®·  ®¹t tèi ®a sö dông vËt phÈm nµy!"
	end
	if (tbNSKT_Crystal:checkBag(1) == 0)then
		return 0, "§Ó b¶o vÖ tµi s¶n, xin vui lßng chõa 1 « trèng trong hµnh trang råi míi sö dông vËt phÈm nµy!" --hanh trang khong du khoang trong, kh«ng xãa vËt phÈm
	end	
	
	--Tao bang phan thuong kinh nghiem
	local tbExp = {
							{n_Exp =5e6, n_Rate = 20},
							{n_Exp =6e6, n_Rate = 65},
							{n_Exp =8e6, n_Rate = 12},
							{n_Exp =10e6, n_Rate = 2},
							{n_Exp =20e6, n_Rate = 1}	
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
		tbAward[i] = {
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
			{szName="M¹c B¾c TruyÒn Tèng LÖnh",tbProp={6,1,1448,1,0,0},nRate=2,nCount=1},
			{szName="Hçn Nguyªn Linh Lé",tbProp={6,1,2312,1,0,0},nRate=2,nCount=1},
			{szName="MÆt n¹ Nguyªn so¸i",tbProp={0,11,447,1,0,0},nRate=2,nCount=1},
			{szName="Phó Quý CÈm H¹p",tbProp={6,1,2402,1,0,0},nRate=12,nCount=1},
			{szName="Ng©n l­îng",nJxb=1000000,nRate=10,nCount=1},
			{szName="Ng©n l­îng",nJxb=2000000,nRate=2,nCount=1},
			{szName="Ng©n l­îng",nJxb=5000000,nRate=1,nCount=1},
			{szName="Ng©n l­îng",nJxb=10000000,nRate=0.2,nCount=1},
			{szName="§¹i lùc hoµn lÔ bao",tbProp={6,1,2517,1,0,0},nRate=3,nCount=1},
			{szName="Phi tèc hoµn lÔ bao",tbProp={6,1,2520,1,0,0},nRate=3,nCount=1},
			{szName="CÈm nang thay ®æi trêi ®Êt",tbProp={6,1,1781,1,0,0},nRate=3,nCount=1,tbParam={60}},
			{szName="Ngäc Qu¸n",tbProp={6,1,2311,1,0,0},nRate=4.3,nCount=1},
			{szName="Ng«i Sao May M¾n",tbProp={6,1,30078,1,0,0},nRate=24,nCount=1,nExpiredTime=tbNSKT_head.nItemExpiredTime},
			{szName="Thiªn Long LÖnh",tbProp={6,1,2256,1,0,0},nRate=4,nCount=1},
			{szName="H¶i long ch©u",tbProp={6,1,2115,1,0,0},nRate=1,nCount=1},
			{szName="Long HuyÕt Hoµn",tbProp={6,1,2117,1,0,0},nRate=1,nCount=1},
			{szName="B¸ch Niªn Tr©n Lé",tbProp={6,1,2266,1,0,0},nRate=4,nCount=1},
			{szName="Thiªn Niªn Tr©n Lé",tbProp={6,1,2267,1,0,0},nRate=3,nCount=1},
			{szName="V¹n Niªn Tr©n Lé",tbProp={6,1,2268,1,0,0},nRate=2,nCount=1},
			{szName="NÕn B¸t tr©n phóc nguyÖt",tbProp={6,1,1817,1,0,0},nRate=5,nCount=1},
			{szName="S¸t Thñ Gi¶n lÔ hép",tbProp={6,1,2339,1,0,0},nRate=2,nCount=1},
			{szName="ThÇn Hµnh Phï",tbProp={6,1,1266,1,0,0},nRate=0.3,nCount=1,nExpiredTime=14400},
			{szName="Thiªn S¬n TuyÕt Liªn",tbProp={6,1,1431,1,0,0},nRate=0.1,nCount=1},
			{szName="HuyÒn Viªn LÖnh",tbProp={6,1,2351,1,0,0},nRate=0.1,nCount=1},
			{szName="HuyÒn Thiªn CÈm Nang",tbProp={6,1,2355,1,0,0},nRate=3,nCount=1},
			{szName="Tiªn Th¶o Lé ®Æc biÖt",tbProp={6,1,1181,1,0,0},nRate=6,nCount=1},
		}
	--ket thuc tao bang phan thuong vat pham	
	if (tbAward) then
		tbNSKT_Crystal:giveAward(tbAward, "PhÇn th­ëng EXP kÕt tinh tø s¾c");
	end	
	if(tbItemAward)then
		tbNSKT_Crystal:giveAward(tbItemAward, "PhÇn th­ëng kÕt tinh tø s¾c");
	end
	return 1;	
end