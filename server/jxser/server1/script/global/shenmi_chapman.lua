-- ÉñÃØÉÌÈË ¶Ô»°½Å±¾
-- Li_Xin(2004-07-20)

--Include("\\script\\global\\systemconfig.lua") -- ÏµÍ³ÅäÖÃ
IncludeLib("ITEM")
IncludeLib("SETTING")

function writeChapManLog(str)
	WriteLog(date("%H%M%S")..": Tµi kho¶n:"..GetAccount()..", nh©n vËt:"..GetName()..","..str);
end;

function writeChapManGoldLog( str, nPaidGold, nPaidSilver, nPaidCoin, nPaidTicket )
	WriteGoldLog( GetAccount().."("..GetName()..") "..str, -nPaidGold, -nPaidSilver, -nPaidCoin, -nPaidTicket );
end;

function get1()
	str=
	{
		"<#> §©y chİnh lµ ®å phæ vò khİ quı b¸u trong vâ l©m. §å phæ vò khİ dïng ®Ó ®óc luyÖn binh khİ, cã c«ng dông t¨ng ®¼ng cÊp. ng­¬i cã thÓ dïng Thñy Tinh ®Ó trao ®æi, cã nhu cÇu kh«ng?",
		"<#> ChØ xem th«i/no",
		"<#> L¨ng V­¬ng Th­îng §o¹n T¹o Tµn biªn (Th­¬ng) /yes1",
		"<#> HuyÒn Vò Chïy Chi §óc T¹o thuËt (Chïy) /yes2",
		"<#> Long Ng©m KiÕm §o¹n T¹o ®å (KiÕm) /yes3",
		"<#> Gia C¸t C¬ Qu¸t MËt yÕu (Cung) /yes4",
		"<#> LiÔu DiÖp To¸i Phong §ao. Tôy Thó biªn (Phi ®ao) /yes5",
		"<#> HuyÒn NguyÖt ®ao Tö Kinh b¶o lôc (§ao) /yes6",
		"<#> Thiªn C¬ C«n ®å phæ (C«n) /yes7",
		"<#> ¸m Khİ Tæng phæ. QuyÓn 1 (Phİ tiªu) /yes8",
		"<#> Uyªn ¦¬ng ®ao. Khai Quang  biªn (Song ®ao) /yes9"
	};
	Say(str[1],10,str[2],str[3],str[4],str[5],str[6],str[7],str[8],str[9],str[10],str[11])
end;

function get2()
	str=
	{
		"<#> Kú tr©n B¶o vËt cña ta cã thÓ dïng ®Ó chÕ t¹o, kh¶m n¹m, t¨ng vµ gi¶m ®¼ng cÊp trang bŞ. Kh¸ch quan cã muèn xem qua kh«ng?",
		"<#> B¨ng tµm V« Cùc t¬ (T¨ng ®¼ng cÊp) /buy_silk",
		"<#> Nam Minh Chi Tinh (Gi¶m ®¼ng cÊp) /buy_stone",
		"<#> ChØ xem th«i/no",
	};
	Say(str[1],3,str[2],str[3],str[4])
end;

function yes1()
	-- Ô½ÄÏ°æ±¾¼Û¸ñ¸Ä¶¯£º
	--Say("ÉñÃØÉÌÈË£ºÄãÈ·¶¨Òª»»<color=red>ÁêÍõÇ¹¶ÍÔì²ĞÆª<color>Âğ£¿ÁêÍõÇ¹¶ÍÔì²ĞÆªĞèÒª3¿Å<color=red>×ÏË®¾§<color>¡¢<color=red>2¿ÅÂÌË®¾§<color>ºÍ<color=red>1¿ÅÀ¼Ë®¾§<color>½»»»¡£",2,"È·¶¨/sure1","È¡Ïû/no")
	Say("§¹i hiÖp x¸c ®Şnh muèn ®æi <color=red>L¨ng V­¬ng Th­¬ng §o¹n T¹o Tµn Biªn<color> chø? CÇn cã 1 <color=red>Tö Thñy Tinh<color>, <color=red>1 Lôc Thñy Tinh<color> vµ <color=red>1 Lam Thñy Tinh<color> ®Ó ®æi!",2,"X¸c nhËn/sure1","Hñy bá /no")
end;

