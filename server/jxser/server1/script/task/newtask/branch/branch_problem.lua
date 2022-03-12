--ËÎ½ğÎÊ´ğ £¨Å¼ÓÃÁËÒ»ÖÖÓŞ´ÀµÄĞ´·¨£¬°¥£©
--by xiaoyang
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\branch\\branch_head.lua")

function branch_songjinproblem()

	Describe("D­íi ®©y lµ c¸c c©u hái vÒ ChiÕn tr­êng Tèng Kim. H·y chuÈn bŞ tinh thÇn nhĞ! B¾t ®Çu ®­îc ch­a?<enter>",2,"B¾t ®Çu!/branch_problemstart","§Ó ta suy nghÜ kü l¹i xem/no")
end

function branch_problemstart()
	Describe(DescLink_SongJinProblem.."1.Khi ®· biÕn thµnh NPC gi÷ cê, lµm sao ®Ó biÕt ®­îc täa ®é cÇn ®Õn vµ c¾m ®­îc So¸i kú?<enter>"
	.."A: Sau khi ®o¹t ®­îc So¸i Kú, « th«ng b¸o sÏ b¸o täa ®é môc tiªu cÇn ®Õn, hoÆc tïy ı nhÊp vµo cê hiÖu ®Ó biÕt ®­îc täa ®é môc tiªu. Cê hiÖu sÏ kh«ng mÊt cho ®Õn khi ®Õn ®­îc môc tiªu, tiÕp tôc nhÊp vµo cê hiÖu ®Ó c¾m So¸i Kú vµ mÊt ®i Cê hiÖu.<enter>" --y
	.."B: Sau khi ®o¹t ®­îc So¸i Kú, « th«ng b¸o sÏ b¸o täa ®é môc tiªu cÇn ®Õn, hoÆc tïy ı nhÊp vµo cê hiÖu ®Ó biÕt ®­îc täa ®é môc tiªu, nh­ng cê hiÖu sÏ mÊt ®i. Sau khi ®Õn ®­îc môc tiªu, tiÕp tôc nhÊp vµo cê hiÖu ®Ó c¾m So¸i Kú vµ mÊt ®i Cê hiÖu.<enter>"
	.."C: Sau khi ®o¹t ®­îc So¸i Kú, « th«ng b¸o sÏ b¸o täa ®é môc tiªu cÇn ®Õn, hoÆc tïy ı nhÊp vµo cê hiÖu ®Ó biÕt ®­îc täa ®é môc tiªu. Sau khi ®Õn ®­îc môc tiªu, tiÕp tôc nhÊp vµo Cê hiÖu ®Ó c¾m So¸i Kú. Cê hiÖu bÊt luËn sö dông thÕ nµo còng kh«ng mÊt ®i.<en"
	.."Trong 3 ®¸p ¸n bªn trªn, ®¸p ¸n nµo chİnh x¸c?<enter>",
	3,"A/branch_problem1a","B/branch_problem1b","C/branch_problem1c")
end

function branch_problem1a()
		Describe(DescLink_SongJinProblem.."2.Thêi gian b¾t ®Çu Tèng Kim ®¹i chiÕn cña phiªn b¶n míi lµ mÊy giê?<enter>"
	.."A: B¾t ®Çu b¸o danh tõ 12:00 ®Õn 24:00  mçi ngµy. Thêi gian b¸o danh lµ 30 phót. Sau khi kÕt thóc b¸o danh sÏ chİnh thøc khai chiÕn, thêi gian chiÕn ®Êu lµ 60 phót <enter>"
	.."B: Kh«ng cã thêi gian cè ®Şnh mµ sÏ do hÖ thèng th«ng b¸o.<enter>"
	.."C: Mçi ngµy b¾t ®Çu b¸o danh vµo lóc 11h:00, 13h:00; 15h:00; 17h:00; 19h:00; 21h:00. Thêi gian b¸o danh lµ 30 phót. B¸o danh kÕt thóc chİnh thøc khai chiÕn. Thêi gian chiÕn ®Êu 60 phót.<enter>" --y
	.."Trong 3 ®¸p ¸n bªn trªn, ®¸p ¸n nµo chİnh x¸c?<enter>",
	3,"A/branch_problem2a","B/branch_problem2b","C/branch_problem2c")
	
