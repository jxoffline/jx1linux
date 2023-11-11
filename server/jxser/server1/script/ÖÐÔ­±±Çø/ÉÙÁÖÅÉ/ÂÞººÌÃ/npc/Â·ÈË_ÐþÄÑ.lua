-- ÉÙÁÖ Â·ÈËNPC ÂŞººÌÃÊ××ùĞşÄÑ ÉÙÁÖ³öÊ¦ÈÎÎñ
-- by£ºDan_Deng(2003-08-04)
-- update by xiaoyang(2004\4\15) ÉÙÁÖ90¼¶ÈÎÎñ

Include("\\script\\global\\repute_head.lua")
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")

Include("\\script\\item\\skillbook.lua")

function main()
	if allbrother_0801_CheckIsDialog(206) == 1 then
		allbrother_0801_FindNpcTaskDialog(206)
		return 0;
	end
	UTask_sl = GetTask(7)
	Uworld122 = GetTask(122)
--	if (UTask_sl == 70*256) and (Uworld122 == 245) then		-- °×Ãû×öÍê90¼¶ÈÎÎñºóÓÖÈëÁËÃÅÅÉµÄ£¬Ö±½Ó¸ø¼¼ÄÜ
--		Talk(1,"","ĞşÄÑ£º°¢ÍÓÍÓ·ğ£¬Ê©Ö÷¹ûÈ»Ó¢ĞÛ³öÖÚ£¬ÕâÀïÓĞÉÙÁÖ¾øÒÕÒ»²¿£¬ÍûÄãÇÚ¼ÓÁ·Ï°£¬²»½öÒª³ÉÎª±¾ËÂ£¬¸üÒª³ÉÎªÖĞÔ­ÎäÁÖµÄ¶°Áº¡£")
--		AddMagic("½ğÁúÌ½×¦")
--		AddMagic("ºáÉ¨Ç§¾ü")
--		AddMagic("ÎŞÏàÕ¶")
--		Msg2Player("Ñ§»áÉÙÁÖ¼¼ÄÜ½ğÁúÌ½×¦¡¢ºáÉ¨Ç§¾ü¡¢ÎŞÏàÕ¶")
--		SetTask(122,255)
	if(GetSeries() == 0) and (GetFaction() == "shaolin") then
		if((UTask_sl == 60*256+10) and (HaveItem(217) == 1) and (HaveItem(215) == 1) and (HaveItem(216) == 1) and (HaveItem(214) == 1)) then		-- ÈÎÎñÍê³É
			L60_prise()
		elseif((UTask_sl == 60*256) and (GetLevel() >= 50)) then		--³öÊ¦ÈÎÎñÆô¶¯
			Say("Theo quy t¾c bæn m«n, phµm ®Ö tö muèn xuÊt s­ cña bæn m«n ®Òu ph¶i tr¶i qua thö nghiÖm 108 La H¸n TrËn, ng­¬i cã muèn x«ng ¶i kh«ng?",2,"§ång ı /L60_get_yes","Kh«ng muèn luyÖn /L60_get_no")
		else							-- ³£¹æ¶Ô»°
			Talk(1,"","ThiÕu L©m th©n t¹i Kim quèc, hån h­íng Nam triÒu. Ph­¬ng tr­îng s­ huynh u uÊt nh­ vËy còng ®óng th«i!")
		end
	elseif (Uworld122 == 20) then
		Talk(4,"Uworld122_censure","HuyÒn Nh©n ®¹i s­! §Ö tö ThiÕu L©m ®ang ®¸nh l«i ®µi t¹i Hoa S¬n, nh­ vËy sÏ lµm tæn h¹i danh tiÕng cña ThiÕu L©m ®ã.","TiÓu tö nµo ®Õn ®©y vËy? ChuyÖn cña ThiÕu L©m kh«ng cÇn ng­¬i xen vµo ®©u. §i ®i!","T¹i h¹ ngang qua Hoa S¬n thÊy bãng d¸ng cña cao thñ Kim Quèc, e r»ng quı ph¸i bŞ mai phôc ®ã.","§Ö tö tôc gia cña ThiÕu L©m tr¶i dµi kh¾p Kim Quèc, Qu©n Kim nÕu cã ®éng thñ tr­íc kh«ng lÏ ta kh«ng biÕt sao? §õng nãi nh÷ng lêi sµm bËy n÷a nÕu kh«ng ®i ta kh«ng kh¸ch s¸o ®©u ®ã!")
   elseif (Uworld122 >= 30) and (Uworld122 < 60) then
   	Talk(1,"","Cßn ®øng ®©y n÷a µ! Muèn ta ra tay h¶?") 
   elseif (Uworld122 == 70) then
   	Talk(7,"U122_prise","§¹i s­………","……","§¹i s­?","Th«i th«i! Lµ ta sai råi! HuyÒn Nan x­a nay kh«ng cói ®Çu víi ai! Nay xin nhËn lçi víi tiÓu huynh ®Ö ®©y!","Ai da! §¹i s­! Ta kh«ng d¸m nhËn ®©u!","Sao l¹i kh«ng? C¸c h¹ ®· cã c«ng cøu c¸c ®Ö tö trong lóc dÇu s«i löa báng, thËt cã ¬n t¸i t¹o.","§¹i s­ d¸m lµm d¸m nhËn, tiÓu tö ®©y b¸i phôc.")
	else
		Talk(1,"","Ng­¬i biÕt thÕ nµo lµ 'ThiÒn QuyÒn Quy NhÊt' kh«ng? §ã lµ chØ vâ häc ThiÕu L©m b¸t ®¹i tinh th«ng, lÊy vâ tu thiÒn!")
	end
