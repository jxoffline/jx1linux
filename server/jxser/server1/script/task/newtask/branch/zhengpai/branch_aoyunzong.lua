-- ĞÂÈÎÎñÏµÍ³ÕıÅÉÖ§Ïß¹ÜÀínpc
-- BY£ºXIAOYANG£¨2004-11-30£©

 Include("\\script\\task\\newtask\\newtask_head.lua")
 Include("\\script\\task\\newtask\\branch\\branch_head.lua")
 Include("\\script\\task\\newtask\\branch\\branch_prize.lua")
 Include("\\script\\task\\newtask\\branch\\branch_problem.lua")
 Include("\\script\\task\\newtask\\education_setnpcpos.lua")

function task_aoyunzong()
	local curCamp = nt_getCamp()
	Uworld1000 = nt_getTask(1000)
	Uworld1001 = nt_getTask(1001) --ÕıÅÉÖ÷Ïß
	Uworld183 = nt_getTask(183)
	Uworld1050 = nt_getTask(1050) --ÕıÅÉ20-30Ö§Ïß
	Uworld1051 = nt_getTask(1051) --ÕıÅÉ30-40Ö§Ïß
	Uworld1052 = nt_getTask(1052) --ÕıÅÉ40-50Ö§Ïß
	Uworld1053 = nt_getTask(1053) --ÕıÅÉ50-60Ö§Ïß
	Uworld1011 = nt_getTask(1011) --ÕıÅÉÖ§ÏßµÄÉ±¹ÖÈÎÎñ±äÁ¿
	Uworld196 = nt_getTask(196) --ÕıÅÉÈ«½±Àø
	local name = GetName()  
---------------------------------------------------------------½ÌÓıÈÎÎñ------------------------------------------------------------------------
	if (	Uworld1000 > 0 ) and ( Uworld1000 < 1000 ) then
		if (( Uworld1000 == 300 ) or ( Uworld1000 == 310 )) and ( curCamp == 0 ) then 
			nt_setTask(1000,310) --»·½Ú16start
			Talk(3,"Uworld1000_zfz1",name..": Ngò Gia b¶o ta ®Õn, ®©y lµ th­ cña Ngò Gia!","Ngò gia? Xem qua th­ th× ch¾c lµ kh«ng sai råi. Mu«n dÆm ®­êng xa, b©y giê ®· lµ mïa ®«ng, mau vµo nhµ uèng b×nh r­îu nãng, ¨n ch©n dª n­íng, råi tİnh tiÕp.","Ng­¬i cã thÓ cã thÓ d¹o ch¬i trong thµnh, dïng phİm Tab më b¶n ®å nhá ®Ó dÔ xem! Sau ®ã h·y ®Õn t×m ta!")
		elseif (( Uworld1000 == 320 ) or ( Uworld1000 == 330 )) and ( curCamp == 0 ) then
			nt_setTask(1000,330) --»·½Ú17start
			Talk(2,"Uworld1000_zfz2",name..": Ta ®· xem qua råi..","VËy ®­îc, h·y ®i t×m Vâ L©m TruyÒn Nh©n.")
		elseif (( Uworld1000 == 420 ) or ( Uworld1000 == 430 )) and ( curCamp == 0 ) and ( Uworld1001 < 10 ) then
			nt_setTask(1000,430) --»·½Ú22start
			Talk(5,"Uworld1000_zfz3","VÒ råi µ! §©y lµ tói th­ cña ng­¬i! Xem xong ng­¬i tù biÕt ph¶i lµm g×!",name..":......Thay ta c¸m ¬n Ngò Gia."," Sau khi hoµn thµnh nhiÖm vô Chİnh tuyÕn h·y quay l¹i ®©y t×m ta. Ta cã vµi nhiÖm vô nhá cho ng­¬i, nÕu hoµn thµnh sÏ cã phÇn th­ëng h¬n mong ®îi. Coi nh­ thay Ngò Ca gióp ®ì ng­¬i.",name..": §­îc! Ta nhí råi.","Ng­¬i vÉn cã thÓ lµm nhiÖm vô phe kh¸c, cã thÓ ®¹t ®­îc nhiÒu ®iÓm kinh nghiÖm, nh­ng hä vÉn xem ng­¬i lµ ng­êi ngoµi, nªn sÏ kh«ng tÆng ng­¬i nh÷ng vËt phÈm quİ b¸u. Ng­¬i cã thÓ ®i t×m Long Ngò trong c¸c th«n trÊn hái th¨m.")
		elseif ( Uworld1000 == 420 ) and ( curCamp == 0 ) and ( Uworld1001 > 10 ) then
			Talk(1,"Uworld1000_finishzhengpai","Ng­¬i ®· b¾t ®Çu tiÕp nhËn nhiÖm vô c¸c phe, ta kh«ng cßn g× d¹y ng­¬i. H·y ®i ®i.")
		elseif (( Uworld1000 == 430 ) or ( Uworld1000 == 440 )) and ( curCamp == 0 )  and ( HaveCommonItem(6,1,131) == 0 ) and ( Uworld1001 < 10) then 
			Say("T¹i sao quay l¹i? Hay lµ ®Ó quªn tói th­ ë chç ta.",2,"Tu©n lÖnh!/Uworld1000_zfz4","Kh«ng ph¶i! ChØ lµ quay l¹i th¨m «ng mµ th«i!/Uworld1000_no1")
		else
			Talk(1,"","T×m ta uèng r­îu? §­îc th«i, chç nµo kh«ng hiÓu nhÊn <color=red>F12<color> xem. NÕu ng­¬i ®ang lµm <color=red>nhiÖm vô S¬ nhËp<color>,   kh«ng thÓ tiÕp nhËn nhiÖm vô kh¸c.")
		end
	else
