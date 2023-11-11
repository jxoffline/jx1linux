-- ĞÂÈÎÎñÏµÍ³½ÌÑ§ÈÎÎñÖ÷ÒªNPC  £¨\ÓÎÏ·ÔËĞĞ×ÊÔ´\script\global\dragonfive.lua£©
-- ÏÂÒ»²½½øĞĞµ½ĞÂÊÖ´åÎäÊ¦´¦		 (\ÓÎÏ·ÔËĞĞ×ÊÔ´\script\global\¸÷ÅÉ½ÓÒıµÜ×Ó\Çá¹¦_ÎäÊ¦Ä£°æ.lua)
-- BY£ºXIAOYANG£¨2004-11-29£©

Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\branch\\branch_head.lua")
Include("\\script\\task\\newtask\\master\\newtaskprize.lua")
Include("\\script\\task\\newtask\\education_setnpcpos.lua")
Include("\\script\\task\\partner\\master\\partner_mastertask.lua")
---------------------------------ÁúÎå¶Ô»°-------------------------------------

function Uworld1000_word()
	Say("Lo¹n thÕ phong v©n, binh khëi tø ph­¬ng, ta cã vµi nhiÖm vô ph¶i nhê ng­¬i gióp",5,
		"Ta ®Õn nhËn nhiÖm vô S¬ nhËp/iwantdotask",
		"Ta muèn bá nhiÖm vô s¬ nhËp/iwantkilltask",
		"Ta ®Õn lµm nhiÖm vô Chİnh tuyÕn cÊp 20 trë lªn/iwantgetmastertask",
		"Ta ®Õn xem giíi thiÖu vÒ nhiÖm vô /iwantseetask",
		"Sau nµy h·y nãi/no")
end