function sure1()
	if ((GetItemCountEx(238)>=1) and (GetItemCountEx(239)>=1) and (GetItemCountEx(240)>=1)) then 
		Talk(1,"","Ha!Ha! Thñy Tinh ®Ñp qu¸! §©y lµ §å phæ, b¶o ®¶m cã thÓ gióp §¹i hiÖp th¨ng cÊp vò khİ.")
	  	DelItemEx(238)
	  	DelItemEx(239)
	  	--DelItemEx(239)
	  	--DelItemEx(239)
	  	DelItemEx(240)
	  	--DelItemEx(240)
	  	AddEventItem(406)
	  	writeChapManLog("B¹n nhËn ®­îc L¨ng V­¬ng Th­îng §o¹n T¹o Tµn biªn.")
	  	Msg2Player("B¹n nhËn ®­îc L¨ng V­¬ng Th­îng §o¹n T¹o Tµn biªn.")
	else
	  	Talk(1,"","L¨ng V­¬ng Th­¬ng §o¹n T¹o Tµn Biªn cÇn ph¶i 1 Tö Thñy Tinh, 1 Lôc Thñy Tinh vµ 1 Lam Thñy Tinh  ®Ó ®æi. §¹i hiÖp h×nh nh­ ch­a ®ñ Thñy Tinh!")
	end
end;

function yes2()
	Say("§¹i hiÖp x¸c ®Şnh muèn ®æi <color=red>HuyÒn Vò Chïy §óc T¹o ThuËt<color> chø? CÇn cã 1 <color=red>Tö Thñy Tinh<color>, 1 <color=red>Lôc Thñy Tinh<color> vµ 1 <color=red>Lam Thñy Tinh<color> ®Ó ®æi!",2,"X¸c nhËn/sure2","Hñy bá /no")
end;

function sure2()
	if ((GetItemCountEx(238)>=1) and (GetItemCountEx(239)>=1) and (GetItemCountEx(240)>=1)) then 
		Talk(1,"","Ha!Ha! Thñy Tinh ®Ñp qu¸! §©y lµ §å phæ, b¶o ®¶m cã thÓ gióp §¹i hiÖp th¨ng cÊp vò khİ.")
	  	DelItemEx(238)
	  	--DelItemEx(238)
	  	DelItemEx(239)
	  	--DelItemEx(239)
	  	DelItemEx(240)
	  	--DelItemEx(240)
	  	AddEventItem(407)
	  	writeChapManLog("B¹n nhËn ®­îc HuyÒn Vò Chïy Chi §óc T¹o thuËt.")
	  	Msg2Player("B¹n nhËn ®­îc HuyÒn Vò Chïy Chi §óc T¹o thuËt.")
	else
	  	Talk(1,"","HuyÒn Vò Chïy §óc T¹o ThuËt cÇn cã 1 Tö Tñy Tinh, 1 Lôc Thñy Tinh vµ 1 Lam Thñy Tinh ®Ó ®æi.§¹i hiÖp h×nh nh­ ch­a ®ñ Thñy Tinh!")
	end
end;

function yes3()
	Say("§¹i hiÖp x¸c ®Şnh muèn ®æi <color=red>Long Ng©m KiÕm §o¹n T¹o §å<color> chø? CÇn 1 <color=red>Tö Thñy Tinh<color>, 1 <color=red>Lôc Thñy Tinh<color> vµ 1 <color=red>Lam Thñy Tinh<color> ®Ó ®æi!",2,"X¸c nhËn/sure3","Hñy bá /no")
end;

function sure3()
	if ((GetItemCountEx(238)>=1) and (GetItemCountEx(239)>=1) and (GetItemCountEx(240)>=1)) then 
		Talk(1,"","Ha!Ha! Thñy Tinh ®Ñp qu¸! §©y lµ §å phæ, b¶o ®¶m cã thÓ gióp §¹i hiÖp th¨ng cÊp vò khİ.")
	  	DelItemEx(238)
	  	--DelItemEx(238)
	  	--DelItemEx(238)
	  	DelItemEx(239)
	  	DelItemEx(240)
	  	--DelItemEx(240)
	  	AddEventItem(408)
	  	writeChapManLog("B¹n nhËn ®­îc Long Ng©m KiÕm §o¹n T¹o ®å.")
	  	Msg2Player("B¹n nhËn ®­îc Long Ng©m KiÕm §o¹n T¹o ®å.")
	else
	  	Talk(1,"","Long Ng©m KiÕm §o¹n T¹o §å cÇn 1 Tö Tñy Tinh, 1 Lôc Thñy Tinh vµ 1 Lam Thñy Tinh ®Ó ®æi. §¹i hiÖp h×nh nh­ ch­a ®ñ Thñy Tinh!")
	end
