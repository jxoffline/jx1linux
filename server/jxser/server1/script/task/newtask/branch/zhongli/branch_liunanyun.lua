-- ĞÂÈÎÎñÏµÍ³ÖĞÁ¢Ö§Ïß¹ÜÀínpc
-- BY£ºXIAOYANG£¨2004-11-30£©

Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\branch\\branch_head.lua")
Include("\\script\\task\\newtask\\branch\\branch_prize.lua")
Include("\\script\\task\\newtask\\branch\\branch_problem.lua")
Include("\\script\\task\\newtask\\education_setnpcpos.lua")
function task_liunanyun()
	local curCamp = nt_getCamp()
	Uworld1000 = nt_getTask(1000)
	Uworld1002 = nt_getTask(1002) --ÖĞÁ¢Ö÷Ïß
	Uworld186 = nt_getTask(186)
	Uworld1054 = nt_getTask(1054) --ÖĞÁ¢20-30Ö§Ïß
	Uworld1055 = nt_getTask(1055) --ÖĞÁ¢30-40Ö§Ïß
	Uworld1056 = nt_getTask(1056) --ÖĞÁ¢40-50Ö§Ïß
	Uworld1057 = nt_getTask(1057) --ÖĞÁ¢50-60Ö§Ïß
	Uworld1012 = nt_getTask(1012) --ÖĞÁ¢Ö§ÏßµÄÉ±¹ÖÈÎÎñ±äÁ¿
	Uworld197 = nt_getTask(197) --ÖĞÁ¢È«½±Àø
	local name = GetName()
----------------------------------------------------½ÌÓıÈÎÎñ-----------------------------------------------------------------------------
	if (	Uworld1000 > 0 ) and ( Uworld1000 < 1000 ) then
		if (( Uworld1000 == 300 ) or ( Uworld1000 == 310 )) and ( curCamp == 1 ) then 
			nt_setTask(1000,310) --»·½Ú16start
			Talk(3,"Uworld1000_zhfz1",name..": Ngò Gia b¶o ta ®Õn, ®©y lµ th­ cña Ngò Gia!","§óng lµ th­ cña Ngò Ca. B¹n cña Ngò Ca tøc lµ b¹n cña ta, sau nµy cã lµm ¨n ta sÏ chiÕu cè ng­¬i, ha ha.","Ng­¬i cã thÓ vµo thµnh ch¬i, dïng phİm Tab më b¶n ®å xem bè côc trong thµnh, xong råi ®Õn t×m ta.")
		elseif (( Uworld1000 == 320 ) or ( Uworld1000 == 330 )) and ( curCamp == 1 )  then
			nt_setTask(1000,330) --»·½Ú17start
			Talk(2,"Uworld1000_zhfz2",name..": Ta ®· xem qua råi..","B©y giê h·y ®i t×m Vâ L©m TruyÒn Nh©n ®i.")
		elseif (( Uworld1000 == 420 ) or ( Uworld1000 == 430 )) and ( curCamp == 1 ) and ( Uworld1002 < 10 ) then
			nt_setTask(1000,430) --»·½Ú22start
			Talk(5,"Uworld1000_zhfz3","Mäi viÖc ®· xong.§©y lµ tói Ngò Ca ®­a cho ng­¬i, «ng c¨n dÆn kh«ng cÇn vÒ gÆp «ng, tù m×nh phiªu b¹t giang hå ®i, th­ trong tói cÇn xem sím!",name..":......Thay ta c¸m ¬n Ngò Gia.","Sau nµy mçi khi hoµn thµnh mét nhiÖm vô Chİnh tuyÕn quay vÒ ®©y gÆp ta. Ta cã vµi nhiÖm vô nhá giao cho ng­¬i, nÕu hoµn thµnh sÏ cã gi¶i th­ëng ngoµi mong ®îi. Coi nh­ thay Ngò Ca gióp ®ì ng­¬i.",name..": §­îc! Ta nhí råi.","NhiÖm vô phe kh¸c ng­¬i còng cã thÓ lµm, cã thÓ ®­îc kh«ng İt ®iÓm kinh nghiÖm, chØ lµ hä cã thµnh kiÕn víi ng­¬i, nªn cã vµi mãn b¶o vËt kh«ng thÓ ®­a ng­¬i ®­îc. Ng­¬i cã thÓ vµo th«n trÊn t×m Long Ngò hái thö.")
		elseif ( Uworld1000 == 420 ) and ( curCamp == 1 ) and ( Uworld1002 > 10 ) then
			Talk(1,"Uworld1000_finishzhongli","Ng­¬i ®· tiÕp nhËn nhiÖm vô c¸c phe, nh÷ng g× cÇn d¹y ta ®· d¹y xong, ng­¬i ®i ®i.")
		elseif (( Uworld1000 == 430 ) or ( Uworld1000 == 440 )) and ( curCamp == 1 )  and ( HaveCommonItem(6,1,131) == 0 ) and ( Uworld1002 < 10 ) then 
			Say("T¹i sao quay l¹i? Hay lµ ®Ó quªn tói th­ ë chç ta.",2,"Tu©n lÖnh!/Uworld1000_zhfz4","Kh«ng ph¶i! ChØ lµ quay l¹i th¨m «ng mµ th«i!/Uworld1000_no2")
		else
			Talk(1,"","Trªn ®­êng hµnh tÈu giang hå cã g× kh«ng hiÓu nhÊn <color=red>F12<color> xem cÈm nang. NÕu ng­¬i ®ang tiÕp nhËn <color=red>nhiÖm vô s¬ nhËp<color>, kh«ng thÓ tiÕp nhËn nhiÖm vô kh¸c..")
		end
