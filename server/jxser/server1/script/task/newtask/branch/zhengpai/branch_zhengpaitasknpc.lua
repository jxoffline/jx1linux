-- ÕıÅÉÖ§ÏßÈÎÎñ½Å±¾
-- by xiaoyang(2005\1\4)

Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\branch\\branch_head.lua")
Include("\\script\\task\\newtask\\branch\\branch_prize.lua")
Include("\\script\\task\\newtask\\branch\\branch_problem.lua")

----------------------------------------------------------------------³ÕÉ®-----------------------------------------------------------------------
function branch_chiseng()
	Uworld1050 = nt_getTask(1050)
	local name = GetName()  
	if ( Uworld1050 == 20) or ( Uworld1050 == 30 ) then
		if ( GetLevel() >= 20 ) and ( GetLevel() <  30 ) then
			nt_setTask(1050,30)
			Describe(DescLink_ChiSeng.."<#>: Ha ha ha! Vui qu¸!  Vui qu¸!<enter>"
			..name.."<#>:......Tªn nµy ch¾c ®Çu ãc cã vÊn ®Ò.<enter>Si T¨ng: A! §Ëu hñ! ThŞt chã...<enter>"
			..name.."<#>:  Hßa Th­îng lµm g× vËy? <enter>A Di §µ PhËt! Xin chµo Thİ chñ.<enter>"
			..name.."<#>:  Ha! Ha!.<enter>Si T¨ng: Ta ®ang tØnh hay mª?<enter>"
			..name.."<#>:  Th«i ®õng gi¶ vê n÷a! GÇn ®©y ë §¹i Lı cã ng­êi bİ mËt phao tin....<enter>BÇn T¨ng lu«n ë Thiªn Long tù niÖm kinh b¸i PhËt, lµm sao biÕt cã tin ®ån nµo.<enter>"
			..name.."<#>:  §¹i hßa th­îng! ¤ng kh«ng thµnh thËt.<enter>BÇn t¨ng 30 n¨m tr­íc ph¸p hiÖu lµ Thµnh thËt Hßa Th­îng.<enter>"
			..name.."<#>:  ThËt kh«ng chŞu næi «ng! Ta chØ muèn hái vÒ Thiªn Hoµng Long Khİ.<enter> Thiªn Khİ g×?<enter>"
			..name.."<#>:  Thiªn Hoµng Long Khİ.<enter> µ! Muèn hái th¨m tin tøc còng ®­îc, nh­ng muèn biÕt tin ph¶i tr¶ c«ng 1 Kú phæ <enter>"
			..name.."<#>:  Kú phæ g×? <enter>Ngoµi Thiªn Long tù cã vµi Tµng Bµo Kh¸ch, nghe nãi bän chóng võa míi c­íp ®­îc 5 quyÓn kú phæ Thiªn Tµn §Şa KhuyÕt, ng­¬i lÊy ®­îc th× h·y quay l¹i t×m ta<enter>"
			..name.."<#>:  §­îc!",
			1,"KÕt thóc ®èi tho¹i/chiseng1")	
		else
			Talk(1,"","Xin lçi! §¼ng cÊp cña b¹n v­ît qu¸ ®¼ng cÊp nhiÖm vô yªu cÇu, kh«ng thÓ tiÕp nhËn n÷a! ThËt ng¹i qu¸! ")
		end
	elseif ( Uworld1050 == 40 ) or ( Uworld1050 == 50 ) and ( GetItemCount(504) >= 5 ) then
		if ( GetLevel() >= 20 ) and ( GetLevel() <  30 ) then
			nt_setTask(1050,50)
			Describe(DescLink_ChiSeng.."<#>:  Lµm xong ch­a vËy?<enter>"
			..name.."<#>:  §©y lµ 5 quyÓn Kú phæ «ng cÇn.<enter>Hay l¾m! BÇn t¨ng sÏ cho Thİ chñ biÕt tung tİch cña Thiªn Hoµng Long Khİ.<enter>"
			..name.."<#>:  Tèt qu¸.<enter> Thiªn Hoµng Long Khİ thËt ra chİnh lµ Thiªn Hoµng Long Khİ.<enter>"
			..name.."<#>:  C¸i g×?<enter> Th× ra lµ mét n«ng d©n trong th«n gi¶ d¹ng Si T¨ng. ThËt ra, thËt ra......Ng­êi cña Thiªn Long tù ®Òu ®· h¹ s¬n hãa duyªn, sÏ sím quay l¹i.<enter>"
			..name.."<#>:  Ng­¬i h·y nhí nÕu biÕt quay ®Çu ta sÏ tha cho.<enter> Ta cø ngåi ë ®©y, ng­¬i cã giái th× cø ®Õn thö ®i!",
			1,"KÕt thóc ®èi tho¹i/chiseng2")
		else
			Talk(1,"","Xin lçi! §¼ng cÊp cña b¹n v­ît qu¸ ®¼ng cÊp nhiÖm vô yªu cÇu, kh«ng thÓ tiÕp nhËn n÷a! ThËt ng¹i qu¸! ")
		end
	elseif ( Uworld1050 == 40 ) or ( Uworld1050 == 50 ) and ( GetItemCount(504) < 5 ) then
		Describe(DescLink_ChiSeng.."<#>:  Ng­¬i ch­a lÊy ®ñ Kú phæ cßn d¸m ®Õn?<enter>",1,"KÕt thóc ®èi tho¹i/no")
	else
		Describe(DescLink_ChiSeng.."<#>:  B¸u vËt trªn ®êi v« sè, b¶o bèi kh¾p n¬i, cã g× quı hay kh«ng quı.ThiÖn tai! ThiÖn tai!",1,"KÕt thóc ®èi tho¹i/no")
	end