function iwantdotask()
	do return end
	Uworld1000 = nt_getTask(1000)
	Uworld1001 = nt_getTask(1001)
	Uworld1002 = nt_getTask(1002)
	Uworld1003 = nt_getTask(1003)
	Uworld1014 = nt_getTask(1014)
	local name = GetName()
	if ( Uworld1000 == 0 ) and ( GetLevel() <= 1 ) then --µÈ¼¶Ğ¡ÓÚ1¶øÇÒµÚÒ»´ÎµÇÂ½ÓÎÏ·£¬ÕâÀï»¹ĞèĞŞ¸Ä¡£
		Say("Chµo mõng b¹n ®Õn víi thÕ giíi Vâ L©m TruyÒn Kú. B¹n cã muèn t×m hiÓu kiÕn thøc s¬ l­îc kh«ng? Nh÷ng kiÕn thøc nµy cã thÓ gióp b¹n ®Ó sinh tån trong thÕ giíi nµy.",2,"Tèt qu¸! Ta muèn cßn kh«ng ®­îc./Uworld1000_goon","Th«i khái! ¤ng th× biÕt c¸i g× /Uworld1000_no")
	elseif ( GetLevel() > 1 ) and ( Uworld1000 == 0 ) then --µÈ¼¶´óÓÚ1£¬Ã»ÓĞ×ö¹ı½ÌÑ§ÈÎÎñµÄÍæ¼Ò
		Say("Hoan nghªnh ng­¬i ®Õn th«n,  cã muèn häc vµi ®iÒu ®Ó tån t¹i trong giang hå kh«ng?",2,"Häc chø!/Uworld1000_goon","Th«i sau nµy h·y nãi./Uworld1000_no")
	elseif ( Uworld1000 == 40 ) or ( Uworld1000 == 50 ) then 
		nt_setTask(1000,50) --»·½Ú3start
		Talk (9,"Uworld1000_good2",name.."<#>: Long thñ lÜnh, Ta ®· t×m Vâ s­ häc vâ xong.","Nhanh thÕ µ?",name.."<#>: Ta ®· th¨ng cÊp råi.","ThÕ tèt, nhÊn F3 më giao diÖn thuéc tİnh, thÊy thanh s¸ng søc m¹nh, th©n ph¸p, néi c«ng, ngo¹i c«ng.",name.."<#>: ThÊy råi.","Søc m¹nh ¶nh h­ëng ®Õn sö dông vò khİ vµ kh¶ n¨ng c«ng kİch ngo¹i c«ng. Mçi lÇn t¨ng 5 ®iÓm søc m¹nh tÊn c«ng c¬ b¶n t¨ng 1 ®iÓm?th©n ph¸p ¶nh h­ëng ®Õn viÖc tÊn c«ng c¬ b¶n ngo¹i c«ng.mçi lÇn t¨ng 5 ®iÓm th©n ph¸p tÊn c«ng c¬ b¶n t¨ng 1 ®iÓm. §ång thêi th©n ph¸p còng ¶nh h­ëng ®Õn kh¶ n¨ng nĞ tr¸nh cña nh©n vËt. mçi lÇn t¨ng 1 ®iÓm th©n ph¸p, Kim Méc Thñy Háa Thæ Thæ ph©n biÖt t¨ng 4 ®iÓm sinh lùc.",name.."<#>: Sao phøc t¹p thÕ?","Ta ®· sím b¶o ng­¬i nhí nhÊn F12 xem th­ ta göi cho ng­¬i, cã g× kh«ng hiÓu nhÊn F1 xem CÈm nang.",name.."<#>: õ, thÕ th× tiÖn lîi h¬n.")
	elseif (( Uworld1000 == 60 ) or ( Uworld1000 == 70 )) and ( GetLevel() >= 3 ) then
		nt_setTask(1000,70) --»·½Ú4start
		Talk (5,"Uworld1000_high4",name.."<#>: Long thñ lÜnh, ta tù thÊy m×nh cã tiÕn bé.","TiÕn bé? Ng­¬i ra ngoµi chØ lµ lµm måi cho ng­êi ta th«i.",name.."<#>:......","ChiÕn tranh triÒn miªn, hiÓm nguy khã l­êng! NÕu gÆp khã kh¨n h·y t×m c¸c th­¬ng nh©n nh­ chñ d­îc ®iÕm, thî rÌn, chñ t¹p hãa ®Ó häc İt kinh nghiÖm.",name.."<#>:......")	
	elseif ( Uworld1000 == 140 ) or (Uworld1000 == 150 ) then
		nt_setTask(1000,150) --»·½Ú8start
		Talk (5,"Uworld1000_high8","ThÕ nµo, häc ®­îc kh«ng İt ph¶i kh«ng.",name.."<#>: Còng t¹m.","B©y giê h·y ®i uèng n­íc, lªn <color=red>cÊp 5<color> ®Õn t×m ta, thø cÇn häc cßn nhiÒu l¾m, mäi ng­êi ®Òu thÕ c¶.",name.."<#>:  HiÓu råi.","§­îc råi, b©y giê nÕu kh«ng mÖt, cã thÓ ®i t×m Vâ s­ häc khinh c«ng, kh«ng häc còng kh«ng sao.")
	elseif (( Uworld1000 == 160 ) or ( Uworld1000 == 170 )) and ( GetLevel() >= 5 ) then
		nt_setTask(1000,170) --»·½Ú9start
		Talk (9,"Uworld1000_good3","VÒ råi µ? GÇn ®©y mçi lóc tr¨ng trßn ban ®ªm th­êng cã ¸c lang, ng­¬i ra ngoµi luyÖn c«ng nªn cÇn thËn.",name.."<#>: Mét hai con Sãi th× cã ®¸ng g×?","Ch¼ng ®¸ng g×? Ng­¬i cã giái th× ®i giÕt mét ngµn con vÒ ®©y.",name.."<#>:? Muèn lµm khã ta sao?","Hõ! Nªn khiªm tèn 1 chót! Ng­¬i dÔ dµng tù m·n nh­ thÕ sao ra giang hå ®­îc!",name.."<#>:...... HiÓu råi.","Ng­¬i nÕu kh«ng tin cã thÓ ®i hái ng­êi kh¸c xem. ",name.."<#>: Lµm sao hái?","Ên phİm (Enter) (nhí chän tÇn sè t¸n gÉu) sau ®ã trùc tiÕp nhËp vµo lêi ng­¬i cÇn nãi råi l¹i nhÊn (Enter ) ®Ó göi ®i")
	elseif (( Uworld1000 == 200 ) or ( Uworld1000 == 210 )) then
		nt_setTask(1000,210) --»·½Ú11start
		Talk (5,"Uworld1000_high10","ThÕ nµo?",name.."<#>: Lµ ta sai!","§­îc råi! Ng­¬i cã thÓ l·nh ngé, chøng tá t­ chÊt kh«ng tÖ! Ng­¬i cã thÓ luyÖn tËp thªm, kh«ng l©u sau ta sÏ cho ng­¬i biÕt mét quyÕt ®Şnh quan träng.",name.."<#>: Lµ quyÕt ®Şnh g×?","§îi <color=red>cÊp 10<color> råi h½ng nãi,  trong th«n cã vŞ D· TÈu,  «ng ta cã vµi nhiÖm vô nhá cho ng­¬i,  nÕu hoµn thµnh kh«ng nh÷ng ®­îc ®iÓm kinh nghiÖm mµ cßn nhËn ®­îc vËt phÈm ®Æc biÖt.")
	elseif (( Uworld1000 == 220 ) or ( Uworld1000 == 230 )) and ( GetLevel() >= 10 ) then --ĞÂÊÖ´å½ÌÓıÈÎÎñ½áÊø
		nt_setTask(1000,230) --»·½Ú12start
		Talk (7,"Uworld1000_high11","Nhanh thÕ µ? Míi ®©y th«i ®· häc mäi thø ë ta.",name.."<#>: Häc xong råi?","Chí véi mõng, ng­¬i chØ míi ®ñ t­ c¸ch gia nhËp ThËp ®¹i m«n ph¸i trong Vâ l©m.",name.."<#>: ThËp ®¹i m«n ph¸i lµ g×?","Kh«ng thÊy §Ö tö c¸c ph¸i trong th«n sao? KÕt côc Tèng Kim khã ®o¸n, giang hå hiÓm ¸c, c¸c m«n ph¸i ®Òu chiªu mé thªm ®Ö tö ®Ó t¨ng thªm thÕ lùc. Ng­êi trong giang hå th©n bÊt do kû, con ®­êng cña ng­¬i tù quyÕt ®Şnh lÊy.",name.."<#>: Long......Ngò, «ng cßn g× c¨n dÆn g× n÷a kh«ng?.","§­êng xa hiÓm trë, nªn tù b¶o träng. §i t×m §Ö tö tiÕp dÉn NhËp m«n ®i. NhËp m«n xong, t×m npc gióp ®ì lµ cã thÓ t×m ta, nhí ph¶i liªn l¹c víi ta, ta cã chót chuyÖn? Muèn giao cho ng­¬i. Khi kh«ng râ g× vÒ nhiÖm vô nhÊn F12, vÒ thao t¸c nhÊn F1.")
	elseif ( Uworld1000 == 260 ) or (Uworld1000 == 270 ) then
		nt_setTask(1000,270) --»·½Ú14start(1)
		Talk (3,"Uworld1000_good","Ta nghiªm kh¾c víi ng­¬i v× thÊy ng­¬i cã t­ chÊt, hy väng sÏ kh«ng phô lßng ta, vâ c«ng chia lµm néi c«ng vµ ngo¹i c«ng. Thuéc tİnh còngchia lµm hÖ néi c«ng vµ hÖ ngo¹i c«ng.Lóc ng­¬i luyÖn vâ c«ng nªn xem râ.",name.."<#>: Néi c«ng vµ ngo¹i c«ng kh¸c nhau ë ®©u?","Trªn vò khİ cã c¸c thuéc tİnh hç trî cã thÓ t¨ng thªm vâ c«ng cña ng­¬i. NÕu ng­¬i theo néi c«ng th× cã néi b¨ng, néi thñy, néi ®éc. Sau khi c¸c thuéc tİnh cña vò khİ ®­îc ®· kİch ho¹t th× cã thÓ t¨ng thªm. Ngo¹i b¨ng, ngo¹i háa kh«ng gióp g× ng­¬i. Vµ ng­îc l¹i!",name.."<#>:  A! Th× ra lµ thÕ.")	
	elseif (( Uworld1000 == 280 ) or ( Uworld1000 == 290) ) and ( GetLevel() >= 20 ) then
		nt_setTask(1000,290) --»·½Ú15start
		Talk (5,"Uworld1000_high13","T¹i sao l¹i ®Õn, t¹i sao l¹i ®Õn?",name.."<#>:......Ngò Gia, l©u ngµy kh«ng gÆp, «ng ®· giµ nhiÒu råi.","Kim CÈu mÊy ngµy tr­íc ®i qua ®©y, Bµ chñ tiÖm t¹p hãa bŞ......",name.."<#>: Ngò Gia!","Th«i råi, uæng c«ng ta phİ nhiÒu c«ng søc, ®Õn cuèi cïng còng ®¸nh kh«ng l¹i Kim CÈu, ta ®· giµ råi, thÕ giíi nµy lµ cña tuæi trÎ c¸c ng­¬i.")
	elseif ( Uworld1000 >= 10) and ( Uworld1000 <= 440 ) then
		Talk (1,"","Phiªu b¹t giang hå rÊt cùc khæ, ng­¬i nªn tù luyÖn tËp thªm. Cã g× kh«ng hiÓu nhÊn<color=red>F12<color>, xem th­ nhiÖm vô.")
	elseif ( Uworld1000 == 1000 ) then
		Talk(1,"","Giang hå hiÓm ¸c, mäi chuyÖn ng­¬i nªn cÈn thËn. Sau nµy ta kh«ng thÓ lo cho ng­¬i, h·y b¶o träng!")
	end
