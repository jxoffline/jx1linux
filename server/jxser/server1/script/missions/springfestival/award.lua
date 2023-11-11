if (not _H_SF07_AWARD_) then
	_H_SF07_AWARD_ = 1;

function festival_award_rank(nRank)
    local nGroup = GetTask(TK_CO_GROUPID);
    if (nGroup > CO_SMALLMAPCOUNT) then
        if (nRank == 1) then
            nRank = 3;
        else
            nRank = 8;
        end;
    end;
    return nRank;
end;

tabExp = {
5000000,
4000000,
3000000,
2000000,
1500000,
1000000,
500000,
500000,
};
tabRate = {
	{0 ,0 ,0 ,0.464 ,0.2 ,0.175 ,0.1 ,0.01 ,0.001 ,0.05 ,},
	{0 ,0 ,0 ,0.5562 ,0.2 ,0.145 ,0.06 ,0.008 ,0.0008 ,0.03 ,} ,
	{0 ,0 ,0.3845 ,0.3 ,0.15 ,0.1 ,0.04 ,0.005 ,0.0005 ,0.02 ,} ,
	{0 ,0 ,0.546 ,0.2 ,0.12 ,0.085 ,0.03 ,0.004 ,0 ,0.015 ,} ,
	{0 ,0 ,0.653 ,0.15 ,0.09 ,0.075 ,0.02 ,0.002 ,0 ,0.01 ,} ,
	{0 ,0.295 ,0.4 ,0.15 ,0.076 ,0.068 ,0.01 ,0.001 ,0 ,0 ,} ,
	{0.267 ,0.3 ,0.2 ,0.12 ,0.08 ,0.03 ,0.003 ,0 ,0 ,0 ,} ,
	{0.586 ,0.2 ,0.12 ,0.06 ,0.03 ,0.004 ,0 ,0 ,0 ,0 ,}
};

tab_Goods = {
{"PhÛc Duy™n LÈ (Ti”u) ",	1,	122	},
{"PhÛc Duy™n LÈ (Trung) ",	1,	123	},
{"PhÛc Duy™n LÈ (ßπi) ",	1,	124	},
{"Huy“n tinh c p 3",	3,	147	},
{"Ti™n Th∂o LÈ ",	1,	71	},
{"Huy“n Tinh c p 4",	4,	147	},
{"Huy“n Tinh c p 5",	5,	147	},
{"Huy“n Tinh c p 6",	6,	147	},
{"Huy“n Tinh c p 7",	7,	147	},
{"Ph∏o hoa ngµy T’t",	1,	1345 },
};

function festival_goodsaward(nRank)
    local nGroup = GetTask(TK_CO_GROUPID);
	local nGoodsType = festival_getgoodtype(nRank);
	if (tab_Goods[nGoodsType][2] == 1) then
		AddItem(6, 1, tab_Goods[nGoodsType][3], 1, 0, 0, 0);
	else
		AddItem(6, 1, tab_Goods[nGoodsType][3], tab_Goods[nGoodsType][2], 0, 0, 0);
	end;
	Msg2Player("Bπn nhÀn Æ≠Óc <color=yellow>"..tab_Goods[nGoodsType][1].."<color>.");
end;

function festival_getgoodtype(nRank)
	local table = tabRate[nRank];
	local nBase = 0;
	local nSeed = random(10000) * 10 + random(10);
	for i = 1, 10 do
		nBase = nBase + table[i] * 100000;
		if (nBase >= nSeed) then
			return i;
		end;
	end;
end;

function festival_expaward(nRank)
    if (nRank < 1) then
        nRank = 1;
    end;
    if (nRank > 8) then
        nRank = 8;
    end;
    local nCount = tabExp[nRank];
	AddOwnExp(nCount);
	Msg2Player("Bπn nhÀn Æ≠Óc<color=yellow>"..nCount.."<color>Æi”m kinh nghi÷m")
end;


end;