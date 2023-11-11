-- ĞÂÈÎÎñÏµÍ³Ğ°ÅÉÖ§Ïß¹ÜÀínpc
-- BY£ºXIAOYANG£¨2005-1-17£©
 
 Include("\\script\\task\\newtask\\newtask_head.lua")
 Include("\\script\\task\\newtask\\branch\\branch_head.lua")
 Include("\\script\\task\\newtask\\branch\\branch_prize.lua")
 Include("\\script\\task\\newtask\\branch\\branch_problem.lua")
 Include("\\script\\task\\newtask\\education_setnpcpos.lua")
function task_tuobahuaichuan()
--------------------------------------------------------------------½ÌÑ§ÈÎÎñ------------------------------------------------------------------
	local curCamp = nt_getCamp()
	Uworld1000 = nt_getTask(1000)   --½ÌÑ§ÈÎÎñ±äÁ¿
	Uworld1003 = nt_getTask(1003)	 --Ğ°ÅÉÖ÷ÏßÈÎÎñ±äÁ¿
	Uworld189 = nt_getTask(189)
	Uworld1058 = nt_getTask(1058) --Ğ°ÅÉ20-30Ö§Ïß
	Uworld1059 = nt_getTask(1059) --Ğ°ÅÉ30-40Ö§Ïß
	Uworld1060 = nt_getTask(1060) --Ğ°ÅÉ40-50Ö§Ïß
	Uworld1061 = nt_getTask(1061) --Ğ°ÅÉ50-60Ö§Ïß
	Uworld1013 = nt_getTask(1013) --Ğ°ÅÉÖ§ÏßµÄÉ±¹ÖÈÎÎñ±äÁ¿
	Uworld198 = nt_getTask(198) --Ğ°ÅÉÈ«½±Àø
	local name = GetName()  
	if (	Uworld1000 > 0 ) and ( Uworld1000 < 1000 ) then
		if (( Uworld1000 == 300 ) or ( Uworld1000 == 310 )) and ( curCamp == 2 ) then 
			nt_setTask(1000,310) --»·½Ú16start
			Talk(3,"Uworld1000_xfz1",name..": Ngò Gia b¶o ta ®Õn, ®©y lµ th­ cña Ngò Gia!","Ng­êi cña Long Ngò? Hõm! H¾n cßn nhí ®Õn Th¸c mç nµy sao?","Ng­¬i cã thÓ cã thÓ d¹o ch¬i trong thµnh, dïng phİm Tab më b¶n ®å nhá ®Ó dÔ xem! Sau ®ã h·y ®Õn t×m ta!")
		elseif (( Uworld1000 == 320 ) or ( Uworld1000 == 330 )) and ( curCamp == 2 ) then
			nt_setTask(1000,330) --»·½Ú17start
			Talk(2,"Uworld1000_xfz2",name..": Ta ®· xem qua råi..","Tèt! B©y giê h·y ®i t×m Vâ L©m truyÒn nh©n!")
		elseif (( Uworld1000 == 420 ) or ( Uworld1000 == 430 )) and ( curCamp == 2 ) and ( Uworld1003 < 10 ) then
			nt_setTask(1000,430) --»·½Ú22start
			Talk(5,"Uworld1000_xfz3","VÒ råi µ! §©y lµ tói th­ cña ng­¬i! Xem xong ng­¬i tù biÕt ph¶i lµm g×!",name..":......Thay ta c¸m ¬n Ngò Gia.","H·y tù ®i c¸m ¬n! Tõ nay vÒ sau mçi khi hoµn thµnh nhiÖm vô chİnh tuyÕn ®Òu quay vÒ chç ta, ta cã vµi nhiÖm vô nhá giao cho ng­¬i, hoµn thµnh xong sÏ cã nh÷ng mãn quµ bÊt ngê tÆng ng­¬i. Ta quyÕt kh«ng ®Ó g· ®ã xem th­êng.",name..": §­îc! Ta nhí råi.","NhiÖm vô phe kh¸c ng­¬i còng cã thÓ lµm, cã thÓ ®­îc kh«ng İt ®iÓm kinh nghiÖm, chØ lµ hä cã thµnh kiÕn víi ng­¬i, nªn cã vµi mãn b¶o vËt kh«ng thÓ ®­a ng­¬i ®­îc. Ng­¬i cã thÓ vµo th«n trÊn t×m Long Ngò hái thö.")
		elseif ( Uworld1000 == 420 ) and ( curCamp == 2 ) and ( Uworld1003 > 10 ) then
			Talk(1,"Uworld1000_finishxiepai","Ng­¬i  ®· b¾t ®Çu nhËn nhiÖm vô c¸c phe, chç ta kh«ng gi÷ ®­îc ng­¬i n÷a, ng­¬i ®· häc ®­îc kh¸  nhiÒu råi, h·y tù m×nh ®i  ®i!")
		elseif (( Uworld1000 == 430 ) or ( Uworld1000 == 440 )) and ( curCamp == 2 ) and ( HaveCommonItem(6,1,131) == 0 ) and ( Uworld1003 < 10 ) then 
			Say("T¹i sao quay l¹i? Hay lµ ®Ó quªn tói th­ ë chç ta.",2,"Tu©n lÖnh!/Uworld1000_xfz4","Kh«ng ph¶i! ChØ lµ quay l¹i th¨m «ng mµ th«i!/Uworld1000_no3")
		else 
			Talk(1,"","QuyÒn khuynh Nam S¬n, Ch­ëng ®¶o B¾c H¶i, ng­¬i muèn ®Õn Tiªu côc µ? Nh¾c ng­¬i mét c©u, nÕu ng­¬i ®ang lµm <color=red>nhiÖm vô s¬ nhËp<color>, ng­¬i sÏ kh«ng cã c¸ch nµo tiÕp tôc lµm nhiÖm vô cña nh÷ng  ®¼ng cÊp kh¸c, h·y lµm hÕt nhiÖm vô s¬ nhËp ®i!")
		end