---------------------------------------------------------------ÕıÅÉÖ§ÏßÈÎÎñ-----------------------------------------------------------------------	
		if (( Uworld1050 == 1000 ) and ( GetBit(GetTask(196),1) ~= 1)) or (( Uworld1051 == 1000 ) and ( GetBit(GetTask(196),2) ~= 1)) or (( Uworld1052 == 1000 ) and ( GetBit(GetTask(196),3) ~= 1)) or  (( Uworld1053 == 1000 ) and ( GetBit(GetTask(196),4) ~= 1)) then
			Describe(DescLink_AoYunZong.."<#>:  Ta rÊt hµi lßng víi biÓu hiÖn cña ng­¬i, tÆng ng­¬i mãn b¶o vËt nµy!",1,"NhËn l·nh b¶o vËt/allprize_zhengpai")
		elseif ( Uworld1053 == 70 ) or ( Uworld1053 == 80 ) then 
			if ( GetLevel() >= 50 ) and ( GetLevel() <  60 ) then 
				nt_setTask(1053,80)
				Describe(DescLink_AoYunZong.."<#>:  Sao? Nh¹c Nguyªn So¸i kh«ng ph¶i do ng­êi cña L©m Uyªn Nhai h¹i, vËy th× lµ ai? Ch¼ng lÏ ®»ng sau cßn cã thÕ lùc lín ®ang thao tóng?.<enter>",1,"KÕt thóc ®èi tho¹i/Uworld1053_zfz3")
			else 
				Talk(1,"Uworld1000_zfz6","Khi lµm nhiÖm vô gÆp vÊn ®Ò g×, cã thÓ Ên phİm <color=red>F12<color> ®Ó xem nhËt tr×nh. Trong ®ã chØ ghi l¹i c¸c b­íc mµ b¹n ®· thùc hiÖn qua!")
			end
		elseif ( Uworld1052 == 110 ) or ( Uworld1052 == 120 ) then 
			if ( GetLevel() >= 40 ) and ( GetLevel() <  50 ) then 
				nt_setTask(1052,120)
				Describe(DescLink_AoYunZong.."<#>:  Lµm tèt l¾m! Ta biÕt ng­¬i sÏ kh«ng phô lßng hy väng cña ta.",
				1,"KÕt thóc ®èi tho¹i/Uworld1052_zfz5")
			else 
				Talk(1,"Uworld1000_zfz6","Khi lµm nhiÖm vô gÆp vÊn ®Ò g×, cã thÓ Ên phİm <color=red>F12<color> ®Ó xem nhËt tr×nh. Trong ®ã chØ ghi l¹i c¸c b­íc mµ b¹n ®· thùc hiÖn qua!")
			end		
		elseif ( Uworld1052 == 80 ) or ( Uworld1052 == 90 ) then 
			if ( GetLevel() >= 40 ) and ( GetLevel() <  50 ) then 
				nt_setTask(1052,90)
				Describe(DescLink_AoYunZong.."<#>:  Quay l¹i t×m ta cã viÖc µ? Lóc nµy nªn İt liªn l¹c th× h¬n.<enter>"
				..name.."<#>:  V©n T«ng, «ng biÕt Du S­¬ng T©n ®ang ë ®©u kh«ng?.<enter> H¾n ®ang ë bªn ngoµi Thµnh §«, h¾n kh«ng ph¶i kÎ xÊu, cã thÓ tha cho h¾n con ®­êng sèng.<enter>",
				1,"KÕt thóc ®èi tho¹i/Uworld1052_zfz4")
			else 
				Talk(1,"Uworld1000_zfz6","Khi lµm nhiÖm vô gÆp vÊn ®Ò g×, cã thÓ Ên phİm <color=red>F12<color> ®Ó xem nhËt tr×nh. Trong ®ã chØ ghi l¹i c¸c b­íc mµ b¹n ®· thùc hiÖn qua!")
			end			
		elseif (( Uworld1052 == 20 ) or ( Uworld1052 == 30 )) and ( Uworld1011 == 20 ) then --Ôö¼ÓÁËÅĞ¶ÏÊÇ·ñÔÚËÎ½ğpkÁËÒ»³¡µÄ±äÁ¿Uworld1011
			if ( GetLevel() >= 40 ) and ( GetLevel() <  50 ) then 
				nt_setTask(1052,30)
				Describe(DescLink_AoYunZong.."<#>:  ThÊy ch­a, nh©n ngo¹i h÷u nh©n, thiªn ngo¹i h÷u thiªn. Vâ §ang cao thñ v« sè. Vâ häc vèn kh«ng cã c¶nh giíi.<enter>"
				..name.."<#>:  ThÕ n¨m x­a vŞ nµo ®o¹t ®­îc danh hiÖu?<enter>Lµ 1 vŞ cao nh©n cña Ngò §éc gi¸o.<enter>"
				..name.."<#>:  Ngò §éc gi¸o? <enter>§óng vËy, ®¸ng tiÕc sau khi ®o¹t danh hiÖu kh«ng l©u ng­êi nµy ®· biÕn mÊt. Nghe nãi sau khi chiÕn th¾ng ng­êi nµy qu¸ ®¾c ı ®· hÑn quyÕt chiÕn víi §éc C« KiÕm, ®ã lµ 1 cuéc chiÕn kinh thiªn ®éng ®Şa nh­ng kÕt qu¶ th× kh«ng "
				..name.."<#>:  TrËn tØ thİ nhá nh­ng bªn trong l¹i lµ bİ mËt lín.<enter>NhiÖm vô tiÕp theo rÊt khã, cã thÓ ng­¬i còng sÏ bá m¹ng gièng nh­ bao cao thñ tr­íc ®©y.<enter>"
				..name.."<#>:  Nãi ®i! Ta kh«ng sî ®©u! <enter> Ta muèn ng­¬i x©m nhËp vµo tæ chøc s¸t thñ L©m Uyªn Nhai. N¨m x­a Nh¹c Nguyªn So¸i bŞ h¹i cã liªn quan ®Õn bän hä, ta ®· thay ng­¬i ®iÒu tra chót İt. H·y ®Õn D­¬ng Ch©u t×m Hçn Hçn.<enter>"
				..name.."<#>:  Ta ®Õn ®ã lµm sao liªn l¹c víi y?<enter> Ng­¬i tù b¸o danh lµ ®­îc. §õng liªn l¹c víi ta. Ta chê tin ng­¬i.<enter>",
				1,"KÕt thóc ®èi tho¹i/Uworld1052_zfz3")
			else 
				Talk(1,"Uworld1000_zfz6","Khi lµm nhiÖm vô gÆp vÊn ®Ò g×, cã thÓ Ên phİm <color=red>F12<color> ®Ó xem nhËt tr×nh. Trong ®ã chØ ghi l¹i c¸c b­íc mµ b¹n ®· thùc hiÖn qua!")
			end			
		elseif (( Uworld1051 == 170 ) or ( Uworld1051 == 180 )) then
			if ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) then 
				nt_setTask(1051,180)
				Describe(name.."<#>:  Ta ®· ®em B¶o th¹ch vÒ.<enter>"
				..DescLink_AoYunZong.."<#>:     §Ó ta xem......§©y qu¶ nhiªn lµ Kho¸ng th¹ch thuéc tİnh, ®­îc l¾m. LÇn nay ta xem Mé Dung BÊt Ky kh«ng thÓ lµm ng¬ ®­îc. ¤ng ta chØ cÇn 1 viªn, viªn cßn l¹i ng­¬i gi÷. Ng­¬i ®em ¸o gi¸p thuéc tİnh Èn, b¶o th¹ch tû lÖ vµ Kho¸ng th¹ch thuéc tİnh ® ",
				1,"KÕt thóc ®èi tho¹i/Uworld1051_zfz5")
			else 
				Talk(1,"Uworld1000_zfz6","Khi lµm nhiÖm vô gÆp vÊn ®Ò g×, cã thÓ Ên phİm <color=red>F12<color> ®Ó xem nhËt tr×nh. Trong ®ã chØ ghi l¹i c¸c b­íc mµ b¹n ®· thùc hiÖn qua!")
			end		
		elseif ( Uworld1051 == 80 ) or ( Uworld1051 == 90 ) and ( Uworld1011 == 20 ) then --Ôö¼ÓÁËÅĞ¶ÏÀÇÊıÁ¿ÒÑ¹»µÄ±äÁ¿Uworld1011
			if ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) then 
				nt_setTask(1051,90)
				Describe(DescLink_AoYunZong.."<#>:  Tiªu diÖt sãi råi? Tèt! H·y ®em x­¬ng sãi ®Õn T­¬ng D­¬ng t×m Cung A Ng­u, h¾n lµ thî s¨n næi tiÕng ë Phôc Ng­u S¬n, lÊy x­¬ng sãi bµo chÕ d­îc töu sÏ trŞ ®­îc bÖnh cña Ng« L·o th¸i.<enter>",1,"KÕt thóc ®èi tho¹i/Uworld1051_zfz4")
			else 
				Talk(1,"Uworld1000_zfz6","Khi lµm nhiÖm vô gÆp vÊn ®Ò g×, cã thÓ Ên phİm <color=red>F12<color> ®Ó xem nhËt tr×nh. Trong ®ã chØ ghi l¹i c¸c b­íc mµ b¹n ®· thùc hiÖn qua!")
			end
		elseif ( Uworld1051 == 60 ) or ( Uworld1051 == 70 ) then
			if ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) then
				nt_setTask(1051,70)
				Describe(DescLink_AoYunZong.."<#>:  ña? Sao l¹i quay l¹i?.<enter>"
				..name.."<#>:  Ta ®· ®i t×m H¹ Lan Chi, c« ta b¶o ta ®Õn gÆp Ng« L·o th¸i. Viªn ngäc cã thÓ thÊt l¹c ë ®ã. Nh­ng lóc ta qua Ng« L·o th¸i m¾c bÖnh l¹ kh«ng nãi ®­îc.<enter>BÖnh l¹? Cã chuyÖn trïng hîp thÕ sao, võa ®óng lóc ng­¬i qua hái tung tİch cña viªn ®¸ l¹i m¾ "
				..name.."<#>:  Ch¼ng lÏ trong ®ã cßn cã bİ mËt g×? <enter>Ng¹o V©n T«ng:......Ta kh«ng giÊu ng­¬i n÷a. Mé Dung BÊt Ky ®· sím chÕ t¹o mét thanh Chñy thñ, nh­ng «ng ta cø giÊu chuyÖn nµy, ta nghi ngê ®ã lµ hung khİ thİch s¸t Nhac Phi.<enter>"
				..name.."<#>:  C¸i g×!<enter> Cho nªn chóng ta nªn t×m B¶o th¹ch thuéc tİnh, sau ®ã cã thÓ b¾t Mé Dung BÊt Ky nãi ra sù thËt. BÖnh cña Ng« L·o th¸i ®Õn rÊt lµ trïng hîp, phİa sau ch¾c cã mét bµn tay muèn che ®Ëy tÊt c¶.<enter>"
				..name.."<#>:  VËy ta ph¶i lµm sao? <enter>Mau t×m thuèc gi¶i, nÕu kh«ng mäi chuyÖn sÏ thay ®æi. Lªn Phôc Ng­u S¬n ®«ng ®¸nh 50 con Sãi xanh, lÊy x­¬ng sãi vÒ, ta sÏ cã c¸ch.<enter>",
				1,"KÕt thóc ®èi tho¹i/Uworld1051_zfz3")
			else 
				Talk(1,"Uworld1000_zfz6","Khi lµm nhiÖm vô gÆp vÊn ®Ò g×, cã thÓ Ên phİm <color=red>F12<color> ®Ó xem nhËt tr×nh. Trong ®ã chØ ghi l¹i c¸c b­íc mµ b¹n ®· thùc hiÖn qua!")
			end
		elseif ( Uworld1050 == 130 ) or ( Uworld1050 == 140 ) then
			if ( GetLevel() >= 20 ) and ( GetLevel() <  30 ) then
				nt_setTask(1050,140)
				Describe(name.."<#>:  B¹n ®· ®¸nh b¹i tªn s¸t thñ ®ã, nh­ng khi h¾n s¾p qua ®êi l¹i nãi m×nh kh«ng ph¶i lµ kÎ chñ m­u s¸t h¹i Nh¹c Nguyªn So¸i.<enter>"
				..DescLink_AoYunZong.."<#>:  Xem ra vÊn ®Ò phøc t¹p h¬n b¹n t­ëng rÊt nhiÒu.<enter>",
				1,"KÕt thóc ®èi tho¹i/Uworld1050_zfz4")	
			else
				Talk(1,"Uworld1000_zfz6","Khi lµm nhiÖm vô gÆp vÊn ®Ò g×, cã thÓ Ên phİm <color=red>F12<color> ®Ó xem nhËt tr×nh. Trong ®ã chØ ghi l¹i c¸c b­íc mµ b¹n ®· thùc hiÖn qua!")
			end							
		elseif ( Uworld1050 == 60 ) or ( Uworld1050 == 70 ) then
			if ( GetLevel() >= 20 ) and ( GetLevel() <  30 ) then
				nt_setTask(1050,70)
				Describe(name.."<#>:  Çy!  Lóc ta ®Õn Si T¨ng ®· cïng §Ö tö Thiªn Long tù xuèng nói hµnh sù.<enter>"
				..DescLink_AoYunZong.."<#>:  Ta ph¶i ®i t×m «ng ta míi ®­îc.<enter>"
				..name.."<#>:  Lµ ai?<enter> Mét ng­êi Èn c­ thÕ ngo¹i, ta vèn kh«ng muèn lµm phiÒn ng­êi ®ã.<enter>"
				..name.."<#>:  Lµ ai?<enter> Lµ TiÔn §Çu b¹n cña ta. Ng­¬i ®i Hoa S¬n ph¸i t×m «ng ta ®i, «ng ta Èn c­ ë ®ã ®· 10 n¨m råi, n¨m x­a y tõng nh¾c ®Õn Thiªn Hoµng Long Khİ.<enter>",
				1,"KÕt thóc ®èi tho¹i/Uworld1050_zfz3")	
			else
				Talk(1,"Uworld1000_zfz6","Khi lµm nhiÖm vô gÆp vÊn ®Ò g×, cã thÓ Ên phİm <color=red>F12<color> ®Ó xem nhËt tr×nh. Trong ®ã chØ ghi l¹i c¸c b­íc mµ b¹n ®· thùc hiÖn qua!")
			end
		elseif ( GetLevel() >= 20)  then
			Say("Ng­¬i cã muèn gãp mét phÇn søc cho Vâ l©m? Ta cã nhiÒu nhiÖm vô giao cho ng­¬i.",3,"Ta muèn lµm mét vµi nhiÖm vô Chİnh tuyÕn./Uworld1000_zfz5","Ta muèn lµm mét vµi nhiÖm vô phô tuyÕn/Uworld1000_zfz6","Ta mÖt mâi råi! §õng t×m ta n÷a!/Uworld1000_no1")
		else
			Talk(1,"","T×m ta uèng r­îu µ? §­îc ®ã, chç nµo kh«ng hiÓu nhÊn <color=red>F12<color> xem.")
		end
	end
