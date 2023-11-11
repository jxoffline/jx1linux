-- ĞÂÈÎÎñÏµÍ³
-- BY:XIAOYANG(2004-11-29)

Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\master\\master_head.lua")
Include("\\script\\task\\newtask\\education_setnpcpos.lua")
-----------------------------------ĞÂÊÖ´åÎäÊ¦-----------------------------
function education_wushi()
	Uworld1000 = nt_getTask(1000)      -- ĞÂÈÎÎñÏµÍ³
	Uworld1065 = nt_getTask(1065)      -- ¼ÇÂ¼ÏÊÈâÊıÁ¿µÄ±äÁ¿
	local name = GetName()  
	if ( Uworld1000 == 10 ) and ( Uworld1065 >= 3 ) then   
		Talk(1,"Uworld1000_end1",name.."<#>:  S­ phô! Long thñ lÜnh b¶o ta ®Õn t×m «ng. §©y lµ thŞt t­¬i cña «ng.")
	elseif (( Uworld1000 == 20 ) or ( Uworld1000 == 30 )) then  
		Talk(1,"Uworld1000_end1",name.."<#>:  S­ phô! Long thñ lÜnh b¶o ta ®Õn t×m «ng. §©y lµ thŞt t­¬i cña «ng.")
	elseif (( Uworld1000 == 10 ) or ( Uworld1000 == 20 ) or ( Uworld1000 == 30 )) and ( Uworld1065 < 3 ) then 
		Talk(1,"","A! ThŞt t­¬i còng kh«ng ®ñ! B»ng h÷u! Ng­¬i kh«ng cã thµnh ı chót nµo. H·y ®i lÊy 3 miÕng thŞt t­¬i vÒ.")
	elseif ( Uworld1000 == 180 ) and ( Uworld1065 < 5 ) then
		Talk(1,"","Sao? L¹i quªn ®­a thŞt t­¬i cho ta, lÊy ®ñ 5 miÕng råi quay l¹i.")
	elseif ( Uworld1000 == 180) or ( Uworld1000 == 190 ) then
		if ( Uworld1000 == 180 and Uworld1065 >= 5 ) then
			Uworld1065 = Uworld1065 - 5
			nt_setTask(1065,Uworld1065)
		elseif ( Uworld1000 == 180 ) then
			Talk(1,"no","Sao? L¹i quªn ®­a thŞt t­¬i cho ta, lÊy ®ñ 5 miÕng råi quay l¹i.")
		end
			nt_setTask(1000,190) --»·½Ú10start
			Talk(10,"Uworld1000_good4",
			name.."<#>:  S­ phô.","Ta kh«ng d¸m nhËn, ta vµ ng­¬i kh«ng ph©n lín nhá. Sao? L¹i ®em thŞt t­¬i ®Õn! Ha ha!",name.."<#>:  Long Ngò thËt sù khiÕn ng­êi tøc giËn.","õ õ! ThŞt ngon! ThŞt ngon.",name.."<#>:  S­ phô! Con ®ang nãi chuyÖn víi ng­êi mµ ","Ha ha...Long §Çu Nhi lµ ng­êi th¼ng th¾n, thËt ra y v× tèt cho ng­¬i mµ th«i. Kh«ng gi¸o huÊn ng­¬i nghiªm kh¾c sau nµy ra giang hå chÕt kh«ng kŞp biÕt v× sao chÕt!",name.."<#>:  Nh­ng mµ «ng Êy nãi nÆng qu¸.","Vâ s­: B¹n trÎ, mäi chuyÖn nªn nhŞn, chØ cã quyÕt t©m luyÖn tËp nh­ kim cang bÊt ho¹i míi cã thÓ lµm nªn ®¹i sù.",name.."<#>:  A! Th× ra lµ thÕ.","Vâ s­: ë trong th«n l©u råi ch¾c ng­¬i còng buån. Cã muèn kÕt giao vµi vŞ b»ng h÷u kh«ng?",name.."<#>:  Muèn chø!","H·y Ên [F6] më giao diÖn h¶o h÷u, Ên nót phİa d­íi ®Ó t×m kiÕm, hoÆc cã thÓ chän tªn ng­êi ch¬i xung quanh... HoÆc cã thÓ Ên [Ctrl] + chuét ph¶i trªn nguêi cña ®èi ph­¬ng, chän: h¶o h÷u")
	else 
		Talk(1,"","Nam b¾c ®Òu cã nh÷ng phong tôc riªng, b¹n ph¶i häc nhiÒu míi cã thÓ tån t¹i!")
	end
