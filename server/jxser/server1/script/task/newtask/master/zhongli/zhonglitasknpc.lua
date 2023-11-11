-------------------------------------------------------------------------
-- FileName		:	zhonglitasknpc.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-28 14:42:00
-- Desc			:	
-------------------------------------------------------------------------

Include("\\script\\task\\newtask\\master\\nexttask.lua")
Include("\\script\\task\\newtask\\master\\master_head.lua")
Include("\\script\\task\\newtask\\master\\newtaskprize.lua")

-----------------------------------¸µÄÏ±ù¶Ô»°--------------------------------
function funanbing()
	Uworld1002 = nt_getTask(1002)  --ÖĞÁ¢
	local name = GetName()  
	if ( Uworld1002 == 10 ) or ( Uworld1002 == 20 )then 
		nt_setTask(1002,20)
		Describe(name.."<#>: ¤ng lµ "..DescLink_FuNanBin.."?<enter> Kh«ng sai.<enter>"
				..name.."<#>: Ngò Gia ph¸i ta ®Õn, ë ®©y cã th­ cã bót tİch cña «ng ta. <enter> Ng­¬i ®· tõng giÕt ng­êi ch­a? <enter>"
				..name.."<#>:......Ch­a tõng.<enter> ThÕ ng­¬i dùa vµo c¸i g× mµ vµo L©m Uyªn Nhai. Th­ tiÕn cö cña Ngò Ca ch¾c kh«ng ®ñ. <enter>"
				..name.."<#>: Nãi ®iÒu kiÖn cña «ng xem. <enter> GiÕt ng­êi! GiÕt mét ng­êi khã giÕt. <enter>"
				..name.."<#>: Lµ ai?<enter> Ninh T­íng Qu©n.<enter>"
				..name.."<#>: Ninh T­íng Qu©n lµ ai? <enter> §¹i t­íng Nam Tèng, th«ng ®Şch ph¶n quèc, téi kh«ng thÓ tha. <enter>"
				..name.."<#>: §¸ng chÕt! <enter> H¾n gÇn ®©y du ngo¹n ë La Tiªu S¬n, kh«ng biÕt bao giê vÒ Doanh tr¹i. §îi ®Õn h¾n vÒ trong qu©n doanh th× rÊt khã kh¨n. Ng­¬i chØ cã mét c¬ héi duy nhÊt nµy th«i. <enter>"
				..name.."<#>: §­îc.<enter>",1,"KÕt thóc ®èi tho¹i/middlefinish1")
	elseif ( Uworld1002 == 40 ) or ( Uworld1002 == 50 ) then
		nt_setTask(1002,50)
		Describe(name.."<#>: H¾n chÕt råi. <enter>"..DescLink_FuNanBin.."<#>: Ta biÕt råi, ta ®· xem th­êng ng­¬i. "
				..name.."<#>. <enter>"..name.."<#>: Kh«ng sao. <enter> Sau nµy cã viÖc ta sÏ t×m ng­¬i. Ng­¬i h·y ®i L©m An t×m LiÔu Nam V©n, y sÏ giao nhiÖm vô cho ng­¬i. <enter>"
				..name.."<#>: ta biÕt råi. <enter>",1,"KÕt thóc ®èi tho¹i/middlefinish2")
	elseif (( Uworld1002 == 60 ) or ( Uworld1002 == 70 )) and ( GetLevel() >= 30 ) then
		Talk(1,"middletask","Cè g¾ng lªn")
	elseif ( Uworld1002 == 90 ) or ( Uworld1002 == 100 ) then
		nt_setTask(1002,100)
		Describe(name.."<#>: H¾n chÕt råi. <enter>"..DescLink_FuNanBin.."<#>: Ta ®· giÕt ®­îc L­ ThiÖn T­îng. <enter>"
				..name.."<#>: H¾n kh«ng nh­ ng­¬i, cho nªn h¾n chÕt. <enter> §­îc, ®©y lµ phÇn th­ëng cña ng­¬i, cÇm ®i. <enter>"
				..name.."<#>: C¸m ¬n.<enter> Ta ®· thÊy râ n¨ng lùc. S¬n tr¹i cã mét kÕ ho¹ch lín, ta hy väng ng­¬i tham gia. <enter>"
				..name.."<#>:  lµ kÕ ho¹ch g×? <enter> HiÖn vÉn ®ang thu xÕp, ®Õn lóc ta sÏ b¸o cho ng­¬i. <enter>"
				..name.."<#>: Ta chØ hy väng ng­¬i kh«ng g¹t ta. <enter> Cã tin g× ta sÏ b¸o cho ng­¬i. <enter>"
				..name.."<#>: §­îc.<enter>",1,"KÕt thóc ®èi tho¹i/middlefinish3") 
	elseif (( Uworld1002 == 110 ) or ( Uworld1002 == 120 )) and ( GetLevel() >= 40 ) then
		Talk(1,"middletask","Cè g¾ng lªn")
	elseif (( Uworld1002 == 180 ) or ( Uworld1002 == 190 )) and ( GetLevel() >= 50 ) then
		Talk(1,"middletask","Cè g¾ng lªn")
	elseif ( Uworld1002 == 180 ) then
		Talk(1,"no","Lµm tèt l¾m, giê h·y tiÕp tôc luyÖn c«ng, sau nµy sÏ t×m ng­¬i.")
	elseif ( Uworld1002 == 220 ) or ( Uworld1002 == 230 ) then
		nt_setTask(1002,230)
		Describe(DescLink_FuNanBin.."<#>: Thµnh c«ng råi?  Ta còng biÕt ng­¬i sÏ thµnh c«ng.",1,"KÕt thóc ®èi tho¹i/middlefinish7")
	elseif (( Uworld1002 == 240 ) or ( Uworld1002 == 250 )) and ( GetLevel() >= 60 ) then
		Talk(1,"middletask","Cè g¾ng lªn")
	elseif ( Uworld1002 == 290 ) or ( Uworld1002 == 300 ) then
		nt_setTask(1002,300)
		Describe(DescLink_FuNanBin.."<#>: ThÕ nµo? <enter>"
			..name.."<#>: Mäi thø ë ®©y. <enter> Tèt qu¸! Ta còng biÕt ng­¬i nhÊt ®Şnh sÏ thµnh c«ng. <enter>"
			..name.."<#>:......Long Khİ cã ®ñ, cã thÓ thay ®æi vËn mÖnh Thiªn h¹ sao? <enter> T¹i sao l¹i hái vËy? <enter>"
			..name.."<#>: Ta......Lßng ta cã chót nghi vÊn. <enter> Ta còng kh«ng biÕt. Ta chØ nghe qua 'ThËp Long Tô Thñ, Thiªn H¹ Khëi §Şnh, §o¹n Kú Chóy Cèt, T©n Chñ XuÊt HiÖn'. <enter> §­îc! Trong thêi gian nµy cã thÓ ta sÏ kh«ng t×m ng­¬i. Hoa S¬n ph¸i ®ang cã mét sè vÊn ®Ò cÇn ng­êi gióp ®ì, ng­¬i h·y ®Õn ®ã ®i. Vµ nhí quay vÒ t×m Long Ngò lÜnh th­ëng. <enter>",1,"KÕt thóc ®èi tho¹i/middlefinish9")
	else
		Describe(DescLink_FuNanBin.."<#>: Giang hå hiÓm ¸c, m­êi ba huynh ®Ö giê chØ cßn m×nh ta.",1,"KÕt thóc ®èi tho¹i/no")
	end
