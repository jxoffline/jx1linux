Include("\\script\\vng_event\\20110225_8_thang_3\\item\\item_head.lua")
tbVNGWD2011_GiftBox = {}
tbVNGWD2011_GiftBox.nTaskLimitUse = 2748
tbVNGWD2011_GiftBox.nMaxExp = 4e9	
function main(itemidx)
	if (tbVNGWD2011_ItemHead:isExpired(itemidx) == 1) then
		Msg2Player("VËt phÈm qu¸ h¹n sö dông, tù ®éng mÊt ®i.")
		return 0; -- delete item
	end
	local nResult, szErrorMessage = tbVNGWD2011_GiftBox:UseItem()
	if (nResult == 1)then
		return 0;	
	else
		if( szErrorMessage ~= nil) then
			Talk(1, "", szErrorMessage)
			return 1 -- khong delete item	
		end
	end		
end

function tbVNGWD2011_GiftBox:UseItem()
	if tbVNG_WomenDay2011:CheckCondition() ~= 1 then
		return 0, "B¹n kh«ng ®ñ ®iÒu kiÖn sö dông vËt phÈm! Yªu cÇu cÊp ®é trªn 150 vµ ®·  n¹p thÎ."
	end
	
	if tbVNGWD2011_ItemHead:checkBag(10) ~= 1 then
		return 0, "§Ó b¶o vÖ tµi s¶n, xin vui lßng chõa 10 « trèng trong hµnh trang råi míi sö dông vËt phÈm nµy!"
	end		
	local nTaskVal = GetTask(self.nTaskLimitUse)
	if nTaskVal >= (self.nMaxExp/1e6) then
		return 0, "§¹i hiÖp ®· sö dông tèi ®a vËt phÈm nµy, kh«ng thÓ sö dông thªm"
	end
	SetTask(self.nTaskLimitUse, nTaskVal + 10)	
	self:AddExtraAwardDialog()
	local tbExpAward =  {szName = "§iÓm Kinh NghiÖm", nExp=10000000}
	local tbItemAward = 
		{
			{szName="Cµn Kh«n Song TuyÖt Béi",tbProp={6,1,2219,1,0,0},nCount=1,nRate=0.08,nExpiredTime=43200},
			{szName="HuyÒn Viªn LÖnh",tbProp={6,1,2351,1,0,0},nCount=1,nRate=0.6},
			{szName="Qu¶ Hoµng Kim",tbProp={6,1,907,1,0,0},nCount=1,nRate=2,nExpiredTime=10080},
			{szName="Phi tèc hoµn lÔ bao",tbProp={6,1,2520,1,0,0},nCount=1,nRate=5},
			{szName="§¹i lùc hoµn lÔ bao",tbProp={6,1,2517,1,0,0},nCount=1,nRate=5},
			{szName="Håi thµnh phï (lín)",tbProp={6,1,1083,1,0,0},nCount=1,nRate=0.5},
			{szName="S¸t Thñ Gi¶n lÔ hép",tbProp={6,1,2339,1,0,0},nCount=1,nRate=4},
			{szName="Tèng Kim Chiªu Binh LÔ Bao",tbProp={6,1,30084,1,0,0},nCount=1,nRate=10,nExpiredTime=10080},
			{szName="M¹c B¾c TruyÒn Tèng LÖnh",tbProp={6,1,1448,1,0,0},nCount=1,nRate=4},
			{szName="H¶i long ch©u",tbProp={6,1,2115,1,0,0},nCount=1,nRate=2},
			{szName="HuyÒn Thiªn CÈm Nang",tbProp={6,1,2355,1,0,0},nCount=1,nRate=5},
			{szName="Tiªn Th¶o Lé ®Æc biÖt",tbProp={6,1,1181,1,0,0},nCount=1,nRate=5},
			{szName="Thiªn Niªn Tr©n Lé",tbProp={6,1,2267,1,0,0},nCount=1,nRate=4},
			{szName="V¹n Niªn Tr©n Lé",tbProp={6,1,2268,1,0,0},nCount=1,nRate=6.32},
			{szName="Ngò Hµnh Kú Th¹ch",tbProp={6,1,2125,1,0,0},nCount=1,nRate=20},
			{szName="B¾c §Èu truyÒn c«ng thuËt",tbProp={6,1,1672,1,0,0},nCount=1,nRate=1},
			{szName="Long HuyÕt Hoµn",tbProp={6,1,2117,1,0,0},nCount=1,nRate=2},
			{szName="Thiªn tinh b¹ch c©u hoµn",tbProp={6,1,2183,1,0,0},nCount=1,nRate=3},
			{szName="B¹ch C©u Hoµn ®Æc biÖt",tbProp={6,1,1157,1,0,0},nCount=1,nRate=5},
			{szName="CÈm nang thay ®æi trêi ®Êt",tbProp={6,1,1781,1,0,0},nCount=1,nRate=5,tbParam={60}},
			{szName="NhÊt Kû Cµn Kh«n Phï",tbProp={6,1,2126,1,0,0},nCount=1,nRate=0.5,nExpiredTime=43200},
			{szName="Ngäc Qu¸n",tbProp={6,1,2311,1,0,0},nCount=1,nRate=10},
		}
	if tbExpAward and tbItemAward then
		tbAwardTemplet:GiveAwardByList(tbExpAward, "[VNG][8thang3][PhÇn th­ëng Exp sö dông Hép Quµ 8 th¸ng 3]")
		tbAwardTemplet:GiveAwardByList(tbItemAward, "[VNG][8thang3][PhÇn th­ëng Item Sö dông Hép Quµ 8 th¸ng 3]")
	end
	return 1
end

function tbVNGWD2011_GiftBox:AddExtraAwardDialog()
	local nItemUsed = GetTask(self.nTaskLimitUse) / 10
	local tbTSK, tbTSK_FLAG = {}
	tbTSK = tbVNG_WomenDay2011.tbTaskList.TSK50GIFT
	tbTSK_FLAG = tbVNG_WomenDay2011.tbTaskList.TSK50GIFT_FLAG
	if (nItemUsed >= 100 and tbVNG_BitTask_Lib:getBitTask(tbTSK_FLAG) == 0) then
		tbVNG_BitTask_Lib:setBitTask(tbTSK, 1)		 
	end
	tbTSK = tbVNG_WomenDay2011.tbTaskList.TSK100GIFT
	tbTSK_FLAG = tbVNG_WomenDay2011.tbTaskList.TSK100GIFT_FLAG
	if (nItemUsed >= 200 and tbVNG_BitTask_Lib:getBitTask(tbTSK_FLAG) == 0) then
		tbVNG_BitTask_Lib:setBitTask(tbTSK, 1)		 
	end
	tbTSK = tbVNG_WomenDay2011.tbTaskList.TSK150GIFT
	tbTSK_FLAG = tbVNG_WomenDay2011.tbTaskList.TSK150GIFT_FLAG
	if (nItemUsed >= 300 and tbVNG_BitTask_Lib:getBitTask(tbTSK_FLAG) == 0) then
		tbVNG_BitTask_Lib:setBitTask(tbTSK, 1)		 
	end
	tbTSK = tbVNG_WomenDay2011.tbTaskList.TSK200GIFT
	tbTSK_FLAG = tbVNG_WomenDay2011.tbTaskList.TSK200GIFT_FLAG
	if (nItemUsed >= 400 and tbVNG_BitTask_Lib:getBitTask(tbTSK_FLAG) == 0) then
		tbVNG_BitTask_Lib:setBitTask(tbTSK, 1)		 
	end
end