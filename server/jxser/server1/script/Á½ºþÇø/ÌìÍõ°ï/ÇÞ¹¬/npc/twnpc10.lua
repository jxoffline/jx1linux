--description: ÌìÍõ°ïÇŞ¹¬ Ñîçø¡¡ÌìÍõ³öÊ¦ÈÎÎñ¡¢ÖØ·µÃÅÅÉÈÎÎñ
--author: yuanlan	
--date: 2003/4/28
--Dan_Deng(2003-07-22), ¼ÓÈëÃÅÅÉÈÎÎñµÄµÈ¼¶ÒªÇó
--Dan_Deng(2003-07-24), ¼ÓÈëÖØ·µÃÅÅÉÈÎÎñ
-- Update: Dan_Deng(2003-08-16)
-- Update: Dan_Deng(2003-09-21)ÖØĞÂÉè¼ÆÖØ·µÃÅÅÉÓëÕòÅÉ¾øÑ§Ïà¹Ø
-- Update£ºDan_Deng(2003-10-27)ÎªÖØ·µÊ¦ÃÅÈÎÎñ¼ÓÈëÈ¡ÏûÈÎÎñ¹¦ÄÜ£¬ÒÔ¼°ÓëĞÂÃÅÅÉ¶ÔÓ¦

function main()
--	if (check_skill() == 0) then
--		return
--	end
	UTask_tw = GetTask(3);
	if (GetTask(39) == 10) and (GetBit(GetTask(40),3) == 0) then				-- ÊÀ½çÈÎÎñ£ºÎäÁÖÏò±³
		Talk(1,"", 11524)
		Uworld40 = SetBit(GetTask(40),3,1)
		SetTask(40,Uworld40)
	elseif (GetSeries() == 0) and (GetFaction() == "tianwang") then
		if (UTask_tw == 60*256+40) and (HaveItem(96) == 1) then					--ÄÃµ½ÌìÍõÒÅÊé
			Talk(3, "L60_prise", 11525, 11526, 11527)
		elseif (UTask_tw == 60*256) and (GetLevel() >= 50) then
			Talk(3, "L60_get", 11528, 11529, 11530)
		elseif (UTask_tw == 80*256) or (UTask_tw == 80) then						-- ÖØ·µºóµÄ×ÔÓÉ³öÈë
			Say(11531 ,2,"V©ng, xin Bang chñ ©n chuÈn. /goff_yes","Kh«ng, ta tù thÊy c«ng phutËp luyÖn vÉn ch­a ®ñ. /no")
		elseif (UTask_tw > 60*256) and (UTask_tw < 70*256) then		--ÒÑ¾­½Óµ½³öÊ¦ÈÎÎñ£¬ÉĞÎ´Íê³É
			Talk(1,"", 11532)
		else
			Talk(1,"", 11533)
		end
--	elseif (GetTask(7) == 5*256+10) then		-- ×ªÅÉÖÁÉÙÁÖÅÉ
--		Say(11534 ,2,"²»´í£¬ÎÒÒâÒÑ¾ö/defection_yes","²»£¬ÎÒ»¹ÊÇ²»¸ÄÍ¶ÉÙÁÖÁË/defection_no")
	elseif (GetSeries() == 0) and (GetCamp() == 4) and (GetLevel() >= 60) and (UTask_tw == 70*256) and (GetTask(7) < 5*256) then		-- ÖØ·µÊ¦ÃÅÈÎÎñ
		Talk(1,"return_select", 11535)
	elseif (GetCamp() == 4) and ((UTask_tw == 70*256+10) or (UTask_tw == 70*256+20)) then
		Say(11536 ,2,"§· chuÈn bŞ xong/return_complete","VÉn ch­a chuÈn bŞ xong/no")
	elseif (UTask_tw >= 70*256) and (GetFaction() ~= "tianwang") then		--ÒÑ¾­³öÊ¦
		Talk(1,"", 11537)
	else
		Talk(1,"", 11538)
	end
