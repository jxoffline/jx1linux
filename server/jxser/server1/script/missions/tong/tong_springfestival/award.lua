-- ½±Àø.lua (°ï»á´òÄêÊÞ»î¶¯)
if (not __SF_AWARD_H__) then
__SF_AWARD_H__ = 1;

IncludeLib("FILESYS");
Include("\\script\\missions\\tong\\tong_springfestival\\head.lua");
SFHD_DATAFILE = [[\settings\tong\workshop\huodong_level_data.txt]];



function springfestival_aword(nTongID, nWorkshopID)
	if (GetTaskTemp(193) == 1) then
		return
	end;
	SetTaskTemp(193, 1);
	--»ñµÃ»î¶¯·»µÈ¼¶
	local nLevel = TWS_GetLevel(nTongID, nWorkshopID);
	if (nLevel < 1 or nLevel > 10) then
		Say("Bang héi cña b¹n ch­a x©y dùng T¸c Ph­êng nµy.", 1, "Ta biÕt råi!/festival06_Cancal")
		return 0;
	end;
	
    local nGetCount = GetTask(SF_COUNT_ONETIME);
    local nRank = GetTask(SF_TK_RANK);
    SetTask(SF_COUNT_ONETIME, 0);
    SetTask(SF_TK_RANK, 0);
    if (nGetCount <= 0 or nRank <= 0) then
        Say("Tæng qu¶n Ho¹t ®éng ph­êng: Ng­¬i dõng nh­ vÉn ch­a ®i ®¸nh niªn thó, muèn nhËn th­ëng h·y ra søc ®¸nh ®uæi niªn thó tr­íc.", 1, "H·y chê xem/festival06_Cancal");
        SetTaskTemp(193, 0);
        return
    end;
    local strniaoshou = "Nguy hiÓm qu¸! Ng­¬i míi bÞ Qu¸i thó nhËp vµo, may mµ mäi ng­êi h¬p søc l¹i ®uæi Qu¸i thó ®i råi! §Ó ®¸p t¹ lßng dòng c¶m cña ng­¬i, ta cã chót lßng thµnh xin nhËn cho!";
    local stryongshi = "Lµm rÊt tèt, ng­¬i ®· dïng ph¸o nÐm tróng niªn thó <color=yellow>"..nGetCount.."<color> lÇn, xÕp h¹ng thø <color=yellow>"..nRank.."<color>, ®©y lµ thï lao! Xin nhËn lÊy!";
    
    festival_addaward(nRank);
    local isDouble = festival_double(nLevel);--¿´¿´ÊÇ·ñ»ñµÃË«±¶
	if (1 == isDouble) then
		strniaoshou = "ThËt may m¾n, ng­¬i ®· nhËn ®­îc <color=red>phÇn th­ëng nh©n ®«i<color>, "..strniaoshou;
		stryongshi = "ThËt may m¾n, ng­¬i ®· nhËn ®­îc <color=red>phÇn th­ëng nh©n ®«i<color>, "..stryongshi;
		festival_addaward(nRank);--Ë«±¶½±Àø
	end;
    if (GetTask(TK_GROUPID) > SF_SMALLMAPCOUNT) then
        Say(strniaoshou, 1, "NhËn lÊy lÔ vËt./festival06_Cancal");
    else
        Say(stryongshi, 1, "NhËn lÊy lÔ vËt./festival06_Cancal");
    end;
    SetTaskTemp(193, 0);
end;


function festival_double(nLevel)
	local nResult = 0;
	local nSeed = random(100);
	local nRate = tonumber(GetTabFileData(SFHD_DATAFILE, nLevel + 1, 7));
	if (nSeed <= nRate * 100) then
		nResult = 1;
	end;
	return nResult;
end;