end

function branch_problem1b()
	Talk(1,"","Xin lçi! B¹n ®· tr¶ lêi sai! Thö l¹i nhĞ!")
	return
end

function branch_problem1c()
	Talk(1,"","Xin lçi! B¹n ®· tr¶ lêi sai! Thö l¹i nhĞ!")
	return
end

function branch_problem2a()
	Talk(1,"","Xin lçi! B¹n ®· tr¶ lêi sai! Thö l¹i nhĞ!")
	return
end

function branch_problem2b()
	Talk(1,"","Xin lçi! B¹n ®· tr¶ lêi sai! Thö l¹i nhĞ!")
	return
end

function branch_problem2c()
		Describe(DescLink_SongJinProblem.."3. Sau khi vµo khu vùc chiÕn ®Êu, lµm thÕ nµo ®Ó biÕt ®­îc t×nh h×nh chiÕn sù hiÖn t¹i? <enter>"
	.."A:Ng­êi ch¬i cã thÓ tïy lóc sö dông phİm ~ ( phİm n»m trªn phİm tab) ®Ó ®ãng hoÆc më giao diÖn chiÕn b¸o, sÏ t×nh h×nh chiÕn cuéc hiÖn t¹i.<enter>"--y
	.."B:Ng­êi ch¬i chØ cã thÓ biÕt ®­îc t×nh h×nh chiÕn sù trong « th«ng b¸o ë gãc tr¸i bªn d­íi <enter>"
	.."C:Ng­êi ch¬i cã thÓ ®Õn Qu©n Nhu Quan ë hËu doanh ®Ó hái t×nh h×nh chiÕn sù<enter>" 
	.."Trong 3 ®¸p ¸n bªn trªn, ®¸p ¸n nµo chİnh x¸c?<enter>",
	3,"A/branch_problem3a","B/branch_problem3b","C/branch_problem3c")
end

function branch_problem3a()
	Describe(DescLink_SongJinProblem.."4. B¸o danh Tèng Kim ®¹i chiÕn phiªn b¶n míi cÊn nh÷ng ®iÒu kiÖn g×? <enter>"
	.."A: Kh«ng h¹n chÕ ®¼ng cÊp, chØ cÇn ®ãng phİ b¸o danh 3000 l­îng lµ cã thÓ tham gia. Sau khi b¸o danh kÕt thóc, kh«ng thÓ b¸o danh n÷a.<enter>"
	.."B:Ng­êi ch¬i cÇn ®¹t ®­îc hoÆc v­ît qua cÊp 40 vµ ®ãng phİ b¸o danh 3000 l­îng lµ cã thÓ tham gia. Sau khi thêi gian b¸o danh kÕt thóc nh­ng sè ng­êi b¸o danh tham chiÕn ch­a ®Õn 400 ng­êi, vÉn cã thÓ tiÕp tôc b¸o danh tham gia.<enter>"--y
	.."C:Ng­êi ch¬i cÇn®¹t ®­îc hoÆc v­ît qua cÊp 40 vµ ®ãng phİ b¸o danh 3000 l­îng lµ cã thÓ tham gia. Sau khi thêi gian b¸o danh kÕt thóc, kh«ng thÓ b¸o danh n÷a.<enter>" 
	.."Trong 3 ®¸p ¸n bªn trªn, ®¸p ¸n nµo chİnh x¸c?<enter>",
	3,"A/branch_problem4a","B/branch_problem4b","C/branch_problem4c")
end

function branch_problem3b()
	Talk(1,"","Xin lçi! B¹n ®· tr¶ lêi sai! Thö l¹i nhĞ!")
	return
end

function branch_problem3c()
	Talk(1,"","Xin lçi! B¹n ®· tr¶ lêi sai! Thö l¹i nhĞ!")
	return
end

function branch_problem4a()
	Talk(1,"","Xin lçi! B¹n ®· tr¶ lêi sai! Thö l¹i nhĞ!")
	return
end

