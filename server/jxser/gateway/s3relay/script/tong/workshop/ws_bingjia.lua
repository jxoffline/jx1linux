Include("\\script\\tong\\workshop\\workshop_head.lua")

aLevelCoef = {}
aLevelScale = {}
aLevelStoneValue = {}
aLevelLingPaiPrice	=	{};		--BossÕÙ»½·ûµÈ¼¶°ï»á×Ê½ðÐèÇó
function LoadLevelData()
	local b1 = TabFile_Load("\\settings\\tong\\workshop\\bingjia_level_data.txt", "bingjiaLevelData")
	if b1~=1 then
		print("§äc tÖp config binh gi¸p ph­êng thÊt b¹i!")
		return
	end
	local nRowCount = TabFile_GetRowCount("bingjiaLevelData")
	for y = 2, nRowCount do
		local nLevel = tonumber(TabFile_GetCell("bingjiaLevelData", y, "LEVEL"))
		aLevelCoef[nLevel] = tonumber(TabFile_GetCell("bingjiaLevelData", y, "OUTPUT_COEF"))
		aLevelScale[nLevel] = tonumber(TabFile_GetCell("bingjiaLevelData", y, "SCALE"))
		aLevelStoneValue[nLevel] = tonumber(TabFile_GetCell("bingjiaLevelData", y, "STONE_VALUE"))	
		aLevelLingPaiPrice[nLevel] = tonumber(TabFile_GetCell("bingjiaLevelData", y, "LINGPAI_PRICE"))
	end
	--TabFile_UnLoad("bingjiaLevelData")
end
LoadLevelData()

if MODEL_GAMESERVER == 1 or MODEL_RELAY == 1 then
--------------------Èç¹û·Ç¿Í»§¶Ë---------------------------
	if MODEL_GAMESERVER == 1 then	--GAMESERVER ²ÅÓÐµÄ
		Include("\\script\\item\\techan_zijingao.lua");
	end;

function ws_main(nTongID, nWorkshopID)
	if SVR_CheckUse(nTongID, nWorkshopID, "Tæng qu¶n Binh gi¸p ph­êng") ~= 1 then
		return 0
	end
	local aryszContent = {
		"NhËn TrÊn bang chi th¹ch/#use_g_1".."("..nTongID..","..nWorkshopID..")",
		"ChÕ t¹o trang bÞ/#use_g_2".."("..nTongID..","..nWorkshopID..")",
	}
	
	if (GetProductRegion() == "cn") then
		tinsert(aryszContent, "NhËn Tö kim cµo/#use_zijingao("..nTongID..","..nWor);
	elseif(GetProductRegion() == "vn") then
		tinsert(aryszContent, "NhËn lÖnh bµi gäi Boss/#use_g_4_ok("..nTongID..","..nWorkshopID..")");
	end;
	
	tinsert(aryszContent, "Kh«ng cÇn ®©u/cancel");
	
	Say("<#>Tæng qu¶n Binh gi¸p ph­êng: Muèn chÕ t¹o thÇn binh lîi khÝ, ngoµi viÖc ph¶i cã vËt liÖu cÇn thiÕt, cßn ph¶i tr«ng chê ë thiªn c¬! TrÊn bang chi th¹ch lµ vËt hÊp thô ®­îc linh khÝ cña ®Êt trêi, tinh hoa cña nhËt nguyÖt, cã thÓ n©ng cao ®­îc x¸c suÊt thµnh c«ng!", 
		getn(aryszContent), 
		aryszContent);
	return 1;
end

----------------------------------------------------------------------------------------------
--//////////////////
--×Ï½ð¸ä
--Ã¿´Î¹ºÂò8Ð¡Ê±(8*60)£¬Ê±¼ä¼Çµ½TaskID1739
--µ±½ÇÉ«ÔÚÌÒ»¨µºÊ±£¬ÓÐ³ÌÐò¸øÓëÍÚ³öµÄÎïÆ·£¬²¢¿Û³ýÊ±¼ä£¬Í¬ÆÕÍ¨¿ó¸ä


