Include("\\script\\tong\\workshop\\workshop_head.lua")

aLevelHongBaoCoef = {}
aLevelHongBaoPrice = {}
aLevelPriceBag = {}		--¼¤»î×ÓÄ¸´üµÄ»¨·Ñ¹±Ï×¶È
--aLevelPartnerLevel = {} --¼¤»î×ÓÄ¸´üµÄÍ¬°éµÈ¼¶ÐèÇó
function LoadLevelData()
	local b1 = TabFile_Load("\\settings\\tong\\workshop\\liwu_level_data.txt", "liwuLevelData")
	if b1~=1 then
		print("§äc tÖp config lÔ vËt t¸c ph­êng thÊt b¹i!")
		return
	end
	local nRowCount = TabFile_GetRowCount("liwuLevelData")
	for y = 2, nRowCount do
		local nLevel = tonumber(TabFile_GetCell("liwuLevelData", y, "LEVEL"))
		aLevelHongBaoCoef[nLevel] = tonumber(TabFile_GetCell("liwuLevelData", y, "OUTPUT_COEF"))
		aLevelHongBaoPrice[nLevel] = tonumber(TabFile_GetCell("liwuLevelData", y, "PRICE"))
		aLevelPriceBag[nLevel] = tonumber(TabFile_GetCell("liwuLevelData", y, "PRICE_BAG"))
		--aLevelPartnerLevel[nLevel] = tonumber(TabFile_GetCell("liwuLevelData", y, "PARTNER_LEVEL"))
	end
	--TabFile_UnLoad("liwuLevelData")
end
LoadLevelData()

if MODEL_GAMESERVER == 1 or MODEL_RELAY == 1 then
--------------------Èç¹û·Ç¿Í»§¶Ë---------------------------
if MODEL_GAMESERVER == 1 then
IncludeLib("PARTNER")
end

function ws_main(nTongID, nWorkshopID)
	if SVR_CheckUse(nTongID, nWorkshopID, "Tæng qu¶n LÔ phÈm ph­êng") ~= 1 then
		return 0
	end
	Say("<#>Tæng qu¶n LÔ phÈm ph­êng: Ngµy ngµy tÆng ®¹i lÔ, th¸ng th¸ng cã tin vui. TÕt nay kh«ng nhËn lÔ, cã ch¨ng nhËn hång bao!", 3, 
	"NhËn hång bao/#use_g_1_ok".."("..nTongID..","..nWorkshopID..")", "KÝch ho¹t tói hµnh trang/#partner_bag".."("..nTongID..
	","..nWorkshopID..")", "Kh«ng cÇn ®©u/cancel");
	return 1;
end

function partner_bag(nTongID, nWorkshopID)
	local nBagLevel = GetPartnerBagLevel()
	if (nBagLevel >=10 )then
		Say("<#>Tæng qu¶n LÔ phÈm ph­êng: Tói hµnh trang cña ng­¬i ®· më réng hÕt møc råi", 1, "BiÕt råi/cancel")
		return
	end	
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if (nBagLevel >= nLevel)then
		Say("Tæng qu¶n LÔ phÈm ph­êng: HiÖn t¹i tói hµnh trang cña ng­¬i ®¹t cÊp "..nBagLevel..". HiÖn t¹i, ®¼ng cÊp sö dông cña LÔ phÈm ph­êng kh«ng ®ñ ®Ó n©ng cÊp tói hµnh trang.", 
			1, "Lóc kh¸c ta quay l¹i vËy./cancel")
			return
	end
	Say("Tæng qu¶n LÔ phÈm ph­êng: HiÖn t¹i tói hµnh trang cña ng­¬i ®¹t cÊp "..nBagLevel..", sö dông <color=yellow>"..aLevelPriceBag[nBagLevel+1].."<color> ®iÓm cèng hiÕn ®Ó níi réng tói hµnh trang, cã ®ång ý kh«ng?",2,
		"ThËt tèt qu¸, níi réng cµng lín cµng tèt./#YaoBag("..nTongID..","..nWorkshopID..")", "T¹m thêi ch­a cÇn thiÕt./cancel")
