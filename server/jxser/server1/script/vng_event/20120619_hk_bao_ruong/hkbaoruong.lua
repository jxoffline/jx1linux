Include("\\script\\vng_event\\20120619_hk_bao_ruong\\main.lua")
Include("\\script\\lib\\progressbar.lua")

function tbVnHKBaoRuong:_OnBreak()
	Msg2Player("Më r­¬ng ®øt ®o¹n")
end

function tbVnHKBaoRuong:InitProgressbar()
	local tbEventSring2 = 
	{
		"EVENT_MOVE",	-- ÒÆ¶¯
		"EVENT_ATTACK",-- Ö÷¶¯¹¥»÷(Ê¹ÓÃ²¿·Ö¼¼ÄÜ)
		"EVENT_SITE",	-- ´ò×ø
		"EVENT_RIDE",	-- ÉÏÏÂÂí
		"EVENT_USEITEM",-- Ê¹ÓÃµÀ¾ß
		"EVENT_ARRANGEITEM",	-- ÒÆ¶¯ÎïÆ·À¸ÖÐµÄµÀ¾ß
		"EVENT_DROPITEM",-- ¶ªÆúÎïÆ·
		"EVENT_CHANGEEQUIP",	-- ¸ü»»×°±¸
		"EVENT_TRADE",-- ½»Ò×
		"EVENT_CHANGEFIGHTSTATE",-- ¸Ä±äÕ½¶·×´Ì¬
		"EVENT_ATTACKED",-- ±»¹¥»÷
		"EVENT_DEATH",-- ËÀÍö
		"EVENT_REVIVE",-- ÖØÉú´ò¶Ï
		"EVENT_BUYITEM",-- ÔÚNpc´¦Âò¶«Î÷
		"EVENT_SELLITEM",-- ÔÚNpc´¦Âô¶«Î÷
		"EVENT_TALK",	-- NPC¶Ô»°
	}
	local nEvent = 0
	for j=1, getn(tbEventSring2) do
		local szKey = tbEventSring2[j]		
		nEvent = SetBit(nEvent, tbProgressBar.tbEventType[szKey], 1)
	end
	tbProgressBar.tbConfig[20] = 
	{
		nId = 20,
		szTitle = "§ang më",
		nTime = 2,
		nEvent = nEvent,
		bDesc = 0,
	}
end

function main()
	if CalcFreeItemCellCount() < 4 then
		Talk(1, "", "§Ó b¶o ®¶m t¹i s¶n, xin h·y chõa Ýt nhÊt 4 « trèng trong hµnh trang råi míi më r­¬ng.")
		return
	end
	if tbVnHKBaoRuong:CheckCondition() ~= 1 then		
		return
	end
	if GetTask(tbVnHKBaoRuong.nTSK_Limit_Use_Time) >=2000 then
		Talk(1, "", "Sè lÇn sö dông Ch×a Khãa Hoµng Kim ®· ®¹t giíi h¹n.")
		return
	end
	if not tbProgressBar.tbConfig[20] then
		tbVnHKBaoRuong:InitProgressbar()
	end
	Msg2Player("B¾t ®Çu më r­¬ng")
	tbProgressBar:OpenByConfig(20, tbVnHKBaoRuong._GetAward, {}, %_OnBreak)
end

function tbVnHKBaoRuong:_GetAward()
	if tbVnHKBaoRuong:CheckCondition() ~= 1 then		
		return
	end
	if GetFightState() ~= 0 then
		Talk(1, "", "Chøc n¨ng nµy chØ ho¹t ®éng trong khu vùc phi chiÕn ®Êu.")
		return
	end
	if CalcFreeItemCellCount() < 4 then
		Talk(1, "", "§Ó b¶o ®¶m t¹i s¶n, xin h·y chõa Ýt nhÊt 4 « trèng trong hµnh trang råi míi më r­¬ng.")
		return
	end
	if ConsumeEquiproomItem(1,6,1,30226,1) ~= 1 then
		Msg2Player("Kh«ng cã Ch×a Khãa Hoµng Kim, më r­¬ng thÊt b¹i!!!")
		return
	end	
	SetTask(%tbVnHKBaoRuong.nTSK_Limit_Use_Time, GetTask(%tbVnHKBaoRuong.nTSK_Limit_Use_Time) + 1)
	local nUsedCount = GetTask(%tbVnHKBaoRuong.nTSK_Limit_Use_Time)	
	if nUsedCount > 2000 then
		return
	end
	Msg2Player("<color=green>Tiªu hao 1 Ch×a Khãa Hoµng Kim më r­¬ng thµnh c«ng, nhËn ®­îc 6000000 kinh nghiÖm kh«ng céng dån vµ phÇn th­ëng<color>")
	local tbExpAward = {szName = "§iÓm kinh nghiÖm", nExp = 6000000}
	tbAwardTemplet:Give(tbExpAward, 1 , {"EventHKBaoRuong", "PhanThuongMoRuongHK", "Sè lÇn sö dông: "..nUsedCount})
	--phÇn th­ëng ®¹t mèc 2000
	if nUsedCount == 2000 then		
		local tbSpecialAward = {szName = "B¹ch Hæ LÖnh", tbProp={6,1,2357,1,0,0},nCount=1,}
		tbAwardTemplet:Give(tbSpecialAward, 1 , {"EventHKBaoRuong", "PhanThuongSuDung2000ChiaKhoaHK"})
	end
	if mod(nUsedCount, 100) == 0 then
		tbAwardTemplet:Give(%tbVnHKBaoRuong.tbSpecialAward, 1 , {"EventHKBaoRuong", "PhanThuongMoRuongHK", "Sè lÇn sö dông: "..nUsedCount})
	else
		tbAwardTemplet:Give(%tbVnHKBaoRuong.tbNormalAward, 1 , {"EventHKBaoRuong", "PhanThuongMoRuongHK", "Sè lÇn sö dông: "..nUsedCount})
	end
	if CalcFreeItemCellCount() >= 1 then
		tbMeridanMaterial = {szName = "Hé M¹ch §¬n", tbProp={6,1,3203,1,0,0},nCount=2,}
		tbAwardTemplet:Give(tbMeridanMaterial, 1 , {"EventHKBaoRuong", "PhanThuongHoMachDon", "Sè lÇn sö dông: "..nUsedCount})		
	end
end