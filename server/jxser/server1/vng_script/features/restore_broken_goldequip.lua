--Restore broken Gold equip -by thanhld 20150729

IncludeLib("ITEM")
IncludeLib("SETTING")
Include("\\script\\lib\\log.lua")
Include("\\vng_script\\vng_lib\\checkinmap.lua")

if not tbRestoreGoldEq then
	tbRestoreGoldEq = {}
end
tbRestoreGoldEq.KeyLog = "LOGEVENT_FEATURE_CTC_SUADOHKMP"
tbRestoreGoldEq.tbItemTool =  {szName="§¹i §¹i Hoµng kim c«ng cô",tbProp={6,1,30556,1,0,0}}

function main(nItemIdx)	
	if VngPlayerFunLib:VnCheckInCity("default") ~= 1 then
		return 1
	end
	local szTitle = format("<color=yellow>§¹i Hoµng kim c«ng cô<color> ®Ó xö lý trang bÞ Hoµng kim ®· bÞ h­ h¹i hoµn toµn.")
	local tbOpt = {}	
	tinsert(tbOpt, {format("Söa Trang BÞ Hoµng Kim H­ H¹i"), tbRestoreGoldEq.Restore_brokenequip, {tbRestoreGoldEq}})
	tinsert(tbOpt, {"Hñy bá "})
	CreateNewSayEx(szTitle, tbOpt)
	return 1	
end

function tbRestoreGoldEq:Restore_brokenequip()	
	local strDesc = "Xin mêi bá <Trang bÞ ®· h­ h¹i> vµo « bªn d­íi.  Chó ý: tr­íc khi tiÕn hµnh söa trang bÞ, h·y kiÓm tra hµnh trang cßn ®ñ « trèng."	
	g_GiveItemUI("Phôc håi <Trang bÞ tæn h¹i>", strDesc, {self.On_restore_be, {self}}, nil, 1)
end


function tbRestoreGoldEq:On_restore_be(nCount)
	local nItemIdx = self:check_brokenequip(nCount, "self:Restore_brokenequip")
	if (nItemIdx <= 0) then
		return
	end
	if (CountFreeRoomByWH(2,5,1) < 1) then
		Talk(1, "", "Hµnh trang §¹i hiÖp kh«ng ®ñ 2x5 « trèng.");
		return
	end
	local szItemName = GetItemName(nItemIdx)
	local nQuality = GetItemQuality(nItemIdx)	
	
	local tbProp = self.tbItemTool.tbProp	
	if (CalcEquiproomItemCount(tbProp[1],tbProp[2],tbProp[3],1) < 1) then
		return
	end
	
	if (ITEM_BrokenEquip2Normal(nItemIdx) == 1) then
		local tbProp = self.tbItemTool.tbProp
		ConsumeEquiproomItem(1,tbProp[1],tbProp[2],tbProp[3],1)
		SetCurDurability(nItemIdx, GetMaxDurability(nItemIdx)) 
		Msg2Player("Phôc håi thµnh c«ng, xin kiÓm tra hµnh trang")
		tbLog:PlayerActionLog(self.KeyLog,"[Succeed - ]"..szItemName)		
		KickOutSelf()
	else
		Msg2Player("<trang bÞ tæn h¹i>"..szItemName.." phôc håi thÊt b¹i, xin liªn hÖ ng­êi ban ®iÒu hµnh ®Ó ®­îc hç trî");
		Say("<trang bÞ tæn h¹i>"..szItemName.." phôc håi thÊt b¹i, xin liªn hÖ bæn trang.", 1, "§­îc!/no")		
		tbLog:PlayerActionLog(self.KeyLog,"[Fail - ]"..szItemName)		
	end	
end

--check_brokenequip
function tbRestoreGoldEq:check_brokenequip(nCount, szDealFunc)
	if (nCount <= 0) then
		return 0
	end

	if (nCount > 1) then
		Say("Mçi lÇn chØ söa ®­îc mét <color=red><trang bÞ tæn h¹i><color> th«i!", 2, "µ! Th× ra ®Æt nhÇm ®Ó ta thö l¹i./"..szDealFunc, "§Ó ta kiÓm tra xem sao/no")
		return 0
	end
	
	local nItemIdx = GetGiveItemUnit(1);
	local itemgenre, detailtype, parttype = GetItemProp(nItemIdx)
	local nQuality = GetItemQuality(nItemIndex)
	local nGoldeEquip = GetGlodEqIndex(nItemIdx)
	local nBindState = GetItemBindState(nItemIdx)
	
	print("check_brokenequip nQuality: "..nQuality)
	print("check_brokenequip nGoldeEquip: "..nGoldeEquip)
	--check bind equip
	if (nBindState ~= 0) then 
		Say("Trang bÞ khãa cã thêi h¹n hoÆc vÜnh viªn kh«ng söa ®­îc.", 1,"§Ó ta kiÓm tra xem sao/no")
		return	0
	end
	--check goldequip
	if (nGoldeEquip <= 0) or (nQuality ~= 0) then 
		Say("Trang bÞ th­êng th× dïng Hoµng Kim C«ng Cô ®Ó söa.", 1,"§Ó ta kiÓm tra xem sao/no")
		return	0
	end
	
	if (itemgenre ~= 7) then 
		Say("Nh÷ng thø b¹n ®Æt vµo kh«ng ph¶i <color=red><trang bÞ tæn h¹i><color>, xin kiÓm tra kü l¹i.", 1,"§Ó ta kiÓm tra xem sao/no")
		return	0
	end
	if IsMyItem(nItemIdx) ~= 1 then
		Talk(1,"","ThËt thµ míi lµ ®øc tÝnh tèt!!!")
		tbLog:PlayerActionLog(KeyLog, "Nghi van hack -  item bo vao khong o trong hanh trang")
		return 0
	end
	return nItemIdx
end

function no()
end
