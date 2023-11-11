--zhongchaolong
--给全组队成员在30分钟之内翻倍经验.
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\event\\zhongqiu_jieri\\200808\\taskctrl.lua")

function main()
	zhongqiu0808_ResetTask()
--	local nDate = tonumber(GetLocalDate("%y%m%d"))
--	if nDate > zhongqiu0808_ItemEndTime then
--		Say("该物品已过期。",0)
--		return 0;
--	end
--	if zhongqiu0808_PlayerLimit() ~= 1 then
--		
--		Say("必须是50级以上的充值玩家。", 0)
--		return 1
--	end
	
	
	local nPreservedPlayerIndex = PlayerIndex;
	local nMemCount = GetTeamSize();

	
	if (nMemCount == 0 ) then
		AddSkillState(892, 1, 1,18*60*30)
		return 0
	end

	for i = 1, nMemCount do
		PlayerIndex = GetTeamMember( i );
		AddSkillState(892, 1, 1, 18*60*30)
	end;
	
	PlayerIndex = nPreservedPlayerIndex;
	return 0
end