function use_zijingao(nTongID, nWorkshopID)
	Say("<#>Tæng qu¶n Binh gi¸p ph­êng: 'Tö Kim Cµo cã thÓ gióp ng­¬i ®µo kho¸ng trªn §µo hoa ®¶o, sö dông nã cã thÓ nhanh chãng t×m ®­îc huyÒn tinh kho¸ng th¹ch cÊp 6 trë lªn, thÇn bÝ kho¸ng th¹ch vµ c¸c lo¹i ®¸ khã t×m kh¸c. Tö Kim Cµo cã thêi gian sö dông lµ 8 giê, ®Ó së h÷u 1 Tö Kim Cµo cÇn sö dông <color=yellow>"..VALUE_ZIJIGAO_CONTRIBUTION.."<color> ®iÓm cèng hiÕn, ng­¬i ®ång ý kh«ng?", 4,
	"<#>TiÕp nhËn 1 Tö Kim Cµo/#bj_sure2zijingao("..nTongID..","..nWorkshopID..")",
	"<#>Tra xem thêi gian cßn l¹i cña Tö Kim Cµo/bj_checktime_zijin",
	"<#> T×m hiÓu Tö Kim Cµo/bj_help_zijigao",
	"<#>Rêi khái/cancel")
end

function bj_help_zijigao()
	Say("<#>Tæng qu¶n Binh gi¸p ph­êng: Ng­¬i cã thÓ mang Tö Kim Cµo lªn §µo Hoa §¶o ®Ó ®µo kho¸ng th¹ch quÝ b¸u. L­u ý lµ kh«ng thÓ dïng Tö Kim Cµo chung víi c¸c c«ng cô ®µo kho¸ng th­êng kh¸c. NÕu dïng chung th× tr­íc tiªn sÏ trõ thêi gian sö dông Tö Kim Cµo, sau ®ã lµ ®Õn c«ng cô kia. ", 0)
end

function bj_sure2zijingao(nTongID, nWorkshopID)
	local bPause = TONG_GetPauseState(nTongID)
	if (bPause == 1) then
		Say("<#>Tæng qu¶n Binh gi¸p ph­êng: ThËt ®¸ng tiÕc, hiÖn nay Binh gi¸p ph­êng ®ang t¹m ng­ng ho¹t ®éng. CÇn ph¶i chuyÓn ng©n s¸ch bang héi vµo ng©n s¸ch chiÕn bÞ b¶o tr× hµng tuÇn, th× 24h00 ngµy h«m ®ã míi cã thÓ khai më l¹i T¸c Ph­êng.", 0)
		Msg2Player("<#>T¸c Ph­êng t¹m ng­ng ho¹t ®éng, chøc n¨ng nµy kh«ng thÓ sö dông.")
		return
	end
	local szTongName , nTongID = GetTongName()
	if (nTongID == 0) then
		Say("<#>Tæng qu¶n Binh gi¸p ph­êng: §¹i hiÖp vÉn ch­a gia nhËp bang héi, ®Õn t×m ta cã viÖc g×?", 0)
		return 
	end
	local nUseLevel = TWS_GetUseLevel(nTongID, nWorkshopID)	--»ñµÃÊ¹ÓÃµÈ¼¶
	if (nUseLevel < 7) then
		Say("<#>Tæng qu¶n Binh gi¸p ph­êng: ThËt ®¸ng tiÕc, ®¼ng cÊp sö dông cña Binh gi¸p ph­êng ch­a ®¹t cÊp 7, kh«ng thÓ tiÕp nhËn bang vËt.", 0)
		Msg2Player("<#>§¼ng cÊp sö dông cña t¸c ph­êng ch­a ®¹t cÊp 7 th× ch­a sö dông ®­îc.")
		return
	end
	if (TWS_GetDayOutput(nTongID, nWorkshopID) < (VALUE_ZIJIGAO_CONTRIBUTION )) then
		Say("<#>Tæng qu¶n Binh gi¸p ph­êng: H«m nay Tö Kim Cµo ®· ph©n ph¸t hÕt råi, ngµy mai h·y ®Õn vËy!", 0)
		return
	end
	
	if (GetContribution() < VALUE_ZIJIGAO_CONTRIBUTION or AddContribution(-VALUE_ZIJIGAO_CONTRIBUTION) ~= 1)then
		Say("<#>Tæng qu¶n Binh gi¸p ph­êng: Kh«ng ®­îc råi, ®iÓm cèng hiÕn cña ng­¬i kh«ng ®ñ <color=yellow>"..VALUE_ZIJIGAO_CONTRIBUTION.."<color> ®iÓm, kh«ng thÓ ®æi lÊy bang vËt.", 0)
		Msg2Player("<#>§iÓm cèng hiÕn c¸ nh©n kh«ng ®ñ, kh«ng thÓ sö dông chøc n¨ng nµy.")
		return 0
	end
	
	TWS_ApplyAddDayOutput(nTongID, nWorkshopID, -(VALUE_ZIJIGAO_CONTRIBUTION ))
	nRestH, nRestM = addzijingao_main();
	Msg2Player("<#>B¹n ®· mua thµnh c«ng 1 Tö Kim Cµo, thêi gian sö dông cßn l¹i lµ "..nRestH.."giê "..nRestM.."phót.")
	Say("<#>Tæng qu¶n Binh gi¸p ph­êng: B¹n ®· mua ®­îc 1 Tö Kim Cµo, thêi gian sö dông cßn l¹i lµ "..nRestH.."giê "..nRestM.."phót.", 0)
