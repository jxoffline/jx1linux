Include("\\vng_script\\activitysys\\config\\1021\\head.lua") --!!!!!
Include("\\vng_script\\activitysys\\config\\1021\\variables.lua")
Include("\\vng_script\\activitysys\\config\\1021\\awardlist.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\activitysys\\functionlib.lua")
Include("\\script\\lib\\progressbar.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\log.lua")

pActivity.nPak = curpack()

local _GetHorse = function(nID)
	if not nID then
		return
	end	
	if (GetCash() < MONEY_PHIVAN) then 
		Talk(1, "", "H×nh nh­ ng­¬i kh«ng mang ®ñ 2000 v¹n l­îng!")
		return 
	end	
	
	--ty le thanh cong khi thuan hoa ngua 25%
	local nRand = random(1,100)
	if nRand <= 75 then
		if Pay(MONEY_PHIVAN) ~= 1 then
			tbLog:PlayerActionLog(EVENT_LOG_TITLE,"ThuanHoaPhiVan_TruTien_ThatBai1")
			return Talk(1,"","ThuÇn hãa ngùa thÊt b¹i, kh«ng thÓ trõ phÝ thuÇn hãa ngùa.")
		end
		tbLog:PlayerActionLog(EVENT_LOG_TITLE,"ThuanHoaPhiVanThatBai")
		return Talk(1,"","ThuÇn hãa ngùa thÊt b¹i, ta tr¶ l¹i vËt dông chØ lÊy tiÒn phÝ lÇn nµy.")		 	
	end
	
	if (pActivity:CheckItemListInBag(tbITEM_PHIVAN, "Kh«ng ®ñ nguyªn liÖu thuÇn hãa Phi V©n.") ~= 1) then 		
		return 
	end
	
	if (pActivity:ConsumeEquiproomItemList(tbITEM_PHIVAN)	) ~= 1 then
		tbLog:PlayerActionLog(EVENT_LOG_TITLE,"ThuanHoaPhiVan_NguyenLieu_ThatBai")
		return Talk(1,"","ThuÇn hãa ngùa thÊt b¹i, kh«ng thÓ trõ nguyªn liÖu.")
	end
	
	if Pay(MONEY_PHIVAN) ~= 1 then
		tbLog:PlayerActionLog(EVENT_LOG_TITLE,"ThuanHoaPhiVan_TruTien_ThatBai2")
		return Talk(1,"","ThuÇn hãa ngùa thÊt b¹i, kh«ng thÓ trõ phÝ thuÇn hãa ngùa.")
	end	
	tbAwardTemplet:Give(%tbHorseAward[nID], 1, {EVENT_LOG_TITLE,"ThuanHoaPhiVanThanhCong"})
	AddGlobalNews(format("§¹i hiÖp <color=yellow>%s<color> ®· thuÇn hãa ®­îc Phi V©n thÇn m·. Tõ nay sÏ nh­ hæ mäc thªm c¸nh, tung hoµnh giang hå.",GetName()))
end

local _OnBreak = function()
	Msg2Player("ThuÇn hãa ngùa thÊt b¹i, h·y cè g¾ng thö l¹i lÇn n÷a.")
end

function pActivity:ComposeHorse(nID)
	local szTitle = format("<color=yellow>\n\n- ThuÇn hãa ngùa kh«ng ph¶i muèn lµ ®­îc, cÇn ph¶i kiªn nhÉn. Ng­¬i lµm ®­îc kh«ng?")
	if nID == 1 then
		szTitle = szTitle.." \nThuÇn hãa Phi V©n thÇn m· h·y t×m ®­îc c¸c vËt dông sau: <color>\n	- 2 Cá T­¬i. 2 BÉy Ngùa. 2 D©y Thõng. 2 Yªn C­¬ng. 2 Roi Ngùa.\n	- 2000 v¹n l­îng b¹c\n\n\n"
	end		
	local tbOpt = {}	
	tinsert(tbOpt,  format("B¾t ®Çu thuÇn hãa Phi v©n/#pActivity:ProgressHorse(%d)",nID)	)		
	tinsert(tbOpt,  "Ta sÏ thö sau.../Cancel")
	Say(szTitle, getn(tbOpt), tbOpt)	
	--CreateNewSayEx(szTitle, tbOpt)
end

function pActivity:ProgressHorse(nID)
	if (pActivity:CheckItemListInBag(tbITEM_PHIVAN, "Kh«ng ®ñ nguyªn liÖu thuÇn hãa Phi V©n.") ~= 1) then 		
		return
	end
	if (GetCash() < MONEY_PHIVAN) then 
		Talk(1, "", "H×nh nh­ ng­¬i kh«ng mang ®ñ 2000 v¹n l­îng!")
		return 
	end	
	tbProgressBar:OpenByConfig(17, %_GetHorse, {nID}, %_OnBreak)
end

function pActivity:ConsumeEquiproomItemList(tbItemList)
	if not tbItemList then
		return
	end
	for i=1, getn(tbItemList) do
		local tbItem = tbItemList[i]
		local tbProp = tbItem.tbProp
	
		tbItem.nCount = tbItem.nCount or 1
		
		ConsumeEquiproomItem(tbItem.nCount, tbProp[1], tbProp[2], tbProp[3], tbProp[4])
	end
	return 1
end

function pActivity:CheckItemListInBag(tbItemList, szFailMsg)	
	if not tbItemList then
		return
	end
	for i=1, getn(tbItemList) do
		local tbItem = tbItemList[i]
		local tbProp = tbItem.tbProp
	
		tbItem.nCount = tbItem.nCount or 1
		if CalcEquiproomItemCount(tbProp[1], tbProp[2], tbProp[3], tbProp[4]) < tbItem.nCount then
			lib:ShowMessage(szFailMsg)
			return nil
		end
	end
	return 1
end