----------------------------------------------------------------------Ğ°ÅÉÖ§Ïß---------------------------------------------------------------	
	else
		if (( Uworld1058 == 1000 ) and ( GetBit(GetTask(198),1) ~= 1)) or (( Uworld1059 == 1000 ) and ( GetBit(GetTask(198),2) ~= 1)) or (( Uworld1060 == 1000 ) and ( GetBit(GetTask(198),3) ~= 1)) or  (( Uworld1061 == 1000 ) and ( GetBit(GetTask(198),4) ~= 1)) then
			Describe(DescLink_TuoBaHuaiChuan.."<#>:  Ta rÊt hµi lßng víi biÓu hiÖn cña ng­¬i, tÆng ng­¬i mãn b¶o vËt nµy!",1,"NhËn l·nh b¶o vËt/allprize_xiepai")
		elseif ( Uworld1061 == 110 ) or ( Uworld1061 == 120 ) then
			if ( GetLevel() >= 50 ) and ( GetLevel() <  60 ) then 
				nt_setTask(1061,120)
				Describe(
				DescLink_TuoBaHuaiChuan.."<#>: Tèt! ThŞnh Do·n ®· chÕt! §¹i Kim kh«ng cßn g× ph¶i lo l¾ng! Lµm rÊt hay! Lóc nµy, ng­¬i cã thÓ ®i ngao du s¬n thñy, l¸nh xa thÕ sù nhiÔu nh­¬ng <enter>",
				1,"KÕt thóc ®èi tho¹i/Uworld1061_xfz6")
			else 
				Talk(1,"Uworld1000_xfz88","Khi lµm nhiÖm vô gÆp vÊn ®Ò g×, cã thÓ Ên phİm <color=red>F12<color> ®Ó xem nhËt tr×nh. Trong ®ã chØ ghi l¹i c¸c b­íc mµ b¹n ®· thùc hiÖn qua!")
			end
		elseif ( Uworld1061 == 80 ) or ( Uworld1061 == 90 ) then
			if ( GetLevel() >= 50 ) and ( GetLevel() <  60 ) then 
				nt_setTask(1061,90)
				Describe(
				DescLink_TuoBaHuaiChuan.."<#>: ThËt phiÒn to¸i……<enter>"
				..name.."<#>: T­íng qu©n! ChuyÖn g× mµ ­u sÇu thÕ?<enter>T­¬ng D­¬ng thµnh lòy v÷ng vµng, binh hïng t­íng m¹nh. ThŞnh Do·n l¹i trİ dòng song toµn, chiÕn sù kĞo dµi cµng l©u, qu©n ta chi viÖn cµng khã. NÕu trêi vµo ®«ng, cµng cã nhiÒu kh¶ n¨ng bÊt lîi.<enter>"
				..name.."<#>: ı t­íng qu©n lµ?<enter> DiÖt ®­îc Sö ThŞnh Do·n, T­¬ng D­¬ng kh«ng ®¸nh mµ th¾ng!<enter>",
				1,"KÕt thóc ®èi tho¹i/Uworld1061_xfz5")
			else 
				Talk(1,"Uworld1000_xfz88","Khi lµm nhiÖm vô gÆp vÊn ®Ò g×, cã thÓ Ên phİm <color=red>F12<color> ®Ó xem nhËt tr×nh. Trong ®ã chØ ghi l¹i c¸c b­íc mµ b¹n ®· thùc hiÖn qua!")
			end
		elseif ( Uworld1061 == 60 ) or ( Uworld1061 ==70 ) then
			if ( GetLevel() >= 50 ) and ( GetLevel() <  60 ) then 
				nt_setTask(1061,70)
				Describe(
				DescLink_TuoBaHuaiChuan.."<#>: B¹n tr¶ lêi rÊt tèt!",1,"KÕt thóc ®èi tho¹i/Uworld1061_xfz4")
			else 
				Talk(1,"Uworld1000_xfz88","Khi lµm nhiÖm vô gÆp vÊn ®Ò g×, cã thÓ Ên phİm <color=red>F12<color> ®Ó xem nhËt tr×nh. Trong ®ã chØ ghi l¹i c¸c b­íc mµ b¹n ®· thùc hiÖn qua!")
			end
		elseif ( Uworld1061 == 40 ) or ( Uworld1061 == 50 ) then
			if ( GetLevel() >= 50 ) and ( GetLevel() <  60 ) then 
				nt_setTask(1061,50)
				Describe(
				DescLink_TuoBaHuaiChuan.."<#>: Ng­¬i ®· s½n sµng ch­a?",2,"B¾t ®Çu th«i!/branch_songjinproblem","§Ó ta suy nghÜ l¹i!/no")
			else 
				Talk(1,"Uworld1000_xfz88","Khi lµm nhiÖm vô gÆp vÊn ®Ò g×, cã thÓ Ên phİm <color=red>F12<color> ®Ó xem nhËt tr×nh. Trong ®ã chØ ghi l¹i c¸c b­íc mµ b¹n ®· thùc hiÖn qua!")
			end
		elseif (( Uworld1061 == 20 ) or ( Uworld1061 == 30 )) and ( Uworld1013 == 20 ) then
			if ( GetLevel() >= 50 ) and ( GetLevel() <  60 ) then 
				nt_setTask(1061,30)
				Describe(
				name.."<#>: T­íng qu©n! §iÓm tİch lòy T¹i h¹ ®· lÊy nhiÒu råi!<enter>"
				..DescLink_TuoBaHuaiChuan.."<#>: Khµ khµ! Qu¶ nhiªn lîi h¹i! Hoµng Th­îng ®ang muèn gÆp ng­¬i ®Ó hái vÒ kiÕn thøc qu©n sù! Ta thö hái ng­¬i tr­íc!<enter>",
				1,"KÕt thóc ®èi tho¹i/Uworld1061_xfz3")
			else 
				Talk(1,"Uworld1000_xfz88","Khi lµm nhiÖm vô gÆp vÊn ®Ò g×, cã thÓ Ên phİm <color=red>F12<color> ®Ó xem nhËt tr×nh. Trong ®ã chØ ghi l¹i c¸c b­íc mµ b¹n ®· thùc hiÖn qua!")
			end
		elseif ( Uworld1060 == 110 ) or ( Uworld1060 == 120 )then
			if ( GetLevel() >= 40 ) and ( GetLevel() <  50 ) then 
				nt_setTask(1060,120)
				Describe(
				DescLink_TuoBaHuaiChuan.."<#>: Trªn ®êi nµy e r»ng kh«ng cßn chuyÖn g× cã thÓ c¶n b­íc ch©n ng­¬i!",
				1,"KÕt thóc ®èi tho¹i/Uworld1060_xfz5")
			else 
				Talk(1,"Uworld1000_xfz88","Khi lµm nhiÖm vô gÆp vÊn ®Ò g×, cã thÓ Ên phİm <color=red>F12<color> ®Ó xem nhËt tr×nh. Trong ®ã chØ ghi l¹i c¸c b­íc mµ b¹n ®· thùc hiÖn qua!")
			end
		elseif (( Uworld1060 == 80 ) or ( Uworld1060 == 90 )) and ( Uworld1013 == 20 ) then
			if ( GetLevel() >= 40 ) and ( GetLevel() <  50 ) then 
				nt_setTask(1060,90)
				Describe(
				DescLink_TuoBaHuaiChuan.."<#>:Ha ha! Giái l¾m! Qu¶ nhiªn ta kh«ng nh×n lÇm ng­êi! <enter>"
				..name.."<#>: ChØ th¾ng mét trËn nµo cã ®¸ng g×!<enter>Ng­¬i cã biÕt cã bän Nam Tèng hoang mang thÕ nµo ch­a!?<enter>"
				..name.."<#>:Kh«ng biÕt.<enter>ChiÕn tranh gÇn kÒ, lßng ng­êi ho¶ng lo¹n, ®­a ng­¬i ra n¬i ®Çu sãng ngän giã, lßng ta c¶m thÊy ¸y n¸y!<enter>"
				..name.."<#>: Lµ t¹i h¹ muèn x¶ th©n v× n­íc.<enter>Tèt! Ng­êi ®Ò nghŞ më L«i §µi kh«ng ai kh¸c h¬n lµ §¹i hµo NguyÔn Minh ViÔn, h¾n vèn lµ ®Ö tö tôc gia ThiÕu L©m tù. Khi h¾n ra ngoµi thµnh T­¬ng D­¬ng lµ c¬ héi tèt ®Ó tiªu diÖt. NÕu giÕt ®­îc h¾n sÏ h¹ thÊp ı chİ ®Êu tranh cña qu©n d©n Tèng Quèc. Ta ®· suy tİnh kü, chØ cã ng­¬i mãi cã thÓ ®¶m nhËn träng tr¸ch nµy.<enter>",
				1,"KÕt thóc ®èi tho¹i/Uworld1060_xfz4")
			else 
				Talk(1,"Uworld1000_xfz88","Khi lµm nhiÖm vô gÆp vÊn ®Ò g×, cã thÓ Ên phİm <color=red>F12<color> ®Ó xem nhËt tr×nh. Trong ®ã chØ ghi l¹i c¸c b­íc mµ b¹n ®· thùc hiÖn qua!")
			end
		elseif ( Uworld1060 == 60 ) or ( Uworld1060 == 70 ) then
			if ( GetLevel() >= 40 ) and ( GetLevel() <  50 ) then 
				nt_setTask(1060,70)
				Describe(name.."<#>: T­íng qu©n, t¹i h¹ ®İch th©n tham gia 1 trËn l«i ®µi! ThËt nguy hiÓm! May mµ t¹i h¹ chiÕn th¾ng!<enter>"
				..DescLink_TuoBaHuaiChuan.."<#>: ThËt kh«ng? VËy danh hiÖu  Thiªn h¹ vâ dòng cña §¹i Kim ta ®Ó ë ®©u? H·y ®¸nh th¾ng mét trËn cho ta, quyÕt ph¶i giµnh chiÕn th¾ng ®Ó mäi ng­êi biÕt r»ng thiªn h¹ nµy lµ cña ai!<enter>",
				1,"KÕt thóc ®èi tho¹i/Uworld1060_xfz3")
			else 
				Talk(1,"Uworld1000_xfz88","Khi lµm nhiÖm vô gÆp vÊn ®Ò g×, cã thÓ Ên phİm <color=red>F12<color> ®Ó xem nhËt tr×nh. Trong ®ã chØ ghi l¹i c¸c b­íc mµ b¹n ®· thùc hiÖn qua!")
			end
		elseif ( Uworld1059 == 110 ) or ( Uworld1059 == 120 ) then
			if ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) then 
				nt_setTask(1059,120)
				Describe(
				DescLink_TuoBaHuaiChuan.."<#>: Ng­êi ®· b¾t ®­îc råi, giái l¾m! Ng­¬i ®· lÆp ®­îc ®¹i c«ng, ta sÏ t­ëng th­ëng xøng ®¸ng!<enter>",
				1,"KÕt thóc ®èi tho¹i/Uworld1059_xfz5")
			else 
				Talk(1,"Uworld1000_xfz88","Khi lµm nhiÖm vô gÆp vÊn ®Ò g×, cã thÓ Ên phİm <color=red>F12<color> ®Ó xem nhËt tr×nh. Trong ®ã chØ ghi l¹i c¸c b­íc mµ b¹n ®· thùc hiÖn qua!")
			end
		elseif ( Uworld1059 == 60 ) or ( Uworld1059 == 70 ) then
			if ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) then 
				nt_setTask(1059,70)
				Describe(
				name.."<#>: Th¸c B¹t T­íng qu©n, qu¶ kh«ng ngoµi dù ®o¸n! Thi Nghi Sinh ®ang cã ©m m­u lµm néi gi¸n!<enter>"
				..DescLink_TuoBaHuaiChuan.."<#>: §å ph¶n quèc!<enter>"
				..name.."<#>: T­íng qu©n giËn d÷.<enter>…Cãc¸ch  råi! Ng­¬i ®i L©m An mét chuyÕn, bİ mËt b¾t h¾n vÒ ®©y cho ta xö lı.<enter>"
				..name.."<#>:Tu©n lÖnh.<enter>L©m An thñ thµnh nghiªm ngÆt, kh«ng ph¶i nh­ nh÷ng n¬i ng­¬i ®· tõng ®i qua, lÇn hµnh ®éng nµy e r»ng sÏ gÆp khã kh¨n kh«ng İt!<enter>"
				..name.."<#>: Khã kh¨n thö lßng ng­êi, kh«ng thµnh c«ng còng thµnh nh©n.<enter>ChuyÖn nµy thµnh b¹i kh«ng quan träng. Ta ®· cµi s½n mËt th¸m ë L©m An, h·y ®i Töu ®iÕm t×m Tóy H¸n! KÎ nµy ngµy ngµy ®¾m ch×m men r­îu, nh­ng kh«ng ai ngê r»ng h¾n lµ ng­êi cña ta.<enter>",
				1,"KÕt thóc ®èi tho¹i/Uworld1059_xfz4")
			else 
				Talk(1,"Uworld1000_xfz88","Khi lµm nhiÖm vô gÆp vÊn ®Ò g×, cã thÓ Ên phİm <color=red>F12<color> ®Ó xem nhËt tr×nh. Trong ®ã chØ ghi l¹i c¸c b­íc mµ b¹n ®· thùc hiÖn qua!")
			end
		elseif (( Uworld1059 == 20 ) or ( Uworld1059 == 30 )) and ( Uworld1013 == 20 ) then
			if ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) then 
				nt_setTask(1059,30)
				Describe(name.."<#>: Yªu cÇu cña T­íng qu©n, t¹i h¹ lµm ®­îc nh­ng cßn cã chót nghi hoÆc, xin gi¶i ®¸p cÆn kÏ!<enter>"
				..DescLink_TuoBaHuaiChuan.."<#>:Ha ha ha! Doanh Thiªn Hé chİnh lµ ta ®©y!<enter>"
				..name.."<#>: C¸c h¹ xøng ®¸ng lµ mét T­íng qu©n.<enter>NÕu muèn ®­îc nh­ ta hiÖn giê ®èi víi ng­¬i mµ nãi dÔ nh­ trë bµn tay, chØ cÇn lµm tèt chuyÖn ta giao, ta nhÊt ®Şnh tiÕn cö ng­¬i víi Hoµng th­îng!<enter>"
				..name.."<#>: Lµm tèt l¾m!.<enter>HiÖn ta cã mét nhiÖm vô träng ®¹i giao cho ng­¬i, kh¾p ph­¬ng b¾c chØ cã 5 ng­êi nµy biÕt ®­îc chuyÖn nµy.<enter>"
				..name.."<#>: Lµ chuyÖn g×?<enter>Theo tin th¸m b¸o, gÇn ®©y Sø gi¶ Thi Nghi Sinh do §¹i Kim ph¸i tíi Nam Tèng cã nhiÒu hµnh ®éng kh¶ nghi, kh¶ n¨ng cã m­u ®å ph¶n quèc, h¾n biÕt qu¸ nhiÒu ®iÒu c¬ mËt cña §¹i Kim ta. H·y ®i T­¬ng D­¬ng t×m  L­u UÈn Cæ bµn c¸ch thñ ti"
				..name.."<#>: §­îc! Ngµy mai ta hµnh ®éng. <enter>Kh«ng! LËp tøc hµnh ®éng, t×nh h×nh dÇu s«i löa báng, tÊt c¶ tr«ng chê vµo ng­¬i!<enter>",
				1,"KÕt thóc ®èi tho¹i/Uworld1059_xfz3")
			else 
				Talk(1,"Uworld1000_xfz88","Khi lµm nhiÖm vô gÆp vÊn ®Ò g×, cã thÓ Ên phİm <color=red>F12<color> ®Ó xem nhËt tr×nh. Trong ®ã chØ ghi l¹i c¸c b­íc mµ b¹n ®· thùc hiÖn qua!")
			end
		elseif ( Uworld1058 == 90 ) or ( Uworld1058 == 100 ) then
			if ( GetLevel() >= 20 ) and ( GetLevel() <  30 ) then 
				nt_setTask(1058,100)
				Describe(DescLink_TuoBaHuaiChuan.."<#>:Cã kÎ gi¶ d¹ng ThÈm Phong? Ta cÇn ph¶i ®i xem thùc h­, t¹m thêi nhiÖm vô cña ng­¬i ®· hoµn thµnh!<enter>",1,"KÕt thóc ®èi tho¹i/Uworld1058_xfz4")
			else 
				Talk(1,"Uworld1000_xfz88","Khi lµm nhiÖm vô gÆp vÊn ®Ò g×, cã thÓ Ên phİm <color=red>F12<color> ®Ó xem nhËt tr×nh. Trong ®ã chØ ghi l¹i c¸c b­íc mµ b¹n ®· thùc hiÖn qua!")
			end																																			
		elseif (( Uworld1058 == 20 ) or ( Uworld1058 == 30 ))  and ( Uworld1013 == 20 ) then 
			if ( GetLevel() >= 20 ) and ( GetLevel() <  30 ) then 
				nt_setTask(1058,30)
				Describe(DescLink_TuoBaHuaiChuan.."<#>: Ng­¬i thËt lîi h¹i! Xøng danh nam tö §¹i Kim!<enter>Víi tµi n¨ng nh­ ng­¬i, ta sÏ giao phã cho ng­¬i mét chuyÖn träng ®¹i.<enter>"
				..name.."<#>: Xin tiªn sinh cø nãi.<enter>Ng­¬i ®· ®i Ba Thôc, ch¾c kh«ng cßn l¹ g× víi Thµnh §«. Mau mang lÖnh bµi cña ta x©m nhËp Thµnh §« t×m Tr©u Tr­êng Cöu, lµ mËt th¸m do §¹i Kim ta ph¸i tíi. T×m ®­îc h¾n, lËp tøc cÇm vµi mãn ®å ra khái thµnh, chËm trÔ e r»ng kh",
				1,"KÕt thóc ®èi tho¹i/Uworld1058_xfz3")
			else 
				Talk(1,"Uworld1000_xfz88","Khi lµm nhiÖm vô gÆp vÊn ®Ò g×, cã thÓ Ên phİm <color=red>F12<color> ®Ó xem nhËt tr×nh. Trong ®ã chØ ghi l¹i c¸c b­íc mµ b¹n ®· thùc hiÖn qua!");
			end
		elseif ( GetLevel() >= 20) then
			Say("Muèn t×m mét c«ng viÖc võa ı µ? ChuyÖn nhá th«i mµ!",3,"T¹i h¹ muèn lµm nhiÖm vô chİnh tuyÕn Tµ ph¸i tr­íc!/Uworld1000_xfz8","T¹i h¹ muèn nhËn nhiÖm vô phô tuyÕn Tµ ph¸i!/Uworld1000_xfz88","KÎ nh­ ng­¬i ai mµ kh«ng biÕt, ai thÌm mµng tíi nhiÖm vô cña ng­¬i?/Uworld1000_no3")
		else
			Talk(1,"","Lµm g× ®ã? Mau ®i ®i! Ta kh«ng cã thêi gian mµ ®Ó m¾t tíi ng­¬i! Cã ®iÒu g× ch­a hiÓu, Ên phİm <color=red>F12<color>®Ó xem.")
		end
	end