end

function iwantkilltask()
	do return end
	Uworld1000 = nt_getTask(1000)
	Uworld1067 = nt_getTask(1067)
	local name = GetName()
	if ( Uworld1000 ~= 0 ) and ( Uworld1000 ~= 1000 ) then
		if ( Uworld1067 ~= 10 ) then
			education_changewuxing()
		end
		nt_setTask(1000,1000)
		Msg2Player("B¹n ®· xãa bá nhiÖm vô s¬ nhËp. Trªn giao diÖn nhiÖm vô sÏ hiÓn thŞ nh÷ng nhiÖm vô ®· hoµn thµnh, nÕu b¹n ch­a nhËn nhiÖm vô cã thÓ ®Õn ®èi tho¹i víi Long Ngò. Sau nµy b¹n sÏ kh«ng thÓ lµm nhiÖm vô s¬ nhËp n÷a!")
	elseif ( Uworld1000 == 1000 ) then
		Talk(1,"","Ng­¬i ®· hoµn thµnh nhiÖm vô S¬ nhËp, kh«ng cÇn lµm n÷a.")
	else
		Talk(1,"","Ng­¬i ch­a nhËn nhiÖm vô S¬ nhËp!")
	end
end

function iwantgetmastertask()
	Uworld1000 = nt_getTask(1000)
	Uworld1001 = nt_getTask(1001)
	Uworld1002 = nt_getTask(1002)
	Uworld1003 = nt_getTask(1003)
	Uworld1014 = nt_getTask(1014)
	local name = GetName()
	if ( Uworld1001 == 320 ) then
		Talk(1,"Uworld1000_zhenghigh1000","NhiÖm vô khã kh¨n cña M¹c SÇu giao, kh«ng ph¶i ai còng lµm ®­îc! Long mç tù hµo vÒ ng­¬i!")
	elseif ( Uworld1002 == 310 ) then
		Talk(1,"Uworld1000_zhonghigh1000","S¸t thñ xuÊt th©n tõ L©m Uyªn Nhai ®Òu lµ cao thñ tuyÖt thÕ! Ng­¬i h·y ®Õn ®ã ®Ó rÌn luyÖn ®i!")
	elseif ( Uworld1003 == 430 ) then
		Talk(1,"Uworld1000_xiepai1000","Cã chót quµ nµy tÆng ng­¬i!")
	elseif  (GetLevel() >= 20 ) then -- µÈ¼¶´óÓÚ20µÄÍæ¼Ò
		Say("Ng­¬i trªn giang hå ®· cã chót c¨n c¬, cã muèn nhËn vµi nhiÖm vô kh«ng?",2,"Ta muèn lµm nhiÖm vô cÊp 20 trë lªn/Uworld1000_more","Ta chØ ®Õn ch¬i /Uworld1000_no")
	elseif ( GetLevel() < 20 ) then
		Talk(1,"","§¼ng cÊp cña ng­¬i ch­a ®¹t yªu cÇu, ®îi cÊp 20 h·y quay l¹i.")
	elseif ( GetLastFactionNumber() == -1 ) then
		Talk(1,"","Xin lçi! B¹n ch­a gia nhËp m«n ph¸i, nh÷ng nhiÖm vô nµy kh«ng thİch hîp!")
	end