end

function Uworld1000_zfz1()
	AddOwnExp(1000)
	nt_setTask(1000,320) --»·½Ú16end
	Msg2Player("Ng¹o V©n T«ng b¶o b¹n vµo thµnh nghØ ng¬i, xong råi ®Õn t×m «ng ta.")	
end

function Uworld1000_zfz2()
	AddOwnExp(1000)
	nt_setTask(1000,340) --»·½Ú17end 
	Msg2Player("Ng¹o V©n T«ng b¶o b¹n ®i t×m Vâ L©m TruyÒn Nh©n.")	
	seteducationnpcpos()
end

function Uworld1000_zfz3()
	AddItem(6,1,131,1,0,0,0)  --Ôö¼ÓÁúÎåµÄ°ü¸¤
	nt_setTask(183,10)
	AddOwnExp(20000)
	nt_setTask(1000,440) --»·½Ú22end
	Msg2Player("B¹n nhËn ®­îc 1 tói th­, Ng¹o V©n T«ng b¶o b¹n mau ®i t×m ng­êi cÇn t×m.")	
end

function Uworld1000_zfz4()
	AddItem(6,1,131,1,0,0,0)  --Ôö¼ÓÁúÎåµÄ°ü¸¤
	nt_setTask(183,10)
	Msg2Player("B¹n nhËn ®­îc 1 tói th­, Ng¹o V©n T«ng b¶o b¹n mau ®i t×m ng­êi cÇn t×m.")	