end;

function L60_get_yes()
	Talk(1,"","Lèi vµo La H¸n TrËn n»m phİa sau t­îng PhËt, h·y vµo ®ã lÊy: trµng h¹t, thiÒn tr­îng, Méc ng­, b¸t nhµ s­ 4 tİn vËt nµy sau ®ã theo lèi vµo trë ra. Tõ m×nh lo liÖu nhĞ!")
	SetTask(7,60*256+10)
	AddNote("NhËn nhiÖm vô xuÊt s­ ThiÕu L©m: Vµo La H¸n TrËn t×m 4 mãn tİn vËt: NiÖm Ch©u, ThiÒn tr­îng, Méc Ng­, B¸t Vu. ")
	Msg2Player("NhËn nhiÖm vô xuÊt s­ ThiÕu L©m: Vµo La H¸n TrËn t×m 4 mãn tİn vËt: NiÖm Ch©u, ThiÒn tr­îng, Méc Ng­, B¸t Vu. ")
end;

function L60_get_no()
end;

function L60_prise()
	Talk(2,"","Chóc mõng ng­¬i ®· x«ng qua ®­îc 108 La H¸n TrËn, ng­¬i cã thÓ xuÊt s­, vÒ sau hµnh tÈu giang hå, cøu tÕ gióp ng­êi, hµnh hiÖp tr­îng nghÜa, kh«ng ®­îc cã vâ sanh kiªu, nhí lÊy ®ã!","§Ö tö xin ghi nhí!")
	DelItem(217)
	DelItem(215)
	DelItem(216)
	DelItem(214)
	SetRank(62)
	SetTask(7,70*256)
	SetFaction("")
	SetCamp(4)
	SetCurCamp(4)
	AddNote("Trong La H¸n TrËn t×m ®­îc 4 mãn tİn vËt giao cho HuyÒn Nan, hoµn thµnh nhiÖm vô xuÊt s­. Th¨ng chøc V« L­îng Thİch T«n, thuËn lîi xuÊt s­. ")
	Msg2Player("Chóc mõng B¹n xuÊt s­! B¹n ®· ®­îc phong lµm V« L­îng Thİch T«n ")
end;

function Uworld122_censure()
	SetTask(122,30)  --ÉèÖÃÈÎÎñ±äÁ¿Îª30
	Msg2Player("HuyÒn Nan kh«ng chó ı ®Õn b¹n, b¹n chØ cã thÓ ®i t×m HuyÒn Bi. ")
	AddNote("HuyÒn Nan kh«ng chó ı ®Õn b¹n, b¹n chØ cã thÓ ®i t×m HuyÒn Bi. ")
end

function U122_prise()
   if(GetTask(7) >= 70*256) and (GetTask(7) ~= 75*256) then			-- ÊÇÌìÍõµÜ×Ó»ò³öÊ¦µÜ×Ó
		Talk(2,"HuyÒn Nan: Kim quèc ®ang tiÕp tôc ®éng binh, vâ l©m Trung Nguyªn sÏ l¹i cã mét phen kinh thiªn ®éng ®Şa. ë ®©y l·o t¨ng cã mét quyÓn 'ThiÕu L©m TuyÖt kü', tÆng cho tiÓu h÷u, hy väng ng­¬i ch¨m chØ luyÖn c«ng, kh«ng chØ trë thµnh ®Ö tö cña bæn tù mµ cß cã thÓ lµ ","Sù r¨n d¹y cña ®¹i s­, tiÓu tö sao kh«ng d¸m tu©n theo!")
		if (HaveMagic(318) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(318,1)
		end
		if (HaveMagic(319) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(319,1)
		end
		if (HaveMagic(321) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(321,1)
		end
		CheckIsCanGet150SkillTask()
		Msg2Player("Häc ®­îc kü n¨ng ThiÕu L©m: §¹t Ma §é Giang, Hoµnh T¶o Thiªn Qu©n, V« T­íng Tr¶m. ")
		SetTask(122,255)
	else
	   SetTask(122,245)  --»ñµÃÉùÍûµÄÉèÖÃ±äÁ¿245
	end
   add_repute = ReturnRepute(30,100,4)			-- ÉùÍû½±Àø£º×î´ó30µã£¬´Ó100¼¶ÆğÃ¿¼¶µİ¼õ4%
   AddRepute(add_repute)
   Msg2Player("")
   Msg2Player("Cøu Th­êng, Lı hai ng­êi, hîp gi¶i cïng thiÒn t¨ng, hoµn thµnh nhiÖm vô ThiÕu L©m. Danh väng cña b¹n t¨ng thªm. "..add_repute.."®iÓm.")
   AddNote("Cøu xuÊt Th­êng, Lı hai ng­êi, hîp gi¶i cïng thiÒn t¨ng, hoµn thµnh nhiÖm vô ThiÕu L©m. ")
end
