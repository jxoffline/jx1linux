-- ½±Àø.lua (°ï»áÕĞÄ¼µÜ×Ó»î¶¯)
if (not __COLLG_AWARD_H__) then
	__COLLG_AWARD_H__ = 1;
Include([[\script\missions\tong\collectgoods\head.lua]]);
IncludeLib("FILESYS");

tabExp = {
2000000,
2000000,
2000000,
1500000,
1500000,
1500000,
1000000,
1000000,
1000000,
1000000
};

collg_tabRate = {--Ğ¡¸£Ôµ ÏÉ²İÂ¶ Ëæ»úPKÍè ÖĞ¸£Ôµ 4¼¶Ğş¾§ ´ó¸£Ôµ 5¼¶Ğş¾§ Ëæ»úË®¾§ ÈÎÎñ¾íÖá 6¼¶Ğş¾§ 7¼¶Ğş¾§ 8¼¶Ğş¾§
	{0, 0, 0, 0, 0, 0.27, 0.2755, 0.12, 0.2, 0.1, 0.03, 0.0045},	--µÚÒ»Ãû
	{0, 0, 0, 0, 0.2, 0.172, 0.2, 0.1, 0.2, 0.1, 0.025, 0.003},	--
	{0, 0, 0, 0.061, 0.2, 0.137, 0.2, 0.1, 0.2, 0.08, 0.02, 0.002},	--
	{0.04, 0.04, 0.04, 0.061, 0.17, 0.137, 0.2, 0.05, 0.18, 0.072, 0.01, 0},	--
	{0.05, 0.05, 0.06, 0.068, 0.17, 0.137, 0.2, 0.05, 0.15, 0.06, 0.005, 0},	--
	{0.059, 0.06, 0.1, 0.1, 0.12, 0.15, 0.15, 0.05, 0.15, 0.06, 0.001, 0},		--
	{0.15, 0.12, 0.14, 0.1, 0.1, 0.1, 0.1, 0.01, 0.12, 0.06, 0, 0},	--
	{0.18, 0.17, 0.14, 0.1, 0.1, 0.05, 0.1, 0.01, 0.1, 0.05, 0, 0},	--
	{0.17, 0.15, 0.1, 0.2, 0.1, 0.05, 0.1, 0.01, 0.1, 0.02, 0, 0},	--
	{0.15, 0.13, 0.16, 0.25, 0.15, 0.05, 0.1, 0.01, 0, 0, 0, 0}	--µÚÊ®Ãû
};

--ÎïÆ·ÖÖÀà
tab_goods = {
	{122, 0, "Phóc Duyªn (tiÓu) "},
	{71, 0, "Tiªn Th¶o Lé "},
	{"PK hoµn"},
	{123, 0, "Phóc Duyªn (trung) "},
	{147, 4, "HuyÒn Tinh cÊp 4"},
	{124, 0, "Phóc Duyªn (®¹i) "},
	{147, 5, "HuyÒn Tinh cÊp 5"},
	{"Thñy tinh"},
	{"MËt ®å nhiÖm vô "},
	{147, 6, "HuyÒn Tinh cÊp 6"},
	{147, 7, "HuyÒn Tinh cÊp 7"},
	{147, 8, "HuyÒn Tinh cÊp 8"},
}


function collg_about()
	Say("Mét ®ît ho¹t ®éng diÔn ra trong <color=red>15<color> phót. Trong ®ã cã <color=red>5<color> phót chuÈn bŞ. Sau khi b¸o danh tham gia, ng­êi ch¬i sÏ ®­îc ®­a ®Õn khu vùc chuÈn bŞ. Khi ho¹t ®éng b¾t ®Çu th× trong khu vùc sÏ xuÊt hiÖn 'Tói hµng hãa', ng­êi ch¬i chØ cÇn nhÆt c¸c 'Tói hµng hãa' nµy; nh­ng cÇn ph¶i cÈn thËn nh÷ng con 's©u næ' ngÉu nhiªn xuÊt hiÖn b¸m vµo th©n ng­êi vµ ph¸t næ.", 1, "Trang kÕ /collg_about_next");
end;

function collg_about_next()
	Say("NÕu nh­ ng­êi ch¬i bŞ s©u ph¸t næ th× nh÷ng 'Tói hµng hãa' sÏ bŞ r¬i ra ë gÇn ®ã, ®ång thêi bŞ cho¸ng trong 30 gi©y. Trong thêi gian bŞ cho¸ng sÏ kh«ng bŞ 's©u næ' tÊn c«ng. Khi bŞ s©u næ b¸m vµo th× sÏ cã thªm kü n¨ng 'nĞm chuyÒn', cã thÓ dïng kü n¨ng nµy ®Ó nĞm s©u vµo ng­êi ch¬i kh¸c. Sau khi ho¹t ®éng kÕt thóc, '<color=yellow>Tæng qu¶n Ho¹t ®éng ph­êng<color>' sÏ c¨n cø vµo b¶ng xÕp h¹ng sè l­îng 'Tói hµng hãa' ®Ó ph¸t th­ëng.", 0);
end;