-----------------------------------------------------------------ÖĞÁ¢Ö§Ïß-----------------------------------------------------------------------------
	else
		if (( Uworld1054 == 1000 ) and ( GetBit(GetTask(197),1) ~= 1)) or (( Uworld1055 == 1000 ) and ( GetBit(GetTask(197),2) ~= 1)) or (( Uworld1056 == 1000 ) and ( GetBit(GetTask(197),3) ~= 1)) or  (( Uworld1057 == 1000 ) and ( GetBit(GetTask(197),4) ~= 1)) then
			Describe(DescLink_LiuNanYun.."<#>:  Ta rÊt hµi lßng víi biÓu hiÖn cña ng­¬i, tÆng ng­¬i mãn b¶o vËt nµy!",1,"NhËn l·nh b¶o vËt/allprize_zhongli")
		elseif ( Uworld1057 == 90 ) or ( Uworld1057 == 100 ) then
			nt_setTask(1057,100)
			Describe(DescLink_LiuNanYun.."<#>:  C¸m ¬n «ng..........ta sÏ kh«ng quªn «ng.",1,"KÕt thóc ®èi tho¹i/Uworld1057_zfz5")
		elseif ( Uworld1057 == 60 ) or ( Uworld1057 == 70 ) then
			if ( GetLevel() >= 50 ) and ( GetLevel() <  60 ) then 
				nt_setTask(1057,70)
				Describe(DescLink_LiuNanYun.."<#>:  Ng­¬i ®· cè g¾ng lµm viÖc ta giao, ta rÊt c¶m kİch.<enter>"
				..name.."<#>:  LiÔu ®¹i gia! GÇn ®©y «ng h¬i kh¸c th­êng <enter> Kh¸c th­êng? Ha ha! Cã thÓ l¾m. Cã lÏ v× ta ngôy trang ®· l©u.<enter>"
				..name.."<#>:  LiÔu ®¹i gia! ¤ng cã t©m sù µ? <enter>Kh«ng cã g×, ta nãi cho ng­¬i mét bİ mËt ch­a ai ®­îc biÕt.<enter>"
				..name.."<#>:  Hay lµ ®õng nãi, ta kh«ng muèn biÕt t©m sù cña «ng, biÕt råi ph¶i g¸nh v¸c nhiÒu viÖc.<enter>§¸ng tiÕc! Trªn ®êi nµy chØ cã ng­¬i míi gióp ®­îc ta.<enter>"
				..name.."<#>:...... NÕu ®· nh­ thÕ, «ng nãi ®i.<enter> Ta lµ mét kÎ ®¸ng th­¬ng.<enter>"
				..name.."<#>:  C¸i g×? <enter> Ta còng lµ mét nh©n sÜ vâ l©m b×nh th­êng, dùa vµo b¶n th©n mµ sèng. Nh­ng tuæi trÎ bång bét, cã mét lÇn t¹i töu lÇu ta lì tay nªn giÕt mét tay c«ng tö gië trß trªu hoa ghÑo nguyÖt. Nµo ngê kÎ nµy lµ con trai duy nhÊt cña tªn c­íp kh"
				..name.."<#>:  Tªn nµy ®¸ng chÕt!<enter> Long Truy Vò tinh th«ng dŞ dung thuËt vâ nghÖ l¹i cao c­êng, tung hoµnh Trung Nguyªn hai m­¬i mÊy n¨m ch­a ai ®¸nh l¹i h¾n.<enter>"
				..name.."<#>:  ¤ng yªn t©m, ta sÏ thay «ng b¸o thï nµy.<enter> Còng chØ cã ng­¬i míi ®¶m ®­¬ng ®­îc,   y th­êng gi¶ trang thµnh phô n÷ vµo §¹i Lı, tin tøc ta biÕt chØ cã bÊy nhiªu.<enter>",
				1,"KÕt thóc ®èi tho¹i/Uworld1057_zfz3")
			else
				Talk(1,"Uworld1000_zhfz7","Khi lµm nhiÖm vô gÆp vÊn ®Ò g×, cã thÓ Ên phİm <color=red>F12<color> ®Ó xem nhËt tr×nh. Trong ®ã chØ ghi l¹i c¸c b­íc mµ b¹n ®· thùc hiÖn qua!")
			end
		elseif ( Uworld1057 == 40 ) or ( Uworld1057 == 50 ) then 
			if ( GetLevel() >= 50 ) and ( GetLevel() <  60 ) then 
				nt_setTask(1057,50)
				Describe(DescLink_LiuNanYun.."<#>:  TiÕp theo chuÈn bŞ tr¶ lêi vÊn ®Ò Tèng Kim.",1,"KÕt thóc ®èi tho¹i/branch_songjinproblem")				
			else
				Talk(1,"Uworld1000_zhfz7","Khi lµm nhiÖm vô gÆp vÊn ®Ò g×, cã thÓ Ên phİm <color=red>F12<color> ®Ó xem nhËt tr×nh. Trong ®ã chØ ghi l¹i c¸c b­íc mµ b¹n ®· thùc hiÖn qua!")
			end
		elseif (( Uworld1057 == 20 ) or ( Uworld1057 == 30 )) and ( Uworld1012 == 20 ) then --Ôö¼ÓÁËÅĞ¶ÏÊÇ·ñÔÚËÎ½ğpkÁËÒ»³¡µÄ±äÁ¿Uworld1011
			if ( GetLevel() >= 50 ) and ( GetLevel() <  60 ) then 
				nt_setTask(1057,30)
				Describe(DescLink_LiuNanYun.."<#>:  Lµm tèt l¾m.",1,"KÕt thóc ®èi tho¹i/Uworld1057_zfz4")				
			else
				Talk(1,"Uworld1000_zhfz7","Khi lµm nhiÖm vô gÆp vÊn ®Ò g×, cã thÓ Ên phİm <color=red>F12<color> ®Ó xem nhËt tr×nh. Trong ®ã chØ ghi l¹i c¸c b­íc mµ b¹n ®· thùc hiÖn qua!")
			end
		elseif ( Uworld1056 == 70 ) or ( Uworld1056 == 80 ) then
			if ( GetLevel() >= 40 ) and ( GetLevel() <  50 ) then 
				nt_setTask(1056,80)
				Describe(DescLink_LiuNanYun.."<#>:  Lµm tèt l¾m! Tæ chøc sÏ träng th­ëng cho ng­¬i.",
				1,"KÕt thóc ®èi tho¹i/Uworld1056_zfz5")
			else
				Talk(1,"Uworld1000_zhfz7","Khi lµm nhiÖm vô gÆp vÊn ®Ò g×, cã thÓ Ên phİm <color=red>F12<color> ®Ó xem nhËt tr×nh. Trong ®ã chØ ghi l¹i c¸c b­íc mµ b¹n ®· thùc hiÖn qua!")
			end
		elseif (( Uworld1056 == 40 ) or ( Uworld1056 == 50 )) and ( Uworld1012 == 20 ) then --Ôö¼ÓÁËÅĞ¶ÏÊÇ·ñÔÚËÎ½ğpkÁËÒ»³¡µÄ±äÁ¿Uworld1011
			if ( GetLevel() >= 40 ) and ( GetLevel() <  50 ) then 
				nt_setTask(1056,50)
				Describe(DescLink_LiuNanYun.."<#>:  ë D­¬ng Ch©u cã  Du S­¬ng T©n th¾ng tr¨m trËn t¹i tû vâ tr­êng, khiÕn cho kh«ng ai d¸m ®Õn th¸ch ®Êu. Cho nªn «ng ta bá mét sè tiÒn lín b¶o chóng ta tiªu diÖt hä Du kia. Cã thÓ h¾n kh«ng ph¶i lµ ng­êi xÊu nh­ng biÕt lµm sao ®­îc lîi İch tr­íc mÆt mµ. Ng­¬i nãi cã ®óng kh«ng?<enter>"
				..name.."<#>:  §óng vËy.<enter>"
				..name.."<#>:  Ta kh«ng mèn giÕt h¾n.<enter> Trõ phi ng­¬i rót khái giang hå, nÕu kh«ng giÕt h¾n, danh tiÕng cña chóng ta coi nh­ tan biÕn, kh«ng ai thuª chóng ta n÷a. Giang hå rÊt lµ kh¾c nghiÖt, ng­¬i kh«ng cã quyÒn lùa chän.<enter>",
				1,"KÕt thóc ®èi tho¹i/Uworld1056_zfz4")
			else
				Talk(1,"Uworld1000_zhfz7","Khi lµm nhiÖm vô gÆp vÊn ®Ò g×, cã thÓ Ên phİm <color=red>F12<color> ®Ó xem nhËt tr×nh. Trong ®ã chØ ghi l¹i c¸c b­íc mµ b¹n ®· thùc hiÖn qua!")
			end
		elseif ( Uworld1056 == 27 ) or ( Uworld1056 == 30 ) then
			if ( GetLevel() >= 40 ) and ( GetLevel() <  50 ) then 
				nt_setTask(1056,30)
				Describe(DescLink_LiuNanYun.."<#>:  GÇn ®©y ®ét nhiªn tiÕp nhËn nhiÖm vô v« cïng nguy hiÓm, cã liªn quan ®Õn D­¬ng Ch©u tû vâ tr­êng. Ng­¬i ®Õn ®ã thi ®Êu lÇn n÷a, ph¶i th¾ng mét trËn míi quay vÒ gÆp ta.<enter>",
				1,"KÕt thóc ®èi tho¹i/Uworld1056_zfz3")
			else
				Talk(1,"Uworld1000_zhfz7","Khi lµm nhiÖm vô gÆp vÊn ®Ò g×, cã thÓ Ên phİm <color=red>F12<color> ®Ó xem nhËt tr×nh. Trong ®ã chØ ghi l¹i c¸c b­íc mµ b¹n ®· thùc hiÖn qua!")
			end
		elseif (( Uworld1056 == 20 ) or ( Uworld1056 == 25 )) and ( Uworld1012 == 20 ) then --Ôö¼ÓÁËÅĞ¶ÏÊÇ·ñÔÚpkÁËÒ»³¡µÄ±äÁ¿Uworld1011
			if ( GetLevel() >= 40 ) and ( GetLevel() <  50 ) then 
				nt_setTask(1056,25)
				Describe(DescLink_LiuNanYun.."<#>:  ThÕ nµo ®· biÕt thiªn ngo¹i h÷u thiªn, nh©n ngo¹i h÷u nh©n?.<enter>",1,"KÕt thóc ®èi tho¹i/Uworld1056_zfz6")
			else
				Talk(1,"Uworld1000_zhfz7","Khi lµm nhiÖm vô gÆp vÊn ®Ò g×, cã thÓ Ên phİm <color=red>F12<color> ®Ó xem nhËt tr×nh. Trong ®ã chØ ghi l¹i c¸c b­íc mµ b¹n ®· thùc hiÖn qua!")
			end																			
		elseif ( Uworld1055 == 130 ) or ( Uworld1055 == 140 ) then
			if ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) then
				nt_setTask(1055,140)
				Describe(name.."<#>:  Nam V©n, chuyÖn tiªu xa cña T©y B¾c tiªu côc ta ®· gi¶i quyÕt xong.<enter>"
				..DescLink_LiuNanYun.."<#>:  Lµ do ai lµm?<enter>"
				..name.."<#>:  Mét ®¸m n÷ tÆc tù x­ng lµ Hµ Hoa §¹o.<enter> Lµ bän hä? Ta tõng nghe qua. Trong lÔ vËt ®Òn ¬n cña Cè chñ cã mét viªn kho¸ng th¹ch thuéc tİnh. Ng­¬i ®em B¶o th¹ch tû lÖ, trang bŞ thuéc tİnh Èn t×m Thî rÌn thÇn bİ ®Ó hîp thµnh mét trang bŞ.<enter>",
				1,"KÕt thóc ®èi tho¹i/Uworld1055_zfz3")
			else
				Talk(1,"Uworld1000_zhfz7","Khi lµm nhiÖm vô gÆp vÊn ®Ò g×, cã thÓ Ên phİm <color=red>F12<color> ®Ó xem nhËt tr×nh. Trong ®ã chØ ghi l¹i c¸c b­íc mµ b¹n ®· thùc hiÖn qua!")
			end
		elseif ( GetLevel() >= 20)  then
			Say(" Ai còng kh«ng quan träng, chØ cÇn cã b¶n lÜnh lµ ®­îc!",3,"Ta muèn lµm mét vµi nhiÖm vô Chİnh tuyÕn./Uworld1000_zhfz6","Ta muèn lµm mét vµi nhiÖm vô phô tuyÕn/Uworld1000_zhfz7","Phãng h¹ ®å ®ao, lËp ®Şa thµnh PhËt. Ta kh«ng muèn giÕt ng­êi!/Uworld1000_no2")
		else
			Talk(1,"","Sau nµy trªn ®­êng hµnh tÈu giang hå cã g× kh«ng hiÓu nhÊn <color=red>F12<color> xem cÈm nang ")
		end
	end