end

------------------------------------ÛªÇïË®¶Ô»°----------------------------------
function liqiushui()
	Uworld1002 = nt_getTask(1002)
	local name = GetName()  
	if ( Uworld1002 == 130 ) or ( Uworld1002 == 140 ) then
		nt_setTask(1002,140)
		Describe(DescLink_LiQiuShui.."<#>: Ng­¬i lµ ai? §Õn Thóy Yªn m«n víi môc ®İch g×? <enter>"
			..name.."<#>: Ta lµ ng­êi trong héi, Nam B¨ng b¶o ta ®Õn t×m c«. <enter> Hõ! Ta ®· nãi víi hä, kh«ng nªn t×m nh÷ng kÎ v« dông. <enter>"
			..name.."<#>: Ta vèn còng ch¼ng thİch ®ång hµnh víi c«! <enter> A! Kh«ng ngê ng­¬i còng cã tİnh c¸ch. <enter>"
			..name.."<#>: Ta sÏ cho c« thÊy b¶n lÜnh cña ta! <enter> Nãi hay l¾m! KhÈu khİ còng kh«ng tÖ. KiÕm m«n cã Tõ Tù Lùc ®ang gi÷ 1 b¶o vËt. §Õn ®ã lÊy nã vÒ cho ta. <enter>"
			..name.."<#>: Lµ c¸i g×? <enter> 1 bé ¸o gi¸p--B¹ch Long Tøc. <enter>"
			..name.."<#>: ¤ng ta ë ®©u. <enter> Kinh Hoµng ®éng. <enter>",1,"KÕt thóc ®èi tho¹i/middlefinish4")
	elseif ( Uworld1002 == 160 ) or ( Uworld1002 == 170 ) then 
		nt_setTask(1002,170)
		Describe(DescLink_LiQiuShui.."<#>: B¹ch Long Tøc lµ b¶o khİ trong truyÒn thuyÕt. Hay qu¸! <enter>"
			..name.."<#>: B¶o Khİ? Ch¼ng lÏ ®©y lµ Thiªn Hoµng Long Khİ. <enter> Ng­¬i biÕt Thiªn Hoµng Long Khİ? <enter>"
			..name.."<#>: Ta nghe thî rÌn nh¾c ®Õn. <enter> Thî rÌn? Kh«ng ngê trªn ®êi nµy ng­êi biÕt chuyÖn nµy còng kh«ng İt. B»ng h÷u, ta ®· xem th­êng ng­¬i. <enter>"
			..name.."<#>: §Òu v× L©m Uyªn Nhai mµ th«i! VÒ Long Khİ, c« biÕt ®­îc bao nhiªu? <enter> Thiªn Hoµng Long Khİ víi bİ mËt cña tæ chøc cã liªn quan, ta chØ cã thÓ nãi víi ng­¬i bÊy nhiªu. <enter> C¸i nµy lµ cña ng­¬i, cÇm lÊy ®i. <enter>",1,"KÕt thóc ®èi tho¹i/middlefinish5")
	elseif ( Uworld1002 == 180 ) and ( GetLevel() >= 50 ) then
		Talk(1,"","Ng­¬i mau ®i t×m Phã Nam B¨ng, «ng ta cã nhiÖm vô quan träng giao cho ng­¬i.")
	else 
		Describe(DescLink_LiQiuShui.."<#>: Ta sèng lµm ng­êi cña Thóy Yªn m«n, chÕt lµm quû cña Thóy Yªn m«n.",1,"KÕt thóc ®èi tho¹i/no")
	end
