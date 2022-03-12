-- ÕıÅÉÖ§ÏßÈÎÎñ½Å±¾
-- by xiaoyang(2005\1\4)

Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\branch\\branch_head.lua")
Include("\\script\\task\\newtask\\branch\\branch_prize.lua")
Include("\\script\\task\\newtask\\branch\\branch_problem.lua")
----------------------------------------------------------------------×Ş³¤¾Ã-----------------------------------------------------------------------
function branch_zouchangjiu()
	Uworld1058 = nt_getTask(1058)
	local name = GetName()  
	if ( Uworld1058 == 40) or ( Uworld1058 == 50 ) then
		if ( GetLevel() >= 20 ) and ( GetLevel() <  30 ) then
			nt_setTask(1058,50)
			Describe(name.."<#>:C¸c h¹ lµ Tr©u Tr­êng Cöu?<enter>"
			..DescLink_ZouChangJiu.."<#>:§óng! T×m ta cã viÖc g×?<enter>"
			..name.."<#>:Huynh xem ®©y lµ g×! <enter>LÖnh bµi cña Th¸c B¹t Hoµi Xuyªn bŞ mÊt.<enter>Ng­¬i... Ng­¬i lµ ng­êi ®­îc Th¸c B¹t Hoµi Xuyªn ph¸i tíi. Tèt! §Õn ®óng lóc l¾m!<enter>"
			..name.."<#>:Thø g× mµ quan träng thÕ. <enter>Tr©u Tr­êng Cöu: C¸i nµy ng­¬i khái lo, cÇm nh÷ng quyÓn mËt tŞch da dª nµy cã thÓ lËp tøc ra khái thµnh, nÕu kh«ng sÏ kh«ng ®i ®­îc ®©u. NÕu cã thÓ tho¸t th©n ®­îc, cÇm nh÷ng quyÓn mËt tŞch nµy ®i D­¬ng Ch©u t×m ThÈm Phong. Nh×n thÊy vËt nµy, h¾n tù nhiªn sÏ hiÓu.enter>",
			1,"KÕt thóc ®èi tho¹i/branch_zouchangjiu1")	
		else
			Talk(1,"","Xin lçi! §¼ng cÊp cña b¹n v­ît qu¸ ®¼ng cÊp nhiÖm vô yªu cÇu, kh«ng thÓ tiÕp nhËn n÷a! ThËt ng¹i qu¸! ")
		end
	else
		Describe(DescLink_ZouChangJiu.."<#>: §êi ng­êi cã nhiÒu chuyÖn kh«ng ngê! Cã nh÷ng chuyÖn ta kh«ng muèn th× nã vÉn cø ®Õn!",1,"KÕt thóc ®èi tho¹i/no")
	end
end
---------------------------------------------------------------------Éò·ç-----------------------------------------------------------------------
function branch_shenfeng()
	Uworld1058 = nt_getTask(1058)
	local name = GetName()  
	if ( Uworld1058 == 60) or ( Uworld1058 == 70 ) then
		if ( GetLevel() >= 20 ) and ( GetLevel() <  30 ) then
			nt_setTask(1058,70)
			Describe(name.."<#>:ThÈm Phong?<enter>"
			..DescLink_ShenFeng.."<#>: Chİnh ta.<enter>"
			..name.."<#>: Ng­¬i xem ®©y!<enter>G× thÕ? <enter>B¹n më MËt tŞch da dª cho ThÈm Phong xem.<enter>"
			..name.."<#>: Cã ng­êi ë Thµnh §« nhê ta ®Õn t×m huynh <enter>CÈu tÆc! Gia gia kh«ng ph¶i ThÈm Phong, ng­¬i m¾c lõa råi! Nµy Kim cÈu, h«m nay cã muèn toµn m¹ng sèng?<enter>",
			1,"KÕt thóc ®èi tho¹i/branch_shenfeng1")	
		else
			Talk(1,"","Xin lçi! §¼ng cÊp cña b¹n v­ît qu¸ ®¼ng cÊp nhiÖm vô yªu cÇu, kh«ng thÓ tiÕp nhËn n÷a! ThËt ng¹i qu¸! ")
		end
	else
		Describe(DescLink_ShenFeng.."<#>:Chİnh ta!",1,"KÕt thóc ®èi tho¹i/no")
	end
end

