--Create by mengfan 2004-9-14
--·îÔÂ¹ûÈØ
--×÷ÓÃ£ºÖĞÇï¸ß¼¶ÔÂ±ıÖ®Ò»£¬×÷ÓÃÍ¬ÎäÁÖÃØ¼®£¬80¼¶ÒÔÉÏÍæ¼ÒÊ¹ÓÃ£¬Ôö¼ÓÒ»µãÎä¹¦¼¼ÄÜµã¡£
--»ñµÃÌõ¼ş£º¼¯Æë»ñµÃ´ËÎïÆ·ËùĞèÒªµÄËùÓĞµ¥×Ö¡£
--ÏŞÖÆËµÃ÷£º¸ÃÎïÆ·ÒªÇóÈËÎïµÈ¼¶80¼¶Ê±Ê¹ÓÃÓĞĞ§£¬Ã¿ÈË×î¶àÊ¹ÓÃ2´Î¡£
--ÈÎÎñ±äÁ¿700µÍ4Î»±íÊ¾Ê¹ÓÃ¸ÃÎïÆ·µÄ´ÎÊı

function main(sel) 
	times = GetTask(700)
	str={
		"<#> B¹n thö c¾n mét miÕng Phông NguyÖt Qu¶ Dung, kÕt qu¶ kh«ng cã chuyÖn g× x¶y ra.: (",
		"<#> B¹n c¾n mét miÕng Phông NguyÖt Qu¶ Dung, kÕt qu¶ ph¸t hiÖn vâ c«ng kh«ng cã g× thay ®æi.",
		"<#> B¹n thö c¾n mét miÕng Phông NguyÖt Qu¶ Dung, kÕt qu¶ ph¸t hiÖn cã luång ch©n khİ trong ng­êi ®ang vËn chuyÓn",
		"<#> B¹n ®· ¨n 2 c¸i Phông NguyÖt Qu¶ Dung, kh«ng thÓ dïng tiÕp."
		}
	if(times > 1) then                -- Ê¹ÓÃ´ÎÊıÒÑ´ïµ½ÉÏÏŞ
		Msg2Player(str[4])
		return 1
	elseif (GetLevel() < 80) then     -- µÈ¼¶Ğ¡ÓÚ80
		Msg2Player(str[2])
		return 1
	else                            	
		AddMagicPoint(1)          -- ½±Àø1µã¼¼ÄÜµã
		time=date("%m%d%H%M%S")
	        name=GetName()
	    	WriteLog("Ng­êi ch¬i"..name.."T¹i"..time.."¡n hÕt mét c¸i B¸nh Trung thu Phông NguyÖt Qu¶ Dung")
		SetTask(700,times+1)
		Msg2Player(str[3])
		return 0
	end
end