function branch_problem4b()
	Describe(DescLink_SongJinProblem.."5.Ng­êi ch¬i ®o¹t ®­îc So¸i Kú, biÕn thµnh qu©n cÇm cê, c¸c gi¸ trŞ thuéc tİnh cã thay ®æi kh«ng?<enter>"
	.."A: Cã. C¸c thuéc tİnh cña ng­¬i ch¬i nh­ kh¸ng tİnh vµ lùc tÊn c«ng ®Òu ®­îc t¨ng.<enter>"
	.."B: Kh«ng cã thay ®æi g×.<enter>"
	.."C: Cã. Tèc ®é ch¹y cña ng­êi ch¬i sÏ bŞ gi¶m theo, c¸c thuéc tİnh kh¸c kh«ng thay ®æi.<enter>" --y
	.."Trong 3 ®¸p ¸n bªn trªn, ®¸p ¸n nµo chİnh x¸c?<enter>",
	3,"A/branch_problem5a","B/branch_problem5b","C/branch_problem5c")
end

function branch_problem4c()
	Talk(1,"","Xin lçi! B¹n ®· tr¶ lêi sai! Thö l¹i nhĞ!")
	return
end

function branch_problem5a()
	Talk(1,"","Xin lçi! B¹n ®· tr¶ lêi sai! Thö l¹i nhĞ!")
	return
end

function branch_problem5b()
	Talk(1,"","Xin lçi! B¹n ®· tr¶ lêi sai! Thö l¹i nhĞ!")
	return
end

function branch_problem5c()
	Describe(DescLink_SongJinProblem.."6. Khi tham gia Tèng Kim ®¹i chiÕn, bŞ rít m¹ng ph¶i lµm thÕ nµo?<enter>"
	.."A: Sau khi b¸o danh bŞ rít m¹ng gi÷a chõng hoÆc ®ang tham chiÕn bŞ rít m¹ng, vµo m¹ng l¹i cã thÓ trùc tiÕp ®i b¸o danh b»ng c¸ch ®èi tho¹i xin gia nhËp, kh«ng cÊn ph¶i ®ãng thªm phİ b¸o danh.<enter>"--y
	.."B: Sau khi b¸o danh bŞ rít m¹ng gi÷a chõng hoÆc ®ang tham chiÕn bŞ rít m¹ng, vµo m¹ng l¹i cã thÓ trùc tiÕp ®èi tho¹i xin gia nhËp, nh­ng ph¶i ®ãng thªm phİ b¸o danh.<enter>"
	.."C: Sau khi b¸o danh bŞ rít m¹ng gi÷a chõng hoÆc ®ang tham chiÕn bŞ rít m¹ng, vµo m¹ng l¹i kh«ng thÓ gia nhËp n÷a, chØ cã thÓ ®îi ttrËn sau.<enter>" 
	.."Trong 3 ®¸p ¸n bªn trªn, ®¸p ¸n nµo chİnh x¸c?<enter>",
	3,"A/branch_problem6a","B/branch_problem6b","C/branch_problem6c")
end

function branch_problem6a()
	Describe(DescLink_SongJinProblem.."7. Phiªn b¶n Tèng Kim míi cã tæn thÊt khi tö vong hay kh«ng?<enter>"
	.."A: Cã tæn thÊt nhÊt ®Şnh khi tö vong, sÏ mÊt ®i mét sè ®iÓm kinh nghiÖm nhÊt ®Şnh, sau khi tö vong ®­îc chuyÓn ®Õn hËu doanh cña chiÕn tr­êng, cã thÓ tiÕp tôc x«ng lªn chiÕn tuyÕn.<enter>"
	.."B: Kh«ng cã bÊt k× tæn thÊt nµo, sau khi tö vong ®­îc chuyÓn ®Õn hËu doanh chiÕn tr­êng, ng­êi ch¬i cã thÓ tiÕp tôc x«ng lªn chiÕn tuyÕn.<enter>"--y
	.."C: Cã. Sau khi tö vong sÏ kh«ng thÓ gia nhËp chiÕn tr­êng nh­ng sÏ kh«ng mÊt ®iÓm kinh nghiÖm vµ tiÒn.<enter>" 
	.."Trong 3 ®¸p ¸n bªn trªn, ®¸p ¸n nµo chİnh x¸c?<enter>",
	3,"A/branch_problem7a","B/branch_problem7b","C/branch_problem7c")