--------------------------------------------------------------------ÁõÔÌ¹Å-----------------------------------------------------------------
function branch_liuyungu()
	Uworld1059 = nt_getTask(1059)
	Uworld1060 = nt_getTask(1060)
	Uworld1013 = nt_getTask(1013)
	local name = GetName()  
	if ( Uworld1060 == 20) or ( Uworld1060 == 30 ) then
		if ( GetLevel() >= 40 ) and ( GetLevel() <  50 ) then
			nt_setTask(1060,30)
			Describe(
			name.."<#>:L­u huynh! Nghe nãi Tèng TriÒu ®ang më héi l«i ®µi, khuyÕn khİch quÇn hïng trong thiªn h¹ luyÖn vâ.<enter>"
			..DescLink_LiuYunGu.."<#>: Nam Tèng më trËn l«i ®µi tû vâ cho nh©n sÜ vâ l©m, môc ®İch tuyªn d­¬ng phong trµo luyÖn vâ nh­ng cã thÓ thÊy Nam triÒu ®ang m­u tİnh ®Èy m¹nh biªn phßng, bæ sung qu©n lùc ®Ó chèng l¹i §¹i Kim ta.<enter>"
			..name.."<#>: Huynh cã m­u kÕ g× ch¨ng?<enter>Kh«ng! ChØ cã ng­êi tham dù trËn l«i ®µi míi cã thÓ gia nhËp vµo sµn ®Êu, ®©y lµ chuyÖn mµ ta v¾t ãc m·i kh«ng ra. NÕu ng­¬i…….<enter>"
			..name.."<#>: Ta hiÓu. Ta sÏ ®İch th©n ®i DiÔn Vâ Tr­êng tham gia mét trËn thi ®Êu, chØ cã thÓ nh­ vËy míi cã thÓ thu thËp tin tøc.<enter>",
			1,"KÕt thóc ®èi tho¹i/branch_liuyungu2")	
		else
			Talk(1,"","Xin lçi! §¼ng cÊp cña b¹n v­ît qu¸ ®¼ng cÊp nhiÖm vô yªu cÇu, kh«ng thÓ tiÕp nhËn n÷a! ThËt ng¹i qu¸! ")
		end
	elseif (( Uworld1060 == 40) or ( Uworld1060 == 50 )) and ( Uworld1013 == 20 ) then
		if ( GetLevel() >= 40 ) and ( GetLevel() <  50 ) then
			nt_setTask(1060,50)
			Describe(
			DescLink_LiuYunGu.."<#>: Th¾ng råi µ! Hµ! Hµ! Kh¸ l¾m! H·y quay vÒ t×m Th¸c B¹t T­íng qu©n kÓ l¹i t­êng tËn t×nh h×nh trËn L«i ®µi, nªn nhí ®õng ®Ó sãt bÊt cø chç nhá nµo.<enter>",
			1,"KÕt thóc ®èi tho¹i/branch_liuyungu3")	
		else
			Talk(1,"","Xin lçi! §¼ng cÊp cña b¹n v­ît qu¸ ®¼ng cÊp nhiÖm vô yªu cÇu, kh«ng thÓ tiÕp nhËn n÷a! ThËt ng¹i qu¸! ")
		end	
	elseif ( Uworld1059 == 40) or ( Uworld1059 == 50 ) then
		if ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) then
			nt_setTask(1059,50)
			Describe(
			name.."<#>:L­u UÈn Cæ?<enter>"
			..DescLink_LiuYunGu.."<#>: Ng­¬i lµ ai! D¸m thÊt lÔ víi bæn quan µ?<enter>"
			..name.."<#>: §õng gi¶ bé n÷a, ta lµ ng­êi ®­îc Th¸c B¹t T­íng Qu©n ph¸i tíi t×m ng­¬i hái th¨m vµi chuyÖn. <enter>Th¸c B¹t? Th¸c B¹t qu¸i g× chø? §¹i Tèng ta mÊy v¹n chiÕn t­íng, nµo cã ai mang c¸i hä rî Êy?<enter>"
			..name.."<#>: LÖnh Bµi Th¸c B¹t T­íng qu©n ®©y, L­u tiªn sinh cßn kh«ng tin sao?<enter>CÈn thËn kiÓm tra lÖnh bµi, bçng nhiªn h¹ giäng <enter>Qu¶ nhiªn lµ ng­êi cña Th¸c B¹t T­íng Qu©n, ng­¬i  muèn biÕt tin g×?<enter>"
			..name.."<#>: GÇn ®©y nghe nãi vµi tin ®ån vÒ Thi Nghi Sinh, T­íng qu©n sai ta ®Õn ®Ó tra râ thùc h­.<enter>Thi Nghi Sinh? Ho¹t ®éng ë Nam Tèng cña g· nµy cã chót mê ¸m vµ ®· tiÕt lé nh÷ng t×nh b¸o tuyÖt mËt cña §¹i Kim.<enter>"
			..name.."<#>: ThËt cã chuyÖn ®ã sao? VËy Taph¶i trë vÒ bÈm b¸o víi T­íng qu©n. <enter>Trªn ®­êng ph¶i hÕt søc cÈn thËn.<enter>",
			1,"KÕt thóc ®èi tho¹i/branch_liuyungu1")	
		else
			Talk(1,"","Xin lçi! §¼ng cÊp cña b¹n v­ît qu¸ ®¼ng cÊp nhiÖm vô yªu cÇu, kh«ng thÓ tiÕp nhËn n÷a! ThËt ng¹i qu¸! ")
		end
	
	else
		Describe(DescLink_LiuYunGu.."<#>: Ta? Vµng, Ngäc, Lôa, Sa tanh, R­îu ngon, ngùa tèt  thø g× còng cã, chØ cÇn nãi ra, ta sÏ cã b¸n!",1,"KÕt thóc ®èi tho¹i/no")
	end
