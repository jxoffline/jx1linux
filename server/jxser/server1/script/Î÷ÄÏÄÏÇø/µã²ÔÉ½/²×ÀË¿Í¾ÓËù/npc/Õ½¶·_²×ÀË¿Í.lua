function OnDeath(sel)
	Uworld42 = GetTask(42)
	if (Uworld42 == 70) then
		Talk(8,"U42_prise","Ha ha! H¶o TiÓu tö, kh«ng ngê ng­¬i còng kh¸ qu¸.","TiÒn bèi qu¸ khen!","§êi ng­êi nh­ giÊc méng, nªn tØnh l¹i th«i. MÊy ®øa trÎ nµy kh«ng cã lçi g× víi ta, ng­¬i dÉn chóng ®i ®i!","§a t¹ TiÒn bèi!","TiÓu tö! H·y nhí ph¶i tr©n träng nh÷ng g× m×nh cã, mÊt råi cã hèi còng kh«ng kŞp, ta si mª luyÖn vâ ®Õn khi c¶ nhµ gÆp n¹n, ®¹t ®Õn tuyÖt ®Ønh th× sao chø? Chi b»ng b×nh ®¹m sèng qua ngµy vui cïng con ch¸u.","T¹i h¹ xin ghi nhí.","Nh÷ng ®øa trÎ cÇn ®­îc d¹y dç. Ta b×nh sinh ®· häc nhiÒu råi, ng­¬i còng nªn häc ®i, lµm nhiÒu viÖc thiÖn, xem nh­ thay l·o phu tİch mÊy phÇn c«ng ®øc.","§a t¹ TiÒn bèi!")
		Msg2Player("§¸nh b¹i Th­¬ng L·ng kh¸ch ")
		NewWorld(167,1400,2974)
	end
end;

function U42_prise()
	SetTask(42,255)
	AddProp(2)
	Ubonus86 = GetTask(86) + 1					-- ¼ÇÂ¼ÈÎÎñ½±ÀøÁË2µãÇ±ÄÜ(µÚÒ»×Ö½Ú+1)
	if (GetByte(Ubonus86,1) >= 250) then		-- Èİ´í£ºÉÏÏŞÎª250µã
		Ubonus86 = 250
	end
	SetTask(86,Ubonus86)
	
	i = random(30,35)
	AddRepute(i)
	Msg2Player("LÜnh ngé B«n L«i, tiÒm n¨ng cña b¹n t¨ng thªm 2 ®iÓm")
	Msg2Player("<#> NhiÖm vô ®øa bĞ mÊt tİch: cøu ®øa bĞ mÊt tİch, hoµn thµnh nhiÖm vô. Danh väng cña b¹n t¨ng thªm "..i.."<#> ®iÓm.")
	AddNote("NhiÖm vô ®øa bĞ mÊt tİch: t×m ®­îc ®øa bĞ, hoµn thµnh nhiÖm vô. Danh väng cña b¹n t¨ng thªm")
end
