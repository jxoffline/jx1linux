--by ÁÎÖ¾É½ [2006-09-12]
--2006ÖĞÇï»î¶¯:ÓÃ10¸öÎå²ÊµÆÁıµ½Àñ¹Ù´¦Áì½±
--Illustration: µÆÁı -- lightcage au06- -- midautumn2006

if (not __H_ITEM_LIGUAN__) then
	__H_ITEM_LIGUAN__ = 1;

Include([[\script\event\mid_autumn06\head.lua]]);

tab_lg_award = {
	{	"Vâ L©m MËt TŞch",	125,	6,	1,	26, 1},
	{	"TÈy Tñy Kinh",	125,	6,	1,	22, 1},
	{	"ngùa cÊp 80",	250,	0,	10,	2,	4},
	{	"s¸ch kü n¨ng m«n ph¸i",	400,	-1},
	{	"Tiªn Th¶o Lé vµ Phóc Duyªn Lé",	4550,	-1},
	{	"b¸nh trung thu B¸t Tr©n Phóc NguyÖt",	4550,	6,	1,	126, 1},
};

tab_sbook_list =
{	-- ¸ñÊ½£º{¼¼ÄÜID, ¼¼ÄÜÊéÃû³Æ}
	{27, "'Tô TiÔn thuËt. B¹o Vò Lª Hoa' "},
	{28, "'H·m TÜnh thuËt. Lo¹n Hoµn Kİch' "},
	{33, "Th¸i Cùc QuyÒn Phæ- QuyÓn 3 "},
	{34, "'Th¸i Cùc KiÕm Phæ. QuyÓn 2' "},
	--{35, "'V©n Long Kİch. M©u ph¸p' "},
	{36, "'L­u Tinh. §ao ph¸p' "},
	{37, "'Thiªn V­¬ng Chïy Ph¸p. QuyÓn 1' "},
	{38, "Thiªn V­¬ng Th­¬ng ph¸p- QuyÓn 2 "},
	{39, "Thiªn V­¬ng §ao ph¸p - QuyÓn 3 "},
	{40, "'Thóy Yªn §ao ph¸p' "},
	{41, "'Thóy Yªn Song ®ao' "},
	{42, "'DiÖt KiÕm MËt TŞch' "},
	{43, "'Nga Mi PhËt Quang Ch­ëng MËt TŞch' "},
	{45, "'Phi §ao thuËt. NhiÕp Hån NguyÖt ¶nh' "},
	{46, "'Phi Tiªu thuËt. Cöu Cung Phi Tinh' "},
	{47, "'Ngò §éc Ch­ëng Ph¸p. QuyÓn 1' "},
	{48, "'Ngò §éc §ao ph¸p. QuyÓn 2' "},
	{49, "'Ngò §éc NhiÕp T©m thuËt. QuyÓn 3' "},
	{50, "'Ngù Phong thuËt' "},
	{51, "'Ngù L«i thuËt' "},
	{52, "'Ngù T©m thuËt' "},
	{53, "NhiÕp Hån - Tr­íc Chó "},
	{54, "'C¸i Bang Ch­ëng Ph¸p' "},
	{55, "C¸i Bang C«n Ph¸p "},
	{56, "'ThiÕu L©m QuyÒn Ph¸p. QuyÓn 1' "},
	{57, "'ThiÕu L©m C«n ph¸p. QuyÓn 2' "},
	{58, "'ThiÕu L©m §ao ph¸p. QuyÓn 3' "},
	{59, "'Phæ §é MËt TŞch' "},
}

--Àñ¹Ù»»½±Æ·Èë¿Ú
function au06_lg_award()
	if (au06_is_inperiod() == 0) then --
		Say("Ho¹t ®éng ®· kÕt thóc.", 0);
		return 1;
	end;
	
	if (au06_IsPayed_player() == 0) then
		Say("ChØ cã ng­êi ch¬i n¹p thÎ míi cã thÓ tham gia ho¹t ®éng Trung thu", 0);
		return
	end;
	
	local tab_Content = {
		"§­îc th«i! Ta ®æi 10 Lång ®Ìn kĞo qu©n ®Æc biÖt lÊy quµ cña «ng!/au06_shangjialingpai",
		"ChØ ®Õn th¨m «ng chót th«i!/oncancel"
	};
	Say("Trung thu vui vÎ! Ng­¬i cã muèn ®æi 10 Lång ®Ìn kĞo qu©n ®Æc biÖt lÊy quµ cña ta kh«ng?", getn(tab_Content), tab_Content);
end;

function au06_shangjialingpai()
	if (CalcEquiproomItemCount(6, 1, 1234, -1) < 10) then
		Say("T×m ®ñ <color=yellow>10 Lång ®Ìn kĞo qu©n ®Æc biÖt<color> råi h·y ®Õn ®©y!", 0);
		return
	end;
	
	--¿Û³ıÎïÆ·
	if (ConsumeEquiproomItem(10, 6, 1, 1234, -1) ~= 1) then
		return
	end
	
	--Ëæ¼´ÖÖ×Ó
	local nIndex = 6;
	local nSeed = random(1, 10000);
	local nSum = 0;
	for i = 1, getn(tab_lg_award) do
		nSum = nSum + tab_lg_award[i][2];
		if (nSeed <= nSum) then
			nIndex = i;
			break;
		end;
	end;
	
	local szName = tab_lg_award[nIndex][1];
	--¸øÓè½±Àø
	if (nIndex == 4) then -- Ôö¼Ó¼¼ÄÜÊé
		local bIdx = random(1, getn(tab_sbook_list));
		AddItem(6, 1, tab_sbook_list[bIdx][1], 1, 0, 0, 0);
		szName = "quyÓn"..tab_sbook_list[bIdx][2];
	elseif (nIndex == 5) then -- Ôö¼ÓÏÉ²İºÍ¸£Ôµ
		AddItem(6, 1, 71, 1, 0, 0, 0);
		AddItem(6, 1, 124, 1, 0, 0, 0);
	elseif (nIndex == 3) then -- Ôö¼ÓÏÉ²İºÍ¸£Ôµ
		AddItem(0, 10, 2, 4, random(0, 4), 0, 0);
	else
		AddItem(tab_lg_award[nIndex][3], tab_lg_award[nIndex][4], tab_lg_award[nIndex][5], tab_lg_award[nIndex][6], 0, 0, 0);
	end;
	
	--¸øÓèÌáÊ¾
	Say("Cã lång ®Ìn nµy Trung Thu cµng thªm vui! TÆng ng­¬i! Chóc trung thu vui vÎ!", 0);
	Msg2Player("B¹n nhËn ®­îc<color=yellow>"..szName.."<color>");
end

end; --//end of __H_ITEM_LIGUAN__