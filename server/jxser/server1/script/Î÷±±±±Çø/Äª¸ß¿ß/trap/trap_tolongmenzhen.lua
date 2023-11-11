--西北北区 莫高窟to龙门镇
--Trap ID：莫高窟 1

function main(sel)
	
	local nSubWorldId = SubWorldIdx2ID(SubWorld);
	
	if nSubWorldId == 917 or nSubWorldId == 918 then
		local nW, nX, nY = RevID2WXY(GetPlayerRev());
		NewWorld(nW, nX/32, nY/32);
	else
		SetFightState(1);
		NewWorld(121,1725,4275)	
	end
	
end;