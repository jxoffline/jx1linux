-------------------------------------------------------------------------
-- FileName		:	Â·ÈË_Äª³î.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-27 22:53:08
-- Desc			:	
-------------------------------------------------------------------------

Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\master\\master_head.lua")
Include("\\script\\task\\newtask\\master\\nexttask.lua")
Include("\\script\\task\\newtask\\master\\newtaskprize.lua")

function mochou()
	Uworld1001 = nt_getTask(1001)  --ÕýÅÉ
	local name = GetName()  
	if ( Uworld1001 == 10 ) or ( Uworld1001 == 20 )then
		nt_setTask(1001,20) 
		Describe(name.."<#>: Xin hái ng­êi cã ph¶i lµ…."..DescLink_MoChou.."<#>? <enter>VÞ ®©y lµ...?<enter>"
				..name.."<#>: Ta cã bøc th­ nµy, ng­êi xem qua sÏ biÕt. <enter>M¹c SÇu nhËn th­.  Trong th­ cã ®éc! <enter>"
				..name.."<#>: C¸i g×? <enter>Ng­¬i….Ng­¬i thËt ¸c ®éc! Nãi! Ai ph¸i ng­¬i ®Õn? <enter>"
				..name.."<#>: Ta kh«ng muèn tiÕt lé danh tÝnh ng­êi ®ã! <enter> Tèt! Ng­¬i kh«ng nãi, h«m nay ®õng hßng rêi khái ®©y! <enter>"
				..name.."<#>: Cho dï cã bá m¹ng n¬i ®©y ta còng kh«ng tiÕt lé danh tÝnh h¾n. <enter> Ta ë bÕn tµu ngoµi thµnh ®îi ng­¬i! Cã b¶n lÜnh h·y ®Õn ®ã! <enter>",
				1,"KÕt thóc ®èi tho¹i/Uworld1001_finish1")
	elseif ( Uworld1001 == 40 ) or ( Uworld1001 == 50 )then
		nt_setTask(1001,50)
		Describe(name.."<#>: Kh«ng ngê vâ nghÖ ng­¬i thËt cao c­êng. <enter>"
				..DescLink_MoChou.."<#>: Ng­¬i cßn kh«ng nãi, ta sÏ phÕ vâ c«ng cña ng­¬i, cã nãi hay kh«ng?<enter>"
				..name.."<#>: Kh«ng nãi.<enter>M¹c SÇu:......<enter>"
				..name.."<#>:  Ng­¬i giÕt ta ®i. <enter> ThËt kh«ng ngê, thñ h¹ cña Long Ngò l¹i gan d¹ nh­ vËy. <enter>"
				..name.."<#>: Ng­¬i t­ëng ®e däa lµ ta sî ­? <enter>¸i chµ! B»ng h÷u! Ta ®©y chØ thö ng­¬i mµ th«i. Kh«ng tin ng­¬i tù xem th­ ®i sÏ râ. <enter>"
				..name.."<#>:......Rèt cuéc lµ chuyÖn g× vËy? <enter>V× muèn xem C¸c h¹ cã ph¶i lµ ng­êi ®¸ng ®Ó giao phã chuyÖn lín kh«ng. <enter>"
				..name.."<#>: ChuyÖn lín?<enter>§óng vËy, nãi ra dµi l¾m. GÇn ®©y Thiªn Hoµng Long KhÝ mÊt tÝch ®· l©u ®· t¸i xuÊt giang hå. §ã lµ mét bé ¸o gi¸p tuyÖt thÕ. N¨m x­a tÇn Thñy Hoµng tÊn c«ng Lôc quèc, triÖu tËp thî rÌn b¶y n­íc ®óc thµnh ë Hµm D­¬ng. <enter>"
				..name.."<#>: Cã lo¹i b¶o vËt thÕ sao? Ta kh«ng biÕt g× c¶. <enter> Tin nµy tõ hoµng cung truyÒn ra. Bé ¸o gi¸p nµy øng víi thiªn mÖnh, ai còng muèn cã nã, thËt kh«ng biÕt cßn chuyÖn g× x¶y ra n÷a? <enter>"
				..name.."<#>: Nh­ng ngay sau khi ®óc thµnh c«ng th× TÇn triÒu lËp tøc bÞ diÖt vong, xem ra vËt nµy còng chn¼g tèt lµmh g×! <enter>M¹c SÇu: Nãi còng cã lý! <enter>"
				..name.."<#>: Cßn muèn gi¶i thÝch g× n÷a? <enter> Ta kh«ng biÕt nhiÒu ®©u! ChØ biÕt r»ng v× b¶o khÝ nµy mµ Kim quèc ®· ph¸i rÊt nhiÒu cao thñ ®Õn Trung Nguyªn.<enter>"
				..name.."<#>: Kh«ng biÕt vËt chÕt ng­êi nµy cã g× ®Æc biÖt kh«ng? <enter> Cã nã råi míi tr¶ lêi ®­îc <enter>"
				..name.."<#>: ViÖc nµy liªn quan g× ®Õn ta? <enter> Ta muèn ng­¬i gióp ta. <enter>"
				..name.."<#>: Gióp thÕ nµo?<enter> Ta muèn gióp 1 ng­êi, cøu 1 ng­êi. <enter>"
				..name.."<#>: Gióp ai?Cøu ai? <enter>Ng­¬i b©y giê c«ng lùc cßn yÕu, chê ng­¬i kh¸ h¬n, ta sÏ tù t×m ng­¬i. <enter>"
				..name.."<#>: C« ®· lµ b¹n cña Ngò Gia, ta nhÊt ®Þnh gióp. <enter>Lóc r¶nh cã thÓ ®Õn t×m Ng¹o V©n T«ng, «ng ta lµ thñ lÜnh TÇm Long Héi, cã thÓ sÏ chØ d¹y nhiÒu cho ng­¬i! <enter>"
				..name.."<#>: §­îc! VËy t¹i h¹ xin c¸o tõ. <enter>Khoan ®·, ®©y lµ M¹c X¶o Nhi em ta, võa xuèng nói häc nghÖ, sau nµy hai ng­¬i h·y th­êng xuyªn liªn l¹c. <enter>",
				1, "§èi tho¹i víi M¹c X¶o Nhi/Uworld1001_talk")
	elseif (( Uworld1001 == 60 ) or ( Uworld1001 == 70 )) and ( GetLevel() >= 30 ) then
		Talk(1, "mastertask", "Cè g¾ng lªn")
	elseif ( Uworld1001 == 110 ) or ( Uworld1001 == 120 ) then
		nt_setTask(1001,120)
		Talk(1, "Uworld1001_finish3", "<#> §©y kh«ng ph¶i lµ Hoµng Kim L©n sao?"..name.."<#> B¶n lÜnh cña ng­¬i còng kh«ng tÖ.")
	elseif (( Uworld1001 == 130 ) or ( Uworld1001 == 140 )) and ( GetLevel() >= 40 ) then
		Talk(1, "mastertask", "Cè g¾ng lªn")
	elseif ( Uworld1001 == 180 ) or ( Uworld1001 == 190 )then
		nt_setTask(1001,190)
		Talk(1, "Uworld1001_finish4", "<#> Cöu HiÖn Chi ChØ!"..name.."<#>, ta qu¶ nhiªn kh«ng nh×n lÇm ng­êi.")
	elseif (( Uworld1001 == 200 ) or ( Uworld1001 == 210 )) and ( GetLevel() >= 50 ) then
		Talk(1, "mastertask","Cè g¾ng lªn")
	elseif ( Uworld1001 == 300 ) or ( Uworld1001 == 310 ) then
		nt_setTask(1001,310)
		Describe(name.."<#>: Kh«ng cã g× ®Ó nãi! Giao M¹c SÇu ra ®©y! <enter>"
				..DescLink_ShenMiRen.."<#>: Ng­¬i cho r»ng ta b¾t M¹c SÇu ®i? <enter>"
				..name.."<#>: Ch¼ng lÏ kh«ng ph¶i sao! <enter>Ai chµ! Ng­¬i hiÓu lÇm råi. <enter>"
				..name.."<#>: ý cña ng­¬i lµ...? <enter> Ta lµ chñ nh©n cña TÇm Long Héi, M¹c SÇu ®­îc ta gi¶i cøu,  nay ®ang ë T­¬ng D­¬ng trÞ th­¬ng. <enter>"
				..name.."<#>: Cßn muèn nãi nh¶m n÷a? <enter>"
				..name.."<#> Kh«ng ®­îc v« lÔ! VÞ nµy lµ Chñ nh©n TÇm Long héi--Nam Cung Phi V©n! <enter>",
				1, "§èi tho¹i víi M¹c SÇu/Uworld1001_talk5")
	else
		Describe(DescLink_MoChou.."<#>: Giang hå lµ g×? Ngµy mai sÏ ra sao? Cuèi cïng ta tranh hïng tranh b¸, tay nhuèm bao nhiªu m¸u lµ v× c¸i g×?", 
				1, "KÕt thóc ®èi tho¹i/no")
	end