end

function bj_checktime_zijin()
	local lasttime = GetTask(TASKID_TECHAN_ZIJINGAO)
	if (lasttime < 10) then
		Say("<#>Tæng qu¶n Binh gi¸p ph­êng: ThËt ®¸ng tiÕc, Tö Kim Cµo nµy ®· bÞ háng, cÇn ph¶i mua c¸i kh¸c.", 0)
	else
		local nRestH, nRestM = GetMinAndSec(lasttime)
		if (nRestH == 0) then
			Say("<#>Tæng qu¶n Binh gi¸p ph­êng: Tö Kim Cµo nµy vÉn cßn sö dông ®­îc<color=yellow>"..nRestM.."<color> phót.", 0)
		else
			Say("<#>Tæng qu¶n Binh gi¸p ph­êng: Tö Kim Cµo nµy vÉn cßn sö dông ®­îc<color=yellow>"..nRestH.."<color> giê <color=yellow>"..nRestM.."<color> phót.", 0)
		end
	end
end

-----½«Ãë´«»»³É·ÖÓëÃë£¬±ÈÈç62s = 1m2s
function GetMinAndSec(nSec)
nRestMin = floor(nSec / 60);
nRestSec = mod(nSec,60)
return nRestMin, nRestSec;
end;



--------
----------------------------------------------------
function MAINTAIN_R(nTongID, nWorkshopID) --ÈÕ³£»î¶¯
	if nWorkshopID <= 0 then
		return 0
	end	
	local eType = TWS_GetType(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	local nTotal = floor(aLevelCoef[nLevel]*(TONG_GetMemberCount(nTongID)))
	TWS_ApplyAddDayOutput(nTongID, nWorkshopID, nTotal) --³õÊ¼»¯¿ÉÁìÈ¡Ê¯Í·×Ü¼ÛÖµÁ¿
	return 1
end

function USE_R(nTongID, nWorkshopID, nUse)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if nLevel < 1 then
		return 0
	end
	local nLeft = TWS_GetDayOutput(nTongID, nWorkshopID);
	if (nUse ~= 4) then
		if (TWS_IsOpen(nTongID, nWorkshopID) ~= 1 or nLeft <= 0) then
			return 0
		end	
	else
		if (TWS_IsOpen(nTongID, nWorkshopID) ~= 1 or nLeft < 100) then
			return 0
		end
		if (TONG_GetBuildFund(nTongID) < aLevelLingPaiPrice[nLevel]) then
			return 0
		end
		if (TONG_ApplyAddBuildFund(nTongID, -aLevelLingPaiPrice[nLevel]) ~= 1) then
			return 0
		end

		TWS_ApplyAddDayOutput(nTongID, nWorkshopID,  -100)
		TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_WSCONSUME, 2688)
		TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_BFCONSUME, aLevelLingPaiPrice[nLevel])	
	end;
	return 1	