function collg_aword()
	if (GetTaskTemp(193) == 1) then
		return
	end;
	SetTaskTemp(193, 1);
	
	local nCount = GetTask(COLLG_COUNT_ONETIME);
	local nRank = GetTask(COLLG_TK_RANK);
	SetTask(COLLG_COUNT_ONETIME, 0);
	SetTask(COLLG_TK_RANK, 0);
	if (nCount == 0 or nRank == 0) then
		Say("Tæng qu¶n Ho¹t ®éng ph­êng: Ng­¬i muèn nhËn th­ëng ­, h·y mau ®i t×m tói hµng hãa ®·, nÕu kh«ng cã th× t×m ta còng lµ phİ thêi gian mµ th«i.", 1, "Theo có phÊt tay bay ra/oncancel");
		SetTaskTemp(193, 0);
		return
	end;
	
	Say("Tæng qu¶n Ho¹t ®éng ph­êng: Lµm rÊt tèt, ng­¬i t×m ®­îc <color=yellow>"..nCount.."<color> tói hµng hãa, xÕp h¹ng thø <color=yellow>"..nRank.."<color>, ®©y lµ phÇn th­ëng dµnh cho ng­¬i, xin h·y nhËn lÊy.", 1, "NhËn lÊy lÔ vËt./oncancel");
	collg_giveaward(nRank);
	SetTaskTemp(193, 0);
end;


function collg_giveaward(nRank)
	AddOwnExp(tabExp[nRank]);
	collg_goodsaward(nRank);
end;

function collg_festival_addpkwan()--¼ÓPKÍè
    local itemidx = random(1, 10);
    AddItem(6, 0, itemidx, 1, 0, 0, 0);
    tab_pkwan_name = {"Tr­êng MÖnh hoµn", "Gia Bµo hoµn", "§¹i Lùc hoµn", "Cao ThiÓm hoµn", "Cao Trung hoµn", "Phi Tèc hoµn", "B¨ng Phßng hoµn", "L«i Phßng hoµn", "Háa Phßng hoµn", "§éc Phßng hoµn"};
    Msg2Player("B¹n nhËn ®­îc mét"..tab_pkwan_name[itemidx]);
end;

function collg_goodsaward(nRank)
	local nGoodsType = collg_getgoodtype(nRank);
	
	if (nGoodsType == 3) then	--¼ÓÒ»¸öPKÍè
		collg_festival_addpkwan();
		return
	end;
	
	if (nGoodsType == 8) then	--Ëæ»úÒ»¸öË®¾§
		collg_givecrystal();
		return
	end;
	
	if (nGoodsType == 9) then	--¼ÓÒ»¸öÈÎÎñ¾íÖá
		collg_giveTaskBook();
		return
	end;
	AddItem(6, 1, tab_goods[nGoodsType][1], tab_goods[nGoodsType][2], 0, 0, 0);
	local strsay = "B¹n nhËn ®­îc mét"..tab_goods[nGoodsType][3];
	Msg2Player(strsay);
end;

function collg_givecrystal()
	local nIdx = random(1, 3);
	local tab_Crystal = {{238, "Lam Thñy Tinh"}, {239, "Tö Thñy Tinh"}, {240, "Lôc Thñy Tinh"}};
	AddItem(4, tab_Crystal[nIdx][1], 0, 0, 0, 0, 0);
	Msg2Player("B¹n nhËn ®­îc <color=yellow>"..tab_Crystal[nIdx][2].."<color>.");
end;

function collg_getgoodtype(nRank)
	local nSeed = random(100);
	local nRate = {}
	local i;
	local nBase = 0;
	for i = 1, getn(collg_tabRate[nRank]) do
		nBase = nBase + collg_tabRate[nRank][i] * 100;
		if (nBase >= nSeed) then
			return i;
		end;
	end;
end;

-- Éú³ÉÒ»¸öÈÎÎñ¾íÖá
function collg_giveTaskBook()
	local nRandomTaskID, nRandomItemIndex = 0, 0;
	-- Ñ¡ÔñÒ»¸öµÚ¶ş²ãµÄËæ»úÈÎÎñ
	nRandomTaskID = TaskNo(selectNextTask());
	-- Éú³ÉÒ»¸öÈÎÎñ¾íÖá
	nRandomItemIndex = AddItem(6, 2, 2, 0, 1, 0, 0);
	SetItemMagicLevel(nRandomItemIndex, 1, nRandomTaskID);
	-- Í¬²½ÎïÆ·Ä§·¨ÊôĞÔ
	SyncItem(nRandomItemIndex);	
	Msg2Player("B¹n nhËn ®­îc mét <color=green>quyÓn nhiÖm vô<color>!");
	WriteTaskLog("NhËn ®­îc 1 mËt tŞch nhiÖm vô, m· sè lµ:"..nRandomTaskID);
	return nRandomTaskID;
end;


-- ÈÎÎñÏµÍ³µÄĞ´Èë LOG ¹ı³Ì
function WriteTaskLog(strMain)
	-- Èç¹ûÊÇ¿ÕÖµÔò²»Ğ´Èë
	if strMain==nil then return end;
	WriteLog("[Ho¹t ®éng thu thËp vËt phÈm bang héi n¨m 2006]"..GetLocalDate(" [%y n¨m %m th¸ng %d ngµy  %H giê %M phót]").." [mËt m·:"..GetAccount().."] [nh©n vËt:"..GetName().."]:"..strMain);
end;

function oncancel()	--È¡Ïû

end;

end; --// end of __COLLG_AWARD_H__