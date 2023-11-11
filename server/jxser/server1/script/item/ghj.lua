--Create by mengfan ,2004-9-14
--桂花酒
--作用：使用后，使用者及其组队队员幸运值30分钟内增加20点。
--获得条件：系统发放，集齐获得此物品所需要的所有单字。



function main()	
	local nPreservedPlayerIndex = PlayerIndex;
	local nMemCount = GetTeamSize();
	
	if (nMemCount == 0 ) then
		AddSkillState(450, 20, 1,32400)
		return 0
	end

	
	for i = 1, nMemCount do
		PlayerIndex = GetTeamMember( i );
		
		AddSkillState(450, 20, 1, 32400)
	end;
	
	PlayerIndex = nPreservedPlayerIndex;
	return 0
end;
		