end

----------------------------------------------------------------¼ıÍ·----------------------------------------------------------------------
function branch_jiantou()
	Uworld1050 = nt_getTask(1050)
	local name = GetName()  
	if ( Uworld1050 == 80 ) or ( Uworld1050 == 90 ) then
		if ( GetLevel() >= 20 ) and ( GetLevel() <  30 ) then
			nt_setTask(1050,90)
			Describe(name.."<#>:  Xin hái cã ph¶i TiÔn §Çu ®¹i ca kh«ng?.<enter>"
			..DescLink_JianTou.."<#>:  TiÔn §Çu, ng­êi nµy ®· kh«ng cßn trªn ®êi.<enter>"
			..name.."<#>:  Ng¹o V©n T«ng b¶o ta ®Õn.<enter> GÇn ®©y «ng ta kháe kh«ng?<enter>"
			..name.."<#>:  ¤ng ta vÉn kháe, «ng ta b¶o ta ®Õn hái ngµi tin tøc cña Thiªn Hoµng Long Khİ.<enter> Thiªn Hoµng Long Khİ? ViÖc nµy ®· l©u l¾m råi, muèn nãi ra ph¶i b¾t ®Çu tõ chuyÖn Nh¹c t­íng qu©n bŞ s¸t h¹i<enter>"
			..name.."<#>:  T¹i sao Nh¹c t­íng qu©n bŞ h¹i?<enter> TiÔn §Çu: N¨m ®ã Nh¹c t­íng qu©n chèng l¹i giÆc Kim, ®¹i ph¸ ThiÕt Phï §å, giÕt ®­îc Chñ t­íng n­íc Kim lµm an lßng thiªn h¹. Kim CÈu ®­¬ng nhiªn muèn giÕt T­íng qu©n.<enter>"
			..name.."<#>:  Nh­ng ta ch­a tõng nghe qua chuyÖn T­íng qu©n bŞ ¸m s¸t.<enter>ChuyÖn nµy rÊt İt ng­êi biÕt.<enter>"
			..name.."<#>:  VËy T­íng qu©n bŞ thİch s¸t nh­ thÕ nµo?<enter> N¨m ®ã cã lÖnh tiÔn triÖu Nh¹c Phi tõ tuyÒn tuyÕn trë vÒ. Mäi ng­êi ®Òu t­ëng lµ ngµi bŞ ¸m s¸t t¹i Phong Ba ®×nh, kú thùc ®· ®­îc c¸c hiÖp kh¸ch ®­a ®i Èn nÊp <enter>"
			..name.."<#>:  Cøu tho¸t? VËy T­íng qu©n ë ®©u.<enter> TiÔn §Çu: ë Hoa S¬n ph¸i, T­íng qu©n Èn c­ kh«ng l©u ®· bŞ s¸t h¹i.<enter>"
			..name.."<#>:  C¸i g×!<enter> Bé ¸o gi¸p n¨m x­a cña T­íng qu©n thÇn quang chãi s¸ng, mäi ng­êi ®Òu nãi ®ã lµ Thiªn Hoµng Long Khİ. Nh­ng cô thÓ thÕ nµo th× ta kh«ng râ, nh­ng ng­¬i cã thÓ ®i hái mét ng­êi.<enter>"
			..name.."<#>: Lµ ai?<enter> SÇm Hïng! H¾n lµ hé sÜ bªn c¹nh Nh¹c T­íng qu©n hiÖn ®ang ë Ph­îng T­êng <enter>"
			..name.."<#>:  C¸m ¬n «ng.<enter>Ng­¬i ®i ®i! LÇn nµy coi nh­ ta ®· tr¶ ¬n cøu m¹ng cña LiÔu V©n T«ng ngµy x­a.<enter>",
			1,"KÕt thóc ®èi tho¹i/jiantou1")
		else
			Talk(1,"","Xin lçi! §¼ng cÊp cña b¹n v­ît qu¸ ®¼ng cÊp nhiÖm vô yªu cÇu, kh«ng thÓ tiÕp nhËn n÷a! ThËt ng¹i qu¸! ")
		end
	else
		Describe(DescLink_JianTou.."<#>:  Hoa S¬n hiÓm häa.<enter>",1,"KÕt thóc ®èi tho¹i/no")
	end
