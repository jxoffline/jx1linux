if (not _H_DIALOG_FESTIVAL2006_H_) then
	_H_DIALOG_FESTIVAL2006_H_ = 1;
Include([[\script\missions\springfestival\head.lua]]);
Include([[\script\missions\springfestival\award.lua]]);
Include([[\script\missions\springfestival\signin.lua]]);

--	¶Ô»»º¯ÊýÖ÷Èë¿Ú
function sf06_mainentrance()
	local tab_Content = {
	"Kh«ng thµnh vÊn ®Ò!/signin_temp",
	"Ta ®· ®uæi '¤ng Ba M­¬i' ®i råi!/sf07_getaward",
	"Liªn quan ®Õn ho¹t ®éng ®uæi '¤ng Ba M­¬i'/sf07_detail",
	"D¹o nµy ta bËn qu¸, t×m ng­êi kh¸c ®i!/no"
	}
	Describe("Cø mçi ®é xu©n vÒ lµ <color=yellow>¤ng Ba M­¬i<color> ®Òu ®Õn g©y h¹i d©n lµng. §Ó gióp d©n lµng gi¶i quyÕt tai häa nµy, Vâ L©m Minh Chñ ®· tËp häp c¸c vÞ vâ l©m nh©n sü gióp d©n lµng ®uæi <color=yellow>¤ng Ba M­¬i<color>, gióp hä cã mét n¨m míi yªn b×nh. §Ó ®¸p t¹ nghÜa cö cao quý cña Minh chñ, quan phñ ®· d¸n c¸o thÞ treo th­ëng cho nhiÖm vô ®uæi <color=yellow>¤ng Ba M­¬i<color>. ë nhiÖm vô nµy, ng­êi ch¬i sÏ ph¶i sö dông ®¹o cô Ph¸o hoa TÕt ®Ó ®¸nh ®uæi ¤ng ba m­¬i, ¤ng ba m­¬i còng cã thÓ sö dông ®¹o cô ®Ó tÊn c«ng l¹i ng­êi ch¬i. C¸c nh©n sü cã thÓ ®Õn ®©y ®Ó b¸o danh nhiÖm vô <color=yellow>§uæi «ng ba m­¬i<color>. Ng­¬i cã muèn tham gia kh«ng?", getn(tab_Content), tab_Content);
end;

function signin_temp()
	Say("§uæi «ng ba m­¬i cøu gióp d©n lµng lµ mét nghÜa cö cao quý, l¹i võa thÓ hiÖn tinh thÇn yªu quý ®éng vËt.", 2, "Ha ha, mau ®­a ta ®Õn n¬i cã '¤ng Ba M­¬i'./signin", "§îi mét l¸t! Ta ph¶i chuÈn bÞ./no");
end;

--	½éÉÜº¯Êý
function sf07_detail()
	Describe("Mçi ®ît ho¹t ®éng '§uæi «ng ba m­¬i' sÏ diÔn ra trong vßng <color=yellow>15 phót<color>, trong ®ã cã <color=yellow>5 phót<color> ®Ó chuÈn bÞ. Sau khi b¸o danh, b¹n sÏ ®­îc ®­a ®Õn khu vùc chuÈn bÞ, khi ho¹t ®éng b¾t ®Çu th× b¹n sÏ ®­îc ®­a ®Õn khu vùc ho¹t ®éng. <color=yellow>15 gi©y<color> sau khi ho¹t ®éng b¾t ®Çu, trong sè nh÷ng ng­êi tham gia sÏ cã 1 ®Õn 2 ng­êi ch¬i hãa th©n thµnh '¤ng ba m­¬i'. Ng­êi ch¬i biÕn thµnh '¤ng ba m­¬i' sÏ ph¶i b¾t <color=yellow>Heo rõng<color> xuÊt hiÖn trong khu vùc. Nh÷ng ng­êi ch¬i cßn l¹i sÏ ph¶i dïng <color=yellow>ph¸o viªn<color> ®Ó '®uæi' ¤ng ba m­¬i, ng¨n kh«ng cho '¤ng ba m­¬i' b¾t heo rõng. Sau khi ho¹t ®éng kÕt thóc, <color=yellow>Nha m«n sai dÞch<color> sÏ c¨n cø vµo sè lÇn dïng <color=yellow>ph¸o<color> nÐm tróng '¤ng ba m­¬i' cña ng­êi ch¬i ®Ó tÆng th­ëng.", 1, "Ta biÕt råi./sf06_mainentrance");
end;

--	¸øÓè½±ÀøÖ÷º¯Êý
function sf07_getaward()
	local nCount = GetTask(TK_CO_COUNT_ONETIME);
	local nRank = GetTask(TK_CO_RANK);
	
	if (nCount == 0 or nRank == 0) then
		Say("H×nh nh­ ng­¬i ch­a ®i '®uæi ¤ng ba m­¬i'. Muèn nhËn th­ëng h·y mau chãng gãp søc."..CO_ANIMALNAME.."Ch¹y ®i.", 0);
		return
	end;
	
	if (CalcFreeItemCellCount() < 2) then
		Say("Kh«ng ®ñ chç chøa, h·y mau s¾p xÕp l¹i hµnh trang.", 0);
		return
	end;
	SetTask(TK_CO_COUNT_ONETIME, 0);
	SetTask(TK_CO_RANK, 0);
	nRank1 = festival_award_rank(nRank);
    festival_expaward(nRank1);
	festival_goodsaward(nRank1);
	if (GetTask(TK_CO_GROUPID) > CO_SMALLMAPCOUNT) then
		Say("Haha, lµm tèt l¾m! Võa råi ng­¬i ®· t×m thÊy <color=yellow>"..nCount.."c¸i<color>"..CO_MOUSENAME..", xÕp h¹ng thø <color=yellow>"..nRank.."<color>,®©y lµ phÇn th­ëng cña ng­¬i, h·y nhËn lÊy!", 0)
	else
		Say("Ha ha, lµm tèt l¾m! Ng­¬i ®¸nh tróng tæng céng <color=yellow>"..nCount.." lÇn<color>"..CO_ANIMALNAME..", xÕp h¹ng thø <color=yellow>"..nRank.."<color>,®©y lµ phÇn th­ëng cña ng­¬i, h·y nhËn lÊy!", 0)
	end;
end;

end;	--	end of _H_DIALOG_FESTIVAL2006_H_