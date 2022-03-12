Include("\\script\\lib\\awardtemplet.lua")

Include("\\script\\event\\jiefang_jieri\\200904\\shuizei\\shuizei.lua");
function OnDeath( nNpcIndex )
	local nRate = 0.01;
	local nCurRate	= random(10000000)
	if (nCurRate <= 10000000 * nRate) then		
		local x, y, world = GetNpcPos(nNpcIndex);
		if (jf0904_shuizei_IsActtime() == 1) then
			local nItemIdx = DropItem(world, x, y, PlayerIndex, 6,1,2015, 1, 0, 0, 0, 0, 0, 0, 0, 0);
			
			local nCurtime = tonumber(GetLocalDate("%H%M"));
			local nRestMin = 24 * 60 - (floor(nCurtime/100)*60+floor(mod(nCurtime, 100)));
			ITEM_SetExpiredTime(nItemIdx, nRestMin);
			SyncItem(nItemIdx);
		end
	end
end