end

function Uworld1000_zfz5() --ÕıÅÉ·ÖÖ§µÄÈÎÎñÑ¡Ôñ½Å±¾
	Uworld1000 = nt_getTask(1000)
	Uworld1001 = nt_getTask(1001)
	if ( Uworld1001 < 10 ) and ( Uworld1000 == 0 ) then 
		Talk(1,"","Ng­¬i h·y ®i c¸c T©n Thñ Th«n t×m Long Ngò. Nhí gi÷ kü th­ cña h¾n! NÕu mÊt th­ tiÕn dÉn th× sÏ kh«ng ai tin ng­¬i ®©u!")
		Msg2Player("Ng¹o V©n T«ng b¶o b¹n vµo T©n Thñ Th«n t×m Long Ngò, Y sÏ giao vµi nhiÖm vô cho b¹n.")		
	elseif ( Uworld1000 ~= 0 ) and ( Uworld1000 ~= 1000 ) then
		Talk(1,"","Ng­¬i cßn ph¶i lµm nhiÖm vô S¬ nhËp, Sau ®ã Long Ngò sÏ giao nhiÖm vô kh¸c cho ng­¬i.")
	elseif ( Uworld1001 ~= 0 ) then
		Talk(1,"","Nµy b»ng h÷u, ch¼ng ph¶i ng­¬i ®ang lµm nhiÖm vô Chİnh tuyÕn Chİnh ph¸i ®ã sao? Kh«ng ph¶i trªu ghÑo ta chø! Ta lµ ng­êi thËt thµ, ®õng g¹t ta! ThËt lµ......")
	else
		Talk(1,"","NhiÖm vô Chİnh tuyÕn lµ sau khi b¹n ®¹t ®Õn cÊp nhÊt ®Şnh míi cã thÓ tiÕp nhËn. ChØ cÇn ®¼ng cÊp nh©n vËt trªn 20 lµ cã thÓ tiÕp nhËn. NÕu hoµn thµnh......sÏ cã gi¶i th­ëng h¬n mong ®îi.")
	end