end

function Uworld1000_zhfz6()
	Uworld1000 = nt_getTask(1000)
	Uworld1002 = nt_getTask(1002)
	local name = GetName()
	if ( Uworld1002 < 10 ) and ( Uworld1000 == 0 ) then 
		Talk(1,"","Ng­¬i h·y ®i c¸c T©n Thñ Th«n t×m Long Ngò. Nhí gi÷ kü th­ cña h¾n! NÕu mÊt th­ tiÕn dÉn th× sÏ kh«ng ai tin ng­¬i ®©u!")
		Msg2Player("LiÔu Nam V©n b¶o b¹n ®i vµo T©n Thñ th«n t×m Long Ngò, sÏ cã nhiÖm vô míi!")		
	elseif ( Uworld1000 ~= 0 ) and ( Uworld1000 ~= 1000 ) then
		Talk(1,"","LiÔu Nam V©n: Ng­¬i cßn nhiÖm vô S¬ nhËp, sau khi hoµn thµnh Long Ngò sÏ giao cho ng­¬i nhiÖm vô kh¸c.")
	elseif ( Uworld1002 ~= 0 ) then
		Talk(1,"","Ng­¬i ®· b­íc vµo con ®­êng s¸t thñ, kh«ng thÓ quay ®Çu. Kh«ng ph¶i ng­¬i ®· tiÕp nhËn nhiÖm vô sao?.")
	else
		Talk(1,"","NhiÖm vô Chİnh tuyÕn lµ sau khi b¹n ®¹t ®Õn cÊp nhÊt ®Şnh míi cã thÓ tiÕp nhËn. ChØ cÇn ®¼ng cÊp nh©n vËt trªn 20 lµ cã thÓ tiÕp nhËn. NÕu hoµn thµnh......sÏ cã gi¶i th­ëng h¬n mong ®îi.")
	end