end

-----------------------------------ÔÓ»õÆÌÀÏ°å-----------------------------
function zboss()
	Uworld1000 = nt_getTask(1000)
	local name = GetName()  
		if ( Uworld1000 == 120 ) or ( Uworld1000 == 130 ) then
			nt_setTask(1000,130) --»·½Ú7start
			Describe(DescLink_ZaHuoPu.."<#>:  B¹n trÎ t×m ta cã viÖc g×?<enter>"
			..name.."<#>:  Long thñ lÜnh b¶o ta ®Õn gÆp «ng.<enter>A! Tªn chÕt tiÖt ®ã l¹i sai ng­¬i ®Õn ph¸ ta! Ta kh«ng cã g× ®Ó d¹y ng­¬i c¶!<enter>"
			..name.."<#>:  Sao l¹ vËy? <enter> Mµ nµy! Ng­¬i sau nµy hµnh tÈu giang hå cã thÓ sÏ nghe nãi ®Õn 'Thiªn Hoµng Long Khİ...<enter>"
			..name.."<#>:  Thiªn Hoµng Long Khİ?<enter> §ã lµ bé ¸o gi¸p thÇn bİ do TÇn Thñy Hoµng chiªu tËp thî rÌn giái cña 7 n­íc lµm nªn. Nghe nãi bªn trong Èn chøa bİ mËt rÊt lín<enter>"
			..name.."<#>:  Hö?<enter> Cô thÓ th× ta kh«ng râ! µ ®óng råi! Ta cã Thæ §Şa Phï, sau nµy khi ng­¬i luyÖn c«ng mÖt mái cã thÓ sö dông nã ®Ó lËp tøc quay vÒ thµnh hoÆc th«n!<enter>"
			..name.."<#>:  Cã thø nµy thËt tèt! <enter> TÆng ng­¬i 2 tÊm, nÕu kh«ng tªn chÕt tiÖt kia l¹i nãi ta İch kû! <enter>"
			..name.."<#>:  Ai? µ! Long ®Çu lÜnh h¶? <enter>B¹n trÎ h·y cè g¾ng nhĞ!",
			2,"Ta muèn xem bøc häa ®å cña Thiªn Hoµng Long Khİ /Uworld1000_tianhuanglongqi","KÕt thóc ®èi tho¹i/Uworld1000_high7")
		else 
			Talk(1,"","Phiªu b¹t giang hå ch¼ng b»ng ë nhµ sèng nhµn nh· thÕ nµy!")
		end
end

------------------------------------Ò©ÆÌÀÏ°å----------------------------------
function yboss()
	Uworld1000 = nt_getTask(1000)
	local name = GetName()  
	if ( Uworld1000 == 80 ) or ( Uworld1000 == 90 ) then
		nt_setTask(1000,90) --»·½Ú5start
		Talk(9,"Uworld1000_high5","Kh¸ch quan cÇn g×?",name.."<#>:  Ta kh«ng cã tiÒn, lµ Long thñ lÜnh b¶o  ta ®Õn t×m «ng.","Ngò Gia b¶o ng­¬i ®Õn µ? Ta hiÓu råi! ThËt ra ta còng kh«ng cã g× ®Ó d¹y, tr­íc tiªn tÆng ng­¬i 1 İt d­îc d­îc phÈm, cã lóc h÷u dông",name.."<#>:  C¶m ¬n.","§õng kh¸ch s¸o! Nªn cè g¾ng! BiÕt ®©u sau nµy ng­¬i sÏ trë thµnh mét ®¹i hiÖp, cã chç ®Ó ta n­¬ng nhê'",name.."<#>:  ¤ng kh¸ch s¸o råi.","Sau nµy cã th­¬ng tËt, bÖnh ho¹n g× cø ®Õn t×m ta! NÕu muèn mua sè l­îng lín cã thÓ Ên phİm [shift] vµ nhÊn chuét ph¶i",name.."<#>:  §­îc, ta biÕt råi.","Ng­¬i h·y ®i t×m thî rÌn ® ") 
	else 
		Talk(1,"","Lóc bŞ th­¬ng nhí uèng thuèc, phßng bÖnh h¬n ch÷a bÖnh.")
	end