end

----------------------------------------------------------------á¯ĞÛ---------------------------------------------------------------------------
function branch_cenxiong()
	Uworld1050 = nt_getTask(1050)
	local name = GetName()  
		if ( Uworld1050 == 100 ) or ( Uworld1050 == 110 ) then
			if ( GetLevel() >= 20 ) and ( GetLevel() <  30 ) then
				nt_setTask(1050,110)
				Describe(name.."<#>:  SÇm Hïng ®¹i ca!<enter>"
				..DescLink_CenXiong.."<#>:  VŞ B»ng h÷u nµy, Ta kh«ng quen! Hai tiÕng §¹i ca ta kh«ng d¸m nhËn.<enter>"
				..name.."<#>:  TiÔn §Çu ®¹i ca b¶o ta ®Õn.<enter> TiÔn §Çu? ¤ng ta d¹o nµy kháe kh«ng?<enter>"
				..name.."<#>:  Còng tèt. ¤ng ta sai ta ®Õn t×m huynh.<enter>A! T×m ta cã viÖc g×?<enter>"
				..name.."<#>:  N¨m x­a lóc Nh¹c Phi t­íng qu©n B¾c chinh, ®· tõng mÆc bé gi¸p nµy.<enter>SÇm Hïng: §óng vËy! Phô th©n ta tõng nãi, Nh¹c Gia anh dòng c¸i thÕ, kho¸t lªn m×nh bé ¸o gi¸p ®ã tr«ng nh­ ThÇn tiªn.<enter>"
				..name.."<#>:  Bé ¸o gi¸p ®ã lµ Thiªn Hoµng Long Khİ?<enter>§óng vËy!<enter>"
				..name.."<#>:  VËy b©y giê nã ë ®©u?<enter> MÊt tİch råi. Tõ lóc Nh¹c Gia Gia bŞ thİch s¸t ë Hoa S¬n kh«ng ai biÕt tung tİch cña bé gi¸p nµy.<enter>"
				..name.."<#>:  SÇm ®¹i ca ®· tõng ®iÒu tra qua ch­a?<enter>§¸ng tiÕc vÉn ch­a t×m ra tung tİch cña ThÇn binh, nh­ng ta ®· ph¸t hiÖn s¸t thñ n¨m x­a thİch s¸t Nh¹c Gia!<enter>"
				..name.."<#>:  Ng­êi nµy tªn g×, hiÖn ®ang ë ®©u?<enter> H¾n tªn Phan Nh­ Long ®ang ë ngoµi thµnh Ph­îng T­êng.<enter>",
				1,"KÕt thóc ®èi tho¹i/cenxiong1")
			else
				Talk(1,"","Xin lçi! §¼ng cÊp cña b¹n v­ît qu¸ ®¼ng cÊp nhiÖm vô yªu cÇu, kh«ng thÓ tiÕp nhËn n÷a! ThËt ng¹i qu¸! ")
			end
		else
			Describe(DescLink_CenXiong.."<#>:  PhËn trai v× nghiÖp n­íc! Dï cã vïi th©y n¬i sa tr­êng còng ®¸ng tiÕng 'Anh hïng'",1,"KÕt thóc ®èi tho¹i/no")
		end
