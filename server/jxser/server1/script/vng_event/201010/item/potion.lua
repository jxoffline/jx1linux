Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

 tbAwardExpUseLinhDuoc = {szName = "§iÓm kinh nghiÖm", nExp = 10e6}
 
 TASK_LIMIT_EXP_USE_LINHDUOC 	= 2770
 TASK_DAILY_USE_LINHDUOC			= 2771
 
function main(nItemIndex)
	local n_item_date = tonumber(FormatTime2String("%Y%m%d%H%M",ITEM_GetExpiredTime(nItemIndex)));
	local n_cur_date = tonumber(GetLocalDate("%Y%m%d%H%M"));
	if n_cur_date > n_item_date then
		Msg2Player("VËt phÈm qu¸ h¹n sö dông, tù ®éng mÊt ®i.")
		return 0;
	end
	
	if GetLevel() < 50 then
		Say("CÊp 50 trë lªn míi cã thÓ sö dông vËt phÈm nµy!",0)
		return 1
	end
	
	if (PlayerFunLib:CheckTaskDaily(TASK_DAILY_USE_LINHDUOC,5,"Mçi ngµy chØ cã thÓ sö dông tèi ®a 5 lÇn!","<") ~= 1) then
			return 1
	end
	
	if (GetTask(TASK_LIMIT_EXP_USE_LINHDUOC) >= 120) then
		Say("§¹i hiÖp ®· ®¹t tèi ®a sè lÇn sö dông Linh D­îc!",0)
		return 1
	end
	
	SetTask(TASK_LIMIT_EXP_USE_LINHDUOC, GetTask(TASK_LIMIT_EXP_USE_LINHDUOC) + 1)
	PlayerFunLib:AddTaskDaily(TASK_DAILY_USE_LINHDUOC,1)
	
	tbAwardTemplet:GiveAwardByList(tbAwardExpUseLinhDuoc, "Sö dông Linh D­îc");
	return 0
end