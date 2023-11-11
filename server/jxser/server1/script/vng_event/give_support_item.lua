Include("\\script\\vng_lib\\bittask_lib.lua")

GiveSupportItem = {}

GiveSupportItem.TASK_COUNT_ITEM_1 = 2764

GiveSupportItem.TASK_COUNT_ITEM_2 = 2765

GiveSupportItem.TASK_COUNT_ITEM_3 = 2766

GiveSupportItem.TASK_COUNT_ITEM_4 = 2767

GiveSupportItem.TASK_COUNT_ITEM_5 = 2768

GiveSupportItem.TASK_COUNT_ITEM_6 = 2769

GiveSupportItem.TASK_COUNT_ITEM_7 = 2729

GiveSupportItem.tbResetTask = 
	{
		nTaskID = 2754,
		nStartBit = 30,
		nBitCount = 1,
		nMaxValue = 1
	}

GiveSupportItem.START_DATE = 201304150000
GiveSupportItem.END_DATE = 201304212400

GiveSupportItem.tbListItem = 
{
	--{szName="", nG=, nD=, nP=, nStack=, nType=}
--	{szName="Cµn Kh«n T¹o Hãa §an (®¹i) ", nG=6, nD=1, nP=215, nType=1},
--	{szName="Cµn Kh«n T¹o Hãa §an (trung) ", nG=6, nD=1, nP=216, nType=1},
--	{szName="Cµn Kh«n T¹o Hãa §an (tiÓu) ", nG=6, nD=1, nP=217, nType=1},
--	{szName="Tèng Kim Phi Tèc hoµn", nG=6, nD=1, nP=190, nType=1},
--	{szName="ChiÕn cæ ", nG=6, nD=1, nP=156, nType=2},
--	{szName="Kh¸ng §¬n Chi Gi¸c ", nG=6, nD=1, nP=214, nType=2},
--	{szName="LÖnh bµi", nG=6, nD=1, nP=157, nType=2},
--	{szName="Chuyªn dïng cho Tèng Kim §éc phßng hoµn", nG=6, nD=1, nP=195, nType=3},
--	{szName="Chuyªn dïng cho Tèng Kim L«i phßng hoµn", nG=6, nD=1, nP=193, nType=3},
--	{szName="Chuyªn dïng cho Tèng Kim Háa phßng hoµn", nG=6, nD=1, nP=194, nType=3},
--	{szName="Tèng Kim B¨ng Phßng hoµn", nG=6, nD=1, nP=192, nType=3},
--	{szName="Tèng Kim Phæ Phßng hoµn", nG=6, nD=1, nP=191, nType=3},
--	{szName="Tèng Kim Tr­êng MÖnh hoµn", nG=6, nD=1, nP=186, nType=3},
--	{szName="Tèng Kim Cao Trung hoµn", nG=6, nD=1, nP=189, nType=3},
--	{szName="Tèng Kim Cao ThiÓm hoµn", nG=6, nD=1, nP=188, nType=3},
--	{szName="Tèng Kim Gia Bµo hoµn", nG=6, nD=1, nP=187, nType=3},
--	{szName="Tèng Kim Tr­êng MÖnh hoµn", nG=6, nD=1, nP=186, nType=3},
--	{szName="Tèng Kim Néi L«i hoµn", nG=6, nD=1, nP=185, nType=3},
--	{szName="Tèng Kim Néi B¨ng hoµn", nG=6, nD=1, nP=183, nType=3},
--	{szName="Tèng Kim Néi §éc hoµn", nG=6, nD=1, nP=182, nType=3},
--	{szName="Tèng Kim Néi Háa hoµn", nG=6, nD=1, nP=184, nType=3},
--	{szName="Tèng Kim Néi Phæ hoµn", nG=6, nD=1, nP=181, nType=3},
--	{szName="Tèng Kim Ngo¹i B¨ng hoµn", nG=6, nD=1, nP=180, nType=3},
--	{szName="Tèng Kim Ngo¹i §éc hoµn", nG=6, nD=1, nP=179, nType=3},
--	{szName="Tèng Kim Ngo¹i Phæ hoµn", nG=6, nD=1, nP=178, nType=3},

	{szName="Cµn Kh«n T¹o Hãa §an (®¹i) ", nG=6, nD=1, nP=215, nType=1},
	{szName="Cµn Kh«n T¹o Hãa §an (trung) ", nG=6, nD=1, nP=216, nType=2},
	{szName="Cµn Kh«n T¹o Hãa §an (tiÓu) ", nG=6, nD=1, nP=217, nType=3},
	{szName="Tèng Kim Phi Tèc hoµn", nG=6, nD=1, nP=190, nType=4},
	{szName="ChiÕn cæ ", nG=6, nD=1, nP=156, nType=5},
	{szName="Kh¸ng §¬n Chi Gi¸c ", nG=6, nD=1, nP=214, nType=5},
	{szName="LÖnh bµi", nG=6, nD=1, nP=157, nType=5},
	{szName="Chuyªn dïng cho Tèng Kim §éc phßng hoµn", nG=6, nD=1, nP=195, nType=6},
	{szName="Chuyªn dïng cho Tèng Kim L«i phßng hoµn", nG=6, nD=1, nP=193, nType=6},
	{szName="Chuyªn dïng cho Tèng Kim Háa phßng hoµn", nG=6, nD=1, nP=194, nType=6},
	{szName="Tèng Kim B¨ng Phßng hoµn", nG=6, nD=1, nP=192, nType=6},
	{szName="Tèng Kim Phæ Phßng hoµn", nG=6, nD=1, nP=191, nType=6},
	{szName="Tèng Kim Tr­êng MÖnh hoµn", nG=6, nD=1, nP=186, nType=6},
	{szName="Tèng Kim Cao Trung hoµn", nG=6, nD=1, nP=189, nType=6},
	{szName="Tèng Kim Cao ThiÓm hoµn", nG=6, nD=1, nP=188, nType=6},
	{szName="Tèng Kim Gia Bµo hoµn", nG=6, nD=1, nP=187, nType=6},
	{szName="Tèng Kim Tr­êng MÖnh hoµn", nG=6, nD=1, nP=186, nType=6},
	{szName="Tèng Kim Néi L«i hoµn", nG=6, nD=1, nP=185, nType=6},
	{szName="Tèng Kim Néi B¨ng hoµn", nG=6, nD=1, nP=183, nType=6},
	{szName="Tèng Kim Néi §éc hoµn", nG=6, nD=1, nP=182, nType=6},
	{szName="Tèng Kim Néi Háa hoµn", nG=6, nD=1, nP=184, nType=6},
	{szName="Tèng Kim Néi Phæ hoµn", nG=6, nD=1, nP=181, nType=6},
	{szName="Tèng Kim Ngo¹i B¨ng hoµn", nG=6, nD=1, nP=180, nType=6},
	{szName="Tèng Kim Ngo¹i §éc hoµn", nG=6, nD=1, nP=179, nType=6},
	{szName="Tèng Kim Ngo¹i Phæ hoµn", nG=6, nD=1, nP=178, nType=6},
	--THDNB9
	{szName="Håi thiªn t¸i t¹o lÔ bao", nG=6, nD=1, nP=2527, nType=7},
	--{szName="CÈm nang thay ®æi trêi ®Êt", nG=6, nD=1, nP=1781, nType=7},
}


