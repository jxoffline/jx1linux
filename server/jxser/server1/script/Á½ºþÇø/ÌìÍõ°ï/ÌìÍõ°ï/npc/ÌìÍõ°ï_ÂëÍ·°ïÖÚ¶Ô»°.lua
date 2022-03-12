--Á½ºþÇø ÌìÍõ°ï ÂëÍ·°ïÖÚ¶Ô»°

function main(sel)
	UTask_tw = GetTask(3);
	if (UTask_tw >= 60*256+20) and (GetFaction() == "tianwang") then
		Say("Muèn rêi ®¶o ®i ®©u?", 3, "Ba L¨ng huyÖn/yes", "Thanh Loa ®¶o/yes1", "Kh«ng rêi ®¶o /no")
	else
		Say("Muèn rêi ®¶o ®i ®©u?", 2, "Ba L¨ng huyÖn/yes", "Kh«ng rêi ®¶o /no")
	end
end;

function yes()
	if (GetFaction() == "tianwang") then						--Èç¹ûÍæ¼ÒÊÇÌìÍõ°ïµÜ×Ó£¬×ø´¬²»ÊÕÇ®
		Say("Huynh ®Ö! Ngåi ch¾c nhÐ!", 2, "§­îc råi! /ok1","§îi ®·, h·y khoan ®i! /no")
	else
		Say("Kh«ng ph¶i huynh ®Ö bæn bang, ngåi thuyÒn kh«ng thÓ miÔn phÝ.", 2, "§­îc. /ok2","§îi ®·, h·y khoan ®i! /no")
	end
end;

function yes1()
--	if (GetFaction() == "tianwang") then						--Èç¹ûÍæ¼ÒÊÇÌìÍõ°ïµÜ×Ó£¬×ø´¬²»ÊÕÇ®
		Say("Thanh La §¶o kh«ng ph¶i lµ n¬i dÔ vµo! Ng­¬i chuÈn bÞ s½n sµng ch­a?", 2, "ChuÈn bÞ xong råi /ok3","ChuÈn bÞ l¹i mét chót /no")
--	else
--		Say("ÌìÍõ°ïÖÚ£º²»ÊÇ±¾°ïÐÖµÜ£¬×ø´¬¿É²»ÊÇÃâ·ÑµÄ¡£", 2, "ºÃ°É/ok4","µÈµÈ£¬ÏÈ²»È¥ÁË/no")
--	end
end;

function no()
end;

function ok1()
NewWorld(53, 1793, 3159)						--»Ø°ÍÁêÏØ
SetFightState(1)							--×ª»»ÎªÕ½¶·×´Ì¬
end;

function ok2()
if (GetCash() >= 100) then						--²Î¿¼Öµ
	Pay(100)
	NewWorld(53, 1793, 3159)					--»Ø°ÍÁêÏØ
	SetFightState(1)						--×ª»»ÎªÕ½¶·×´Ì¬
else
	Say("Kh«ng tiÒn mµ ®ßi ®i lung tung! Ng­¬i míi ra giang hå µ?", 0)		
end;
end;

function ok3()
NewWorld(68, 1634, 3242)						--È¥ÇàÂÝµº
SetFightState(1)							--×ª»»ÎªÕ½¶·×´Ì¬
end;

function ok4()
if (GetCash() >= 500) then						--²Î¿¼Öµ
	Pay(500)
	NewWorld(68, 1634, 3242)					--È¥ÇàÂÝµº
	SetFightState(1)						--×ª»»ÎªÕ½¶·×´Ì¬
else
	Say("Kh«ng tiÒn mµ ®ßi ®i lung tung!", 0)		
end;
end;