end

------------------------------------º®½­¶ÀµöÛÅ-------------------------------------
function hanjiangdudiaosou()
	Uworld1002 = nt_getTask(1002)
	local name = GetName()  
	if ( Uworld1002 == 200 ) or ( Uworld1002 == 210 ) then
		nt_setTask(1002,210)
		Describe(DescLink_HanJiangDuDiaoSou.."<#>: NhÊt c¸n nhÊt l¹p nhiÖm b×nh sinh, nhÊt giang yªn ba nhÊt giang sÇu. <enter>"
			..name.."<#>: Hµn L·o tiÒn bèi! V·n bèi vÊn an ng­êi! <enter> T×m ta cã viÖc g×? <enter>"
			..name.."<#>: D­¬ng Bang chñ b¶o ta ®Õn hái «ng vµi chuyÖn. <enter>  ChuyÖn g×?<enter>"
			..name.."<#>:N¨m x­a B¶o khİ Long §o¹n mÊt tİch t¹i Thiªn V­¬ng Bang, ng­êi biÕt tung tİch cña nã kh«ng. <enter>  ChuyÖn nµy ®· l©u råi, trİ nhí cña ta ngµy cµng kĞm, nh÷ng chuyÖn x­a kia ta ®· kh«ng cßn nhí n÷a.<enter>"
			..name.."<#>:L·o TiÒn Bèi! Bang chñ ®· sím ®iÒu tra biÕt «ng ®ang gi÷ nã! Ta kh«ng muèn lµm «ng tæn th­¬ng. <enter> Ha! Ha! TiÕng ®ån vÒ ng­¬i qu¶ kh«ng sai. Long §o¹n ®ang ë trong tay ta, xem ng­¬i b¶n lÜnh ra sao!<enter>"
			..name.."<#>: Xin «ng h·y giao ra. <enter> Nhí n¨m x­a Chung D­¬ng NhŞ V­¬ng tung hoµnh giang §éng §×nh hå, binh hïng t­íng m¹nh, ®Şnh thay ®æi thÕ ®¹o tµn khèc nµy. Nh­ng ®Õn cuèi cïng còng thÊt b¹i? Cã nh÷ng chuyÖn lµ ı trêi, ı trêi kh«ng thÓ thay ®æi! <enter>"
			..name.."<#>:L·o TiÒn Bèi! ChuyÖn sau nµy ®Ó sau nµy h·y nãi. B©y giê «ng giao Long §o¹n ra, ta cã thÓ b¶o ®¶m tİnh m¹ng cña «ng.<enter> Ha ha ha! Ta sèng kh«ng bao l©u n÷a, c¸i m¹ng giµ nµy th× cã ®¸ng g×? <enter>"
			..name.."<#>: ¤ng….!<enter> Muèn Long §o¹n th× h·y ®Õn ®¸y Mª cung §éng §×nh hå, ta sÏ ®îi ë ®ã!",
			1, "KÕt thóc ®èi tho¹i/middlefinish6")
	elseif ( Uworld1002 >= 220 ) then
		Describe(name.."<#>: Hµn l·o tiÒn bèi xin b¶o träng, ta vÒ sÏ thay «ng nãi. <enter>"..DescLink_HanJiangDuDiaoSou.."<#>: Kh«ng cÇn ®©u! B¹n trÎ h·y nhí lÊy: ngµy nµo Long Khİ cã ®ñ bé, thiªn h¹ sÏ ®¹i lo¹n. <enter>"
			..name.."<#>: T¹i h¹ nhí råi. ", 1, "KÕt thóc ®èi tho¹i/no")
	else
		Describe(DescLink_HanJiangDuDiaoSou.."<#>:  §éc c©u hµn giang, t©m nh­ chİnh thñy, ung dung tù t¹i!",1,"KÕt thóc ®èi tho¹i/no")
	end
