Include("\\script\\misc\\vngpromotion\\ipbonus\\ipbonus_2_head.lua");
Include("\\script\\lib\\awardtemplet.lua")



function main(nItemIndex)
--	if GetItemParam(nItemIndex, 1) == 0 or GetItemParam(nItemIndex, 1) <= tonumber(GetLocalDate("%Y%m%d")) then
--		Talk(1,"", "VÀt ph»m nµy Æ∑ h’t hπn")
--		return 0
--	end
	
	if GetLevel() < 50 then
		Talk(1,"", "ßºng c p kh´ng ÆÒ 50, h∑y rÃn luy÷n th™m")
		return 1
	end
	
	IpResetTask();
	
	if GetTask(TASKID_GREEN_USE_TIMES) >= 6 then
		Talk(1,"", "MÁi ngµy chÿ c„ th” sˆ dÙng vÀt ph»m  tËi Æa 6 l«n")
		return 1
	end
		
	if CalcFreeItemCellCount() < 2 then
		Talk(1,"", format("ChÁ trËng hµnh trang kh´ng ÆÒ %d chÁ, h∑y sæp x’p lπi.", 2))
		return 1
	end
	
--	local nTotalExp = GetTask(TASKID_CUR_GREEN_EXP)*GREEN_ITEM_EXP
--	if nTotalExp >= MAX_GREEN_EXP then
--		Talk(1,"","Bπn Æ∑ Æπt Æ’n giÌi hπn 3000000000 Æi”m kinh nghi÷m, kh´ng th” ti’p tÙc sˆ dÙng.")
--		return 1
--	end
		
	local nAddExp = GREEN_ITEM_EXP
	if GetTask(TASKID_CUR_GREEN_EXP) + GREEN_ITEM_EXP > MAX_GREEN_EXP then
		nAddExp = MAX_GREEN_EXP - GetTask(TASKID_CUR_GREEN_EXP) 
	end
	
	SetTask(TASKID_CUR_GREEN_EXP, GetTask(TASKID_CUR_GREEN_EXP) + 1)
	SetTask(TASKID_GREEN_USE_TIMES, GetTask(TASKID_GREEN_USE_TIMES) + 1)
	--AddOwnExp(nAddExp)
	--Msg2Player("Bπn nhÀn Æ≠Óc "..nAddExp.." Æi”m kinh nghi÷m.")
	tbExpAward = {szName = "ßi”m kinh nghi÷m", nExp_tl = nAddExp}
	tbAwardTemplet:GiveAwardByList(tbExpAward, "Use Lam Bao Hap");
	
	--WriteLog(format("[IPBonus]\t%s\t%s\t%s","sˆ dÙng Lam B∂o Hπp",GetAccount(),GetName()))		
	return 0;
end