end

function Uworld1000_zfz6()
	Uworld1050 = nt_getTask(1050)
	Uworld1051 = nt_getTask(1051)
	Uworld1052 = nt_getTask(1052)
	Uworld1053 = nt_getTask(1053)
	Describe(DescLink_AoYunZong.."<#>:  giang hå dËy sãng, thÕ lùc B¹ch ®¹o ngµy cµng İt, kh«ng cßn ®¹o nghÜa giang hå, ®· ®Õn lóc ta vµ ng­¬i  ra søc råi.",6,
	"Ta muèn t×m hiÓu c¸ch lµm nhiÖm vô Phô tuyÕn/Uworld1000_zfz7" ,
	"Ta muèn lµm nhiÖm vô tõ cÊp 20 ®Õn 29/Uworld1050_zfz1",
	"Ta muèn lµm nhiÖm vô cÊp 30 ®Õn 39/Uworld1051_zfz1",
	"Ta muèn lµm nhiÖm vô cÊp 40 ®Õn 49/Uworld1052_zfz1",
	"Ta muèn lµm nhiÖm vô cÊp 50 ®Õn 59/Uworld1053_zfz1",
	"Hay lµ sau nµy h·y lµm!/no")
end

function Uworld1000_zfz7()
	Describe(DescLink_AoYunZong.."<#>:  NhiÖm vô Phô tuyÕn trªn c¬ b¶n lµ nhiÖm vô Chİnh tuyÕn, khi ®¹t ®Õn ®¼ng cÊp nhÊt ®Şnh míi cã thÓ tiÕp nhËn. Vİ dô lóc ®¼ng cÊp b¹n lµ 32, b¹n ph¶i tiÕp nhËn nhiÖm vô Chİnh tuyÕn cÊp 30 tr­íc, sau ®ã míi cã thÓ tiÕp nhËn nhiÖm vô phô tuyÕn.Tr­íc khi",1,"KÕt thóc ®èi tho¹i/no")
end