end



function Uworld1000_xfz8()
	Uworld1000 = nt_getTask(1000)
	Uworld1003 = nt_getTask(1003)
	if ( Uworld1003 < 10 ) and ( Uworld1000 == 0 ) then 
		Talk(1,"","H·y ®Õn T©n Thñ th«n t×m Long Ngò ")
		Msg2Player("Ng¹o V©n T«ng b¶o b¹n vµo T©n Thñ Th«n t×m Long Ngò, Y sÏ giao vµi nhiÖm vô cho b¹n.")		
	elseif ( Uworld1000 ~= 0 ) and ( Uworld1000 ~= 1000 ) then
		Talk(1,"","Ng­¬i vÉn cßn lµm nhiÖm vô s¬ nhËp, lµm xong ®i! Long Ngò sÏ giao cho ng­¬i nhiÖm vô kh¸c, ®õng nãng véi!")
	elseif ( Uworld1003 ~= 0 ) then
		Talk(1,"","Nµy b»ng h÷u, ch¼ng ph¶i ng­¬i ®ang lµm nhiÖm vô Tµ ph¸i chİnh tuyÕn ®ã sao? Kh«ng ph¶i trªu ghÑo ta chø! Ta lµ ng­êi thËt thµ, ®õng g¹t ta! ThËt lµ….")
	else
		Talk(1,"","NhiÖm vô Chİnh tuyÕn lµ sau khi b¹n ®¹t ®Õn cÊp nhÊt ®Şnh míi cã thÓ tiÕp nhËn. ChØ cÇn ®¼ng cÊp nh©n vËt trªn 20 lµ cã thÓ tiÕp nhËn. NÕu hoµn thµnh......sÏ cã gi¶i th­ëng h¬n mong ®îi.")
	end
