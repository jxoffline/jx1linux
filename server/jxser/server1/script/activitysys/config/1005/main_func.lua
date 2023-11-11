Include("\\script\\activitysys\\config\\1005\\check_func.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\vng_feature\\checkinmap.lua")
Include("\\script\\tong\\tong_header.lua");
Include("\\script\\lib\\log.lua")
IncludeLib("TONG")
Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\script\\activitysys\\config\\1005\\personal_award.lua")
Include("\\script\\activitysys\\config\\1005\\personal_quest.lua")
Include("\\script\\activitysys\\config\\1005\\exchange_gold_equip.lua")
Include("\\script\\activitysys\\config\\1005\\dailyaward.lua")
Include("\\script\\vng_lib\\vngtranslog.lua")
Include("\\script\\activitysys\\config\\1005\\exchange_wrong_equip.lua")
Include("\\script\\vng_feature\\getskills.lua")
tbPVLB_Main = {}

function tbPVLB_Main:MainDialog()
	local tbOpt = {}
--	if tbVNG_BitTask_Lib:getBitTask(tbBITTSK_DONATE_ITEM_LIMIT) == 0 then
--		tinsert(tbOpt, {"Nép Cöu Niªn T©n Thñ LÖnh", tbPVLB_Main.DonateItem, {tbPVLB_Main}})
--	end
	tinsert(tbOpt, {"NhËn kü n¨ng cÊp 10 ®Õn 60", VnGetSkill_main})
	tinsert(tbOpt, {"KiÓm tra phÇn th­ëng", tbPVLB_Award.MainDialog, {tbPVLB_Award}})
	tinsert(tbOpt, {"PhÇn th­ëng hµng ngµy", PhongVanLenhBai2011.ShowDialogDaily, {PhongVanLenhBai2011}})
	tinsert(tbOpt, {"NhiÖm vô t©n thñ", tbPVLB_Quest.Main, {tbPVLB_Quest}})
	--tinsert(tbOpt, {"§æi trang bÞ", tbPVLB_ExchgEquip.MainDialog, {tbPVLB_ExchgEquip}})
--	if tbVNG_BitTask_Lib:getBitTask(tbBITTASK_EXCHANGE_WRONG_EQUIP) == 0 then
--		tinsert(tbOpt, {"§æi l¹i trang bÞ nhËn sai", tbExchangeWrongEquip.GetGoldEquipListInRoom, {tbExchangeWrongEquip}})
--	end
	tinsert(tbOpt, {"Hñy bá "})
	CreateNewSayEx("Cöu Niªn Héi Ngé LÖnh Bµi:", tbOpt)
end

function confirm_donate_ttkb(nCount)
	local nW, _, _ = GetWorldPos()
	if nW ~= 162 or GetFightState() ~= 0 then
		Talk(1, "", "Thao t¸c nµy chØ thùc hiÖn ®­îc trong thµnh §¹i Lý.")
		return
	end
	if tbVNG_BitTask_Lib:CheckBitTaskValue(tbBITTSK_DONATE_ITEM_LIMIT, 1, "Mçi nh©n vËt chØ ®­îc nép vËt phÈm nµy 1 lÇn.", "~=") ~= 1 then
		return
	end
	if nCount > 1 or nCount <= 0 then
		Talk(1, "", "VËt phÈm bá vµo kh«ng ®óng, xin h·y kiÓm tra l¹i")
		return
	end
	local nIdx=GetGiveItemUnit(1)
	local nG,nD,nP,_,_=GetItemProp(nIdx)
	if nG ~= 6 or nD ~= 1 or nP ~= 30144 then
		Talk(1, "", "VËt phÈm bá vµo kh«ng ®óng, xin h·y kiÓm tra l¹i")
		return
	end
	if IsMyItem(nIdx) ~= 1 or RemoveItemByIndex(nIdx) ~= 1 then
		return
	end
	local szTongName, nTongID = GetTongName();	
	local nItemCount = DynamicExecuteByPlayer(PlayerIndex, "\\script\\vng_lib\\tong_task.lua", "tbTongTSK:GetTongTask", nTongID, tbTS_TONG_TASK_ITEM_COUNT)
	if nItemCount >= 0 then
		tbVNG_BitTask_Lib:setBitTask(tbBITTSK_DONATE_ITEM_LIMIT, 1)
		DynamicExecuteByPlayer(PlayerIndex, "\\script\\vng_lib\\tong_task.lua", "tbTongTSK:SetTongTask", nTongID, tbTS_TONG_TASK_ITEM_COUNT, nItemCount + 1)
		Msg2Player(format("Nép thµnh c«ng 1 <color=yellow>Cöu Niªn T©n Thñ LÖnh<color> vµo bang héi. Sè l­îng hiÖn t¹i: <color=green>%d<color>", nItemCount + 1))
		tbLog:PlayerActionLog(strLOG_HEAD, "NopCuuNienTanThuLenh")		
	end	
end

function tbPVLB_Main:DonateItem()
	local nW, _, _ = GetWorldPos()
	if nW ~= 162 or GetFightState() ~= 0 then
		Talk(1, "", "Thao t¸c nµy chØ thùc hiÖn ®­îc trong thµnh §¹i Lý.")
		return
	end
	if tbPVLB_Check:IsNewPlayer() ~= 1 then
		return
	end
	local szTongName, nTongID = GetTongName();	
	if szTongName == nil or szTongName == "" then
		Talk(1, "", "C¸c h¹ ch­a gia nhËp bang héi kh«ng thÓ giao nép Cöu Niªn T©n Thñ LÖnh")
		return
	end
	if tbVNG_BitTask_Lib:CheckBitTaskValue(tbBITTSK_DONATE_ITEM_LIMIT, 1, "Mçi nh©n vËt chØ ®­îc nép vËt phÈm nµy 1 lÇn.", "~=") == 1 then
		GiveItemUI("Nép Cöu Niªn T©n Thñ LÖnh", "Yªu CÇu: Cöu Niªn T©n Thñ LÖnh", "confirm_donate_ttkb", "onCancel", 1)
	end
end