end

------------------------------------Ìú½³--------------------------------------
function tboss()
	Uworld1000 = nt_getTask(1000)
	local name = GetName() 
	 	if ( Uworld1000 == 100 ) or ( Uworld1000 == 110 ) then
			nt_setTask(1000,110) --»·½Ú6start
			Talk(11,"Uworld1000_high6"," A! Ng­¬i ®Õn råi!",name.."<#>:  Uhm! Chİnh t¹i h¹!","Muèn mua thø g×?",name.."<#>:  Ta ®Õn hái th¨m tin tøc.","Ng­êi cña Ngò Gia?",name.."<#>:  §óng vËy.","Ta binh khİ nµo còng cã. ChiÕu theo Ngò hµnh mµ chän binh khİ sÏ cã thÓ kİch ho¹t c¸c thuéc tİnh Èn",name.."<#>:  VËy sao!","Ng­¬i nhÊn [F4] ®Ó më hµnh trang, tiÕp theo nhÊn [F3] ®Ó më giao diÖn trang bŞ, Ên gi÷ chuét tr¸i kĞo thanh kiÕm vµo phÇn giao diÖn trang bŞ lµ cã thÓ sö dông",name.."<#>:  C¸m ¬n «ng.","§õng kh¸ch s¸o! B©y giê ®i t×m chñ t¹p hãa ®i!")
		else
			Talk(1,"","Ng­¬i nªn mua binh khİ phßng th©n.")
		end
end    

-----------------------------------³ÇÊĞÌú½³-----------------------------------
function education_tiejiang()
	Uworld1000 = nt_getTask(1000)
	local name = GetName()  
	if ( Uworld1000 == 380 ) or ( Uworld1000 == 390 ) then
		nt_setTask(1000,390) --»·½Ú20start
		Talk(12,"Uworld1000_repair","ThÇn binh t¸i xuÊt, Thiªn h¹ sÏ cµng hçn lo¹n.Thêi ®¹i lo¹n l¹c nµy bao giê míi kÕt thóc ®©y.",name.."<#>:  Tiªn sinh, «ng nãi g× vËy?","Lµ ng­êi cña Ngò Ca ph¸i ®Õn?",name.."<#>:  §óng vËy.","Thiªn Hoµng Long Khİ ®· t¸i xuÊt giang hå, kh«ng biÕt sÏ ®Ém m¸u bao l©u n÷a.",name.."<#>:  'Thiªn Hoµng Long Khİ' lµ c¸i g×?","Sau nµy ng­¬i sÏ râ. Ngò Ca cã ®Ó 1 bé ¸o gi¸p ë ®©y, ng­¬i lÊy ®i.",name.."<#>:  C¸m ¬n «ng.","Thø nµy cÊt trong mËt thÊt l©u ngµy nªn ®· rØ sĞt, lÊy chót dÇu lau nã ®i.",name.."<#>:  VËy lµm thÕ nµo?","Sau nµy nÕu trang bŞ cña ng­¬i bŞ h­, nhÊn vµo ch÷ söa ë d­íi giao diÖn trang bŞ, sau ®ã nhÊp vµo mãn ®å ng­¬i muèn söa.",name.."<#>:  VËy ta thö xem")
	elseif ( Uworld1000 == 400 ) or ( Uworld1000 == 410 ) then  --È±ÉÙ¶Ô¿ø¼×ÊÇ·ñĞŞÀíºÃµÄÅĞ¶Ï
		nt_setTask(1000,410) --»·½Ú21start
		Talk(9,"Uworld1000_luck1","Thî rÌn: Phµo, ®· söa xong råi.",name.."<#>:  Qu¶ nhiªn lµ kh¸c h¼n!","Ng­¬i thÊy thuéc tİnh Èn trªn trang bŞ ®· kİch ho¹t ch­a?",name.."<#>:  ThÊy råi, thÊy råi...ViÖc nµy lµ thÕ nµo, ta kh«ng hiÓu g× c¶. Ta kh«ng t×m thÊy trang bŞ kİch ho¹t.","Bëi v× ngò hµnh cña trang bŞ nµy t­¬ng sinh víi ngò hµnh cña ng­¬i nªn thuéc tİnh Èn thø nhÊt cña trang bŞ sÏ tù ®éng ®­îc kİch ho¹t. Kim sinh Thñy, Thñy sinh Méc, Méc sinh Háa, Háa sinh Thæ, Thæ sinh Kim.",name.."<#>:  Tèt qu¸! Ta ®· hiÓu râ vÒ Ngò Hµnh råi.","B©y giê ta sÏ cho ng­¬i mét mãn quµ ®Æc biÖt.",name.."<#>:      Lµ g× vËy?","Ta sÏ cho ng­¬i mét tr¹ng th¸i ®Æc biÖt, mçi giê ®­îc 10 ®iÓm may m¾n.")
	else 
		Talk(1,"","Ng­¬i nªn mua binh khİ phßng th©n.")
	end