end

function YaoBag(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	local nToLevel = GetPartnerBagLevel()+1
	if (nToLevel > nLevel)then
		Say("Tæng qu¶n LÔ phÈm ph­êng: HiÖn t¹i, ®¼ng cÊp sö dông cña LÔ phÈm ph­êng kh«ng ®ñ ®Ó n©ng cÊp tói hµnh trang.", 
			1, "Lóc kh¸c ta quay l¹i vËy./cancel")
			return
	end
	if (GetContribution() < aLevelPriceBag[nToLevel])then
		Say("<#>Tæng qu¶n LÔ phÈm ph­êng: §iÓm cèng hiÕn kh«ng ®ñ, h·y ra søc v× bang héi ®·.", 1, "Kh«ng ®ñ sao/cancel")
		return
	end
	AddContribution(-aLevelPriceBag[nToLevel])
	SetPartnerBagLevel(nToLevel)
	Say("<#>Tæng qu¶n LÔ phÈm ph­êng: H·y tin t­ëng vµo kh¶ n¨ng cña ta, ng­¬i xem, tói hµnh trang cña ng­¬i "..nToLevel.."®· lµm xong råi, sau nµy cã thÓ ®Õn nhËn nhiÒu hång bao h¬n.", 1, 
		"Qu¶ nhiªn danh bÊt h­ truyÒn/cancel")
	Msg2Player("Tói hµnh trang ®· ®¹t cÊp "..nToLevel..", kh«ng gian chøa lín h¬n ")
end
----------------------------------------------------------------------------------------------------
function MAINTAIN_R(nTongID, nWorkshopID) --ÈÕ³£»î¶¯
	if nWorkshopID <= 0 then
		return 0
	end	
	local eType = TWS_GetType(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	local nTotal = floor(aLevelHongBaoCoef[nLevel]*(TONG_GetMemberCount(nTongID)) * 100)
	TWS_ApplyAddDayOutput(nTongID, nWorkshopID, nTotal) --³õÊ¼»¯¿ÉÁìÈ¡ºì°üÊý
	return 1
end

function USE_R(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if nLevel < 1 then
		return 0
	end
	local nHongbaoLeft = TWS_GetDayOutput(nTongID, nWorkshopID);
	if (TWS_IsOpen(nTongID, nWorkshopID) ~= 1 or nHongbaoLeft < 100) then
		return 0
	end
	TWS_ApplyAddDayOutput(nTongID, nWorkshopID, -100);
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_WSCONSUME, aLevelHongBaoPrice[1])
	return 1;
end

function USE_G_1(nTongID, nWorkshopID)
	ws_main(nTongID, nWorkshopID)
end

function use_g_1_ok(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	_dbgMsg("Sè nhËp vµo cßn l¹i *100: "..TWS_GetDayOutput(nTongID, nWorkshopID))
	if (TWS_GetDayOutput(nTongID, nWorkshopID) < 100) then
		Say("<#>Tæng qu¶n LÔ phÈm ph­êng: ThËt ®¸ng tiÕc, h«m nay lÔ phÈm ®· ph¸t xong, ngµy mai h·y ®Õn vËy!", 0)
		return 0;
	end
	Say("<#>Tæng qu¶n LÔ phÈm ph­êng: CÇn sö dông <color=yellow>"..aLevelHongBaoPrice[nLevel].."<color> ®iÓm cèng hiÕn ®Ó ®æi lÊy 1 hång bao", 2, 
		"§­îc. /#use_g_1_ok2".."("..nTongID..","..nWorkshopID..")", "Kh«ng muèn/cancel");
end

function use_g_1_ok2(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if (GetContribution() < aLevelHongBaoPrice[nLevel]) then
		Say("<#>Tæng qu¶n LÔ phÈm ph­êng: ThËt ®¸ng tiÕc, ®iÓm cèng hiÕn kh«ng ®ñ, kh«ng thÓ nhËn ®¹i hång bao!", 0)
		return
	end
	if (GetTaskTemp(196) ~= 0)then
		Say("<#>Tæng qu¶n LÔ phÈm ph­êng: VËt phÈm nµy ch­a cã, h·y ®îi khi kh¸c!", 0)
		return
	end
	if CalcFreeItemCellCount() < 2 then
		Talk(1, "", "Hµnh trang ph¶i cã hai « trèng.");
		return 
	end
	SetTaskTemp(196, 1)
	TWS_ApplyUse(nTongID, nWorkshopID);
end

function USE_G_2(nTongID, nWorkshopID)
	SetTaskTemp(196, 0)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if (GetContribution() < aLevelHongBaoPrice[nLevel]) then
		return
	end
	AddContribution(-aLevelHongBaoPrice[nLevel]);
	Msg2Player("B¹n tiªu tèn "..aLevelHongBaoPrice[nLevel].."®iÓm cèng hiÕn, nhËn ®­îc 1 c¸i bang héi thÇn bÝ hång bao!");
	AddItem(6, 1, 1021, 1, 0, 0, 0);
end
function cancel()
end

else
-----------------Èç¹ûÊÇ¿Í»§¶Ë---------------
function GET_DESC(nTongID, nWorkshopID, nType)
	if (nTongID == 0) then
		return "<color=water>Kh«ng cã bang héi"	
	end
	local bOpen	--ÊÇ·ñ¿ªÆô
	local bPause --ÊÇ·ñÔÝÍ£
	local nCurLevel --µ±Ç°µÈ¼¶
	local nUseLevel --µ±Ç°Ê¹ÓÃµÈ¼¶
	local nOpenFund --µ±Ç°¿ªÆôÏûºÄ
	local nMaintainFund --µ±Ç°Î¬»¤ÏûºÄ
	local nPrice  --µ±Ç°»»È¡ÉñÃØºì°üµÄ¹±Ï×¶È
	local dHongBaoCount	--µ±Ç°Ã¿ÈÕÉñÃØºì°üÈÕ²ú³öÊýÁ¿ÉÏÏÞ
	if (nWorkshopID ~= 0)then
		bOpen = TWS_IsOpen(nTongID, nWorkshopID) 
		bPause = TONG_GetPauseState(nTongID) 
		nCurLevel = TWS_GetLevel(nTongID, nWorkshopID) 
		nUseLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
		nOpenFund = wsGetOpenCost(nTongID, nType, nUseLevel) 
		nMaintainFund = wsGetMaintainCost(nTongID, nType, nUseLevel, bOpen)  
		if(nUseLevel > 0)then
			nPrice = aLevelHongBaoPrice[nUseLevel]
			dHongBaoCount = format("%.2f", aLevelHongBaoCoef[nUseLevel] / aLevelHongBaoCoef[1])	
		else
			nPrice = "--"
			dHongBaoCount = "--"
		end
	else	--×÷·»Î´½¨Á¢Ê±Ö»ÏÔÊ¾ÏÂÒ»¼¶ÐÅÏ¢
		nCurLevel = 0
		bOpen = 1
		nUseLevel = 0
	end
	--ÏÂ¼¶ÐÅÏ¢
	local nUpgradeCostFund, nNextMaintainFund, nNextPrice, nNextOpenFund, dNextHongBaoCount
	if (nCurLevel < wsGetMaxLevel(nTongID, nType))then
		nUpgradeCostFund = wsGetUpgradeCostFund(nTongID, nType, nCurLevel)  --Éý¼¶ÏûºÄ
	else
		nUpgradeCostFund = "--"
	end
	if (nUseLevel < wsGetMaxLevel(nTongID, nType))then		
		nNextMaintainFund = wsGetMaintainCost(nTongID, nType, nUseLevel+1, bOpen)  --ÏÂ¼¶Î¬»¤ÏûºÄ
		nNextOpenFund = wsGetOpenCost(nTongID, nType, nUseLevel+1) 	--ÏÂ¼¶¿ªÆôÏûºÄ
		nNextPrice = aLevelHongBaoPrice[nUseLevel + 1] --ÏÂ¼¶»»È¡ÉñÃØºì°üµÄ¹±Ï×¶È
		dNextHongBaoCount = format("%.2f", aLevelHongBaoCoef[nUseLevel + 1] / aLevelHongBaoCoef[1]) --ÏÂ¼¶Ã¿ÈÕÉñÃØºì°üÈÕ²ú³öÊýÁ¿ÉÏÏÞ
	else
		nNextMaintainFund = "--"
		nNextOpenFund = "--"
		nNextPrice = "--"
		dNextHongBaoCount = "--"
	end	
	if (nWorkshopID ~= 0)then
		local state 
		if bPause == 1 then state="<color=yellow>T¹m ngõng" elseif bOpen == 1 then state="<color=green>Khai më" else state="<color=red>§ãng cöa" end
		local szMsg = "Tr¹ng th¸i t¸c ph­êng: "..state.."<color>\n"..
			"§¼ng cÊp t¸c ph­êng: <color=gold>"..nCurLevel.."<color>\n"..
			"§¼ng cÊp sö dông hiÖn t¹i: <color=gold>"..nUseLevel.."<color>\n"..
			"S¶n l­îng thÇn bÝ hång bao mçi ngµy t¨ng lªn: <color=gold>"..dHongBaoCount.."<color> lÇn\n"..		
			"§iÓm cèng hiÕn ®Ó ®æi lÊy hång bao: <color=gold>"..nPrice.."<color>\n"..
			"Ng©n s¸ch chiÕn bÞ chi cho phÝ b¶o tr× bang mçi ngµy: <color=gold>"..nMaintainFund.." v¹n<color>\n"..
			"Ng©n s¸ch kiÕn thiÕt ban ®Çu: <color=gold>"..nOpenFund.." v¹n<color>\n"..
			"Ng©n s¸ch kiÕn thiÕt ®Ó n©ng cÊp: <color=gold>"..nUpgradeCostFund.." v¹n<color>\n"..
			"<color=green>§¼ng cÊp sö dông kÕ tiÕp <color>\n"..
			"<color=water>S¶n l­îng thÇn bÝ hång bao mçi ngµy t¨ng lªn: <color=Violet>"..dNextHongBaoCount.."<color> lÇn\n"..	
			"§iÓm cèng hiÕn ®Ó ®æi lÊy hång bao: <color=Violet>"..nNextPrice.."<color>\n"..
			"Ng©n s¸ch chiÕn bÞ chi cho phÝ b¶o tr× bang mçi ngµy: <color=Violet>"..nNextMaintainFund.." v¹n<color>\n"..
			"Ng©n s¸ch kiÕn thiÕt ban ®Çu: <color=Violet>"..nNextOpenFund.." v¹n<color>\n"
		return szMsg
	else
		local szMsg = "Tr¹ng th¸i t¸c ph­êng: <color=water>Ch­a thµnh lËp<color>\n"..
			"Ng©n s¸ch kiÕn thÕt cÇn ®Ó x©y dùng: <color=gold>"..nUpgradeCostFund.." v¹n<color>\n"..
			"<color=green>§¼ng cÊp kÕ tiÕp <color>\n"..
			"<color=water>S¶n l­îng thÇn bÝ hång bao mçi ngµy t¨ng lªn: <color=Violet>"..dNextHongBaoCount.."<color> lÇn\n"..	
			"§iÓm cèng hiÕn ®Ó ®æi lÊy hång bao: <color=Violet>"..nNextPrice.."<color>\n"..
			"Ng©n s¸ch chiÕn bÞ chi cho phÝ b¶o tr× bang mçi ngµy: <color=Violet>"..nNextMaintainFund.." v¹n<color>\n"..
			"Ng©n s¸ch kiÕn thiÕt ban ®Çu: <color=Violet>"..nNextOpenFund.." v¹n<color>\n"
		return szMsg
	end
end

end