end

function Uworld1000_zhfz7()
	Uworld1054 = nt_getTask(1054) --ÖĞÁ¢20-30Ö§Ïß
	Uworld1055 = nt_getTask(1055) --ÖĞÁ¢30-40Ö§Ïß
	Uworld1056 = nt_getTask(1056) --ÖĞÁ¢40-50Ö§Ïß
	Uworld1057 = nt_getTask(1057) --ÖĞÁ¢50-60Ö§Ïß
	local name = GetName()
	Describe(DescLink_LiuNanYun.."<#>:  ThÕ giíi nµy chØ dµnh cho nh÷ng kÎ m¹nh. B¹n chØ cã mét c¸ch duy nhÊt ®Ó tån t¹i ®ã lµ: chiÕn ®Êu!",6,
	"Ta muèn t×m hiÓu c¸ch lµm nhiÖm vô Phô tuyÕn/Uworld1000_zhfz8" ,
	"Ta muèn lµm nhiÖm vô tõ cÊp 20 ®Õn 29/Uworld1054_zfz1",
	"Ta muèn lµm nhiÖm vô cÊp 30 ®Õn 39/Uworld1055_zfz1",
	"Ta muèn lµm nhiÖm vô cÊp 40 ®Õn 49/Uworld1056_zfz1",
	"Ta muèn lµm nhiÖm vô cÊp 50 ®Õn 59/Uworld1057_zfz1",
	"Hay lµ sau nµy h·y lµm!/no")
