-- ÁúÈª´å¡¡Â·ÈË¡¡ÆİÔÊÕæ
-- by£ºDan_Deng(2003-09-16)
-- Îå¶¾½Ì90¼¶ÈÎÎñ
-- update by xiaoyang(2004\4\13)

Include("\\script\\global\\repute_head.lua")

Include("\\script\\item\\skillbook.lua")

function main()
	Uworld124 = GetTask(124)
	Uworld37 = GetByte(GetTask(37),2)
	if(Uworld124 < 10) and (GetLevel() >= 90) and (GetReputeLevel(GetRepute()) >= 5) and (Uworld37 == 127) and (GetFaction() ~= "wudu") then
		Talk(6,"Uworld_wuget","T¹i Long TuyÒn th«n, b¹n gÆp ®­îc Uy DuÉn Ch©nph¸t hiÖn ra ®iÖn m¹o cña h¾n rÊt kú qu¸i. Da trªn mÆt cña h¾n xanh x¸m, nh¨n nhóm l¹i trong thËt gím ghiÕc. Nh­ng h×nh nh­ vÉn lé vÎ bi th­¬ng, cïng khæ ","VŞ ®¹i ca nµy! Ph¶i ch¨ng ®ang cã chuyÖn kh«ng vui?","Khµ! Khµ! B»ng h÷u h·y mau ®i ®i! Khµ! Khµ!","Ta nh×n thÊy da mÆt cña ng­¬i t¸i xanh, toµn th©n co róm, ph¶i ch¨ng ®· bŞ tróng ®éc?","§· bŞ ng­¬i nhËn ra nh­ vËy råi th× ta còng kh«ng cßn g× ph¶i giÊu. T¹i h¹ bŞ tróng ®éc ¢m d­¬ng TiÕu cña ¢m Lang ®éc d­îc. B©y giê cø 3 giê th× l¹i ph¸t t¸n mét lÇn, c­êi ®Õn toµn th©n biÕn d¹ng, nam n÷ bÊt ph©n, h×nh d¹ng qu¸i thó, sóc vËt còng kh«ng d¸m ®Õn gÇn. C­êi ®Õn khi th©n kh« khèc l¹i, sèng kh«ng b»ng chÕt ","Rèt cuéc lµ ai ®· dïng thø kŞch ®éc nµy ®Ó h¹i ng­¬i?")
	elseif(Uworld124 == 40) and (HaveItem(387) == 1) then
		Talk(5,"Uworld_wufinish","Uy Huynh thuèc gi¶i ë ®©y, h·y mau uèng ®i!","Oa! §· tho¶i m¸i nhiÒu! §a t¹ ®¹i hiÖp cøu m¹ng. Uy mç nµy lµm tr©u lµm ngùa còng khã mµ b¸o ®¸p! ","DiÖt trõ bän ¸c,lµ bæn phËn cña nh÷ng ng­êi hµnh tÈu giang hå. Kh«ng cÇn ph¶i l­u t©m! ","Ngµy nay nh©n t©m th¸c lo¹n. Nh÷ng ng­êi hiÖp nghÜa nh­ huynh l¹i cµng hiÕm thÊy. Kh«ng giÊu g× huynh, ta chİnh lµ ®Ö tö cña Ngò §éc gi¸o, tiÕp tay cho bän ¸c. Cuèi cïng l¹i bŞ tªn V©n L·o tÆc biÕn ta thµnh mét c«ng cô ®Ó cho h¾n thö ®éc. Nh©n sinh b¸ch khæ ta ®Òu ®· nÕm qua hÕt ","Ng­êi tèt håi t©m vÉn ch­a muén, mong ng­¬i sao nµy sÏ dïng lßng tõ bi mµ ®èi nh©n sö thÕ ","§¹i hiÖp yªn t©m! Tr·i qua chuyÖn nµy, ta nhÊt ®Şnh sÏ kh«ng ¸c t©m h¹i ng­êi n÷a ")
	elseif(Uworld124 > 10) and (Uworld124 < 40) then
		Talk(1,"","Khµ khµ khµ khµ. ")
	else
		Talk(1,"","Ng­¬i cã nghe nãi ®Õn chuyÖn bøc '®Şa ®å s¬n hµ x· t¾c' g× ®ã kh«ng? Cã thËt lµ cã bøc ®Şa ®å ®ã kh«ng? NÕu nh­ cã ®­îc nã trong tay råi th× vinh hoa phó quı h­ëng c¶ mÊy ®êi còng kh«ng hÕt ")
	end
