function main()
	local nPreservedPlayerIndex = PlayerIndex;
	local nMemCount = GetTeamSize();--队伍人数
	if nMemCount == 0 then
		Msg2Player("B筺 nh薾 頲 ph莕 thng t╪g i 甶觤 kinh nghi謒 trong 30 ph髏.")
		AddSkillState(440, 1, 1, 32400);
	else
		for i = 1, nMemCount do
			PlayerIndex = GetTeamMember( i );--队伍中第i个人PlayerIndex
			Msg2Player("B筺 nh薾 頲 ph莕 thng t╪g i 甶觤 kinh nghi謒 trong 30 ph髏.")
			AddSkillState(440, 1, 1, 32400);
		end
		PlayerIndex = nPreservedPlayerIndex;
	end
end