--ÉÙÁÖºóÉ½ÃÜÊÒ ÄÚÊÒ Ğ¡´°Ç°µÄ¶Ô»°
-- by£ºDan_Deng(2003-08-04)

function main(sel)
	UTask_sl = GetTask(7)
	if (UTask_sl >= 40*256+20) and (UTask_sl < 50*256) then		-- ±ØĞëÔÚÈÎÎñÖĞ²ÅÄÜ½øÈë£¬²¢ÇÒÃ¿´Î½øÈë¶¼Òª»Ø´ğÎÊÌâ
		Say("BÇn t¨ng ®ang bÕ quan tu luyÖn, nÕu cã muèn truyÒn lêi cho bän hä th× th«ng qua hai c©u khÈu quyÕt nµy! Nghe kü ®©y!",4,"¸n Ma Ni B¸t Mª Hång /L40_S2_wrong","Hång Bèi Mª Ma Ni ¸n /L40_S2_wrong","B¸t Mª Ni Hång ¸n Ma /L40_S2_wrong","¸n B¸t Ni Ma Mª Hång. /L40_S2_correct")
	elseif (UTask_sl == 40*256+50) then
		Talk(3,"","KhÈu quyÕt quan träng thÕ nµy sao ng­¬i cã thÓ quªn ®­îc? Ta nãi l¹i mét lÇn h·y nhí kü ®ã!","C©u thø nhÊt lµ: ThÕ gian v« th­êng, Quèc Thæ Nguy Quú, c©u thø hai lµ: Tø §¹i Khæ Kh«ng, Ngò D­¬ng V« Ng·, c©u thø 3 lµ: Sanh DiÖt BiÕn Th¨ng, H­ Ngôy V« Chñ, c©u thø 4 lµ: T©m ThŞ ¸c Nguyªn, H×nh Vi Téi TÈu, c©u thø 5 lµ: Nh­ ThŞ Quan S¸t, Tiªm Ly Sinh Tö.","LÇn nµy ®õng quªn n÷a ®ã! §i ®i!")
	else
		Msg2Player("ThÇn t¨ng ®ang bÕ quan tËp luyÖn n¬i ®©y, xin ®õng lµm phiÒn ")
	end
end;

function L40_S2_correct()
	Talk(9,"L50_step2","§Ö tö cÇu kiÕn S­ thóc tæ!","Cã chuyÖn g×?","Ch­ëng m«n ph¸i ®Ö tö ®Õn thØnh mêi hai vŞ S­ thóc tæ xuÊt quan, bµn c¸ch côc thÕ thiªn h¹.","Kh«ng TŞch: Thiªn h¹ hai ch÷ hai ng­êi chóng ta kh«ng hiÓu, ng­êi chuyÓn gióp 5 c©u nµy cho ch­ëng m«n, «ng ta sÏ hiÓu râ.","C©u thø nhÊt: ThÕ Gian V« Th­êng, Quèc Thæ Nguy Quú,","Kh«ng TŞch: C©u thø hai: Tø §¹i Khæ Kh«ng, Ngò D­¬ng V« Ng·,","C©u thø ba: Sinh DiÖt BiÕn Th¨ng, H­ Ngôy V« Chñ,","Kh«ng TŞch: C©u thø t­ lµ: T©m ThŞ ¸c Nguyªn, H×nh Vi Téi TÈu,","C©u thø n¨m lµ: Nh­ ThŞ Quan S¸t, Tiªm Ly Sinh Tö.")
end;

function L40_S2_wrong()
	Talk(1,"","Sau khi ®äc xong khÈu quyÕt c¶nh cöa nhá kh«ng lung lay chót nµo, cã ph¶i b¹n ®· niÖm sai kh«ng?")
end;

function L50_step2()
	Talk(1,"","Thø tù cña n¨m c©u khÈu quyÕt nµy ph¶i nhí râ ®ã! §i ®i!")
	SetTask(7,40*256+50)
	AddNote("GÆp TŞch DiÖt NhŞ T¨ng cÇu truyÒn ®¹t l¹i chØ thŞ cho ph­¬ng Tr­îng. ")
	Msg2Player("GÆp TŞch DiÖt NhŞ T¨ng cÇu truyÒn ®¹t l¹i chØ thŞ cho ph­¬ng Tr­îng. ")
end;