end

function Uworld1000_xfz88()
	Uworld1058 = nt_getTask(1058)
	Uworld1059 = nt_getTask(1059)
	Uworld1060 = nt_getTask(1060)
	Uworld1061 = nt_getTask(1061)
	Describe(DescLink_TuoBaHuaiChuan.."<#>: §êi ng­êi cã mÊy ai an phËn mµ ®­îc giµu cã? NghÜ kü ®i, h·y theo ta hµnh sù!",6,
	"Ta muèn t×m hiÓu c¸ch lµm nhiÖm vô Phô tuyÕn/Uworld1000_xfz7" ,
	"Ta muèn lµm nhiÖm vô tõ cÊp 20 ®Õn 29/Uworld1058_xfz1",
	"Ta muèn lµm nhiÖm vô cÊp 30 ®Õn 39/Uworld1059_xfz1",
	"Ta muèn lµm nhiÖm vô cÊp 40 ®Õn 49/Uworld1060_xfz1",
	"Ta muèn lµm nhiÖm vô cÊp 50 ®Õn 59/Uworld1061_xfz1",
	"Hay lµ sau nµy h·y lµm!/no")
end

function Uworld1000_xfz7()
	Describe(DescLink_TuoBaHuaiChuan.."<#>:  NhiÖm vô Phô tuyÕn trªn c¬ b¶n lµ nhiÖm vô Chİnh tuyÕn, khi ®¹t ®Õn ®¼ng cÊp nhÊt ®Şnh míi cã thÓ tiÕp nhËn. Vİ dô lóc ®¼ng cÊp b¹n lµ 32, b¹n ph¶i tiÕp nhËn nhiÖm vô Chİnh tuyÕn cÊp 30 tr­íc, sau ®ã míi cã thÓ tiÕp nhËn nhiÖm vô phô tuyÕn.Tr­íc khi",1,"KÕt thóc ®èi tho¹i/no")
