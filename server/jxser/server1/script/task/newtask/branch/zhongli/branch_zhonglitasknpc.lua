-- ÖĞÁ¢Ö§ÏßÈÎÎñ½Å±¾
-- by xiaoyang(2005\1\11)

Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\branch\\branch_head.lua")
Include("\\script\\task\\newtask\\branch\\branch_prize.lua")
Include("\\script\\task\\newtask\\branch\\branch_problem.lua")

----------------------------------------------------------½­Ò»Ïô--------------------------------------------------------------------------
function branch_jiangyixiao()
	Uworld1012 = nt_getTask(1012)
	Uworld1054 = nt_getTask(1054)
	local name = GetName()
	if (( Uworld1054 == 20) or ( Uworld1054 == 30 )) and ( Uworld1012 == 20 ) then
		if ( GetLevel() >= 20 ) and ( GetLevel() <  30 ) then
			nt_setTask(1054,30)
			Describe(name.."<#>:  Giang tiªn sinh, LiÔu Nam V©n b¶o ta ®Õn t×m «ng.<enter>"
			..DescLink_JiangYiXiao.."<#>:  L·o LiÔu µ? ¤ng Êy b¶o ng­¬i ®Õn ®©y lµm g×?.<enter>"
			..name.."<#>:  GÇn ®©y nghe nãi B¶o khİ xuÊt hiÖn t¹i D­¬ng Ch©u.<enter>µ! Th× ra lµ v× chuyÖn nµy.<enter>"
			..name.."<#>:  Tr­íc khi t¹i h¹ ®Õn, ®· gióp «ng quĞt s¹ch lò Nhİm.<enter> Giang NhÊt Tiªu: V©y µ? §©y ch¾c lµ ı cña L·o LiÔu. Ta cã quen L¹c Thanh Thu th­ sinh, y tõng lµ nhµ b×nh kiÕm næi tiÕng. ChØ v× mét lÇn ngoµi ı muèn ®· phÕ c¸nh tay, ng­¬i h·y ®Õn t×m «ng.<enter> "
			..name.."<#>: V©y c¸m ¬n «ng.<enter>Giang NhÊt Tiªu: §õng kh¸ch s¸o, thay ta hái th¨m l·o LiÔu.<enter>",
			1,"KÕt thóc ®èi tho¹i/branch_jiangyixiao1")
		else
			Talk(1,"","Xin lçi! §¼ng cÊp cña b¹n v­ît qu¸ ®¼ng cÊp nhiÖm vô yªu cÇu, kh«ng thÓ tiÕp nhËn n÷a! ThËt ng¹i qu¸! ")
		end
	else
		Describe(DescLink_JiangYiXiao.."<#>:  D­¬ng Ch©u dÔ chŞu h¬n TÇn L¨ng, nh­ng tr¸ch nhiÖm trªn vai vÉn ®Ì nÆng.",1,"KÕt thóc ®èi tho¹i/no")
	end
