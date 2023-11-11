function OnDeath(Launcher)

-- 如果是野外地图 给击杀者加荣誉击杀值
    if IsTongWarMap(SubWorld) == 1 then
    	local nLauncherIdx = NpcIdx2PIdx(Launcher);
    	local nOrgPlayer  = PlayerIndex;
    	if (nLauncherIdx > 0) then
    	    -- 将当前人物设置为 击杀者
    	    PlayerIndex = nLauncherIdx;
    	    -- 荣誉击杀加1
    	    AddPvPKilledNum(1);
    	    -- 将人物设置回被击杀者
    	    PlayerIndex = nOrgPlayer;
    	end
    end
    
end