end

function Uworld1058_xfz1()
	Uworld1058 = nt_getTask(1058) --Ğ°ÅÉ20-30¼¶Ö®¼äµÄÖ§ÏßÈÎÎñ±äÁ¿
	Uworld1003 = nt_getTask(1003) --Ğ°ÅÉÖ÷ÏßÈÎÎñ±äÁ¿
	local name = GetName()  
	if ( Uworld1003 >= 20 ) and ( GetLevel() >= 20 ) and ( GetLevel() <  30 ) and (( Uworld1058 == 0 ) or ( Uworld1058 == 10 )) then
		nt_setTask(1058,10) 
		Describe(
		DescLink_TuoBaHuaiChuan.."<#>:  Vâ L©m Nh©n sÜ Trung Nguyªn lu«n xem th­êng §¹i Kim, cho r»ng chóng ta kh«ng ®ñ søc chiÕn th¾ng.<enter>"
		..name.."<#>:  NÕu kh«ng ph¶i néi bé Tèng triÒu chia rÏ, chóng ta muèn th¾ng kh«ng ph¶i lµ chuyÖn dÔ.<enter> Tèng triÒu vÉn cßn nhiÒu t­íng giái, cho nªn chóng ta ch­a yªn t©m ®­îc. Muèn h­ëng ph­íc e r»ng ph¶i chê sau khi ®o¹t ®­îc s¬n hµ cña §¹i Tèng.<enter>"
		..name.."<#>:  Ta vÉn cßn trÎ, Th¸c B¹t tiªn sinh cã g× xin chØ gi¸o.<enter>§¹i Kim s¾p triÓn khai qu©n víi quy m« lín, ta muèn ng­¬i giái h¬n n÷a, hay lµ ®i §­êng M«n mét chuyÕn, ®¸nh b¹i 50 con H¾c DiÖp HÇu.<enter>",
		1,"KÕt thóc ®èi tho¹i/Uworld1058_xfz2")
	elseif ( GetLevel() < 20 ) then
		Talk(1,"","Xin lçi! §¼ng cÊp cña ng­¬i ch­a ®¹t yªu cÇu cña nhiÖm vô, ®îi ®Õn cÊp 20, sau khi tiÕp nhËn nhiÖm vô Chİnh tuyÕn t­¬ng øng míi ®Õn t×m ta.")
	elseif ( GetLevel() >= 30 ) then
		Talk(1,"","Xin lçi! §¼ng cÊp cña b¹n v­ît qu¸ yªu cÇu cña nhiÖm vô, kh«ng thÓ tiÕp nhËn nhiÖm vô.")
	elseif ( Uworld1003 < 20 ) then
		Talk(1,"","Xin lçi! B¹n ch­a lµm  nhiÖm vô Chİnh tuyÕn Tµ ph¸i t­¬ng øng víi ®¼ng cÊp, h·y ®Õn <color=red>Chu Tiªn TrÊn<color> t×m V©n Nhi")
	else
		Talk(1,"","VËn mÖnh ®Êt n­íc n»m trong tay chóng ta, chØ cÇn ng­¬i mét lßng phông sù ")
	end
