-------------------------------------------------------------------------
-- FileName		:	nexttask.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-25 21:46:30
-- Desc			:	ĞÂÈÎÎñÏµÍ³ÕıÅÉ£¬ÖĞÁ¢Ö÷ÏßÏÂÒ»¸öÈÎÎñµÄ´¥·¢
-------------------------------------------------------------------------
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\master\\master_head.lua")

-----------------------------------------ÕıÅÉÖ÷Ïß---------------------------------
function mastertask()
	Uworld1001 = nt_getTask(1001)
	name = GetName()
	if (( Uworld1001 == 60 ) or ( Uworld1001 == 70 )) and ( GetLevel() >= 30 ) then
		nt_setTask(1001,70)
		Describe(DescLink_MoChou.."<#>: L©u ngµy kh«ng gÆp, ta nghe nãi ng­¬i trªn giang hå còng cã chót thµnh tùu. <enter>"
				..name.."<#>: A! Lµ M¹c SÇu <enter>MÊy ngµy nay ta rÊt bËn ®iÒu tra tung tİch cña 'Thiªn Hoµng Long Khİ', cuèi cïng còng t×m ®­îc. <enter>"
				..name.."<#>: Muèn ta lµm chuyÖn g×? <enter> Tİn T­íng Tù ë Thµnh §« gÇn ®©y cã nhiÒu kh¸ch hµnh h­¬ng, trong ®ã cã ng­êi tªn C«ng Tö TiÕu. Theo sù ®iÒu tra cña ta,h¾n chİnh lµ C«ng tö TiÕu næi danh n¨m x­a ë Ba Thôc. Ng­êi nµy rÊt giµu cã vµ phãng kho¸ng,thñ h¹ m«n ®å h¬n ngµn ng­êi, n¨m ®ã ®­îc Tø C«ng Tö di phong. <enter>Cã mét n¨m, trong vßng mét th¸ng y ®· cÇm cè hÕt gia s¶n, gÇn ®©y ®ét nhiªn xuÊt hiÖn ë  Tİn T­íng Tù, nghe nãi lµ ®Ó niÖm kinh siªu ®é cho cho ng­êi vî qu¸ cè. Th¸m tö cña ta håi b¸o, mÊy n¨m nay C«ng Tö TiÕu h¾n thu thËp Thiªn Hoµng Long Khİ, trong ®ã Hé UyÓnHoµng Kim L©n ®ang n»m trong tay h¾n. <enter>"
				..name.."<#>: L¹i cã chuyÖn nh­ thÕ µ? <enter>C«ng Tö TiÕu lµ ng­êi tr­îng nghÜa. LÇn nµy ng­¬i ®i kh«ng thÓ dïng søc c­ìng Ğp. NÕu nh­ huynh Êy mét mùc cù tuyÖt th× quay l¹i t×m c¸ch kh¸c. <enter>",
				1, "KÕt thóc ®èi tho¹i/taskfinish1") 
	elseif (( Uworld1001 == 130 ) or ( Uworld1001 == 140 )) and ( GetLevel() >= 40 ) then
		nt_setTask(1001,140)
		Describe(DescLink_MoChou.."<#>: Ai da! Kh«ng biÕt nªn nãi thÕ nµo víi ng­¬i. <enter>"
				..name.."<#>: ThÕ nµo råi M¹c SÇu c« n­¬ng? Cã g× xin cø nãi.<enter> §©y lµ ngµy cuèi cïng ®¸nh chim ­ng, l¹i bŞ nã lµm mï m¾t. <enter>"
				..name.."<#>: L©u ngµy kh«ng gÆp ng­¬i l¹i ñ rò nh­ thÕ. <enter>Bªn trong TÇm Long Héi cã mét m¹ng l­íi t×nh b¸o phøc t¹p c¶ vïng D­¬ng Ch©u do H¹ V« Th¶ phô tr¸ch. <enter>"
				..name.."<#>: Ch¼ng lÏ h¾n ®· x¶y ra chuyÖn g×? <enter>Kh«ng sai.<enter>GÇn ®©y nhËn ®­îc tin 'Cöu HiÖn Chi ChØ' trong 'Thiªn Hoµng Long Khİ' ®· xuÊt hiÖn ë D­¬ng Ch©u. Nh­ng H¹ V« Th¶ kh«ng b¸o l¹i, chØ nãi kh«ng cã manh mèi, víi n¨ng lùc cña h¾n thËt ®¸ng nghi ngê. <enter>"
				..name.."<#>: C« muèn ta lµm thÕ nµo? <enter>§i D­¬ng Ch©u, ®iÒu tra ch©n t­íng ®©y lµ LÖnh bµi cña ta, thÊy LÖnh bµi nh­ thÊy ng­êi. <enter>",
				1,"KÕt thóc ®èi tho¹i/taskfinish3") 
	elseif (( Uworld1001 == 200 ) or ( Uworld1001 == 210 )) and ( GetLevel() >= 50 ) then
		nt_setTask(1001,210)
		Describe(DescLink_MoQiaoEr.."<#>: §¹i sù ch¼ng lµnh!<enter>"
				..name.."<#>: ThÕ nµo råi? <enter> Tû tû ta bŞ mét H¾c Y nh©n b¾t ®i. <enter>"
				..name.."<#>: C¸i g×! Tû tû ng­¬i sao l¹i bŞ ng­êi ta ph¸t hiÖn? <enter> Ta còng kh«ng biÕt,b©y giê trong ®Çu ta rÊt bèi rèi. Cho nªn míi ®Õn t×m ®¹i hiÖp. <enter>"
				..name.."<#>: VËy H¾c Y nh©n ®ã cã ®Æc ®iÓm g×? HoÆc lµ cã ®Ó l¹i dÊu vÕt g× kh«ng.<enter> H¾n cao to tr«ng rÊt khiÕp, chØ mét chiªu ®· khèng chÕ ®­îc M¹c tû. Lóc ta ch¹y ®Õn chØ cßn thÊy c¸i bãng ¸o ®en mµ th«i. <enter>"
				..name.."<#>: Tõ lóc nµo trªn giang hå l¹i xuÊt hiÖn 1 ®¸m cao thñ vËy? ChuyÖn nµy qu¶ nhiªn kh«ng ®¬n gi¶n, cã thÓ liªn quan ®Õn Thiªn Hoµng Long Khİ. <enter> §óng vËy! Ta véi qu¸ quªn cho ng­¬i biÕt Hoµng Kim L©n vµ Cöu HiÖn Chi ChØ ®Òu ®· mÊt tİch. <enter>"..name..": ViÖc nµy qu¸ ®ét ngét, kh«ng chót manh mèi, nhÊt thêi kh«ng biÕt ®Òu tra tõ ®©u.C« nhí l¹i xem, Tû tû c« tr­íc khi bŞ b¾t ®i cã nãi qua g× kh«ng.<enter> §óng råi,Tû tû tõng nãi,nÕu nh­ tû mÊt tİch, th× ®Õn L©m An t×m  M¹nh Phµm. <enter>"
				..name.."<#>: Cã manh mèi nµy qu¶ lµ rÊt tèt. C« chê ë ®©y, ta sÏ ®i t×m h¾n. <enter> §­îc.<enter>",
				1,"KÕt thóc ®èi tho¹i/taskfinish5")
	elseif (( Uworld1001 == 270 ) or ( Uworld1001 == 280 )) and ( GetLevel() >= 60 ) then
		nt_setTask(1001,280)
		Describe(DescLink_MengFan.."<#>: Ta ®· th¸m thİnh ®­îc tung tİch cña SÇu nhi.<enter>"
				..name.."<#>: ë ®©u?<enter>lµ 1 n¬i kh«ng thÓ nµo tin ®­îc.<enter>"
				..name.."<#>:......<enter>MËt ®¹o Nha M«n T­¬ng D­¬ng!<enter>"
				..name.."<#>: C¸i g×? ë chç Quan phñ µ? Ch¼ng lÏ TriÒu ®×nh còng cã liªn quan.<enter>ViÖc nµy ta còng kh«ng biÕt. Ta biÕt ®­îc tung tİch cña Long Khİ xuÊt hiÖn bªn hå Bµ D­¬ng, ph¶i qua bªn ®ã xem míi ®­îc. Ng­¬i h·y ®Õn T­¬ng D­¬ng tïy c¬ hµnh ®éng!<enter>"
				..name.."<#>:M¹nh §¹i thóc «ng yªn t©m! Ta sÏ cã c¸ch.<enter> ThÕ ng­¬i ®i ®©u?<enter>",
				1,"KÕt thóc ®èi tho¹i/taskfinish9")
	end 