end;

function yes4()
	Say("§¹i hiÖp x¸c ®Şnh muèn ®æi <color=red>Gia C¸t C¬ Qu¸t MËt YÕu<color> chø? CÇn 1 <color=red>Tö Thñy Tinh<color>, 1 <color=red>Lôc Thñy Tinh<color> vµ 1 <color=red>Lam Thñy Tinh<color> ®Ó ®æi!",2,"X¸c nhËn/sure4","Hñy bá /no")
end;

function sure4()
	if ((GetItemCountEx(238)>=1) and (GetItemCountEx(239)>=1) and (GetItemCountEx(240)>=1)) then 
		Talk(1,"","Ha!Ha! Thñy Tinh ®Ñp qu¸! §©y lµ §å phæ, b¶o ®¶m cã thÓ gióp §¹i hiÖp th¨ng cÊp vò khİ.")
	  	DelItemEx(238)
	  	DelItemEx(239)
	  	--DelItemEx(239)
	  	DelItemEx(240)
	  	--DelItemEx(240)
	  	AddEventItem(409)
	  	writeChapManLog("B¹n nhËn ®­îc Gia C¸t C¬ Qu¸t MËt yÕu.")
	  	Msg2Player("B¹n nhËn ®­îc Gia C¸t C¬ Qu¸t MËt yÕu.")
	else
	  	Talk(1,"","Gia C¸t C¬ Qu¸t MËt YÕu cÇn cã 1 Tö Tñy Tinh, 1 Lôc Thñy Tinh vµ 1 Lam Thñy Tinh ®Ó ®æi. §¹i hiÖp h×nh nh­ ch­a ®ñ Thñy Tinh!")
	end
end;

function yes5()
	Say("§¹i hiÖp x¸c ®Şnh muèn ®æi <color=red>LiÔu DiÖp To¸i Phong §ao. Tôy Thó Biªn<color> chø? CÇn 1 <color=red>Tö Thñy Tinh<color>, 1 <color=red>Lôc Thñy Tinh<color> vµ 1 <color=red>Lam Thñy Tinh<color> ®Ó ®æi!",2,"X¸c nhËn/sure5","Hñy bá /no")
end;

function sure5()
	if ((GetItemCountEx(238)>=1) and (GetItemCountEx(239)>=1) and (GetItemCountEx(240)>=1)) then 
		Talk(1,"","Ha!Ha! Thñy Tinh ®Ñp qu¸! §©y lµ §å phæ, b¶o ®¶m cã thÓ gióp §¹i hiÖp th¨ng cÊp vò khİ.")
	  	DelItemEx(238)
	  	--DelItemEx(238)
	  	DelItemEx(239)
	  	DelItemEx(240)
	  	AddEventItem(410)
	  	writeChapManLog("B¹n nhËn ®­îc LiÔu DiÖp To¸i Phong §ao. Tôy Thó biªn.")
	  	Msg2Player("B¹n nhËn ®­îc LiÔu DiÖp To¸i Phong §ao. Tôy Thó biªn.")
	else
	  	Talk(1,"","LiÔu DiÖp To¸i Phong §ao. Tôy Thó Biªn cÇn 1 Tö Tñy Tinh, 1 Lôc Thñy Tinh vµ 1 Lam Thñy Tinh ®Ó ®æi. §¹i hiÖp h×nh nh­ ch­a ®ñ Thñy Tinh!")
	end
end;

function yes6()
	Say("§¹i hiÖp x¸c ®Şnh muèn ®æi <color=red>HuyÒn NguyÖt §ao Tö Kinh B¶o Lôc<color> chø? CÇn cã 1 <color=red>Tö Thñy Tinh<color>, 1 <color=red>Lôc Thñy Tinh<color> vµ 1 <color=red>Lam Thñy Tinh<color> ®Ó ®æi!",2,"X¸c nhËn/sure6","Hñy bá /no")
end;