end

function Uworld1000_zhfz8()
	Describe(DescLink_LiuNanYun.."<#>:  NhiÖm vô Phô tuyÕn trªn c¬ b¶n lµ nhiÖm vô Chİnh tuyÕn, khi ®¹t ®Õn ®¼ng cÊp nhÊt ®Şnh míi cã thÓ tiÕp nhËn. Vİ dô lóc ®¼ng cÊp b¹n lµ 32, b¹n ph¶i tiÕp nhËn nhiÖm vô Chİnh tuyÕn cÊp 30 tr­íc, sau ®ã míi cã thÓ tiÕp nhËn nhiÖm vô phô tuyÕn.Tr­íc khi",1,"KÕt thóc ®èi tho¹i/no")
end

function Uworld1054_zfz1()
	Uworld1054 = nt_getTask(1054) --ÖĞÁ¢20-30¼¶Ö®¼äµÄÖ§ÏßÈÎÎñ±äÁ¿
	Uworld1002 = nt_getTask(1002) --ÖĞÁ¢Ö÷ÏßÈÎÎñ±äÁ¿
	local name = GetName()
	if ( Uworld1002 >= 20 ) and ( GetLevel() >= 20 ) and ( GetLevel() <  30 ) and (( Uworld1054 == 0 ) or ( Uworld1054 == 10 )) then
		nt_setTask(1054,10)
		Describe(DescLink_LiuNanYun.."<#>:  HiÖn nay giang hå, cao thñ sö dông kiÕm cã thÓ tİnh ®Õn Vâ §ang vµ Nga Mi.<enter>"
		..name.."<#>:  H×nh nh­ lµ kh«ng cã nh©n tµi.<enter>Ng­¬i sai råi, chİnh lµ kh«ng cã binh khİ võa tay. Thanh kiÕm tèt lµ tİnh m¹ng cña ng­êi sö dông kiÕm.<enter>"
		..name.."<#>:  Dïng m¹nh hiÕp yÕu kh«ng ph¶i lµ Chİnh ®¹o.<enter>LiÔu Nam V©n: Ha ha, ng­¬i nãi thÕ nh­ng ch­a ch¾c bông ng­¬i nghÜ thÕ!<enter>"
		..name.."<#>:  Ng­¬i nãi còng cã lı. <enter>Muèn lµm s¸t thñ, lîi khİ rÊt cÇn thiÕt. Nghe nãi Ng­ d©n D­¬ng Ch©u trong 1 ®ªm m­a giã b·o bïng ph¸t hiÖn d­íi ®¸y biÓn xuÊt hiÖn c¶nh t­îng kú dŞ, cÇn ph¶i ®iÒu tra.<enter>"
		..name.."<#>:  §­îc.<enter> Ta cã ng­êi b¹n tªn Giang NhÊt Tiªu, ng­¬i ®Õn t×m h¾n gióp ®ì, y sÏ kh«ng chèi tõ.<enter>"
		..name.."<#>:  Nh­ vËy qu¸ tèt, Giang NhÊt Tiªu b×nh th­êng thİch c¸i g×? Tèt nhÊt chuÈn bŞ quµ ra m¾t.<enter>Kh«ng cÇn ®©u,   y nhËm chøc ë TÇn L¨ng, n¬i ®ã ®ang bŞ n¹n giÆc Nhİm ph¸ ph¸ch, tr­íc tiªn h·y ®Õn TÇn L¨ng ®¸nh 50 con Nhİm.<enter>"
		..name.."<#>:  ChØ lµ chuyÖn nhá!<enter>",
		1,"KÕt thóc ®èi tho¹i/Uworld1054_zfz2")
	elseif ( GetLevel() < 20 ) then
		Talk(1,"","Xin lçi! §¼ng cÊp cña ng­¬i ch­a ®¹t yªu cÇu cña nhiÖm vô, ®îi ®Õn cÊp 20, sau khi tiÕp nhËn nhiÖm vô Chİnh tuyÕn t­¬ng øng míi ®Õn t×m ta.")
	elseif ( GetLevel() >= 30 ) then
		Talk(1,"","Xin lçi! §¼ng cÊp cña b¹n v­ît qu¸ yªu cÇu cña nhiÖm vô, kh«ng thÓ tiÕp nhËn nhiÖm vô.")
	elseif ( Uworld1002 < 20 ) then
		Talk(1,"","Xin lçi! B¹n ch­a lµm nhiÖm vô Chİnh tuyÕn phe Trung t­¬ng øng víi ®¼ng cÊp, h·y ®Õn <color=red>BiÖn Kinh<color>t×m Phã Nam B¨ng.")
	else
		Talk(1,"","§êi ng­êi cã rÊt ®iÒu kú diÖu mµ ta n»m m¬ còng nghÜ kh«ng ra!")
	end
