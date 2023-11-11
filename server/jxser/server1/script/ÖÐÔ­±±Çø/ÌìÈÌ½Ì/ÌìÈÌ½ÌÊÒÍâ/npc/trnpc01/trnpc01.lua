--description: ÌìÈÌ½ÌµÜ×Ó¡¡ÓíÍõ½£ÈÎÎñ£¨ÌìÈÌ¼ÇÃûµÜ×ÓÈÎÎñ£©
--author: yuanlan	
--date: 2003/5/17
--Dan_Deng(2003-07-22), ¼ÓÈëÃÅÅÉÈÎÎñµÄµÈ¼¶ÒªÇó
-- Update: Dan_Deng(2003-08-14)

Include("\\script\\global\\repute_head.lua")

function main()
	UTask_tr = GetTask(4)
	UTask_gb = GetTask(8)
	UTask_world30 = GetByte(GetTask(30),1)
	if (UTask_world30 == 0) and (GetLevel() >= 10) and (GetFaction() ~= "tianren") then		-- ÈÎÎñÆô¶¯£¨ÒªÇó10¼¶ÒÔÉÏ£©
--		DelItem(50)						--·ÀÖ¹ÖØ½ÓÈÎÎñºó£¬Íæ¼Ò¼ñÆğÈÎÎñµÀ¾ß
		Say("Trªn <color=Red>Hoa S¬n<color> cã giÊu mét thanh <color=Red>Vò V­¬ng KiÕm<color>, ai lÊy ®­îc thanh kiÕm Êy cho bæn gi¸o sÏ ®­îc träng th­ëng!", 2, "§i lÊy Thanh kiÕm /get_yes", "Kh«ng thİch l¾m!/get_no")
	elseif ((UTask_world30 == 5) and (HaveItem(50) == 1)) then					--ÓĞÓíÍõ½£
		world30_prise()
	elseif ((UTask_world30 > 0) and (UTask_world30 < 10)) then
		Talk(1,"","<color=Red>Vò V­¬ng KiÕm<color> ®­îc giÊu trªn <color=Red>Hoa S¬n<color>, tõ ®©y ®Õn Hoa S¬n xa x«i hiÓm trë, ng­¬i ph¶i cÈn thËn!")
	elseif (UTask_world30 == 10) then		-- ÒÔÇ°Íê³ÉÈÎÎñµÄÈË×ª»»±äÁ¿Öµ
		Utask_world30 = SetByte(GetTask(30),1,127)
		SetTask(30,Uworld30)
		if (GetFaction() == "tianren") then
			Talk(1,"","C«ng lao ng­¬i t×m ®­îc Vò V­¬ng KiÕm, bæn gi¸o sÏ ghi nhí, sÏ kh«ng b¹c ®·i ng­¬i!")
		else
			Talk(1,"","V× c«ng lao ng­¬i lËp cho bæn gi¸o, bæn gi¸o nhËn ng­¬i lµm ®Ö tö!")
		end
	elseif (UTask_tr == 70*256) and (GetFaction() ~= "tianren") then							--ÒÑ¾­³öÊ¦
		Talk(1,"","Ng­¬i muèn ®i vÒ ph­¬ng Nam µ? Cao thñ vâ l©m Trung Nguyªn nhiÒu v« sè, h·y suy nghÜ kü tr­íc khi ®i.")
	else
		Talk(1,"","Ng­¬i biÕt kh«ng? Phong §­êng §­êng Chñ chİnh lµ ThÊt c«ng chóa cña ®­¬ng kim Hoµng ®Õ §¹i Kim, ch¼ng nh÷ng xinh ®Ñp mµ vâ nghÖ còng cao c­êng.")
	end
end;

function get_yes()
	Talk(1,"","Tõ ®©y ®Õn Hoa S¬n xa x«i hiÓm trë, ng­¬i cã thÓ ®Õn <color=Red>BiÖn Kinh<color>, ®i xa phu ®Õn <color=Red>Ph­îng T­êng<color>gÇn Hoa S¬n, còng cã thÓ nhê <color=Red>NhËt NguyÖt §µn Chñ Chñ ¤ Hîp T¸t<color> cña bæn gi¸o ®­a ng­¬i ®i.")
	SetTask(30, SetByte(GetTask(30),1,5))
	AddNote("NhËn nhiÖm vô: §i Hoa s¬n t×m Vò V­¬ng KiÕm. ")
	Msg2Player("NhËn nhiÖm vô: §i Hoa s¬n t×m Vò V­¬ng KiÕm. ")
end;

function get_no()
	Talk(1,"","Lóc nµo còng cã ng­êi muèn lÊy Vò V­¬ng KiÕm ®Ó ®­îc träng th­ëng.")
end;

function world30_prise()
	DelItem(50)
	i = ReturnRepute(15,19,6)		-- È±Ê¡ÉùÍû15£¬×î´óÎŞËğºÄµÈ¼¶19¼¶£¬Ã¿¼¶µİ¼õ6%
	Uworld30 = SetByte(GetTask(30),1,127)
	AddRepute(i)
	SetTask(30,Uworld30)
	Earn(500)
	Talk(1,"","V× c«ng lao ng­¬i lËp cho bæn gi¸o, bæn gi¸o nhËn ng­¬i lµm ®Ö tö!")
	AddNote("Quay l¹i Thiªn NhÉn Gi¸o, ®­a Vò V­¬ng KiÕm cho Thiªn NhÉn Tö SÜ, trë thµnh ®Ö tö, ®­îc th­ëng 500 l­îng. ")
	Msg2Player("Quay l¹i Thiªn NhÉn Gi¸o, ®­a Vò V­¬ng KiÕm cho Thiªn NhÉn Tö SÜ, hoµn thµnh nhiÖm vô. Të thµnh ®Ö tö cña Thiªn NhÉn Gi¸o, ®­îc th­ëng 500 l­îng, danh väng ®­¬c n©ng cao. "..i.."®iÓm.")
end;

function enroll_prise()
	SetFaction("tianren")    				--Íæ¼Ò¼ÓÈëÌìÈÌ½Ì
	SetCamp(2)
	SetCurCamp(2)
	AddMagic(135)
	SetRank(55)						--ÉèÖÃ³ÆºÅ
	SetRevPos(49, 28)  					--ÉèÖÃÖØÉúµã
	SetTask(4, 10*256)
	Msg2Player("Hoan nghªnh gia nhËp Thiªn NhÉn Gi¸o, trë thµnh S¸t Thñ, häc ®­îc vâ c«ng Tµn D­¬ng Nh­ HuyÕt. ")
	AddNote("Gia nhËp Thiªn NhÉn Gi¸o, trë thµnh S¸t Thñ, häc ®­îc vâ c«ng Tµn D­¬ng Nh­ HuyÕt. ")
end;

function enroll_no()
end;