function GiveSupportItem:IsActive()
	local now = tonumber(GetLocalDate("%Y%m%d%H%M"));
	if (now >= self.START_DATE) and (now <= self.END_DATE) then
		return 1;
	end
	return 0;
end

function GiveSupportItem:ShowDialog()
	local tbOpt = {}
	local str = "Giao nép vËt phÈm hæ trî Tèng Kim"

	tinsert(tbOpt, "Ta muèn gia nép dông cô hæ trî Tèng Kim/#GiveSupportItem:OpenUI()")
	tinsert(tbOpt, "<#>Tho¸t/OnCancel")
	if ( getn( tbOpt ) == 0 ) then
		Say(str, 0);
		return
	end;
	Say( str, getn( tbOpt ), tbOpt )	
end

function GiveSupportItem:OpenUI()
	--THDNB9 Reset l¹i c¸c task ®· sö dông trong THDNB8 - Modified by DinhHQ
	if tbVNG_BitTask_Lib:getBitTask(self.tbResetTask) == 0 then
		for i = 2764, 2769 do
			SetTask(i, 0)
		end		
		SetTask(2729, 0)
		tbVNG_BitTask_Lib:setBitTask(self.tbResetTask, 1)
	end
	
	GiveItemUI("Giao nép vËt phÈm hæ trî TK", "Giao nép vËt phÈm hæ trî TK", "ConfirmSupportItem", "OnCancel");