end
---------------------------------------------------------ÀÖÇåÇï-----------------------------------------------------------------------------
function branch_leqingqiu()
	Uworld1012 = nt_getTask(1012)
	Uworld1054 = nt_getTask(1054)
	local name = GetName()
	if ( Uworld1054 == 40) or ( Uworld1054 == 50 ) then
		if ( GetLevel() >= 20 ) and ( GetLevel() <  30 ) then
			nt_setTask(1054,50)
			Describe(name.."<#>:  L¹c tiªn sinh, nghe nãi «ng biÕt b×nh kiÕm, T¹i h¹ ®­îc Giang chñ sù giíi thiÖu ®Õn.<enter>"
			..DescLink_LeQingQiu.."<#>: µ, chuyÖn cña Giang chñ sù còng lµ chuyÖn cña L¹c mç, chØ tiÕc hiÖn ta kh«ng cã t©m tr¹ng b×nh kiÕm.<enter>"
			..name.."<#>:  Tiªn sinh cã chuyÖn g× cã nãi ch¨ng?<enter>L¹c Thanh Thu: Ai da! Ng­êi ®· tµn phÕ, cßn cã chuyÖn g× ®Ó nãi......<enter>"
			..name.."<#>:  Tiªn sinh ng­êi nãi vËy lµ cã ı g×?<enter> Ta thiÕu B¶o kª sßng b¹c mét mãn tiÒn lín, ®· 30 n¨m vÉn ch­a tr¶ xong th× lµm sao mµ nãi vÒ kiÕm ®¹o n÷a chø.<enter>"
			..name.."<#>:  ChuyÖn nµy dÔ th«i, ta gióp «ng gi¶i quyÕt.<enter>",
			1,"KÕt thóc ®èi tho¹i/branch_leqingqiu1")
		else
			Talk(1,"","Xin lçi! §¼ng cÊp cña b¹n v­ît qu¸ ®¼ng cÊp nhiÖm vô yªu cÇu, kh«ng thÓ tiÕp nhËn n÷a! ThËt ng¹i qu¸! ")
		end
	elseif ( Uworld1054 == 110 ) or ( Uworld1054 == 120 ) then
		if ( GetLevel() >= 20 ) and ( GetLevel() <  30 ) then
			nt_setTask(1054,120)
			Describe(name.."<#>:  L¹c tiªn sinh, mãn sî sßng b¹c cña «ng ta ®· gi¶i quyÕt xong.<enter>"
			..DescLink_LeQingQiu.."<#>:  Ta biÕt råi, thËt kh«ng ngê, ng­¬i trÎ h¬n ta nhiÒu vËy mµ dòng c¶m bÊt khuÊt. L¹c mç coi nh­ ®· uæng phİ c¶ cuéc ®êi.<enter>"
			..name.."<#>:  L¹c tiªn sinh ®õng nãi nh­ thÕ, «ng lµ ng­êi rÊt kiªn c­êng, nÕu kh«ng Giang tiªn sinh ®· kh«ng lµm b¹n víi «ng.<enter>B»ng h÷u......Tèt! Ng­¬i ®em kiÕm ®Õn ta sÏ b×nh kiÕm cho.<enter>"
			..name.."<#>:  C¸m ¬n!.<enter>L¹c Thanh Thu: H·y ra ngoµi thµnh ®o¹t lÊy b¶o kiÕm cña (Nh©n vËt Vâ l©m) .<enter>",
			1,"KÕt thóc ®èi tho¹i/branch_leqingqiu2")
		else
			Talk(1,"","Xin lçi! §¼ng cÊp cña b¹n v­ît qu¸ ®¼ng cÊp nhiÖm vô yªu cÇu, kh«ng thÓ tiÕp nhËn n÷a! ThËt ng¹i qu¸! ")
		end
	elseif ( Uworld1054 == 140 ) or ( Uworld1054 == 150 ) then
		if ( GetLevel() >= 20 ) and ( GetLevel() <  30 ) then
			nt_setTask(1054,150)
			Describe(name.."<#>:  L¹c tiªn sinh, b¶o kiÕm ®©y.<enter>"
			..DescLink_LeQingQiu.."<#>:  Thanh kiÕm nµy, thanh kiÕm nµy.<enter>"
			..name.."<#>:  Thanh kiÕm nµy thÕ nµo?<enter>"
			..name.."<#>:  PhÕ råi? <enter>õ!<enter>"
			..name.."<#>:  VËy, vËy......<enter>Ng­¬i kh«ng cÇn tiÕc, víi sù anh dòng cña ng­¬i mai nµy nhÊt ®Şnh sÏ lµm nªn chuyÖn lín.<enter>"
			..name.."<#>:  ThËt ®¸ng tiÕc mét thanh B¶o kiÕm.<enter>Lßng dòng c¶m míi lµ vò khİ quan träng nhÊt!<enter>"
			..name.."<#>:  §ã lµ c¸i g×?<enter>N¾m ®Êm! N¾m ®Êm lµ vò khİ lîi h¹i nhÊt mµ ng­¬i cã, h·y dïng nã ®i dÑp hÕt chuyÖn bÊt b×nh cña thÕ gian.<enter>"
			..name.."<#>:......C¸m ¬n «ng, ta hiÓu råi.<enter>",
			1,"KÕt thóc ®èi tho¹i/branch_leqingqiu3")
		else
			Talk(1,"","Xin lçi! §¼ng cÊp cña b¹n v­ît qu¸ ®¼ng cÊp nhiÖm vô yªu cÇu, kh«ng thÓ tiÕp nhËn n÷a! ThËt ng¹i qu¸! ")
		end
	else
		Describe(DescLink_LeQingQiu.."<#>:  Cã ng­êi suèt ®êi chØ biÕt ¨n b¸m vµo sù bè thİ cña ng­êi kh¸c!",1,"KÕt thóc ®èi tho¹i/no")
	end
