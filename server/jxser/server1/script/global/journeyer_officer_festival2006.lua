if (not __JOURNEYER_OFFICER_FESTIVAL2006_H__) then
    __JOURNEYER_OFFICER_FESTIVAL2006_H__ = 1;
    Include([[\script\missions\springfestival\festival_head.lua]]);
    
    function festival2006()
        Say(FESTIVAL06_NPCNAME.."GÇn ®©y Qu¸i thó xuÊt hiÖn kh¾p n¬i, lo¹i Qu¸i thó nµy th­êng hay nhËp lªn mét ng­êi kh¸c, biÕn hä thµnh qu¸i vËt ®i h¹i ng­êi. Ph¶i cã <color=yellow>ph¸o<color> míi cã thÓ ®uæi chóng ®i. Ng­êi cña Quan phñ ®ang r¸o riÕt truy t×m Qu¸i thó, ta thÊy ng­¬i lµ ng­êi häc vâ, cã thÓ gióp ®ì kh«ng?", 5, "Kh«ng thµnh vÊn ®Ò!/festival06_wantjoin", "Ta ®· ®uæi ®­îc Qu¸i thó ch¹y råi!/festival06_award", "Liªn quan ®Õn ho¹t ®éng ®¸nh Qu¸i thó /festival06_knowabout", "Hái th¨m tin tøc./main_former", "D¹o nµy ta bËn qu¸, t×m ng­êi kh¸c ®i!/festival06_Cancal");
    end;
    
    function festival06_wantjoin()
        Say(FESTIVAL06_NPCNAME.."Ng­¬i ®· ®ång ý th× hay qu¸, nh­ng cÇn chó ý khi Qu¸i thó xuÊt hiÖn ®õng ®Ó chóng b¾t lò trÎ ®i!", 2, "HiÓu råi! Mau dÉn ta ®Õn chç Qu¸i thó!/festival_joingame", "§îi mét l¸t! Ta ph¶i chuÈn bÞ./festival06_Cancal");
    end;
    
    function festival06_award()
        local nGetCount = GetTask(TK_FE_COUNT_ONETIME);
        local nRank = GetTask(TK_FE_RANK);
        if (nGetCount <= 0 or nRank <= 0) then
            Say(FESTIVAL06_NPCNAME.."H×nh nh­ ng­¬i ch­a ®¸nh Qu¸i thó th× ph¶i, th¸m tö cña ta ®ang theo dâi ®ã! Muèn l·nh th­ëng th× mau ®i ®¸nh Qu¸i thó ®i!", 1, "KÕt thóc ®èi tho¹i./festival06_Cancal");
            return
        end;
        festival06_addaward();
        if (GetTask(TK_FE_GROUPID) > FE_SMALLMAPCOUNT) then
            Say(FESTIVAL06_NPCNAME.."Nguy hiÓm qu¸! Ng­¬i míi bÞ Qu¸i thó nhËp vµo, may mµ mäi ng­êi h¬p søc l¹i ®uæi Qu¸i thó ®i råi! §Ó ®¸p t¹ lßng dòng c¶m cña ng­¬i, ta cã chót lßng thµnh xin nhËn cho!", 1, "NhËn lÊy lÔ vËt./festival06_Cancal");
        else
            Say(FESTIVAL06_NPCNAME.."Ta ®· nghe th¸m tö håi b¸o, ng­¬i lµm tèt l¾m ®· sö dông ph¸o ®uæi chóng ®i "..nGetCount.."lÇn, ®¸nh tróng Qu¸i thó "..nRank..", ®©y lµ thï lao! Xin nhËn lÊy!", 1, "NhËn lÊy lÔ vËt./festival06_Cancal");
        end;
    end;
    
    function festival06_knowabout()
        Say(FESTIVAL06_NPCNAME.."Ho¹t ®éng ®¸nh Qu¸i thó mçi trËn lµ <color=yellow>15<color>phót. Trong ®ã <color=yellow>5<color> phót chuÈn bÞ, sau khi b¸o danh b¹n ®­îc ®­a ®Õn n¬i chuÈn bÞ. Khi ho¹t ®éng b¾t ®Çu b¹n ®­îc chuyÓn ®Õn chç Qu¸i thó xuÊt hiÖn, sau <color=yellow>15<color> gi©y sÏ cã tõ 1~ 2 ng­êi ch¬i bÞ Qu¸i thó nhËp hån. Lóc nµy ng­êi bÞ nhËp hån ph¶i lËp tøc ®i b¾t <color=yellow>nh÷ng ®øa bÐ ®i l¹c<color>", 2, "Trang kÕ /festival06_next", "KÕt thóc ®èi tho¹i./festival06_Cancal");
    end;
    
    function festival06_next()
        Say(FESTIVAL06_NPCNAME.."Nh÷ng ng­êi kh¸c ph¶i sö dông '<color=yellow>ph¸o<color>' ®Ó ®uæi ®¸m Qu¸i thó ®i, ®ång thêi ph¶i ng¨n chÆn ®¸m Qu¸i thó b¾t lò trÎ, sau khi kÕt thóc ho¹t ®éng '<color=yellow>Sai dÞch Nha m«n<color>' sÏ dùa theo <color=yellow>sè lÇn sö dông ph¸o<color> cña ng­êi ch¬i ®Ó tÝnh thï lao", 1, "Ta ®· biÕt råi. /festival06_Cancal");
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
	{0, 0, 0, 0.12, 0.15, 0.2, 0.24, 0.15, 0.1, 0.04},
	{0, 0, 0, 0.15, 0.15, 0.2, 0.24, 0.15, 0.08, 0.03},
	{0, 0, 0, 0.16, 0.15, 0.25, 0.25, 0.12, 0.05, 0.02},
	{0.05, 0.05, 0.12, 0.08, 0.12, 0.15, 0.2, 0.15, 0.08, 0},
	{0.05, 0.06, 0.12, 0.08, 0.12, 0.15, 0.18, 0.18, 0.06, 0},
	{0.05, 0.06, 0.12, 0.08, 0.12, 0.15, 0.15, 0.24, 0.03, 0},
	{0.08, 0.08, 0.16, 0.08, 0.12, 0.15, 0.12, 0.2, 0.01, 0},
	{0.1, 0.1, 0.15, 0.1, 0.12, 0.18, 0.15, 0.1, 0, 0}
};

