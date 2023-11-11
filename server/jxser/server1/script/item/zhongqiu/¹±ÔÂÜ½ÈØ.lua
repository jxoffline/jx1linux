--Create by mengfan ,2004-9-14
--¹±ÔÂÜ½ÈØ
--×÷ÓÃ£ºÖĞÇï¸ß¼¶ÔÂ±ıÖ®Ò»£¬×÷ÓÃÍ¬Ï´Ëè¾­£¬80¼¶ÒÔÉÏÍæ¼ÒÊ¹ÓÃ£¬Ôö¼Ó5µãÇ±ÄÜµã¡£
--»ñµÃÌõ¼ş£º¼¯Æë»ñµÃ´ËÎïÆ·ËùĞèÒªµÄËùÓĞµ¥×Ö¡£
--ÏŞÖÆËµÃ÷£º¸ÃÎïÆ·ÒªÇóÈËÎïµÈ¼¶80¼¶Ê±Ê¹ÓÃÓĞĞ§£¬Ã¿ÈË×î¶àÊ¹ÓÃ3´Î¡£
--ÈÎÎñ±äÁ¿701µÍ4Î»±íÊ¾Ê¹ÓÃ¸ÃÎïÆ·µÄ´ÎÊı



function main(sel)
	times = GetTask(701)
        str ={
		"<#> B¹n c¾n thö mét miÕng Cèng NguyÖt Phï Dung, kÕt qu¶ kh«ng cã chuyÖn g× x¶y ra.: (",
		"<#> B¹n c¾n mét miÕng Cèng NguyÖt Phï Dung, c¶m thÊy c¬ thÓ kháe h¼n, kinh m¹ch l­u th«ng.",
		"<#> B¹n ®· ¨n 3 c¸i Cèng NguyÖt Phï Dung, kh«ng thÓ dïng tiÕp."
	        }
	level = GetLevel()
	if(level < 80) then     --µÈ¼¶Ì«µÍ£¬²»ÈÃÊ¹ÓÃ
		Msg2Player(str[1])
		return 1
	end
	if(times > 2) then      --Ê¹ÓÃ³¬¹ı´ÎÊı
		Msg2Player(str[3])
		return 1
	end
	AddProp(5)              --Ç±ÄÜµãÔö¼Ó5µã
	time=date("%m%d%H%M%S")
        name=GetName()
	WriteLog("Ng­êi ch¬i"..name.."T¹i"..time.."¡n hÕt mét c¸i B¸nh Trung thu Cèng NguyÖt Phï Dung")
	SetTask(701,times+1)
	Msg2Player(str[2])
	return 0
end	