function Uworld1050_zfz1()
	Uworld1050 = nt_getTask(1050) --ÕıÅÉ20-30¼¶Ö®¼äµÄÖ§ÏßÈÎÎñ±äÁ¿
	Uworld1001 = nt_getTask(1001) --ÕıÅÉÖ÷ÏßÈÎÎñ±äÁ¿
	local name = GetName()  
	if ( Uworld1001 >= 20 ) and ( GetLevel() >= 20 ) and ( GetLevel() <  30 ) and (( Uworld1050 == 0 ) or ( Uworld1050 == 10 )) then
		nt_setTask(1050,10)
		Describe(DescLink_AoYunZong.."<#>:  GÇn ®©y giang hå xuÊt hiÖn tin tøc vÒ Thiªn Hoµng Long Khİ, chØ biÕt ®ã lµ bé B¶o gi¸p. Ng­êi mÆc bé gi¸p nµy sÏ cã uy lùc tèi th­îng. Cã ng­êi bá ra mét sè tiÒn lín ®Ó chóng ta ®iÒu tra lai lŞch cña Thiªn Hoµng Long Khİ.<enter>"
		..name.."<#>:  §¾t tiÒn l¾m kh«ng? <enter>Lµ mét c¸i gi¸ mµ ng­¬i kh«ng thÓ ngê?<enter>"
		..name.."<#>:  ChØ ®Ó t×m tung tİch cña bé ¸o gi¸p? <enter> Cã ng­êi nghi ngê ®©y lµ tin gi¶, ng­¬i h·y ®i ®iÒu tra, ta còng? Muèn biÕt bé gi¸p nµy nh­ thÕ nµo.<enter>"
		..name.."<#>:  ¤ng cã manh mèi nµo kh«ng? <enter> §Õn Thiªn Long tù t×m Si T¨ng. Tin nµy cã kh¶ n¨ng ®­îc truyÒn tõ V©n Nam.<enter>"
		..name.."<#>:  HiÓu råi.<enter>",1,"KÕt thóc ®èi tho¹i/Uworld1050_zfz2")
	elseif ( GetLevel() < 20 ) then
		Talk(1,"","Xin lçi! §¼ng cÊp cña ng­¬i ch­a ®¹t yªu cÇu cña nhiÖm vô, ®îi ®Õn cÊp 20, sau khi tiÕp nhËn nhiÖm vô Chİnh tuyÕn t­¬ng øng míi ®Õn t×m ta.")
	elseif ( GetLevel() >= 30 ) then
		Talk(1,"","Xin lçi! §¼ng cÊp cña b¹n v­ît qu¸ yªu cÇu cña nhiÖm vô, kh«ng thÓ tiÕp nhËn nhiÖm vô.")
	elseif ( Uworld1001 < 20 ) then
		Talk(1,"","Xin lçi! B¹n ch­a lµm nhiÖm vô Chİnh tuyÕn Chİnh ph¸i t­¬ng øng víi ®¼ng cÊp, h·y ®Õn <color=red>§¹i Lı<color> t×m M¹c SÇu.")
	else
		Talk(1,"","Lµm 1 s¸t thñ, tr­íc khi hµnh ®éng cÇn ph¶i suy tİnh cho chu ®¸o! Kh«ng ph¶i ai trªn giang hå còng trë thµnh s¸t thñ næi tiÕng")
	end
end

function Uworld1051_zfz1()
	Uworld1051 = nt_getTask(1051) --ÕıÅÉ30-40¼¶Ö®¼äµÄÖ§ÏßÈÎÎñ±äÁ¿
	Uworld1001 = nt_getTask(1001) --ÕıÅÉÖ÷ÏßÈÎÎñ±äÁ¿
	local name = GetName()  
	if ( Uworld1001 >= 70 ) and ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) and (( Uworld1051 == 0 ) or ( Uworld1051 == 10 )) then
		nt_setTask(1051,10)
		Describe(DescLink_AoYunZong.."<#>:  Mé Dung BÊt Ky ®ang ë L©m An ®óc 1 bé B¶o gi¸p cho Hoµng th­îng, «ng ta cÇn 1 viªn kho¸ng th¹ch thuéc tİnh Èn hÖ Kim, b¹n ®i t×m gióp «ng ta.<enter>"
		..name.."<#>:  Mãn ®å ®ã ë ®©u? <enter> §Õn Thµnh §« t×m H¹ Lan Chi, c« ta tõng lµ ®Ö tö cña Mé Dung BÊt Ky, c« ta cã gi÷ hai viªn B¶o th¹ch nµy.<enter>",
		1,"KÕt thóc ®èi tho¹i/Uworld1051_zfz2")
	elseif ( GetLevel() < 30 ) then
		Talk(1,"","Xin lçi! §¼ng cÊp cña ng­¬i ch­a ®¹t yªu cÇu cña nhiÖm vô, ®îi ®Õn cÊp 30, sau khi tiÕp nhËn nhiÖm vô Chİnh tuyÕn t­¬ng øng míi ®Õn t×m ta.")
	elseif ( GetLevel() >= 40 ) then
		Talk(1,"","Xin lçi! §¼ng cÊp cña b¹n v­ît qu¸ yªu cÇu cña nhiÖm vô, kh«ng thÓ tiÕp nhËn nhiÖm vô.")
	elseif ( Uworld1001 < 70 ) then
		Talk(1,"","Xin lçi! B¹n ch­a lµm nhiÖm vô Chİnh tuyÕn Chİnh ph¸i t­¬ng øng víi ®¼ng cÊp, h·y ®Õn <color=red>§¹i Lı<color> t×m M¹c SÇu.")
	else
		Talk(1,"","Lµm 1 s¸t thñ, tr­íc khi hµnh ®éng cÇn ph¶i suy tİnh cho chu ®¸o! Kh«ng ph¶i ai trªn giang hå còng trë thµnh s¸t thñ næi tiÕng")
	end
end

