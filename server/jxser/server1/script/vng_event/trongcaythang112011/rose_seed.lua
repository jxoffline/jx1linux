Include("\\script\\vng_event\\trongcaythang112011\\plant.lua")

DATE_START	= 20111124
DATE_END	= 20111201

function IsAcitve()
	local now = tonumber(GetLocalDate("%Y%m%d"));
	if (now >= DATE_END or now < DATE_START) then
		return 0;
	end
	return 1;	
end

function plant_tree()
	if (tbSeed:Check(1) == 0) then
		return 0
	end
--	local kind = tbSeed:RandomKind()
	if (tbSeed:Grow(1) == 1) then
		return 1
	else		
		return 0
	end
end

function main(nItemIndex)
	if IsAcitve() ~= 1 then
		Msg2Player("§· qu¸ thêi gian ho¹t ®éng, kh«ng thÓ trång c©y.")
		return 1
	end	
	if plant_tree() == 1 then
		return 0
	end
	return 1
end
