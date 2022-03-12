Include([[\script\event\springfestival07\head.lua]]);

function main()
	if (sf07_isrightuser() ~= 1) then
		Say("<color=yellow>ChØ cã ng­êi ch¬i cÊp trªn 50 ®· n¹p thÎ<color> míi cã thÓ sö dông ph¸o.", 0);
		return 1;
	end;
	
	if (sf07_isgoodsactive() == 0) then
		Say("VËt phÈm nµy chØ sö dông trong dÞp TÕt.", 0);
		return 1;
	end;
	if (CalcFreeItemCellCount() < FREECELLCOUNT) then
		Say("Xin h·y s¾p xÕp l¹i hµnh trang tr­íc ®·!", 0);
		return 1;
	end;
	
	local nExp = EXPVALUE * UNIT_WAN;
	local nRemained = EXP_MAXIMUM - GetTask(TASKID_TOTALEXP);
	if (nExp > nRemained) then
		nExp = nRemained;
	end;
	local str = "B¹n ®· më mét <color=yellow>"..GOODSNAME.."<color>";
	Msg2Player(str);
	if (nExp <= 0) then
		Say("B¹n ®· nhËn ®­îc <color=yellow>"..EXP_MAXIMUM.."<color> ®iÓm kinh nghiÖm, kh«ng thÓ sö dông ph¸o n÷a!", 0);
		return 1;
	end;
	AddOwnExp(nExp);
	str = "B¹n nhËn ®­îc <color=yellow>"..nExp.."<color> ®iÓm kinh nghiÖm.";
	SetTask(4000, GetTask(4000)+EXPVALUE)
	str = str.."<enter>B¹n nhËn ®­îc <color=yellow>"..EXPVALUE.."<color> ®iÓm Ch©n Nguyªn.";
	SetTask(TASKID_TOTALEXP, GetTask(TASKID_TOTALEXP) + nExp);
	
	if (TAB_GOODS and getn(TAB_GOODS) > 0) then
		for i = 1, getn(TAB_GOODS) do
			AddItem(TAB_GOODS[i][2], TAB_GOODS[i][3], TAB_GOODS[i][4], TAB_GOODS[i][5],0,0,0);
			str = str.."<enter>B¹n nhËn ®­îc 1 <color=yellow>"..TAB_GOODS[i][1].."<color>.";
		end;
	end;
	Msg2Player(str);
	--CastSkill(764, 3);
end;