--Á½ºşÇø °ÍÁêÏØ ÌìÍõ½«Áì¶Ô»° °ÍÁêĞ¡ÓæÈÎÎñ¡¢ÌìÍõÈëÃÅ
--suyu
-- Update: Dan_Deng(2003-08-10)
-- Update: Dan_Deng(2003-08-21) ¼ÓÈëÃâ·ÑËÍ±¾ÃÅµÜ×Ó»ØÃÅÅÉ
-- Update£ºDan_Deng(2003-09-05) ÖØĞÂÕûÀíÈÎÎñ±äÁ¿¿ØÖÆ

Include("\\script\\global\\¸÷ÅÉ½ÓÒıµÜ×Ó\\ÌìÍõ½ÓÒıµÜ×Ó.lua")

function main(sel)
	UTask_world18 = GetTask(46);
	if(UTask_world18 == 1) and (HaveItem(180) == 0) then
		Talk(1,"","Tú bµ hoµn? DÜ nhiªn lµ ®Ó cøu ng­êi! TÆng ng­¬i 1 viªn")
		AddEventItem(180)
--		SetTask(46, 2)				-- Îª·½±ãÖØ×öÈÎÎñ£¬Ö»¸øµÀ¾ß²»¼Ó±äÁ¿Öµ
		Msg2Player("B¹n nhËn ®­îc mét viªn Tú Bµ hoµn. ")
		AddNote("T×m gÆp ®Ö tö Thiªn V­¬ng, lÊy ®­îc mét viªn Tú Bµ hoµn. ")
	else
		default_talk()
	end
end;