end
---------------------- ¼¼ÄÜµ÷ÕûÏà¹Ø ------------------------
function check_skill()
	x = 0
	skillID = 38					-- ÅÌ¹Å¾ÅÊ½
	i = HaveMagic(skillID)
	if (i >= 0) then
		x = x + 1
		DelMagic(skillID)
		AddMagicPoint(i)
	end
	if (x > 0) then		-- ÈôÓĞ¼¼ÄÜ·¢Éú±ä»¯£¬ÔòÌßÏÂÏß£¬·ñÔò·µ»Ø¼ÌĞøÁ÷³Ì
		Say(11539 ,1,"§a t¹ s­ phô /KickOutSelf")
		return 0
	else
		return 1
	end
end

---------------------- ÖØ·µÈÎÎñ ----------------------
function goff_yes()
	Talk(1,"", 11540)
	SetTask(3,70*256)
	AddNote("Rêi khái Thiªn V­¬ng bang, tiÕp tôc hµnh tÈu giang hå. ")
	Msg2Player("Ban ®· rêi khái Thiªn V­¬ng bang, tiÕp tôc hµnh tÈu giang hå. ")
	SetFaction("")
	SetCamp(4)
	SetCurCamp(4)
end

function defection_yes()
-- Ë¢µô¼¼ÄÜ
	n = 0
	i=29; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- Õ¶Áú¾÷
	i=23; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ÌìÍõÇ¹·¨
	i=24; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ÌìÍõµ¶·¨
	i=26; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ÌìÍõ´¸·¨
	i=30; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- »Ø·çÂäÑã
	i=31; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ĞĞÔÆ¾÷
	i=32; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ÎŞĞÄÕ¶
	i=33; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ¾²ĞÄ¾÷
	i=34; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ¾ªÀ×Õ¶
	i=35; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- Ñô¹ØÈıµş
	i=36; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ÌìÍõÕ½Òâ
	i=37; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ÆÃ·çÕ¶
	i=38; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ÅÌ¹Å¾ÅÊ½£¨ÒÑÈ¡Ïû¼¼ÄÜ£©
	i=40; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ¶Ï»êØİ
	i=41; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ÑªÕ½°Ë·½
	i=42; x = HaveMagic(i); if (x ~= -1) then n = n + x end; DelMagic(i)			-- ½ğÖÓÕÖ
	AddMagicPoint(n)
-- Ë¢Íê¼¼ÄÜºó¼ÌĞø×ªÃÅÅÉÁ÷³Ì
	SetTask(7,5*256+20)
	SetTask(3,75*256)				-- ÎªÔ­ÃÅÅÉ×÷¸ö±ê¼Ç
	SetRank(79)						-- Í·ÏÎ½µÎªÕò°ïÔªË§
	if (GetRepute() < 200) then
		Msg2Player("V× hµnh vi bÊt trung víi m«n ph¸i, danh väng cña b¹n gi¶m xuèng "..GetRepute().."®iÓm!")
		AddRepute(-1 * GetRepute())
	else
		Msg2Player("V× hµnh vi bÊt trung víi m«n ph¸i, danh väng cña b¹n gi¶m xuèng 200 ®iÓm! ")
		AddRepute(-200)
	end
	AddNote("D­¬ng Anh phÕ bá vâ c«ng Thiªn V­¬ng bang cña b¹n, ®o¹t l¹i chøc K×nh Thiªn Nguyªn So¸i dång thêi c«ng bè cho thiªn h¹ b¹n ®· ra khái Thiªn V­¬ng Bang. B©y giê ng­¬i cã thÓ gia nhËp ThiÕu L©m ph¸i. ")
	Msg2Player("D­¬ng Anh phÕ bá vâ c«ng Thiªn V­¬ng bang cña b¹n, ®o¹t l¹i chøc K×nh Thiªn Nguyªn So¸i dång thêi c«ng bè cho thiªn h¹ b¹n ®· ra khái Thiªn V­¬ng Bang. B©y giê ng­¬i cã thÓ gia nhËp ThiÕu L©m ph¸i. ")
	Talk(1,"KickOutSelf", 11541)
end

function defection_no()
	SetTask(7,1*256)				-- ÎªÆóÍ¼ÅÑÊ¦×÷¸ö±ê¼Ç£¬ÒÔ±¸½«À´²»Ê±Ö®Ğè
	AddNote("B¹n tõ bá ı ®Şnh gia nhËp ThiÕu L©m ph¸i. ")
	Msg2Player("B¹n tõ bá ı ®Şnh gia nhËp ThiÕu L©m ph¸i. ")