function Uworld1052_zfz1()
	Uworld1052 = nt_getTask(1052) --ÕıÅÉ40-50¼¶Ö®¼äµÄÖ§ÏßÈÎÎñ±äÁ¿
	Uworld1001 = nt_getTask(1001) --ÕıÅÉÖ÷ÏßÈÎÎñ±äÁ¿
	local name = GetName()  
	if ( Uworld1001 >= 140 ) and ( GetLevel() >= 40 ) and ( GetLevel() <  50 ) and (( Uworld1052 == 0 ) or ( Uworld1052 == 10 )) then
		nt_setTask(1052,10)
		Describe(DescLink_AoYunZong.."<#>:  Ta b«n ba giang hå ®· l©u, cã lêi muèn nãi víi ng­¬i.<enter>"
		..name.."<#>:  Lµ thÕ nµo?<enter>Ng¹o V©n T«ng: <color=red>Dông kiÕm dông nh·n, ®¸nh nhanh th¾ng gän.<color><enter>"
		..name.."<#>:  NghÜa lµ sao? <enter> Lóc ®èi ®Şch quan s¸t lµ quan träng nhÊt. ChØ cã quan s¸t míi ph¸t hiÖn ®­îc ®iÓm yÕu cña ®èi thñ, t×m ra c¸ch ®¸nh b¹i. §©y gäi lµ 'Dông kiÕm dông nh·n'. Mét khi ra tay tèc ®é ph¶i mau ®Ó cã thÓ che ®Ëy ®iÓm yÕu cña m×nh, kh«ng cho ®Şch cã c¬ héi ph¶n c«ng. §ã gäi lµ '®¸nh nhanh th¾ng gän'."
		..name.."<#>:  Nh÷ng ®iÒu ®ã rÊt cã İch víi ng­¬i.<enter> ChØ nghe th«i th× kh«ng thÓ thµnh cao thñ ®­îc, ng­¬i h·y ®Õn tû vâ tr­êng ®¸nh mét trËn pk, ®Ó c¶m nhËn thùc tÕ.<enter>",
		1,"KÕt thóc ®èi tho¹i/Uworld1052_zfz2")
	elseif ( GetLevel() < 40 ) then
		Talk(1,"","Xin lçi! §¼ng cÊp cña ng­¬i ch­a ®¹t yªu cÇu cña nhiÖm vô, ®îi ®Õn cÊp 40, sau khi tiÕp nhËn nhiÖm vô Chİnh tuyÕn t­¬ng øng míi ®Õn t×m ta.")
	elseif ( GetLevel() >= 50 ) then
		Talk(1,"","Xin lçi! §¼ng cÊp cña b¹n v­ît qu¸ yªu cÇu cña nhiÖm vô, kh«ng thÓ tiÕp nhËn nhiÖm vô.")
	elseif ( Uworld1001 < 140 ) then
		Talk(1,"","Xin lçi! B¹n ch­a lµm nhiÖm vô Chİnh tuyÕn Chİnh ph¸i t­¬ng øng víi ®¼ng cÊp, h·y ®Õn <color=red>§¹i Lı<color> t×m M¹c SÇu.")
	else
		Talk(1,"","Lµm 1 s¸t thñ, tr­íc khi hµnh ®éng cÇn ph¶i suy tİnh cho chu ®¸o! Kh«ng ph¶i ai trªn giang hå còng trë thµnh s¸t thñ næi tiÕng")
	end
end

function Uworld1053_zfz1()
	Uworld1053 = nt_getTask(1053) --ÕıÅÉ50-60¼¶Ö®¼äµÄÖ§ÏßÈÎÎñ±äÁ¿
	Uworld1001 = nt_getTask(1001) --ÕıÅÉÖ÷ÏßÈÎÎñ±äÁ¿
	local name = GetName()  
	if ( Uworld1001 >= 210 ) and ( GetLevel() >= 50 ) and ( GetLevel() <  60 ) and ( Uworld1053 == 0 )  then
		if ( Uworld1052 == 1000 ) then
			Describe(DescLink_AoYunZong.."<#>:  §i t×m Hçn Hçn ®i, kh«ng cã g× ®õng ®Õn t×m ta, tai m¾t cña L©m Uyªn Nhai ë kh¾p n¬i.",1,"KÕt thóc ®èi tho¹i/no")
		else
			Describe(DescLink_AoYunZong.."<#>:  §Õn t×m Hçn Hçn bªn ngoµi tû vâ tr­êng t¹i D­¬ng Ch©u, c« ta sÏ cho ng­¬i biÕt nªn lµm thÕ nµo.<enter>",1,"KÕt thóc ®èi tho¹i/no")
		end
	elseif ( GetLevel() < 50 ) then
		Talk(1,"","Xin lçi! §¼ng cÊp cña ng­¬i ch­a ®¹t yªu cÇu cña nhiÖm vô, ®îi ®Õn cÊp 50, sau khi tiÕp nhËn nhiÖm vô Chİnh tuyÕn t­¬ng øng míi ®Õn t×m ta.")
	elseif ( GetLevel() >= 60 ) then
		Talk(1,"","Xin lçi! §¼ng cÊp cña b¹n v­ît qu¸ yªu cÇu cña nhiÖm vô, kh«ng thÓ tiÕp nhËn nhiÖm vô.")
	elseif ( Uworld1001 < 210 ) then
		Talk(1,"","Xin lçi! B¹n ch­a lµm nhiÖm vô Chİnh tuyÕn Chİnh ph¸i t­¬ng øng víi ®¼ng cÊp, h·y ®Õn <color=red>§¹i Lı<color> t×m M¹c SÇu.")
	else
		Talk(1,"","Lµm 1 s¸t thñ, tr­íc khi hµnh ®éng cÇn ph¶i suy tİnh cho chu ®¸o! Kh«ng ph¶i ai trªn giang hå còng trë thµnh s¸t thñ næi tiÕng")
	end
end

function Uworld1050_zfz2()
	AddOwnExp(5000)
	nt_setTask(1050,20)
	Msg2Player("Ng¹o V©n T«ng b¶o b¹n ®Õn Thiªn Long tù ë §¹i Lı t×m Si T¨ng hái th¨m tin tøc.")
end

function Uworld1050_zfz3()
	AddOwnExp(5000)
	nt_setTask(1050,80)
	Msg2Player("Ng¹o V©n T«ng b¶o b¹n ®i Hoa S¬n ph¸i t×m TiÔn §Çu hái th¨m tin tøc.")
end

function Uworld1050_zfz4()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
	ex_add_zp_level20();
end

function Uworld1051_zfz2()
	AddOwnExp(15000)
	nt_setTask(1051,20)
	Msg2Player("Mé Dung BÊt Ky cÇn 1 viªn B¶o th¹ch thuéc tİnh Èn, Ng¹o V©n T«ng b¶o b¹n ®i Thµnh §« t×m H¹ Lan Chi.")
end

