Include("\\script\\misc\\vngpromotion\\ipbonus\\ipbonus_2_head.lua");

function main(nItemIndex)
--	if GetItemParam(nItemIndex, 1) == 0 or GetItemParam(nItemIndex, 1) <= tonumber(GetLocalDate("%Y%m%d")) then
--		Talk(1,"", "VËt phÈm nµy ®· hÕt h¹n")
--		return 0
--	end
	
	if GetLevel() < 50 then
		Talk(1,"", "§¼ng cÊp kh«ng ®ñ 50, h·y rÌn luyÖn thªm")
		return 1
	end
	
	local nMonth = tonumber(date("%m"))
	if GetByte(GetTask(TASKID_YELLOW_USE_DATE),1) == nMonth then
		Talk(1,"", "Mçi th¸ng chØ cã thÓ sö dông vËt phÈm  tèi ®a 1 lÇn")
		return 1
	end
		
	if CalcFreeItemCellCount() < 2 then
		Talk(1,"", format("Chç trèng hµnh trang kh«ng ®ñ %d chç, h·y s¾p xÕp l¹i.", 2))
		return 1
	end
	
	local nAddExp = YELLOW_ITEM_EXP
	SetTask(TASKID_YELLOW_USE_DATE, SetByte(GetTask(TASKID_USE_TIMES),1,nMonth))
	AddOwnExp(nAddExp)
	Msg2Player("B¹n nhËn ®­îc "..nAddExp.." ®iÓm kinh nghiÖm.")
	WriteLog(format("[IPBonus]\t%s\t%s\t%s","sö dông Hoµng B¶o H¹p",GetAccount(),GetName()))		
	return 0;
end