end
-----------------------------------------------------------¶Ä¹÷--------------------------------------------------------------------------
function branch_dugun()
	Uworld1012 = nt_getTask(1012)
	Uworld1054 = nt_getTask(1054)
	local name = GetName()
	if ( Uworld1054 == 60) or ( Uworld1054 == 70 ) then
		if ( GetLevel() >= 20 ) and ( GetLevel() <  30 ) then
			nt_setTask(1054,70)
			Describe(name.."<#>:  A, ng­¬i ®Õn råi.<enter>"
			..DescLink_DuGun.."<#>:  Nãi ai vËy?<enter>"
			..name.."<#>:  Chİnh lµ ng­¬i! Qua ®©y.<enter> Hõ! Ng­¬i ch¸n sèng råi ­? <enter>"
			..name.."<#>:  §õng ®ïa! L¹c Thanh Thu nî ng­¬i bao nhiªu tiÒn? <enter>Ng­¬i cã tiÒn tr¶ kh«ng mµ hái?<enter>"
			..name.."<#>:  ChuyÖn nhá! Ngoµi tr¶ tiÒn cßn c¸ch nµo kh¸c kh«ng.<enter> Cßn! Nh­ng ng­¬i kh«ng lµm næi ®©u.<enter>"
			..name.."<#>:  Cã g× cø nãi ®õng óp óp më më.<enter> §­îc! Ra ngoµi thµnh lÊy m¹ng Lé Tr­êng Thiªn, mãn nî cña hä L¹c kh«ng ph¶i tr¶.<enter>"
			..name.."<#>: §­îc.<enter>",
			1,"KÕt thóc ®èi tho¹i/branch_dugun1")
		else
			Talk(1,"","Xin lçi! §¼ng cÊp cña b¹n v­ît qu¸ ®¼ng cÊp nhiÖm vô yªu cÇu, kh«ng thÓ tiÕp nhËn n÷a! ThËt ng¹i qu¸! ")
		end
	elseif ( Uworld1054 == 90 ) or ( Uworld1054 == 100 ) then
		if ( GetLevel() >= 20 ) and ( GetLevel() <  30 ) then
			nt_setTask(1054,100)
			Describe(name.."<#>:  Ng­êi ta ®· tiªu diÖt xong.<enter>"
			..DescLink_DuGun.."<#>:  Ng­¬i.....thËt sù ®· lÊy m¹ng Lé Tr­êng Thiªn?<enter>"
			..name.."<#>:  Kh«ng tin µ? H·y ®Õn Nha m«n xem thö.<enter> §¹i hiÖp! Mãn nî cña hä L¹c ®· ®­îc xãa.<enter>",
			1,"KÕt thóc ®èi tho¹i/branch_dugun2")
		else
			Talk(1,"","Xin lçi! §¼ng cÊp cña b¹n v­ît qu¸ ®¼ng cÊp nhiÖm vô yªu cÇu, kh«ng thÓ tiÕp nhËn n÷a! ThËt ng¹i qu¸! ")
		end
	else
		Describe(DescLink_DuGun.."<#>:  ThiÕu nî tr¶ tiÒn, giÕt ng­êi ®Òn m¹ng.",1,"KÕt thóc ®èi tho¹i/no")
	end