end

----------------------------------------------------------------ºØÀ¼Ö¥---------------------------------------------------------------------------
function branch_helanzhi()
	Uworld1051 = nt_getTask(1051)
	local name = GetName()  
	if ( Uworld1051 == 20 ) or ( Uworld1051 == 30 ) then
		if ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) then
			nt_setTask(1051,30)
			Describe(name.."<#>:  Chµo H¹ tû tû.<enter>"
			..DescLink_HeLanZhi.."<#>:  Ng­¬i lµ...?<enter>"
			..name.."<#>:  Mé Dung s­ phô b¶o ta ®Õn, «ng ta hiÖn ë L©m An ®óc ¸o gi¸p, thiÕu Kho¸ng th¹ch thuéc tİnh, tû tõng cã 2 viªn, cho nªn «ng ta b¶o ta ®Õn th¨m c«, nh©n tiÖn xem c« cßn gi÷ B¶o th¹ch kh«ng.<enter>µ! B¶o vËt cña S­ phô ta ta lu«n gi÷ bªn m×nh ChØ cã ®iÒu n¨m x­a khi ta kÕt h«n ®· bŞ thÊt l¹c nã.<enter>"
			..name.."<#>:  ¥, Trïng hîp vËy!.<enter>H¹ Lan Chi: ThÕ nµy vËy, ng­¬i h·y ®Õn Giang T©n th«n gÆp Ng« L·o th¸i®i.<enter>"
			..name.."<#>: Tèt l¾m! <enter> Khoan ®·! Ng­¬i h·y gi÷ lÊy bé trang bŞ nµy! Ngµy sau cã lóc h÷u dông! <enter>",
			1,"KÕt thóc ®èi tho¹i/helanzhi1")
		else
			Talk(1,"","Xin lçi! §¼ng cÊp cña b¹n v­ît qu¸ ®¼ng cÊp nhiÖm vô yªu cÇu, kh«ng thÓ tiÕp nhËn n÷a! ThËt ng¹i qu¸! ")
		end
	else
			Describe(DescLink_HeLanZhi.."<#>:  Thêi trÎ cã nhiÒu m¬ ­íc, giê chØ cÇn Phu qu©n ta kháe m¹nh kh«ng g× quan träng b»ng.<enter>",1,"KÕt thóc ®èi tho¹i/no")	
	end
end

----------------------------------------------------------------ÎâÀÏÌ«Ì«-------------------------------------------------------------------
function branch_wulaotai()
	Uworld1051 = nt_getTask(1051)
	local name = GetName()  
	if ( Uworld1051 == 40 ) or ( Uworld1051 == 50 ) then
		if ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) then
			nt_setTask(1051,50)
			Describe(name.."<#>:  Ng« L·o th¸i.<enter>"
			..DescLink_WuLaoTai.."<#>:……<enter>"
			..name.."<#>:  L·o Th¸i th¸i?<enter>Ng« L·o th¸i:......<enter>"
			..name.."<#>:  L·o Th¸i th¸i m¾c bÖnh l¹, kh«ng nãi chuyÖn ®­îc, hay lµ quay vÒ t×m Ng¹o V©n T«ng tr­íc ®·.<enter>",
			1,"KÕt thóc ®èi tho¹i/wulaotai1")
		else
			Talk(1,"","Xin lçi! §¼ng cÊp cña b¹n v­ît qu¸ ®¼ng cÊp nhiÖm vô yªu cÇu, kh«ng thÓ tiÕp nhËn n÷a! ThËt ng¹i qu¸! ")
		end
	elseif ( Uworld1051 == 150 ) or ( Uworld1051 == 160 ) then
		if ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) then
			nt_setTask(1051,160)
			Describe(DescLink_WuLaoTai.."<#>:……<enter>",
			1,"LÊy d­îc töu ®­a cho Ng« L·o th¸i uèng/wulaotai2")
		else
			Talk(1,"","Xin lçi! §¼ng cÊp cña b¹n v­ît qu¸ ®¼ng cÊp nhiÖm vô yªu cÇu, kh«ng thÓ tiÕp nhËn n÷a! ThËt ng¹i qu¸! ")
		end
	else
			Describe(DescLink_WuLaoTai.."<#>:  L·o th©n ®· ®Õn tuæi nµy, sî r»ng kh«ng thÓ trë l¹i Kinh thµnh.<enter>",1,"KÕt thóc ®èi tho¹i/no")	
	end