end

function Uworld1054_zfz2()
	Uworld1012 = nt_getTask(1012)
	AddOwnExp(5000)
	nt_setTask(1012,10)
	nt_setTask(1054,20)
	AddPlayerEvent(2) 
	Msg2Player("LiÔu Nam V©n b¶o b¹n ®Õn D­¬ng Ch©u t×m Giang NhÊt Tiªu hái th¨m tin tøc ThÇn binh xuÊt thÕ, ®Õn TÇn L¨ng ®¸nh 50 con nhİm.")
end

function Uworld1055_zfz1()
	Uworld1055 = nt_getTask(1055) --ÖĞÁ¢30-40¼¶Ö®¼äµÄÖ§ÏßÈÎÎñ±äÁ¿
	Uworld1002 = nt_getTask(1002) --ÖĞÁ¢Ö÷ÏßÈÎÎñ±äÁ¿
	local name = GetName()
	if ( Uworld1002 >= 70 ) and ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) and (( Uworld1055 == 0 ) or ( Uworld1055 == 10 )) then
		nt_setTask(1055,10)
		Describe(DescLink_LiuNanYun.."<#>:  Cã vô lµm ¨n lín råi.<enter>"
		..name.."<#>:  Lµm ¨n?<enter> Tiªu xa cña T©y B¾c tiªu côc liªn tiÕp bŞ c­íp, Tiªu s­ hé tèng kh«ng ai tho¸t khái, c¶ 36 tiªu côc bá mét sè tiÒn lín ®Ó bän ta ®iÒu tra hung ph¹m.<enter>"
		..name.."<#>:  Ng­êi T©y B¾c vèn rÊt hiÕu chiÕn! <enter>Ng­¬i cã thÓ ®Õn Ph­îng T­êng t×m chñ nh©n cña Song ¦ng tiªu côc, «ng ta sÏ cho ng­êi biÕt râ t×nh h×nh.<enter>",
		1,"KÕt thóc ®èi tho¹i/Uworld1055_zfz2")
	elseif ( GetLevel() < 30 ) then
		Talk(1,"","Xin lçi! §¼ng cÊp cña ng­¬i ch­a ®¹t yªu cÇu cña nhiÖm vô, ®îi ®Õn cÊp 30, sau khi tiÕp nhËn nhiÖm vô Chİnh tuyÕn t­¬ng øng míi ®Õn t×m ta.")
	elseif ( GetLevel() >= 40 ) then
		Talk(1,"","Xin lçi! §¼ng cÊp cña b¹n v­ît qu¸ yªu cÇu cña nhiÖm vô, kh«ng thÓ tiÕp nhËn nhiÖm vô.")
	elseif ( Uworld1002 < 70 ) then
		Talk(1,"","Xin lçi! B¹n ch­a lµm nhiÖm vô Chİnh tuyÕn phe Trung t­¬ng øng víi ®¼ng cÊp, h·y ®Õn <color=red>BiÖn Kinh<color>t×m Phã Nam B¨ng.")
	else
		Talk(1,"","§êi ng­êi cã rÊt ®iÒu kú diÖu mµ ta n»m m¬ còng nghÜ kh«ng ra!")
	end
end

function Uworld1055_zfz2()
	AddOwnExp(15000)
	nt_setTask(1055,20)
	Msg2Player("GÇn ®©y T©y B¾c x¶y ra ¸n lín, LiÔu Nam V©n b¶o b¹n ®Õn Ph­îng T­êng t×m Chñ nh©n Song ¦ng tiªu côc hái râ.")
end

function Uworld1055_zfz3()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
	ex_add_zl_level30();
end