end		
---------------------------------------------------Ë«Ó¥ïÚ¾ÖÖ÷ÈË------------------------------------------------------
function branch_shuangying()
	Uworld1012 = nt_getTask(1012)
	Uworld1055 = nt_getTask(1055)
	local name = GetName()
	if ( Uworld1055 == 20) or ( Uworld1055 == 30 ) then
		if ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) then
			nt_setTask(1055,30)
			Describe(name.."<#>:  Chµo «ng! Talµ ng­êi cña Nam V©n ph¸i ®Õn!.<enter>"
			..DescLink_BiaoJuZhuRen.."<#>:  LiÔu S­ phô ph¸i ng­¬i ®Õn?! B»ng h÷u xin mêi ngåi.<enter>"
			..name.."<#>:  MÆc dï ta ra giang hå ch­a l©u, nh­ng danh tiÕng Song ¦ng tiªu côc nh­ sÊm næ bªn tai, lÇn nµy t¹i sao l¹i th¶m thÕ?<enter> So víi Tiªu côc kh¸c chóng ta ®· may m¾n İt tæn thÊt h¬n. §èi thñ qu¸ ra tay ®éc ¸c, mÊy m­¬i n¨m qua ch­a gÆp Thæ phØ nµo m¹nh thÕ nh­ vËy.<enter>"
			..name.."<#>:  Cã g× khã nãi vËy?<enter> Tiªu côc ta cã mét ng­êi may m¾n tho¸t khái, y tªn A Ng­u, ®ang ë trong thµnh, ng­¬i h·y ®Õn t×m h¾n.<enter>"
			..name.."<#>:  §­îc.<enter>Mong ng­¬i sím t×m ra tªn khèn ®ã, ta thay mÆt 30 tiªu côc c¸m ¬n ng­¬i.<enter>",
			1,"KÕt thóc ®èi tho¹i/branch_shuangying1")
		else
			Talk(1,"","Xin lçi! §¼ng cÊp cña b¹n v­ît qu¸ ®¼ng cÊp nhiÖm vô yªu cÇu, kh«ng thÓ tiÕp nhËn n÷a! ThËt ng¹i qu¸! ")
		end
	else
		Describe(DescLink_BiaoJuZhuRen.."<#>:  VËn tiªu nhiÒu n¨m, h«m nay coi nh­ xong råi, sím biÕt sÏ cã ngµy nµy.",1,"KÕt thóc ®èi tho¹i/no")
	end