end

function iwantseetask()
	Describe(DescLink_LongWu.."<#>:  HÖ thèng nhiÖm vô míi chia thµnh<color=red> s¬ nhËp, chİnh tuyÕn vµ phô tuyÕn<color>.<color=red>NhiÖm vô s¬ nhËp<color>: tÊt c¶ ng­êi ch¬i ®Òu cã thÓ tiÕp nhËn, muc ®İch ®Ó giíi thiÖu nh÷ng ®Æc s¾c vµ thao t¸c trong Vâ L©m TruyÒn Kú. Cã thÓ bá <color=red> nhiÖm vô s¬ nhËp<color>, nh­ng sau nµy sÏ kh«ng thÓ lµm ®­îc.<color=red> NhiÖm vô chñ tuyÕn<color>:  tõ<color=red> cÊp 20<color> ®Õn<color=red> cÊp 60<color>, mçi<color=red> 10 cÊp<color> cã mét nhiÖm vô, gåm 3 phe: <color=red>Chİnh ph¸i, Trung lËp, Tµ ph¸i<color> Ph¶i nhËp m«n míi cã thÓ tiÕp nhËn nhiÖm vô. Sau khi hoµn thµnh sÏ nhËn ®­îc Trang bŞ Hoµng Kim vµ ®iÓm kinh nghiÖm. <color=red> NhiÖm vô phô tuyÕn<color> ph¶i tiÕp nhËn nhiÖm vô t­¬ng øng víi ®¼ng cÊp míi cã thÓ hoµn thµnh, nÕu b¹n muèn tiÕp nhËn nhiÖm vô phô tuyÕn tõ cÊp 30 ®Õn 39, b¹n ph¶i tiÕp nhËn  nhiÖm vô chñ tuyÕn Tµ ph¸i cÊp 30 tr­íc. Khi ®ang lµm nhiÖm vô s¬ nhËp kh«ng thÓ tiÕp nhËn nhiÖm vô phô tuyÕn. Gi¶i th­ëng cña c¸c nhiÖm vô rÊt phong phó, hy väng b¹n cã thÓ ®¾m m×nh vµ th­ëng"
	.."<color=red> NÕu ng­êi ch¬i míi b­íc vµo thÕ giíi cña trß ch¬i, chóng ta sÏ cho mét ng­êi b¹n ®ång hµnh cïng b¹n phiªu b¹t giang hå. ChØ cÇn nhÊn'ta muèn lµm nhiÖm vô cïng b¹n ®ång hµnh' lµ cã thÓ chän b¹n ®ång hµnh.<color>",1,"KÕt thóc ®èi tho¹i/no")
end

function Uworld1000_goon()
	Talk (1,"Uworld1000_title","Chóng ta b¾t ®Çu häc. Nãi tr­íc, ®· vµo th«n xem nh­ ng­êi mét nhµ, nÕu thÊy ta nghiªm kh¾c th× th«i vËy! Tr­íc khi b¾t ®Çu ng­¬i cã thÓ chän mét ng­êi b¹n ®ång hµnh cïng phiªu b¹t giang hå. H·y nhÊn vµo dßng 'Ta muèn lµm nhiÖm vô ®ång hµnh'.")
end