end
--------------------------------------------------------------¹¨°¢Å£-------------------------------------------------------------------------
function branch_taokan()
	Uworld1051 = nt_getTask(1051)
	local name = GetName()  
	if ( Uworld1051 == 100 ) or ( Uworld1051 == 110 ) then
		if ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) then
			nt_setTask(1051,110)
			Describe(DescLink_TaoKan.."<#>:  Tøc thËt! §¸m chã sãi nµy ®óng lµ muèn lÊy m¹ng ng­êi! §· h¹i lÊy m¹ng m­êi huynh ®Ö råi.<enter>"
			..name.."<#>:  Ng­¬i cã khã kh¨n g×?<enter>Ng­¬i lµ ai? T×m ta cã viÖc g×? Ta ®ang bËn kh«ng r¶nh tiÕp ng­¬i.<enter>"
			..name.."<#>:  Trong tay ta cã 1 İt x­¬ng sãi, xin «ng gióp ta bµo chÕ d­îc töu.<enter>Kh«ng ph¶i ta kh«ng lµm! ChØ v× d¹o nµy bän ¸c lang trªn nói hoµnh hµnh d÷ qu¸ khiÕn ta kh«ng r¶nh tay <enter>"
			..name.."<#>:  ViÖc nµy ®¬n gi¶n, Ta cã thÓ gióp huynh tiªu diÖt ¸c lang.<enter>Cung A Ng­u: ThËt tèt qu¸!Míi xem qua phong th¸i cña ng­¬i, ta biÕt ng­¬i kh«ng ph¶i lµ ng­êi th­êng. Chê ng­¬i tiªu diÖt ¸c lang ta sÏ bµo chÕ thuèc.<enter>",
			1,"KÕt thóc ®èi tho¹i/taokan1")
		else
			Talk(1,"","Xin lçi! §¼ng cÊp cña b¹n v­ît qu¸ ®¼ng cÊp nhiÖm vô yªu cÇu, kh«ng thÓ tiÕp nhËn n÷a! ThËt ng¹i qu¸! ")
		end
	elseif ( Uworld1051 == 130 ) or ( Uworld1051 == 140 ) then
		if ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) then
			nt_setTask(1051,140)
			Describe(name.."<#>:  Cung ®¹i ca, ta ®· gióp huynh diÖt trõ ¸c lang.<enter>"
			..DescLink_TaoKan.."<#>:  Tèt qu¸, d­îc töu ë ®©y, ng­¬i lÊy ®i! <enter>",
			1,"KÕt thóc ®èi tho¹i/taokan2")
		else
			Talk(1,"","Xin lçi! §¼ng cÊp cña b¹n v­ît qu¸ ®¼ng cÊp nhiÖm vô yªu cÇu, kh«ng thÓ tiÕp nhËn n÷a! ThËt ng¹i qu¸! ")
		end
	else
			Describe(DescLink_TaoKan.."<#>:  Qu©n tö lµ ng­êi biÕt gióp ng­êi kh¸c ®óng lóc mµ kh«ng mµng danh lîi!<enter>",1,"KÕt thóc ®èi tho¹i/no")	
	end
end