end

function ConfirmSupportItem(nCount)
	for i=1, nCount do
		local nItemIndex = GetGiveItemUnit(i)	
		local itemgenre, detailtype, parttype = GetItemProp(nItemIndex)
		
		--THDNB9 KiÓm tra gi¸ trÞ cña Håi thiªn t¸i t¹o lÔ bao vµ cÈm nang thay ®æi trêi ®Êt - Modified by DinhHQ - 20110517
		if (itemgenre == 6 and detailtype == 1 and parttype == 1781) then
			local nItemValue= GetItemParam(nItemIndex, 1)
			if nItemValue < 60 then
				Talk(1, "", "<color=yellow>CÈm nang thay ®æi trêi ®Êt<color> ph¶i cßn ®ñ gi¸ trÞ lµ 60 míi ®­îc chÊp nhËn!");
				return
			end
		end
		if (itemgenre == 6 and detailtype == 1 and parttype == 2527) then
			local nItemValue= GetItemParam(nItemIndex, 1)
			if nItemValue ~= 0 then
				Talk(1, "", "<color=yellow>Håi thiªn t¸i t¹o lÔ bao <color>ph¶i cßn ®ñ gi¸ trÞ lµ 60 míi ®­îc chÊp nhËn!");
				return
			end
		end
		
		
		if (GiveSupportItem:CheckItem(itemgenre, detailtype, parttype) <= 0) then
			Talk(1, "", "§¹i hiÖp xin h·y bá vµo ®óng vËt phÈm !");
			return
		end
	end
	GiveSupportItem:ProcessGiveItem(nCount)
end

