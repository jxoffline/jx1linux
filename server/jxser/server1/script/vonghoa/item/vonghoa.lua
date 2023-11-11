Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\vonghoa\\item\\head.lua")
Include("\\script\\vonghoa\\item\\yanhua.lua")
Include("\\script\\lib\\awardtemplet.lua")

 
function  main(nItemIndex)
	local nItemData	= tonumber(FormatTime2String("%Y%m%d%H%M",ITEM_GetExpiredTime(nItemIndex)));
	local nDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	
	
	if nDate > nItemData then
		Msg2Player("VËt phÈm qu¸ h¹n sö dông, tù ®éng mÊt ®i.")
		return 0;
	end
	if (GetTask(Task_IsCurUse_VongHoa) ~= 0) then
		Talk(1,"","B¹n ®ang sö dông vËt phÈm !")
		return 1
	end
	if (GetTask(Task_BeUse_VongHoa) >= nMaxEXP) then
		Talk(1,"","Sö dông vßng hoa ®¹t tèi ®a ®iÓm kinh nghiÖm !")
		return 1
	end
	if (GetLevel() < 50) then
		Talk(1,"","§¼ng cÊp nhá h¬n 50 kh«ng thÓ sö dông !")
		return 1
	end
	if CalcFreeItemCellCount() < 5 then
			Talk(1, "", "Hµnh trang kh«ng ®ñ 5 « trèng.");
			return 1
	end
	Create_main(nItemIndex)
	--WriteLog(date("%Y%m%d %H%M%S").."\t".."Hµnh HiÖp Kú"..GetAccount().."\t"..GetName().."\t".."Sö dông Thiªn Hµo Kú ")	
end