function sure6()
	if ((GetItemCountEx(238)>=1) and (GetItemCountEx(239)>=1) and (GetItemCountEx(240)>=1)) then 
		Talk(1,"","Ha!Ha! Thñy Tinh ®Ñp qu¸! §©y lµ §å phæ, b¶o ®¶m cã thÓ gióp §¹i hiÖp th¨ng cÊp vò khİ.")
	  	DelItemEx(238)
	  	--DelItemEx(238)
	  	DelItemEx(239)
	  	--DelItemEx(239)
	  	DelItemEx(240)
	  	AddEventItem(411)
	  	writeChapManLog("B¹n nhËn ®­îc HuyÒn NguyÖt ®ao Tö Kinh b¶o lôc.")
	  	Msg2Player("B¹n nhËn ®­îc HuyÒn NguyÖt ®ao Tö Kinh b¶o lôc.")
	else
	  	Talk(1,"","HuyÒn NguyÖt §ao Tö Kinh B¶o Lôc cÇn cã 1 Tö Tñy Tinh, 1 Lôc Thñy Tinh vµ 1 Lam Thñy Tinh ®Ó ®æi. §¹i hiÖp h×nh nh­ ch­a ®ñ Thñy Tinh!")
	end
end;

function yes7()
	Say("§¹i hiÖp x¸c ®Şnh muèn ®æi <color=red>Thiªn C¬ C«n §å Phæ<color> chø? CÇn 1 <color=red>Tö Thñy Tinh<color>, 1 <color=red>Lôc Thñy Tinh<color> vµ 1 <color=red>Lam Thñy Tinh<color> ®Ó ®æi!",2,"X¸c nhËn/sure7","Hñy bá /no")
end;

function sure7()
	if ((GetItemCountEx(238)>=1) and (GetItemCountEx(239)>=1) and (GetItemCountEx(240)>=1)) then 
		Talk(1,"","Ha!Ha! Thñy Tinh ®Ñp qu¸! §©y lµ §å phæ, b¶o ®¶m cã thÓ gióp §¹i hiÖp th¨ng cÊp vò khİ.")
	  	DelItemEx(238)
	  	DelItemEx(239)
	  	DelItemEx(240)
	  	AddEventItem(412)
	  	writeChapManLog("B¹n nhËn ®­îc Thiªn C¬ C«n ®å phæ.")
	  	Msg2Player("B¹n nhËn ®­îc Thiªn C¬ C«n ®å phæ.")
	else
	  	Talk(1,"","Thiªn C¬ C«n §å Phæ cÇn 1 Tö Tñy Tinh, 1 Lôc Thñy Tinh vµ 1 Lam Thñy Tinh ®Ó ®æi. §¹i hiÖp h×nh nh­ ch­a ®ñ Thñy Tinh!")
	end
end;

function yes8()
	Say("§¹i hiÖp x¸c ®Şnh muèn ®æi <color=red>¸m Khİ Tæng Phæ.QuyÓn 1<color> chø? CÇn cã 2 <color=red>Tö Thñy Tinh<color> ®Ó ®æi!",2,"X¸c nhËn/sure8","Hñy bá /no")
end;

function sure8()
	if ((GetItemCountEx(239)>=2)) then 
		Talk(1,"","Ha!Ha! Thñy Tinh ®Ñp qu¸! §©y lµ §å phæ, b¶o ®¶m cã thÓ gióp §¹i hiÖp th¨ng cÊp vò khİ.")
	  	DelItemEx(239)
	  	DelItemEx(239)
	  	AddEventItem(413)
	  	writeChapManLog("B¹n nhËn ®­îc ¸m Khİ Tæng phæ. QuyÓn 1.")
	  	Msg2Player("B¹n nhËn ®­îc ¸m Khİ Tæng phæ. QuyÓn 1.")
	else
	  	Talk(1,"","¸m Khİ Tæng Phæ.QuyÓn 1 cÇn cã 2 Tö Thñy Tinh ®Ó ®æi. §¹i hiÖp h×nh nh­ ch­a ®ñ Thñy Tinh!")
	end
end;

function yes9()
	Say("§¹i hiÖp x¸c ®Şnh muèn ®æi <color=red>Uyªn ¦¬ng §ao. Khai Quang Biªn<color> chø?Uyªn ¦¬ng §ao. CÇn 1 <color=red>Tö Thñy Tinh<color> ®Ó ®æi!",2,"X¸c nhËn/sure9","Hñy bá /no")
end;