tabGoods = {
    
};
    function festival06_addaward()
        local nGetCount = GetTask(TK_FE_COUNT_ONETIME);
        local nRank = GetTask(TK_FE_RANK);
        if (nRank > getn(tabExp)) then
            nRank = getn(tabExp);
        end;
        SetTask(TK_FE_COUNT_ONETIME, 0);
        SetTask(TK_FE_RANK, 0);
        
        nRank = festival_award_rank(nRank);
        festival_expaward(nRank);
        festival_goodsaward(nRank);
        if (nRank <= 2) then
            local nSeed = random(1, 100);
            if (nSeed <= 2) then
                AddItem(0, 11, 263, 1, 0, 0, 0);
                Msg2Player("B¹n nhËn ®­îc 1 <color=yellow>MÆt n¹ Qu¸i thó<color>")
            end;
        end;
    end;
    
    function festival_goodsaward(nRank)
        local nGroup = GetTask(TK_FE_GROUPID);
    	local nGoodsType = festival_getgoodtype(nRank, nGroup);
    	local strsay = "";
    	if (nGoodsType == 1) then
    		AddItem(6, 1, 122, 1, 0, 0, 0);
    		strsay = "B¹n nhËn ®­îc 1 Phóc Duyªn (tiÓu) "
    	elseif (nGoodsType == 2) then
    		AddItem(6, 1, 71, 1, 0, 0, 0);
    		strsay = "B¹n nhËn ®­îc 1 Tiªn Th¶o Lé "
    	elseif (nGoodsType == 3) then
    		local szItemName = festival_addpkwan();
    		strsay = "B¹n nhËn ®­îc mét"..szItemName;
    	elseif (nGoodsType == 4) then
    		AddItem(6, 1, 123, 1, 0, 0, 0);
    		strsay = "B¹n nhËn ®­îc 1 Phóc Duyªn (trung) "
    	elseif (nGoodsType == 5) then
    		AddItem(6, 1, 147, 4, 0, 0, 0);
    		strsay = "B¹n nhËn ®­îc 1 HuyÒn Tinh cÊp 4"
    	elseif (nGoodsType == 6) then
    		AddItem(6, 1, 124, 1, 0, 0, 0);
    		strsay = "B¹n nhËn ®­îc 1 Phóc Duyªn (®¹i) "
    	elseif (nGoodsType == 7) then
    		AddItem(6, 1, 147, 5, 0, 0, 0);
    		strsay = "B¹n nhËn ®­îc 1 HuyÒn Tinh cÊp 5"
    	elseif (nGoodsType == 8) then
    		AddItem(6, 1, 147, 6, 0, 0, 0);
    		strsay = "B¹n nhËn ®­îc 1 HuyÒn Tinh cÊp 6"
    	elseif (nGoodsType == 9) then
    		AddItem(6, 1, 147, 7, 0, 0, 0);
    		strsay = "B¹n nhËn ®­îc 1 HuyÒn Tinh cÊp 7"
    	elseif (nGoodsType == 10) then
    		AddItem(6, 1, 147, 8, 0, 0, 0);
    		strsay = "B¹n nhËn ®­îc 1 HuyÒn Tinh cÊp 8"
    	end;
  		Msg2Player(strsay);
    end;
    
    function festival_getgoodtype(nRank, nGroup)
        
    	local nSeed = random(100);
    	local nRate = {}
    	local i;
    	for i = 1, 10 do
    		nRate[i] = tabRate[nRank][i] * 100;
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
        local nCount = tabExp[nRank];
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
        local nGroup = GetTask(TK_FE_GROUPID);
        if (nGroup > FE_SMALLMAPCOUNT) then
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
end;