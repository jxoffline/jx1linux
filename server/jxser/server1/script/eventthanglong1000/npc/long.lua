Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\EventThangLong1000\\head.lua")
tbCTL = 
{
	{szName = "C«ng Tr¹ng LÖnh", tbProp = {6,1, 30048,1,0,0}, nExpiredTime = 20101025, nCount = 1},
}
function main(nItemIndex)
	local nItemData	= tonumber(FormatTime2String("%Y%m%d%H%M",ITEM_GetExpiredTime(nItemIndex)));
	local nDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	if nDate > nItemData then
		Msg2Player("VËt phÈm qu¸ h¹n sö dông, tù ®éng mÊt ®i.")
		return 0;
	end
	if (GetLevel() < 50) then
		Talk(1, "", "§¼ng cÊp nhá h¬n 50 kh«ng thÓ sö dông !");
		return 1
	end
	if CalcFreeItemCellCount() < 10 then
			Talk(1, "", "Hµnh trang kh«ng ®ñ 10 « trèng.");
			return 1
	end
	local nGenre, nDetailType, nPartType = GetItemProp(nItemIndex)
	if (nPartType == 30052) then
		TieuLongControl()
	else
		TrungDaiLongControl(nPartType)
	end
	
end

function TieuLongControl()
	if (GetTask(Task_Use_TieuLong) >= 1000) then
		Talk(1, "", "(§· sö dông tèi ®a vËt phÈm nµy. Kh«ng thÓ sö dông thªm ®­îc n÷a !.");
		return 1
	end
	SetTask(Task_Use_TieuLong, GetTask(Task_Use_TieuLong) + 1)
	tbAwardTemplet:GiveAwardByList(tbCTL, "Event 1000 N¨m Th¨ng Long, Use TiÓu Long");
	AddOwnExp(2000000)
	Msg2Player("Ban nhËn ®­îc 2000000 ®iÓm kinh nghiÖm")
	WriteLog(date("%Y%m%d %H%M%S").."\t".."Event 1000 N¨m Th¨ng Long"..GetAccount().."\t"..GetName().."\t".."Sö Dông TiÓu Long nhËn 2000000 ®iÓm EXP ")
end
function TrungDaiLongControl(nPartType)
	if (GetTask(Task_Use_TrungDaiLong) >= 60000) then
		Talk(1, "", "(§· sö dông tèi ®a vËt phÈm nµy. Kh«ng thÓ sö dông thªm ®­îc n÷a !.");
		return 1
	end
	if (nPartType == 30054) then--neu la dai long
		tbAwardTemplet:GiveAwardByList(tbCTL, "Event 1000 N¨m Th¨ng Long, Use §¹i Long");		
		tbAwardTemplet:GiveAwardByList(tbAwardItemUseDaiLong, "Event 1000 N¨m Th¨ng Long");
		local nExp, nTaskValue = GetValueByRandom(tbAwardExp)
		SetTask(Task_Use_TrungDaiLong, GetTask(Task_Use_TrungDaiLong) + nTaskValue)
		AddOwnExp(nExp)
		Msg2Player(format("§¹i hiÖp nhËn ®­îc %d ®iÓm kinh nghiÖm", nExp))
		WriteLog(date("%Y%m%d %H%M%S").."\t".."Event 1000 N¨m Th¨ng Long"..GetAccount().."\t"..GetName().."\t".."Sö Dông Trung Long nhËn ®iÓm EXP  " .. nExp)
	else
		SetTask(Task_Use_TrungDaiLong, GetTask(Task_Use_TrungDaiLong) + 20)
		AddOwnExp(2000000)
		Msg2Player("§¹i hiÖp nhËn ®­îc 2000000 ®iÓm kinh nghiÖm !")
		WriteLog(date("%Y%m%d %H%M%S").."\t".."Event 1000 N¨m Th¨ng Long"..GetAccount().."\t"..GetName().."\t".."Sö Dông Trung Long nhËn ®iÓm EXP 2000000")
	end
	
	
end