festival_tabExp = {
5000000,
4000000,
3000000,
2000000,
1500000,
1000000,
500000,
500000,
};
festival_tabRate = {
	{0 ,0 ,0 ,0.464 ,0.2 ,0.175 ,0.15 ,0.01 ,0.001 ,0 },
	{0 ,0 ,0 ,0.5562 ,0.2 ,0.145 ,0.09 ,0.008 ,0.0008 ,0 } ,
	{0 ,0 ,0.3845 ,0.3 ,0.15 ,0.1 ,0.06 ,0.005 ,0.0005 ,0 } ,
	{0 ,0 ,0.546 ,0.2 ,0.12 ,0.085 ,0.045 ,0.004 ,0 ,0 } ,
	{0 ,0 ,0.653 ,0.15 ,0.09 ,0.075 ,0.03 ,0.002 ,0 ,0.01 } ,
	{0 ,0.295 ,0.4 ,0.15 ,0.076 ,0.068 ,0.01 ,0.001 ,0 ,0 } ,
	{0.267 ,0.3 ,0.2 ,0.12 ,0.08 ,0.03 ,0.003 ,0 ,0 ,0 } ,
	{0.586 ,0.2 ,0.12 ,0.06 ,0.03 ,0.004 ,0 ,0 ,0 ,0 }
};

festival_tab_Goods = {
{"Phóc Duyªn Lé (TiÓu) ",	1,	122	},
{"Phóc Duyªn Lé (Trung) ",	1,	123	},
{"Phóc Duyªn Lé (§¹i) ",	1,	124	},
{"HuyÒn tinh cÊp 3",	3,	147	},
{"Tiªn Th¶o Lé ",	1,	71	},
{"HuyÒn Tinh cÊp 4",	4,	147	},
{"HuyÒn Tinh cÊp 5",	5,	147	},
{"HuyÒn Tinh cÊp 6",	6,	147	},
{"HuyÒn Tinh cÊp 7",	7,	147	},
{"Ph¸o hoa ngµy TÕt",	1,	1345 },	--¸ÅÂÊµ÷Îª0£¬²»²ú³ö
};
function festival_addaward(nRank)
    if (nRank > getn(festival_tabExp)) then
        nRank = getn(festival_tabExp);
    end;
    nRank = festival_award_rank(nRank);
    festival_expaward(nRank);
    festival_goodsaward(nRank);
--    if (nRank <= 2) then
--        local nSeed = random(1, 100);
--        if (nSeed <= 2) then
--            AddItem(0, 11, 263, 1, 0, 0, 0);
--            Msg2Player("Äã»ñµÃÁËÒ»¸ö<color=yellow>ÄêÊÞÃæ¾ß<color>")
--        end;
--    end;
end;

function festival_goodsaward(nRank)
    local nGroup = GetTask(TK_GROUPID);
	local nGoodsType = festival_getgoodtype(nRank, nGroup);
	local strsay = "";
	if (festival_tab_Goods[nGoodsType][2] == 1) then
		AddItem(6, 1, festival_tab_Goods[nGoodsType][3], 1, 0, 0, 0);
	else
		AddItem(6, 1, festival_tab_Goods[nGoodsType][3], festival_tab_Goods[nGoodsType][2], 0, 0, 0);
	end;
	Msg2Player("B¹n nhËn ®­îc <color=yellow>"..festival_tab_Goods[nGoodsType][1].."<color>.");
end;

function festival_getgoodtype(nRank, nGroup)
	local nSeed = random(100);
	local nRate = {}
	local i;
	for i = 1, 10 do
		nRate[i] = festival_tabRate[nRank][i] * 100;
	end;
	local nBase = 0;
	for i = 1, 10 do
		nBase = nBase + nRate[i];
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
    local nCount = festival_tabExp[nRank];
	AddOwnExp(nCount);
	Msg2Player("B¹n nhËn ®­îc<color=yellow>"..nCount.."<color>®iÓm kinh nghiÖm")
end;

function festival_addpkwan()
    local itemidx = random(1, 10);
    AddItem(6, 0, itemidx, 1, 0, 0, 0);
    tab_pkwan_name = {"Tr­êng MÖnh hoµn", "Gia Bµo hoµn", "§¹i Lùc hoµn", "Cao ThiÓm hoµn", "Cao Trung hoµn", "Phi Tèc hoµn", "B¨ng Phßng hoµn", "L«i Phßng hoµn", "Háa Phßng hoµn", "§éc Phßng hoµn"};
    return tab_pkwan_name[itemidx];
end;

function festival_award_rank(nRank)
    local nGroup = GetTask(TK_GROUPID);
    if (nGroup > SF_SMALLMAPCOUNT) then
        if (nRank == 1) then
            nRank = 3;
        else
            nRank = 8;
        end;
    end;
    return nRank;
end;

function festival06_Cancal()
    
end;

end; --// end of __SF_AWARD_H__