
function main(sel)
--	DisabledUseTownP(0)	--»Ö¸´ÆäÊ¹ÓÃ»Ø³Ç·û
	Say("Nh÷ng ng­êi xa phu chiÕn tr­êng chóng t«i vµo sinh ra tö, kiÕm tiÒn b»ng sinh m¹ng m×nh! Xin gióp cho vµi l­îng b¹c!",
		8, "Ph­îng T­êng Phñ /#cp_station(1)", "Thµnh §« Phñ /#cp_station(11)", "§¹i Lý/#cp_station(162)", "BiÖn Kinh Phñ /#cp_station(37)", "T­¬ng D­¬ng Phñ /#cp_station(78)", "D­¬ng Ch©u Phñ /#cp_station(80)", "L©m An Phñ /#cp_station(176)", "§©u còng kh«ng muèn ®i!/OnCancel")
end;

tbCP_STATION = {
	[1] = { {1557, 3112}, {1537, 3237}, {1649, 3287}, {1656, 3167}, "Ph­îng T­êng Phñ " },
	[11] = { {3193, 5192}, {3266, 5004}, {3011, 5101}, {3031, 4969}, "Thµnh §« Phñ " },
	[37] = { {1598, 3000}, {1866, 2930}, {1701, 3224}, {1636, 3191}, "BiÖn Kinh Phñ " },
	[78] = { {1592, 3377}, {1704, 3225}, {1508, 3147}, {1440, 3219}, "T­¬ng D­¬ng Phñ " },
	[80] = { {1670, 2996}, {1598, 3201}, {1722, 3210}, {1834, 3063}, "D­¬ng Ch©u Phñ " },
	[162] = { {1669, 3129}, {1696, 3280}, {1472, 3273}, "§¹i Lý" },
	[176] = { {1603, 2917}, {1692, 3296}, {1375, 3337}, {1356, 3017}, "L©m An Phñ " }
}


function cp_station(stationname)
	if (tbCP_STATION[stationname] == nil) then
		print("chefu cann't find station")
		return
	end
	local count = getn(tbCP_STATION[stationname]) - 1
	local randnum = random(count)
	SetLogoutRV(0)
	Msg2Player("Ngåi yªn ch­a? Chóng ta ®i "..tbCP_STATION[stationname][count+1])
	NewWorld(stationname, tbCP_STATION[stationname][randnum][1], tbCP_STATION[stationname][randnum][2])
end

function OnCancel()
end