function Uworld1051_zfz3()
	Uworld1011 = nt_getTask(1011) --ÕıÅÉÖ§ÏßÉ±¹Ö±äÁ¿
	AddOwnExp(15000)
	nt_setTask(1051,80)
	nt_setTask(1011,10) --10ÎªÆô¶¯²ÎÊı£¬´«¸ø³ÌĞòÊµÏÖÅĞ¶ÏÉ±ËÀ¹ÖÎïµÄÊıÁ¿
	AddPlayerEvent(1)
	Msg2Player("Ng¹o V©n T«ng cho b¹n biÕt mét bİ mËt, «ng nghi ngê Ng« L·o th¸i bŞ kÎ thï h¹ ®éc. ¤ng ta b¶o b¹n lªn Phôc Ng­u S¬n ®¸nh 50 con Sãi xanh lÊy x­¬ng vÒ bµo chÕ thuèc.")
end

function Uworld1051_zfz4()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function Uworld1051_zfz5()
	AddSkillState( 509, 1, 0, 180);
	branchprize()	
	ex_add_zp_level30();
end

function Uworld1052_zfz2()
	Uworld1011 = nt_getTask(1011) --ÕıÅÉÖ§ÏßÉ±¹Ö±äÁ¿£¬ÉèÖÃÎª10£¬´«²ÎÊı¸ø³ÌĞòÅĞ¶Ï£¬±ÈÎä³¡pkµÄÅĞ¶Ï
	AddOwnExp(30000)
	nt_setTask(1011,10)
	nt_setTask(1052,20)
	Msg2Player("Ng¹o V©n T«ng b¶o b¹n ®Õn tû vâ tr­êng ®¸nh 1 trËn, b¹n c¶m thÊy thËt sù nguy hiÓm.")
end

function Uworld1052_zfz3()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function Uworld1052_zfz4()
	AddOwnExp(30000)
	nt_setTask(1052,100)
	Msg2Player("Ng¹o V©n T«ng cho b¹n biÕt Du S­¬ng T©n cã thÓ ®ang ë Thµnh §«.")
end

function Uworld1052_zfz5()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
	ex_add_zp_level40();
end

function Uworld1053_zfz3()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
	ex_add_zp_level50();
end

function allprize_zhengpai()
	Uworld196 = nt_getTask(196) --ÕıÅÉÈ«½±Àø
	local i=random(1,1200)
	if ( i >= 1 ) and ( i <= 99) then
		AddEventItem(490)
	elseif ( i >= 100 ) and ( i <= 199) then
		AddEventItem(491)
	elseif ( i >= 200 ) and ( i <= 299) then
		AddEventItem(492)
	elseif ( i >= 300 ) and ( i <= 399) then
		AddEventItem(493)
	elseif ( i >= 400 ) and ( i <= 499) then
		AddEventItem(494)
	elseif ( i >= 500 ) and ( i <= 599) then
		AddEventItem(495)
	elseif ( i >= 600 ) and ( i <= 699) then
		AddEventItem(496)
	elseif ( i >= 700 ) and ( i <= 799) then
		AddEventItem(497)
	elseif ( i >= 800 ) and ( i <= 899) then
		AddEventItem(498)
	elseif ( i >= 900 ) and ( i <= 999) then
		AddEventItem(499)
	elseif ( i >= 1000 ) and ( i <= 1099) then
		AddEventItem(500)
	elseif ( i >= 1100 ) and ( i <= 1200) then
		AddEventItem(501)
	end
	Msg2Player("Chóc mõng b¹n nhËn ®­îc 1 m¶nh Tµng B¶o ®å.")
	if ( Uworld1050 == 1000 ) and ( GetBit(GetTask(196),1) ~= 1 ) then
		AddGoldItem(0,179)
		SetTask(196,SetBit(GetTask(196),1,1))
	Msg2Player("Chóc mõng b¹n nhËn ®­îc 1  Kim Phong Tr¹c Liªn Quang")
	elseif ( Uworld1051 == 1000 )  and ( GetBit(GetTask(196),2) ~= 1) then
		AddGoldItem(0,180)
		SetTask(196,SetBit(GetTask(196),2,1))
	Msg2Player("Chóc mõng b¹n ®¹t ®­îc 1  Kim Phong C«ng CÈn Tam Th¸n.")
	elseif ( Uworld1052 == 1000 ) and ( GetBit(GetTask(196),3) ~= 1 ) then
		AddGoldItem(0,183)
		SetTask(196,SetBit(GetTask(196),3,1))
	Msg2Player("Chóc mõng b¹n nhËn ®­îc 1  Kim Phong Lan §×nh Ngäc")
	elseif ( Uworld1053 == 1000 ) and ( GetBit(GetTask(196),4) ~= 1 ) then
		AddGoldItem(0,185)
		SetTask(196,SetBit(GetTask(196),4,1))
		Msg2Player("Chóc mõng b¹n nhËn ®­îc 1 Kim Phong §ång T­íc Xu©n Th©m.")
	end	
	Msg2Player("B¹n ®· hoµn thµnh nhiÖm vô cña ®¼ng cÊp nµy.")
end

function Uworld1000_finishzhengpai()
	Uworld1000 = nt_getTask(1000)
	nt_setTask(1000,1000)
	Msg2Player("B¹n ®· hoµn thµnh nhiÖm vô s¬ nhËp.")
end

function no()

end

function Uworld1000_no1()
	Talk(1,"","Ng¹o V©n T«ng: Giang hå kh«ng ngõng dËy sãng, ng­¬i ph¶i cÈn thËn. Sau nµy cã r¶nh quay l¹i ®©y, ta cã vµi nhiÖm vô giao cho ng­¬i.")
end