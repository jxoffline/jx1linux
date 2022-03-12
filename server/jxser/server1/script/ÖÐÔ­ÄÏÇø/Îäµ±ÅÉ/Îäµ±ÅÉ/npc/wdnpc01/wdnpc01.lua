--description: Îäµ±ÅÉĞ¡µÀÊ¿Çå·ç¡¡¼ñÄ¾Í°ÈÎÎñ£¨Îäµ±ÈëÃÅÈÎÎñ£©
--author: yuanlan
--date: 2003/5/14
--Dan_Deng(2003-07-22), ¼ÓÈëÃÅÅÉÈÎÎñµÄµÈ¼¶ÒªÇó
-- Update: Dan_Deng(2003-08-17)
-- Update: Dan_Deng(2004-01-12)ÖØĞÂÉè¼ÆÈëÃÅÈÎÎñ£¬¸ÄÎª¼ÇÃûµÜ×ÓÈÎÎñ

Include("\\script\\global\\repute_head.lua")

function main()
	UTask_wd = GetTask(5)
	UTask_world31 = GetByte(GetTask(31),1)
	if (UTask_world31 == 0)	and (GetLevel() >= 10) and (GetFaction() ~= "wudang") then			-- Ë®Í°ÈÎÎñÆô¶¯
		Say("Khi ta lÊy n­íc kh«ng cÈn thËn ®· lµm ®øt d©y thïng, kÕt qu¶ lµ <color=Red>thïng gç<color> r¬i xuèng <color=Red>giÕng<color>, kh«ng lÊy ®­îc n­íc,quay vÒ nhÊt ®Şnh bŞ s­ huynh quë tr¸ch. Ng­¬i cã ®ång ı gióp ta lÊy thïng gç lªn kh«ng?", 2, "§ång ı!/uworld31_get_yes", "ta kh«ng gióp ng­¬i ®­îc /uworld31_get_no")
	elseif (UTask_world31 == 5) and (HaveItem(65) == 1) then					--ÓĞÄ¾Í°
		uworld31_prise()
	elseif (UTask_world31 < 10) then 					--ÉĞÎ´Íê³É¼ñÄ¾Í°ÈÎÎñ
		Talk(1,"","<color=Red>Thïng gç<color> cña ta r¬i xuèng <color=Red>giÕng<color>, nÕu kh«ng t×m ®­îc <color=Red>thïng gç<color>, kh«ng lÊy ®­îc n­íc sÏ bŞ S­ huynh tr¸ch ph¹t.")
	elseif (UTask_world31 == 10) then 					--ÒÔÇ°Íê³É¼ñÄ¾Í°ÈÎÎñ
		UTask_world31 = SetByte(GetTask(31),1,127)
		SetTask(31,UTask_world31)
		Talk(1,"","C¶m ¬n ng­¬i lÇn tr­íc ®· gióp ta lÊy l¹i thïng gç! Ta sÏ cho ng­¬i lµm ®Ö tö kı danh Vâ §ang ph¸i, sau nµy ng­¬i cã thÓ mua b¸n trang bŞ vò khİ cña Vâ §ang ph¸i.")
	elseif (GetFaction() == "wudang") then   				--ÒÑ¾­ÈëÃÅ£¬ÉĞÎ´³öÊ¦
		Talk(1,"","Hµng ngµy ®Òu kªu ta tíi ®©y lÊy n­íc, cßn thêi gian ®©u mµ tu luyÖn n÷a! Ng­¬i cã r¶nh th× ®Õn nãi chuyÖn víi ta ®­îc kh«ng?")
	elseif (UTask_wd == 70*256) then							--ÒÑ¾­³öÊ¦
		Talk(1,"","Ng­¬i thËt cã b¶n lÜnh! Chao «i! Bao giê ta míi cã thÓ xuÊt s­ ®©y?")
	else
		Talk(1,"","Vâ §ang s¬n b¾c th«ng víi TÇn LÜnh, phİa Nam gi¸p víi Ba S¬n, liªn miªn khëi phôc, ngang däc tr¨m dÆm, 72 ®Ønh hïng vÜ l¹ k×, hµng n¨m ng­êi ta du ngo¹n ®Õn ®©y rÊt ®«ng!")
	end
end;

function uworld31_get_yes()
	Talk(1,"","Hay qu¸! <color=Red>Thïng gç<color> bŞ r¬i xuèng <color=Red>giÕng<color> ®ã.")
--	DelItem(65)									--·ÀÖ¹ÖØ½ÓÈÎÎñºó£¬Íæ¼Ò¼ñÆğÈÎÎñµÀ¾ß
	SetTask(31,SetByte(GetTask(31),1,5))
	AddNote("GÆp tiÓu ®¹o sÜ Thanh Phong ë giÕng Ma ch©m phİa §«ng tr­íc nói, TiÕp nhËn nhiÖm vô: Gióp ®ì Thanh Phong xuèng ®¸y giÕng t×m thïng gç. ")
	Msg2Player("TiÕp nhËn nhiÖm vô: Gióp ®ì Thanh Phong xuèng ®¸y giÕng t×m thïng gç. ")
end;

function uworld31_get_no()
	Talk(1,"","VËy ta t×m ng­êi kh¸c gióp!")
end;

function uworld31_prise()
	DelItem(65)
	UTask_world31 = SetByte(GetTask(31),1,127)
	i = ReturnRepute(25,24,4)		-- È±Ê¡ÉùÍû12£¬×î´óÎŞËğºÄµÈ¼¶24¼¶£¬Ã¿¼¶µİ¼õ8%
	SetTask(31,UTask_world31)
	AddRepute(i)		-- ¼ÓÉùÍû
	Talk(1,"","C¶m ¬n ng­¬i ®· gióp ta lÊy l¹i thïng gç! Ta ®· ®øng ë ®©y rÊt l©u, ng­¬i lµ trong sè İt ng­êi chŞu gióp ta t×m l¹i thïng gç, ta phong ng­¬i lµ ®Ö tö kı danh Vâ §ang ph¸i,sau nµy ng­¬i cã thÓ mua b¸n trang bŞ vò khİ cña Vâ §ang ph¸i.")
	AddNote("Gióp ®ì tiÓu ®¹o sÜ Thanh Phong t×m l¹i thïng gç, nhiÖm vô hoµn thµnh. Trë thµnh Kı danh ®Ö tö. Danh väng t¨ng thªm ")
	Msg2Player("Gióp ®ì tiÓu ®¹o sÜ Thanh Phong t×m l¹i thïng gç, nhiÖm vô hoµn thµnh. Trë thµnh Kı danh ®Ö tö. Danh väng t¨ng thªm "..i.."®iÓm.")
end

function no()
end;