end

function USE_G_1(nTongID, nWorkshopID)
	ws_main(nTongID, nWorkshopID)
end


function use_g_1(nTongID, nWorkshopID)
	if (TWS_GetDayOutput(nTongID, nWorkshopID) <= 0) then
		Say("<#>Tæng qu¶n Binh gi¸p ph­êng: TrÊn bang chi th¹ch ngµy h«m nay ®· ph©n ph¸t hÕt råi, ngµy mai h·y ®Õn vËy!", 0)
		return 0;
	end
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	TWS_ApplyUse(nTongID, nWorkshopID, 1)
end

function use_g_2(nTongID, nWorkshopID)
	Say("<#>Tæng qu¶n Binh gi¸p ph­êng: T¹i ®©y, ng­¬i cã thÓ kh¶m n¹m trang bÞ huyÒn tinh vµ trang bÞ Hoµng Kim, trÊn bang chi th¹ch gióp t¨ng x¸c suÊt thµnh c«ng vµ t¨ng chÊt l­îng thuéc tÝnh ë trang bÞ huyÒn tinh!", 2, "B¾t ®Çu chÕ t¹o/#compound("..nTongID..","..
		nWorkshopID..",".."2)", "Kh«ng cÇn!/cancel")
end		

function use_g_3(nTongID, nWorkshopID)
	Say("<#>Tæng qu¶n Binh gi¸p ph­êng: Sö dông héi t©m cã thÓ kh¶m n¹m ®­îc trang bÞ huyÒn tinh tèt, nh­ng c¸i gi¸ kh«ng nhá chót nµo!", 2, "B¾t ®Çu chÕ t¹o/#compound("..nTongID..","..
		nWorkshopID..",".."3)", "Kh«ng cÇn!/cancel")
end

function use_g_4_ok(nTongID, nWorkshopID)
	local nTongLevel = TONG_GetBuildLevel(nTongID)
	if (nTongLevel < 2)then
		Say("<#>Tæng qu¶n Binh gi¸p ph­êng: §¼ng cÊp kiÕn thiÕt bang ®¹t ®Õn cÊp <color=red>2<color> míi cã thÓ chÕ t¹o LÖnh bµi gäi Boss!", 0)
		return
	end
	if (TONGM_CheckRight(nTongID, GetName(), RIGHTID_WORKSHOP) ~= 1) then
		Say("<#>Tæng qu¶n Binh gi¸p ph­êng: Kh«ng cã quyÒn qu¶n lý t¸c ph­êng, kh«ng thÓ nhËn lÖnh bµi gäi Boss!", 0)
		return
	end
	_dbgMsg("Sè lÇn nhËn cßn l¹i * 100: "..TWS_GetDayOutput(nTongID, nWorkshopID))
	if (TWS_GetDayOutput(nTongID, nWorkshopID) < 100) then
		Say("<#>Tæng qu¶n Binh gi¸p ph­êng: H«m nay ®· ph¸t xong lÖnh bµi gäi Boss, ngµy mai h·y ®Õn vËy!", 0)
		return 0;
	end
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	Say("<#>Tæng qu¶n Binh gi¸p ph­êng: CÇn sö dông <color=water>"..aLevelLingPaiPrice[nLevel].."<color> v¹n ng©n s¸ch kiÕn thiÕt bang ®Ó nhËn 1 lÖnh bµi gäi Boss, ng­¬i ®ång ý kh«ng?", 2,
		"TiÕp nhËn/#use_g_4_ok2".."("..nTongID..","..nWorkshopID..")", "Hñy bá /cancel")