end

function Uworld1000_repair() --Ôö¼ÓË«¼Ó¹ı°ÙÒÂÒ»¼ş
	Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 390 ) then
		local nItemIdx = 0;
		if ( GetSex() == 0 ) then --½ğ
				if (GetSeries() == 0 ) then
					nItemIdx = AddItem(0,2,0,1,2,255,7);--Ë®ÒÂ
					SetCurDurability(nItemIdx,14)
				elseif (GetSeries() == 1 ) then --Ä¾
					nItemIdx = AddItem(0,2,0,1,3,255,7);--»ğÒÂ
					SetCurDurability(nItemIdx,14)
				elseif (GetSeries() == 2 ) then --Ë®
					nItemIdx = AddItem(0,2,0,1,1,255,7);--Ä¾ÒÂ
					SetCurDurability(nItemIdx,14)
				elseif (GetSeries() == 3 ) then --»ğ
					nItemIdx = AddItem(0,2,0,1,4,255,7);--ÍÁÒÂ
					SetCurDurability(nItemIdx,14)
				elseif (GetSeries() == 4 ) then --ÍÁ
					nItemIdx = AddItem(0,2,0,1,0,255,7);--½ğÒÂ
					SetCurDurability(nItemIdx,14)
				end
			else 
				if (GetSeries() == 0 ) then --½ğ
					nItemIdx = AddItem(0,2,9,1,2,255,7);--Å®Ë®ÒÂ
					SetCurDurability(nItemIdx,14)
				elseif (GetSeries() == 1 ) then --Ä¾
					nItemIdx = AddItem(0,2,9,1,3,255,7);--Å®»ğÒÂ
					SetCurDurability(nItemIdx,14)
				elseif (GetSeries() == 2 ) then --Ë®
					nItemIdx = AddItem(0,2,9,1,1,255,7);--Å®Ä¾ÒÂ
					SetCurDurability(nItemIdx,14)
				elseif (GetSeries() == 3 ) then --»ğ
					nItemIdx = AddItem(0,2,9,1,4,255,7);--Å®ÍÁÒÂ
					SetCurDurability(nItemIdx,14)
				elseif (GetSeries() == 4 ) then --ÍÁ
					nItemIdx = AddItem(0,2,9,1,0,255,7);--Å®½ğÒÂ
					SetCurDurability(nItemIdx,14)
			end
		end
	end
	nt_setTask(1000,400) --»·½Ú20end
	Msg2Player("Thî rÌn ®­a b¹n ¸o gi¸p ®· söa xong.")	
end

function Uworld1000_luck1()
	local name = GetName()  
	Talk(4,"Uworld1000_luck2",name.."<#>:      NghÜa lµ g× vËy?","May m¾n lµ lóc ng­¬i ®¸nh nhau víi thó d÷ sÏ cã kh¶ n¨ng nhÆt ®­îc trang bŞ tèt. §iÓm may m¾n cao nhÊt lµ 100. HiÖn giê ng­¬i ®­îc mét giê may m¾n, h·y cè mµ tËn dông.",name.."<#>:  §a t¹, ta biÕt råi."," §­îc råi, h·y quay l¹i gÆp ng­êi ®· sai ng­¬i ®Õn ®©y, h¾n sÏ giao 1 bøc th­ cña Ngò Ca cho ng­¬i.")