end		
-----------------------------------------------------°¢Å£------------------------------------------------------------------------------
function branch_aniu()
	Uworld1012 = nt_getTask(1012)
	Uworld1055 = nt_getTask(1055)
	local name = GetName()
	if ( Uworld1055 == 40) or ( Uworld1055 == 50 ) then
		if ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) then
			nt_setTask(1055,50)
			Describe(name.."<#>:  A Ng­u, Chñ nh©n Tiªu côc b¶o ta ®Õn t×m huynh, hái th¨m tin tøc tiªu xa bŞ c­íp.<enter>"
			..DescLink_ANiu.."<#>:  Ng­¬i lµ trî thñ mµ côc chñ t×m ®­îc µ?<enter>"	
			..name.."<#>:  §óng! <enter>B»ng h÷u, ng­¬i h·y vÒ ®i! Côc chñ ®· t×m ®­îc 3 vŞ cao thñ, nh÷ng ng­êi nµy trong qu¸ tr×nh ®iÒu tra tung tİch ®· mÊt tİch mét c¸ch bİ Èn<enter>"
			..name.."<#>:  Ta ®· nhËn lêi th× kh«ng bao giê rót lui.<enter>Ng­¬i khiÕn ta c¶m thÊy h©m mé! Hy väng ng­¬i sÏ lµ ng­êi ngo¹i lÖ.<enter>"
			..name.."<#>:  Ta sÏ chøng minh cho huynh thÊy b¶n lÜnh cña ta!<enter> Tèt l¾m! §õng nãi su«ng nhĞ!<enter>"
			..name.."<#>:  Huynh kh«ng tin th× ta ®i ®©y!<enter>B»ng h÷u! Khoan ®i ®·! Ta cã chuyÖn muèn nãi.<enter>"
			..name.."<#>:  ChuyÖn g×?<enter>Kh«i gi¸p nµy tÆng cho ng­¬i! Mong lµ côc chñ ®· kh«ng nh×n lÇm ng­êi!<enter>"
			..name.."<#>:  §a t¹!<enter>",
			1,"LÊy ®­îc ¸o gi¸p b¹n h·y kiÓm tra tØ mØ./branch_aniu1")
		else
			Talk(1,"","Xin lçi! §¼ng cÊp cña b¹n v­ît qu¸ ®¼ng cÊp nhiÖm vô yªu cÇu, kh«ng thÓ tiÕp nhËn n÷a! ThËt ng¹i qu¸! ")
		end
	else
		Describe(DescLink_ANiu.."<#>:  §¸m ng­êi ®ã th©n ph¸p nh­ tªn b¾n! Ng­¬i ph¶i hÕt søc cÈn thËn!",1,"KÕt thóc ®èi tho¹i/no")
	end
end

