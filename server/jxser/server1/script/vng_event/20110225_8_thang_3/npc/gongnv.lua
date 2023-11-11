--Include("\\script\\vng_event\\20110225_8_thang_3\\head.lua")
Include("\\script\\vng_event\\20110225_8_thang_3\\npc\\head.lua")

tbVNGWD2011_GongNV = {}

function tbVNGWD2011_GongNV:addDialog(tbDialog)	
	local now = tonumber(GetLocalDate("%Y%m%d"));
	if (now >= 20110321 or now < 20110307) then
		return
	end	
	tbDialog:AddOptEntry("Ho¹t ®éng mõng ngµy Quèc TÕ Phô N÷",tbVNGWD2011_GongNV.main,{tbVNGWD2011_GongNV})				
end

function tbVNGWD2011_GongNV:main()	
	local tbMainDialog = tbVNGWD2011_NpcHead:CreateDialog()
	if tbVNG_WomenDay2011:IsActive() == 1 then
		tbMainDialog:AddOptEntry("Giíi thiÖu ho¹t ®éng", tbVNGWD2011_GongNV.description, {tbVNGWD2011_GongNV})
		tbMainDialog:AddOptEntry("TÆng Bã Hoa Hång", tbVNGWD2011_NpcHead.ComposeItem, {tbVNGWD2011_NpcHead, "TÆng Bã Hoa Hång"})
		tbMainDialog:AddOptEntry("§æi h¹t mµu s¾c", tbVNGWD2011_NpcHead.ComposeItem, {tbVNGWD2011_NpcHead, "Hîp thµnh H¹t Mµu S¾c"})
	end
	tbMainDialog:AddOptEntry("NhËn phÇn th­ëng bæ sung", tbVNGWD2011_GongNV.GetExtraAward, {tbVNGWD2011_GongNV})
	tbMainDialog:Show()			
end

function tbVNGWD2011_GongNV:description()	
	local tbDescDialog = tbVNGWD2011_NpcHead:CreateDialog()
	tbDescDialog.szTitleMsg = "Thêi gian nµy ®ang diÔn ra ho¹t ®éng mõng ngµy Quèc TÕ Phô N÷. H·y ghÐ th¨m trang chñ cña trß ch¬i ®Ó biÕt thªm chi tiÕt."
	tbDescDialog:AddOptEntry("Trë l¹i", tbVNGWD2011_GongNV.main, {tbVNGWD2011_GongNV})
	tbDescDialog:Show()
end

function tbVNGWD2011_GongNV:GetExtraAward()
	local tbDialog = tbVNGWD2011_NpcHead:CreateDialog()
	tbDialog.szTitleMsg = "Xin chän phÇn th­ëng"
	
	local tbTSK, tbTSK_FLAG = {}
	
	tbTSK = tbVNG_WomenDay2011.tbTaskList.TSK100ROSE
	tbTSK_FLAG = tbVNG_WomenDay2011.tbTaskList.TSK100ROSE_FLAG
	if (tbVNG_BitTask_Lib:getBitTask(tbTSK_FLAG) == 0 and tbVNG_BitTask_Lib:getBitTask(tbTSK) == 1) then
		tbDialog:AddOptEntry("PhÇn th­ëng trao tÆng 100 Bã Hoa Hång", tbVNGWD2011_GongNV.ExtraRoseAward, {tbVNGWD2011_GongNV, 100})
	end
	
	tbTSK = tbVNG_WomenDay2011.tbTaskList.TSK200ROSE
	tbTSK_FLAG = tbVNG_WomenDay2011.tbTaskList.TSK200ROSE_FLAG
	if (tbVNG_BitTask_Lib:getBitTask(tbTSK_FLAG) == 0 and tbVNG_BitTask_Lib:getBitTask(tbTSK) == 1) then
		tbDialog:AddOptEntry("PhÇn th­ëng trao tÆng 200 Bã Hoa Hång", tbVNGWD2011_GongNV.ExtraRoseAward, {tbVNGWD2011_GongNV, 200})
	end
	
	tbTSK = tbVNG_WomenDay2011.tbTaskList.TSK50GIFT
	tbTSK_FLAG = tbVNG_WomenDay2011.tbTaskList.TSK50GIFT_FLAG
	if (tbVNG_BitTask_Lib:getBitTask(tbTSK_FLAG) == 0 and tbVNG_BitTask_Lib:getBitTask(tbTSK) == 1) then
		tbDialog:AddOptEntry("PhÇn th­ëng sö dông 100 Hép quµ", tbVNGWD2011_GongNV.ExtraGiftAward, {tbVNGWD2011_GongNV, 100})
	end
	
	tbTSK = tbVNG_WomenDay2011.tbTaskList.TSK100GIFT
	tbTSK_FLAG = tbVNG_WomenDay2011.tbTaskList.TSK100GIFT_FLAG
	if (tbVNG_BitTask_Lib:getBitTask(tbTSK_FLAG) == 0 and tbVNG_BitTask_Lib:getBitTask(tbTSK) == 1) then
		tbDialog:AddOptEntry("PhÇn th­ëng sö dông 200 Hép quµ", tbVNGWD2011_GongNV.ExtraGiftAward, {tbVNGWD2011_GongNV, 200})
	end
	
	tbTSK = tbVNG_WomenDay2011.tbTaskList.TSK150GIFT
	tbTSK_FLAG = tbVNG_WomenDay2011.tbTaskList.TSK150GIFT_FLAG
	if (tbVNG_BitTask_Lib:getBitTask(tbTSK_FLAG) == 0 and tbVNG_BitTask_Lib:getBitTask(tbTSK) == 1) then
		tbDialog:AddOptEntry("PhÇn th­ëng sö dông 300 Hép quµ", tbVNGWD2011_GongNV.ExtraGiftAward, {tbVNGWD2011_GongNV, 300})
	end
	
	tbTSK = tbVNG_WomenDay2011.tbTaskList.TSK200GIFT
	tbTSK_FLAG = tbVNG_WomenDay2011.tbTaskList.TSK200GIFT_FLAG
	if (tbVNG_BitTask_Lib:getBitTask(tbTSK_FLAG) == 0 and tbVNG_BitTask_Lib:getBitTask(tbTSK) == 1) then
		tbDialog:AddOptEntry("PhÇn th­ëng sö dông 400 Hép quµ", tbVNGWD2011_GongNV.ExtraGiftAward, {tbVNGWD2011_GongNV, 400})
	end
	
	tbDialog:AddOptEntry("Trë l¹i", tbVNGWD2011_GongNV.main, {tbVNGWD2011_GongNV})
	tbDialog:Show()
