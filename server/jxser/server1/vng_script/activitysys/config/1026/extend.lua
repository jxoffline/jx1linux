Include("\\vng_script\\activitysys\\config\\1026\\head.lua") --!!!!!
Include("\\vng_script\\activitysys\\config\\1026\\variables.lua")
Include("\\vng_script\\activitysys\\config\\1026\\awardlist.lua")
Include("\\vng_script\\activitysys\\config\\1026\\sale_item_event.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\activitysys\\functionlib.lua")
Include("\\vng_script\\vng_lib\\bittask_lib.lua")
Include("\\vng_script\\activitysys\\config\\1026\\write_award_daily.lua")
Include("\\script\\task\\system\\task_string.lua")
Include("\\script\\lib\\log.lua")

pActivity.nPak = curpack()

function pActivity:CheckSaleDate()
	--da mo ban vinh vien
	return 1
end

function pActivity:SaleDialog()
	--tam thoi chua ban trang bi quy hiem, khi nao ban thi mo lai
	do 
		return Talk(1,"","Ta ®ang truy t×m mét sè trang bÞ hoµng kim, nh­ng chØ ®­îc mét Ýt th«ng tin vÒ chóng...")
	end
	
	local szTitle = format("<color=green>\n\n- Ta míi s­u tÇm ®­îc mét sè trang bÞ hiÕm, ng­¬i cã muèn së h÷u kh«ng?<color>")
	local nNowDate = tonumber(GetLocalDate("%d"))

	local szEquipName = ""
	local nNeedMaterial = 0
	local nIDSale = 0
	for i=1, getn(TB_SALE_EQUIP_DATE) do
		for k,v in TB_SALE_EQUIP_DATE[i] do				
			if 	k == nNowDate then
				szEquipName = v.szName
				nNeedMaterial = v.nNeedMaterial
				nIDSale = i				
				break
			end
			print("SaleDialog i: "..i)
		end
	end
	if nNeedMaterial == 0 or  nIDSale == 0 then
		print("-----------SaleDialog Loi khong thay lich ban hang") 
		return
	end
	local szState = format("<color=cyan>(cßn hµng)<color>")
	if tbListSaleDaily:CheckCanSaleOutItem(nIDSale,nNowDate) == 0 then
		szState =format("<color=red>(hÕt hµng)<color>")
	end
	szTitle = szTitle..format(" \nNgµy h«m nay chç ta chØ cã: <color=yellow>\n	- %s %s <color> .\n\n- Muèn së h÷u trang bÞ nµy, ng­¬i cÇn ®­a cho ta  <color=yellow>%d<color> Ngäc Lôc B¶o.",szEquipName,szState,nNeedMaterial)
	local szNote = "\n<color=yellow>L­u ý<color>: <color=red>Ai ®ång ý trao ®æi víi ta tr­íc th× ng­êi ®ã së h÷u tr­íc<color>.\n\n\n"
	szTitle = szTitle..szNote 
	--12h den 12h30 moi xuat hien dong cho doi
	local nNowHour = tonumber(GetLocalDate("%H%M"))
	if nNowHour >= 1200 and nNowHour <= 1230 then
		CreateTaskSay({"<dec><npc>"..szTitle,format("Ta muèn së h÷u trang bÞ nµy/#pActivity:AcceptTradeEquip(%d,%d)",nIDSale,nNowDate),"§Ó ta suy nghÜ../Cancel"})
	else
		CreateTaskSay({"<dec><npc>"..szTitle, "§Õn giê ta sÏ quay l¹i./Cancel"})
	end
end

