Include("\\script\\tong\\workshop\\workshop_head.lua")

aLevelCoef = {}
aLevelRepairScale = {}
aLevelRepairLevel = {}
aLevelEnhanceAdd = {}
aLevelContributionCoef = {}
function LoadLevelData()
	local b1 = TabFile_Load("\\settings\\tong\\workshop\\tiangong_level_data.txt", "tiangongLevelData")
	if b1~=1 then
		print("§äc tÖp config Thiªn c«ng ph­êng thÊt b¹i!")
		return
	end
	local nRowCount = TabFile_GetRowCount("tiangongLevelData")
	for y = 2, nRowCount do
		local nLevel = tonumber(TabFile_GetCell("tiangongLevelData", y, "LEVEL"))
		aLevelCoef[nLevel] = tonumber(TabFile_GetCell("tiangongLevelData", y, "OUTPUT_COEF"))
		aLevelRepairScale[nLevel] = tonumber(TabFile_GetCell("tiangongLevelData", y, "REPAIR_SCALE"))
		aLevelContributionCoef[nLevel] = tonumber(TabFile_GetCell("tiangongLevelData", y, "CONTRIBUTION_COEF"))
		aLevelRepairLevel[nLevel] = tonumber(TabFile_GetCell("tiangongLevelData", y, "REPAIR_LEVEL"))
		aLevelEnhanceAdd[nLevel] = tonumber(TabFile_GetCell("tiangongLevelData", y, "ENHANCE_ADD"))
	end
	--TabFile_UnLoad("tiangongLevelData")
end
LoadLevelData()

if MODEL_GAMESERVER == 1 or MODEL_RELAY == 1 then
--------------------Èç¹û·Ç¿Í»§¶Ë---------------------------
function ws_main(nTongID, nWorkshopID)
	if SVR_CheckUse(nTongID, nWorkshopID, "Tæng qu¶n Thiªn c«ng ph­êng") ~= 1 then
		return 0
	end
	local aryszContent = {
		"Söa th«ng th­êng/#repair_ok1".."("..nTongID..","..nWorkshopID..")",
		"söa gia cè/#repair_ok2".."("..nTongID..","..nWorkshopID..")",
		"NhËn ®­îc tói ®å nghÒ/#use_xiulibao("..nTongID..","..nWorkshopID..")",
		"Kh«ng cÇn ®©u/cancel"
	}
	Say("<#>Tæng qu¶n Thiªn c«ng ph­êng: ViÖc söa ch÷a lo¹i thÇn binh lîi khÝ trong bang ®Òu do mét tay ta ®¶m tr¸ch.", getn(aryszContent), aryszContent);
	return 1;
end

--------------------------------------------------------------------------------------------
VALUE_XIULIBAO_CONTRIBUTION = 50	--×Ï½ð¸äÐèÒªµÄ¸öÈË¹±Ï×¶È
function use_xiulibao(nTongID, nWorkshopID)
	Say("Tæng qu¶n Thiªn c«ng ph­êng: Hµnh tÈu giang hå, trang bÞ th­êng xuyªn bÞ h­ háng? Giê ®©y ng­¬i cã thÓ mua tói ®å nghÒ, kh«ng cÇn quay vÒ thµnh, chØ cÇn dïng nã th× ng­¬i cã thÓ söa trang bÞ bÊt cø ®©u, vµ ®­¬ng nhiªn ph¶i tr¶ chi phÝ t­¬ng ®­¬ng. Tói ®å nghÒ cã thêi h¹n sö dông lµ 1 tuÇn, cÇn tiªu phÝ <color=yellow>"..VALUE_XIULIBAO_CONTRIBUTION.."<color> ®iÓm cèng hiÕn ®Ó ®æi, ng­¬i cã ®ång ý kh«ng?", 3,
	"§æi 1 tói ®å nghÒ/#tg_sure2xiulibao("..nTongID..","..nWorkshopID..")",
	"Tói ®å nghÒ lµ g×?/tg_helpxiulibao",
	"Ta biÕt råi/cancel")
end

function tg_helpxiulibao()
	Say("Tæng qu¶n Thiªn c«ng ph­êng: Tói ®å nghÒ sÏ gióp ng­¬i söa ch÷a trang bÞ bÊt kÓ thêi gian vµ ®Þa ®iÓm, chØ cÇn nhÊp chuét ph¶i sö dông th× còng sÏ gièng nh­ ®Õn c¸c cöa hµng trong thµnh, vµ dÜ nhiªn còng ph¶i tr¶ mét chi phÝ t­¬ng ®­¬ng. Tói ®å nghÒ cã thêi h¹n sö dông lµ mét tuÇn, thêi gian sÏ tÝnh tõ khi b¾t ®Çu mua, v× thÕ cã mua nhiÒu c¸i cïng mét lóc th× còng kh«ng cã t¸c dông.", 0)