end

function branch_problem6b()
	Talk(1,"","Xin lçi! B¹n ®· tr¶ lêi sai! Thö l¹i nhĞ!")
	return
end

function branch_problem6c()
	Talk(1,"","Xin lçi! B¹n ®· tr¶ lêi sai! Thö l¹i nhĞ!")
	return
end

function branch_problem7a()
	Talk(1,"","Xin lçi! B¹n ®· tr¶ lêi sai! Thö l¹i nhĞ!")
	return
end

function branch_problem7b()
	Describe(DescLink_SongJinProblem.."8.Cã thÓ mua C«ng cô Tèng Kim chuyªn dïng kh«ng?<enter>"
	.."A: Cã thÓ. Tr­íc khi khai chiÕn, ng­êi ch¬i cã thÓ  dïng ®iÓm tİch lòy ®Ó ®æi c«ng cô chuyªn dông t¹i Qu©n Nhu Quan.<enter>"--y
	.."B: Cã thÓ. Ng­êi ch¬i  cã thÓ ®Õn Qu©n Nhu Quan bÊt cø lóc nµo ®Ó mua c«ng cô Tèng Kim chuyªn dïng, cÇn ph¶i tèn mét sè tiÒn nhÊt ®Şnh.<enter>"
	.."C: Kh«ng thÓ. Ng­êi ch¬i chØ cã thÓ nhËn ®­îc khi h¹ gôc mét NPC  trong chiÕn tr­êng.<enter>" 
	.."Trong 3 ®¸p ¸n bªn trªn, ®¸p ¸n nµo chİnh x¸c?<enter>",
	3,"A/branch_problem8a","B/branch_problem8b","C/branch_problem8c")
end

function branch_problem7c()
	Talk(1,"","Xin lçi! B¹n ®· tr¶ lêi sai! Thö l¹i nhĞ!")
	return
end

function branch_problem8a()
	Describe(DescLink_SongJinProblem.."9. Sau khi gia nhËp chiÕn tr­êng cã thÓ bµy b¸n vËt phÈm kh«ng?<enter>"
	.."A: Ng­êi ch¬i chØ cã thÓ bµy b¸n ë  ®iÓm b¸o danh Tèng Kim.<enter>"
	.."B: Ng­êi ch¬i kh«ng thÓ bµy b¸n trong chiÕn tr­êng vµ ®iÓm b¸o danh Tèng Kim.<enter>"
	.."C: Ng­êi ch¬i cã thÓ bµy b¸n trong chiÕn tr­êng vµ ®iÓm b¸o danh Tèng Kim.<enter>" --y
	.."Trong 3 ®¸p ¸n bªn trªn, ®¸p ¸n nµo chİnh x¸c?<enter>",
	3,"A/branch_problem9a","B/branch_problem9b","C/branch_problem9c")	
end

function branch_problem8b()
	Talk(1,"","Xin lçi! B¹n ®· tr¶ lêi sai! Thö l¹i nhĞ!")
	return
end

function branch_problem8c()
	Talk(1,"","Xin lçi! B¹n ®· tr¶ lêi sai! Thö l¹i nhĞ!")
	return
end

function branch_problem9a()
	Talk(1,"","Xin lçi! B¹n ®· tr¶ lêi sai! Thö l¹i nhĞ!")
	return
end

function branch_problem9b()
	Talk(1,"","Xin lçi! B¹n ®· tr¶ lêi sai! Thö l¹i nhĞ!")
	return
end

function branch_problem9c()
	Describe(DescLink_SongJinProblem.."10. Trong chiÕn tr­êng Tèng Kim, cã thÓ tïy ı ®æi phe ®­îc kh«ng? <enter>"
	.."A: Kh«ng ®­îc. Ng­êi ch¬i  khi tham gia b¸o danh bªn nµo, sau nµy trong tÊt c¶ c¸c chiÕn dŞch ng­êi ch¬i nhÊt thiÕt ph¶i tham gia bªn ®ã.<enter>"
	.."B: Kh«ng! Mçi ng­êi trong 1 lÇn chiÕn dŞch chØ cã thÓ tham gia 1 phe. <enter>"
	.."C: §­îc! TrËn ®Çu tham gia phe nµy, trËn sau cã thÓ tham gia phe kia. <enter>"--y
	.."Trong 3 ®¸p ¸n bªn trªn, ®¸p ¸n nµo chİnh x¸c?<enter>",
	3,"A/branch_problem10a","B/branch_problem10b","C/branch_problem10c")	