end

---------------------------------------ÄªÇÉ¶ù------------------------------------------------
function moqiaoer()
	Uworld1001 = nt_getTask(1001)  --ÕýÅÉ
	local name = GetName()  
	if ( Uworld1001 == 10 ) or ( Uworld1001 == 20 )then
		nt_setTask(1001,20) 
		Describe(name.."<#>: Xin hái ng­êi cã ph¶i lµ…."
			..DescLink_MoChou.."<#>? <enter>VÞ ®©y lµ...?<enter>"
			..name.."<#>: Ta cã bøc th­ nµy, ng­êi xem qua sÏ biÕt. <enter>M¹c SÇu nhËn th­.  Trong th­ cã ®éc! <enter>"
			..name.."<#>: C¸i g×? <enter>Ng­¬i….Ng­¬i thËt ¸c ®éc! Nãi! Ai ph¸i ng­¬i ®Õn? <enter>"
			..name.."<#>: Ta kh«ng muèn tiÕt lé danh tÝnh ng­êi ®ã! <enter> Tèt! Ng­¬i kh«ng nãi, h«m nay ®õng hßng rêi khái ®©y! <enter>"
			..name.."<#>: Cho dï cã bá m¹ng n¬i ®©y ta còng kh«ng tiÕt lé danh tÝnh h¾n. <enter> Ta ë bÕn tµu ngoµi thµnh ®îi ng­¬i! Cã b¶n lÜnh h·y ®Õn ®ã! <enter>",
			1,"KÕt thóc ®èi tho¹i/Uworld1001_finish1")
	elseif ( Uworld1001 == 40 ) or ( Uworld1001 == 50 )then
		nt_setTask(1001,50)
		Describe(name.."<#>: Kh«ng ngê vâ nghÖ ng­¬i thËt cao c­êng. <enter>"
			..DescLink_MoChou.."<#>: Ng­¬i cßn kh«ng nãi, ta sÏ phÕ vâ c«ng cña ng­¬i, cã nãi hay kh«ng?<enter>"..name.."<#>: Kh«ng nãi.<enter>M¹c SÇu:......<enter>"
			..name.."<#>:  Ng­¬i giÕt ta ®i. <enter> ThËt kh«ng ngê, thñ h¹ cña Long Ngò l¹i gan d¹ nh­ vËy. <enter>"
			..name.."<#>: Ng­¬i t­ëng ®e däa lµ ta sî ­? <enter>¸i chµ! B»ng h÷u! Ta ®©y chØ thö ng­¬i mµ th«i. Kh«ng tin ng­¬i tù xem th­ ®i sÏ râ. <enter>"
			..name.."<#>:......Rèt cuéc lµ chuyÖn g× vËy? <enter>V× muèn xem C¸c h¹ cã ph¶i lµ ng­êi ®¸ng ®Ó giao phã chuyÖn lín kh«ng. <enter>"
			..name.."<#>: ChuyÖn lín?<enter>§óng vËy, nãi ra dµi l¾m. GÇn ®©y Thiªn Hoµng Long KhÝ mÊt tÝch ®· l©u ®· t¸i xuÊt giang hå. §ã lµ mét bé ¸o gi¸p tuyÖt thÕ. N¨m x­a tÇn Thñy Hoµng tÊn c«ng Lôc quèc, triÖu tËp thî rÌn b¶y n­íc ®óc thµnh ë Hµm D­¬ng. <enter>"
			..name.."<#>: Cã lo¹i b¶o vËt thÕ sao? Ta kh«ng biÕt g× c¶. <enter> Tin nµy tõ hoµng cung truyÒn ra. Bé ¸o gi¸p nµy øng víi thiªn mÖnh, ai còng muèn cã nã, thËt kh«ng biÕt cßn chuyÖn g× x¶y ra n÷a? <enter>"..name.."<#>: Nh­ng ngay sau khi ®óc thµnh c«ng th× TÇn triÒu lËp tøc bÞ diÖt vong, xem ra vËt nµy còng chn¼g tèt lµmh g×! <enter>M¹c SÇu: Nãi còng cã lý! <enter>"
			..name.."<#>: Cßn muèn gi¶i thÝch g× n÷a? <enter> Ta kh«ng biÕt nhiÒu ®©u! ChØ biÕt r»ng v× b¶o khÝ nµy mµ Kim quèc ®· ph¸i rÊt nhiÒu cao thñ ®Õn Trung Nguyªn.<enter>"..name.."<#>: Kh«ng biÕt vËt chÕt ng­êi nµy cã g× ®Æc biÖt kh«ng? <enter> Cã nã råi míi tr¶ lêi ®­îc <enter>"
			..name.."<#>: ViÖc nµy liªn quan g× ®Õn ta? <enter> Ta muèn ng­¬i gióp ta. <enter>"
			..name.."<#>: Gióp thÕ nµo?<enter> Ta muèn gióp 1 ng­êi, cøu 1 ng­êi. <enter>"
			..name.."<#>: Gióp ai?Cøu ai? <enter>Ng­¬i b©y giê c«ng lùc cßn yÕu, chê ng­¬i kh¸ h¬n, ta sÏ tù t×m ng­¬i. <enter>"
			..name.."<#>: C« ®· lµ b¹n cña Ngò Gia, ta nhÊt ®Þnh gióp. <enter>Lóc r¶nh cã thÓ ®Õn t×m Ng¹o V©n T«ng, «ng ta lµ thñ lÜnh TÇm Long Héi, cã thÓ sÏ chØ d¹y nhiÒu cho ng­¬i! <enter>"..name.."<#>: §­îc! VËy t¹i h¹ xin c¸o tõ. <enter>Khoan ®·, ®©y lµ M¹c X¶o Nhi em ta, võa xuèng nói häc nghÖ, sau nµy hai ng­¬i h·y th­êng xuyªn liªn l¹c. <enter>",1,"§èi tho¹i víi M¹c X¶o Nhi/Uworld1001_talk")
	elseif (( Uworld1001 == 60 ) or ( Uworld1001 == 70 )) and ( GetLevel() >= 30 ) then
		Talk(1, "mastertask", "Cè g¾ng lªn")
	elseif ( Uworld1001 == 110 ) or ( Uworld1001 == 120 ) then
		nt_setTask(1001, 120)
		Talk(1, "Uworld1001_finish3", "<#> §©y kh«ng ph¶i lµ Hoµng Kim L©n sao?"..name.."<#> B¶n lÜnh cña ng­¬i còng kh«ng tÖ.")
	elseif (( Uworld1001 == 130 ) or ( Uworld1001 == 140 )) and ( GetLevel() >= 40 ) then
		Talk(1,"mastertask","Cè g¾ng lªn")
	elseif ( Uworld1001 == 180 ) or ( Uworld1001 == 190 )then
		nt_setTask(1001,190)
		Talk(1,"Uworld1001_finish4","Cöu HiÖn Chi ChØ!<#> "..name.."<#>, ta qu¶ nhiªn kh«ng nh×n lÇm ng­êi.")
	elseif (( Uworld1001 == 200 ) or ( Uworld1001 == 210 )) and ( GetLevel() >= 50 ) then
		Talk(1,"mastertask","Cè g¾ng lªn")
	elseif ( Uworld1001 == 300 ) then
		nt_setTask(1001,310)
		Describe(name.."<#>: Kh«ng cã g× ®Ó nãi! Giao M¹c SÇu ra ®©y! <enter>"
			..DescLink_ShenMiRen.."<#>: Ng­¬i cho r»ng ta b¾t M¹c SÇu ®i? <enter>"
			..name.."<#>: Ch¼ng lÏ kh«ng ph¶i sao! <enter>Ai chµ! Ng­¬i hiÓu lÇm råi. <enter>"
			..name.."<#>: ý cña ng­¬i lµ...? <enter> Ta lµ chñ nh©n cña TÇm Long Héi, M¹c SÇu ®­îc ta gi¶i cøu,  nay ®ang ë T­¬ng D­¬ng trÞ th­¬ng. <enter>"
			..name.."<#>: Cßn muèn nãi nh¶m n÷a? <enter>"
			..name.."<#> Kh«ng ®­îc v« lÔ! VÞ nµy lµ Chñ nh©n TÇm Long héi--Nam Cung Phi V©n! <enter>",
			1, "§èi tho¹i víi M¹c SÇu/Uworld1001_talk5")
	else
		Describe(DescLink_MoQiaoEr.."<#>: ThËt téi cho M¹c tû tû, chÝnh tû ®· nu«i ta kh«n lín. Ta biÕt tû yªu mét ng­êi, nh­ng tû ch­a tõng nh¾c ®Õn tªn ng­êi ®ã.",1,"KÕt thóc ®èi tho¹i/no")
	end