end

function tg_sure2xiulibao(nTongID, nWorkshopID)
	local bPause = TONG_GetPauseState(nTongID)
	if (bPause == 1) then
		Say("<#>ThËt ®¸ng tiÕc, Thiªn c«ng ph­êng ®ang t¹m ngõng ho¹t ®éng. Ng©n s¸ch chiÕn bÞ cÇn t¨ng ®ñ chi phÝ b¶o tr× hµng tuÇn, th× 12h ®ªm cïng ngµy T¸c ph­êng míi ho¹t ®éng trë l¹i.", 0)
		Msg2Player("T¸c ph­êng ®ang t¹m ngõng ho¹t ®éng.")
		return
	end
	local szTongName , nTongID = GetTongName()
	if (nTongID == 0) then
		Say("<#>Ng­¬i ch­a gia nhËp bang, t×m ®Õn ta cã viÖc g×?", 0)
		return 
	end
	local nUseLevel = TWS_GetUseLevel(nTongID, nWorkshopID)	--»ñµÃÊ¹ÓÃµÈ¼¶
	if (nUseLevel < 4) then
		Say("<#>§¼ng cÊp sö dông Thiªn c«ng ph­êng ch­a ®ñ cÊp 4, kh«ng thÓ nhËn ®­îc bang vËt.", 0)
		Msg2Player("§¼ng cÊp sö dông t¸c ph­êng ch­a ®ñ cÊp 4, kh«ng thÓ sö dông chøc n¨ng nµy.kh«ng thÓ sö dông chøc n¨ng nµy")
		return
	end
	if (GetContribution() < VALUE_XIULIBAO_CONTRIBUTION or AddContribution(-VALUE_XIULIBAO_CONTRIBUTION) ~= 1)then
		Say("ThËt ®¸ng tiÕc, ®iÓm cèng hiÕn kh«ng ®ñ <color=yellow>"..VALUE_XIULIBAO_CONTRIBUTION.."<color> ®iÓm, kh«ng thÓ ®æi lÊy bang vËt.", 0)
		Msg2Player("§iÓm cèng hiÕn c¸ nh©n kh«ng ®ñ, kh«ng thÓ sö dông chøc n¨ng nµy.")
		return 0
	end
	local nItemIndex = AddItem(6,1,1084,1,1,0);
	local nTime = GetCurServerTime() + 7 * 24 * 60 * 60;
	local nDate = FormatTime2Number(nTime);
	local nYear = floor(nDate/100000000);
	local nMMDD = floor( mod(nDate, 100000000) / 10000 );
	local nHour = floor( mod(nDate, 10000) / 100 );
	SetSpecItemParam(nItemIndex, 1, nTime);
	SetSpecItemParam(nItemIndex, 2, nYear);
	SetSpecItemParam(nItemIndex, 3, nMMDD);
	SetSpecItemParam(nItemIndex, 4, nHour);
	SyncItem(nItemIndex);
	Msg2Player("§æi ®­îc 1 Tói ®å nghÒ, thêi gian sö dông cßn l¹i lµ 7 ngµy.")
	Say("§æi ®­îc 1 Tói ®å nghÒ, thêi gian sö dông cßn l¹i lµ 7 ngµy.", 0)