function sure9()
	if ((GetItemCountEx(239)>=1)) then 
		Talk(1,"","Ha!Ha! Thñy Tinh ®Ñp qu¸! §©y lµ §å phæ, b¶o ®¶m cã thÓ gióp §¹i hiÖp th¨ng cÊp vò khİ.")
	  	DelItemEx(239)
	  	AddEventItem(414)
	  	writeChapManLog("B¹n nhËn ®­îc Uyªn ¦¬ng ®ao. Khai Quang  biªn.")
	  	Msg2Player("B¹n nhËn ®­îc Uyªn ¦¬ng ®ao. Khai Quang  biªn.")
	else
	  	Talk(1,"","Uyªn ¦¬ng §ao. Khai Quang Biªn cÇn 1 Tö Thñy Tinh ®Ó ®æi. §¹i hiÖp h×nh nh­ ch­a ®ñ Thñy Tinh!")
	end
end;

function buy_silk()
	str=
	{
		"<#> Kh¸ch quan x¸c ®Şnh mua <color=red>B¨ng Tµm V« Cùc T¬<color> chø? <color=red>40 TiÒn §ång<color> ®æi ®­îc <color=red>1 B¨ng Tµm V« Cùc T¬<color>.",
		"<#> Sö dông/sure10",
		"<#> Hñy bá /no",
	};
	Say(str[1],2,str[2],str[3])
end;

function sure10()
	if (CalcEquiproomItemCount(4, 417, 1, 1)>=40) then 
		Talk(1,"","Ha! Ha! §· nhËn ®­îc 40 TiÒn §ång. §©y lµ <color=red>B¨ng Tµm V« Cùc T¬<color>. §¹i hiÖp xem! §¶m b¶o cã thÓ th¨ng cÊp y phôc, kh«i m·o!")
	  	ConsumeEquiproomItem(40, 4, 417, 1, 1)
	  	AddEventItem(415)
	  	UseSilver(1, 2, 2); -- ½ğÔª±¦¶Ò»»ÎªÍ­Ç®µÄÏûºÄÍ³¼Æ(Ö±½ÓÏûºÄµÄÔª±¦ÒøÆ±£¬ÓëÍ­Ç®¶Ò»»µÈÍ¬´¦Àí)
	  	SaveNow(); -- Á¢¼´´æÅÌ
	  	-- writeChapManLog("ÄãµÃµ½±ù²ÏÎŞ¼«Ë¿¡£")
	  	writeChapManGoldLog("Dïng 40 tiÒn ®ång ®æi ®­îc B¨ng Tµm V« Cùc T¬", 1, 0, 0, 0);
	  	Msg2Player("B¹n nhËn ®­îc B¨ng Tµm V« Cùc T¬.")
	else
	  	Talk(1,"","B¨ng Tµm V« Cùc T¬ ph¶i ®æi b»ng 40 TiÒn ®ång, §¹i hiÖp d­êng nh­ ch­a ®ñ TiÒn ®ång!")
	end
end;

function buy_stone()
	str=
	{
		"<#> Kh¸ch quan x¸c ®Şnh mua <color=red>Nam Minh Chi Tinh<color> chø? <color=red>40 TiÒn ®ång<color> ®æi ®­îc <color=red>1 Nam Minh Chi Tinh<color>.",
		"<#> Sö dông/sure11",
		"<#> Hñy bá /no",
	};
	Say(str[1],2,str[2],str[3])
end;

function sure11()
	if (CalcEquiproomItemCount(4, 417, 1, 1)>=40) then 
		Talk(1,"","Ha! Ha! §· nhËn ®­îc 40 TiÒn §ång. §©y lµ <color=red>Nam Minh Chi Tinh<color>. §¹i hiÖp xem! §¶m b¶o cã thÓ gi¶m cÊp y phôc, kh«i m·o!")
	  	ConsumeEquiproomItem(40, 4, 417, 1, 1)
	  	AddEventItem(416)
		UseSilver(1, 2, 2); -- ½ğÔª±¦¶Ò»»ÎªÍ­Ç®µÄÏûºÄÍ³¼Æ(Ö±½ÓÏûºÄµÄÔª±¦ÒøÆ±£¬ÓëÍ­Ç®¶Ò»»µÈÍ¬´¦Àí)
		SaveNow(); -- Á¢¼´´æÅÌ
		
	  	-- writeChapManLog("ÄãµÃµ½ÄÏÃ÷Ö®¾«¡£")
	  	writeChapManGoldLog("Dïng 40 TiÒn ®ång ®æi ®­îc Nam Minh Chi Tinh", 1, 0, 0, 0);
	  	Msg2Player("B¹n nhËn ®­îc Nam Minh Chi Tinh.")
	else
	  	Talk(1,"","Nam Minh Chi Tinh ph¶i ®æi b»ng 40 TiÒn ®ång, §¹i hiÖp d­êng nh­ ch­a ®ñ TiÒn ®ång!")
	end