end

------------------------------------ÉÙÁÖ¿Õ¼Å--------------------------------------------
function shaolinkongji()
	Uworld1002 = nt_getTask(1002)
	local name = GetName()  
	if ( Uworld1002 == 260 ) or ( Uworld1002 == 270 ) then
		nt_setTask(1002,270)
		Describe(DescLink_KongJi.."<#>: A Di §µ PhËt!  Thİ chñ s¸t khİ qu¸ nÆng. <enter>"
			..name.."<#>: Suèt ngµy chØ biÕt chĞm giÕt, ®­¬ng nhiªn s¸t khİ nÆng råi! <enter> T¹o nhiÒu nghiÖp ¸c, Thİ chñ ngµy sau sÏ bŞ ®µy xuèng ®Şa ngôc A Tú,  khæ ¶i v« biªn, quay ®Çu lµ bê. <enter>"
			..name.."<#>: Ta kh«ng thÓ quay l¹i ®­îc n÷a. <enter> ChØ cÇn bá ®­îc lµ cã thÓ quay ®Çu. <enter>"
			..name.."<#>: Ta g¹t ®­îc m×nh, kh«ng g¹t ®­îc v¹n d©n. <enter> Bå T¸t sÏ phô hé cho kÓ thiÖn t©m! A Di §µ PhËt! <enter>"
			..name.."<#>: ThÇn T¨ng! §¹o bÊt ®ång bÊt t­¬ng vi m­u, xin giao hai bé ThÇn khİ mµ quİ tù ®ang gi÷. <enter> H·y ra c¸nh rõng ë hËu s¬n ThiÕu L©m, BÇn T¨ng thä gi¸o vµi chiªu sÏ nãi! <enter>",
			1, "KÕt thóc ®èi tho¹i/middlefinish8")
	elseif ( Uworld1002 >= 290 ) then
		Describe(name.."<#>: ThÇn T¨ng, xin ®¾c téi. <enter>"..DescLink_KongJi.."<#>:A Di §µ PhËt! ThiÖn ¸c ®Òu ®Şnh s½n, ı trêi khã ®æi. Thİ chñ ®i ®i, trªn ®êi ¾t cã nh©n qu¶. <enter>",1,"KÕt thóc ®èi tho¹i/no")
	else
		Describe(DescLink_KongJi.."<#>: Nh©n qu¶ trªn ®êi ®· ®Şnh s½n. A Di §µ PhËt!",1,"KÕt thóc ®èi tho¹i/no")
	end
