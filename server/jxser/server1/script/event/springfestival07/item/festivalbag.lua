Include([[\script\event\springfestival07\head.lua]]);

tab_goods = {
{"Ph¸o tiÓu",	1351	,	80	,},
{"Ph¸o trung",	1352	,	96	,},
{"Ph¸o ®¹i",	1353	,	100	,},
};
function main()
	if (sf07_isactive() == 0) then
		Say("VËt phÈm nµy ®· hÕt h¹n", 0);
		return 1;
	end;
	if (sf07_isrightuser() ~= 1) then
		Say("<color=yellow>ChØ cã ng­êi ch¬i cÊp trªn 50 ®· n¹p thÎ<color> míi cã thÓ sö dông bao l× x×.", 0);
		return 1;
	end;
	if (CalcFreeItemCellCount() == 0) then
		Say("Xin h·y s¾p xÕp l¹i hµnh trang tr­íc ®·!", 0);
		return 1;
	end;
	local nSeed = random(1, 100);
	for i = 1, getn(tab_goods) do
		if (tab_goods[i][3] >= nSeed) then
			AddItem(6, 1, tab_goods[i][2], 1,0,0,0);
			Msg2Player("B¹n ®· më 1 bao l× x×, nhËn ®­îc 1 <color=yellow>"..tab_goods[i][1].."<color>.");
			break;
		end;
	end;
end;