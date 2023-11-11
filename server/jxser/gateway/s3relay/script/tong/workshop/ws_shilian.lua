Include("\\script\\tong\\workshop\\workshop_head.lua")

IncludeLib("SETTING")

TASKID_GET_TIME = 2347
aLevelTime = {}
aLevelOutputCoef = {}
aLevelCost= {}
function LoadLevelData()
	local b1 = TabFile_Load("\\settings\\tong\\workshop\\shilian_level_data.txt", "shilianLevelData")
	if b1~=1 then
		print("§äc tÖp config thİ luyÖn ph­êng thÊt b¹i!")
		return
	end
	local nRowCount = TabFile_GetRowCount("shilianLevelData")
	for y = 2, nRowCount do
		local nLevel = tonumber(TabFile_GetCell("shilianLevelData", y, "LEVEL"))
		aLevelTime[nLevel] = tonumber(TabFile_GetCell("shilianLevelData", y, "TIME"))
		aLevelOutputCoef[nLevel] = tonumber(TabFile_GetCell("shilianLevelData", y, "OUTPUT_COEF"))	
		aLevelCost[nLevel] = tonumber(TabFile_GetCell("shilianLevelData", y, "COST"))
	end
	--TabFile_UnLoad("shilianLevelData")
end
LoadLevelData()

if MODEL_GAMESERVER == 1 or MODEL_RELAY == 1 then
--------------------Èç¹û·Ç¿Í»§¶Ë---------------------------
	if MODEL_GAMESERVER == 1 then		--Ö»ÓĞGAMESERVER ²ÅÓĞµÄ
		Include("\\script\\item\\techan_dahuandan.lua");
	end;

function ws_main(nTongID, nWorkshopID)
	if SVR_CheckUse(nTongID, nWorkshopID, "Tæng qu¶n Thİ luyÖn ph­êng") ~= 1 then
		return 0
	end
	local aryszContent = {
		"Ta muèn nhËn Tu th©n hoµn/#use_g_1_ok".."("..nTongID..","..nWorkshopID..")",
		"NhËn ®­îc Méc nh©n/#use_xiulianmuren("..nTongID..","..nWorkshopID..")",
	}
	-- Ô½ÄÏ°æÈ¡Ïû´ó»¹µ¤
	if (GetProductRegion() == "cn") then
		tinsert(aryszContent,"NhËn ®­îc §¹i hoµn ®¬n/#use_dahuandan("..nTongID..","..nWorkshopID..")");
	end;
	
	tinsert(aryszContent,"LÇn sau vËy/cancel");
	
	Say("<#>Tæng qu¶n Thİ luyÖn ph­êng: Muèn trë thµnh mét ®¹i hiÖp oai trÊn vâ l©m, cÇn ph¶i kiªn t©m bÒn chİ, kh«ng ng¹i nguy hiÓm x«ng pha trËn m¹c, míi cã thÓ ®¹t ®­îc thµnh tùu h¬n ng­êi!", getn(aryszContent), aryszContent)
	return 1;
end

function use_g_1_ok(nTongID, nWorkshopID)
	if (GetTask(TASKID_GET_TIME) == TONG_GetDay(nTongID))then
		Say("<#>Tæng qu¶n Thİ luyÖn ph­êng: H«m nay ng­¬i ®· nhËn råi, ngµy mai h·y ®Õn!", 0)
		return 0;		
	end
	_dbgMsg("Sè lÇn nhËn cßn l¹i * 100: "..TWS_GetDayOutput(nTongID, nWorkshopID))
	if (TWS_GetDayOutput(nTongID, nWorkshopID) < 100) then
		Say("<#>Tæng qu¶n Thİ luyÖn ph­êng: H«m nay Tu th©n hoµn ®· luyÖn thµnh råi, ngµy mai h·y ®Õn t×m ta!", 0)
		return 0;
	end
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	Say("<#>Tæng qu¶n LÔ phÈm ph­êng: CÇn sö dông <color=yellow>"..aLevelCost[nLevel].."<color> ®iÓm cèng hiÕn, Tu LuyÖn Hoµn cã thÓ gióp nh©n ®«i kinh nghiÖm trong 30 phót.", 2, 
		"§­îc. /#use_g_1_ok2".."("..nTongID..","..nWorkshopID..")", "Kh«ng muèn/cancel");
