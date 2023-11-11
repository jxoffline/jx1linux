Include("\\vng_script\\activitysys\\config\\1026\\variables.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\vng_script\\vng_lib\\bittask_lib.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\log.lua")

if not tbSaleEventItem  then
	tbSaleEventItem = {}
end
tbSaleEventItem.StartSaleEventDate = 201508200000
tbSaleEventItem.EndSaleEventDate = 201509092400
tbSaleEventItem.TASK_LIMIT_TRADE = 2707
tbSaleEventItem.MaxTrade = 100
tbSaleEventItem.tbItem =  {szName="B´ng hÂng cµi ∏o", tbProp={6,1,30301,1,0,0},nExpiredTime=20150910}


function tbSaleEventItem:SaleItemEventUI()
	local nMaxCount = 100
	g_AskClientNumberEx(1, nMaxCount, "NhÀp sË vÀt ph»m muËn mua", {self.AcceptTradeEventItem, {self,nCount}} )
end

function tbSaleEventItem:AcceptTradeEventItem(nCount)		
	--kiem tra goi han mua
	local nValue = GetTask(self.TASK_LIMIT_TRADE)
	
	if (nValue  >= self.MaxTrade)  then
		return Talk(1,"",format("ßÓt nµy mÁi nh©n vÀt chÿ mua Æ≠Óc 100 c∏i th´i."))
	end
	
	if ((nValue + nCount)  > self.MaxTrade) then
		return Talk(1,"",format("L«n nµy chÿ cﬂn mua Æ≠Óc %d <color=yellow>%s<color>",(self.MaxTrade-nValue),self.tbItem.szName))
	end
	
	local nCurMaterial = GetTask(%TASK_SAVE_SL_NGOCLUCBAO)	
	local nNeedMaterial = 4*nCount --gia doi 4 NLB lay 1 item event
	if nCurMaterial < nNeedMaterial then 
		return Talk(1,"","Hi÷n tπi ta ch≠a nhÀn ÆÒ sË Ng‰c LÙc B∂o c«n Æ” ÆÊi vÀt ph»m nµy, h∑y nÈp ÆÒ cho ta tr≠Ìc.")
	end	
	--trı sË l≠Óng Ng‰c lÙc b∂o trong khË
	SetTask(%TASK_SAVE_SL_NGOCLUCBAO,nCurMaterial - nNeedMaterial)
	--ghi so luong mua
	SetTask(self.TASK_LIMIT_TRADE, nValue+nCount)
	tbAwardTemplet:Give(self.tbItem, nCount, {EVENT_LOG_TITLE,"DoiThanhCong_HoaHongCaiAo"})
	tbLog:PlayerActionLog(EVENT_LOG_TITLE,"[Mua: ]".."So NLB hien tai:"..nCurMaterial.."- So luong NLB bi tru: "..nNeedMaterial)		
end