end

function Uworld1000_luck2()
	local curCamp = nt_getCamp()
	Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 410 ) then
	  	AddSkillState(441, 1, 1, 64800)        --Ôö¼ÓĞÒÔË10Ò»Ğ¡Ê±µÄÅĞ¶Ï
		AddOwnExp(2000)
	end
	nt_setTask(1000,420) --»·½Ú21end
	Msg2Player("B¹n nhËn ®­îc 1 giê may m¾n cã thÓ lÊy nhÆt ®­îc trang bŞ tèt.")
	if  ( curCamp == 0 ) then
		Msg2Player("Thî rÌn b¶o b¹n cã thÓ vÒ Ph­îng T­êng t×m Ng¹o V©n T«ng.")
	elseif  ( curCamp == 2 ) then
		Msg2Player("Thî rÌn b¶o b¹n cã thÓ ®i BiÖn Kinh t×m Th¸c B¹t Hoµi Xuyªn.")
	elseif  ( curCamp == 1 )  then
		Msg2Player("Thî rÌn b¶o b¹n cã thÓ ®i L©m An t×m LiÔu Nam V©n.")
	end
end

----------------------------ÁÙ°²Ç®×¯ÀÏ°å----------------------------------------

function education_qianzhuanglaoban()
	Uworld1000 = nt_getTask(1000)
	local name = GetName()  
	if ( Uworld1000 == 360 ) or ( Uworld1000 == 370 ) then
		nt_setTask(1000,370) --»·½Ú19start
		Talk(4,"Uworld1000_yinpiao","Ng­¬i lµ ng­êi cña Ngò Ca?",name.."<#>:  §óng vËy."," Mêi ngåi, n¨m x­a chŞu ¬n cña Ngò Ca, chuyÖn cña «ng ta còng lµ chuyÖn cña ta.",name.."<#>:  ThËt ra Ngò Gia b¶o ta vµo thµnh d¹o.","Ta nãi cho ng­¬i biÕt nh÷ng chuyÖn cÇn l­u ı khi hµnh tÈu giang hå.")
	end
end

---------------------------ÎäÁÖÃË´«ÈË-----------------------------------------------
function education_wulinmengchuanren()
Uworld1000 = nt_getTask(1000)
	local name = GetName()  
	if ( Uworld1000 == 340 ) or ( Uworld1000 == 350 ) then 
		nt_setTask(1000,350) --»·½Ú18start
		Talk(8,"Uworld1000_goon3","Cuèi cïng ng­¬i còng ®Õn råi",name.."<#>:  ¤ng biÕt ta sÏ ®Õn?","T¹i h¹ vèn cã thÓ ®o¸n ®­îc sè mÖnh, nh©n duyªn tµi léc...th× sao l¹i kh«ng biÕt!",name.."<#>:  Tiªn sinh thËt biÕt ®ïa.","§­îc råi, ta sÏ cho ng­¬i biÕt mét chót vÒ phóc duyªn. Phóc duyªn lµ ph­¬ng thøc tİch lòy 2 giê ch¬i th× cã thÓ ®Õn 7 thµnh lín hoÆc §µo Hoa Nguyªn t×m Vâ L©m TruyÒn Nh©n nhËn l·nh. Sau ®ã ®Õn T­¬ng D­¬ng t×m ThÇn Bİ Th­¬ng Nh©n dïng ®iÓm Phóc duyªn ®æi p",name.."<#> å! Cã chuyÖn ®ã n÷a sao! PhÇn th­ëng cã nhiÒu kh«ng?","Cßn ph¶i hái! Y rÊt giµu cã, giang hå hiÕm cã...",name.."<#>:  VËy cã h¹n chÕ g× kh«ng?");
	end
end

function Uworld1000_tianhuanglongqi()
	Describe("<link=image:\\spr\\Ui3\\ĞÂÈÎÎñÏµÍ³\\ÈÎÎñÍ¼±ê\\tianhuanglongqi_01.spr>Thiªn Hoµng Long Khİ<link>",1,"KÕt thóc/Uworld1000_high7")
end

