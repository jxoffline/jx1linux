Include("\\script\\vng_event\\trongcaythang082012\\plant.lua")

DATE_START	= 20130429
DATE_END	= 20130510

function IsAcitve()
	local now = tonumber(GetLocalDate("%Y%m%d"));
	if (now >= DATE_END or now < DATE_START) then
		return 0;
	end
	return 1;	
end

function plant_tree()
	if (tbSeed:Check(2) == 0) then
		return 0
	end

	if (tbSeed:Grow(2) == 1) then
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
