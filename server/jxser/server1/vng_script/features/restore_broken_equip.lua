--Restore broken equip -by thanhld 032015
IncludeLib("ITEM")
IncludeLib("SETTING")
Include("\\script\\lib\\log.lua")
Include("\\vng_script\\vng_lib\\checkinmap.lua")

function main(nItemIdx)	
	if VngPlayerFunLib:VnCheckInCity("default") ~= 1 then
		return 1
	end
	local szTitle = "Hoµng Kim C«ng Cô ®Ó xö lý trang bÞ ®· bÞ h­ h¹i hoµn toµn."
	local tbOpt = {}
	tinsert(tbOpt,"Söa Trang BÞ H­ H¹i/#Rrestore_brokenequip()")
	if getn(tbOpt) > 0 then
		tinsert(tbOpt, "Tho¸t/no")
		Say(szTitle, getn(tbOpt), tbOpt)
	end
	return 1	
end

function Rrestore_brokenequip()
	GiveItemUI( "Giao diÖn phôc håi <Trang bÞ tæn h¹i>", "Xin mêi bá <Trang bÞ ®· h­ h¹i> vµo « bªn d­íi.  Chó ý: tr­íc khi tiÕn hµnh söa trang bÞ, h·y kiÓm tra hµnh trang cßn ®ñ « trèng.", "On_restore_be", "no", 1);	
end


function On_restore_be(nCount)
	local nItemIdx = check_brokenequip(nCount, "Rrestore_brokenequip")
	if (nItemIdx <= 0) then
		return
	end
	if (CountFreeRoomByWH(2,5,1) < 1) then
		Talk(1, "", "Hµnh trang §¹i hiÖp kh«ng ®ñ 2x5 « trèng.");
		return
	end
	local szItemName = GetItemName(nItemIdx)
	local nQuality = GetItemQuality(nItemIdx)	
	
	if (CalcEquiproomItemCount(6,1,30594,1) < 1) then
		return
	end
	
	if (ITEM_BrokenEquip2Normal(nItemIdx) == 1) then
		ConsumeEquiproomItem(1,6,1,30594,1)
		SetCurDurability(nItemIdx, GetMaxDurability(nItemIdx)) 
		Msg2Player("Phôc håi thµnh c«ng, xin kiÓm tra hµnh trang")
		tbLog:PlayerActionLog("RestoreBrokenEquip","[Succeed - ]"..szItemName)		
		KickOutSelf()
	else
		Msg2Player("<trang bÞ tæn h¹i>"..szItemName.." phôc håi thÊt b¹i, xin liªn hÖ ng­êi cã tr¸ch nhiÖm");
		Say("<trang bÞ tæn h¹i>"..szItemName.." phôc håi thÊt b¹i, xin liªn hÖ bæn trang.", 1, "§­îc!/no")		
		tbLog:PlayerActionLog("RestoreBrokenEquip","[Fail - ]"..szItemName)		
	end	
end

--check_brokenequip
function check_brokenequip(nCount, szDealFunc)
	if (nCount <= 0) then
		return 0
	end

	if (nCount > 1) then
		Say("Mçi lÇn chØ söa ®­îc mét <color=red><trang bÞ tæn h¹i><color> th«i!", 2, "µ! Th× ra ®Æt nhÇm ®Ó ta thö l¹i./"..szDealFunc, "§Ó ta kiÓm tra xem sao/no")
		return 0
	end
	
	local nItemIdx = GetGiveItemUnit(1);
	itemgenre, detailtype, parttype = GetItemProp(nItemIdx)
	local nGoldeEquip = GetGlodEqIndex(nItemIdx)
	local nBindState = GetItemBindState(nItemIdx)
	--check bind equip
	if (nBindState ~= 0) then 
		Say("Trang bÞ khãa cã thêi h¹n hoÆc vÜnh viªn kh«ng söa ®­îc.", 2, "µ! ra vËy, ®Ó ta thö l¹i./"..szDealFunc, "§Ó ta kiÓm tra xem sao/no")
		return	0
	end
	--check goldequip
	if (nGoldeEquip ~= 0) then 
		Say("HiÖn t¹i trang bÞ Hoµng Kim t¹m thêi ch­a söa ®­îc .", 2, "µ! Th× ra ®Æt nhÇm ®Ó ta thö l¹i./"..szDealFunc, "§Ó ta kiÓm tra xem sao/no")
		return	0
	end
	
	if (itemgenre ~= 7) then 
		Say("Nh÷ng thø b¹n ®Æt vµo kh«ng ph¶i <color=red><trang bÞ tæn h¹i><color>, xin kiÓm tra kü l¹i.", 2, "µ! Th× ra ®Æt nhÇm ®Ó ta thö l¹i./"..szDealFunc, "§Ó ta kiÓm tra xem sao/no")
		return	0
	end
	
	return nItemIdx
end

function no()
end
