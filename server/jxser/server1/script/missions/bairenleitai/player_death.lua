-- ====================== 文件信息 ======================

-- 剑侠情缘网络版大陆版 - 百人擂台角色死亡
-- 文件名　：player_death.lua
-- 创建者　：子非魚
-- 创建时间：2011-04-26 16:50:30

-- 被NPC杀死
-- 被Player杀死
-- 	.死者是擂主
-- 	.死者是挑战者
-- ======================================================
Include("\\script\\missions\\bairenleitai\\hundred_arena.lua");

function OnDeath(Launcher)
	local nKilledIndex = PlayerIndex;
	local szKilledName = CallPlayerFunction(nKilledIndex, GetName);
	local szKillerName = CallPlayerFunction(nKilledIndex, GetName);
	local ArenaID = HundredArena.tbPlayerList[szKilledName].nArenaId;
	local nRight = HundredArena.tbPlayerList[szKilledName].nRight;
	SetCurCamp(GetCamp());
	
	local nKillerIndex = NpcIdx2PIdx(Launcher);
	
	if (nKillerIndex <= 0) then
		print(Launcher, GetNpcName(Launcher));
		DelNpc(Launcher);
		HundredArena.tbArenaList[ArenaID]:PlayerDeath(3);		-- 被NPC杀死
	else
	
		if (nRight == 1) then
			HundredArena.tbArenaList[ArenaID]:PlayerDeath(2);		-- 挑战者胜利
		else
			HundredArena.tbArenaList[ArenaID]:PlayerDeath(1);		-- 擂主胜利
		end
	end
	
	--Modified by DinhHQ - 20110714
	ST_StopDamageCounter();
	SetDeathScript("");
	DisabledUseTownP(0)	-- 可以回城符
	-- SetLogoutRV(0);	-- 只有在主动离开时 才设置为0
	DisabledStall(0)	-- 可以摆摊
	SetFightState(0)	-- 非战斗
	SetCurCamp(GetCamp());
	
	SetRevPos(GetPlayerRev())
	SetPKFlag(0);		
	self:DelPlayer(PlayerIndex)
	local nMapId = GetTask(TSK_LEAVERMAPID);
	local nX = GetTask(TSK_LEAVERPOSX);
	local nY = GetTask(TSK_LEAVERPOSY);
	NewWorld(nMapId, nX, nY);
end