end

---------------------------------------------------------------------×íºº-------------------------------------------------------------------------
function branch_zuihan()
	Uworld1059 = nt_getTask(1059)
	local name = GetName()  
	
	if ( Uworld1059 == 80) or ( Uworld1059 == 90 ) then
		if ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) then
			nt_setTask(1059,90)
			Describe(
			name.."<#>:Ma men! DËy ®i!<enter>"
			..DescLink_JiuGui.."<#>: Mét giÊc méng dµi, ®êi ng­êi cã bao l©u, §Ó ta say ®i....……<enter>"
			..name.."<#>: Ng­¬i muèn say, còng kh«ng ph¶i lµ b©y giê. Th¸c B¹t T­íng qu©n ®ang cÇn ng­¬i.<enter>Ng­¬i nãi g×?!……Qu¶ lµ Th¸c B¹t T­íng qu©n, cã ®óng lµ T­íng qu©n nhê ng­¬i tíi kh«ng? §· 10 n¨m råi, ta Èn n¸u n¬i nµy kh«ng b¹n bÌ th©n thİch! Cã lóc ta nghÜ r»ng quª h­¬ng ®· tõ bá ta, hãa ra mäi ng­êi vÉn cßn nhí ®Õn ta. Ng­¬i cã g× cÇn ta gióp ch¨ng?<enter>"
			..name.."<#>: B©y giê ta muèn biÕt quy luËt ra vµo cña Thi Nghi Sinh, ngoµi ra ng­¬i lµm cho ta mét sè th«ng hµnh lÖnh bµi.<enter>Nh÷ng thø nµy ta ®· chuÈn bŞ tõ l©u, h·y ®i b¾t tªn cÈu gian tÕ Thi Nghi Sinh ®i.<enter>",
			1,"KÕt thóc ®èi tho¹i/branch_zuihan1")	
		else
			Talk(1,"","Xin lçi! §¼ng cÊp cña b¹n v­ît qu¸ ®¼ng cÊp nhiÖm vô yªu cÇu, kh«ng thÓ tiÕp nhËn n÷a! ThËt ng¹i qu¸! ")
		end
	else
		Describe(DescLink_JiuGui.."<#>: Ai da, say råi, ®· say th× kh«ng cßn nhí g× n÷a, m×nh nhí ng­êi kh¸c ch­a ch¾c ai ®· nhí tíi m×nh.",1,"KÕt thóc ®èi tho¹i/no")
	end
end

function branch_zouchangjiu1()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function branch_shenfeng1()
	AddOwnExp(5000)
	nt_setTask(1058,80)
	Msg2Player("Tªn ThÈm Phong nµy râ rµng lµ do vâ sÜ  Tèng TriÒu gi¶ d¹ng!")
	NewWorld(80,1795,3395)
	SetFightState(1)
end
	
function branch_liuyungu1()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function branch_liuyungu2()
	Uworld1013 = nt_getTask(1013)
	AddOwnExp(30000)
	nt_setTask(1013,10)
	nt_setTask(1060,40)
	Msg2Player("B¹n quyÕt ®Şnh ®İch th©n ®i  DiÔn Vâ Tr­êng tham gia ®¸nh mét trËn pk.")
end

function branch_liuyungu3()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function branch_zuihan1()
	AddOwnExp(15000)
	AddSkillState( 509, 1, 0, 180);
	branchprize()
	nt_setTask(1059,100)
	Msg2Player("B¹n ®· cã thÓ thuËn tiÖn ®i thİch s¸t Thi Nghi Sinh.")
end

function no()
end

