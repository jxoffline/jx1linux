Include("\\script\\vng_feature\\nangcapvodanh\\ringtable.lua")
Include("\\script\\lib\\composeex.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
tbVnRingUpgrade = {}--tbActivityCompose:new()
tbVnRingDowngrade = {}
tbVnRingRefine = {}
function tbVnRingUpgrade:SelectRing(strRingType)
	local strRingName = tbRingName[strRingType]
	tbOpt = {
		{format("N©ng cÊp %s", strRingName), tbVnRingUpgrade.UpgradeSelectedRing, {tbVnRingUpgrade, strRingType}},
		{format("H¹ cÊp %s", strRingName), tbVnRingDowngrade.SelectLevel, {tbVnRingDowngrade, strRingType}},
		{format("Trïng luyÖn %s", strRingName), tbVnRingRefine.SelectLevel, {tbVnRingRefine, strRingType}},
		{"Hñy bá"},
	}
	CreateNewSayEx("C¸c h¹ cÇn g×?", tbOpt)
end

function tbVnRingUpgrade:UpgradeSelectedRing(strRingType)
	local strRingName = tbRingName[strRingType]
	tbOpt = {
		{format("N©ng cÊp lªn %s cÊp 1", strRingName), tbVnRingUpgrade.UpgradeSelectedRing1, {tbVnRingUpgrade, strRingType, 1}},
		{format("N©ng cÊp lªn %s cÊp 2", strRingName), tbVnRingUpgrade.UpgradeSelectedRing1, {tbVnRingUpgrade, strRingType, 2}},
		{format("N©ng cÊp lªn %s cÊp 3", strRingName), tbVnRingUpgrade.UpgradeSelectedRing1, {tbVnRingUpgrade, strRingType, 3}},
		{format("N©ng cÊp lªn %s cÊp 4", strRingName), tbVnRingUpgrade.SelectOption1, {tbVnRingUpgrade, strRingType, 4}},
		{format("N©ng cÊp lªn %s cÊp 5", strRingName), tbVnRingUpgrade.SelectOption1, {tbVnRingUpgrade, strRingType, 5}},
		{format("N©ng cÊp lªn %s cÊp 6", strRingName), tbVnRingUpgrade.SelectOption1, {tbVnRingUpgrade, strRingType, 6}},
		{format("N©ng cÊp lªn %s cÊp 7", strRingName), tbVnRingUpgrade.SelectOption1, {tbVnRingUpgrade, strRingType, 7}},
--		{format("N©ng cÊp lªn %s cÊp 8", strRingName), tbVnRingUpgrade.SelectOption1, {tbVnRingUpgrade, strRingType, 8}},
--		{format("N©ng cÊp lªn %s cÊp 9", strRingName), tbVnRingUpgrade.SelectOption1, {tbVnRingUpgrade, strRingType, 9}},
--		{format("N©ng cÊp lªn %s cÊp 10", strRingName), tbVnRingUpgrade.SelectOption1, {tbVnRingUpgrade, strRingType, 10}},
		{"Hñy bá"},
	}
	CreateNewSayEx("C¸c h¹ cÇn g×?", tbOpt)
end

function tbVnRingUpgrade:UpgradeSelectedRing1(strRingType, nLevel)
	if nLevel < 1 or nLevel > 3 then
		error("upgrade ring - wrong level")
		return
	end
	local tbFormula = self:GetFormula(strRingType, nLevel, 0, 0)
	local tbItem2Ring = tbActivityCompose:new()
	local p = tbItem2Ring:new(tbFormula, "NangCap"..strRingType.."Cap"..nLevel, INVENTORY_ROOM.room_giveitem)
	p:ComposeGiveUI()
end

function tbVnRingUpgrade:SelectOption1(strRingType, nLevel)
	local strRingName = tbRingName[strRingType]
	tbOpt = {
		{"Kh¸ng Háa", tbVnRingUpgrade.SelectOption2, {tbVnRingUpgrade, strRingType, nLevel,1}},
		{"Kh¸ng B¨ng", tbVnRingUpgrade.SelectOption2, {tbVnRingUpgrade, strRingType, nLevel,2}},
		{"Kh¸ng L«i", tbVnRingUpgrade.SelectOption2, {tbVnRingUpgrade, strRingType, nLevel,3}},
		{"Kh¸ng §éc", tbVnRingUpgrade.SelectOption2, {tbVnRingUpgrade, strRingType, nLevel,4}},
		{"Phßng Thñ VËt Lý", tbVnRingUpgrade.SelectOption2, {tbVnRingUpgrade, strRingType, nLevel,5}},
		{"Hñy bá"},
	}
	if nLevel > 4 then
		CreateNewSayEx(format("N©ng cÊp nhÉn <color=yellow>%s<color> lªn  cÊp <color=yellow>%d<color>  cho phÐp gi÷ l¹i kh¸ng tÝnh vµ hiÖu øng hiÖn t¹i cña nhÉn, xin c¸c h¹ h·y chän kh¸ng tÝnh vµ hiÖu øng cña nhÉn hiÖn t¹i ®ang cã:", strRingName, nLevel), tbOpt)
	else
		CreateNewSayEx(format("N©ng cÊp nhÉn <color=yellow>%s<color> lªn  cÊp <color=yellow>%d<color>  cho phÐp c¸c h¹ tïy ý chän kh¸ng vµ hiÖu øng cho nhÉn cña m×nh, xin h·y lùa chän kh¸ng tÝnh:", strRingName, nLevel), tbOpt)
	end
end

function tbVnRingUpgrade:SelectOption2(strRingType, nLevel, nOption1)
	local strRingName = tbRingName[strRingType]
	tbOpt = {
		{"Thêi Gian Tróng §éc", tbVnRingUpgrade.ConfirmSelectedOption, {tbVnRingUpgrade, strRingType, nLevel, nOption1, 1}},
		{"Thêi Gian Cho¸ng", tbVnRingUpgrade.ConfirmSelectedOption, {tbVnRingUpgrade, strRingType, nLevel, nOption1, 2}},
		{"Thêi Gian Lµm ChËm", tbVnRingUpgrade.ConfirmSelectedOption, {tbVnRingUpgrade, strRingType, nLevel, nOption1, 3}},		
		{"Hñy bá"},
	}
	if nLevel > 4 then
		CreateNewSayEx(format("N©ng cÊp nhÉn <color=yellow>%s<color> lªn  cÊp <color=yellow>%d<color>  cho phÐp gi÷ l¹i kh¸ng tÝnh vµ hiÖu øng hiÖn t¹i cña nhÉn, xin c¸c h¹ h·y chän kh¸ng tÝnh vµ hiÖu øng cña nhÉn hiÖn t¹i ®ang cã:", strRingName, nLevel), tbOpt)
	else
		CreateNewSayEx(format("N©ng cÊp nhÉn <color=yellow>%s<color> lªn  cÊp <color=yellow>%d<color>  cho phÐp c¸c h¹ tïy ý chän kh¸ng vµ hiÖu øng cho nhÉn cña m×nh, xin h·y lùa chän kh¸ng tÝnh:", strRingName, nLevel), tbOpt)
	end
end

function tbVnRingUpgrade:ConfirmSelectedOption(strRingType, nLevel, nOption1, nOption2)	
	local strRingName = tbRingName[strRingType]
	tbOpt = {
		{"X¸c nhËn chÕ t¹o", tbVnRingUpgrade.UpgradeSelectedRing2, {tbVnRingUpgrade, strRingType, nLevel, nOption1, nOption2}},	
		{"Ta muèn chän l¹i", tbVnRingUpgrade.SelectOption1, {tbVnRingUpgrade, strRingType, nLevel}},		
		{"Hñy bá"},
	}
	CreateNewSayEx(format("C¸c h¹ ®· lùa chän n©ng cÊp lªn nhÉn <color=yellow>%s<color>  cÊp <color=yellow>%d<color>  <color=yellow>%s - %s<color>, ng­¬i cã muèn chÕ t¹o ngay kh«ng?", strRingName, nLevel, tbOpt1Name[nOption1], tbOpt2Name[nOption2]), tbOpt)
end

function tbVnRingUpgrade:UpgradeSelectedRing2(strRingType, nLevel, nFirstOpt, nSecondOpt)
	if nLevel < 3 or nLevel > 7 then
		error("upgrade ring - wrong level")
		return
	end
	local tbFormula = self:GetFormula(strRingType, nLevel, nFirstOpt, nSecondOpt)
	local tbItem2Ring = tbActivityCompose:new()
	local p = tbItem2Ring:new(tbFormula, "NangCap"..strRingType.."Cap"..nLevel, INVENTORY_ROOM.room_giveitem)
	p:ComposeGiveUI()
end

function tbVnRingUpgrade:GetFormula(strRingType, nLevel, nFirstOpt, nSecondOpt)
	local nOpt1, nOpt2
	if nLevel > 0 and nLevel <= 3 then
		nOpt1 = 0
		nOpt2 = 0
	else
		nOpt1 = nFirstOpt
		nOpt2 = nSecondOpt
	end
	if not tbUnnamedRing[strRingType] or not tbUnnamedRing[strRingType][nLevel] or not tbUnnamedRing[strRingType][nLevel][nOpt1] or not tbUnnamedRing[strRingType][nLevel][nOpt1][nOpt2] then
		error("upgrade ring - cannot get ring info")
		return
	end
	local tbRing = tbUnnamedRing[strRingType][nLevel]
	local tbRing1 = tbRing[nOpt1][nOpt2]	
	local tbMat = {}	
	for i =1, getn(tbRing.tbCommonMaterial) do
		tinsert(tbMat, tbRing.tbCommonMaterial[i])
	end
	for i = 1, getn(tbRing1.tbMaterial) do
		tinsert(tbMat, tbRing1.tbMaterial[i])
	end	
	local tbFormula = {		
		tbMaterial = tbMat,		
		tbProduct = tbRing1.tbProduct,	
		nWidth = 1,
		nHeight = 1,
		nFreeItemCellLimit = 1,
	}
	return tbFormula
end

--H¹ cÊp nhÉn
function tbVnRingDowngrade:SelectLevel(strRingType)
	local strRingName = tbRingName[strRingType]
	tbOpt = {
		{format("Ta cã nhÉn cÊp %d", 4), tbVnRingDowngrade.SelectOption1, {tbVnRingDowngrade, strRingType, 4}},
		{format("Ta cã nhÉn cÊp %d", 5), tbVnRingDowngrade.SelectOption1, {tbVnRingDowngrade, strRingType, 5}},
		{format("Ta cã nhÉn cÊp %d", 6), tbVnRingDowngrade.SelectOption1, {tbVnRingDowngrade, strRingType, 6}},
--		{format("Ta cã nhÉn cÊp %d", 7), tbVnRingDowngrade.SelectOption1, {tbVnRingDowngrade, strRingType, 7}},
--		{format("Ta cã nhÉn cÊp %d", 8), tbVnRingDowngrade.SelectOption1, {tbVnRingDowngrade, strRingType, 8}},
--		{format("Ta cã nhÉn cÊp %d", 9), tbVnRingDowngrade.SelectOption1, {tbVnRingDowngrade, strRingType, 9}},
--		{format("Ta cã nhÉn cÊp %d", 10), tbVnRingDowngrade.SelectOption1, {tbVnRingDowngrade, strRingType, 10}},
		{"Hñy bá"},
	}
	CreateNewSayEx("Chøc n¨ng h¹ cÊp nhÉn <color=yellow>[Tinh X¶o] V« Danh<color> gióp c¸c h¹ huû bá kh¸ng tÝnh vµ hiÖu øng cña tÊt c¶ c¸c nhÉn <color=yellow>[Tinh X¶o]<color> cÊp 4 trë lªn vµ ®­a nhÉn vÒ cÊp 3, tõ ®©y c¸c h¹ cã thÓ dïng chøc n¨ng n©ng cÊp ®Ó chän l¹i kh¸ng tÝnh vµ hiÖu øng cho nhÉn cña m×nh. §Ó viÖc h¹ cÊp ®­îc thµnh c«ng, tr­íc tiªn ta cÇn biÕt thuéc tÝnh cña nhÉn c¸c h¹ nh­ thÕ nµo?", tbOpt)
end

function tbVnRingDowngrade:SelectOption1(strRingType, nLevel)
	local strRingName = tbRingName[strRingType]
	tbOpt = {
		{format("%s", tbOpt1Name[1]), tbVnRingDowngrade.SelectOption2, {tbVnRingDowngrade, strRingType, nLevel, 1}},
		{format("%s", tbOpt1Name[2]), tbVnRingDowngrade.SelectOption2, {tbVnRingDowngrade, strRingType, nLevel, 2}},
		{format("%s", tbOpt1Name[3]), tbVnRingDowngrade.SelectOption2, {tbVnRingDowngrade, strRingType, nLevel, 3}},
		{format("%s", tbOpt1Name[4]), tbVnRingDowngrade.SelectOption2, {tbVnRingDowngrade, strRingType, nLevel, 4}},
		{format("%s", tbOpt1Name[5]), tbVnRingDowngrade.SelectOption2, {tbVnRingDowngrade, strRingType, nLevel, 5}},
		{"Hñy bá"},
	}
	CreateNewSayEx(format("H¹ cÊp nhÉn <color=yellow>%s<color> cÊp <color=yellow>%d<color>", strRingName, nLevel), tbOpt)
end

function tbVnRingDowngrade:SelectOption2(strRingType, nLevel, nOpt1)
	local strRingName = tbRingName[strRingType]
	local strOpt1Name = tbOpt1Name[nOpt1]
	tbOpt = {
		{format("%s", tbOpt2Name[1]), tbVnRingDowngrade.ConfirmSelectedOption, {tbVnRingDowngrade, strRingType, nLevel, nOpt1, 1}},
		{format("%s", tbOpt2Name[2]), tbVnRingDowngrade.ConfirmSelectedOption, {tbVnRingDowngrade, strRingType, nLevel, nOpt1, 2}},
		{format("%s", tbOpt2Name[3]), tbVnRingDowngrade.ConfirmSelectedOption, {tbVnRingDowngrade, strRingType, nLevel, nOpt1, 3}},		
		{"Chän l¹i kh¸ng tÝnh", tbVnRingDowngrade.SelectOption1, {tbVnRingDowngrade, strRingType, nLevel}},
		{"Hñy bá"},
	}
	CreateNewSayEx(format("H¹ cÊp nhÉn <color=yellow>%s<color> cÊp <color=yellow>%d %s<color>", strRingName, nLevel, tbOpt1Name[nOpt1]), tbOpt)
end

function tbVnRingDowngrade:ConfirmSelectedOption(strRingType, nLevel, nOption1, nOption2)	
	local strRingName = tbRingName[strRingType]
	tbOpt = {
		{"X¸c nhËn h¹ cÊp", tbVnRingDowngrade.DowngradeSelectedRing, {tbVnRingDowngrade, strRingType, nLevel, nOption1, nOption2}},	
		{"Ta muèn chän l¹i", tbVnRingDowngrade.SelectOption1, {tbVnRingDowngrade, strRingType, nLevel}},		
		{"Hñy bá"},
	}
	CreateNewSayEx(format("C¸c h¹ ®· lùa chän h¹ cÊp nhÉn <color=yellow>%s<color>  cÊp <color=yellow>%d<color>  <color=yellow>%s - %s<color>, ng­¬i cã muèn ta lµm ngay kh«ng?", strRingName, nLevel, tbOpt1Name[nOption1], tbOpt2Name[nOption2]), tbOpt)
end

function tbVnRingDowngrade:DowngradeSelectedRing(strRingType, nLevel, nFirstOpt, nSecondOpt)
	if nLevel < 4 or nLevel > 7 then
		error("downgrade ring - wrong level")
		return
	end
	local tbFormula = self:GetFormula(strRingType, nLevel, nFirstOpt, nSecondOpt)
	local tbItem2Ring = tbActivityCompose:new()
	local p = tbItem2Ring:new(tbFormula, "HaCap"..strRingType.."Cap"..nLevel, INVENTORY_ROOM.room_giveitem)
	p:ComposeGiveUI()
end

function tbVnRingDowngrade:GetFormula(strRingType, nLevel, nFirstOpt, nSecondOpt)
	local tbFormula = tbVnRingUpgrade:GetFormula(strRingType, nLevel, nFirstOpt, nSecondOpt)	
	local tbMat = {}
	--ring material	
	tinsert(tbMat, tbFormula.tbProduct)		
	
	--other material
	local tbRing = tbUnnamedRing[strRingType]
	for i =1, getn(tbRing.tbDowngradeMaterial) do
		tinsert(tbMat, tbRing.tbDowngradeMaterial[i])
	end
	local tbFormula2 = {		
		tbMaterial = tbMat,
		tbProduct = tbRing[3][0][0].tbProduct,
		nWidth = 1,
		nHeight = 1,
		nFreeItemCellLimit = 1,
	}	
	return tbFormula2
end

--trïng luyÖn nhÉn
function tbVnRingRefine:SelectLevel(strRingType)
	local strRingName = tbRingName[strRingType]
	tbOpt = {
		{format("Ta cã nhÉn cÊp %d", 4), tbVnRingRefine.SelectOption1, {tbVnRingRefine, strRingType, 4}},
		{format("Ta cã nhÉn cÊp %d", 5), tbVnRingRefine.SelectOption1, {tbVnRingRefine, strRingType, 5}},
		{format("Ta cã nhÉn cÊp %d", 6), tbVnRingRefine.SelectOption1, {tbVnRingRefine, strRingType, 6}},
		{format("Ta cã nhÉn cÊp %d", 7), tbVnRingRefine.SelectOption1, {tbVnRingRefine, strRingType, 7}},
--		{format("Ta cã nhÉn cÊp %d", 8), tbVnRingRefine.SelectOption1, {tbVnRingRefine, strRingType, 8}},
--		{format("Ta cã nhÉn cÊp %d", 9), tbVnRingRefine.SelectOption1, {tbVnRingRefine, strRingType, 9}},
--		{format("Ta cã nhÉn cÊp %d", 10), tbVnRingRefine.SelectOption1, {tbVnRingRefine, strRingType, 10}},
		{"Hñy bá"},
	}
	CreateNewSayEx("Ta cã thÓ gióp c¸c h¹ t¨ng c­êng c¸c chØ sè cña nhÉn <color=yellow>[Tinh X¶o] V« Danh<color>  mµ vÉn gi÷ nguyªn kh¸ng vµ thuéc tÝnh hiÖn cã th«ng qua chøc n¨ng trïng luyÖn . §Ó viÖc h¹ cÊp ®­îc thµnh c«ng, tr­íc tiªn ta cÇn biÕt thuéc tÝnh cña nhÉn c¸c h¹ nh­ thÕ nµo?", tbOpt)
end

function tbVnRingRefine:SelectOption1(strRingType, nLevel)
	local strRingName = tbRingName[strRingType]
	tbOpt = {
		{format("%s", tbOpt1Name[1]), tbVnRingRefine.SelectOption2, {tbVnRingRefine, strRingType, nLevel, 1}},
		{format("%s", tbOpt1Name[2]), tbVnRingRefine.SelectOption2, {tbVnRingRefine, strRingType, nLevel, 2}},
		{format("%s", tbOpt1Name[3]), tbVnRingRefine.SelectOption2, {tbVnRingRefine, strRingType, nLevel, 3}},
		{format("%s", tbOpt1Name[4]), tbVnRingRefine.SelectOption2, {tbVnRingRefine, strRingType, nLevel, 4}},
		{format("%s", tbOpt1Name[5]), tbVnRingRefine.SelectOption2, {tbVnRingRefine, strRingType, nLevel, 5}},
		{"Hñy bá"},
	}
	CreateNewSayEx(format("Trïng luyÖn nhÉn <color=yellow>%s<color> cÊp <color=yellow>%d<color>", strRingName, nLevel), tbOpt)
end

function tbVnRingRefine:SelectOption2(strRingType, nLevel, nOpt1)
	local strRingName = tbRingName[strRingType]
	local strOpt1Name = tbOpt1Name[nOpt1]
	tbOpt = {
		{format("%s", tbOpt2Name[1]), tbVnRingRefine.ConfirmSelectedOption, {tbVnRingRefine, strRingType, nLevel, nOpt1, 1}},
		{format("%s", tbOpt2Name[2]), tbVnRingRefine.ConfirmSelectedOption, {tbVnRingRefine, strRingType, nLevel, nOpt1, 2}},
		{format("%s", tbOpt2Name[3]), tbVnRingRefine.ConfirmSelectedOption, {tbVnRingRefine, strRingType, nLevel, nOpt1, 3}},		
		{"Chän l¹i kh¸ng tÝnh", tbVnRingRefine.SelectOption1, {tbVnRingRefine, strRingType, nLevel}},
		{"Hñy bá"},
	}
	CreateNewSayEx(format("Trïng luyÖn nhÉn <color=yellow>%s<color> cÊp <color=yellow>%d %s<color>", strRingName, nLevel, tbOpt1Name[nOpt1]), tbOpt)
end

function tbVnRingRefine:ConfirmSelectedOption(strRingType, nLevel, nOption1, nOption2)	
	local strRingName = tbRingName[strRingType]
	tbOpt = {
		{"X¸c nhËn trïng luyÖn", tbVnRingRefine.RefineSelectedRing, {tbVnRingRefine, strRingType, nLevel, nOption1, nOption2}},	
		{"Ta muèn chän l¹i", tbVnRingRefine.SelectOption1, {tbVnRingRefine, strRingType, nLevel}},		
		{"Hñy bá"},
	}
	CreateNewSayEx(format("C¸c h¹ ®· lùa chän trïng luyÖn nhÉn <color=yellow>%s<color>  cÊp <color=yellow>%d<color>  <color=yellow>%s - %s<color>, ng­¬i cã muèn ta lµm ngay kh«ng?", strRingName, nLevel, tbOpt1Name[nOption1], tbOpt2Name[nOption2]), tbOpt)
end

function tbVnRingRefine:RefineSelectedRing(strRingType, nLevel, nFirstOpt, nSecondOpt)
	if nLevel < 4 or nLevel > 7 then
		error("refine ring - wrong level")
		return
	end
	local tbFormula = self:GetFormula(strRingType, nLevel, nFirstOpt, nSecondOpt)
	local tbItem2Ring = tbActivityCompose:new()
	local p = tbItem2Ring:new(tbFormula, "TrungLuyen"..strRingType.."Cap"..nLevel, INVENTORY_ROOM.room_giveitem)
	p:ComposeGiveUI()
end

function tbVnRingRefine:GetFormula(strRingType, nLevel, nFirstOpt, nSecondOpt)
	local tbFormula = tbVnRingUpgrade:GetFormula(strRingType, nLevel, nFirstOpt, nSecondOpt)	
	local tbMat = {}
	--ring material	
	tinsert(tbMat, tbFormula.tbProduct)		
	
	--other material
	local tbRing = tbUnnamedRing[strRingType]
	for i =1, getn(tbRing.tbRefineMaterial) do
		tinsert(tbMat, tbRing.tbRefineMaterial[i])
	end
	local tbFormula2 = {		
		tbMaterial = tbMat,
		tbProduct = tbFormula.tbProduct,
		nWidth = 1,
		nHeight = 1,
		nFreeItemCellLimit = 1,
	}	
	return tbFormula2
end

function tbVnRingUpgrade:MainDialog()
	do return end
	local tbOpt = {
		{"[Tinh X¶o] V« Danh ChØ Hoµn", tbVnRingUpgrade.SelectRing, {tbVnRingUpgrade, "VoDanhChiHoan"}},
		{"[Tinh X¶o] V« Danh Giíi ChØ", tbVnRingUpgrade.SelectRing, {tbVnRingUpgrade, "VoDanhGioiChi"}},
		{"[Tinh X¶o] Cµn Kh«n Giíi ChØ", tbVnRingUpgrade.SelectRing, {tbVnRingUpgrade, "CanKhonGioiChi"}},
		{"Hñy bá"},
	}
	local msg = "Ta cã thÓ gióp c¸c h¹ n©ng cÊp, h¹ cÊp, trïng luyÖn c¸c lo¹i nhÉn <color=yellow>[Tinh X¶o]V« Danh<color>, tr­íc tiªn ng­¬i h·y chän lo¹i nhÉn?"
	CreateNewSayEx(msg, tbOpt)
end
--pEventType:Reg("Thî rÌn thÇn bÝ", "Liªn quan ®Õn nhÉn V« Danh", tbVnRingUpgrade.MainDialog, {tbVnRingUpgrade});