end

----------------------------------------¹«×ÓÐ¦-----------------------------------------------
function gongzixiao()
	Uworld1001 = nt_getTask(1001)
	local name = GetName()  
	if ( Uworld1001 == 80 ) or ( Uworld1001 == 90 ) then
		nt_setTask(1001,90)
		Describe(name.."<#>: TiÕu C«ng Tö.<enter>"
				..DescLink_GongZiXiao.."<#>:Xin lçi! T¹i h¹ ph¶i ë bªn linh c÷u cña vong thª, bÊt luËn thÕ nµo chê qua tang kú h·y nãi. <enter>"
				..name.."<#>: §õng qu¸ ®au buån, nh­ng chuyÖn nµy rÊt hÖ träng, nãi xong ta sÏ ®i ngay.<enter> Lêi ta nãi sÏ kh«ng thay ®æi, ng­¬i vÒ ®i! <enter>"
				..name.."<#>: C«ng Tö! T¹i h¹ ®Õn ®©y v× Hoµng Kim L©n! <enter>Ha ha ha ha.......<enter>"
				..name.."<#>: C«ng Tö......<enter> Hoµng Kim L©n, l¹i lµ Hoµng Kim L©n. ChÝnh v× nã mµ ta t¸n gia b¹i s¶n, th6n b¹i danh liÖt h­ thÕ nµy! <enter>"
				..name.."<#>: C«ng Tö......<enter> Hoµng Kim L©n ta ®· ®­a cho thñ h¹ Giíi L­u Phong gi÷. Y ®ang ë tÇng 1 D­îc V­¬ng ®éng, nÕu cã thÓ ®¸nh th¾ng h¾n, Hoµng Kim L©n tïy ng­¬i lÊy. <enter>"
				..name.."<#>: §a t¹ C«ng tö! Xin ®õng qu¸ ®au buån! <enter> B¹n trÎ! V× thø nµy mµ ta ph¶i mÊt ®i mét mg­êi th©n! Sau nµy ng­¬i sÏ hiÓu! <enter>",
				1,"KÕt thóc ®èi tho¹i/taskfinish2")
	else 
		Describe(DescLink_GongZiXiao.."<#>: Giang hå tranh danh ®o¹t lîi. §Ó cã chót danh tiÕng ai còng ph¶i tr¶ mét c¸i gi¸. TiÕc thay c¸i gi¸ mµ ta ph¶i tr¶ chÝnh lµ vî cña ta! ¤i! ¸i thª ¬i...!",1,"KÕt thóc ®èi tho¹i/no")
	end