----------------------------------------------------------»ì»ì---------------------------------------------------------------------------
function branch_hunhun()
	Uworld1052 = nt_getTask(1052)
	Uworld1053 = nt_getTask(1053)
	Uworld1011 = nt_getTask(1011) --ÕıÅÉÖ§ÏßÉ±¹Ö±äÁ¿
	Uworld1001 = nt_getTask(1001)
	local name = GetName()  
		if ( Uworld1001 >= 210 ) and ( GetLevel() >= 50 ) and ( GetLevel() <  60 ) and (( Uworld1053 == 0 ) or ( Uworld1053 == 10))  then
				nt_setTask(1053,10)
				Describe(DescLink_HunHun.."<#> Ta cho ng­¬i biÕt mét bİ mËt. §· cã ng­êi trong tæ chøc nghe ®­îc chuyÖn Nh¹c Phi bŞ thİch s¸t. Mèi thï gi÷a L©m Uyªn Nhai vµ Nh¹c Phi ai còng biÕt, n¨m ®ã bªn c¹nh Nh¹c Phi kh«ng İt cao thñ b¶o vÖ. Ta còng kh«ng biÕt cã ph¶i ng­êi cña ta giÕt h¾n kh« "
				..name.."<#>:  T¹i sao ng­¬i l¹i nãi víi ta bİ mËt nµy? <enter>NhiÒu lêi! Ng­¬i t­ëng ta muèn sao? GÇn ®©y ng­êi ®ã ®ét nhiªn mÊt lªn l¹c víi ta. Nghe nãi h¾n ®· ®Õn chiÕn tr­êng Tèng Kim. Ta kh«ng tin h¾n chiÕn ®Êu v× n­íc, hay lµ phiÒn ng­¬i ®Õn ChiÕn tr­êng Tèng Kim mét chuyÕn t×m tung tİch ng­êi nµy tiÖn thÓ lÊy 200 ®iÓm tİch lòy<enter>",
				1,"KÕt thóc ®èi tho¹i/hunhun3")
		elseif (( Uworld1053 == 20 ) or ( Uworld1053 == 25 )) and ( Uworld1011 == 20 ) then 
			if ( GetLevel() >= 50 ) and ( GetLevel() <  60 ) then
				nt_setTask(1053,25)
				Describe(DescLink_HunHun.."<#>:  Lµm tèt l¾m, ®iÓm th­ëng ®· lÊy ®ñ.",
				1,"KÕt thóc ®èi tho¹i/hunhun5")
			else
				Talk(1,"","Xin lçi! §¼ng cÊp cña b¹n v­ît qu¸ ®¼ng cÊp nhiÖm vô yªu cÇu, kh«ng thÓ tiÕp nhËn n÷a! ThËt ng¹i qu¸! ")
			end
		elseif ( Uworld1053 == 27 ) or ( Uworld1053 == 30 ) then 
			if ( GetLevel() >= 50 ) and ( GetLevel() <  60 ) then
				nt_setTask(1053,30)
				Describe(DescLink_HunHun.."<#>:  Tr¶ lêi ta vµi vÊn ®Ò liªn quan ®Õn Tèng Kim. S½n sµng ch­a?.<enter>",
				2,"Cã thÓ b¾t ®Çu!/branch_songjinproblem","KÕt thóc ®èi tho¹i/no")
			else
				Talk(1,"","Xin lçi! §¼ng cÊp cña b¹n v­ît qu¸ ®¼ng cÊp nhiÖm vô yªu cÇu, kh«ng thÓ tiÕp nhËn n÷a! ThËt ng¹i qu¸! ")
			end
		elseif ( Uworld1053 == 40 ) or ( Uworld1053 == 50 ) then
			if ( GetLevel() >= 50 ) and ( GetLevel() <  60 ) then
				nt_setTask(1053,50)
				Describe(DescLink_HunHun.."<#>:  Tr¶ lêi ®óng hÕt, kh¸ l¾m. GÇn ®©y, ta ®­îc tin tªn ®ã trèn trong ChiÕn tr­êng Tèng Kim ®Şnh ¸m s¸t chñ t­íng hai n­íc Tèng Kim.<enter>"
				..name.."<#>:  Thİch s¸t chñ t­íng hai n­íc?<enter>Kh«ng sai, chóng ta kh«ng cã Ên t­îng tèt vÒ Tèng triÒu, víi Kim CÈu còng vËy! ChØ cÇn cã tiÒn lµ lµm! Ng­¬i ®Õn ngoµi thµnh L©m An t×m h¾n, y tªn lµ TÒ Tøc Phong, sau ®ã ta vµ ng­¬i cïng hµnh ®éng. ChuyÖn nµy nÕu",
				1,"KÕt thóc ®èi tho¹i/hunhun4")
			else
				Talk(1,"","Xin lçi! §¼ng cÊp cña b¹n v­ît qu¸ ®¼ng cÊp nhiÖm vô yªu cÇu, kh«ng thÓ tiÕp nhËn n÷a! ThËt ng¹i qu¸! ")
			end
		elseif ( Uworld1052 == 40 ) or ( Uworld1052 == 50 ) then
			if ( GetLevel() >= 40 ) and ( GetLevel() <  50 ) then
				nt_setTask(1052,50)
				Describe(name.."<#>:  Chµo «ng, ta lµ "
				..name..".<enter>"
				..DescLink_HunHun.."<#>:  Lµ ng­¬i ­, t¹i sao trÔ nh­ vËy míi ®Õn? Mäi ng­êi ®· vµo vâ tr­êng. Ng­¬i vµo vâ tr­êng ®¸nh mét trËn ®i, ta muèn xem thùc lùc cña ng­¬i.<enter>",
				1,"KÕt thóc ®èi tho¹i/hunhun1")
			else
				Talk(1,"","Xin lçi! §¼ng cÊp cña b¹n v­ît qu¸ ®¼ng cÊp nhiÖm vô yªu cÇu, kh«ng thÓ tiÕp nhËn n÷a! ThËt ng¹i qu¸! ")
			end
		elseif ( Uworld1052 == 60 ) and ( Uworld1011 == 10 ) then
			if ( GetLevel() >= 40 ) and ( GetLevel() <  50 ) then
				Describe(DescLink_HunHun.."<#>:  §¸nh mét trËn pk còng kh«ng xong cßn d¸m ®Õn gÆp ta? Mau ®i ®¸nh th¾ng mét trËn.<enter>",1,"KÕt thóc ®èi tho¹i/no")
			else
				Talk(1,"","Xin lçi! §¼ng cÊp cña b¹n v­ît qu¸ ®¼ng cÊp nhiÖm vô yªu cÇu, kh«ng thÓ tiÕp nhËn n÷a! ThËt ng¹i qu¸! ")
			end
		elseif (( Uworld1052 == 60 ) or ( Uworld1052 == 70 )) and ( Uworld1011 == 20 ) then --ÑïÖİÑİÎä³¡Õ½Ê¤ÁËÒ»³¡
			if ( GetLevel() >= 40 ) and ( GetLevel() <  50 ) then
				nt_setTask(1052,70)
				Describe(DescLink_HunHun.."<#>:  Hay l¾m! Ng­¬i qu¶ nhiªn rÊt giái.<enter>"
				..name.."<#>:  Qu¸ khen!<enter> MÊy n¨m nay ta cø nhøc ®Çu, chuyÖn lµm ¨n ë DiÔn vâ tr­êng vèn rÊt thuËn lîi, tù nhiªn xuÊt hiÖn tªn qu¸i vËt ®¸nh tr¨m trËn tr¨m th¾ng, lµm cho ch¼ng ai d¸m ®Õn khiªu chiÕn. Tªn nµy khiÕn ta ®au ®Çu qu¸.<enter>"
				..name.."<#>:  ı ng­¬i lµ?<enter>Hçn Hçn: ı cña ta ng­¬i hiÓu mµ.<enter>"
				..name.."<#>:  H¾n ë ®©u?<enter> Tªn h¾n lµ Du S­¬ng T©n, tªn nµy Èn n¾p rÊt kü. Ta hiÖn vÉn ch­a ®iÒu tra ra tung tİch h¾n. NÕu ng­¬i cã thÓ tiªu diÖt h¾n coi nh­ ®· lËp ®¹i c«ng cho tæ chøc.<enter>",
				1,"KÕt thóc ®èi tho¹i/hunhun2")
			else
				Talk(1,"","Xin lçi! §¼ng cÊp cña b¹n v­ît qu¸ ®¼ng cÊp nhiÖm vô yªu cÇu, kh«ng thÓ tiÕp nhËn n÷a! ThËt ng¹i qu¸! ")
			end
		elseif ( Uworld1052 == 1000 )  then 
			if ( GetLevel() >= 40 ) and ( GetLevel() <  50 ) then
				Describe(DescLink_HunHun.."<#>:  Huynh ®Ö! Sau nµy chØ hy väng ë ng­¬i th«i.<enter>",
				1,"KÕt thóc ®èi tho¹i/no")
			else
				Talk(1,"","Huynh ®Ö, cè g¾ng nha.")
			end
	else
			Describe(DescLink_HunHun.."<#>:  Sî c¸i g×? Cµng sî cµng bŞ ng­êi ta ¨n hiÕp.<enter>",1,"KÕt thóc ®èi tho¹i/no")	
		end
