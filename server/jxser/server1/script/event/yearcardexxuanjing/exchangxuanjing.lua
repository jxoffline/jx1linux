function onYearCardGift()
	Say( " ", 2, "Ta muèn nhËn l·nh/year_GetCardGift", "L¸t n÷a quay l¹i/onCancel" )
end

function year_GetCardGift()
	local nCurEPValue = GetExtPoint( 3 );
	if( nCurEPValue >= 1 ) then
		if( nCurEPValue > 32767 ) then
			Say( "D÷ liÖu cã chót sai sãt, xin h·y liªn l¹c víi GM ®Ó ®­îc gi¶i quyÕt! C¶m ¬n quı kh¸ch ®· tham gia ho¹t ®éng!", 0 );
		else
			Say("Ng­¬i x¸c ®Şnh nhËn quµ thÎ ®Çu n¨m chø? (Sau khi x¸c ®Şnh xin ®õng rêi m¹ng!) ", 2, "X¸c nhËn/year_getgiftok", "Hñy bá /no");
		end
	else
		Talk( 1, "", "Trong thêi gian diÔn ra ho¹t ®éng b¹n ch­a n¹p thÎ ®Çu n¨m (hoÆc ®· l·nh qua) , khi n¹p thÎ ®Çu n¨m sÏ nhËn ®­îc quµ, ®õng bá lì c¬ héi <color=yellow>5 viªn <color> <color=red>HuyÒn Tinh Kho¸ng Th¹ch cÊp 6<color> vµ <color=yellow>5 viªn <color> <color=red> HuyÒn Tinh Kho¸ng Th¹ch cÊp 7<color> ®Êy nhĞ!" );
	end
end

function year_getgiftok()
	PayExtPoint( 3, 1);
	Msg2Player("§ang lÊy quµ thÎ ®Çu n¨m cho b¹n! Trong thêi gian nµy xin ®õng rêi m¹ng!")
end

function no()
end