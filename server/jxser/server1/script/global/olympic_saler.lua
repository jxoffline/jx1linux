Include("\\script\\global\\olympics_award.lua")

TEMP_QID = 122;
TEMP_QCHOOSE = 123;

function onBuyTicket()
if (IsCharged() ~= 1 ) then
	 Say("Xin lçi! B¹n vÉn ch­a n¹p Card nªn kh«ng thÓ tham gia mua vÐ sè Athens. ", 0)
	return
end
nCount = GetTicketCount();

if (nCount == 0 ) then 
	Say("Xin lçi! HiÖn giê ch­a b¸n vÐ sè! ", 0)
	return
end;

Tab = {};
for i = 1, nCount do 
	Tab[i] = GetQuestionTip(GetTicket(i)).."/OSAsk";
end;
Tab[nCount + 1] = "T¹m thêi kh«ng tham gia tranh ®o¸n n÷a/Cancel";
Say("5000 mét tê vÐ sè, muèn mua kh«ng? ", nCount + 1, Tab)
end;

function OSAsk(nSel)
	nQId = GetTicket(nSel + 1);

	if (nQId == 1000) then
		onMedalmain()
		return	
	end

	Choose = {};
	ChooseCount = GetChooseCount(nQId);
	for i = 1,  ChooseCount do 
		Choose[i] = GetChoose(nQId, i).."/OSSale";
	end;
	Choose[ChooseCount + 1] = "T¹m thêi kh«ng tham gia tranh ®o¸n n÷a/Cancel";
	Say(GetQuestion(nQId), ChooseCount + 1, Choose);
	SetTaskTemp(TEMP_QID, nQId)
end;

function OSSale(nSel)
	if (GetTaskTemp(TEMP_QID) == 0) then 
		return
	end
	SetTaskTemp(TEMP_QCHOOSE, nSel + 1)
	Say(GetQuestion(GetTaskTemp(TEMP_QID)).."\n§Æt:<color=yellow>"..GetChoose(GetTaskTemp(TEMP_QID), GetTaskTemp(TEMP_QCHOOSE)).."<color>\ngi¸: 5000", 2, "§­îc, ta mua. /OSOnSale", "T¹m thêi kh«ng mua/OSCancel");
end;

function OSOnSale()
	nQId = GetTaskTemp(TEMP_QID);
	nQChoose = GetTaskTemp(TEMP_QCHOOSE);
	if (nQId > 0 and nQChoose > 0) then 
		if (Pay(GetQuestionPrice(nQId)) > 0) then 
			if (AddTicket(nQId, nQChoose) == 1) then
				nItem = AddItem(6,1,75,1,0,0)
				SetSpecItemParam(nItem, 1, nQId)
				SetSpecItemParam(nItem, 2, nQChoose)
				SyncItem(nItem)
				Msg2Player("Mua thµnh c«ng mét tê vÐ sè. ")
			else
				Earn(GetQuestionPrice(nQId))
				Say("Xin lçi! Kh«ng thÓ mua vÐ sè cïng lo¹i. ",0)
			end
		else
			Say("TiÒn trªn ng­êi b¹n kh«ng ®ñ! ",0)
		end;
	end
end

function OSCancel()

end;