function Uworld1000_more() --´Ë´¦Îª20¼¶ÈÎÎñµÄÈë¿ÚÖ®Ò»
	Uworld1001 = nt_getTask(1001)
	Uworld1002 = nt_getTask(1002)
	Uworld1003 = nt_getTask(1003)
	Uworld183 = nt_getTask(183)
	Uworld186 = nt_getTask(186)
	Uworld189 = nt_getTask(189)
	if (( Uworld1001 < 10 ) or ( Uworld1002 < 10 ) or ( Uworld1003 < 10 ))  and ( GetLastFactionNumber() ~= -1 ) then
	Say("Ng­¬i muèn lµm nhiÖm vô phe nµo?",4,"Phe Chİnh/Uworld1000_camp1","Phe Trung lËp/Uworld1000_camp2","Phe Tµ ph¸i/Uworld1000_camp3","§Ó ta nghÜ l¹i!/Uworld1000_no")
	elseif ( HaveCommonItem(6,1,131) > 0 ) then
		Talk(1,"","Ch¼ng ph¶i ng­¬i ®· nhËn ®­îc tói th­ cña ta µ, mau më ra xem.")
	elseif ( GetLastFactionNumber() == -1 ) then
		Talk(1,"","Ng­¬i ch­a nhËp m«n ph¸i nµo,kh«ng thÓ tiÕp nhËn nhiÖm vô.")
	else
		Talk(1,"","B»ng h÷u, sau nµy ng­¬i ph¶i tù b¶o träng.")
	end
end

function Uworld1000_camp1()
	Uworld1001= nt_getTask(1001)
	Uworld183 = nt_getTask(183)
  	if ( Uworld1001 < 10 ) then
	  	AddItem(6,1,131,0,0,0)
	  	nt_setTask(183,10)
	  	Msg2Player("NhËn ®­îc mét tói th­ cña Long Ngò.")
	else 
		Talk(1,"","Ng­¬i ch¼ng ph¶i ®ang lµm nhiÖm vô phe Chİnh sao? T¹i sao cßn muèn lµm n÷a.")
	end
end

function Uworld1000_camp2()
	Uworld186 = nt_getTask(186)
	Uworld1002 = nt_getTask(1002)
	if ( Uworld1002 < 10 ) then
  	AddItem(6,1,131,0,0,0)
  	nt_setTask(186,10)
  	Msg2Player("NhËn ®­îc mét tói th­ cña Long Ngò.")
  else 
		Talk(1,"","Ch¼ng ph¶i ng­¬i ®ang lµm nhiÖm vô Phe Trung lËp sao?")
	end
end

function Uworld1000_camp3()
	Uworld189 = nt_getTask(189)
	Uworld1003 = nt_getTask(1003)
	if ( Uworld1003 < 10 ) then
	  	AddItem(6,1,131,0,0,0)
	  	nt_setTask(189,10)
	  	Msg2Player("NhËn ®­îc mét tói th­ cña Long Ngò.")
  	else 
		Talk(1,"","Ch¼ng ph¶i ng­¬i ®· tiÕp nhËn nhiÖm vô Phe Tµ ph¸i sao? T¹i sao muèn lµm n÷a.")
	end
end

function Uworld1000_no()
	Talk (1,"","Khi nµo gÆp nguy hiÓm h·y nhÊn F1, xem CÈm nang cã thÓ gióp ®­îc b¹n.")
end

function Uworld1000_title()
	local name = GetName()  
	Talk (4,"Uworld1000_and","Hoan nghªnh ng­¬i ®Õn ®©y, ta lµ tr­ëng th«n. B©y giê bªn ngoµi rÊt hçn lo¹n. Bän giÆc Kim d· man giÕt ng­êi kh«ng chíp m¾t, xa xa cã thÓ nghe thÊy tiÕng vã ngùa, tiÕng g­¬m ®ao lo¶ng xo¶ng. Ban ®ªm m©y mï x¸m xŞt, khãi löa kh¾p n¬i, lßng d©n ho¶ng lo¹n. Ng­¬i ®i ®­êng nhÊt ®Şnh ph¶i cÈn thËn",name.."<#>:  Ta míi ®Õn nªn cã nhiÒu viÖc kh«ng hiÓu, xin ®¹i ca chØ d¹y!","Trong th«n võa më líp d¹y nh÷ng ng­êi trÎ tuæi nh­ ng­êi, häc mét İt còng lµ tèt v× ng­¬i cã thÓ mÊt m¹ng bÊt cø lóc nµo","Cho dï thÕ nµo còng ph¶i cè gi÷ lÊy tİnh m¹ng",name.."<#>:  µ ta cã mét lı t­ëng, ®ã lµ sÏ cã mét ngµy ta.....")
	
end