end

function return_select()
	Say(11542 ,2,"V©ng, ta muèn trë l¹i Thiªn V­¬ng bang /return_yes","Kh«ng, ta chØ buét miÖng nãi vËy th«i. /return_no")
end;

function return_yes()
	Talk(2,"", 11543, 11544)
	SetTask(3,70*256+20)
	AddNote("Hæ trî 50000 l­îng qu©n phİ cho Thiªn V­¬ng bang cã thÓ quay l¹i m«n ph¸i. ")
	Msg2Player("Hæ trî 50000 l­îng qu©n phİ cho Thiªn V­¬ng bang cã thÓ quay l¹i m«n ph¸i. ")
end;

function return_no()
	Talk(1,"", 11545)
end;

function return_complete()
	if(GetCash() >= 50000) then								-- ÓĞ50000Á½
		Talk(1,"", 11546)
		Pay(50000)
		SetTask(3, 80*256)
		SetFaction("tianwang")
		SetCamp(3)
		SetCurCamp(3)
		SetRank(69)
		if (HaveMagic(36) == -1) then
			AddMagic(32)
			AddMagic(41)
			AddMagic(324)
			AddMagic(36)
			Msg2Player("B¹n häc ®­îc tuyÖt kü trÊn ph¸i cña Thiªn V­¬ng bang: Thiªn V­¬ng ChiÕn ı, Vâ C«ng V« T©m Tr¶m, HuyÕt ChiÕn B¸t ph­¬ng, Thõa Long QuyÕt. ")
		end
		AddNote("§· quay trë l¹i Thiªn V­¬ng bang. ")
		Msg2Faction(GetName().." ®· trë l¹i Thiªn V­¬ng bang, ®­îc phong lµ K×nh Thiªn Nguyªn So¸i")
	else
		Talk(2,"", 11547, 11548)
	end
end;

---------------------- ³öÊ¦ÈÎÎñ ----------------------
function L60_get()
	Say(11549 , 2, "Thuéc h¹ tËn lùc thi hµnh /L60_get_yes", "E r»ng khã cã thÓ nhËn nhiÖm vô /no")
end;

function L60_get_yes()
	Talk(1,"", 11550)
	SetTask(3, 60*256+20)
	AddNote("T¹i TÈm cung Thiªn V­¬ng bang (223, 196) gÆp D­¬ng Anh, tiÕp nhËn nhiÖm vô ®i Thanh Loa ®¶o thu håi Thiªn V­¬ng Di Th­. ")
	Msg2Player("T¹i TÈm cung Thiªn V­¬ng bang (223, 196) gÆp D­¬ng Anh, tiÕp nhËn nhiÖm vô ®i Thanh Loa ®¶o thu håi Thiªn V­¬ng Di Th­. ")
end;

function L60_prise()
DelItem(96)
Msg2Player("Chóc mõng b¹n ®· xuÊt s­ thµnh c«ng, b¹n ®­îc phong lµ TrÊn Bang Nguyªn So¸i! Danh väng t¨ng thªm 120 ®iÓm! ")
--AddGlobalCountNews(GetName().."ÒÕ³É³öÊ¦£¬¸æ±ğÍ¬ÃÅÊ¦µÜ¿ªÊ¼´³µ´½­ºş¡£", 1)
Msg2SubWorld("Thiªn V­¬ng"..GetName().."XuÊt s­ thµnh c«ng, c¸o biÖt D­¬ng bang chñ vµ c¸c ®ång m«n huynh ®Ö, tiÕp tôc hµnh tÈu giang hå. ")
AddRepute(120)
SetRank(79)
SetTask(3, 70*256)
SetFaction("")
SetCamp(4)			   				--Íæ¼ÒÍË³öÌìÍõ°ï
SetCurCamp(4)
AddNote("Quay l¹i TÈm cung Thiªn V­¬ng Bang, ®­a Thiªn V­¬ng Di Th­ cho Bang chñ D­¬ng Anh, hoµn thµnh nhiÖm vô xuÊt s­. Th¨ng chøc K×nh Thiªn Nguyªn So¸i.. ")
end;

function no()
end
