TB_JACKSTRAW_POS = {
	{53,1762,3205},--巴陵
	{20,3507,6350},--江津村
	{99,1581,3012},--永乐镇
	{101,1726,2975},--稻香村
	{121,1866,4607},--龙门镇
	{153,1717,3293},--石鼓镇
	{174,1730,3189},--龙泉村
}


function gm_createjackstraw(nBeginTime, nGrowPhase)	--TASK GREATE SEED
	for i = 1, getn(TB_JACKSTRAW_POS) do
		local mapid = TB_JACKSTRAW_POS[i][1];
		local worldidx = SubWorldID2Idx(mapid);
		if (worldidx >= 0) then
			local nNpcid = 1232;
			local szCurScript = "\\script\\event\\fenghuo_hero\\jackstraw.lua";
			if (nGrowPhase == 1) then
				ClearMapNpcWithName(mapid, "Ngi r琺");
				nNpcid = 1233;
				szCurScript = "\\script\\event\\fenghuo_hero\\letter.lua";
			end;
			local nNPCIndex = AddNpc(nNpcid , 1, worldidx, TB_JACKSTRAW_POS[i][2] * 32, TB_JACKSTRAW_POS[i][3] * 32);
			if (nNPCIndex > 0) then
				SetNpcScript(nNPCIndex, szCurScript );
				SetNpcParam(nNPCIndex, 2, tonumber(nBeginTime..i));
			end;
		end;
	end;
end;
