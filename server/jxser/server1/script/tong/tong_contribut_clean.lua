Include("\\script\\global\\login_head.lua")

function tong_contribut_clean()

	local MEMBER_CONTRIBUTION_LIMIT = 
	{
		{1, 0}, -- 最低等级, 个人贡献
		{50, 240000},
		{80, 2240000},
	}
	local MEMBER_CONTRIBUTION_TSK = 2389
	local MEMBER_CONTRIBUTION_BCLEAN_TSK = 2672

	local bClean = GetTask(MEMBER_CONTRIBUTION_BCLEAN_TSK);
	if (bClean == 0) then
		local nValue = GetTask(MEMBER_CONTRIBUTION_TSK);
		local nLevel = GetLevel();
		local szName = GetName();
		if (nLevel < MEMBER_CONTRIBUTION_LIMIT[2][1]) then
			SetTask(MEMBER_CONTRIBUTION_TSK, MEMBER_CONTRIBUTION_LIMIT[1][2]);
			WriteLog(format("clean %s(Level:%d) Tong Contribution old value is %0.f new value is %0.f", szName, nLevel, nValue, MEMBER_CONTRIBUTION_LIMIT[1][2]));
		elseif(nLevel < MEMBER_CONTRIBUTION_LIMIT[3][1]) then
			if (nValue > MEMBER_CONTRIBUTION_LIMIT[2][2] or nValue < 0) then
				local nNewValue = MEMBER_CONTRIBUTION_LIMIT[2][2];
				if (nMemberCon < 0) then
					nNewValue = 0;
				end
				SetTask(MEMBER_CONTRIBUTION_TSK, nNewValue);
				WriteLog(format("clean %s(Level:%d) Tong Contribution old value is %0.f new value is %0.f", szName, nLevel, nValue, nNewValue));
			end
		else
			if (nValue > MEMBER_CONTRIBUTION_LIMIT[3][2] or nValue < 0) then
				local nNewValue = MEMBER_CONTRIBUTION_LIMIT[3][2];
				if (nMemberCon < 0) then
					nNewValue = 0;
				end
				SetTask(MEMBER_CONTRIBUTION_TSK, nNewValue);
				WriteLog(format("clean %s(Level:%d) Tong Contribution old value is %0.f new value is %0.f", szName, nLevel, nValue, nNewValue));
			end
		end
		
		SetTask(MEMBER_CONTRIBUTION_BCLEAN_TSK,1);
	end
end

if login_add then login_add(tong_contribut_clean, 2) end;