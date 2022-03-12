
tab_goods = {
	{"Lam Thñy Tinh",	0.005, 4,	238},
	{"Tö Thñy Tinh",	0.005, 4,	239},
	{"Lôc Thñy Tinh",	0.005, 4,	240},
	{"Tiªn Th¶o Lé ",	0.65, 6,	1,	71},
	{"Phi Phong",	0.01, 6,	1,	15},
	{"Vâ L©m MËt TÞch",	0.001, 6,	1,	26},
	{"TÈy Tñy Kinh",	0.001, 6,	1,	22},
	{"ThiÕt La H¸n",	0.01, 6,	1,	23},
	{"Thiªn s¬n  B¶o Lé ",	0.15, 6,	1,	72},
	{"Bao D­îc hoµn ",	0.1626, 6,	1,	910},
	{"An Bang B¨ng Tinh Th¹ch H¹ng Liªn",	0.0001, 164},
	{"An Bang Cóc Hoa Th¹ch ChØ hoµn",	0.0001, 165},
	{"An Bang §iÒn Hoµng Th¹ch Ngäc Béi",	0.0001, 166},
	{"An Bang Kª HuyÕt Th¹ch Giíi ChØ ",	0.0001, 167}
}

function main(nItem)
	local nSeed = random(1, 10000);
	
	local nIdx = 1;
	local nTotal = 0;
	for i = 1, getn(tab_goods) do
		nTotal = nTotal + tab_goods[i][2] * 10000;
		if (nSeed <= nTotal) then
			nIdx = i;
			break
		end;
	end;
	if (nIdx < 4) then
		AddEventItem(tab_goods[nIdx][4]);
	elseif (nIdx < 11) then
		AddItem(6, 1, tab_goods[nIdx][5], 1, 0, 0, 0);
	else
		AddGoldItem(0, tab_goods[nIdx][3]);
	end;
	if (nIdx < 4 or (nIdx >= 6 and nIdx <= 8) or nIdx >= 11) then
		WriteLog(date("%Y-%m-%d-%H:%M")..", Ng­êi ch¬i ["..GetName().."] Më bao l× x×, nhËn ®­îc "..tab_goods[nIdx][1]..".");
		AddGlobalNews("Ng­êi ch¬i ["..GetName().."] Më bao l× x×, nhËn ®­îc "..tab_goods[nIdx][1]..".");
	end;
	Msg2Player("B¹n nhËn ®­îc <color=yellow>"..tab_goods[nIdx][1].."<color>");
end;