end 

function taskfinish1()
		AddOwnExp(10000)
		nt_setTask(1001,80)
		Msg2Player("M¹c SÇu b¶o b¹n ®i Thµnh §« Tİn T­íng Tù t×m C«ng Tö TiÕu ®iÒu tra tung tİch cña Hoµng Kim L©n.")
end

function taskfinish3()
		AddOwnExp(15000)
		nt_setTask(1001,150)
		Msg2Player("M¹c SÇu b¶o b¹n ®i D­¬ng Ch©u t×m  H¹ V« Th¶ ®iÒu tra tung tİch cña Cöu HiÖn Chi ChØ.")
end

function taskfinish5()
		AddOwnExp(30000)
		nt_setTask(1001,220)
		Msg2Player("M¹c X¶o Nhi b¶o b¹n ®i L©m An t×m  M¹nh Phµm, «ng ta biÕt tung tİch cña M¹c SÇu.")
end

function taskfinish9()
		AddOwnExp(50000)
		nt_setTask(1001,290)
		Msg2Player("M¹nh Phµm b¶o b¹n ®i MËt ®¹o T­¬ng D­¬ng, M¹c SÇu bŞ 1 ng­êi thÇn bİ b¾t ®Õn ®ã.")
end

-------------------------------------ÖĞÁ¢Ö÷Ïß----------------------------------------------

