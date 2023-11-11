--	°ï»á³µ·ò½Å±¾
--	lixin 2005-12-27
Include("\\script\\global\\station.lua")
Include([[\script\tong\workshop\tongcolltask.lua]]);

function main()
	local tabContent = {"Nh÷ng n¬i ®· ®i qua/WayPointFun", "Nh÷ng thµnh thÞ ®· ®i qua/want2station"};
	if (GetMapType(SubWorld) == 1 and GetTask(TASK_LP_COUNT) ~= 0)then
		local nTongID = GetMapParam(SubWorld, 0)
		if (nTongID ~= 0)then
			local _,b = GetTongName()
			if (b ~= nTongID and TONG_GetTongMapBan(nTongID) == 1)then
				tinsert(tabContent, "QuÝ bang ®· më cÊm ®Þa bang héi, phiÒn chuyÓn lêi ®Õn "..tab_Workshop[GetTask(TASK_LP_ZONGGUANIDX)].."Ph­êng tæng qu¶n gióp ta/chuanhua");
			end
		end
	end

	tinsert(tabContent, "§©u còng kh«ng muèn ®i!/OnCancel");
	Say("<#>Xa phu: §¹i hiÖp muèn ®i ®©u?", getn(tabContent), tabContent)
	
end;

function chuanhua()
	Say("Bæn bang"..tab_Workshop[GetTask(TASK_LP_ZONGGUANIDX)].."Tæng qu¶n ®ang bËn qu¸ nªn c¨n dÆn ta chuyÓn lêi ®Õn ®¹i hiÖp, ®¹i hiÖp muèn hái g×?", 2, "Hái tin tøc/#rwlp_dedaojianshu(1, 1)", "Rêi khái/OnCancel")
end;

function want2station()
	Say("<#>§¹i hiÖp muèn ®i ®©u: ",8, "Ph­îng T­êng [800 l­îng]/#wlls_want2go(1)", "Thµnh §« [800 l­îng]/#wlls_want2go(11)", "§¹i Lý [800 l­îng]/#wlls_want2go(162)", "BiÖn Kinh [800 l­îng]/#wlls_want2go(37)", "T­¬ng D­¬ng [800 l­îng]/#wlls_want2go(78)", "D­¬ng Ch©u [800 l­îng]/#wlls_want2go(80)", "L©m An [800 l­îng]/#wlls_want2go(176)", "§©u còng kh«ng muèn ®i!/OnCancel")
end

tbCP_STATION = {
	[1] = { {1557, 3112}, {1537, 3237}, {1649, 3287}, {1656, 3167}, "Ph­îng T­êng Phñ " },
	[11] = { {3193, 5192}, {3266, 5004}, {3011, 5101}, {3031, 4969}, "Thµnh §« Phñ " },
	[37] = { {1598, 3000}, {1866, 2930}, {1701, 3224}, {1636, 3191}, "BiÖn Kinh Phñ " },
	[78] = { {1592, 3377}, {1704, 3225}, {1508, 3147}, {1440, 3219}, "T­¬ng D­¬ng Phñ " },
	[80] = { {1670, 2996}, {1598, 3201}, {1722, 3210}, {1834, 3063}, "D­¬ng Ch©u Phñ " },
	[162] = { {1669, 3129}, {1696, 3280}, {1472, 3273}, "§¹i Lý" },
	[176] = { {1603, 2917}, {1692, 3296}, {1375, 3337}, {1356, 3017}, "L©m An Phñ " }
}

function wlls_want2go(stationname)
	if (tbCP_STATION[stationname] == nil) then
		print("chefu cann't find station")
		return
	end
	if(GetCash() < 800) then
		Say("Xa phu: Tõ bang héi ®Õn c¸c ®¹i thµnh thÞ cÇn cÇn 800 l­îng, kh«ng mang theo lé phÝ sao?",0)
	else
		local count = getn(tbCP_STATION[stationname]) - 1
		local randnum = random(count)
		Msg2Player("Ngåi yªn ch­a? Chóng ta ®i "..tbCP_STATION[stationname][count+1])
		NewWorld(stationname, tbCP_STATION[stationname][randnum][1], tbCP_STATION[stationname][randnum][2])
		SetFightState(0)
		SetPunish(1)
		DisabledUseTownP(0)
		SetRevPos(GetPlayerRev())
		Pay(800)
	end
end
