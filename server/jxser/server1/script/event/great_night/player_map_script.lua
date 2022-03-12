--双龙洞玩家行为脚本

tbPlayer = {}

function tbPlayer:OnEnterMap()
	
	--print("tbPlayer:OnEnterMap")
	
	Msg2Player("Ngi  v祇 b秐  Chi課 Long чng")
	local nProtectTime = 4*18--4秒保护
	SetProtectTime(nProtectTime)
	AddSkillState(963, 1, 0, nProtectTime)
	SetLogoutRV(1)--下线传出本地图
	--DisabledStall(1)	--摆摊
	SetFightState(1)--战斗状态
	SetPKFlag(1)--战斗模式
	ForbidChangePK(1)--禁止改战斗模式
	DisabledUseTownP(0)	--允许使用回城，与禁止改战斗模式冲突，不能使用回城符，保持现状
end

function tbPlayer:OnLeaveMap()
	
	--print("tbPlayer:OnLeaveMap")
	
	Msg2Player("NgI  r阨 kh醝 Chi課 Long чng")
	--SetLogoutRV(0)--下线跟死亡在同一个点，这里不能改成0，否则下线还在这张地图
	--DisabledStall(0)	--摆摊
	SetFightState(0)--非战斗状态
	ForbidChangePK(0)--可以改战斗模式
	SetPKFlag(0)
end