function Uworld1000_high7()
Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 130 ) then
		if ( GetSex() == 0 ) then 
			AddItem(0,5,1,1,1,20)         --Ôö¼ÓÒ»Ë«Ğ¬×Ó
		elseif ( GetSex() == 1 ) then 
			AddItem(0,5,3,1,1,20)
		end
		AddItem(5,0,0,0,0,0)         --Ôö¼ÓÁ½¸ö»Ø³Ç·û
		AddItem(5,0,0,0,0,0)
		AddOwnExp(200)
		nt_setTask(1000,140) --»·½Ú7end
		Msg2Player("B¹n nhËn ®­îc 2 tÊm Håi Thµnh Phï.")
		Msg2Player("B¹n nhËn ®­îc 1 ®«i giµy.")
		Msg2Player("H·y quay vÒ gÆp Long Ngò.")
		seteducationnpcpos()
	end
end

function Uworld1000_high5()
Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 90 ) then
		for i=1,3 do
			AddItem(1,0,0,2,0,0)                          --Ôö¼ÓÈıÆ¿ºìÒ©
		end
		AddOwnExp(200)
		nt_setTask(1000,100) --»·½Ú5end
		Msg2Player("B¹n nhËn ®­îc 3 b×nh Hång D­îc Thñy.")
		Msg2Player("H·y quay vÒ ®èi tho¹i víi thî rÌn.")
		seteducationnpcpos()
	end
end

function Uworld1000_high6()
Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 110 ) then
		AddOwnExp(200)
		nt_setTask(1000,120) --»·½Ú6end
		Msg2Player("Quay vÒ ®èi tho¹i víi Bµ chñ tiÖm t¹p hãa.")
		seteducationnpcpos()
	end
end

function Uworld1000_end1()
	local name = GetName()  
	local Uworld1065 = nt_getTask(1065)
	local Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 10 ) then
		Uworld1065 = Uworld1065-3
		nt_setTask(1065,Uworld1065)
	end
	nt_setTask(1000,30) --»·½Ú2start
	Talk(5,"Uworld1000_wuxing","L¹i lµ thŞt t­¬i? GÇn ®©y nhiÒu ng­¬i ®Õn häc vâ vËy. MÖt chÕt ®i ®­îc!",name.."<#>:  Nî n­íc thï nhµ, cÇn ph¶i b¸o!","ThËt kh«ng ngê ng­¬i l¹i cã chİ khİ nh­ vËy. Ta d¹y ng­¬i bµi häc ®Çu tiªn: Ên phİm [V] lµ cã thÓ ngåi xuèng håi phôc khİ huyÕt. Sau nµy khi phiªu b¹t giang hå, h·y dïng c¸ch nµy ®Ó lÊy l¹i chót h¬i søc gi÷ ®­îc m¹ng sèng",name.."<#>:  §a t¹ s­ phô!","¢m D­¬ng t­¬ng sinh, Ngò Hµnh t­¬ng kh¾c. B©y giê ta sÏ d¹y ng­¬i 1 bé Ngò Hµnh quyÒn ph¸p.")
end

function Uworld1000_wuxing()
Uworld1000 = nt_getTask(1000)
	if ( Uworld1000 == 30 ) then
		AddOwnExp(350)	
		if ( GetSeries() == 0 ) then
			AddMagic(445)   --½ğ
		elseif ( GetSeries() == 1 ) then
			AddMagic(446) 	--Ä¾
		elseif ( GetSeries() == 2 ) then	
			AddMagic(447) 	--Ë®
		elseif ( GetSeries() == 3 ) then
			AddMagic(448) 	--»ğ
		elseif ( GetSeries() == 4 ) then
			AddMagic(449) 	--ÍÁ
		end
	end
		nt_setTask(1000,40) --»·½Ú2end
		seteducationnpcpos()
		Msg2Player("B¹n häc ®­îc Ngò Hµnh quyÒn ph¸p.")
		Talk(2,"","Bé vâ c«ng nµy chØ ®Ó hé th©n, luyÖn tËp rÊt chËm! ChØ cÇn ng­¬i hiÓu ®­îc nguyªn lı 'Sinh kh¾c' th× hiÖu qu¶ kh¾c chÕ kÎ ®Şch sÏ t¨ng gÊp béi: Kim kh¾c Méc, Méc kh¾c Thæ, Thæ kh¾c Thñy, Thñy kh¾c Háa, Háa kh¾c Kim","Vâ häc lÊy chuyªn cÇn luyÖn tËp lµ chİnh... Ai da! MiÖng l¹i kh¸t råi! Th«i ng­¬i h·y quay vÒ t×m Long §Çu ®i!")
