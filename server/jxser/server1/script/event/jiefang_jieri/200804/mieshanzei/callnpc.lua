jiefang_0804_NpcList =
{
	{szName = "Thi誸 Ng璾 Чi Vng", nLevel = 95, nIsboss = 1, nNpcId = 1340, szDeathScript = "\\script\\event\\jiefang_jieri\\200804\\mieshanzei\\bossdeath.lua"},
	{szName = "S琻 t芻 u l躰h", nLevel = 95, nIsboss = 1, nNpcId = 725},
	
}

function jiefang_0804_CallBoss(nMapId, nX, nY)
	jiefang_0804_CallNpc(jiefang_0804_NpcList[1], nMapId, (nX*8+random(-3,3)) *32, (nY*16+random(-7,7))*32)
	
end


function jiefang_0804_CallReinforce(nMapId, nX, nY, nCount)
	for i= 1, nCount do
		jiefang_0804_CallNpc(jiefang_0804_NpcList[2], nMapId, (nX*8+random(-3,3)) *32, (nY*16+random(-7,7))*32)
	end
end

function jiefang_0804_CallNpc(tbNpc, nMapId, nPosX, nPosY)
	nMapId	= nMapId or tbNpc.nMapId
	nPosX	= nPosX or tbNpc.nPosX 
	nPosY	= nPosY or tbNpc.nPosY
	local nMapIndex = SubWorldID2Idx(nMapId)
	if nMapIndex >= 0 then		
		local nNpcIndex = AddNpcEx(
			tbNpc.nNpcId,  --npc Id
			tbNpc.nLevel,		-- 等级
			tbNpc.nSeries or random(0,4),		-- 五行
			nMapIndex,	-- 地图
			nPosX,	-- X坐标
			nPosY,	-- Y坐标
			1,			-- 不重生
			tbNpc.szName,		-- 名字
			tbNpc.nIsboss
		);	-- 是否BOSS
		if tbNpc.szDeathScript then
			SetNpcDeathScript(nNpcIndex, tbNpc.szDeathScript);
		end
			
		if tbNpc.szScriptPath then 
			SetNpcScript(nNpcIndex, tbNpc.szScriptPath)
		end
	else
		--print("地图 "..nMapId.." 没有加载")
	end
end