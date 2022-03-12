--description: ¶ëáÒÅÉÃî³¾
--author: yuanlan	
--date: 2003/3/4
-- Update: Dan_Deng(2003-08-12)

Include("\\script\\global\\repute_head.lua")

function main()
	UTask_em = GetTask(1);
	Uworld36 = GetByte(GetTask(36),1)
	if (Uworld36 == 70) then		-- ÈëÃÅÈÎÎñ½øĞĞÖĞ
		if (HaveItem(17) == 0) then		--ÄÃµ½°×ÓñÈçÒâÖ®Ç°
			Talk(1,"","Muéi ch­a lÊy ®­îc <color=Red>B¹ch Ngäc Nh­ ı<color>!")
		else									--ÄÃµ½°×ÓñÈçÒâÖ®ºó
			Uworld36_prise()
		end
--	elseif (UTask_em < 6) then 							--ÉĞÎ´Íê³ÉÇ°Èı¹Ø
--		Talk(1,"","Ãî³¾£ºÒªÏë¼ÓÈë±¾ÅÉ£¬±ØĞëÏÈÍ¨¹ı²èÇÙÊéµÄ¿¼Ñé£¬Äã¶¼×öµ½ÁËÂğ£¿")
--	elseif (UTask_em == 6) then 							--ÉĞÎ´Íê³ÉÇ°Èı¹Ø
--		Talk(1,"","Ãî³¾£ºÄãÒÑÍ¨¹ı²èÇÙÊéµÄ¿¼Ñé£¬½ÓÏÂÀ´ÄãÈ¥ÕÒ<color=Red>Ğ»ÔÆÂÜ<color>Ê¦ÃÃ°É£¬Ëı¾ÍÔÚ°ëÉ½ÑüµÄ<color=Red>×êÌìÆÂÈë¿Ú<color>´¦¡£")
	elseif (GetFaction() == "emei") then   				--ÒÑ¾­ÈëÃÅ£¬ÉĞÎ´³öÊ¦
		Talk(1,"","S­ muéi cÈn thËn! Toµn Thiªn Ph¸ v« cïng nguy hiÓm!")
	elseif (UTask_em == 70) then   						--ÒÑ¾­³öÊ¦
		Talk(1,"","S­ muéi, ph¶i h¹ s¬n sao? Tû muéi ta sÏ rÊt nhí muéi!")
	else
		Talk(1,"","Toµn Thiªn Ph¸ lµ n¬i nguy hiÓm, xin thİ chñ ®õng m¹o hiÓm!")
	end
end;

function Uworld36_prise()
	DelItem(17)
	Uworld36 = SetByte(GetTask(36),1,127)
	i = ReturnRepute(30,19,3)		-- È±Ê¡ÉùÍû£¬×î´óÎŞËğºÄµÈ¼¶£¬Ã¿¼¶µİ¼õ
	SetTask(36,Uworld36)
	AddRepute(i)		-- ¼ÓÉùÍû
	AddNote("§­a cho DiÖu TrÇn B¹ch Ngäc nh­ ı, hoµn thµnh nhiÖm vô, trë thµnh Kı Danh ®Ö tö cña Nga Mi ph¸i ")
	Msg2Player("§­a cho DiÖu TrÇn B¹ch Ngäc nh­ ı, hoµn thµnh nhiÖm vô, trë thµnh Kı Danh ®Ö tö cña Nga Mi ph¸i, thanh thÕ giang hå ®­îc t¨ng "..i.."®iÓm.")
	Talk(1,"","Chóc mõng muéi nhËn ®­îc B¹ch Ngäc Nh­ ı, thuËn lîi qua ®­îc 4 ¶i thö th¸ch cña tû muéi ta. Tõ nay muéi ®· lµ ®Ö tö cña bæn ph¸i! VÒ sau hoan nghªnh muéi ®Õn Nga Mi du ngo¹n!")
end