end



function chiseng1()
	AddOwnExp(5000)
	nt_setTask(1050,40)
	Msg2Player("Si T¨ng b¶o b¹n t×m 5 quyÓn Kú phæ 'Thiªn Tµn §Şa KhuyÕt', Tµng B¶o Kh¸ch hiÖn ®ang gi÷ nã.")
end



function chiseng2()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function jiantou1()
	AddOwnExp(5000)
	nt_setTask(1050,100)
	Msg2Player("TiÔn §Çu b¶o b¹n ®Õn Ph­îng T­êng t×m SÇm Hïng hái th¨m tin tøc.")
end

function cenxiong1()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function helanzhi1()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function wulaotai1()
	AddOwnExp(15000)
	nt_setTask(1051,60)
	Msg2Player("Ng« L·o th¸i h×nh nh­ m¾c bÖnh l¹, b¹n quyÕt ®Şnh t×m Ng¹o V©n T«ng th­¬ng l­îng b­íc tiÕp theo.")
end

function taokan1()
	AddOwnExp(15000)
	nt_setTask(1051,120)
	Msg2Player("§Õn T­¬ng D­¬ng t×m Cung A Ng­u. ¤ng ta ®ang gÆp r¾c rèi v× ¸c lang trªn Phôc Ng­u S¬n, b¹n quyÕt ®Şnh gióp anh ta gi¶i quyÕt khã kh¨n nµy.")