function Uworld1056_zfz1()
	Uworld1056 = nt_getTask(1056) --ÖĞÁ¢40-50¼¶Ö®¼äµÄÖ§ÏßÈÎÎñ±äÁ¿
	Uworld1002 = nt_getTask(1002) --ÖĞÁ¢Ö÷ÏßÈÎÎñ±äÁ¿
	local name = GetName()
	if ( Uworld1002 >= 120 ) and ( GetLevel() >= 40 ) and ( GetLevel() <  50 ) and (( Uworld1056 == 0 ) or ( Uworld1056 == 10 )) then
		nt_setTask(1056,10)
		Describe(DescLink_LiuNanYun.."<#>:  Ng­¬i c¶m thÊy lµm cao thñ dÔ kh«ng?.<enter>"
		..name.."<#>:  Ta kh«ng biÕt, chØ c¶m thÊy dÔ chŞu.<enter> DÔ chŞu? §ã lµ v× ng­¬i ch­a gÆp ph¶i cao thñ tuyÖt thÕ! H·y ®i D­¬ng Ch©u ®Êu thö mét trËn ®i! <enter>",
		1,"KÕt thóc ®èi tho¹i/Uworld1056_zfz2")
	elseif ( GetLevel() < 40 ) then
		Talk(1,"","Xin lçi! §¼ng cÊp cña ng­¬i ch­a ®¹t yªu cÇu cña nhiÖm vô, ®îi ®Õn cÊp 40, sau khi tiÕp nhËn nhiÖm vô Chİnh tuyÕn t­¬ng øng míi ®Õn t×m ta.")
	elseif ( GetLevel() >= 50 ) then
		Talk(1,"","Xin lçi! §¼ng cÊp cña b¹n v­ît qu¸ yªu cÇu cña nhiÖm vô, kh«ng thÓ tiÕp nhËn nhiÖm vô.")
	elseif ( Uworld1002 < 120 ) then
		Talk(1,"","Xin lçi! B¹n ch­a lµm nhiÖm vô Chİnh tuyÕn phe Trung t­¬ng øng víi ®¼ng cÊp, h·y ®Õn <color=red>BiÖn Kinh<color>t×m Phã Nam B¨ng.")
	else
		Talk(1,"","§êi ng­êi cã rÊt ®iÒu kú diÖu mµ ta n»m m¬ còng nghÜ kh«ng ra!")
	end
end

function Uworld1056_zfz2()
	Uworld1012 = nt_getTask(1012)
	AddOwnExp(30000)
	nt_setTask(1012,10)
	nt_setTask(1056,20) 
	Msg2Player("LiÔu Nam V©n b¶o b¹n ®Õn tû vâ tr­êng ®¸nh 1 trËn, ®Ó chøng tá b¶n lÜnh")	
end

function Uworld1056_zfz3()
	Uworld1012 = nt_getTask(1012)
	AddOwnExp(30000)
	nt_setTask(1012,10)
	nt_setTask(1056,40)
end

function Uworld1056_zfz6()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function Uworld1056_zfz4()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function Uworld1056_zfz5()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
	ex_add_zl_level40();
end

function Uworld1057_zfz1()
	Uworld1057 = nt_getTask(1057) --ÕıÅÉ50-60¼¶Ö®¼äµÄÖ§ÏßÈÎÎñ±äÁ¿
	Uworld1002 = nt_getTask(1002) --ÕıÅÉÖ÷ÏßÈÎÎñ±äÁ¿
	local name = GetName()
	if ( Uworld1002 >= 190 ) and ( GetLevel() >= 50 ) and ( GetLevel() <  60 ) and ((  Uworld1057 == 0 ) or ( Uworld1057 == 10 ))  then
			nt_setTask(1057,10)
			Describe(DescLink_LiuNanYun.."<#>:...Ngµy ta vµ ng­¬i bªn nhau s¾p hÕt.<enter>"
			..name.."<#>:  T¹i sao tù nhiªn l¹i nãi nh÷ng lêi nµy?<enter> Lµm s¸t thñ kh«ng thÓ lµm c¶ ®êi. Trªn tay nhuèm nhiÒu m¸u còng kh«ng ph¶i lµ chuyÖn tèt.<enter>"
			..name.."<#>:  ¤ng muèn ta röa tay g¸c kiÕm?<enter> §óng vËy! Ta ®· chuÈn bŞ mét sè tiÒn ®ñ ®Ó ng­¬i sèng nh÷ng ngµy cßn l¹i.<enter>"
			..name.."<#>:......Còng tèt.<enter>  Tr­íc khi ®i, Ta muèn ng­¬i gióp ta lÇn cuèi.<enter>"
			..name.."<#>:  LiÔu §¹i ca xin cø nãi. <enter>Ng­¬i h·y ®Õn ChiÕn tr­êng Tèng Kim, lÊy 200 ®iÓm tİch lòy. §õng hái ta nguyªn nh©n.<enter>",
			1,"KÕt thóc ®èi tho¹i/Uworld1057_zfz2")
	elseif ( GetLevel() < 50 ) then
		Talk(1,"","Xin lçi! §¼ng cÊp cña ng­¬i ch­a ®¹t yªu cÇu cña nhiÖm vô, ®îi ®Õn cÊp 50, sau khi tiÕp nhËn nhiÖm vô Chİnh tuyÕn t­¬ng øng míi ®Õn t×m ta.")
	elseif ( GetLevel() >= 60 ) then
		Talk(1,"","Xin lçi! §¼ng cÊp cña b¹n v­ît qu¸ yªu cÇu cña nhiÖm vô, kh«ng thÓ tiÕp nhËn nhiÖm vô.")
	elseif ( Uworld1002 < 190 ) then
		Talk(1,"","Xin lçi! B¹n ch­a lµm nhiÖm vô Chİnh tuyÕn phe Trung t­¬ng øng víi ®¼ng cÊp, h·y ®Õn <color=red>BiÖn Kinh<color>t×m Phã Nam B¨ng.")
	else
		Talk(1,"","§êi ng­êi cã rÊt ®iÒu kú diÖu mµ ta n»m m¬ còng nghÜ kh«ng ra!")
	end