function pActivity:AcceptTradeEquip(nIDSale,nDate)
	local nNowDate = tonumber(GetLocalDate("%d"))
	if nDate ~= nNowDate then
		return Talk(1,"","§· qua ngµy b¸n trang bÞ ng­¬i xem, h«m nay ®· b¸n trang bÞ kh¸c råi, ng­¬i vui lßng xem l¹i.")
	end
	if tbListSaleDaily:CheckCanSaleOutItem(nIDSale,nNowDate) ~= 1 then
		return Talk(1,"","H«m nay thËt lµ ®¾t hµng! ta kh«ng cßn g× ®Ó trao ®æi, ngµy mai h·y quay l¹i nhÐ.")
	end
	if self:CheckSaleDate() ~= 1 then
		return
	end	
	if not TB_SALE_EQUIP_DATE[nIDSale][nNowDate] then
		print("-----------AcceptTradeEquip Loi khong thay lich ban hang")
		return
	end	
	
	local szEquipName = TB_SALE_EQUIP_DATE[nIDSale][nNowDate].szName
	local nNeedMaterial = TB_SALE_EQUIP_DATE[nIDSale][nNowDate].nNeedMaterial	
	local nTotalQuantity = TB_SALE_EQUIP_DATE[nIDSale][nNowDate].nQuantity	
	local nCurMaterial = GetTask(%TASK_SAVE_SL_NGOCLUCBAO)
	
	local nLastNum = tbListSaleDaily.tbAwardCheck[nIDSale]
	if nLastNum < 0 or nLastNum > nTotalQuantity then
		--print("AcceptTradeEquip nLastNum"..nLastNum)
		--print("AcceptTradeEquip nTotalQuantity"..nTotalQuantity)
		tbLog:PlayerActionLog("AcceptTradeEquip - Loi tong so luong ban ra vuot qua qui dinh: "..nLastNum)
		return Talk(1,"","Cã lçi x¶y ra, xin vui lßng liªn hÖ víi Ban ®iÒu hµnh.")
	end
	if nCurMaterial < nNeedMaterial then 
		return Talk(1,"","HiÖn t¹i ta ch­a nhËn ®ñ sè Ngäc Lôc B¶o cÇn ®Ó ®æi trang bÞ nµy, h·y nép ®ñ cho ta tr­íc.")
	end
		
	if PlayerFunLib:CheckFreeBagCellWH(2,3,1,"default") ~= 1 then
		return
	end
	--trõ sè l­îng Ngäc lôc b¶o trong khè
	SetTask(%TASK_SAVE_SL_NGOCLUCBAO,nCurMaterial - nNeedMaterial)
	-- ghi sè l­îng ®· b¸n vµo file
	tbListSaleDaily:SaleOutItem(nIDSale,nDate,1)
	
	tbAwardTemplet:Give(TB_SALE_EQUIP_DATE[nIDSale][nNowDate], 1, {EVENT_LOG_TITLE,"DoiThanhCong"})
	local szNew = format("§¹i hiÖp <color=yellow>%s<color> ®· së h÷u ®­îc <color=yellow>%s<color>. ThËt ®¸ng ng­ìng mé, c¸c anh hïng thiªn h¹ còng thªm phÇn kÝnh phôc...",GetName(),szEquipName)
	AddGlobalNews(szNew)
	AddGlobalNews(szNew)
	Talk(1,"",format(" Chóc mõng ®¹i hiÖp ®æi thµnh c«ng <color=yellow>%s<color>.\n HiÖn t¹i cßn %d Ngäc lôc b¶o göi ë ThÈm V¹n Tam",szEquipName,nCurMaterial - nNeedMaterial))
	return 1
end

--Ky gui NLB tai NPC
function pActivity:CheckSaving_Item()
	local tbProp = %ITEM_NGOCLUCBAO.tbProp
	local nCurCount = CalcEquiproomItemCount(tbProp[1], tbProp[2], tbProp[3], tbProp[4])
	if nCurCount <= 0  then		
		 return 0
	end
	return nCurCount
end
function pActivity:Add_Num_Saving_Item()
	local nMaxCount  = self:CheckSaving_Item()
	if nMaxCount <= 0 then
		Talk(1,"","Trong ng­êi ng­¬i lµm g× cã Ngäc Lôc B¶o mµ ®ßi ký göi ë ta.")
		return
	end
	if not nMaxCount or nMaxCount > 500 then
		nMaxCount = 500
	end
	g_AskClientNumberEx(1, nMaxCount, "NhËp sè l­îng göi", {self.Saving_Item_NgocLucBao, {self,nCount}} )
end
function pActivity:Saving_Item_NgocLucBao(nCount)		
	if (nCount == 0 or nCount == nil ) then
		nCount = 1
	end
	if nCount > 500   then
		return Talk(1,"","Göi tèi ®a 500 c¸i 1 lÇn th«i.")
	end
	local nCountInBag  = self:CheckSaving_Item()
	if nCount > nCountInBag then
		return Talk(1,"","Còng cã thÓ gäi ta lµ th­¬ng bu«n, nh­ng ta kh«ng bao giê lµ gian th­¬ng. Ng­¬i kh«ng qua m¾t ta ®­îc ®©u ...")
	end
	local nCurPoint = GetTask(%TASK_SAVE_SL_NGOCLUCBAO)
	local nTotal = nCurPoint + nCount
	if nCurPoint < 0 or nTotal > 2*1000*1e6 then
		 return Talk(1,"","Kho cña ta chØ chøa cã giíi h¹n, c¸c h¹ th«ng c¶m.")
	end
	
	local tbProp = %ITEM_NGOCLUCBAO.tbProp
	if ConsumeEquiproomItem(nCount, tbProp[1], tbProp[2], tbProp[3], tbProp[4]) ~= 1 then
			tbLog:PlayerActionLog("Error Gui NLB - Loi tru khong duoc item sl: "..nCount)
			return
	end
	Talk(1,"",format("C¸c h¹ ®· göi thµnh c«ng <color=yellow>%d<color> Ngäc Lôc B¶o",nCount))
	tbLog:PlayerActionLog(EVENT_LOG_TITLE,"[Gui: ]".."so luong NLB hien tai: "..nCurPoint.."- So luong nop vao: "..nCount)
	SetTask(%TASK_SAVE_SL_NGOCLUCBAO,nTotal)	
	return 1