end

function taokan2()
	AddOwnExp(15000)
	nt_setTask(1051,150)
	Msg2Player("Cung A Ng­u ®­a cho b¹n d­îc töu bµo chÕ tõ x­¬ng sãi, b¹n mang ®Õn chç Ng« L·o th¸i")
end

function wulaotai2()
	local name = GetName()  
	Describe(DescLink_WuLaoTai.."<#>:  ¤i......«i,......B¹n trÎ! C¸m ¬n d­îc töu cña ng­¬i. Ta còng kh«ng biÕt nãi g× h¬n.<enter>"
	..name.."<#>:  L·o Th¸i th¸i! N¨m ®ã H¹ Lan Chi khi theo chång cã thÊt l¹c 2 viªn B¶o th¹ch. Bµ thÊy qua ch­a? <enter> ThÊy qua råi. Ta lu«n gióp Lan Chi gi÷ nã, ®¸ng tiÕc nã ch­a bao giê vÒ ®©y, b©y giê ng­¬i ®Õn  rÊt ®óng lóc.<enter>"
	..name.."<#>:  Bµ ®ang gi÷ µ? ThÕ th× tèt qu¸. <enter>Ng« L·o th¸i: CÇm lÊy ®i, tiÓu tö sau nµy h·y b¶o träng.<enter>",
	1,"KÕt thóc ®èi tho¹i/wulaotai3")
end

function wulaotai3()
	AddOwnExp(15000)
	nt_setTask(1051,170)
	Msg2Player("B¹n nhËn ®­îc 1 viªn B¶o th¹ch thuéc tİnh Èn. B¹n cã thÓ quay vÒ gÆp Ng¹o V©n T«ng phôc mÖnh.")
end

function hunhun1()
	Uworld1011 = nt_getTask(1011)
	AddOwnExp(30000)
	nt_setTask(1011,10) --É±¹Ö±äÁ¿ÖÃÎª10£¬
	nt_setTask(1052,60)
	Msg2Player("Hçn Hçn b¶o b¹n ®Õn tû vâ tr­êng ®¸nh th¾ng mét trËn.")
end

function hunhun2()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function hunhun3()
	Uworld1011 = nt_getTask(1011)
	AddOwnExp(60000)
	nt_setTask(1011,10) --ÉèÖÃ±äÁ¿Îª10£¬¼ÇÂ¼²Î¼ÓËÎ½ğµÄ²ÎÊı
	nt_setTask(1053,20)
	Msg2Player("Hçn Hçn b¶o b¹n ®i ChiÕn tr­êng Tèng Kim, ®ång thêi ph¶i ®¹t 200 ®iÓm tİch lòy. Xem ra mét nhiÖm vô khã kh¨n ®ang chê b¹n.")
end

function hunhun4()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function hunhun5()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function no()
end