end

function Uworld1057_zfz2()
	Uworld1012 = nt_getTask(1012)
	AddOwnExp(60000)
	nt_setTask(1012,10)
	nt_setTask(1057,20) 
	Msg2Player("LiÔu Nam V©n b¶o b¹n tham gia §¹i chiÕn Tèng Kim, lÊy 200 ®iÓm th­ëng vÒ, xem ra cã nhiÖm vô quan träng ®ang chê b¹n.")	
end

function Uworld1057_zfz3()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function Uworld1057_zfz4()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function Uworld1057_zfz5()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
	ex_add_zl_level50();
end

function Uworld1000_zhfz1()
	AddOwnExp(1000)
	nt_setTask(1000,320) --»·½Ú16end 
	Msg2Player("LiÔu Nam V©n b¶o b¹n vµo thµnh nghØ ng¬i råi h·y ®Õn t×m h¾n.")	
end

function Uworld1000_zhfz2()
	AddOwnExp(1000)
	nt_setTask(1000,340) --»·½Ú17end 
	Msg2Player("LiÔu Nam V©n b¶o b¹n ®i t×m Vâ L©m TruyÒn Nh©n.")	
	seteducationnpcpos()
end

function Uworld1000_zhfz3()
	AddItem(6,1,131,1,0,0,0)  --Ôö¼ÓÁúÎåµÄ°ü¸¤
	AddOwnExp(20000)
	nt_setTask(186,10)
	nt_setTask(1000,440) --»·½Ú22end
	Msg2Player("B¹n ®­îc1 tói th­, LiÔu Nam V©n b¶o b¹n mau më tói th­, lÊy th­ trong ®ã t×m ng­êi cÇn t×m.")	
end

function Uworld1000_zhfz4()
	AddItem(6,1,131,1,0,0,0)  --Ôö¼ÓÁúÎåµÄ°ü¸¤
	nt_setTask(186,10)
	Msg2Player("B¹n ®­îc1 tói th­, LiÔu Nam V©n b¶o b¹n mau më tói th­, lÊy th­ trong ®ã t×m ng­êi cÇn t×m.")	
end

function Uworld1000_zhfz5()
	Talk(1,"","Ng­¬i h·y ®i c¸c T©n Thñ Th«n t×m Long Ngò. Nhí gi÷ kü th­ cña h¾n! NÕu mÊt th­ tiÕn dÉn th× sÏ kh«ng ai tin ng­¬i ®©u!")
	Msg2Player("LiÔu Nam V©n b¶o b¹n ®i vµo T©n Thñ th«n t×m Long Ngò, sÏ cã nhiÖm vô míi!")		
end

function Uworld1000_no2()
	Talk(1,"","Trªn giang hå ch¼ng lóc sãng yªn giã lÆng, ng­¬i ph¶i b¶o träng. Sau sÏ quay l¹i ®©y ta cã vµi nhiÖm giao cho ng­¬i.")
end

function allprize_zhongli()
	Uworld197 = nt_getTask(197) --ÕıÅÉÈ«½±Àø
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
	if ( Uworld1054 == 1000 ) and ( GetBit(GetTask(197),1) ~= 1 ) then
		AddGoldItem(0,179)
		SetTask(197,SetBit(GetTask(197),1,1))
	Msg2Player("Chóc mõng b¹n nhËn ®­îc 1  Kim Phong Tr¹c Liªn Quang")
	elseif ( Uworld1055 == 1000 ) and ( GetBit(GetTask(197),2) ~= 1) then
		AddGoldItem(0,180)
		SetTask(197,SetBit(GetTask(197),2,1))
	Msg2Player("Chóc mõng b¹n ®¹t ®­îc 1  Kim Phong C«ng CÈn Tam Th¸n.")
	elseif ( Uworld1056 == 1000 ) and ( GetBit(GetTask(197),3) ~= 1 ) then
		AddGoldItem(0,183)
		SetTask(197,SetBit(GetTask(197),3,1))
	Msg2Player("Chóc mõng b¹n nhËn ®­îc 1  Kim Phong Lan §×nh Ngäc")
	elseif ( Uworld1057 == 1000 ) and ( GetBit(GetTask(197),4) ~= 1 ) then
		AddGoldItem(0,185)
		SetTask(197,SetBit(GetTask(197),4,1))
	Msg2Player("Chóc mõng b¹n nhËn ®­îc 1 Kim Phong §ång T­íc Xu©n Th©m.")
	end	
	Msg2Player("B¹n ®· hoµn thµnh nhiÖm vô cña ®¼ng cÊp nµy.")
end

function Uworld1000_finishzhongli()
	Uworld1000 = nt_getTask(1000)
	nt_setTask(1000,1000)
	Msg2Player("B¹n ®· hoµn thµnh nhiÖm vô s¬ nhËp.")
end

function no()
end