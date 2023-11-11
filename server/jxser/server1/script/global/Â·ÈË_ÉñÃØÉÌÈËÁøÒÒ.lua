--ÒÔ¸£Ôµ³öÊÛÎïÆ·µÄNPC
--2004.8.5

Include( "\\script\\global\\fuyuan.lua" )
Include("\\script\\event\\mid_autumn06\\head.lua")
Include("\\script\\skill\\lvlup150_l21_limit.lua")
Include("\\script\\vng_feature\\thuongnhanthanbi\\moruongfour\\openchestfour.lua")

function main()
	local tab_Content = {
		"Giao dŞch/OnBuy", 
		"Kh«ng giao dŞch/OnCancel", 
		--"Hîp thµnh më s¸ch kÜ n¨ng cÊp 150/#tbLvUp150L21Limit:Compose()",
		"Xin h·y ®­a ta ®Õn ngän nói Tr­êng B¹ch/GotoHuanZhuan",
		"Liªn quan ®Õn phóc duyªn/OnAbout"
	};
	if (au06_is_inperiod() == 1) then
		--tinsert(tab_Content, " Ho¹t ®éng Trung Thu/au06_lpaw_entrance");
	end;
	--tinsert(tab_Content, "Më r­¬ng 4/#tbChectfour:main()");
	Say ( "Kh¸ch quan muèn mua g×? Bæn tiÖm kh«ng thiÕu mãn g×!", getn(tab_Content), tab_Content);
end

function OnBuy()
	Sale( 93, 2 );
end

function OnAbout()
	Talk( 3, "", "Sè ®iÓm phóc duyªn: Th«ng qua tİch lòy thêi gian Online sÏ ®æi lÊy mét sè ®iÓm ¶o, cã thÓ dïng ®Ó ®æi c¸c lo¹i vËt phÈm ®Æc biÖt  ë ThÇn bİ Th­¬ng Nh©n LiÔu Êt(T­¬ng D­¬ng) .", "§æi phóc duyªn: Sau khi online > 2 giê, ®Õn Vâ L©m TruyÒn Nh©n ë c¸c §¹i thµnh thŞ ®Ó ®æi. NÕu 1 ngµy ®æi phóc duyªn thµnh c«ng 2 lÇn, sÏ nhËn ®­îc phÇn th­ëng. NÕu Online < 4 giê, mçi giê ®æi ®­îc 1 ®iÓm. Sau ®ã, mçi 2 giê ®æi ®­îc 1 ®iÓm. Thµnh viªn trong ®éi cã thÓ nhËn ®iÓm gióp cho c¶ ®éi.", "§iÒu kiÖn h¹n chÕ: §ang ë ®¹i lao vµ §µo Hoa §¶o sÏ kh«ng ®­îc tİnh tİch lòy thêi gian online" );
end

function au06_lpaw_entrance()
	if (au06_IsPayed_player() == 0) then
		Say("ChØ cã ng­êi ch¬i n¹p thÎ míi cã thÓ tham gia ho¹t ®éng Trung thu", 0);
		return
	end;
	Say("NÕu ng­¬i cã <color=yellow> 10 Th­¬ng Cæ lÖnh bµi<color> ta sÏ ®æi cho 1  <color=yellow>Phông NguyÖt Qu¶ Dung<color> t¨ng ®iÓm kü n¨ng hoÆc 1 <color=yellow>Cèng NguyÖt Phï Dung<color> t¨ng ®iÓm tiÒm n¨ng.", 3, "§æi 10 Th­¬ng Cæ lÖnh bµi lÊy Phông NguyÖt Qu¶ Dung/#shangjialingpai(1)", "§æi 10 Th­¬ng Cæ lÖnh bµi lÊy Cèng NguyÖt Phï Dung/#shangjialingpai(2)", "Nh©n tiÖn ghĞ qua th«i/oncancel");
end;

function shangjialingpai(nIndex)
	if (CalcEquiproomItemCount(6, 1, 1252, -1) < 10) then
		Say("Ng­¬i ch­a ®ñ 10 Th­¬ng Cæ lÖnh bµi", 0);
		return
	end;
	
	--¿Û³ıÎïÆ·
	if (ConsumeEquiproomItem(10, 6, 1, 1252, -1) ~= 1) then
		return
	end
	
	--¸øÓè½±Àø
	local str = "<color=yellow>Phông NguyÖt Qu¶ Dung<color>";
	if (nIndex == 1) then -- Ôö¼ÓÒ»¸ö¼¼ÄÜµã
		AddItem(6, 1, 127, 1, 0, 0, 0);
	else -- Ôö¼Ó5¸öÇ±ÄÜµã
		AddItem(6, 1, 128, 1, 0, 0, 0);
		str = "<color=yellow>Cèng NguyÖt Phï Dung<color>";
	end;
	
	--¸øÓèÌáÊ¾
	Say("Hay qu¸! Xin nhËn chót quµ män ®¸p lÔ!", 0);
	Msg2Player(" B¹n nhËn ®­îc "..str);
end;

function OnCancel()
end
function GotoHuanZhuan()
	NewWorld(934, 49632 / 32, 105696 /32)
end