end

--Rut Ngoc Luc Bao
function pActivity:CheckWithdraw_Item()
	if PlayerFunLib:CheckFreeBagCell(5,"CÇn Ph¶i cã 5 ¤ trèng hµnh trang") ~= 1 then
		return
	end
	local nValue = ONE_WITHDRAW 
	local nCurPoint = GetTask(%TASK_SAVE_SL_NGOCLUCBAO)
	if  nCurPoint <= TAX then
		 return Talk(1,"","C¸c h¹ göi kh«ng ®ñ sè l­îng ®Ó rót. Tèi thiÓu 1 lÇn rót trong kho ph¶i cã 6 c¸i Ngäc Lôc B¶o.")
	elseif nCurPoint < ONE_WITHDRAW + TAX then 
		nValue =  nCurPoint -TAX
	end
		
	SetTask(%TASK_SAVE_SL_NGOCLUCBAO,nCurPoint - (nValue + TAX) )
	tbAwardTemplet:Give(ITEM_NGOCLUCBAO, nValue, {EVENT_LOG_TITLE,format("RutThanhCong %d NLB",nValue)})
	tbLog:PlayerActionLog(EVENT_LOG_TITLE,"[Rut: ]".."So NLB hien tai:"..nCurPoint.."- So luong NLB bi tru + thue: ".. (nValue + TAX))
	Talk(1,"",format("C¸c h¹ ®· rót thµnh c«ng <color=yellow>%d<color> Ngäc Lôc B¶o",nValue)	)
end

--Xem lich danh sach ban hang
function pActivity:ShowPlanSale()
	local szTitle = format("<color=green>\n\n- Ta míi s­u tÇm ®­îc mét sè trang bÞ hiÕm, nh­ng mét sè thø ta ch­a cÇm trong tay, dù kiÕn sÏ cã:<color>\n")	
	if not TB_SALE_EQUIP_DATE_DIALOG then
		print("-----------ShowPlanSale Loi khong thay lich ban hang")
		return
	end	
	for i=1,getn(TB_SALE_EQUIP_DATE_DIALOG) do
		local tbInfo = TB_SALE_EQUIP_DATE_DIALOG[i]
		local szDate = tbInfo.nDateSale
		local szEquipName = tbInfo.szName
		local nNeedMaterial = tbInfo.nNeedMaterial	
		szTitle = szTitle..format(" \nNgµy: %s: <color=yellow>%s<color>\n\t\t\t\t\t\t\t\t\t\t\t\t\tCÇn: <color=yellow>%d<color> Ngäc Lôc B¶o.",szDate,szEquipName,nNeedMaterial)
	end	
	CreateTaskSay({"<dec><npc>"..szTitle,"Ta biÕt råi/Cancel"})
end

---------
function pActivity:SaleItemDailyDialog(nStartIndex)

	local nSize = 5
	local tb1 = TB_SALE_EQUIP_DAILY
	if nStartIndex < 1 or nStartIndex > getn(tb1) then
		return
	end
	local tb2
	local nEndIndex
	local tbOpt = {}
	if nStartIndex +nSize > getn(tb1) then
		nEndIndex = getn(tb1)
	else
		nEndIndex = nStartIndex + nSize
	end
	for i = nStartIndex, nEndIndex do
		tb2 = tb1[i]
		local szEquipName =tb2.szName 
		tinsert(tbOpt , format("%s/#pActivity:AcceptTradeItem(%d)",szEquipName, i))
	end
	if nEndIndex < getn(tb1) then	
		tinsert(tbOpt, format("Trang kÕ/#pActivity:SaleItemDailyDialog(%d)", nEndIndex + 1))
	end
	if nStartIndex > 1 then
		tinsert(tbOpt, format("Trë l¹i/#pActivity:SaleItemDailyDialog(%d)",  nStartIndex - nSize))
	end
	
	tinsert(tbOpt, {"KÕt thóc ®èi tho¹i"})
	Describe("Ng­¬i muèn së h÷u mãn nµo?", getn(tbOpt), tbOpt)
end