----------------------------------------------------------ÀäÇ¹ïÚ¾ÖÖ÷ÈË-------------------------------------------------------------------
function branch_lengqiang()
	Uworld1012 = nt_getTask(1012)
	Uworld1055 = nt_getTask(1055)
	local name = GetName()
	if ( Uworld1055 == 60) or ( Uworld1055 == 70 ) then
		if ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) then
			nt_setTask(1055,70)
			Describe(name.."<#>:  Ho¾c côc chñ.<enter>"
			..DescLink_BiaoJuZhuRen.."<#>:  Cho dï C¸c h¹ lµ ai, l·o phu ®· röa tay g¸c kiÕm, kh«ng mµng chuyÖn giang hå n÷a.<enter>"
			..name.."<#>:  C¶ vïng T©y B¾c xuÊt hiÖn ®¹o tÆc c­íp tiªu xa, ph¹m nhiÒu huyÕt ¸n. Ch¼ng lÏ «ng chØ biÕt nh×n th«i ­? <enter> TiÓu tö! Ng­¬i biÕt c¸i g×? Tµi nghÖ bao nhiªu mµ hèng h¸ch thÕ? <enter>"
			..name.."<#>:  Quİ C«ng Tö kháe kh«ng?<enter>Kh«ng xong råi! §¹i phu nãi nÕu kh«ng cã 50 bé ãc khØ ë Thôc C­¬ng s¬n th× ta sÏ ph¶i gÆp c¶nh ng­êi ®Çu b¹c tiÔn ng­êi ®Çu xanh.<enter>"
			..name.."<#>:  VËy ®­îc!<enter>",
			1,"KÕt thóc ®èi tho¹i/branch_lengqiang1")
		else
			Talk(1,"","Xin lçi! §¼ng cÊp cña b¹n v­ît qu¸ ®¼ng cÊp nhiÖm vô yªu cÇu, kh«ng thÓ tiÕp nhËn n÷a! ThËt ng¹i qu¸! ")
		end
	elseif (( Uworld1055 == 80) or ( Uworld1055 == 90 )) and ( Uworld1012 == 20 ) then
		if ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) then
			nt_setTask(1055,90)
			Describe(name.."<#>:  Ho¾c côc chñ, ãc khØ ta ®· ®em vÒ råi.<enter>"
			..DescLink_BiaoJuZhuRen.."<#>:  B»ng h÷u, chóng ta giang thñy t­¬ng phïng, ng­¬i hµ tÊt ph¶i nh­ thÕ.<enter>"
			..name.."<#>:  Gióp nhau lµ chuyÖn th­êng t×nh <enter>§­îc råi! Lai lŞch tªn nµy ta ®· x¸c ®Şnh râ. Bän hä lµ Hµ Hoa §¹o, th­êng xuÊt hiÖn gÇn C«n L«n ph¸i. Nh­ng xin C¸c h¹ h·y tha cho hä con ®­êng sèng. Ta tÆng ng­¬i mét viªn B¶o th¹ch tû lÖ ®Ó tá chót lßng thµnh.<enter>",
			1,"KÕt thóc ®èi tho¹i/branch_lengqiang2")
		else
			Talk(1,"","Xin lçi! §¼ng cÊp cña b¹n v­ît qu¸ ®¼ng cÊp nhiÖm vô yªu cÇu, kh«ng thÓ tiÕp nhËn n÷a! ThËt ng¹i qu¸! ")
		end
	elseif ( Uworld1055 == 110 ) or ( Uworld1055 == 120 ) then
		if ( GetLevel() >= 30 ) and ( GetLevel() <  40 ) then
			nt_setTask(1055,120)
			Describe(name.."<#>:  Ho¾c côc chñ, nghÜ t×nh «ng ta kh«ng giÕt bän hä. Nh­ng ta muèn hái «ng t¹i sao l¹i tha cho bän hä?<enter>"
			..DescLink_BiaoJuZhuRen.."<#>:  ThËt ra c¸c c« Êy ®Òu lµ con nhµ gia gi¸o, Thanh Minh n¨m ®ã khi ra ngoµi d¹o bŞ tªn Tiªu S­ lµm nhôc. Sau ®ã c¸c c« ®­îc DŞ nh©n gióp ®ì häc ®­îc vâ c«ng, bän hä míi b¾t ®Çu c­íp tiªu. ThËt sù b¶n tİnh cña hä kh«ng xÊu.<enter>"
			..name.."<#>:  Th× ra lµ thÕ, ai còng cã nçi khæ riªng, chØ mong qua lÇn nµy bän hä sÏ rót ®­îc kinh nghiÖm. NÕu kh«ng sÏ cã ngµy bŞ ng­êi kh¸c giÕt chÕt.<enter>Chñ nh©n L·nh Th­¬ng Tiªu côc: ChØ mong nh­ thÕ.<enter>",
			1,"KÕt thóc ®èi tho¹i/branch_lengqiang3")
		else
			Talk(1,"","Xin lçi! §¼ng cÊp cña b¹n v­ît qu¸ ®¼ng cÊp nhiÖm vô yªu cÇu, kh«ng thÓ tiÕp nhËn n÷a! ThËt ng¹i qu¸! ")
		end
	else
		Describe(DescLink_BiaoJuZhuRen.."<#>:  Ng­êi trong giang hå sím ®Æt cho ngo¹i hiÖu Ho¾c L·nh Th­¬ng, nh­ng tõ khi lËp gia thÊt, ta ®· kh«ng cßn nh­ x­a n÷a!",1,"KÕt thóc ®èi tho¹i/no")
	end