end;


function deal_brokenequip()
	if (ST_CheckLockState() == 1) then
		Say("Muèn söa <color=red><trang bŞ tæn h¹i><color>, cÇn ph¶i më mËt m· r­¬ng ra. R­¬ng cña b¹n trong tr¹ng th¸i ®ang ®­îc<color=red> khãa l¹i<color>! CÇn ph¶i më khãa tr­íc!", 0)
		return
	end
	Say("B¹n cã <color=red><trang bŞ tæn h¹i><color>kh«ng? Muèn söa nh­ thÕ nµo?", 2, "Ta muèn sö dông TiÒn ®ång ®Ó kh«i phôc l¹i/restore_brokenequip", "ta kh«ng cÇn ®©u! H·y gi÷ l¹i ®i!/throw_brokenequip")	
end

function check_brokenequip(nCount, szDealFunc)
	if (nCount <= 0) then
		return 0
	end

	if (nCount > 1) then
		Say("Mçi lÇn chØ söa ®­îc mét <color=red><trang bŞ tæn h¹i><color> th«i!", 2, "µ! Th× ra ®Æt nhÇm ®Ó ta thö l¹i./"..szDealFunc, "§Ó ta kiÓm tra xem sao/no")
		return 0
	end
	
	local nItemIdx = GetGiveItemUnit(1);
	itemgenre, detailtype, parttype = GetItemProp(nItemIdx)
	if (itemgenre ~= 7) then -- ²»ÊÇËğ»µµÄ×°±¸
		Say("Nh÷ng thø b¹n ®Æt vµo kh«ng ph¶i <color=red><trang bŞ tæn h¹i><color>, xin kiÓm tra kü l¹i.", 2, "µ! Th× ra ®Æt nhÇm ®Ó ta thö l¹i./"..szDealFunc, "§Ó ta kiÓm tra xem sao/no")
		return	0	
	end
	
	return nItemIdx
end

------------------------------------
-- ¡±Ëğ»µµÄ×°±¸¡°¶ªÆú
function throw_brokenequip()
	GiveItemUI( "<trang bŞ tæn h¹i>giao diÖn thu håi", "Mêi b¹n ®Æt <trang bŞ tæn h¹i> cÇn thu håi vµo « bªn d­íi.", "on_throw_be", "no" );
end

function on_throw_be(nCount)
	local nItemIdx = check_brokenequip(nCount, "throw_brokenequip")
	if (nItemIdx == 0) then
		return
	end
	
	local szItemName = GetItemName(nItemIdx)
	Say("<color=red><trang bŞ tæn h¹i>"..szItemName.."<color> mét khi thu håi, sÏ biÕn mÊt, ng­¬i x¸c ®Şnh muèn thu håi kh«ng?", 2, "ta x¸c ®Şnh kh«ng cÇn n÷a, h·y thu håi ®i!/#throw_be_sure("..nItemIdx..")", "§Ó ta suy nghÜ l¹i/no")
end

function throw_be_sure(nItemIdx)
	local szItemName = GetItemName(nItemIdx)
	RemoveItemByIndex(nItemIdx)
	Msg2Player("<trang bŞ tæn h¹i>"..szItemName.." §· bŞ thu håi");
	writeChapManLog("[Remove]: RestoreBrokenEquip Remove: "..szItemName);
end
------------------------------------

------------------------------------
-- ¡±Ëğ»µµÄ×°±¸¡°»Ö¸´
function restore_brokenequip()
	GiveItemUI( "<trang bŞ tæn h¹i> giao diÖn phôc håi", "Xin mêi bá <trang bŞ ®· h­ háng> vµo « bªn d­íi. Phİ cÇn söa (xu): trang bŞ phæ th«ng cÇn 1 xu, tİm cÇn 2 xu, hoµng kim cÇn 5 xu, b¹ch kim cÇn 6 xu (söa b¹ch kim +6 trë lªn cßn cÇn thªm thiÕt huyÕt ®¬n). Chó ı: tr­íc khi tiÕn hµnh söa trang bŞ, h·y kiÓm tra hµnh trang cßn ®ñ « trèng.", "on_restore_be", "no", 1);	