function middletask()
	Uworld1002 = nt_getTask(1002)
	name = GetName()
	if (( Uworld1002 == 60 ) or ( Uworld1002 == 70 )) and ( GetLevel() >= 30 ) then
		nt_setTask(1002,70)
		Describe(DescLink_FuNanBin.."<#>: ChØ míi mét thêi gian ng¾n nh­ng b¶n lÜnh cña b¹n ®· tá ra v­ît tréi. <enter>"..name..": Cã tin tøc g×? <enter> Trªn giang hå cã 3 ng­êi kh«ng thÓ giÕt. <enter>"..name..": Ba ng­êi nµo? <enter>Nh¹c Vâ Môc, lµ Vâ th¸nh nh©n, d©n chóng b¸i Phôc, kh«ng thÓ giÕt ®­îc. <enter>Vâ L©m Minh Chñ §éc C« KiÕm, mét kiÕm trong tay, tung hoµnh thiªn h¹. <enter>L­ ThiÖn T­îng, vâ c«ng c¸i thÕ. <enter>"..name..": Hai ng­êi tr­íc ta kh«ng ®ông ®Õn. <enter> Ta muèn ng­¬i ®i khuÊt phôc L­ ThiÖn t­îng. Tªn nµy lµm nhiÒu chuyÖn ¸c, cã ng­êi bá sè tiÒn lín mua m¹ng h¾n. <enter>"..name..": ë ®©u? Lóc nµo?<enter> Kho¸i Ho¹t L©m, néi trong 10 ngµy. <enter>"..name..": Ng­êi chØ cã mét c¬ héi duy nhÊt! <enter> Cßn m¹ng th× quay vÒ gÆp ta. <enter>",1,"KÕt thóc ®èi tho¹i/middlegoon1")
	elseif (( Uworld1002 == 110 ) or ( Uworld1002 == 120 )) and ( GetLevel() >= 40 ) then
		nt_setTask(1002,120)
		Describe(DescLink_FuNanBin.."<#>: Thêi c¬ ®Õn råi! <enter>"..name..": Thêi c¬ g×?<enter> L©m Uyªn Nhai ®· b¾t ®Çu hµnh ®éng. <enter>"..name..": ¤ng nãi râ chót ®i. <enter> Tin tøc trong L©m Uyªn Nhai ®Òu lµ liªn l¹c mét chiÒu, ta chØ biÕt  b¶o ng­¬i ®i Thóy Yªn m«n t×m §¹i s­ tû LÖ Thu Thñy. C« ta sÏ chØ  cho ng­¬i b­íc tiÕp theo. <enter>"..name..": Thóy Yªn m«n? <enter> §óng, søc m¹nh chñ yÕu cña L©m Uyªn Nhai lµ do tinh anh cña mÊy ®¹i m«n ph¸i t¹o thµnh, Thóy Yªn m«n lµ mét trong sè ®ã. Bİ mËt nµy trªn giang hå rÊt İt ng­êi biÕt. <enter>"..name..": VËy ®­îc! Ta ®i t×m c« ta. <enter>",1,"KÕt thóc ®èi tho¹i/middlegoon2")
	elseif (( Uworld1002 == 180 ) or ( Uworld1002 == 190 )) and ( GetLevel() >= 50 ) then
		nt_setTask(1002,190)
		Describe(DescLink_FuNanBin.."<#>: ChiÕn th­¬ng 'Long §o¹n' trong 'Thiªn Hoµng B¸t Khİ' tõng lµ TrÊn bang chi b¶o cña Thiªn V­¬ng Bang, ®¸ng tiÕc sau ®ã bŞ kÎ l¹ c­íp ®i. Thiªn V­¬ng Bang lµ 1 phÇn quan träng cña L©m Uyªn Nhai,h¬n n÷a Bang chñ D­¬ng Anh lµ Chñ nh©n cña L©m Uyªn Nhai. GÇn ®©y nghe nãi chuyÖn nµy cã liªn quan ®Õn Hµn Giang §éc §iÕu TÈu. Ng­êi nµy cã cèng hiÕn rÊt nhiÒu cho Thiªn V­¬ng, chñ nh©n cña hä kh«ng muèn ®İch th©n ra tay! Ng­¬i cã thÓ ®¶m nhËn viÖc nµy kh«ng? <enter>",1,"KÕt thóc ®èi tho¹i/middlegoon3")
	elseif (( Uworld1002 == 240 ) or ( Uworld1002 == 250 )) and ( GetLevel() >= 60 ) then
		nt_setTask(1002,250)
		Describe(DescLink_FuNanBin.."<#>: §¹i sù ch¼ng lµnh, theo mËt th¸m håi b¸o, Tæ chøc bİ mËt Chİnh ph¸i TÇm Long Héi thu thËp ®­îc 2 ThÇn khİ, nÕu ®Ó bän hä cã ®ñ bé kÕ ho¹ch cña chóng ta sÏ kh«ng cã ngµy hoµn thµnh.V× hy väng cña b¸ t¸nh, ng­¬i nhÊt ®Şnh ph¶i ®o¹t l¹i ThÇn khİ bŞ M¹c SÇu ®­a cho Kh«ng TŞch. H¾n ®ang ë trong ThiÕu L©m Tù. H·y t×m h¾n ®o¹t l¹i b¶o khİ. Hy väng cña L©m Uyªn Nhai n»m trong tay ng­êi! <enter>",1,"KÕt thóc ®èi tho¹i/middlegoon4")
		end 
end 

function middlegoon1()
	AddOwnExp(10000)
	nt_setTask(1002,80)
	Msg2Player("Phã Nam B¨ng b¶o b¹n ®i Kho¸i Ho¹t L©m ®¸nh b¹i L­ ThiÖn T­îng.")
end

function middlegoon2()
	AddOwnExp(15000)
	nt_setTask(1002,130)
	Msg2Player("Phã Nam B¨ng b¶o b¹n ®i Thóy Yªn m«n t×m LÖ Thu Thñy.")
end

function middlegoon3()
	AddOwnExp(30000)
	nt_setTask(1002,200)
	Msg2Player("Phã Nam B¨ng b¶o b¹n ®i Thiªn V­¬ng Bang t×m Hµn Giang §éc §iÕu TÈu.")
end

function middlegoon4()
	AddOwnExp(50000)
	nt_setTask(1002,260)
	Msg2Player("Phã Nam B¨ng b¶o b¹n ®i ThiÕu L©m Tù t×m Kh«ng TŞch §¹i S­.")
end