end
---------------------------------------------------Áú×·Îè-----------------------------------------------------------------------------
function branch_longzhuiwu()
	Uworld1057 = nt_getTask(1057)
	local name = GetName()
	if ( Uworld1057 == 80) then
		if ( GetLevel() >= 50 ) and ( GetLevel() <  60 ) then
			Describe(name.."<#>:  Long Truy Vò, ng­¬i biÕt LiÔu Nam V©n kh«ng.<enter>"
			..DescLink_LongZhuiWu.."<#>:  Hõ! Sao l¹i kh«ng biÕt! M­êi n¨m tr­íc, chİnh ta ®· khiÕn h¾n tuyÖt tö tuyÖt t«n.<enter>"
			..name.."<#>:  Mãn nî nµy h«m nay ng­¬i sÏ ph¶i tr¶.<enter> Ta ë ngoµi thµnh chê ng­¬i.<enter>",
			1,"KÕt thóc ®èi tho¹i/branch_longzhuiwu1")
		else
			Talk(1,"","Xin lçi! §¼ng cÊp cña b¹n v­ît qu¸ ®¼ng cÊp nhiÖm vô yªu cÇu, kh«ng thÓ tiÕp nhËn n÷a! ThËt ng¹i qu¸! ")
		end
	elseif ( Uworld1057 >= 90 ) then
		Talk(1,"","§õng giÕt ta! Ta chØ lµ ®å ®Ö cña Long Truy Vò, gi¶ d¹ng h¾n g¹t ng­¬i mµ th«i.")
	else
		Talk(1,"","§õng cã suèt ngµy phiÒn ta.")
	end
end


function branch_jiangyixiao1()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function branch_leqingqiu1()
	AddOwnExp(5000)
	nt_setTask(1054,60)
	Msg2Player("B¹n høa gióp L¹c Thanh Thu gi¶i quyÕt mãn nî cña anh ta.")
end

function branch_leqingqiu2()
	Uworld1012 = nt_getTask(1012)
	AddOwnExp(5000)
	nt_setTask(1012,0)
	nt_setTask(1054,130)
	Msg2Player("L¹c Thanh Thu nãi kiÕm ®ang bŞ (Nh©n vËt Vâ l©m) ë ngoµi thµnh gi÷, b¶o b¹n nªn nhanh tay ®o¹t lÊy!")
end

function branch_leqingqiu3()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
	ex_add_zl_level20();
end

function branch_dugun1()
	AddOwnExp(5000)
	nt_setTask(1054,80)
	Msg2Player("B¶o kª sßng b¹c b¶o b¹n chØ cÇn tiªu diÖt Bang chñ  Lé Tr­êng Thiªn sÏ xãa kho¶n nî cña L¹c Thanh Thu.")
end

function branch_dugun2()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function branch_shuangying1()
	AddOwnExp(15000)
	nt_setTask(1055,40)
	Msg2Player("Chñ nh©n Song ¦ng Tiªu côc b¶o b¹n ®i t×m A Ng­u, «ng hy väng b¹n cã thÓ gi¶i quyÕt khã kh¨n nµy.")
end

function branch_aniu1()
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function branch_lengqiang1()	
	Uworld1012 = nt_getTask(1012)
	AddOwnExp(15000)
	nt_setTask(1012,10)
	nt_setTask(1055,80)
	AddPlayerEvent(3) 
	Msg2Player("Chñ nh©n L·nh Th­¬ng Tiªu côc b¶o b¹n ®i Thôc C­¬ng S¬n giÕt 50 con khØ x¸m, lÊy ãc khØ vÒ trŞ bÖnh cho con «ng ta.")
end

function branch_lengqiang2()	
	AddSkillState( 509, 1, 0, 180);
	branchprize()
end

function branch_lengqiang3()	
	AddOwnExp(15000)
	nt_setTask(1055,130)
	Msg2Player("Chñ nh©n L·nh Th­¬ng Tiªu côc cuèi cïng ®· râ lai lŞch thËt sù cña Hµ Hoa §¹o. B¹n cã thÓ quay vÒ gÆp LiÔu Nam V©n phôc mÖnh.")
end

function branch_longzhuiwu1()
	Msg2Player("Long Truy Vò khinh th­êng b¹n, nãi r»ng h¾n ®îi b¹n ngoµi thµnh.")
end

function no()
end