end

function on_restore_be(nCount)
	local nItemIdx = check_brokenequip(nCount, "restore_brokenequip")
	if (nItemIdx == 0) then
		return
	end
	
	local szItemName = GetItemName(nItemIdx)
	local nQuality = GetItemQuality(nItemIdx)
	local nCoinCount = GetCashCoin();
	local nNeedCoin = 0;

	if (nQuality == 0) then
		nNeedCoin = 1;
	elseif (nQuality == 1) then -- »Æ½ğ×°±¸
		nNeedCoin = 5;
	elseif (nQuality == 2) then -- ×ÏÉ«×°±¸
		nNeedCoin = 2;
	elseif (nQuality == 4) then -- °×½ğ×°±¸
		nNeedCoin = 10;
	end
	
	if (nNeedCoin <= 0) then
		Say("§©y lµ trang bŞ g× vËy, ta kh«ng nhËn ra ®­îc? H·y liªn hÖ víi ng­êi cã tr¸ch nhiÖm.", 1, "Uhm/no")
		writeChapManLog("[Error]: RestoreBrokenEquip Fail. ItemQuality:"..nQuality);
		return
	end
	
	if (nCoinCount < nNeedCoin) then
		Say("Muèn phôc håi <color=red><trang bŞ tæn h¹i>"..szItemName.."<color>, cÇn"..nNeedCoin.."TiÒn ®ång. TiÒn ®ång b¹n mang theo kh«ng ®ñ, t×m vµi c¸i n÷a ®i!", 1, "HiÓu råi, ®Ó ta ®i lÊy TiÒn ®ång ®·!/no")
		return
	end
	
	if (nQuality == 4 and GetPlatinaLevel(nItemIdx) >= 6) then
		if (CalcEquiproomItemCount(6,1,2163,-1) < 1) then
			Say("ThÇn bİ th­¬ng nh©n: Hµnh trang kh«ng cã thiÕt huyÕt ®¬n, kh«ng thÓ söa trang bŞ.", 0)
			return
		end
		
		if (ConsumeItem(3, 1, 6, 1, 2163,-1) ~= 1) then
			Msg2Player("<trang bŞ tæn h¹i>"..szItemName.." phôc håi thÊt b¹i, xin liªn hÖ ng­êi cã tr¸ch nhiÖm");
			Say("<trang bŞ tæn h¹i>"..szItemName.." phôc håi thÊt b¹i, xin liªn hÖ ng­êi cã tr¸ch nhiÖm.", 1, "§­îc!/no")
			writeChapManGoldLog("[Error]: RestoreBrokenEquip Fail: thiÕu thiÕt huyÕt ®¬n"..szItemName, 0, 0, nNeedCoin, 0);
			return
		end
	end
	
	if (PayCoin(nNeedCoin) == 1) then
		if (ITEM_BrokenEquip2Normal(nItemIdx) == 1) then
			SetCurDurability(nItemIdx, GetMaxDurability(nItemIdx)) -- ÄÍ¾Ã¶È»Ö¸´Îª×î´óÄÍ¾Ã¶È
			Msg2Player("Tiªu hao"..nNeedCoin.."TiÒn ®ång, <trang bŞ tæn h¹i>"..szItemName.." phôc håi thµnh c«ng, xin kiÓm tra hµnh trang");
			writeChapManGoldLog("[Succeed]: RestoreBrokenEquip Ok: "..szItemName, 0, 0, nNeedCoin, 0)
			-- Fix chøc n¨ng söa ®å - Created by AnhHH - 20110704
			KickOutSelf()
		else
			Msg2Player("<trang bŞ tæn h¹i>"..szItemName.." phôc håi thÊt b¹i, xin liªn hÖ ng­êi cã tr¸ch nhiÖm");
			Say("<trang bŞ tæn h¹i>"..szItemName.." phôc håi thÊt b¹i, xin liªn hÖ ng­êi cã tr¸ch nhiÖm.", 1, "§­îc!/no")
			writeChapManGoldLog("[Error]: RestoreBrokenEquip Fail: "..szItemName, 0, 0, nNeedCoin, 0)
		end
	end
end
------------------------------------

function no()
end
