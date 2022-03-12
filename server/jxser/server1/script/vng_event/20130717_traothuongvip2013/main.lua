Include("\\script\\vng_lib\\extpoint.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\global\\titlefuncs.lua");
Include("\\script\\lib\\log.lua")
Include("\\script\\lib\\awardtemplet.lua");
Include("\\script\\vng_event\\20130717_traothuongvip2013\\lang.lua")

tbAwardVIP = 
{
	tbExtPoint1 = {nID = 4, nBit = 2, nVer = 2},--check gamer ®¹t Vip vµng	
	tbExtPoint2 = {nID = 4, nBit = 3, nVer = 2},--check gamer ®¹t Vip b¹c
	tbExtPoint3 = {nID = 4, nBit = 4, nVer = 2},--check gamer ®¹t Vip ®ång
	tbExtPoint4 = {nID = 4, nBit = 5, nVer = 2},--check gamer ®· nhËn th­ëng			
}
tbAwardVIP.nTittleID = 3008
tbAwardVIP.nTittleExpiredTime = 7*24*60*60	--7 ngay

tbAwardVIP.GoldAward = {
	{szName = "§iÓm Kinh NghiÖm", nExp=2000000000},	 -- 2 ty exp
	{szName ="Ch©n Nguyªn §¬n (®¹i)",tbProp={6,1,30229,1,0,0},nCount=100,nBindState=-2},
	{szName ="Hé M¹ch §¬n",tbProp={6,1,3203,1,0,0},nCount=1000,nBindState=-2},
	{szName ="MÆt n¹ chiÕn tr­êng V­¬ng Gi¶",tbProp={0,11,647,1,0,0},nCount=1,nExpiredTime=4320,nBindState=-2}, --3ngay
	{
		{szName="Long §¶m 40% (Kh«ng thÓ gia h¹n)",tbProp={0,4487},nCount=1,nRate=50,nQuality = 1,nExpiredTime=4320,nBindState=-2},
		{szName="Cuång Lan 5% (Kh«ng thÓ gia h¹n)",tbProp={0,4492},nCount=1,nRate=50,nQuality = 1,nExpiredTime=4320,nBindState=-2},
	},
}

tbAwardVIP.SilverAward = {
	{szName = "§iÓm Kinh NghiÖm", nExp=1500000000},	 -- 1.5 ty exp
	{szName ="Ch©n Nguyªn §¬n (®¹i)",tbProp={6,1,30229,1,0,0},nCount=50,nBindState=-2},
	{szName ="Hé M¹ch §¬n",tbProp={6,1,3203,1,0,0},nCount=500,nBindState=-2},
	{szName ="MÆt n¹ chiÕn tr­êng V­¬ng Gi¶",tbProp={0,11,647,1,0,0},nCount=1,nExpiredTime=4320,nBindState=-2,},--3ngay
	{
		{szName="Long §¶m 30% (Kh«ng thÓ gia h¹n)",tbProp={0,4486},nCount=1,nRate=50,nQuality = 1,nExpiredTime=4320,nBindState=-2,},
		{szName="Cuång Lan 4% (Kh«ng thÓ gia h¹n)",tbProp={0,4491},nCount=1,nRate=50,nQuality = 1,nExpiredTime=4320,nBindState=-2,},
	},
}

tbAwardVIP.BronzeAward = {
	{szName = "§iÓm Kinh NghiÖm", nExp=1000000000},	 -- 1 ty exp	
	{szName ="MÆt n¹ chiÕn tr­êng V­¬ng Gi¶",tbProp={0,11,647,1,0,0},nCount=1,nExpiredTime=10080,nUsageTime = 60,nBindState=-2,}, --7 ngay, 1 h
	{
		{szName="Long §¶m 30% (Kh«ng thÓ gia h¹n)",tbProp={0,4486},nCount=1,nRate=50,nQuality = 1,nExpiredTime=4320,nBindState=-2,},
		{szName="Cuång Lan 4% (Kh«ng thÓ gia h¹n)",tbProp={0,4491},nCount=1,nRate=50,nQuality = 1,nExpiredTime=4320,nBindState=-2,},
	},
}

function tbAwardVIP:main()
	
	if ((tbExtPointLib:GetBitValueByVersion(self.tbExtPoint1) ~= 1) and (tbExtPointLib:GetBitValueByVersion(self.tbExtPoint2) ~= 1) and (tbExtPointLib:GetBitValueByVersion(self.tbExtPoint3) ~= 1))  then
 		Talk(1,"",MSG_IS_NOT_VIP)
 		return
 	end	
	
	 if (tbExtPointLib:GetBitValueByVersion(self.tbExtPoint4) ~= 0 ) then
 		Talk(1,"",MSG_ALREADY_RECEIVED_AWARD)
 		return
 	end
 	
	if CalcFreeItemCellCount() < 5 then
		Talk(1, "", MSG_NOT_ENOUGH_BAG_CELL)
		return
	end
	
	 if (tbExtPointLib:SetBitValueByVersion(self.tbExtPoint4, 1) ~= 1) then	 
	 	return
	 end
	 
	-- Gold Vip	
	if (tbExtPointLib:GetBitValueByVersion(self.tbExtPoint1) == 1)   then	
 		local nServerTime = GetCurServerTime()+ self.nTittleExpiredTime
		local nDate	= FormatTime2Number(nServerTime)
		local nDay	= floor(mod(nDate,1000000) / 10000)
		local nMon	= mod(floor(nDate / 1000000) , 100)
		local nTime	= nMon * 1000000 + nDay * 10000	
		 SetTask(TASK_ACTIVE_TITLE, self.nTittleID)
		Title_AddTitle(self.nTittleID, 2, nTime)
		Title_ActiveTitle(self.nTittleID)
	 	local str_title = Title_GetTitleName(self.nTittleID)
	 	Msg2Player(format(MSG_RECEIVE_GOLD_AWARD))
		Msg2Player(format(MSG_RECEIVE_GOLD_TITLE, str_title))		
		tbAwardTemplet:Give(self.GoldAward, 1, {LOG_TITLE, "NhanThuongThanhCongVipVang"})		
 		return
 	end	 	
 	-- Silver Vip 	
	if (tbExtPointLib:GetBitValueByVersion(self.tbExtPoint2) == 1)   then 
		Msg2Player(format(MSG_RECEIVE_SILVER_AWARD))
 		tbAwardTemplet:Give(self.SilverAward, 1, {LOG_TITLE, "NhanThuongThanhCongVipBac"})
 		return
 	end	 	
 	-- Bronze  Vip 	
	if (tbExtPointLib:GetBitValueByVersion(self.tbExtPoint3) == 1)   then
 		Msg2Player(format(MSG_RECEIVE_BRONZE_AWARD))
 		tbAwardTemplet:Give(self.BronzeAward, 1, {LOG_TITLE, "NhanThuongThanhCongVipDong"})
 		return
 	end

end


local pEventType = EventSys:GetType("AddNpcOption")
--nId = pEventType:Reg("ChiÕn T©m T«n Gi¶", MSG_MENU_NPC, tbAwardVIP.main,{tbAwardVIP})