end

function Uworld1000_good4()
	local name = GetName()  
	Talk(9,"Uworld1000_changewuxing",name.."<#>:  å, hãa ra l¹i tiÖn lîi nh­ vËy.","Ng­¬i cã thÓ thö xem råi h·y ®Õn t×m ta.",name.."<#>:  Ta ®· thö xong.","NÕu ng­¬i muèn tiÕn thªm mét b­íc, cïng b¹n bÌ kÕt thµnh huynh ®Ö chi giao th× cã thÓ ®Õn Nam Nh¹c trÊn tù miÕu, t×m TÜnh §èc thiÒn s­!",name.."<#> §­îc! Ta nhí råi","Trªn nÎo ®­êng b«n tÈu Giang hå, cã nhiÒu b»ng h÷u tøc lµ cã nhiÒu sù trî gióp","§­îc råi, ta tÆng ng­¬i 1 b¶o kiÕm cã thuéc tİnh Èn! vµ cã 1 sîi d©y chuyÒn cã thuéc tİnh, trang bŞ chóng, ng­¬i sÏ thÊy ®­îc hiÖu nghiÖm cña Ngò Hµnh: thuéc tİnh Èn trªn kiÕm cña ng­¬i sÏ ®­îc kİch ho¹t",name.."<#>:  Qu¶ nhiªn lµ huyÒn diÖu!","Sau nµy muèn kİch ho¹t trang bŞ, Ên [F4], thÊy ë d­íi xem ë d­íi dßng mµu vµng cña dßng trang bŞ sÏ biÕt thuéc tİnh cña trang bŞ. B©y giê ng­¬i vÒ ®i, cã g× kh«ng hiÓu Ên [F1] ra xem, vÒ ph­¬ng diÖn nhiÖm vô th× nhÊn [F11]")
end

function Uworld1000_changewuxing()
	local name = GetName()  
	Talk(2,"Uworld1000_high9","Vâ c«ng lÇn tr­íc d¹y ng­¬i chØ thö xem sù nhÉn n¹i cña ng­¬i. B©y giê ta sÏ d¹y ng­¬i vâ c«ng chİnh t«ng","ChØ cÇn dùa theo bé vâ c«ng nµy, ch¨m chØ luyÖn tËp. Ngµy trë thµnh cao thñ sÏ kh«ng cßn xa.")
end