function pActivity:AcceptTradeItem(nIDSale)
	
	if tbListSaleDaily:CheckCanSaleOutItem_Daily(nIDSale) == 0 then
		return Talk(1,"","§ît nµy thËt lµ ®¾t hµng! ta kh«ng cßn g× ®Ó trao ®æi n÷a, hÑn gÆp l¹i c¸c h¹ lÇn sau.")
	end
	if self:CheckSaleDate() ~= 1 then
		return
	end
	if not TB_SALE_EQUIP_DAILY[nIDSale] then
		print("-----------Loi khong thay lich ban hang")
		return
	end	
		
	local szItemName = TB_SALE_EQUIP_DAILY[nIDSale].szName
	local nNeedMaterial = TB_SALE_EQUIP_DAILY[nIDSale].nNeedMaterial	
	local nTotalQuantity =TB_SALE_EQUIP_DAILY[nIDSale].nQuantity	
	local nCurMaterial = GetTask(%TASK_SAVE_SL_NGOCLUCBAO)
	local nLastNum = tbListSaleDaily.tbAwardCheck_SaleDaily[nIDSale]
	if nLastNum < 0 or nLastNum > nTotalQuantity then
		tbLog:PlayerActionLog("AcceptTradeItem - Loi tong so luong ban ra vuot qua qui dinh: "..nLastNum)
		return Talk(1,"","Cã lçi x¶y ra, xin vui lßng liªn hÖ víi Ban ®iÒu hµnh.")
	end
	if nCurMaterial < nNeedMaterial then 
		return Talk(1,"","HiÖn t¹i ta ch­a nhËn ®ñ sè Ngäc Lôc B¶o cÇn ®Ó ®æi vËt phÈm nµy, h·y nép ®ñ cho ta tr­íc.")
	end
		
	if PlayerFunLib:CheckFreeBagCellWH(2,3,1,"default") ~= 1 then
		return
	end
	if nIDSale == TRADE_EXP_ID then 
		self:CheckResetMonthlyExp() 
	end
	--kiem tra gioi han doi 500 lan exp	
	if (nIDSale == TRADE_EXP_ID) and  (tbVNG_BitTask_Lib:getBitTask(BITTASK_MAX_CHANGE_EXP) >= MAX_CHANGE_EXP) then
		Talk(1,"",format("Mét th¸ng ®æi ®iÓm kinh nghiÖm tèi ®a <color=yellow>%d<color> lÇn.",MAX_CHANGE_EXP))
		return
	end	
	-- ghi sè l­îng ®· b¸n vµo file
	if not tbListSaleDaily:SaleOutItem_Daily(nIDSale,1) then
		tbLog:PlayerActionLog(EVENT_LOG_TITLE,"[Mua: ]".."Item ID: "..nIDSale.." GhiFileThatBai ")	
		return
	end
	--trõ sè l­îng Ngäc lôc b¶o trong khè
	SetTask(%TASK_SAVE_SL_NGOCLUCBAO,nCurMaterial - nNeedMaterial)
	tbLog:PlayerActionLog(EVENT_LOG_TITLE,"[Mua: ]".."So NLB hien tai:"..nCurMaterial.."- So luong NLB bi tru: "..nNeedMaterial)
	--Luu so lan doi exp
	if nIDSale == TRADE_EXP_ID then 
		tbVNG_BitTask_Lib:addTask(BITTASK_MAX_CHANGE_EXP, 1)
	end
	
	tbAwardTemplet:Give(TB_SALE_EQUIP_DAILY[nIDSale], 1, {EVENT_LOG_TITLE,"DoiThanhCong"})	
	Talk(1,"",format(" Chóc mõng ®¹i hiÖp ®æi thµnh c«ng <color=yellow>%s<color>.\n HiÖn t¹i cßn %d Ngäc lôc b¶o göi ë ThÈm V¹n Tam",szItemName,nCurMaterial - nNeedMaterial))
	Msg2Player(format(" Chóc mõng ®¹i hiÖp ®æi thµnh c«ng <color=yellow>%s<color>",szItemName))
	return 1
end
--Check dk reset theo thang solan mua exp
function pActivity:CheckResetMonthlyExp() 
	local nCur_Month = tonumber(GetLocalDate("%m"))
	local nLastMonth = tbVNG_BitTask_Lib:getBitTask(BITTASK_SAVE_CUR_MONTH)
	if nCur_Month ~= nLastMonth then
		tbVNG_BitTask_Lib:setBitTask(BITTASK_SAVE_CUR_MONTH, nCur_Month)	
		--reset sè lÇn ®æi exp h»ng th¸ng
		tbVNG_BitTask_Lib:setBitTask(BITTASK_MAX_CHANGE_EXP, 0)	
	end
end
--Ban Item even trong shop
function pActivity:CheckEventSaleDate()
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"));
	if (nCurDate >= %tbSaleEventItem.StartSaleEventDate and nCurDate < %tbSaleEventItem.EndSaleEventDate) then		
		return 1
	else
		Talk(1,"","Thêi gian sù kiÖn ®· hÕt, ta sÏ cè g¾ng cËp nhËp trong c¸c sù kiÖn sau.")
		return
	end
end
function pActivity:OpenSaleItemEvent()
	%tbSaleEventItem:SaleItemEventUI()
end