end

function Uworld1058_xfz2()
	Uworld1013 = nt_getTask(1013)
	AddOwnExp(5000)
	nt_setTask(1058,20)
	nt_setTask(1013,10)
	AddPlayerEvent(4) 
	Msg2Player("Th¸c B¹t Hoµi Xuyªn b¶o b¹n ®i §­êng M«n Thµnh §« ®¸nh 50 con H¾c DiÖp HÇu.")
end

function Uworld1058_xfz3()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function Uworld1058_xfz4()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
	ex_add_xp_level20();
end

function Uworld1059_xfz1()
	Uworld1059 = nt_getTask(1059) --Ğ°ÅÉ30-40¼¶Ö®¼äµÄÖ§ÏßÈÎÎñ±äÁ¿
	Uworld1003 = nt_getTask(1003) --Ğ°ÅÉÖ÷ÏßÈÎÎñ±äÁ¿
	local name = GetName()  
	if ( Uworld1003 >= 110 ) and ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) and (( Uworld1059 == 0 ) or ( Uworld1059 == 10 )) then
		nt_setTask(1059,10) 
		Describe(
		name.."<#>:  Th¸c B¹t tiªn sinh, cuèi cïng lµ chuyÖn g× vËy, ta tõ chç Tr©u Tr­êng Cöu lÊy ®­îc MËt tŞch da dª,   h¾n b¶o ta ®i D­¬ng Ch©u t×m ThÈm Phong, trªn ®­êng ®Õn ®ã bŞ Binh sÜ Nam Tèng ¸m to¸n.<enter>"
		..DescLink_TuoBaHuaiChuan.."<#>:  ¥? ThÈm Phong ®· ®Ó ng­¬i ph¸t hiÖn, h¾n ta sao l¹i bÊt cÈn thÕ. Tèt chuyÖn nµy nãi ra dµi dßng l¾m còng kh«ng thÓ ®Ó ng­êi kh¸c biÕt, ng­¬i ph¶i ®i Vò Di S¬n ®¸nh 50 con Sãi vµng, nÕu kh«ng ng­¬i kh«ng ®¸ng ®­îc ta giao cho nhiÖm vô.<enter>",
		1,"KÕt thóc ®èi tho¹i/Uworld1059_xfz2")
	elseif ( GetLevel() < 30 ) then
		Talk(1,"","Xin lçi! §¼ng cÊp cña ng­¬i ch­a ®¹t yªu cÇu cña nhiÖm vô, ®îi ®Õn cÊp 30, sau khi tiÕp nhËn nhiÖm vô Chİnh tuyÕn t­¬ng øng míi ®Õn t×m ta.")
	elseif ( GetLevel() >= 40 ) then
		Talk(1,"","Xin lçi! §¼ng cÊp cña b¹n v­ît qu¸ yªu cÇu cña nhiÖm vô, kh«ng thÓ tiÕp nhËn nhiÖm vô.")
	elseif ( Uworld1003 < 100 ) then
		Talk(1,"","Xin lçi! B¹n ch­a lµm  nhiÖm vô Chİnh tuyÕn Tµ ph¸i t­¬ng øng víi ®¼ng cÊp, h·y ®Õn <color=red>Chu Tiªn TrÊn<color> t×m V©n Nhi")
	else
		Talk(1,"","VËn mÖnh ®Êt n­íc n»m trong tay chóng ta, chØ cÇn ng­¬i mét lßng phông sù ")
	end
end

function Uworld1059_xfz2()
	Uworld1013 = nt_getTask(1013)
	AddOwnExp(15000)
	nt_setTask(1059,20)
	nt_setTask(1013,10)
	AddPlayerEvent(5) 
	Msg2Player("Th¸c B¹t Hoµi Xuyªn b¶o b¹n ®i Vò Di S¬n ®¸nh 10 con Sãi vµng.")