function Uworld1000_high9()
	Uworld1000 = nt_getTask(1000)
	local Uworld1067 = nt_getTask(1067)
	local Uworld445 = HaveMagic(445)
	local Uworld446 = HaveMagic(446)
	local Uworld447 = HaveMagic(447)
	local Uworld448 = HaveMagic(448)
	local Uworld449 = HaveMagic(449)
	if ( Uworld1000 == 190 ) then
		if ( GetSex() == 0 ) then 
			if ( GetSeries() == 0 ) then--½ğ
				AddVerItem(4,3,0,0,0,1,3,50,1,2,0,0,0,0) --½£    
				AddItem(0,4,1,1,1,60,2,2,0,0,0,0) --ÏîÁ´  
			elseif ( GetSeries() == 1 ) then--Ä¾
				AddVerItem(4,3,0,0,0,1,2,50,1,2,0,0,0,0) --½£    
				AddItem(0,4,1,1,0,60,2,2,0,0,0,0) --ÏîÁ´  
			elseif ( GetSeries() == 2 ) then--Ë®	
				AddVerItem(4,3,0,0,0,1,4,50,1,2,0,0,0,0) --½£    
				AddItem(0,4,1,1,3,60,2,2,0,0,0,0) --ÏîÁ´  
			elseif ( GetSeries() == 3 ) then--»ğ
				AddVerItem(4,3,0,0,0,1,1,50,1,2,0,0,0,0) --½£    
				AddItem(0,4,1,1,2,60,2,2,0,0,0,0) --ÏîÁ´  
			elseif ( GetSeries() == 4 ) then--ÍÁ
				AddVerItem(4,3,0,0,0,1,1,50,1,2,0,0,0,0) --½£    
				AddItem(0,4,1,1,2,60,2,2,0,0,0,0) --ÏîÁ´  
			end
		else 
			if ( GetSeries() == 0 ) then--½ğ
				AddVerItem(4,3,0,0,0,1,3,50,1,2,0,0,0,0) --½£    
				AddItem(0,4,0,1,1,60,2,2,0,0,0,0) --ÏîÁ´  		
			elseif ( GetSeries() == 1 ) then--Ä¾
				AddVerItem(4,3,0,0,0,1,2,50,1,2,0,0,0,0) --½£    
				AddItem(0,4,0,1,0,60,2,2,0,0,0,0) --ÏîÁ´  
			elseif ( GetSeries() == 2 ) then--Ë®	
				AddVerItem(4,3,0,0,0,1,4,50,1,2,0,0,0,0) --½£    
				AddItem(0,4,0,1,3,60,2,2,0,0,0,0) --ÏîÁ´  
			elseif ( GetSeries() == 3 ) then--»ğ
				AddVerItem(4,3,0,0,0,1,1,50,1,2,0,0,0,0) --½£    
				AddItem(0,4,0,1,2,60,2,2,0,0,0,0) --ÏîÁ´  
			elseif ( GetSeries() == 4 ) then--ÍÁ
				AddVerItem(4,3,0,0,0,1,1,50,1,2,0,0,0,0) --½£    
				AddItem(0,4,0,1,2,60,2,2,0,0,0,0) --ÏîÁ´  
			end
		end
	end
	if (( Uworld445 ~= -1 ) or ( Uworld446 ~= -1 ) or ( Uworld447 ~= -1 ) or ( Uworld448 ~= -1 ) or ( Uworld449 ~= -1 )) and ( Uworld1067 <  10 ) then
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
	end
	AddOwnExp(800)
	nt_setTask(1000,200) 
	Msg2Player("Vâ s­ h­íng dÉn b¹n c¸ch t×m h¶o h÷u, cã thÓ nhÊn F1 më CÈm nang ra xem. B¹n cã thÓ quay vÒ gÆp Long Ngò.")
	Msg2Player("B¹n nhËn ®­îc 1 thanh B¶o kiÕm vµ sîi d©y chuyÒn, cã thÓ dïng d©y chuyÒn kİch ho¹t kiÕm.")
	Msg2Player("B¹n ®· häc ®­îc kü n¨ng c«ng kİch Ngò hµnh.")
	seteducationnpcpos()
end

function Uworld1000_yinpiao()
	local name = GetName()  
	Talk(1,"Uworld1000_get","Ng©n phiÕu còng t­¬ng ®­¬ng víi Nguyªn b¶o, cã thÓ ®æi ra giê ch¬i hoÆc tiÒn §ång. Ng­¬i h·y ®i t×m thî rÌn ®Ó hái thªm")
end

function Uworld1000_get()
	AddOwnExp(5000)
	nt_setTask(1000,380)	--»·½Ú19end
	Msg2Player("Chñ tiÒn trang b¶o b¹n ®Õn t×m Thî rÌn trong thµnh")	
	seteducationnpcpos()
end


function Uworld1000_goon3()
	local name = GetName()  
	Talk(3,"Uworld1000_queding","Cã chø, n¹p thÎ míi cã thÓ l·nh quµ!",name.."<#>:  Ta hiÓu råi!","Ng­¬i t­ chÊt th«ng minh, giê h·y ®Õn L©m An t×m Chñ tiÒn trang (180, 191) ,¤ng ta sÏ chØ ®iÓm cho ng­¬i.T×m Xa phu trong thµnh ®­a ng­¬i ®i.")
end

function Uworld1000_queding()
	AddOwnExp(5000)
	nt_setTask(1000,360) --»·½Ú18end 
	Msg2Player("Vâ L©m TruyÒn Nh©n b¶o b¹n t×m Chñ tiÒn trang L©m An.")	
	seteducationnpcpos()
end

function no()
end