end

function tbVNGWD2011_GongNV:ExtraRoseAward(nRank)
	local tbAward = {}
	local tbTaskInfo = {}
	if nRank == 100 then
		tbTaskInfo = tbVNG_WomenDay2011.tbTaskList.TSK100ROSE_FLAG
		tbAward = {szName = "§iÓm Kinh NghiÖm", nExp=20000000}
	elseif nRank == 200 then
		tbTaskInfo = tbVNG_WomenDay2011.tbTaskList.TSK200ROSE_FLAG
		tbAward = {szName = "§iÓm Kinh NghiÖm", nExp=40000000}
	end
	tbVNG_BitTask_Lib:setBitTask(tbTaskInfo, 1)
	tbAwardTemplet:GiveAwardByList(tbAward, format("[VNG][8thang3][PhÇn th­ëng tÆng %d Bã Hoa Hång]", nRank))
end

function tbVNGWD2011_GongNV:ExtraGiftAward(nRank)
	local tbAward = {}
	local tbTaskInfo = {}
	if nRank == 100 then
		tbTaskInfo = tbVNG_WomenDay2011.tbTaskList.TSK50GIFT_FLAG
		tbAward = {szName = "§iÓm Kinh NghiÖm", nExp=25000000}
	elseif nRank == 200 then
		tbTaskInfo = tbVNG_WomenDay2011.tbTaskList.TSK100GIFT_FLAG
		tbAward = {szName = "§iÓm Kinh NghiÖm", nExp=50000000}
	elseif nRank == 300 then
		tbTaskInfo = tbVNG_WomenDay2011.tbTaskList.TSK150GIFT_FLAG
		tbAward = {szName = "§iÓm Kinh NghiÖm", nExp=75000000}
	elseif nRank == 400 then
		if (CalcFreeItemCellCount() < 2) then
			Talk(1, "", format("§Ó b¶o vÖ tµi s¶n, xin vui lßng chõa <color=red>%d<color> « trèng trong hµnh trang råi míi nhËn th­ëng!", 2))
			return
		end
		tbTaskInfo = tbVNG_WomenDay2011.tbTaskList.TSK200GIFT_FLAG
		tbAward = 
			{
				{szName="Ngò Hµnh Ên (C­êng hãa)",tbProp={0,3209},nCount=1,nQuality = 1,nExpiredTime = 43200},
				{szName="Ngò Hµnh Ên (Nh­îc hãa)",tbProp={0,3219},nCount=1,nQuality = 1,nExpiredTime = 43200},
			}
	end
	tbVNG_BitTask_Lib:setBitTask(tbTaskInfo, 1)
	tbAwardTemplet:GiveAwardByList(tbAward, format("[VNG][8thang3][PhÇn th­ëng sö dông %d Hép Quµ]", nRank))
end

function tbVNGWD2011_GongNV:onCancel()
end