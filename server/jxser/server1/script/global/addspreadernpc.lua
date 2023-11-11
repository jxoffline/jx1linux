SPREADERNPC_ISADD = 1	--1 加载 ； nil 不加载

spreadernpc = {
-- 新手村“游戏推广员”

}

function add_spreadernpc(tbnpc)
if (SPREADERNPC_ISADD) then
		for i = 1 , getn(tbnpc) do
			Mid = SubWorldID2Idx(tbnpc[i][4]);
			if (Mid >= 0 ) then
				TabValue5 = tbnpc[i][5] * 32;
				TabValue6 = tbnpc[i][6] * 32;
				local nNpcIdx = AddNpc(tbnpc[i][1],tbnpc[i][2],Mid,TabValue5,TabValue6,tbnpc[i][7],tbnpc[i][8]);
				SetNpcScript(nNpcIdx, tbnpc[i][10]);
			end;
		end;
	end;
end