end

--------------------------------------------------------------------------------------------

function no()
end

function middlefinish1()
	DelItem(456)
	AddOwnExp(5000)
	nt_setTask(1002,30)
	Msg2Player("Phã Nam B¨ng b¶o b¹n lªn La Tiªu S¬n ®¸nh b¹i Ninh T­íng Qu©n.")
end

function middlefinish2()
	AddOwnExp(5000)

	AddSkillState( 509, 1, 0, 180);
	prize1()
	ex_add_zl_level20();
	Msg2Player("Phã Nam B¨ng nãi sau nµy sÏ t×m b¹n.")
	Talk(1,"middletask","Cè g¾ng lªn")
end

function middlefinish3()
	AddOwnExp(10000)
	AddSkillState( 509, 1, 0, 180);
	prize1()
	ex_add_zl_level30();
	Msg2Player("Phã Nam B¨ng nãi L©m Uyªn Nhai cã mét kÕ ho¹ch lín, sau nµy sÏ t×m b¹n!")
	Talk(1,"middletask","Cè g¾ng lªn")
end

function middlefinish4()
	AddOwnExp(15000)
	nt_setTask(1002,150)
	Msg2Player("LÖ Thu Thñy b¶o ®Õn Kinh Hoµng ®éng ®¸nh b¹i Tõ Tù Lùc.")
end

function middlefinish5()
	Uworld1002 = nt_getTask(1002)
	AddOwnExp(20000)
	
	AddSkillState( 509, 1, 0, 180);
	prize1()
	ex_add_zl_level40();
	Msg2Player("Phã Nam B¨ng gióp b¹n tÈy tñy, hiÖn giê b¹n cã thÓ thay ®æi ®iÓm kü n¨ng. NÕu b¹n kh«ng thuéc Phe Trung lËp, th× sÏ kh«ng ®­îc tÈy tñy. B¹n cã thÓ vÒ t×m Phã Nam B¨ng.")
end

function middlefinish6()
	AddOwnExp(30000)
	nt_setTask(1002,215)
	Msg2Player("Hµn Giang §éc §iÕu TÈu b¶o b¹n ®Õn Mª cung §éng §×nh hå t×m «ng ta!")	
end

function middlefinish7()
	AddOwnExp(40000)
	
	AddSkillState( 509, 1, 0, 180);
	prize1()
	ex_add_zl_level50();
	Msg2Player("Phã Nam B¨ng nãi sÏ sau nµy sÏ t×m b¹n.")
	Talk(1,"middletask","Cè g¾ng lªn")
end

function middlefinish8()
	AddOwnExp(50000)
	nt_setTask(1002,280)
	Msg2Player("Kh«ng TŞch ThÇn T¨ng b¶o ®Õn HËu s¬n ThiÕu L©m Tù t×m «ng ta")	
end

function middlefinish9()
	AddOwnExp(40000)
	nt_setTask(1002,310)
	ex_add_zl_level60();
	AddSkillState( 509, 1, 0, 180);
	Msg2Player("Phã Nam B¨ng nãi sÏ ®i Hoa S¬n lµm chót chuyÖn, sau nµy cã dŞp gÆp l¹i. B¹n quay vÒ t×m Long Ngò ")	
end
