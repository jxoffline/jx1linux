--description: ÇàÂİµºÂëÍ·´¬·ò
--author: yuanlan	
--date: 2003/4/28


function main()

if (GetFaction() == "tianwang") then					--Èç¹ûÍæ¼ÒÊÇÌìÍõ°ïµÜ×Ó£¬×ø´¬²»ÊÕÇ®
	Say("Huynh ®Ö cña Thiªn V­¬ng bang th× ®i thuyÒn miÔn phİ!", 2, "Tu©n lÖnh!/yes", "Kh«ng /no")
else	
	Say("N¬i ®ã hiÓm nguy l¾m! NÕu kh¸ch quan muèn ®i xin cho thªm İt tiÒn!", 2, "to¹ /yes1", "Kh«ng ngåi/no")
--	Talk(1,"","ÌìÍõ°ïÖÚ£ºÄã²»ÊÇ±¾°ïµÜ×Ó£¬ÔõÃ´»ìµ½±¾°ï½ûµØÀ´µÄ£¿£¡")
end;

end;


function yes()
NewWorld(59, 1425, 3472)						--»ØÌìÍõµº
SetFightState(0)							--×ª»»Îª·ÇÕ½¶·×´Ì¬
end;


function yes1()
if (GetCash() >= 500) then						--²Î¿¼Öµ
	Pay(500)
	NewWorld(59, 1425, 3472)					--»ØÌìÍõµº
	SetFightState(0)						--×ª»»Îª·ÇÕ½¶·×´Ì¬
else
	Say("Kh«ng tiÒn mµ ®ßi ®i lung tung!", 0)		
end;
end;


function no()
end;
