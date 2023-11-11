Include("\\script\\item\\huihuangzhiguo_advance.lua")

function main(ItemIndex)
	if (huihuangzhiguo_advance:UseZhenLu(3) == 0) then
		return 1;
	end
	return 0;
end