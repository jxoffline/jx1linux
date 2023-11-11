Include("\\script\\event\\shengdan_jieri\\200911\\plant.lua")

TIME_START	= 1800		-- »î¶¯Ê±¼ä´Ó18:00¿ªÊ¼
TIME_END	= 2300		-- »î¶¯Ê±¼äÔÚ23:00½áÊø
DATE_START	= 091216	-- »î¶¯¿ªÊ¼ÈÕÆÚ
DATE_END	= 100125	-- »î¶¯½áÊøÈÕÆÚ

function main()
	local CurrentDate = tonumber(GetLocalDate("%y%m%d"))
	local CurrentTime = tonumber(GetLocalDate("%H%M"))
	if (CurrentDate < DATE_START) then
		Msg2Player("Ho¹t ®éng trang trİ c©y gi¸ng sinh vÉn ch­a b¾t ®Çu mµ.")
		return 1
	elseif (CurrentDate >= DATE_END) then
		Msg2Player("Ho¹t ®éng trang trİ c©y gi¸ng sinh ®· kÕt thóc.")
		return 1
	elseif (CurrentTime < TIME_START or CurrentTime >= TIME_END) then
		Msg2Player("Ho¹t ®éng trang trİ c©y gi¸ng sinh diÔn ra vµo mçi ngµy tõ 18:00 ®Õn 23:00.")
		return 1
	elseif (CheckCondition() == 0 or PlantTree() == 0) then
		return 1
	else
		return 0
	end
end