end

----------------------------------------ÏÄÎÞÇÒ--------------------------------------------------

function xiawuqie()
	Uworld1001 = nt_getTask(1001)
	local name = GetName()  
	if ( Uworld1001 == 150 ) or ( Uworld1001 == 160 ) then
		nt_setTask(1001,160)
		Describe(name.."<#>: Ng­êi lµ H¹ V« Th¶?<enter>"..DescLink_XiaWunQie.."<#>: ChÝnh ta.<enter>"
				..name.."<#>: Ta lµ ng­êi cña TÇm Long Héi. <enter> T¹i sao ta ch­a thÊy qua ng­¬i. <enter>"
				..name.."<#>: Kh«ng cÇn thÊy ta, chØ cÇn biÕt nã lµ ®­îc. <enter>lÖnh bµi ®· mÊt<enter> Ng­¬i lµ ng­êi cña M¹c SÇu? <enter>"
				..name.."<#>: T¹i sao ta ®Õn H¹ tiªn sinh ch¾c ®· râ. <enter>Ta biÕt. D­¬ng Ch©u mäi thø b×nh th­êng! Mêi ngåi! Ta ®· chuÈn bÞ thøc ¨n. <enter>"
				..name.."<#>: H¹ tiªn sinh ®õng quanh co n÷a, «ng biÕt Thiªn Hoµng Long KhÝ chø?<enter> §­¬ng nhiªn biÕt.<enter>"
				..name.."<#>: XuÊt hiÖn ë D­¬ng Ch©u «ng t¹i sao l¹i kh«ng biÕt chø? <enter>  VËy µ, ta ch­a nghe qua tin nµy. <enter>"
				..name.."<#>: H¹ tiªn sinh kh«ng cÇn che giÊu, ta ®· sím biÕt 'Cöu HiÖn Chi ChØ' trªn tay «ng! Giao ra ®©y ®i. <enter> SÇu c« n­¬ng ®· biÕt viÖc nµy råi. <enter>"
				..name.."<#>: H¹ tiªn sinh, ta cho «ng mét con ®­êng sèng. NÕu b©y giê giao ra th× cßn kÞp ®Êy. <enter> NÕu ta kh«ng nãi th× sao? <enter>H¹ V« Th¶ bÞ b¹n ®¸nh gôc.<enter>"
				..name.."<#>: Nãi ®i.<enter> Th«i råi! Lµ H¹ mç bÊt nghÜa tr­íc, ng­¬i lªn tÇng 3 §iÓm Th­¬ng S¬n ®i, ta ®· ®­a cho huynh ®Ö ta Tö §ao HiÖp gi÷ råi. <enter>"
				..name.."<#>: H¹ tiªn sinh, h«m nay ng­êi chøc cao quyÒn träng, ta kh«ng biÕt t¹i sao ng­¬i thÊy lîi quªn nghÜa. <enter> Ha ha ha ha! Ng­¬i qu¸ xem th­êng H¹ mç råi. <enter>",
				1, "KÕt thóc ®èi tho¹i/taskfinish4")
	else
		Describe(DescLink_XiaWunQie.."<#>: ChuyÖn mµ c¶ ®êi ng­êi muèn lµm chØ cã vµi chuyÖn lµm ®­îc, lµm kh«ng thµnh cã mét sè ng­êi tù nguyÖn bá ®i, ta th× kh«ng!", 1, "KÕt thóc ®èi tho¹i/no")
	end