function Uworld1000_and()
	local name = GetName()
	if( SubWorldIdx2ID( SubWorld ) == 53 ) then  --°ÍÁê
		Talk(1,"","Khoan nãi ®·! Mau ra ngoµi th«n t×m vâ s­ ®i! Tr­íc ®ã h·y giÕt vµi con heo rõng, lÊy 3 miÕng thŞt heo ®­a cho «ng ta. Täa ®é <color=red>209/186<color>.")
	elseif ( SubWorldIdx2ID( SubWorld ) == 174 ) then  --ÁúÈª´å
		Talk(1,"","Khoan nãi ®·! Mau ra ngoµi th«n t×m vâ s­ ®i! Tr­íc ®ã h·y giÕt vµi con heo rõng, lÊy 3 miÕng thŞt heo ®­a cho «ng ta. Täa ®é <color=red>197/216<color>.")
 	elseif ( SubWorldIdx2ID( SubWorld ) == 121 ) then  --ÁúÃÅÕò
		Talk(1,"","Khoan nãi ®·!! Mau ra ngoµi th«n t×m vâ s­ ®i, tr­íc khi ®i ®¸nh vµi con thó, lÊy 3 miÕng thŞt t­¬i ®­a cho «ng ta. Täa ®é <color=red>237/239<color>.")
 	elseif ( SubWorldIdx2ID( SubWorld ) == 153 ) then  --Ê¯¹ÄÕò
		Talk(1,"","Khoan nãi ®·! Mau ra ngoµi th«n t×m vâ s­ ®i! Tr­íc ®ã h·y giÕt vµi con heo rõng, lÊy 3 miÕng thŞt heo ®­a cho «ng ta. Täa ®é <color=red>207/203<color>.")
 	elseif ( SubWorldIdx2ID( SubWorld ) == 101 ) then  --µ¾Ïã´å
		Talk(1,"","Khoan nãi ®·! Mau ra ngoµi th«n t×m vâ s­ ®i! Tr­íc ®ã h·y giÕt vµi con heo rõng, lÊy 3 miÕng thŞt heo ®­a cho «ng ta. Täa ®é <color=red>208/184<color>.")
 	elseif ( SubWorldIdx2ID( SubWorld ) == 99 ) then   --ÓÀÀÖÕò
		Talk(1,"","Khoan nãi ®·! Mau ra ngoµi th«n t×m vâ s­ ®i! Tr­íc ®ã h·y giÕt vµi con heo rõng, lÊy 3 miÕng thŞt heo ®­a cho «ng ta. Täa ®é <color=red>207/214<color>.")
 	elseif ( SubWorldIdx2ID( SubWorld ) == 100 ) then  --ÖìÏÉÕò
		Talk(1,"","Khoan nãi ®·! Mau ra ngoµi th«n t×m vâ s­ ®i! Tr­íc ®ã h·y giÕt vµi con heo rõng, lÊy 3 miÕng thŞt heo ®­a cho «ng ta. Täa ®é <color=red>217/192<color>.")
 	elseif ( SubWorldIdx2ID( SubWorld ) == 20 ) then   --½­½ò´å
		Talk(1,"","Khoan nãi ®·! Mau ra ngoµi th«n t×m vâ s­ ®i! Tr­íc ®ã h·y giÕt vµi con heo rõng, lÊy 3 miÕng thŞt heo ®­a cho «ng ta. Täa ®é <color=red>454/391<color>.")
 	end
 	Talk(5,"Uworld1000_find","¤ng Êy rÊt thİch uèng r­îu, ®em chót måi qua, kh«ng chõng sÏ d¹y ng­¬i chót vâ c«ng. §i kh«ng nhanh cã thÓ bÊm nót R ®Ó ch¹y.","Cã thÊy b¶n ®å nhá phİa trªn bªn ph¶i kh«ng?  NÕu kh«ng thÊy nhÊn tab më ra. Phİa trªn cã vŞ trİ,  sè thø nhÊt lµ h­íng §«ng T©y, bªn tr¸i lµ phİa T©y, bªn ph¶i lµ phİa §«ng. Sè thø hai lµ h­íng Nam B¾c, bªn trªn lµ phİa B¾c, ë d­íi lµ phİa Nam.","Cø theo vŞ trİ mµ ®i, phİa d­íi bªn ph¶i b¶n ®å nhá cã vµi biÓu t­îng nhá, ng­¬i xem qua sÏ biÕt. Gi÷ chuét ph¶i chØ vµo b¶n ®å cã thÓ xem c¸c khu vùc khµc. Th«i ta mÖt råi, ng­¬i ®i ®i.",name.."<#>:  HiÓu råi.","§óng råi, sau nµy nÕu kh«ng nhí chuyÖn ta nãi víi ng­¬i, nhÊn <color=red>F12<color>, xem th­ cña ta göi cho ng­¬i sÏ râ.")
end


function Uworld1000_find()
	nt_setTask(1000,10) --ÈÃÍæ¼ÒÈ¥ÕÒÎäÊ¦£¬ÈÎÎñ±äÁ¿ÉèÎª10£¬»·½ÚÒ»start
	Msg2Player("Long Ngò b¶o b¹n ra ngoµi th«n t×m Vâ s­, tr­íc khi ®i h·y ®¸nh thó lÊy ®­îc 3 miÕng thŞt t­¬i.") 
	seteducationnpcpos()
end


function Uworld1000_good2()
	local name = GetName()
	Talk(4,"Uworld1000_high3","Ngo¹i c«ng t¨ng sinh lùc, néi c«ng t¨ng néi lùc. Ngò hµnh t­¬ng kh¾c, t¨ng sinh lùc vµ néi lùc còng kh«ng gièng nhau. Giê ng­¬i cã thÓ thö xem, quy t¾c lµ: t¨ng 1 ®iÓm ngo¹i c«ng øng víi Kim Méc Thñy Háa Thæ mçi thø t¨ng 8, 5, 6, 7, 3 ®iÓm sinh lùc.",name.."<#>:  VËy néi c«ng th× sao?","Mçi lÇn t¨ng 1 ®iÓm néi c«ng øng víi Kim Méc Thñy Háa Thæ mçi thø t¨ng 1, 3, 3, 2, 4 ®iÓm néi lùc.",name.."<#>:  Th× ra lµ vËy, xem ra ta ph¶i thËn trong t¨ng ®iÓm.","H«m nay còng mÖt råi, nghØ ng¬i tr­íc ®·, ngµy mai quay l¹i t×m ta. H·y nhí, tr­íc hÕt h·y luyÖn ®Õn cÊp 3")
	
