Include([[\script\event\springfestival07\head.lua]]);

GOODSNAME = "Phong ph¸o ®¹i ®Æc biÖt";
FREECELLCOUNT = 0;
EXPVALUE = 5000;
TAB_GOODS = {
{"HuyÒn Tinh Kho¸ng Th¹ch cÊp 5",5,	147	,	0.674	},
{"HuyÒn Tinh Kho¸ng Th¹ch cÊp 6",6,	147	,	0.12	},
{"HuyÒn Tinh Kho¸ng Th¹ch cÊp 7",7,	147	,	0.005	},
{"Lam Thñy Tinh",1,	238	,	0.06	},
{"Lôc Thñy Tinh",1,	240	,	0.06	},
{"Tö Thñy Tinh",1,	239	,	0.06	},
{"§Þnh Quèc Thanh Sa Tr­êng Sam",2,	159	,	0.003	},
{"§Þnh Quèc ¤ Sa Ph¸t Qu¸n",2,	160	,	0.003	},
{"§Þnh Quèc XÝch Quyªn NhuyÔn Ngoa",2,	161	,	0.003	},
{"§Þnh Quèc Tö §»ng Hé uyÓn",2,	162	,	0.003	},
{"§Þnh Quèc Ng©n Tµm Yªu ®¸i",2,	163	,	0.003	},
{"An Bang B¨ng Tinh Th¹ch H¹ng Liªn",2,	164	,	0.0015	},
{"An Bang Cóc Hoa Th¹ch ChØ hoµn",2,	165	,	0.0015	},
{"An Bang §iÒn Hoµng Th¹ch Ngäc Béi",2,	166	,	0.0015	},
{"An Bang Kª HuyÕt Th¹ch Giíi ChØ ",2,	167	,	0.0015	},
};

function main()
	if (sf07_isgoodsactive() == 0) then
		Say("VËt phÈm nµy chØ sö dông trong dÞp TÕt.", 0);
		return 1;
	end;
	if (sf07_isrightuser() ~= 1) then
		Say("<color=yellow>ChØ cã ng­êi ch¬i cÊp trªn 50 ®· n¹p thÎ<color> míi cã thÓ sö dông ph¸o.", 0);
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
	local str = "B¹n ®· më mét <color=yellow>"..GOODSNAME.."<color>?";
	if (nExp <= 0) then
		Say("B¹n ®· nhËn ®­îc <color=yellow>"..EXP_MAXIMUM.."<color> ®iÓm kinh nghiÖm, kh«ng thÓ sö dông ph¸o n÷a!", 0);
		return 1;
	end;
	AddOwnExp(nExp);
	str = str.."B¹n nhËn ®­îc<color=yellow>"..nExp.."<color> ®iÓm kinh nghiÖm.";
	SetTask(TASKID_TOTALEXP, GetTask(TASKID_TOTALEXP) + nExp);
	
	local nSeed = random(1, 10000);
	local nSum = 0;
	for i = 1, getn(TAB_GOODS) do
		nSum = nSum + TAB_GOODS[i][4] * 10000;
		if (nSum >= nSeed) then
			if (TAB_GOODS[i][2] == 1) then
				AddItem(4, TAB_GOODS[i][3], 1, 1,0,0,0);
			elseif (TAB_GOODS[i][2] == 2) then
				AddGoldItem(0, TAB_GOODS[i][3]);
			else
				AddItem(6, 1, TAB_GOODS[i][3], TAB_GOODS[i][2],0,0,0);
			end;
			str = str.."NhËn ®­îc 1 <color=yellow>"..TAB_GOODS[i][1].."<color>.";
			break;
		end;
	end;
	CastSkill(764, 3);
	Msg2Player(str);
end;