end

function use_g_4_ok2(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if (TONG_GetBuildFund(nTongID) < aLevelLingPaiPrice[nLevel]) then
		Say("<#>Tæng qu¶n Binh gi¸p ph­êng: ThËt ®¸ng tiÕc, ng©n s¸ch kiÕn thiÕt bang kh«ng ®ñ, kh«ng thÓ nhËn!", 0)
		return
	end
	TWS_ApplyUse(nTongID, nWorkshopID, 4)
end


function compound(nTongID, nWorkshopID, nSel)
	TWS_ApplyUse(nTongID, nWorkshopID, nSel)
end

function _makefun(nTongID, nWorkshopID, nLevelStone)
	return nLevelStone.."cÊp/#stone("..nTongID..","..nWorkshopID..","..nLevelStone..")"
end

function USE_G_2(nTongID, nWorkshopID, nChose)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if (nChose == 1)then --Õò°ïÖ®Ê¯
		Sale(166, CURRENCYTYPE_CONTRIBUTION, aLevelScale[nLevel], "BuyCallBack1(%d,%d,"..nTongID..","..nWorkshopID..")")
	elseif(nChose == 2)then --ÆÕÍ¨´òÔì
		FoundryItem(4)
	elseif(nChose == 3)then	--»áÐÄ´òÔì
		FoundryItem(2)
	elseif(nChose == 4) then
		local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
		local szMsg = GetName().." tiªu tèn "..aLevelLingPaiPrice[nLevel].." v¹n ng©n s¸ch kiÕn thiÕt bang ®Ó ®æi lÊy 1 lÖnh bµi gäi Boss cÊp "..nLevel.."!"
		Msg2Tong(nTongID, szMsg)
		TONG_ApplyAddEventRecord(nTongID, szMsg)
		AddItem(6, 1, 1022, nLevel, 0, 0, 0);
	end	
end

function BuyCallBack1(nItemIdx, nPrice, nTongID, nWorkshopID)
	local nValue = TWS_GetDayOutput(nTongID, nWorkshopID)
	_dbgMsg("Gi¸ trÞ l­îng cßn l¹i"..nValue)
	local nLevel = GetItemLevel(nItemIdx)
	local nOutputValue = aLevelStoneValue[nLevel]
	if (nValue < nOutputValue)then
		CloseShop()
		Say("<#>Tæng qu¶n Binh gi¸p ph­êng: TrÊn bang chi th¹ch ngµy h«m nay ®· ph©n ph¸t hÕt råi, ngµy mai h·y ®Õn vËy!", 0)
		return 0
	end	
	TWS_ApplyAddDayOutput(nTongID, nWorkshopID, -nOutputValue)
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_WSCONSUME, aLevelStoneValue[nLevel]/10000)
	return 1
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
	local nScale  --µ±Ç°»»È¡Õò°ïÖ®Ê¯ÕÛ¿Û
	local dStoneCount	--µ±Ç°Ã¿ÈÕ»»È¡Õò°ïÖ®Ê¯×ÜÁ¿Ìá¸ß
	local nPrice  --µ±Ç°»»È¡bossÕÙ»½·ûµÄ½¨Éè»ù½ð
	local dTokenCount	--µ±Ç°Ã¿ÈÕbossÕÙ»½·û²ú³ö×ÜÁ¿Ìá¸ß
	local nDoubleOdds  --µ±Ç°ÕÙ»½³ö2¸ö»Æ½ðBossµÄ¼¸ÂÊ
	if (nWorkshopID ~= 0)then
		bOpen = TWS_IsOpen(nTongID, nWorkshopID) 
		bPause = TONG_GetPauseState(nTongID) 
		nCurLevel = TWS_GetLevel(nTongID, nWorkshopID) 
		nUseLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
		nOpenFund = wsGetOpenCost(nTongID, nType, nUseLevel) 
		nMaintainFund = wsGetMaintainCost(nTongID, nType, nUseLevel, bOpen)  
		if(nUseLevel > 0)then
			nScale = format("%.1f",aLevelScale[nUseLevel] / 10)
			dStoneCount = format("%.2f", aLevelCoef[nUseLevel] / aLevelCoef[1])	
			nPrice = aLevelLingPaiPrice[nUseLevel]
			dTokenCount = format("%.2f", aLevelCoef[nUseLevel] / aLevelCoef[1])	
			nDoubleOdds = 160 - (nUseLevel - 1) * 10
		else
			nScale = "--"
			dStoneCount = "--"
			nPrice = "--"
			dTokenCount = "--"
			nDoubleOdds = "--"
		end
	else	--×÷·»Î´½¨Á¢Ê±Ö»ÏÔÊ¾ÏÂÒ»¼¶ÐÅÏ¢
		nCurLevel = 0
		bOpen = 1
		nUseLevel = 0
	end
	--ÏÂ¼¶ÐÅÏ¢
	local nUpgradeCostFund, nNextMaintainFund, nNextScale, nNextOpenFund, dNextStoneCount, nNextPrice, dNextTokenCount,nNextDoubleOdds
	if (nCurLevel < wsGetMaxLevel(nTongID, nType))then
		nUpgradeCostFund = wsGetUpgradeCostFund(nTongID, nType, nCurLevel)  --Éý¼¶ÏûºÄ
	else
		nUpgradeCostFund = "--"	
	end
	if (nUseLevel < wsGetMaxLevel(nTongID, nType))then
		nNextMaintainFund = wsGetMaintainCost(nTongID, nType, nUseLevel+1, bOpen)  --ÏÂ¼¶Î¬»¤ÏûºÄ
		nNextOpenFund = wsGetOpenCost(nTongID, nType, nUseLevel+1) 	--ÏÂ¼¶¿ªÆôÏûºÄ
		nNextScale = format("%.1f",aLevelScale[nUseLevel + 1] / 10) --ÏÂ¼¶»»È¡Õò°ïÖ®Ê¯ÕÛ¿Û
		dNextStoneCount = format("%.2f", aLevelCoef[nUseLevel + 1] / aLevelCoef[1]) --ÏÂ¼¶Ã¿ÈÕ»»È¡Õò°ïÖ®Ê¯×ÜÁ¿Ìá¸ß
		nNextPrice = aLevelLingPaiPrice[nUseLevel + 1] --ÏÂ¼¶»»È¡bossÕÙ»½·ûµÄ½¨Éè»ù½ð
		dNextTokenCount = format("%.2f", aLevelCoef[nUseLevel + 1] / aLevelCoef[1]) --ÏÂ¼¶Ã¿ÈÕbossÕÙ»½·û²ú³ö×ÜÁ¿Ìá¸ß
		nNextDoubleOdds = 160 - nCurLevel * 10 --ÏÂ¼¶ÕÙ»½³ö2¸ö»Æ½ðBossµÄ¼¸ÂÊ
	else
		nNextMaintainFund = "--"
		nNextOpenFund = "--"
		nNextScale = "--"
		dNextStoneCount = "--"
		nNextPrice = "--"
		dNextTokenCount = "--"
		nNextDoubleOdds = "--"
	end	
	if (nWorkshopID ~= 0)then
		local state 
		if bPause == 1 then state="<color=yellow>T¹m ngõng" elseif bOpen == 1 then state="<color=green>Khai më" else state="<color=red>§ãng cöa" end
		local szMsg = "Tr¹ng th¸i t¸c ph­êng: "..state.."<color>\n"..
			"§¼ng cÊp t¸c ph­êng: <color=gold>"..nCurLevel.."<color>\n"..
			"§¼ng cÊp sö dông hiÖn t¹i: <color=gold>"..nUseLevel.."<color>\n"..
			"Sè l­îng trÊn bang chi th¹ch mçi ngµy t¨ng lªn: <color=gold>"..dStoneCount.."<color> lÇn\n"..		
			"Gi¸ ­u ®·i ®æi TrÊn Bang Chi Th¹ch: <color=gold>"..nScale.."<color> phÇn tr¨m\n"..
			"Sè lÖnh bµi gäi Boss t¹o ra mçi ngµy t¨ng lªn: <color=gold>"..dTokenCount.."<color> lÇn\n"..	
			"X¸c suÊt lÖnh bµi gäi ra Boss thø 2: <color=gold>1/"..nDoubleOdds.."<color>\n"..		
			"Ng©n s¸ch kiÕn thiÕt cÇn ®Ó ®æi lÖnh bµi gäi Boss: <color=gold>"..nPrice.." v¹n<color>\n"..
			"Ng©n s¸ch chiÕn bÞ chi cho phÝ b¶o tr× bang mçi ngµy: <color=gold>"..nMaintainFund.." v¹n<color>\n"..
			"Ng©n s¸ch kiÕn thiÕt ban ®Çu: <color=gold>"..nOpenFund.." v¹n<color>\n"..
			"Ng©n s¸ch kiÕn thiÕt ®Ó n©ng cÊp: <color=gold>"..nUpgradeCostFund.." v¹n<color>\n"..
			"<color=green>§¼ng cÊp sö dông kÕ tiÕp <color>\n"..
			"<color=water>S¶n l­îng trÊn bang chi th¹ch mçi ngµy t¨ng lªn: <color=Violet>"..dNextStoneCount.."<color> lÇn\n"..	
			"§æi ®iÓm ­u ®·i TrÊn bang chi th¹ch: <color=Violet>"..nNextScale.."<color> phÇn tr¨m\n"..
			"X¸c suÊt lÖnh bµi gäi ra Boss thø 2: <color=Violet>1/"..nNextDoubleOdds.."<color>\n"..	
			"Ng©n s¸ch kiÕn thiÕt cÇn ®Ó ®æi lÖnh bµi gäi Boss: <color=Violet>"..nNextPrice.." v¹n<color>\n"..
			"Ng©n s¸ch chiÕn bÞ chi cho phÝ b¶o tr× bang mçi ngµy: <color=Violet>"..nNextMaintainFund.." v¹n<color>\n"..
			"Ng©n s¸ch kiÕn thiÕt ban ®Çu: <color=Violet>"..nNextOpenFund.." v¹n<color>\n"
		return szMsg
	else
		local szMsg = "Tr¹ng th¸i t¸c ph­êng: <color=water>Ch­a thµnh lËp<color>\n"..
			"Ng©n s¸ch kiÕn thÕt cÇn ®Ó x©y dùng: <color=gold>"..nUpgradeCostFund.." v¹n<color>\n"..
			"<color=green>§¼ng cÊp kÕ tiÕp <color>\n"..
			"<color=water>S¶n l­îng trÊn bang chi th¹ch mçi ngµy t¨ng lªn: <color=Violet>"..dNextStoneCount.."<color> lÇn\n"..	
			"§æi ®iÓm ­u ®·i TrÊn bang chi th¹ch: <color=Violet>"..nNextScale.."<color> phÇn tr¨m\n"..
			"X¸c suÊt lÖnh bµi gäi ra Boss thø 2: <color=Violet>1/"..nNextDoubleOdds.."<color>\n"..
			"Ng©n s¸ch kiÕn thiÕt cÇn ®Ó ®æi lÖnh bµi gäi Boss: <color=Violet>"..nNextPrice.." v¹n<color>\n"..
			"Ng©n s¸ch chiÕn bÞ chi cho phÝ b¶o tr× bang mçi ngµy: <color=Violet>"..nNextMaintainFund.." v¹n<color>\n"..
			"Ng©n s¸ch kiÕn thiÕt ban ®Çu: <color=Violet>"..nNextOpenFund.." v¹n<color>\n"
		return szMsg
	end
end
------------------------------
end