end

function Uworld1000_high3()
Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 50 ) then
		AddOwnExp(350)						
		nt_setTask(1000,60) --»·½Ú3end
		Msg2Player("Long Ngò Ng­¬i ®¹t ®Õn cÊp 3 h·y ®Õn t×m ta")
	end
end

function Uworld1000_high4()			
Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 70 ) then
		AddOwnExp(350)			
		nt_setTask(1000,80) --»·½Ú4end
		Msg2Player("Long Ngò b¶o b¹n ®Õn ®èi tho¹i víi Chñ tiÖm t¹p hãa.")
		seteducationnpcpos()
	end
end

function Uworld1000_high8()
	nt_setTask(1000,160) --»·½Ú8end
	Msg2Player("Long Ngò b¶o b¹n ®¹t ®Õn cÊp 5 h·y ®Õn, b©y giê ®Õn gÆp Vâ s­ häc khinh c«ng.")
end

function Uworld1000_good3()
	local name = GetName()
	Talk(6,"Uworld1000_high9","Trong trß ch¬i b¹n gÆp bÊt cø vÊn ®Ò g× ®Òu cã thÓ th«ng qua c¸ch ®èi tho¹i víi ng­êi ch¬i kh¸c t×m trî gióp. NhÊn<color=red> ctrl<color> dïng chuét chØ vµo ng­êi b¹n muèn ®èi tho¹i lµ cã thÓ ®èi tho¹i. Lóc míi b¾t ®Çu, chØ cã thÓ chän kªnh <Ng­êi ch¬i phô cËn> ®Ó ®èi tho¹i víi ng­êi kh¸c.",name.."<#>:  ¤ng nãi víi ta nhiÒu thÕ ®Ó lµm g×?","Hõ! Thö ®i hái mäi ng­êi xem, mét tªn t«m tĞp cña T©n Thñ th«n nh­ ng­¬i th× cã ®¸ng g×? Ng­¬i t­ëng m×nh lµ ®¹i hiÖp giang hå råi sao?",name.."<#>: ¤ng nãng n¶y qu¸!","H·y ®i t×m Vâ s­, ®õng quªn ®em <color=red>5 miÕng thŞt t­¬i.<color>! Cè g¾ng luyÖn tËp.",name.."<#>:......")
end

function Uworld1000_high9()
Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 170 ) then
		AddOwnExp(800)
		nt_setTask(1000,180) --»·½Ú9end
		Msg2Player("Long Ngò muèn b¹n ®i t×m ng­êi nãi chuyÖn, sau ®ã ®i t×m Vâ s­. §õng quªn ®em theo 5 miÕng thŞt t­¬i.")
		seteducationnpcpos()
	end
end

function Uworld1000_high10()
Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 210 ) then
		AddOwnExp(400)
		nt_setTask(1000,220) --»·½Ú11end
		Msg2Player("Long Ngò muèn b¹n ®Õn cÊp 10 míi ®Õn «ng ta.")
	end
end

function Uworld1000_high11()
Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 230 ) then
		AddOwnExp(3000)
		nt_setTask(1000,240) --»·½Ú12end
		Msg2Player("Long Ngò b¶o b¹n cã thÓ nhËp m«n ThËp ®¹i ph¸i, h·y vµo th«n t×m §Ö tö tiÕp dÉn cña M«n ph¸i. Sau khi nhËp m«n ®Õn chç NPC trî gióp t×m Long Ngò.")
	end
end

function Uworld1000_good()
	local name = GetName()
	Talk(4,"Uworld1000_high12","Cã thÓ Ên [F5] ®Ó xem tÊt c¶ c¸c kü n¨ng ®· häc. NÕu muèn chuyÓn ®æi nhanh chiªu thøc, cã thÓ nhÊp chuét vµo biÓu t­îng kü n¨ng sö dông ë d­íi gãc ph¶i giao diÖn cho xuÊt hiÖn c¸c chiªu thøc theo hµng ngang, sau ®ã chØ chuét vµo chiªu thøc bÊt kú.","Dïng c¸c phİm <color=red><q>, <w>, <e>, <a>, <s>, <d>, <z>, <x>, <c><color> ®Ó chuyÓn ®æi nhanh khi sö dông.",name.."<#>:  å, nh­ thÕ lµ cã thÓ thao t¸c ®­îc råi.","Sau nµy luyÖn vâ sÏ ngµy cµng cùc khæ, ng­¬i chuÈn bŞ xong råi th× ®i ®i. §Õn cÊp 20 ®Õn t×m ta, ta sÏ ®îi ng­¬i ë ®©y.")
end

function Uworld1000_high12()
Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 270 ) then
		AddOwnExp(3000)
		nt_setTask(1000,280) --»·½Ú14end
		Msg2Player("Long Ngò nãi víi b¹n chê ®Õn cÊp 20 ®Õn gÆp «ng ta.")
	end
end