end

function branch_problem10a()
	Talk(1,"","Xin lçi! B¹n ®· tr¶ lêi sai! Thö l¹i nhĞ!")
	return
end

function branch_problem10b()
	Talk(1,"","Xin lçi! B¹n ®· tr¶ lêi sai! Thö l¹i nhĞ!")
	return
end

function branch_problem10c()
	Describe(DescLink_SongJinProblem.."11. Lµm thÕ nµo ®Ó vµo chiÕn tr­êng Tèng Kim?<enter>"
	.."A:  Cã thÓ ®Õn ®iÓm b¸o danh phe Tèng t¹i T­¬ng D­¬ng, ®iÓm b¸o danh phe Kim t¹i Chu Tiªn TrÊn hoÆc sö dông Tèng Kim Chiªu th­ ®Ó trùc tiÕp ®Õn ®iÓm b¸o danh.<enter>"--y
	.."B: §Õn Xa phu tr¶ mét kho¶n tiÒn nhÊt ®Şnh ®Ó ®Õn ®iÓm b¸o danh.<enter>"
	.."C: §Õn vÖ binh thµnh m«n nép 5000 l­îng ®Ó trùc tiÕp ®­a ®Õn chiÕn tr­êng Tèng Kim.<enter>" 
	.."Trong 3 ®¸p ¸n bªn trªn, ®¸p ¸n nµo chİnh x¸c?<enter>",
	3,"A/branch_problem11a","B/branch_problem11b","C/branch_problem11c")	
end

function branch_problem11a()
	Describe(DescLink_SongJinProblem.."12. Lµm thÕ nµo cã ®­îc Tèng Kim Chiªu th­?<enter>"
	.."A: §¸nh qu¸i vËt cã ®­îc.<enter>"
	.."B: Cã thÓ ®Õn tiÖm t¹p hãa ®Ó mua, mçi c¸i 5000 l­îng.<enter>"--y
	.."C: CÇn dïng vËt phÈm ®Æc biÖt ®Ó ®æi.<enter>" 
	.."Trong 3 ®¸p ¸n bªn trªn, ®¸p ¸n nµo chİnh x¸c?<enter>",
	3,"A/branch_problem12a","B/branch_problem12b","C/branch_problem12c")	
end

function branch_problem11b()
	Talk(1,"","Xin lçi! B¹n ®· tr¶ lêi sai! Thö l¹i nhĞ!")
	return
end

function branch_problem11c()
	Talk(1,"","Xin lçi! B¹n ®· tr¶ lêi sai! Thö l¹i nhĞ!")
	return
end

function branch_problem12a()
	Talk(1,"","Xin lçi! B¹n ®· tr¶ lêi sai! Thö l¹i nhĞ!")
	return
end

function branch_problem12b()
	Describe("Chóc mõng b¹n ®· ®¸p chİnh x¸c! B¹n ®· qua ¶i!",1,"KÕt thóc ®èi tho¹i/branch_problemend")
end

function branch_problem12c()
	Talk(1,"","Xin lçi! B¹n ®· tr¶ lêi sai! Thö l¹i nhĞ!")
	return
end

function branch_problemend()
	Uworld1053 = nt_getTask(1053)
	Uworld1057 = nt_getTask(1057)
	Uworld1061 = nt_getTask(1061)
	AddOwnExp(200000)
	if ( Uworld1053 == 30 ) then
		nt_setTask(1053,40)
	elseif ( Uworld1057 == 50 ) then
		nt_setTask(1057,60)
	elseif ( Uworld1061 == 50 ) then
		nt_setTask(1061,60)
	end
	Msg2Player("B¹n ®· qua ¶i thµnh c«ng! Cã thÓ nhËn nhiÖm vô tiÕp theo!")
end