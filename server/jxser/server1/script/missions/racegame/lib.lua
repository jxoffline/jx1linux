-- 文件名　：lib.lua
-- 创建者　：zhongchaolong
-- 创建时间：2008-04-16 09:29:13
--和mission无关的函数
IncludeLib("FILESYS")
Include("\\script\\lib\\coordinate.lua");
--只能返回一个返回值
function doFunByPlayer(nPlayerIndex, fun, ...)	
	local nOldPlayer = PlayerIndex;
	PlayerIndex = nPlayerIndex
	local re = call(fun, arg);
	PlayerIndex = nOldPlayer;
	return re
end


--
function doFunInWorld(nSubWorld, fun, ...)
	local nOldSubWorld = SubWorld;
	SubWorld = nSubWorld
	local re = call(fun, arg);
	SubWorld = nOldSubWorld;
	return re
end

function racegame_CallNpc(tbNpc, nMapId, nPosX, nPosY)
	nMapId	= nMapId or tbNpc.nMapId
	nPosX	= nPosX or tbNpc.nPosX 
	nPosY	= nPosY or tbNpc.nPosY
	local nMapIndex = SubWorldID2Idx(nMapId)
	if nMapIndex >= 0 then		
		local nNpcIndex = AddNpcEx(
			tbNpc.nNpcId,  --npc Id
			tbNpc.nLevel or 1,		-- 等级
			tbNpc.nSeries or random(0,4),		-- 五行
			nMapIndex,	-- 地图
			nPosX,	-- X坐标
			nPosY,	-- Y坐标
			1,			-- 不重生
			tbNpc.szName,		-- 名字
			tbNpc.nIsboss or 0
		);	-- 是否BOSS
		if tbNpc.szDeathScript then
			SetNpcDeathScript(nNpcIndex, tbNpc.szDeathScript);
		end
			
		if tbNpc.szScriptPath then 
			SetNpcScript(nNpcIndex, tbNpc.szScriptPath)
		end
		if tbNpc.nTime then
			SetNpcTimer(nNpcIndex, 18*tbNpc.nTime);
		end
	else
		--print("地图 "..nMapId.." 没有加载")
	end
end