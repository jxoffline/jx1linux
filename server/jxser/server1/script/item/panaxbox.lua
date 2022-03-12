--ÁìÈ¡ÌØ¼¼Ê±£¬¿ªÆô²Î¹Þ£¬¼Ó¼¼ÄÜ£¬
--ÌáÊ¾¸øÓë²Î¹Þ£¬²¢¿ªÆô²Î¹Þ£¬¹Ø±Õ²Î¹Þ¼´¿ÉÊ¹Áé²ÎÁ¦±£´æÏÂÀ´¡£
TASKID_PANAXBOX_OPEND = 1577
TASKID_PANAXBOX_LASTIME = 1578
LINGSHENLI_TIME = 7 * 60 * 60

function main(nItemIndex)
	local nParam1 = GetItemParam(nItemIndex, 1)
	if (nParam1 == 0 and GetTask(TASKID_PANAXBOX_OPEND) == 0) then
		Say("Muèn sö dông Linh s©m lùc?", 2, "më /#lingshenli_want2open("..nItemIndex..")", "Hñy bá /OnCancel")
	elseif (nParam1 == 1 and GetTask(TASKID_PANAXBOX_OPEND) == 1) then
		Say("Muèn lµm hép linh s©m kh«ng?", 2, "§ãng/#lingshenli_want2close("..nItemIndex..")", "Hñy bá /OnCancel")
	elseif (nParam1 == 1 and GetTask(TASKID_PANAXBOX_OPEND) == 0) then
		SetTask(TASKID_PANAXBOX_OPEND, 1)
	else
		Say("§· cã 1 nh©n s©m tr¨m n¨m ph¸t huy t¸c dông", 0)
	end
	return 1
end

function lingshenli_confirm(nItemIndex)
	if (RemoveItemByIndex(nItemIndex) == 1) then
		AddSkillState(735, 5, 1, LINGSHENLI_TIME * 18, 1);
		Msg2Player("NhËn ®­îc linh lùc cña nh©n s©m ngµn n¨m, gióp t¨ng sinh lùc 20%, néi lùc 20% vµ kh¸ng tÊt c¶ 10 ®iÓm trong vßng 7 giê.");
	else
		print("ERROR!! ADD LINGSHENLI FAILED! NO ITEMINDEX");
	end;
end;

function OnCancel()
end

function lingshenli_want2open(nItemIndex)
	local nParam2 = GetItemParam(nItemIndex, 2)
	local nParam3 = GetItemParam(nItemIndex, 3)

	if (nParam2 == 0) then
		SetSpecItemParam(nItemIndex, 2, LINGSHENLI_TIME)
		nParam2 = LINGSHENLI_TIME
	elseif (nParam2 == -1) then
		RemoveItemByIndex(nItemIndex)
		SetTask(TASKID_PANAXBOX_OPEND, 0)
		Msg2Player("Hép nh©n s©m nµy ®· mÊt hÕt linh lùc!")
	end
	SetSpecItemParam(nItemIndex, 3, GetGameTime())
	SetSpecItemParam(nItemIndex, 1, 1)
	SyncItem(nItemIndex)
	SetTask(TASKID_PANAXBOX_OPEND, 1)
	AddSkillState(735, 5, 1, nParam2 * 18, 1)
	local nMin, nSec = GetTimeSec2Min(nParam2)
	if (nMin <= 0) then
		Msg2Player("Hép nh©n s©m nµy cã thÓ ph¸t huy t¸c dông trong "..nSec.." gi©y.")
	else
		Msg2Player("Hép nh©n s©m nµy cã thÓ ph¸t huy t¸c dông trong "..nMin.."phót")
	end
end

function lingshenli_want2close(nItemIndex)
	local nParam2 = GetItemParam(nItemIndex, 2)
	local nParam3 = GetItemParam(nItemIndex, 3)
	local nGameTime = GetGameTime()
	local nlast = nParam2 - (nGameTime - nParam3)
	if (nlast <= 0) then
		SetSpecItemParam(nItemIndex, 2, -1)
		RemoveItemByIndex(nItemIndex)
		Msg2Player("Hép nh©n s©m nµy ®· mÊt hÕt linh lùc!")
		AddSkillState(735, 5, 0, 0)
	else
		SetSpecItemParam(nItemIndex, 3, GetGameTime())
		SetSpecItemParam(nItemIndex, 2, nlast)
		SetSpecItemParam(nItemIndex, 1, 0)
		SyncItem(nItemIndex)
		local nMin, nSec = GetTimeSec2Min(nlast)
		if (nMin <= 0) then
			Msg2Player("Hép nh©n s©m nµy vÉn cßn linh lùc"..nSec.." gi©y.")
		else
			Msg2Player("Hép nh©n s©m nµy vÉn cßn linh lùc"..nMin.."phót")
		end
		AddSkillState(735, 5, 0, 0)
	end
	SetTask(TASKID_PANAXBOX_OPEND, 0)
end

function GetTimeSec2Min(nlast)
	return floor(nlast / 60), mod(nlast, 60)
end

function GetDesc(nItem)
	local nParam1 = GetItemParam(nItem, 1)
	if (nParam1 <= 0) then
		return "<color=blue>Tr¹ng th¸i ®ãng<color>"
	else
		return "<color=blue>Tr¹ng th¸i më<color>"
	end
end