end

---------------------------------------ÃÏ·²---------------------------------------------------------

function mengfan()
	Uworld1001 = nt_getTask(1001)
	local name = GetName()  
	if ( Uworld1001 == 220 ) or ( Uworld1001 == 230 ) then
		nt_setTask(1001,230)
		Describe(name.."<#>: Ng­êi lµ M¹nh Phµm ®¹i thóc ph¶i kh«ng?<enter>"..DescLink_MengFan.."<#>: VÞ ®©y lµ...? <enter>"
				..name.."<#>: Ng­êi cña TÇm Long Héi. <enter> TÇm Long Héi lµ c¸i g×?<enter>"
				..name.."<#>: Cã thÓ M¹nh Phµm kh«ng biÕt TÇm Long Héi?!"
				..name.."<#>: µ, ta ®ïa chót th«i. ¤ng ch¾c biÕt M¹c SÇu?......<enter> Khoan ®·! TÇm Long Héi lµ c¸i g×, M¹c SÇu lµ ai? C¸c h¹ cã ph¶i ®· nhËn lÇm ng­êi råi. <enter>"
				..name.."<#>: M¹nh §¹i thóc, «ng kh«ng tin ta µ? <enter>M¹nh Phµm: Ta thËt sù kh«ng biÕt ng­¬i ®ang nãi c¸i g×. <enter>"
				..name.."<#>:M¹c SÇu mét ®¸m H¾c Y nh©n b¾t ®i, Thiªn Hoµng Long KhÝ mÊt tÝch! NÕu «ng kh«ng tin, cã thÓ dïng bå c©u truyÒn tin t×m X¶o Nhi c« n­¬ng ®èi chøng!<enter> M¹c SÇu bÞ b¾t cãc? X¶y ra lóc nµo vËy.<enter>"
				..name.."<#>: Míi ®©y th«i! <enter> ChuyÖn nµy x¶y ra qu¸ ®ét ngét, ng­¬i h·y ®Õn H­ëng Thñy ®éng ®¸nh b¹i O¸n §éc, nÕu ®em ®­îc thñ cÊp h¾n vÒ ta míi tin. <enter>",
				1, "KÕt thóc ®èi tho¹i/taskfinish6")
	elseif ( Uworld1001 == 250 ) or ( Uworld1001 == 260 ) then
		nt_setTask(1001,260)
		Describe(name.."<#>: M¹nh ®¹i thóc, thñ cÊp ë ®©y, «ng tin ch­a, mäi viÖc kh«ng nªn chËm trÔ.<enter>"
				..DescLink_MengFan.."<#>: B¹n trÎ! Ta ®· hiÓu lÇm. Ta ®· ph¸i thuéc h¹ ®i ®iÒu tra. Ta tin chuyÖn nµy cã liªn quan ®Õn TÇm Long Héi. <enter>"
				..name.."<#>: Chñ nh©n? Chñ nh©n lµ ai? <enter> ViÖc nµy, thø lçi ta kh«ng thÓ nãi......Ta chØ cã thÓ cho ng­¬i biÕt, h¾n lµ ng­êi mµ trªn giang hå t­ëng r»ng ®· chÕt. <enter>"
				..name.."<#>: §· sím chÕt råi?<enter>M¹nh Phµm: Mäi viÖc ng­¬i ®iÒu tra râ råi b¸o cho ta biÕt,chuyÖn nµy kh«ng nªn chËm trÔ. <enter>"
				..name.."<#>: Cã chuyÖn g× lËp tøc b¸o ta biÕt.<enter> NhÊt ®Þnh. X¶o Nhi ë ®ã, ng­¬i kh«ng cÇn quay vÒ, ta ®· s¾p xÕp æn tháa. <enter>",
				1, "KÕt thóc ®èi tho¹i/taskfinish7")
	elseif ( Uworld1001 == 270 ) or ( Uworld1001 == 280 ) then
		Talk(1,"mastertask","§¼ng cÊp cña ng­¬i ®· cao thÕ råi µ?")
	else
		Describe(DescLink_MengFan.."<#>: Ai còng nãi ta rÊt giái, thËt ra còng ch¼ng cã g×. Duy cã ®iÒu lµm ta hµi lßng ­íc m¬ lóc trÎ ®· thµnh hiÖn thùc.",1,"KÕt thóc ®èi tho¹i/no")
	end
