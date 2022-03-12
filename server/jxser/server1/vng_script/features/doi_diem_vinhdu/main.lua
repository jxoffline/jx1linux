Include("\\script\\lib\\log.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\vng_script\\features\\doi_diem_vinhdu\\head.lua")


function tbVngDoiDiemVD:main()
	local nPointWlls = GetTask(%TASK_WLLS_TASKID_HONOUR)		
	local szMsg = format("<npc>ChØ cao thñ <color=yellow>Vâ L©m Liªu §Êu<color> míi cã thÓ së h÷u ®­îc nh÷ng trang bÞ cùc hiÕm cã mét kh«ng hai.\nNg­¬i hiÖn t¹i ®ang cã <color=yellow>%d ®iÓm vinh dù<color> cã muèn ®æi th­ëng kh«ng?\n\n",nPointWlls)
	
	local tbOpt = {}		
	tinsert(tbOpt, {format("§æi phÇn th­ëng liªn ®Êu"), self.Open_Sell_Wlls, {self}})	
	tinsert(tbOpt, {format("§æi V« Danh ChØ Hoµn"), self.Give_UI, {self,141}})
	tinsert(tbOpt, {format("§æi V« Danh Giíi ChØ"), self.Give_UI, {self,142}})
	tinsert(tbOpt, {"Hñy bá "})
	CreateNewSayEx(szMsg, tbOpt)
end

function tbVngDoiDiemVD:Open_Sell_Wlls()
	if (GetBoxLockState() == 0) then
		Sale(146,11) -- Shop id 11 ban bang diem tinh luc
	else
		Talk(1,"","H·y më khãa r­¬ng tr­íc ®·.")
		return
	end
end

function tbVngDoiDiemVD:Give_UI(nIDRing)
	local strDesc = "Vui lßng bá 4 viªn V« Danh Hån Th¹ch vµo."	
	if nIDRing == 141 then		
		g_GiveItemUI("§æi V« Danh ChØ Hoµn", strDesc, {self.DoiVoDanh, {self,nIDRing}}, nil, 1)
	else
		g_GiveItemUI("§æi V« Danh Giíi ChØ", strDesc, {self.DoiVoDanh, {self,nIDRing}}, nil, 1)
	end
end

function tbVngDoiDiemVD:DoiVoDanh(nIDRing,nCount)
	if (nCount ~= 4) then 
		Talk(1, "", "Mçi lÇn chØ ®­îc bá <color=yellow>4 viªn V« Danh Hån Th¹ch<color>.")
		return
	end
	local nNumStone = self:CheckMaterial_Stone(nCount)
	if nNumStone < 4 then
		return Talk(1,"",format("§æi V« Danh ChØ Hoµn cÇn <color=yellow>4 viªn V« Danh Hån Th¹ch<color>, h·y kiÕm cho ®ñ."))
	end
	--kiem tra diem lien dau
	local nCurPoint = GetTask(%TASK_WLLS_TASKID_HONOUR)
	if nCurPoint < %NEED_POINT_WLLS then
		return Talk(1,"",format("§æi V« Danh ChØ Hoµn cÇn <color=yellow>%d ®iÓm vinh dù<color>.",%NEED_POINT_WLLS))
	end
	for i=1, nCount do
		local nItemIndex = GetGiveItemUnit(i)
		if IsMyItem(nItemIndex) ~= 1 then
			return
		end
		local szGDP = format("%d,%d,%d", GetItemProp(nItemIndex))
		local nQuality = GetItemQuality(nItemIndex)
		if nQuality == 0 and %szGDP_ITEM_VODANH_STONE == szGDP then
			RemoveItemByIndex(nItemIndex)
			tbLog:PlayerActionLog(KEY_LOG, "[TruNguyenLieu]_"..GetItemName(nItemIndex))
		end
	end
	local nLastPoint = nCurPoint - %NEED_POINT_WLLS 
	SetTask(%TASK_WLLS_TASKID_HONOUR,nLastPoint)
	tbLog:PlayerActionLog(KEY_LOG, format("[TruDiemLienDau]_DiemHienTai: %d _ DiemConLai: %d ",nCurPoint,nLastPoint))
	tbAwardTemplet:Give(self.tbItemVoDanhRing[nIDRing],1,{KEY_LOG,"DoiVoDanhID_"..nIDRing})	
	local szEquipName = self.tbItemVoDanhRing[nIDRing].szName	
	local szNew = format("Chóc mõng ®¹i hiÖp <color=yellow>%s<color> ®· ®æi ®­îc <color=yellow>%s<color>. Tõ nµy nh­ hæ mäc thªm c¸nh, tung hoµnh gian hå",GetName(),szEquipName)
	Talk(1,"",szNew)
	AddGlobalNews(szNew)
	AddGlobalNews(szNew)
end

function tbVngDoiDiemVD:CheckMaterial_Stone(nCount)
	local nNumStone = 0
	for i=1, nCount do
		local nItemIndex = GetGiveItemUnit(i)
		if IsMyItem(nItemIndex) ~= 1 then
			return 0
		end
		if IsItemStackable(nItemIndex) == 1 then			
			return 0
		end
		local szGDP = format("%d,%d,%d", GetItemProp(nItemIndex))		
		local nQuality = GetItemQuality(nItemIndex)	
		if nQuality == 0 and %szGDP_ITEM_VODANH_STONE == szGDP then
			nNumStone = nNumStone + 1			
		end
	end
	return nNumStone 
end

EventSys:GetType("AddNpcOption"):Reg("Sø gi¶ trao th­ëng liªn ®Êu","Ta muèn l·nh th­ëng ®iÓm liªn ®Êu", tbVngDoiDiemVD.main,{tbVngDoiDiemVD})


