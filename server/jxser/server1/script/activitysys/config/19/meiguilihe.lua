Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\config\\19\\valentinehead.lua")

function main()
	
	if IsInValentine() ~= 1 then
		return
	end
	
	if CheckValentineLevel() ~= 1 then
		return 1
	end
	
	if pActivity:CheckTask(MeiGuiLiHeAndXiangSiLiHeExpLimit,1000000000,"Th«ng qua LÔ Hép Hoa Hång vµ LÔ Hép T­¬ng T­ nhËn ®ùîc tæng kinh nghiÖm ®· ®¹t ®Õn giíi h¹n","<") ~= 1 then
		return 1
	end
	
	local tbAward = 
	{
		{nExp_tl = 5000000},
	}
	tbAwardTemplet:GiveAwardByList(tbAward, "LÔ T×nh Nh©n n¨m 2011, më LÔ Hép T×nh Nh©n")
	pActivity:AddTask(MeiGuiLiHeAndXiangSiLiHeExpLimit,5000000)
	
end