end

-------------------------------------------------------------------------------------------------------------
function no()
end


function Uworld1001_finish1()
	DelItem(455)
	AddOwnExp(5000)
	nt_setTask(1001,30)   --»·½Ú¶þend
	Msg2Player("M¹c SÇu b¶o b¹n ra bÕn tµu ngoµi thµnh gÆp c« ta.")
end

function Uworld1001_finish2()
	AddOwnExp(5000)
	AddSkillState( 509, 1, 0, 180);
	prize()
	ex_add_zl_level20();
	Msg2Player("M¹c SÇu nãi sau nµy sÏ t×m b¹n.")
	Talk(1,"mastertask","Cè g¾ng lªn")
end

function Uworld1001_finish3()
	AddOwnExp(10000)
	
	AddSkillState( 509, 1, 0, 180);
	prize()
	ex_add_zl_level30();
	Msg2Player("M¹c SÇu nãi sau nµy sÏ t×m b¹n")
	Talk(1,"mastertask","Cè g¾ng lªn")
end

function Uworld1001_finish4()
	AddOwnExp(20000)
	
	AddSkillState( 509, 1, 0, 180);
	prize()
	ex_add_zl_level40();
	Msg2Player("M¹c SÇu nãi sau nµy sÏ t×m b¹n. C« ta sÏ gióp b¹n tiÕn hµnh tÈy tñy, b©y giê b¹n c¬ héi söa ®iÓm kü n¨ng. NÕu b¹n kh«ng thuéc phe chÝnh ph¸i sÏ kh«ng ®­îc c¬ héi nµy.")
	Talk(1,"mastertask","Cè g¾ng lªn")
