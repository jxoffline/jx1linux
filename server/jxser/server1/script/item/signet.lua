Include("\\script\\tong\\tong_award_head.lua");
Include("\\script\\global\\signet_head.lua")

function main(nItemIndex)
	local nItemTime = GetItemParam(nItemIndex,1);
	
	if (signet_clude_use(nItemIndex) == 0) then
		return 1
	end
	
	if (GetWeeklyOffer() >= MAX_WEEK_CONTRIBUTION)	then
		Say("§iÓm cèng hiÕn ®· ®¹t giíi h¹n tuÇn, chØ cã thÓ bæ sung vµo ng©n s¸ch kiÕn thiÕt vµ ng©n s¸ch chiÕn bÞ. Cã muèn sö dông ®¹o cô nµy kh«ng?", 
		2,
		"Sö dông /#signet_sure_use("..nItemIndex..")",
		"Hñy bá /cancel")
		return 1
	end
	--Ôö¼Ó¸öÈË¹±Ï×¶È¼°°ï»á»ù½ð
	tongaward_fenglingdui()
end


function GetDesc(nItemIndex)
	local nYear = GetItemParam(nItemIndex, 2)
	local nMonth = GetItemParam(nItemIndex, 3)
	local nDate = GetItemParam(nItemIndex, 4)

	return "Thêi h¹n sö dông: <color=blue>"..nYear.."n¨m"..nMonth.."nguyÖt "..nDate.."nhËt "
end

function PickUp( nItemIndex, nPlayerIndex )
	local _, nTongID = GetTongName()
	if (nTongID > 0) then
		TONG_ApplyAddTaskValue(nTongID, TONGTSK_MONEYBOX_DROPMAX, 1)
	end
	return 1
end

function signet_sure_use(nItemIndex)
	if (signet_clude_use(nItemIndex) == 0) then
		return 0
	end
	
	if (RemoveItemByIndex(nItemIndex) == 1) then
		tongaward_fenglingdui()
	else
		print("Thao t¸c hñy bá S¸t gi¶ Ên gÆp lçi!")
	end
end

function signet_clude_use(nItemIndex)
	local nParam1 = GetItemParam(nItemIndex, 1)
	local nCurTime = GetCurServerTime()	--/Ãë
	local szItemName = GetItemName(nItemIndex)
	if (nCurTime >= nParam1) then
		Msg2Player(szItemName.." ®· hµo mßn, kh«ng thÓ sö dông!")
		RemoveItemByIndex(nItemIndex)
		return 0
	end
	local _, nTongID = GetTongName()

	if (nTongID == 0) then
		Msg2Player("Kh«ng cã trong bang héi, kh«ng thÓ sö dông ®¹o cô nµy.")
		return 0
	end

	if (TONGM_GetFigure(nTongID, GetName()) == TONG_RETIRE) then
		Msg2Player("Èn sü kh«ng thÓ sö dông ®¹o cô nµy.")
		return 0
	end	
	return 1
end