function GiveSupportItem:ProcessGiveItem(nCount)
	local nCount_1, nCount_2, nCount_3, nCount_4, nCount_5, nCount_6, nCount_7 = 0, 0, 0, 0, 0, 0, 0
	for i=1, nCount do
		local nItemIndex = GetGiveItemUnit(i)	
		local itemgenre, detailtype, parttype = GetItemProp(nItemIndex)	
		local nIndexList = self:CheckItem(itemgenre, detailtype, parttype)
		if (self.tbListItem[nIndexList].nType == 1) then
			nCount_1 = nCount_1 + GetItemStackCount(nItemIndex)
		elseif (self.tbListItem[nIndexList].nType == 2) then
			nCount_2 = nCount_2 + GetItemStackCount(nItemIndex)
		elseif (self.tbListItem[nIndexList].nType == 3) then
			nCount_3 = nCount_3 + GetItemStackCount(nItemIndex)
		elseif (self.tbListItem[nIndexList].nType == 4) then
			nCount_4 = nCount_4 + GetItemStackCount(nItemIndex)
		elseif (self.tbListItem[nIndexList].nType == 5) then
			nCount_5 = nCount_5 + GetItemStackCount(nItemIndex)
		elseif (self.tbListItem[nIndexList].nType == 6) then
			nCount_6 = nCount_6 + GetItemStackCount(nItemIndex)
		elseif (self.tbListItem[nIndexList].nType == 7) then
			nCount_7 = nCount_7 + GetItemStackCount(nItemIndex)
		end
	end
	--Msg2Player(nCount_1.." - " .. nCount_2.." - " .. nCount_3.." - " .. nCount_4.." - " .. nCount_5.." - " .. nCount_6)
	
	local nTotal_1 = GetTask(self.TASK_COUNT_ITEM_1) + nCount_1
	local nTotal_2 = GetTask(self.TASK_COUNT_ITEM_2) + nCount_2
	local nTotal_3 = GetTask(self.TASK_COUNT_ITEM_3) + nCount_3	
	local nTotal_4 = GetTask(self.TASK_COUNT_ITEM_4) + nCount_4
	local nTotal_5 = GetTask(self.TASK_COUNT_ITEM_5) + nCount_5	
	local nTotal_6 = GetTask(self.TASK_COUNT_ITEM_6) + nCount_6
	local nTotal_7 = GetTask(self.TASK_COUNT_ITEM_7) + nCount_7
	
	local nMod = 0
	if mod(nTotal_1, 10) > 0 then
		nMod = nMod + 1
	end
	
	if mod(nTotal_2, 10) > 0 then
		nMod = nMod + 1
	end
	
	if mod(nTotal_3, 10) > 0 then
		nMod = nMod + 1
	end
	
	if mod(nTotal_4, 50) > 0 then
		nMod = nMod + 1
	end
	
	if mod(nTotal_5, 50) > 0 then
		nMod = nMod + 1
	end
	
	if mod(nTotal_6, 50) > 0 then
		nMod = nMod + 1
	end
	
	local nSum = floor(nTotal_1/10) +  floor(nTotal_2/10) +  floor(nTotal_3/10) +  floor(nTotal_4/50) + floor(nTotal_5/50) + floor(nTotal_6/50) + nMod + nTotal_7
	--Msg2Player(nSum .. "..................")
	if (nSum > 300) then
		Talk(1, "", "Sè l­îng vËt phÈm giao nép qu¸ giíi h¹n cho phÐp!");
		return
	end
	
	for i=1, nCount do
		local nItemIndex = GetGiveItemUnit(i)
		if (RemoveItemByIndex(nItemIndex) ~= 1) then
			Talk(1, "", "VËt phÈm cã vÊn ®Ò!");
			return
		end
	end
	
	local nTotalAll = GetTask(self.TASK_COUNT_ITEM_1) + nCount_1 +  GetTask(self.TASK_COUNT_ITEM_2) + nCount_2 + GetTask(self.TASK_COUNT_ITEM_3) + nCount_3 + GetTask(self.TASK_COUNT_ITEM_4) + nCount_4 + GetTask(self.TASK_COUNT_ITEM_5) + nCount_5 + GetTask(self.TASK_COUNT_ITEM_6) + nCount_6 + GetTask(self.TASK_COUNT_ITEM_7) + nCount_7
	
	if (nCount_1 > 0) then
		local nTotal =  GetTask(self.TASK_COUNT_ITEM_1)
		SetTask(self.TASK_COUNT_ITEM_1, nTotal + nCount_1)
		Msg2Player("§¹i hiÖp ®· nép <color=yellow>" .. nCount_1 .. " <color>vËt phÈm lo¹i 1 - Tæng sè vËt phÈm ®· nép lµ: <color=yellow>" .. nTotalAll .."<color>")
		WriteLog(date("%Y%m%d %H%M%S").."\t".."Giao nép vËt phÈm hæ trî Tèng Kim"..GetAccount().."\t"..GetName().."\t".."Nép " .. nCount_1 .. " lo¹i 1 - Tæng sè: " .. nTotalAll)
	end
	
	if (nCount_2 > 0) then
		local nTotal =  GetTask(self.TASK_COUNT_ITEM_2)
		SetTask(self.TASK_COUNT_ITEM_2, nTotal + nCount_2)
		Msg2Player("§¹i hiÖp ®· nép <color=yellow>" .. nCount_2 .. " <color>vËt phÈm lo¹i 2 - Tæng sè vËt phÈm ®· nép lµ: <color=yellow>" .. nTotalAll .."<color>")
		WriteLog(date("%Y%m%d %H%M%S").."\t".."Giao nép vËt phÈm hæ trî Tèng Kim"..GetAccount().."\t"..GetName().."\t".."Nép " .. nCount_2 .. " lo¹i 2 - Tæng sè: " .. nTotalAll)
	end
	
	if (nCount_3 > 0) then
		local nTotal =  GetTask(self.TASK_COUNT_ITEM_3)
		SetTask(self.TASK_COUNT_ITEM_3, nTotal + nCount_3)
		Msg2Player("§¹i hiÖp ®· nép <color=yellow>" .. nCount_3 .. " <color>vËt phÈm lo¹i 3 - Tæng sè vËt phÈm ®· nép lµ: <color=yellow>" .. nTotalAll .."<color>")
		WriteLog(date("%Y%m%d %H%M%S").."\t".."Giao nép vËt phÈm hæ trî Tèng Kim"..GetAccount().."\t"..GetName().."\t".."Nép " .. nCount_3 .. " lo¹i 3 - Tæng sè: " .. nTotalAll)
	end
	
	if (nCount_4 > 0) then
		local nTotal =  GetTask(self.TASK_COUNT_ITEM_4)
		SetTask(self.TASK_COUNT_ITEM_4, nTotal + nCount_4)		
		Msg2Player("§¹i hiÖp ®· nép <color=yellow>" .. nCount_4 .. " <color>vËt phÈm lo¹i 4 - Tæng sè vËt phÈm ®· nép lµ: <color=yellow>" .. nTotalAll .."<color>")
		WriteLog(date("%Y%m%d %H%M%S").."\t".."Giao nép vËt phÈm hæ trî Tèng Kim"..GetAccount().."\t"..GetName().."\t".."Nép " .. nCount_4 .. " lo¹i 4 - Tæng sè: " .. nTotalAll)
	end
	
	if (nCount_5 > 0) then
		local nTotal =  GetTask(self.TASK_COUNT_ITEM_5)
		SetTask(self.TASK_COUNT_ITEM_5, nTotal + nCount_5)
		Msg2Player("§¹i hiÖp ®· nép <color=yellow>" .. nCount_5 .. " <color>vËt phÈm lo¹i 5 - Tæng sè vËt phÈm ®· nép lµ: <color=yellow>" .. nTotalAll .."<color>")
		WriteLog(date("%Y%m%d %H%M%S").."\t".."Giao nép vËt phÈm hæ trî Tèng Kim"..GetAccount().."\t"..GetName().."\t".."Nép " .. nCount_5 .. " lo¹i 5 - Tæng sè: " .. nTotalAll)
	end
	
	if (nCount_6 > 0) then
		local nTotal =  GetTask(self.TASK_COUNT_ITEM_6)
		SetTask(self.TASK_COUNT_ITEM_6, nTotal + nCount_6)
		Msg2Player("§¹i hiÖp ®· nép <color=yellow>" .. nCount_6 .. " <color>vËt phÈm lo¹i 6 - Tæng sè vËt phÈm ®· nép lµ: <color=yellow>" .. nTotalAll .."<color>")
		WriteLog(date("%Y%m%d %H%M%S").."\t".."Giao nép vËt phÈm hæ trî Tèng Kim"..GetAccount().."\t"..GetName().."\t".."Nép " .. nCount_6 .. " lo¹i 6 - Tæng sè: " .. nTotalAll)
	end
	
	if (nCount_7 > 0) then
		local nTotal =  GetTask(self.TASK_COUNT_ITEM_7)
		SetTask(self.TASK_COUNT_ITEM_7, nTotal + nCount_7)		
		Msg2Player("§¹i hiÖp ®· nép <color=yellow>" .. nCount_7 .. " <color>vËt phÈm lo¹i 7 - Tæng sè vËt phÈm ®· nép lµ: <color=yellow>" .. nTotalAll .."<color>")
		WriteLog(date("%Y%m%d %H%M%S").."\t".."Giao nép vËt phÈm hæ trî Tèng Kim"..GetAccount().."\t"..GetName().."\t".."Nép " .. nCount_7 .. " lo¹i 7 - Tæng sè: " .. nTotalAll)
	end
end

function GiveSupportItem:CheckItem(nG, nD, nP)
	local nCount = 0
	for i=1, getn(self.tbListItem) do
		local tbTemp = self.tbListItem[i]
		if (nG== tbTemp.nG and nD== tbTemp.nD and nP== tbTemp.nP) then
			nCount = i
		end
	end
	
	if (nCount > 0) then
		return nCount
	else
		return 0
	end
end

function onCancel()

end