end

function Uworld1001_talk()
	local name = GetName()  
	Describe(DescLink_MoQiaoEr.."<#>: Chµo!<enter>"
	..name.."<#>: Chµo! Sau nµy mong muéi muéi gióp ®ì nhiÒu! <enter> Kh¸ch s¸o!<enter>"
	..name.."<#>:¥!<enter>",1,"KÕt thóc ®èi tho¹i/Uworld1001_finish2") 
end

function Uworld1001_talk5()
	local name = GetName()  
	Describe(name.."<#>: Nam Cung......Phi V©n. Lµ Nam Cung ®¹i hiÖp nhiÒu n¨m tr­íc bÞ Thiªn NhÉn Gi¸o chñ ®êi tr­íc ®¸nh r¬i xuèng vùc! <enter>"
	..DescLink_MoChou.."<#>: §óng vËy.<enter>"
	..name.."<#>:<#> Lµ ta sai. <enter> Kh«ng cÇn ¸y n¸y! Ng­¬i còng lo l¾ng cho an nguy cña M¹c SÇu. <enter>"
	..name.."<#>: C¸m ¬n ng­êi ®· hiÓu, Nam Cung §¹i HiÖp! <enter> Ta bÞ ®¸m H¾c Y nh©n b¾t ®i, chÝnh S­ phô cøu ta.<enter>"
	..name.."<#>: Nh÷ng ng­êi ®ã lµ ai? <enter> Ta kh«ng râ, nh­ng nghi ngê lµ cao thñ cña L©m Uyªn Nhai lµm. <enter>"
	..name.."<#>: Lµ tæ chøc g×? <enter> Lµ tæ chøc s¸t thñ gi÷a trung lËp. <enter>"
	..name.."<#>: Bän hä v× Long KhÝ? <enter> §óng, hä muèn thu thËp ®ñ Long KhÝ, ®Ó gi¶i cøu Bang chñ Phu nh©n Hoµn Nhan Nh­îc TuyÕt. <enter>"
	..name.."<#>:µ! Nh­îc TuyÕt phu nh©n n¨m ®ã ®·......? <enter> µ! Phu nh©n ch­a chÕt, chØ bÞ giam ë mét n¬i bÝ mËt. ChØ cã t×m ®ñ Long KhÝ, lÊy ®­îc b¶n ®å n¬i ®ã míi cã thÓ gi¶i cøu Phu nh©n. <enter>",
	1,"§èi tho¹i víi Nam Cung Phi V©n/Uworld1001_talk6")