end

function Uworld_wuget()
	if (GetCamp() == 0) and (GetTask(75) < 255) then		-- °×ÃûÎ´Ñ§Ò°ÇòÈ­µÄ£¬²»ÔÊĞí½ÓÈÎÎñ
		Talk(1,"","Khµ khµ!. xem c¸i t­íng ®i kh«ng c¶n ®­îc giã cña ng­¬i, nãi ra chuyÖn nµy cã h÷u İch g× ®©u, hay lµ th«i vËy. Khµ khµ... ")
	else
		Say("Ngò §éc gi¸o, V©n BÊt Tµ...",2,"Ng­¬i ®îi ®Êy, ta sÏ d¹y cho ng­¬i biÕt thÕ nµo lµ chİnh ®¹o /Uworld_wduok","V©n BÊt Tµ c¶ ®êi dïng ®éc, ta kh«ng muèn g©y tíi h¾n ®Ó chÕt, ng­¬i tù gi÷ m×nh ®ã /Uworld_wduno")
	end
end

function Uworld_wduok()
	SetTask(124,10)
	Msg2Player("§¸p øng Uy DuÉn Ch©n, ®i t×m V©n BÊt Tµ ®Ó lÊy thuèc gi¶i ®éc ¢m D­¬ng TiÕu ")
	AddNote("§¸p øng Uy DuÉn Ch©n, ®i t×m V©n BÊt Tµ ®Ó lÊy thuèc gi¶i ®éc ¢m D­¬ng TiÕu ")
end

function Uworld_wduno()
end

function Uworld_wufinish()
	DelItem(387)
	if (GetTask(10) >= 70*256) and (GetTask(10) ~= 75*256) then				-- ÊÇÎå¶¾³öÊ¦µÄ£¬¿ÉÒÔÑ§µ½¼¼ÄÜ
		Talk(2,"","ë ®©y cã mét quyÓn 'MËt d­îc Kinh 'cña Ngò §éc gi¸o, xin tÆng cho ®¹i hiÖp, xin chí chèi tõ ","VËy th× ta còng kh«ng kh¸ch s¸o! Ta sÏ nghiªn cøu quyÓn mËt kinh nµy, ®Ó cã thÓ gi¶i cøu cho thiªn h¹ ")
		if (HaveMagic(353) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(353,1)
		end
		if (HaveMagic(355) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(355,1)
		end
		if (HaveMagic(390) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(390)
		end
		CheckIsCanGet150SkillTask()
		Msg2Player("LuyÖn ®­îc kü n¨ng: ¢m D­¬ng Thùc Cèt, HuyÒn ¢m Tr¶m, §o¹n C©n Hñ Cèt ")
		SetTask(124,255)
	else
		SetTask(124,245)								--»ñµÃÉùÍûµÄÉèÖÃ±äÁ¿245
	end
   add_repute = ReturnRepute(30,100,4)			-- ÉùÍû½±Àø£º×î´ó30µã£¬´Ó100¼¶ÆğÃ¿¼¶µİ¼õ4%
   AddRepute(add_repute)
   Msg2Player("§em ®­îc thuèc gi¶i vÒ cho Uy DuÉn Ch©n, hoµn thµnh nhiÖm vô, danh väng cña b¹n t¨ng thªm "..add_repute.."®iÓm.")
   AddNote("§em ®­îc thuèc gi¶i vÒ cho Uy DuÉn Ch©n, hoµn thµnh nhiÖm vô ")
end