end

function Uworld1059_xfz3()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function Uworld1059_xfz4()
	AddOwnExp(15000)
	nt_setTask(1059,80) 
	Msg2Player("Th¸c B¹t Hoµi Xuyªn b¶o b¹n ®i L©m An t×m tªn MËt th¸m Èn nÊp ®· l©u, ng­êi nµy th­êng gi¶ d¹ng say xØn bªn töu lÇu.")	
end

function Uworld1059_xfz5()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
	ex_add_xp_level30();
end

function Uworld1060_xfz1()
	Uworld1060 = nt_getTask(1060) --Ğ°ÅÉ40-50¼¶Ö®¼äµÄÖ§ÏßÈÎÎñ±äÁ¿
	Uworld1003 = nt_getTask(1003) --Ğ°ÅÉÖ÷ÏßÈÎÎñ±äÁ¿
	if ( Uworld1003 >= 210 ) and ( GetLevel() >= 40 ) and ( GetLevel() <  50 ) and (( Uworld1060 == 0 ) or ( Uworld1060 == 10 )) then
		nt_setTask(1060,10) 
		Describe(
		DescLink_TuoBaHuaiChuan.."<#>:  Nghe nãi gÇn ®©y Nam Tèng tæ chøc thi ®Êu l«i ®µi, ®­îc biÕt cã nhiÒu cao thñ Èn c­ ®· l©u nay l¹i xuÊt hiÖn, bªn trong ®ã ch¾c cã Èn t×nh, ng­¬i ®i T­¬ng D­¬ng t×m L­u UÈn Cæ hái th¨m t×nh h×nh.<enter>",
		1,"KÕt thóc ®èi tho¹i/Uworld1060_xfz2")
	elseif ( GetLevel() < 40 ) then
		Talk(1,"","Xin lçi! §¼ng cÊp cña ng­¬i ch­a ®¹t yªu cÇu cña nhiÖm vô, ®îi ®Õn cÊp 40, sau khi tiÕp nhËn nhiÖm vô Chİnh tuyÕn t­¬ng øng míi ®Õn t×m ta.")
	elseif ( GetLevel() >= 50 ) then
		Talk(1,"","Xin lçi! §¼ng cÊp cña b¹n v­ît qu¸ yªu cÇu cña nhiÖm vô, kh«ng thÓ tiÕp nhËn nhiÖm vô.")
	elseif ( Uworld1003 < 200 ) then
		Talk(1,"","Xin lçi! B¹n ch­a lµm  nhiÖm vô Chİnh tuyÕn Tµ ph¸i t­¬ng øng víi ®¼ng cÊp, h·y ®Õn <color=red>Chu Tiªn TrÊn<color> t×m V©n Nhi")
	else
		Talk(1,"","VËn mÖnh ®Êt n­íc n»m trong tay chóng ta, chØ cÇn ng­¬i mét lßng phông sù ")
	end
end

function Uworld1060_xfz2()
	AddOwnExp(30000)
	nt_setTask(1060,20) 
	Msg2Player("Th¸c B¹t Hoµi Xuyªn b¶o b¹n ®i t×m L­u UÈn Cæ ®iÒu tra t×nh h×nh Tèng triÒu DiÔn vâ tr­êng.")	
end

function Uworld1060_xfz3()
	Uworld1013 = nt_getTask(1013)
	AddOwnExp(30000)
	nt_setTask(1013,10)
	nt_setTask(1060,80) 
	Msg2Player("Th¸c B¹t Hoµi Xuyªn b¶o b¹n ®i DiÔn vâ tr­êng ®¸nh mét trËn v× uy danh cña §¹i Kim.")	
end

function Uworld1060_xfz4()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function Uworld1060_xfz5()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
	ex_add_xp_level40();
end

function Uworld1061_xfz1()
	Uworld1061 = nt_getTask(1061) --Ğ°ÅÉ50-60¼¶Ö®¼äµÄÖ§ÏßÈÎÎñ±äÁ¿
	Uworld1003 = nt_getTask(1003) --Ğ°ÅÉÖ÷ÏßÈÎÎñ±äÁ¿
	local name = GetName()  
	if ( Uworld1003 >= 300 ) and ( GetLevel() >= 50 ) and ( GetLevel() <  60 ) and (( Uworld1061 == 0 ) or ( Uworld1061 == 10 )) then
		nt_setTask(1061,10) 
		Describe(
		DescLink_TuoBaHuaiChuan.."<#>:  Ta kh«ng biÕt cßn g× cã thÓ lµm khã ng­¬i ®­îc.<enter>"
		..name.."<#>:  ¤ng qu¸ ®Ò cao ta råi.<enter> Ta ®­¬ng nhiªn gi÷ lêi høa n¨m x­a, Hoµn Nhan Kh¸nh Hy ®· vµo triÒu t©u víi Hoµng Th­îng phong ng­¬i lµm B×nh Nam Qu©n §« Th¸i HiÖu Uı.<enter>"
		..name.."<#>:  T¹ chñ long ©n.<enter>Víi c«ng lao mµ ng­¬i lËp ®­îc bao nhiªu ®©y cã lµ g×. Kh¸nh Hy ®¹i nh©n chuÈn bŞ vµo triÒu bÈm Hoµng Th­îng phong ng­¬i lµm Qu¶ NghŞ §« Uı. Nh­ng v× ng­¬i ch­a lËp c«ng e r»ng mäi ng­êi bµn t¸n. H·y ®Õn chiÕn tr­êng Tèng Kim ®¸nh mét trËn, lÊy 200 ®iÓm tİch lòy, cho mäi ng­êi biÕt b¶n lÜnh cña ng­¬i.<enter>",
		1,"KÕt thóc ®èi tho¹i/Uworld1061_xfz2")
	elseif ( GetLevel() < 50 ) then
		Talk(1,"","Xin lçi! §¼ng cÊp cña ng­¬i ch­a ®¹t yªu cÇu cña nhiÖm vô, ®îi ®Õn cÊp 50, sau khi tiÕp nhËn nhiÖm vô Chİnh tuyÕn t­¬ng øng míi ®Õn t×m ta.")
	elseif ( GetLevel() >= 60 ) then
		Talk(1,"","Xin lçi! §¼ng cÊp cña b¹n v­ît qu¸ yªu cÇu cña nhiÖm vô, kh«ng thÓ tiÕp nhËn nhiÖm vô.")
	elseif ( Uworld1003 < 300 ) then
		Talk(1,"","Xin lçi! B¹n ch­a lµm  nhiÖm vô Chİnh tuyÕn Tµ ph¸i t­¬ng øng víi ®¼ng cÊp, h·y ®Õn <color=red>Chu Tiªn TrÊn<color> t×m V©n Nhi")
	else
		Talk(1,"","VËn mÖnh ®Êt n­íc n»m trong tay chóng ta, chØ cÇn ng­¬i mét lßng phông sù ")
	end