end

function Uworld1001_talk6()
	local name = GetName()  
	Describe(name.."<#>:Nam Cung §¹i HiÖp.<enter>"
	..DescLink_NanGongFeiYun.."<#>: Ta ®· nghe SÇu Nhi kÓ ng­¬i ®· gióp TÇm Long Héi. Ta kh«ng cã g× ®Ó b¸o ®¸p, c¶m thÊy rÊt hæ thÑn. <enter>"
	..name.."<#>:Nam Cung §¹i HiÖp ®õng lo l¾ng, ta nhÊt ®Þnh t×m ®­îc Phu nh©n. <enter> Ta mµ lµ §¹i hiÖp g×? Ngay c¶ vî còng kh«ng cøu ®­îc. <enter>Chñ nh©n, ng­êi l¹i than ng¾n thë dµi g× vËy. Chóng ta ph¶i ®i th«i. <enter>",
	1,"L¹i ®èi tho¹i víi M¹c SÇu/Uworld1001_talk7")
end

function Uworld1001_talk7()
	local name = GetName()  
	Describe(name.."<#>:......M¹c SÇu, cã ph¶i c« thÝch Nam Cung §¹i HiÖp. <enter>"
	..DescLink_MoChou.."<#>: Nãi bËy, ng­¬i l¹i nhiÒu chuyÖn n÷a, ng­êi ta th©n víi ng­¬i l¾m sao? <enter>"
	..name.."<#>: Ha ha ha.<enter>Ha ha ha, gièng y nh­ h¾n, hai tªn ®¹i ngèc. <enter>"
	..name.."<#>: Ha ha ha.<enter> Ta sÏ cïng Chñ nh©n ®Õn  Thiªn Long tù mét chuyÕn, ng­¬i h·y vÒ gÆp Long Ngò. Ta sÏ liªn l¹c sau. <enter>"
	..name.."<#>: §­îc! Mong mäi ng­êi vui vÎ. <enter> C¸m ¬n ng­¬i ®· gióp ®ì trong thêi gian qua, ta sÏ kh«ng quªn ng­¬i. <enter>",
	1,"KÕt thóc ®èi tho¹i/Uworld1001_finish10")
end

function Uworld1001_finish10()
	AddOwnExp(90000)
	nt_setTask(1001,320)
	AddSkillState( 509, 1, 0, 180);
	ex_add_zl_level60();
	Msg2Player("M¹c SÇu sÏ cïng Nam Cung Phi V©n ®Õn Thiªn Long tù gi¶i quyÕt mét sè chuyÖn, b¹n h·y vÒ gÆp Long Ngò ")
end

function taskfinish2()
	AddOwnExp(10000)
	nt_setTask(1001,100)
	Msg2Player("C«ng Tö TiÕu b¶o b¹n ®i tÇng 1 D­îc V­¬ng ®éng t×m thuéc h¹ Giíi L­u Phong.")
end

function taskfinish4()
	AddOwnExp(15000)
	nt_setTask(1001,170)
	Msg2Player("B¹n lªn §iÓm Th­¬ng S¬n t×m Tö §ao HiÖp.")
end

function taskfinish6()
	AddOwnExp(30000)
	nt_setTask(1001,240)
	Msg2Player("M¹nh Phµm b¶o b¹n ®Õn H­ëng Thñy ®éng tiªu diÖt O¸n §éc, ®em thñ cÊp h¾n vÒ.")
end

function taskfinish7()
	AddOwnExp(40000)
	
	AddSkillState( 509, 1, 0, 180);
	prize()
	ex_add_zl_level50();
	Msg2Player("M¹nh Phµm b¶o b¹n luyÖn tËp thªm, y sÏ ®i hái th¨m tung tÝch M¹c SÇu, khi cã tin sÏ b¸o cho b¹n biÕt.")
	Talk(1,"mastertask","Cè g¾ng lªn")
end