end
--------
function MAINTAIN_R(nTongID, nWorkshopID) --ÈÕ³£Ìì¹¤
	if nWorkshopID <= 0 then
		return 0
	end	
	local eType = TWS_GetType(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	local nTotal = floor(aLevelCoef[nLevel]*(TONG_GetMemberCount(nTongID)))
	TWS_ApplyAddDayOutput(nTongID, nWorkshopID, nTotal) --³õÊ¼»¯ÈÕ²ú³ö¼ÛÖµÁ¿
	return 1
end

function USE_R(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if nLevel < 1 then
		return 0
	end
	local nLeft = TWS_GetDayOutput(nTongID, nWorkshopID)
	if (TWS_IsOpen(nTongID, nWorkshopID) ~= 1 or nLeft <= 0) then
		return 0
	end
	return 1
end

function USE_G_1(nTongID, nWorkshopID)
	ws_main(nTongID, nWorkshopID)
end

function repair_ok1(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	TWS_ApplyUse(nTongID, nWorkshopID, 1)
end

function repair_ok2(nTongID, nWorkshopID)
	if (TWS_GetDayOutput(nTongID, nWorkshopID) <= 0) then
		Say("<#>Tæng qu¶n Thiªn c«ng ph­êng: H«m nay bËn viÖc qu¸, kh«ng thÓ gióp ng­¬i söa gia cè trang bÞ, ngµy mai h·y ®Õn nhÐ!", 0)
		return 0;
	end
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	TWS_ApplyUse(nTongID, nWorkshopID, 2)
end

function USE_G_2(nTongID, nWorkshopID, nUse)
	TRepair("RepairCallBack(%d,%d,%d,"..nTongID..","..nWorkshopID..","..nUse..")")
end

function CommonRepair(nItemIdx, nPrice, nItemPrice, nTongID, nWorkshopID)
	local nMaxDur = GetMaxDurability(nItemIdx)
	local nFixDur = nMaxDur - GetCurDurability(nItemIdx)
	if (nFixDur <= 0)then
		return
	end	
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	local quality = GetItemQuality(nItemIdx)
	local nRepairLevel = aLevelRepairLevel[nLevel]
	if (nRepairLevel < 2)then
		if (quality ~= 0)then
			Say("<#>Tæng qu¶n Thiªn c«ng ph­êng: §¼ng cÊp Thiªn c«ng ph­êng hiÖn t¹i kh«ng thÓ söa chöa trang bÞ nµy.", 0)
			return
		end
	elseif (nRepairLevel < 3)then
		if (quality == 1 or quality == 4)then
			Say("<#>Tæng qu¶n Thiªn c«ng ph­êng: §¼ng cÊp Thiªn c«ng ph­êng hiÖn t¹i kh«ng thÓ söa chöa trang bÞ nµy.", 0)
			return
		end
	end
	
	if quality == 4 then
		Say("<#>Tæng qu¶n thiªn c«ng ph­êng: Trang bÞ b¹ch kim kh«ng thÓ söa ®­îc.", 0)
		return
	end
		
	-- »Æ½ð×°±¸ÐÞÀí¼Û¸ñ¹«Ê½µ÷ÕûÎª£º100*(×°±¸µÈ¼¶^2)/Ã¿µãÄÍ¾Ã¶È	
	if (quality == 1)then
		local nItemLevel = GetItemLevel(nItemIdx);
		--Ã¿ÄÍ¾Ã¶ÈµÄ¼Û¸ñ
		local nDurPrice = 100 * nItemLevel * nItemLevel
		local nCheapPrice = nDurPrice * nFixDur * aLevelRepairScale[nLevel]/100;
		local nCostlyPrice = nCheapPrice * 3; -- ¼òÐÞµÄÈý±¶
		local nCostContribution = floor(nCheapPrice * (100-aLevelRepairScale[nLevel])/100/10000 + 0.5)
		if (nCostContribution <= 0)then
			nCostContribution = 1
		end
		local nLostDur = floor(nFixDur / 10);
		if (nLostDur < 1) then
			nLostDur = 1;
		end
		Say("Tæng qu¶n Thiªn c«ng ph­êng: <#>", 3, "Söa kü: "..nCostlyPrice.." l­îng, tiªu hao ®iÓm cèng hiÕn:  "..(nCostContribution*3).."®iÓm/#Costly_Repair("..
			nTongID..","..nWorkshopID..","..nItemIdx..","..nCostlyPrice..","..(nCostContribution*3)..")", 
		"Söa ®¬n gi¶n: "..nCheapPrice.." l­îng, tiªu hao ®iÓm cèng hiÕn:  "..nCostContribution.." ®iÓm, ®é bÒn gi¶m "..nLostDur.."®iÓm/#Cheap_Repair("..
			nTongID..","..nWorkshopID..","..nItemIdx..","..nCheapPrice..","..nCostContribution..")", "Kh«ng cÇn ®©u/cancel")
		return	
	end
	
	local nCostlyPrice = floor(nPrice * aLevelRepairScale[nLevel]/100)
	local nCostContribution = floor(nPrice * (100-aLevelRepairScale[nLevel])/100/10000 + 0.5)
	if (nCostContribution <= 0)then
		nCostContribution = 1
	end
	Say("<#>Tæng qu¶n Thiªn c«ng ph­êng: Söa ch÷a trang bÞ nµy cÇn tiªu hao:  "..nCostlyPrice.." l­îng, tiªu hao ®iÓm cèng hiÕn: <color=yellow>"..nCostContribution.."<color> ®iÓm, ng­¬i ®ång ý kh«ng?", 2, "Söa ch÷a/#TG_Repair("..
		nTongID..","..nWorkshopID..","..nItemIdx..","..nCostlyPrice..","..nCostContribution..")", "Kh«ng cÇn ®©u/cancel")
end

function EnhanceRepair(nItemIdx, nPrice, nItemPrice, nTongID, nWorkshopID)
	local nMaxDur = GetMaxDurability(nItemIdx)
	local nCurDur = GetCurDurability(nItemIdx)
	local nFixDur = nMaxDur - nCurDur
	_dbgMsg("Gi¸ trÞ l­îng cßn l¹i"..TWS_GetDayOutput(nTongID, nWorkshopID))
	if (TWS_GetDayOutput(nTongID, nWorkshopID) <= 0)then
		Say("<#>Tæng qu¶n Thiªn c«ng ph­êng: H«m nay bËn viÖc qu¸, kh«ng thÓ gióp ng­¬i söa gia cè, ngµy mai h·y ®Õn nhÐ!", 0)
		return
	end
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	local quality = GetItemQuality(nItemIdx)
	local nRepairLevel = aLevelRepairLevel[nLevel]
	if (nRepairLevel < 2)then
		if (quality ~= 0)then
			Say("<#>Tæng qu¶n Thiªn c«ng ph­êng: §¼ng cÊp Thiªn c«ng ph­êng hiÖn t¹i kh«ng thÓ söa chöa trang bÞ nµy.", 0)
			return
		end
	elseif (nRepairLevel < 3)then
		if (quality == 1 or quality == 4)then
			Say("<#>Tæng qu¶n Thiªn c«ng ph­êng: §¼ng cÊp Thiªn c«ng ph­êng hiÖn t¹i kh«ng thÓ söa chöa trang bÞ nµy.", 0)
			return
		end
	end
	
	if quality == 4 then
		Say("<#>Tæng qu¶n thiªn c«ng ph­êng: Trang bÞ b¹ch kim kh«ng thÓ söa ®­îc.", 0)
		return
	end
	
	local nDurPrice = GetRepairDurPrice(nItemIdx);
	--Ç¿»¯ÐÞÀí¼Ó³ÉµÄ¼ÛÖµ
	if (nPrice < 0)then
		nPrice = 0
	end
	local nDstDur = floor(nMaxDur * (1+aLevelEnhanceAdd[nLevel]/100))
	if (nDstDur > 255) then
		nDstDur = 255;
	end
	if (nCurDur > nMaxDur)then
		nFixDur = floor(nDstDur - nCurDur)
	else
		nFixDur = floor(nDstDur - nMaxDur)
	end
	if (nFixDur <= 0)then
		Say("<#>Tæng qu¶n Thiªn c«ng ph­êng: Trang bÞ nµy kh«ng thÓ gia cè n÷a!", 0)
		return
	end	
	local nEnhancePrice = nDurPrice * nFixDur * 1.5
	nPrice = nPrice + nEnhancePrice
	-- »Æ½ð×°±¸ÐÞÀí¼Û¸ñ¹«Ê½µ÷ÕûÎª£º100*(×°±¸µÈ¼¶^2)/Ã¿µãÄÍ¾Ã¶È	
	if (quality == 1)then
		nFixDur = nMaxDur - nCurDur
		if (nFixDur < 0)then
			nFixDur = 0
		end
--		if (GetOrgMaxDurability(nItemIdx) ~= nMaxDur)then
--			Say("<#>Ìì¹¤·»×Ü¹Ü£º×î´óÄÍ¾Ã¶ÈÓÐËðÊ§µÄ×°±¸²»ÄÜÇ¿»¯ÐÞÀí£¡")
--			return
--		end
		local nItemLevel = GetItemLevel(nItemIdx);
		--Ã¿ÄÍ¾Ã¶ÈµÄ¼Û¸ñ
		local nDurPrice = 100 * nItemLevel * nItemLevel
		--ÆÕÍ¨ÐÞÀíÓ¦Ðè¼Û¸ñ
		local nCheapPrice = nDurPrice * nFixDur;
		--Ç¿»¯ÐÞÀí
		if (nCurDur > nMaxDur)then
			nFixDur = floor(nDstDur - nCurDur)
		else
			nFixDur = floor(nDstDur - nMaxDur)
		end	
		if (nFixDur <= 0)then
			Say("<#>Tæng qu¶n Thiªn c«ng ph­êng: Trang bÞ nµy kh«ng thÓ gia cè n÷a!", 0)
			return
		end	
		--¼ÓÉÏÇ¿»¯ËùÐè¼Û¸ñ
		local nEnhancePrice = nDurPrice * nFixDur * 1.5
		--Ç¿»¯ÐÞÀí¶¼°´¾«ÐÞµÄ¼Û¸ñËã	
		nEnhancePrice = nEnhancePrice*3	
		--×Ü¼Û
		nCheapPrice = nCheapPrice *3 + nEnhancePrice
		--´òÕÛºó
		local nPayPrice = floor(nCheapPrice * aLevelRepairScale[nLevel]/100)
		local nCostContribution = floor(nCheapPrice * (100-aLevelRepairScale[nLevel])/100/10000 + 0.5)
		if (nCostContribution <= 0)then
			nCostContribution = 1
		end
		Say("<#>Tæng qu¶n Thiªn c«ng ph­êng: Söa gia cè trang bÞ nµy cÇn tiªu phÝ: "..nPayPrice.." l­îng, tiªu hao ®iÓm cèng hiÕn: <color=yellow>"..nCostContribution..
		"<color> ®iÓm, sau khi gia cè, ®é bÒn cña trang bÞ lµ "..nDstDur, 2, "Söa ch÷a/#EH_Costly_Repair("..
			nTongID..","..nWorkshopID..","..nItemIdx..","..nPayPrice..
				","..nCostContribution..","..nEnhancePrice..")", "Kh«ng cÇn ®©u/cancel")
		return	
	end	
	local nCostlyPrice = floor(nPrice * aLevelRepairScale[nLevel]/100)
	local nCostContribution = floor(nPrice * (100-aLevelRepairScale[nLevel])/100/10000 + 0.5)
	if (nCostContribution <= 0)then
		nCostContribution = 1
	end
	Say("<#>Tæng qu¶n Thiªn c«ng ph­êng: Söa gia cè trang bÞ nµy cÇn tiªu phÝ: "..nCostlyPrice.." l­îng, tiªu hao ®iÓm cèng hiÕn: <color=yellow>"..nCostContribution.."<color> ®iÓm, sau khi gia cè, ®é bÒn cña trang bÞ lµ "..nDstDur, 2, "Söa ch÷a/#Enhance_Repair("..
		nTongID..","..nWorkshopID..","..nItemIdx..","..nCostlyPrice..
			","..nCostContribution..","..nEnhancePrice..")", "Kh«ng cÇn ®©u/cancel")
end

function RepairCallBack(nItemIdx, nPrice, nItemPrice, nTongID, nWorkshopID, nUse)
	if (nUse == 1)then
		CommonRepair(nItemIdx, nPrice, nItemPrice, nTongID, nWorkshopID)
	elseif (nUse == 2)then
		EnhanceRepair(nItemIdx, nPrice, nItemPrice, nTongID, nWorkshopID)
	end
end

function TG_Repair(nTongID, nWorkshopID, nItemIdx, nCostPrice, nCostContribution)
	if (GetCash() < nCostPrice) then
		Say("<#>Tæng qu¶n Thiªn c«ng ph­êng: Ng©n l­îng kh«ng ®ñ, cã ®ñ råi h·y quay l¹i t×m ta!", 0)
		return
	end
	if (GetContribution() < nCostContribution) then
		Say("<#>Tæng qu¶n Thiªn c«ng ph­êng: §iÓm cèng hiÕn kh«ng ®ñ, h·y gãp søc cho bang héi tr­íc ®·!", 0)
		return
	end
	Pay(nCostPrice)
	AddContribution(-nCostContribution)
	SetCurDurability(nItemIdx, GetMaxDurability(nItemIdx))
	--TWS_ApplyAddDayOutput(nTongID, nWorkshopID, nCostContribution)
end

function Enhance_Repair(nTongID, nWorkshopID, nItemIdx, nCostPrice, nCostContribution, nEnhancePrice)
	if (GetCash() < nCostPrice) then
		Say("<#>Tæng qu¶n Thiªn c«ng ph­êng: Ng©n l­îng kh«ng ®ñ, cã ®ñ råi h·y quay l¹i t×m ta!", 0)
		return
	end
	if (GetContribution() < nCostContribution) then
		Say("<#>Tæng qu¶n Thiªn c«ng ph­êng: §iÓm cèng hiÕn kh«ng ®ñ, h·y gãp søc cho bang héi tr­íc ®·!", 0)
		return
	end
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if (nLevel < 1)then
		return
	end	
	Pay(nCostPrice)
	AddContribution(-nCostContribution)
	EH_SetCurDurability(nItemIdx, GetMaxDurability(nItemIdx) * (1+aLevelEnhanceAdd[nLevel]/100))
	TWS_ApplyAddDayOutput(nTongID, nWorkshopID, -nEnhancePrice)
	TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_WSCONSUME, (nEnhancePrice+5000)/10000)
end
--¾«ÐÞ
function Costly_Repair(nTongID, nWorkshopID, nItemIdx, nCostPrice, nCostContribution)
	local nCurMaxDur = GetMaxDurability(nItemIdx)
	if (GetContribution() < nCostContribution)then
		Say("<#>Tæng qu¶n Thiªn c«ng ph­êng: §iÓm cèng hiÕn kh«ng ®ñ, h·y gãp søc cho bang héi tr­íc ®·!", 0)
		return
	end
	if (GetCash() >= nCostPrice) then
		AddContribution(-nCostContribution)
		Pay(nCostPrice)
		-- Msg2Player("ÐÞ¸´×°±¸£¡")
		SetCurDurability(nItemIdx, nCurMaxDur)
		--TWS_ApplyAddDayOutput(nTongID, nWorkshopID, nCostContribution)
		WriteLog(date("%H%M%S")..":"..GetAccount().."("..GetName()..") sö dông ("..nCostPrice..") l­îng, ("..nCostContribution..") ®iÓm cèng hiÕn, söa kü trang bÞ Hoµng Kim (ItemGenTime:"..GetItemGenTime(nItemIdx).." CurDur:"..nCurMaxDur..")");
	else
		Say("<#>Tæng qu¶n Thiªn c«ng ph­êng: Ng©n l­îng kh«ng ®ñ, cã ®ñ råi h·y quay l¹i t×m ta!", 0)
		return
	end
end
--¼òÐÞ
function Cheap_Repair(nTongID, nWorkshopID, nItemIdx, nCostPrice, nCostContribution)
	local nCurMaxDur = GetMaxDurability(nItemIdx)
	if (GetContribution() < nCostContribution)then
		Say("<#>Tæng qu¶n Thiªn c«ng ph­êng: §iÓm cèng hiÕn kh«ng ®ñ, h·y gãp søc cho bang héi tr­íc ®·!", 0)
		return
	end
	local nFixDur = nCurMaxDur - GetCurDurability(nItemIdx)
	local nLostDur = floor(nFixDur / 10);
	if (nLostDur < 1) then
		nLostDur = 1;
	end	
	if (GetCash() >= nCostPrice) then
		Pay(nCostPrice)
		AddContribution(-nCostContribution)
		local nFixMaxDur = nCurMaxDur - nLostDur;
		SetMaxDurability(nItemIdx, nFixMaxDur);
		SetCurDurability(nItemIdx, nFixMaxDur);
		--TWS_ApplyAddDayOutput(nTongID, nWorkshopID, nCostContribution)
		WriteLog(date("%H%M%S")..":"..GetAccount().."("..GetName()..") sö dông ("..nCostPrice..") l­îng, "..nCostContribution.." ®iÓm cèng hiÕn, söa ®¬n gi¶n trang bÞ Hoµng Kim (ItemGenTime:"..GetItemGenTime(nItemIdx).." CurDur:"..nFixMaxDur..") , ®é bÒn lín nhÊt gi¶m xuèng, "..nLostDur.."®iÓm");
	else
		Say("<#>Tæng qu¶n Thiªn c«ng ph­êng: Ng©n l­îng kh«ng ®ñ, cã ®ñ råi h·y quay l¹i t×m ta!", 0)
		return
	end
end
--Ç¿»¯¾«ÐÞ
function EH_Costly_Repair(nTongID, nWorkshopID, nItemIdx, nCostPrice, nCostContribution, nEnhancePrice)
	local nCurMaxDur = GetMaxDurability(nItemIdx)
	if (GetContribution() < nCostContribution)then
		Say("<#>Tæng qu¶n Thiªn c«ng ph­êng: §iÓm cèng hiÕn kh«ng ®ñ, h·y gãp søc cho bang héi tr­íc ®·!", 0)
		return
	end
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if (nLevel < 1)then
		return
	end	
	if (GetCash() >= nCostPrice) then
		AddContribution(-nCostContribution)
		Pay(nCostPrice)
		-- Msg2Player("ÐÞ¸´×°±¸£¡")
		EH_SetCurDurability(nItemIdx, nCurMaxDur* (1+aLevelEnhanceAdd[nLevel]/100))
		TWS_ApplyAddDayOutput(nTongID, nWorkshopID, -nEnhancePrice)
		TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_WSCONSUME, (nEnhancePrice+5000)/10000)
		WriteLog(date("%H%M%S")..":"..GetAccount().."("..GetName()..") sö dông ("..nCostPrice..") l­îng, ("..nCostContribution..") ®iÓm cèng hiÕn, söa gia cè trang bÞ Hoµng Kim (ItemGenTime:"..GetItemGenTime(nItemIdx).." CurDur:"..nCurMaxDur..")");
	else
		Say("<#>Tæng qu¶n Thiªn c«ng ph­êng: Ng©n l­îng kh«ng ®ñ, cã ®ñ råi h·y quay l¹i t×m ta!", 0)
		return
	end
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
	local nScale  --µ±Ç°Î¬ÐÞ×°±¸´òÕÛÊý
	local dAdvanceRepairCount	--µ±Ç°Ã¿ÈÕÇ¿»¯ÐÞÀí×ÜÁ¿Ìá¸ß
	local nAdvanceEnhance --µ±Ç°Ç¿»¯ÐÞÀíÄÍ¾Ã¶È³¬¹ýÉÏÏÞµÄ°Ù·Ö±È
	local szRepairKind --µ±Ç°¿ÉÎ¬ÐÞµÄ×°±¸Æ·ÖÖ
	if (nWorkshopID ~= 0)then
		bOpen = TWS_IsOpen(nTongID, nWorkshopID) 
		bPause = TONG_GetPauseState(nTongID) 
		nCurLevel = TWS_GetLevel(nTongID, nWorkshopID) 
		nUseLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
		nOpenFund = wsGetOpenCost(nTongID, nType, nUseLevel) 
		nMaintainFund = wsGetMaintainCost(nTongID, nType, nUseLevel, bOpen)  
		if(nUseLevel > 0)then
			nScale = format("%.1f",aLevelRepairScale[nUseLevel] / 10)
			dAdvanceRepairCount = format("%.2f", aLevelCoef[nUseLevel] / aLevelCoef[1])
			nAdvanceEnhance = aLevelEnhanceAdd[nUseLevel]
			if(aLevelRepairLevel[nUseLevel] == 1) then
				szRepairKind = "<color=white>Trang bÞ tr¾ng<color>, <color=water>trang bÞ xanh<color>"
			elseif(aLevelRepairLevel[nUseLevel] == 2) then
				szRepairKind = "<color=white>Trang bÞ tr¾ng<color>, <color=water>trang bÞ xanh<color>, <color=Violet>trang bÞ tÝm<color>"
			else
				szRepairKind = "<color=white>Trang bÞ tr¾ng<color>, <color=water>trang bÞ xanh<color>, <color=Violet>trang bÞ tÝm<color>, <color=gold>trang bÞ Hoµng Kim<color>"
			end
		else
			nScale = "--"
			dAdvanceRepairCount = "--"
			nAdvanceEnhance = "--"
			szRepairKind = "--"
		end
	else	--×÷·»Î´½¨Á¢Ê±Ö»ÏÔÊ¾ÏÂÒ»¼¶ÐÅÏ¢
		nCurLevel = 0
		bOpen = 1
		nUseLevel = 0
	end
	--ÏÂ¼¶ÐÅÏ¢
	local nUpgradeCostFund, nNextMaintainFund, nNextScale, nNextOpenFund, dNextAdvanceRepairCount,nNextAdvanceEnhance,szNextRepairKind
	if (nCurLevel < wsGetMaxLevel(nTongID, nType))then		
		nUpgradeCostFund = wsGetUpgradeCostFund(nTongID, nType, nCurLevel)  --Éý¼¶ÏûºÄ
	else
		nUpgradeCostFund = "--"
	end
	if (nUseLevel < wsGetMaxLevel(nTongID, nType))then
		nNextMaintainFund = wsGetMaintainCost(nTongID, nType, nUseLevel+1, bOpen)  --ÏÂ¼¶Î¬»¤ÏûºÄ
		nNextOpenFund = wsGetOpenCost(nTongID, nType, nUseLevel+1) 	--ÏÂ¼¶¿ªÆôÏûºÄ
		nNextScale = format("%.1f",aLevelRepairScale[nUseLevel + 1] / 10) --ÏÂ¼¶Î¬ÐÞ×°±¸´òÕÛÊý
		dNextAdvanceRepairCount = format("%.2f", aLevelCoef[nUseLevel + 1] / aLevelCoef[1]) --ÏÂ¼¶Ã¿ÈÕÇ¿»¯ÐÞÀí×ÜÁ¿Ìá¸ß
		nNextAdvanceEnhance = aLevelEnhanceAdd[nUseLevel + 1]
		if(aLevelRepairLevel[nUseLevel + 1] == 1) then
			szNextRepairKind = "<color=white>Trang bÞ tr¾ng<color>, <color=water>trang bÞ xanh<color>"
		elseif(aLevelRepairLevel[nUseLevel + 1] == 2) then
			szNextRepairKind = "<color=white>Trang bÞ tr¾ng<color>, <color=water>trang bÞ xanh<color>, <color=Violet>trang bÞ tÝm<color>"
		else
			szNextRepairKind = "<color=white>Trang bÞ tr¾ng<color>, <color=water>trang bÞ xanh<color>, <color=Violet>trang bÞ tÝm<color>, <color=gold>trang bÞ Hoµng Kim<color>"
		end
	else		
		nNextMaintainFund = "--"
		nNextOpenFund = "--"
		nNextScale = "--"
		dNextAdvanceRepairCount = "--"
		szNextRepairKind = "<color=Violet>--<color>"
		nNextAdvanceEnhance = "--"
	end
	if (nWorkshopID ~= 0)then
		local state 
		if bPause == 1 then state="<color=yellow>T¹m ngõng" elseif bOpen == 1 then state="<color=green>Khai më" else state="<color=red>§ãng cöa" end
		local szMsg = "Tr¹ng th¸i t¸c ph­êng: "..state.."<color>\n"..
			"§¼ng cÊp t¸c ph­êng: <color=gold>"..nCurLevel.."<color>\n"..
			"§¼ng cÊp sö dông hiÖn t¹i: <color=gold>"..nUseLevel.."<color>\n"..
			"Chñng lo¹i trang bÞ cã thÓ söa ch÷a: "..szRepairKind.."\n"..
			"§iÓm ­u ®·i söa ch÷a: <color=gold>"..nScale.."<color> phÇn tr¨m\n"..
			"Söa gia cè ®é bÒn v­ît giíi h¹n: <color=gold>"..nAdvanceEnhance.."%<color>\n"..
			"Mçi ngµy tæng l­îng söa gia cè t¨ng lªn: <color=gold>"..dAdvanceRepairCount.."<color> lÇn\n"..		
			"Ng©n s¸ch chiÕn bÞ chi cho phÝ b¶o tr× bang mçi ngµy: <color=gold>"..nMaintainFund.." v¹n<color>\n"..
			"Ng©n s¸ch kiÕn thiÕt ban ®Çu: <color=gold>"..nOpenFund.." v¹n<color>\n"..
			"Ng©n s¸ch kiÕn thiÕt ®Ó n©ng cÊp: <color=gold>"..nUpgradeCostFund.." v¹n<color>\n"..
			"<color=green>§¼ng cÊp sö dông kÕ tiÕp <color>\n"..
			"<color=water>Chñng lo¹i cã thÓ söa ch÷a: "..szNextRepairKind.."\n"..
			"§iÓm ­u ®·i söa ch÷a: <color=Violet>"..nNextScale.."<color> phÇn tr¨m\n"..
			"Söa gia cè ®é bÒn v­ît giíi h¹n: <color=Violet>"..nNextAdvanceEnhance.."%<color>\n"..
			"Mçi ngµy tæng l­îng söa gia cè t¨ng lªn: <color=Violet>"..dNextAdvanceRepairCount.."<color> lÇn\n"..	
			"Ng©n s¸ch chiÕn bÞ chi cho phÝ b¶o tr× bang mçi ngµy: <color=Violet>"..nNextMaintainFund.." v¹n<color>\n"..
			"Ng©n s¸ch kiÕn thiÕt ban ®Çu: <color=Violet>"..nNextOpenFund.." v¹n<color>\n"
		return szMsg
	else
		local szMsg = "Tr¹ng th¸i t¸c ph­êng: <color=water>Ch­a thµnh lËp<color>\n"..
			"Ng©n s¸ch kiÕn thÕt cÇn ®Ó x©y dùng: <color=gold>"..nUpgradeCostFund.." v¹n<color>\n"..
			"<color=green>§¼ng cÊp kÕ tiÕp <color>\n"..
			"<color=water>Chñng lo¹i cã thÓ söa ch÷a: "..szNextRepairKind.."\n"..
			"§iÓm ­u ®·i söa ch÷a: <color=Violet>"..nNextScale.."<color> phÇn tr¨m\n"..
			"Söa gia cè ®é bÒn v­ît giíi h¹n: <color=Violet>"..nNextAdvanceEnhance.."%<color>\n"..
			"Mçi ngµy tæng l­îng söa gia cè t¨ng lªn: <color=Violet>"..dNextAdvanceRepairCount.."<color> lÇn\n"..	
			"Ng©n s¸ch chiÕn bÞ chi cho phÝ b¶o tr× bang mçi ngµy: <color=Violet>"..nNextMaintainFund.." v¹n<color>\n"..
			"Ng©n s¸ch kiÕn thiÕt ban ®Çu: <color=Violet>"..nNextOpenFund.." v¹n<color>\n"
		return szMsg
	end
end

end