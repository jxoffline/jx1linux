-- ´óÀí¡¡Ö°ÄÜ¡¡³ÇÃÅÎÀ±ø¼×&³ÇÃÅÎÀ±øÒÒ
-- by£ºDan_Deng(2003-09-16)
-- Update: Dan_Deng(2004-05-27) Ğ¡¶ùÊ§×ÙÈÎÎñ

Include("\\script\\global\\repute_head.lua")
Include("\\script\\global\\map_helper.lua")
npc_name = "<#> VÖ binh Thµnh m«n"

function default_talk()
--	UTask_world42 = GetTask(42)	-- ÉèÖÃÈÎÎñ±äÁ¿
--	if ((UTask_world42 == 0) and (GetLevel() >= 80) and (GetReputeLevel(GetRepute()) >= 7)) then		-- ÈÎÎñÆô¶¯£¬ÉùÍûµÈ¼¶ºÍÉùÍûÖµµÄ¹ØÏµ²»ÊÇºÜÃ÷È·£¬ÒªÎÊÃ÷°×
--		Talk(6,"U42_get","³ÇÃÅÎÀ±ø¼×£ºÌıËµ³ÇÀï×î½üÀÏÓĞĞ¡º¢ÎŞ¹ÊÊ§×Ù£¿","³ÇÃÅÎÀ±øÒÒ£ºÊÇ°¡¡£ÎÒÔ­À´µÄæ°Í·Ò¶»¨£¬Ëı¶şĞ¡×ÓÒ²²»¼ûÁË£¬×î½ü³£À´·³ÎÒ°ïËıÕÒ¶ù×Ó¡£","Íæ¼Ò£ºÁ½Î»£¬¾¿¾¹ÔõÃ´»ØÊÂ£¿","³ÇÃÅÎÀ±ø¼×£ººÇºÇ£¬ÕâÎ»´óÏÀÒÇ±íÌÃÌÃ£¬Ó¢Ã÷ÉñÎä£¬¿´À´ÊÇÏë¹Ü¹ÜÕâµµ×ÓÊÂ¿©£¿","Íæ¼Ò£º¿ÍÆø£¬Â·¼û²»Æ½°Îµ¶ÏàÖúÊÇÎÒ±²±¾·Ö¡£","³ÇÃÅÎÀ±øÒÒ£º°¥Ñ½£¬½ñÍíµÄ¾ÆÇ®ºÃÏóÃ»´ø¹»°¡£¡")
--	else
		Talk(4,"","H«m nay ta ®· thÊy ®­îc 9 mü nh©n, kh«ng nh×n th× tiÕc, nh×n kh«ng mÊt tiÒn mµ! ","TiÓu tõ nµy h×nh nh­ ch¸n sèng råi!","Nhµn h¹ th× cã nhµn h¹, nh×n bªn nµy bªn kia, lín lªn còng tèt!","Kh«ng sai! D¸ng vÎ thËt tuyÖt! ")
--	end;
end;

function U42_get()
	Say("§óng vËy! H·y cßn ®óng 5 v¹n l­îng.",2,"Hai vŞ ®¹i ca thó vŞ thËt/yes1","Dèi ®­îc ng­êi nh­ng kh«ng dèi®­îc m×nh!/no")
end;

function yes1()
	if (GetCash()>=50000) then 
		Pay(50000)
		Talk(1,"","C¸c h¹ ra tay hµo phãng, h·y ®i D­îc V­¬ng Cèc hái ®¹o nh©n ch©n quÌ, «ng ta biÕt nh÷ng viÖc bİ mËt nµy.")
		SetTask(42, 10)
		AddNote("NhiÖm vô TiÓu Nhi mÊt tİch: TiÕp nhËn nhiÖm vô, ®i D­îc V­¬ng Cèc t×m Qua C­íc ®¹o nh©n hái vÒ tin tøc cña ®øa trÎ.")
		Msg2Player("NhiÖm vô TiÓu Nhi mÊt tİch: TiÕp nhËn nhiÖm vô, ®i D­îc V­¬ng Cèc t×m Qua C­íc ®¹o nh©n hái vÒ tin tøc cña ®øa trÎ.")
	else
		Talk(1,"","§i ®i! TiÒn kh«ng cã lµm §¹i hiÖp g×, vÒ quª lµm ruéng ®i!")
	end
end;

function no()
	Talk(1,"","§i ®i! TiÒn kh«ng cã lµm §¹i hiÖp g×, vÒ quª lµm ruéng ®i!")
end;