--	if (GetNpcExpRate() > 100) then
--		Say("<#>ÊÔÁ¶·»×Ü¹Ü£º¶Ô²»Æğ£¬Ë«±¶¾­ÑéÆÚ¼ä²»ÄÜÊ¹ÓÃÊÔÁ¶·»¡£", 0)
--		return
--	end
end

function use_g_1_ok2(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if (GetContribution() < aLevelCost[nLevel]) then
		Say("<#>Tæng qu¶n Thİ luyÖn ph­êng: Kh«ng ®­îc råi, ®iÓm cèng hiÕn cña ng­¬i kh«ng ®ñ!", 0)
		return
	end
	if (GetTaskTemp(196) ~= 0)then
		Say("<#>Tæng qu¶n Thİ luyÖn ph­êng: VËt phÈm ng­¬i cÇn vÉn ch­a cã, h·y tiÕp tôc chê ®îi!", 0)
		return
	end
	
	if CalcFreeItemCellCount() < floor(aLevelTime[nLevel] * 2) then
		Talk(1, "", format("§Ó b¶o ®¶m an toµn tµi s¶n, xin mêi ®Ó trèng %d «.", floor(aLevelTime[nLevel] * 2)));
		return 
	end
	
	SetTaskTemp(196, 1)
	TWS_ApplyUse(nTongID, nWorkshopID);	
end

--------------------------------------------------
--/////////////////////////
--ĞŞÁ¶Ä¾ÈË
--
--/////////////////////////
VALUE_MUREN_CONTRIBUTION = 100
function use_xiulianmuren(nTongID, nWorkshopID)
	Say("<#>Tæng qu¶n Thİ luyÖn ph­êng: C¸ch luyÖn c«ng nhanh chãng nhÊt dÜ nhiªn lµ thùc chiÕn, nh­ng t×m mét ng­êi ®Ó cïng nhau luyÖn tËp thËt kh«ng ph¶i dÔ dµng, v× thÕ ta ®· s¸ng t¹o ra mét lo¹i méc nh©n, cã thÓ gióp ng­¬i luyÖn c«ng bÊt cø khi nµo, chØ cÇn nhÊp chuét ph¶i sö dông th× sÏ gäi ra mét méc nh©n ®Ó gióp ng­¬i luyÖn c«ng, ®¸nh b¹i nã th× sÏ nhËn ®­îc rÊt nhiÒu ®iÓm kinh nghiÖm, méc nh©n cÊp cµng cao th× ®iÓm kinh nghiÖm sÏ cµng nhiÒu. Ng­¬i cã thÓ sö dông <color=yellow>"..VALUE_MUREN_CONTRIBUTION.."<color> ®iÓm cèng hiÕn ®Ó ®æi, cã ®ång ı kh«ng?", 3,
	"§æi 1 méc nh©n/#sl_sure2muren("..nTongID..","..nWorkshopID..")",
	"Méc nh©n lµ g×?/sl_helpmuren",
	"Kh«ng cÇn ®©u/cancel")
end

function sl_helpmuren()
	Say("<#>Tæng qu¶n Thİ luyÖn ph­êng: Sö dông méc nh©n sÏ gäi ra mét NPC Méc Nh©n, ®¸nh b¹i nã ng­¬i sÏ nhËn ®­îc 1 triÖu ®iÓm kinh nghiÖm. §¼ng cÊp Thİ luyÖn ph­êng cµng cao th× sÏ gäi ra Méc Nh©n cÊp cµng cao, vµ ®iÓm kinh nghiÖm nhËn ®­îc sÏ cµng nhiÒu (cÊp 6: 105 v¹n; cÊp 7: 110 v¹n; cÊp 8: 115 v¹n; cÊp 9: 120 v¹n; cÊp 10: 130 v¹n). CÇn l­u ı lµ b¶n th©n ®¸nh b¹i nã míi cã thÓ nhËn ®­îc kinh nghiÖm, ng­êi kh¸c ®¸nh b¹i th× kh«ng ®­îc g×.", 0)
end

function sl_sure2muren(nTongID, nWorkshopID)
	local bPause = TONG_GetPauseState(nTongID)
	if (bPause == 1) then
		Say("<#>Tæng qu¶n Thİ luyÖn ph­êng: ThËt ®¸ng tiÕc, Thİ luyÖn ph­êng ®ang t¹m ngõng ho¹t ®éng. Bang héi cÇn ph¶i n¹p tiÒn vµo ng©n s¸ch chiÕn bŞ cho ®ñ sè b¶o tr× hµng tuÇn, vµ sau 12h ®ªm th× T¸c ph­êng míi cã thÓ ho¹t ®éng trë l¹i.", 0)
		Msg2Player("T¸c ph­êng ®ang t¹m ngõng ho¹t ®éng.")
		return
	end
	
	local szTongName , nTongID = GetTongName()
	if (nTongID == 0) then
		Say("<#>Tæng qu¶n Thİ luyÖn ph­êng: Ng­¬i ch­a gia nhËp bang, t×m ®Õn ta cã viÖc g×?", 0)
		return 
	end
	local nUseLevel = TWS_GetUseLevel(nTongID, nWorkshopID)	--»ñµÃÊ¹ÓÃµÈ¼¶
	if (nUseLevel < 5) then
		Say("<#>Tæng qu¶n Thİ luyÖn ph­êng: ThËt ®¸ng tiÕc, ®¼ng cÊp sö dông cña Thİ luyÖn ph­êng ch­a ®¹t cÊp 5, kh«ng thÓ nhËn bang vËt.", 0)
		Msg2Player("§¼ng cÊp sö dông t¸c ph­êng ch­a ®ñ cÊp 5, kh«ng thÓ sö dông chøc n¨ng nµy.")
		return
	end
	
	if (TWS_GetDayOutput(nTongID, nWorkshopID) < (VALUE_MUREN_CONTRIBUTION )) then
		Say("<#>Tæng qu¶n Thİ luyÖn ph­êng: H«m nay Méc Nh©n ®· ph©n ph¸t hÕt råi, ngµy mai h·y ®Õn vËy!", 0)
		return
	end
	
	if (GetContribution() < VALUE_MUREN_CONTRIBUTION or AddContribution(-VALUE_MUREN_CONTRIBUTION) ~= 1)then
		Say("<#>Tæng qu¶n Thİ luyÖn ph­êng: Kh«ng ®­îc råi, ®iÓm cèng hiÕn kh«ng ®ñ <color=yellow>"..VALUE_MUREN_CONTRIBUTION.."<color> ®iÓm, kh«ng thÓ ®æi lÊy bang vËt.", 0)
		Msg2Player("§iÓm cèng hiÕn c¸ nh©n kh«ng ®ñ, kh«ng thÓ sö dông chøc n¨ng nµy.")
		return 
	end
	
	if CalcFreeItemCellCount() < 2 then
		Talk(1, "", "Hµnh trang ph¶i cã hai « trèng.");
		return 
	end
	
	
	TWS_ApplyAddDayOutput(nTongID, nWorkshopID, -(VALUE_MUREN_CONTRIBUTION ))
	
	local nItemIndex = AddItem(6,1,1085,1,1,0)
	SetSpecItemParam(nItemIndex, 1, nTongID)
	SetSpecItemParam(nItemIndex, 2, nUseLevel)
	SyncItem(nItemIndex)
	Msg2Player("§æi thµnh c«ng 1 Méc Nh©n.")
	Say("<#>Tæng qu¶n Thİ luyÖn ph­êng: Ng­¬i ®· ®æi ®­îc 1 Méc nh©n.", 0)
end

--////////////////////
--´ó»¹µ¤
--
--////////////////////

VALUE_HUANDAN_CONTRIBUTION = 30
tbHUANDAN_ADDEXP = {
[4] = 1.25,
[5] = 1.3,
[6] = 1.35,
[7] = 1.4,
[8] = 1.45,
[9] = 1.5,
[10] = 1.6,
}
TASKID_TECHAN_HUANDAN_EXP = 1741	--´ó»¹µ¤Ã¿´Î¸øÓë¾­ÑéÖµ
TASKID_TECHAN_HUANDAN_TIME = 1742	--´ó»¹µ¤Ê£ÓàÊ¹ÓÃÊ±¼ä
function use_dahuandan(nTongID, nWorkshopID)
	local nResttime = GetTask(TASKID_TECHAN_HUANDAN_TIME)
	local nExtpre = GetTask(TASKID_TECHAN_HUANDAN_EXP)
	if (nResttime == 0 and nExtpre ~= 0) then
		SetTask(TASKID_TECHAN_HUANDAN_EXP, 0)
	end
	local szMsg = ""
	if (nResttime ~= 0) then
		local nRestH, nRestM = GetMinAndSec(nResttime)
		szMsg = "§¹i hoµn ®¬n cña ng­¬i hiÖn t¹i cßn cã thÓ sö dông trong <color=yellow>"..nRestH.."<color> giê <color=yellow>"..nRestM.."<color> phót."
	end
	Say("<#>Tæng qu¶n Thİ luyÖn ph­êng: Lo¹i ®¬n d­îc hiÕm cã nµy cã thÓ gióp ng­¬i ñy th¸c rêi m¹ng nhËn ®­îc kinh nghiÖm nhiÒu h¬n. §æi 1 viªn §¹i hoµn ®¬n sÏ tiªu hao 30 ®iÓm cèng hiÕn, cã thÓ sö dông trong 6 giê."..szMsg, 3,
	"<#>Mua 1 viªn §¹i hoµn ®¬n/#sl_sure2dahuandan("..nTongID..","..nWorkshopID..")",
	"<#>§¹i hoµn ®¬n lµ g×/sl_helpdahuandan",
	"<#>Ta kh«ng dïng ®Õn/cancel")
end

function sl_helpdahuandan()
	Say("Tæng qu¶n Thİ luyÖn ph­êng: §¹i hoµn ®¬n cã thÓ gióp ng­¬i ñy th¸c rêi m¹ng nhËn ®­îc nhiÒu ®iÓm kinh nghiÖm h¬n, nh­ng còng kh«ng t¨ng ®­îc thêi gian ñy th¸c, ®ång thêi chØ sö dông víi ñy th¸c rêi m¹ng. §¼ng cÊp cña Thİ luyÖn ph­êng cµng cao th× sÏ mua ®­îc lo¹i §¹i hoµn ®¬n t¨ng kinh nghiÖm cµng nhiÒu (cÊp 4: 1.25 lÇn; cÊp 5: 1.3 lÇn; cÊp 6: 1.35 lÇn; cÊp 7: 1.4 lÇn; cÊp 8: 1.45 lÇn; cÊp 9: 1.6 lÇn; cÊp 10: 1.6 lÇn).", 0)
end

function sl_sure2dahuandan(nTongID, nWorkshopID)
	local bPause = TONG_GetPauseState(nTongID)
	if (bPause == 1) then
		Say("<#>Tæng qu¶n Thİ luyÖn ph­êng: ThËt ®¸ng tiÕc, Thİ luyÖn ph­êng ®ang t¹m ngõng ho¹t ®éng. Bang héi cÇn ph¶i n¹p tiÒn vµo ng©n s¸ch chiÕn bŞ cho ®ñ sè b¶o tr× hµng tuÇn, vµ sau 12h ®ªm th× T¸c ph­êng míi cã thÓ ho¹t ®éng trë l¹i.", 0)
		Msg2Player("T¸c ph­êng ®ang t¹m ngõng ho¹t ®éng.")
		return
	end
	local szTongName , nTongID = GetTongName()
	if (nTongID == 0) then
		Say("<#>Tæng qu¶n Thİ luyÖn ph­êng: Ng­¬i ch­a gia nhËp bang, t×m ®Õn ta cã viÖc g×?", 0)
		return 
	end
	local nUseLevel = TWS_GetUseLevel(nTongID, nWorkshopID)	--»ñµÃÊ¹ÓÃµÈ¼¶
	if (nUseLevel < 4) then
		Say("<#>Tæng qu¶n Thİ luyÖn ph­êng: ThËt ®¸ng tiÕc, ®¼ng cÊp sö dông cña Thİ luyÖn ph­êng kh«ng ®ñ cÊp 4, kh«ng thÓ tiÕp nhËn bang vËt.", 0)
		Msg2Player("§¼ng cÊp sö dông t¸c ph­êng ch­a ®ñ cÊp 4, kh«ng thÓ sö dông chøc n¨ng nµy.kh«ng thÓ sö dông chøc n¨ng nµy")
		return
	end
	
	if (TWS_GetDayOutput(nTongID, nWorkshopID) < (VALUE_HUANDAN_CONTRIBUTION )) then
		Say("<#>Tæng qu¶n Thİ luyÖn ph­êng: H«m nay §¹i hoµn ®¬n ®· ph©n ph¸t hÕt råi, ngµy mai h·y ®Õn nhĞ!", 0)
		return
	end
	
	if (GetContribution() < VALUE_HUANDAN_CONTRIBUTION or AddContribution(-VALUE_HUANDAN_CONTRIBUTION) ~= 1)then
		Say("<#>Tæng qu¶n Thİ luyÖn ph­êng: Kh«ng ®­îc råi, ®iÓm cèng hiÕn kh«ng ®ñ <color=yellow>"..VALUE_HUANDAN_CONTRIBUTION.."<color> ®iÓm, kh«ng thÓ ®æi lÊy bang vËt.", 0)
		Msg2Player("§iÓm cèng hiÕn c¸ nh©n kh«ng ®ñ, kh«ng thÓ sö dông chøc n¨ng nµy.")
		return 
	end
	
	TWS_ApplyAddDayOutput(nTongID, nWorkshopID, -(VALUE_HUANDAN_CONTRIBUTION ))

	local nRestH, nRestM = adddahuandan_main(nUseLevel)
	Msg2Player("<#>NhËn ®­îc 1 viªn §¹i hoµn ®¬n, thêi gian sö dông lµ: "..nRestH.."giê "..nRestM.."phót.")
	Say("<#>Tæng qu¶n Thİ luyÖn ph­êng: Ng­¬i ®· nhËn ®­îc 1 viªn §¹i hoµn ®¬n trong 6 giê ®iÓm kinh nghiÖm t¨ng "..tbHUANDAN_ADDEXP[nUseLevel].." lÇn, thêi gian cßn l¹i lµ "..nRestH.."giê "..nRestM.."phót.", 0)
end


----------------------------------------------------------------------------------------------------
function MAINTAIN_R(nTongID, nWorkshopID) --ÈÕ³£»î¶¯
	if nWorkshopID <= 0 then
		return 0
	end	
	local eType = TWS_GetType(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	local nTotal = floor(aLevelOutputCoef[nLevel]*(TONG_GetMemberCount(nTongID)) * 100)
	TWS_ApplyAddDayOutput(nTongID, nWorkshopID, nTotal)--³õÊ¼»¯¿ÉÁìÈ¡Ë«±¶
	return 1
end

function USE_R(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if nLevel < 1 then
		return 0
	end
	local nLeft = TWS_GetDayOutput(nTongID, nWorkshopID);
	if (TWS_IsOpen(nTongID, nWorkshopID) ~= 1 or nLeft < 100) then
		return 0
	end
	TWS_ApplyAddDayOutput(nTongID, nWorkshopID, -100)
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_WSCONSUME, aLevelTime[nLevel] * 50)
	return 1;
end

function USE_G_1(nTongID, nWorkshopID)
	ws_main(nTongID, nWorkshopID)
end

function USE_G_2(nTongID, nWorkshopID)
	SetTaskTemp(196, 0)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	local nCost = aLevelCost[nLevel]
	if (GetContribution() < nCost) then
		return
	end
	SetTask(TASKID_GET_TIME, TONG_GetDay(nTongID))
	local nCount = floor(aLevelTime[nLevel] * 2)
	AddContribution(-nCost)
	Msg2Player("B¹n tiªu tèn "..nCost.." ®iÓm cèng hiÕn!")
	for i = 1, nCount do 
		AddItem(6,1,1076,1,0,0)
	end
	--AddSkillState(440, 1, 1, aLevelTime[nLevel] * 3600 * 18)
	Msg2Player("B¹n ®¹t ®­îc"..nCount.." Tu th©n hoµn!")
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
	local bPause --ÊÇ·ñÔİÍ£
	local nCurLevel --µ±Ç°µÈ¼¶
	local nUseLevel --µ±Ç°Ê¹ÓÃµÈ¼¶
	local nOpenFund --µ±Ç°¿ªÆôÏûºÄ
	local nMaintainFund --µ±Ç°Î¬»¤ÏûºÄ
	local nPrice  --µ±Ç°ÁìÈ¡Ë«±¶¾­ÑéµÄ¹±Ï×¶È
	local dDoubleExpCount	--µ±Ç°Ã¿ÈÕÁìÈ¡Ë«±¶¾­ÑéÈËÊıÉÏÏŞÌá¸ß
	local nTime	--µ±Ç°Ë«±¶¾­ÑéÊ±¼ä
	if (nWorkshopID ~= 0)then
		bOpen = TWS_IsOpen(nTongID, nWorkshopID) 
		bPause = TONG_GetPauseState(nTongID) 
		nCurLevel = TWS_GetLevel(nTongID, nWorkshopID) 
		nUseLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
		nOpenFund = wsGetOpenCost(nTongID, nType, nUseLevel) 
		nMaintainFund = wsGetMaintainCost(nTongID, nType, nUseLevel, bOpen)  
		if(nUseLevel > 0)then
			nPrice = aLevelCost[nUseLevel]
			dDoubleExpCount = format("%.2f", aLevelOutputCoef[nUseLevel] / aLevelOutputCoef[1])
			nTime = aLevelTime[nUseLevel]
		else
			nPrice = "--"
			dDoubleExpCount = "--"
			nTime = "--"
		end
	else	--×÷·»Î´½¨Á¢Ê±Ö»ÏÔÊ¾ÏÂÒ»¼¶ĞÅÏ¢
		nCurLevel = 0
		bOpen = 1
		nUseLevel = 0
	end
	--ÏÂ¼¶ĞÅÏ¢
	local nUpgradeCostFund, nNextMaintainFund, nNextPrice, nNextOpenFund, dNextDoubleExpCount,nNextTime
	if (nCurLevel < wsGetMaxLevel(nTongID, nType))then
		nUpgradeCostFund = wsGetUpgradeCostFund(nTongID, nType, nCurLevel)  --Éı¼¶ÏûºÄ
	else
		nUpgradeCostFund = "--"
	end
	if (nUseLevel < wsGetMaxLevel(nTongID, nType))then
		nNextMaintainFund = wsGetMaintainCost(nTongID, nType, nUseLevel+1, bOpen)  --ÏÂ¼¶Î¬»¤ÏûºÄ
		nNextOpenFund = wsGetOpenCost(nTongID, nType, nUseLevel+1) 	--ÏÂ¼¶¿ªÆôÏûºÄ
		nNextPrice = aLevelCost[nUseLevel + 1] --ÏÂ¼¶ÁìÈ¡Ë«±¶¾­ÑéµÄ¹±Ï×¶È
		dNextDoubleExpCount = format("%.2f", aLevelOutputCoef[nUseLevel + 1] / aLevelOutputCoef[1]) --ÏÂ¼¶Ã¿ÈÕÁìÈ¡Ë«±¶¾­ÑéÈËÊıÉÏÏŞÌá¸ß
		nNextTime = aLevelTime[nUseLevel + 1] --ÏÂ¼¶Ë«±¶¾­ÑéÊ±¼ä
	else
		nNextMaintainFund = "--"
		nNextOpenFund = "--"
		nNextPrice = "--"
		dNextDoubleExpCount = "--"
		nNextTime = "--"
	end	
	if (nWorkshopID ~= 0)then
		local state 
		if bPause == 1 then state="<color=yellow>T¹m ngõng" elseif bOpen == 1 then state="<color=green>Khai më" else state="<color=red>§ãng cöa" end
		local szMsg = "Tr¹ng th¸i t¸c ph­êng: "..state.."<color>\n"..
			"§¼ng cÊp t¸c ph­êng: <color=gold>"..nCurLevel.."<color>\n"..
			"§¼ng cÊp sö dông hiÖn t¹i: <color=gold>"..nUseLevel.."<color>\n"..
			"Giíi h¹n mçi ngµy sè ng­êi nhËn ®­îc nh©n ®«i kinh nghiÖm t¨ng lªn:  <color=gold>"..dDoubleExpCount.."<color> lÇn\n"..	
			"Thêi gian nh©n ®«i kinh nghiÖm: <color=gold>"..nTime.."<color> giê\n"..
			"§iÓm cèng hiÕn tiªu hao ®Ó nhËn nh©n ®«i kinh nghiÖm: <color=gold>"..nPrice.."<color>\n"..
			"Ng©n s¸ch chiÕn bŞ chi cho phİ b¶o tr× bang mçi ngµy: <color=gold>"..nMaintainFund.." v¹n<color>\n"..
			"Ng©n s¸ch kiÕn thiÕt ban ®Çu: <color=gold>"..nOpenFund.." v¹n<color>\n"..
			"Ng©n s¸ch kiÕn thiÕt ®Ó n©ng cÊp: <color=gold>"..nUpgradeCostFund.." v¹n<color>\n"..
			"<color=green>§¼ng cÊp sö dông kÕ tiÕp <color>\n"..
			"<color=water>Giíi h¹n sè l­îng ng­êi nhËn nh©n ®«i kinh nghiÖm t¨ng lªn: <color=Violet>"..dNextDoubleExpCount.."<color> lÇn\n"..
			"Thêi gian nh©n ®«i kinh nghiÖm: <color=Violet>"..nNextTime.."<color> giê\n"..
			"§iÓm cèng hiÕn tiªu hao ®Ó nhËn nh©n ®«i kinh nghiÖm: <color=Violet>"..nNextPrice.."<color>\n"..
			"Ng©n s¸ch chiÕn bŞ chi cho phİ b¶o tr× bang mçi ngµy: <color=Violet>"..nNextMaintainFund.." v¹n<color>\n"..
			"Ng©n s¸ch kiÕn thiÕt ban ®Çu: <color=Violet>"..nNextOpenFund.." v¹n<color>\n"
		return szMsg
	else
		local szMsg = "Tr¹ng th¸i t¸c ph­êng: <color=water>Ch­a thµnh lËp<color>\n"..
			"Ng©n s¸ch kiÕn thÕt cÇn ®Ó x©y dùng: <color=gold>"..nUpgradeCostFund.." v¹n<color>\n"..
			"<color=green>§¼ng cÊp kÕ tiÕp <color>\n"..
			"<color=water>Giíi h¹n sè l­îng ng­êi nhËn nh©n ®«i kinh nghiÖm t¨ng lªn: <color=Violet>"..dNextDoubleExpCount.."<color> lÇn\n"..	
			"Thêi gian nh©n ®«i kinh nghiÖm: <color=Violet>"..nNextTime.."<color> giê\n"..
			"§iÓm cèng hiÕn tiªu hao ®Ó nhËn nh©n ®«i kinh nghiÖm: <color=Violet>"..nNextPrice.."<color>\n"..
			"Ng©n s¸ch chiÕn bŞ chi cho phİ b¶o tr× bang mçi ngµy: <color=Violet>"..nNextMaintainFund.." v¹n<color>\n"..
			"Ng©n s¸ch kiÕn thiÕt ban ®Çu: <color=Violet>"..nNextOpenFund.." v¹n<color>\n"
		return szMsg
	end
end

end