function Uworld1000_high13()
	local name = GetName()
	local curCamp = nt_getCamp();
	if  ( curCamp == 0 ) then --È±ÉÙÖ§ÏßnpcµÄ×ø±ê
		Talk(3,"Uworld1000_find2","B¹n h·y ®Õn Phông T­îng t×m Ng¹o V©n T«ng, «ng ta sÏ tiÕp tôc gióp ®ì b¹n",name.."<#>:  Ngò Gia, sau nµy «ng cã dù tİnh g×?","Yªn t©m ®i, hä Long ta kh«ng dÔ chÕt nh­ vËy ®©u, ta cßn ph¶i ®Êu víi bän Kim CÈu tíi cïng!")
	elseif  ( curCamp == 1 ) then --È±ÉÙÖ§ÏßnpcµÄ×ø±ê
		Talk(3,"Uworld1000_find2","Ng­¬i ®Õn t×m LiÔu Nam V©n, «ng ta sÏ tiÕp tôc gióp ng­¬i! ¤ng ta ë L©m An.",name.."<#>:  Ngò Gia, sau nµy «ng cã dù tİnh g×?","Yªn t©m ®i, hä Long ta kh«ng dÔ chÕt nh­ vËy ®©u, ta cßn ph¶i ®Êu víi bän Kim CÈu tíi cïng!")
	elseif  ( curCamp == 2 ) then --È±ÉÙÖ§ÏßnpcµÄ×ø±ê
	  	Talk(3,"Uworld1000_find2","Ng­¬i h·y ®Õn BiÖn Kinh t×m Tiªu s­ cña Th¸c B¹t Hoµi Xuyªn, «ng ta sÏ gióp ng­¬i, y ®ang ë BiÖn Kinh.",name.."<#>:  Ngò Gia, sau nµy «ng cã dù tİnh g×?","Yªn t©m ®i, hä Long ta kh«ng dÔ chÕt nh­ vËy ®©u, ta cßn ph¶i ®Êu víi bän Kim CÈu tíi cïng!")
	end
end

function Uworld1000_find2()
Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 290 ) then
		AddOwnExp(5000)
		nt_setTask(1000,300)
		Msg2Player("Long Ngò b¶o b¹n ®i t×m mét ng­êi, y cã thÓ gióp b¹n.")
	end
end

function Uworld1000_zhenghigh1000()
Uworld1001 = nt_getTask(1001)
	if ( Uworld1001 == 320 ) then
		AddOwnExp(150000)
		prize()
		
		Msg2Player("B¹n ®· hoµn thµnh nhiÖm vô M¹c SÇu giao, Long Ngò v« cïng hµi lßng, nh­ng b­íc ®­êng giang hå chØ míi b¾t ®Çu.")
	end
end

function Uworld1000_zhonghigh1000()
Uworld1002 = nt_getTask(1002)
	if ( Uworld1002 == 310 ) then
		AddOwnExp(150000)
		prize()
		
		Msg2Player("B¹n ®· hoµn thµnh nhiÖm vô s¸t thñ Phã Nam B¨ng giao, trªn giang hå b¹n ®· cã chót danh tiÕng, ®©y còng kh«ng ph¶i lµ chuyÖn tèt, trong thµnh cã nhiÒu tai m¾t theo dâi")
	end
end

function Uworld1000_xiepai1000()
Uworld1003 = nt_getTask(1003)
	if ( Uworld1003 == 430 ) then
		prize()
		
		Msg2Player("B¹n ®· hoµn thµnh nhiÖm vô chñ tuyÕn Tµ ph¸i, sau nµy cã lÏ cã nhiÒu trËn chiÕn ®ang chê ng­¬i, mét kÎ m¸u l¹nh.")
	end
end

function education_changewuxing()
	Uworld1067 = nt_getTask(1067)
	local Uworld445 = HaveMagic(445)
	local Uworld446 = HaveMagic(446)
	local Uworld447 = HaveMagic(447)
	local Uworld448 = HaveMagic(448)
	local Uworld449 = HaveMagic(449)
	if ( Uworld445 ~= -1 ) or ( Uworld446 ~= -1 ) or ( Uworld447 ~= -1 ) or ( Uworld448 ~= -1 ) or ( Uworld449 ~= -1 ) then
		if ( Uworld445 ~= -1 ) then
			DelMagic(445)
			AddMagic(534,1)
			AddMagicPoint(Uworld445)
		elseif ( Uworld446 ~= -1 ) then
			DelMagic(446)
			AddMagic(535,1)
			AddMagicPoint(Uworld446)
		elseif ( Uworld447 ~= -1 ) then
			DelMagic(447)
			AddMagic(536,1)
			AddMagicPoint(Uworld447)
		elseif ( Uworld448 ~= -1 ) then
			DelMagic(448)
			AddMagic(537,1)
			AddMagicPoint(Uworld448)
		elseif ( Uworld449 ~= -1 ) then
			DelMagic(449)
			AddMagic(538,1)
			AddMagicPoint(Uworld449)
		end
		nt_setTask(1067,10)
		Msg2Player("Ngò hµnh tr­íc ®©y cña b¹n chØ ®Ó hé th©n, kh«ng thÓ chiÕn ®Êu! HiÖn ®· thay ®æi  kü n¨ng chiÕn ®Êu cho b¹n!")
	end
end