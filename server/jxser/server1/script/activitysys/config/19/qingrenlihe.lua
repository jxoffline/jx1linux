Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\config\\19\\valentinehead.lua")

function IsInValentineEx()
	local nDate = tonumber(GetLocalDate("%Y%m%d"))	
	if ACTIVITY_STARTTIME <= nDate and nDate <= 20110223 then
		return 1
	end
	Msg2Player("Kh«ng ph¶i trong thêi gian diÔn ra ho¹t ®éng, ®¹o cô kh«ng cã hiÖu lùc")
	return 0
end


function main()
	
	if IsInValentineEx() ~= 1 then
		return
	end
	
	if CheckValentineLevel() ~= 1 then
		return 1
	end
	
	if pActivity:CheckTask(QingRenLiHeExpLimit,500000000 ,"Th«ng qua LÔ Hép t×nh Nh©n nhËn ®ùîc tæng kinh nghiÖm ®· ®¹t ®Õn giíi h¹n","<") ~= 1 then
		return 1
	end
	
	local tbAward = 
	{
		{nExp_tl = 5000000},
	}
	tbAwardTemplet:GiveAwardByList(tbAward, "LÔ T×nh Nh©n n¨m 2011, më LÔ Hép T×nh Nh©n")
	pActivity:AddTask(QingRenLiHeExpLimit,5000000)
end