end

function Uworld1061_xfz2()
	Uworld1013 = nt_getTask(1013)
	AddOwnExp(60000)
	nt_setTask(1013,10)
	nt_setTask(1061,20)  
	Msg2Player("Th¸c B¹t Hoµi Xuyªn ®· tiÕn cö b¹n lµm Qu¶ NghŞ §« Uı, nh­ng b¹n cßn thiÕu c«ng lao, b¶o b¹n tham gia ®¹i chiÕn Tèng Kim, ®¹t 200 ®iÓm tİch lòy.")	
end

function Uworld1061_xfz3()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function Uworld1061_xfz4()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function Uworld1061_xfz5()
	AddOwnExp(30000)
	nt_setTask(1061,100)  
	Msg2Player("Qu©n §¹i Kim Nam h¹, T­¬ng D­¬ng l©m nguy, b¹n phông mÖnh ®i giÕt Sö ThŞnh Do·n.")	
end

function Uworld1061_xfz6()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
	ex_add_xp_level50();
end

function Uworld1000_xfz1()
	AddOwnExp(1000)
	nt_setTask(1000,320) --»·½Ú16end 
	Msg2Player("Th¸c B¹t Hoµi Xuyªn b¶o b¹n vµo thµnh nghØ ng¬i!")	
end

function Uworld1000_xfz2()
	AddOwnExp(1000)
	nt_setTask(1000,340) --»·½Ú17end
	Msg2Player("Th¸c B¹t Hoµi Xuyªn b¶o b¹n ®i t×m Vâ L©m TruyÒn Nh©n.")
	seteducationnpcpos()	
end

function Uworld1000_xfz3()
	AddItem(6,1,131,1,0,0,0)  --Ôö¼ÓÁúÎåµÄ°ü¸¤
	nt_setTask(189,10)
	AddOwnExp(20000)
	nt_setTask(1000,440) --»·½Ú22end
	Msg2Player("B¹n nhËn ®­îc 1 tói th­, Th¸c B¹t Hoµi Xuyªn b¶o b¹n mau t×m ng­êi cÇn t×m.")	
end

function Uworld1000_xfz4()
  
	AddItem(6,1,131,1,0,0,0)  --Ôö¼ÓÁúÎåµÄ°ü¸¤
	nt_setTask(189,10)
	Msg2Player("B¹n nhËn ®­îc 1 tói th­, Th¸c B¹t Hoµi Xuyªn b¶o b¹n mau t×m ng­êi cÇn t×m.")	
end

function Uworld1000_xfz5()
	Talk(1,"","H·y ®Õn T©n Thñ th«n t×m Long Ngò ")
	Msg2Player("Th¸c B¹t Hoµi Xuyªn b¶o b¹n ®Õn T©n Thñ th«n t×m Long Ngò, y sÏ giao nhiÖm vô cho b¹n.")	
end

function Uworld1000_no3()
	Talk(1,"","Giang hå ch¼ng khi sãng yªn giã lÆng. Ng­¬i hµnh tÈu giang hå ph¶i cÈn thËn. Sau sÏ quay l¹i ®©y, ta cã nhiÖm vô giao cho ng­¬i.")
end

function allprize_xiepai()
	Uworld198 = nt_getTask(198) --ÕıÅÉÈ«½±Àø
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
	if ( Uworld1058 == 1000 ) and ( GetBit(GetTask(198),1) ~= 1 ) then
		AddGoldItem(0,179)
		SetTask(198,SetBit(GetTask(198),1,1))
	Msg2Player("Chóc mõng b¹n nhËn ®­îc 1  Kim Phong Tr¹c Liªn Quang")
	elseif ( Uworld1059 == 1000 ) and ( GetBit(GetTask(198),2) ~= 1) then
		AddGoldItem(0,180)
		SetTask(198,SetBit(GetTask(198),2,1))
	Msg2Player("Chóc mõng b¹n ®¹t ®­îc 1  Kim Phong C«ng CÈn Tam Th¸n.")
	elseif ( Uworld1060 == 1000 ) and ( GetBit(GetTask(198),3) ~= 1 ) then
		AddGoldItem(0,183)
		SetTask(198,SetBit(GetTask(198),3,1))
	Msg2Player("Chóc mõng b¹n nhËn ®­îc 1  Kim Phong Lan §×nh Ngäc")
	elseif ( Uworld1061 == 1000 ) and ( GetBit(GetTask(198),4) ~= 1 ) then
		AddGoldItem(0,185)
		SetTask(198,SetBit(GetTask(198),4,1))
	Msg2Player("Chóc mõng b¹n nhËn ®­îc 1 Kim Phong §ång T­íc Xu©n Th©m.")
	end	
	Msg2Player("B¹n ®· hoµn thµnh nhiÖm vô cña ®¼ng cÊp nµy.")
end

function Uworld1000_finishxiepai()
	Uworld1000 = nt_getTask(1000)
	nt_setTask(1000,1000)
	Msg2Player("B¹n ®· hoµn thµnh nhiÖm vô s¬ nhËp.")
end

function no()
end