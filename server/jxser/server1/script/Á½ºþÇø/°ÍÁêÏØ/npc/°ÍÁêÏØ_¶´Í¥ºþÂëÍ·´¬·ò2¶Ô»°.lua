--Á½ºþÇø °ÍÁêÏØ ¶´Í¥ºþÂëÍ·´¬·ò2¶Ô»°
-- Update: Dan_Deng(2003-08-21) ½µµÍ³ö´åµÈ¼¶ÒªÇóÎª5¼¶

function main(sel)
Say("C¶ ®êi ta ®Òu sèng víi s«ng n­íc! §éng §×nh hå kh«ng chç nµo ta kh«ng biÕt! Kh¸ch quan muèn ®i ®©u?", 2, "§i Thiªn V­¬ng ®¶o /yes", "Kh«ng ngåi/no");
end;

function yes()
if (GetLevel() >= 5) then						--µÈ¼¶´ïµ½Ê®¼¶
	if (GetFaction() == "tianwang") then				--Èç¹ûÍæ¼ÒÊÇÌìÍõ°ïµÜ×Ó£¬×ø´¬²»ÊÕÇ®
		Say("Huynh ®Ö cña Thiªn V­¬ng bang th× ®i thuyÒn miÔn phÝ!", 1, "Xin ®a t¹ /ok1")
	else	
		Say("N¬i ®ã hiÓm nguy l¾m! NÕu kh¸ch quan muèn ®i xin cho thªm Ýt tiÒn!", 1, "§­îc. /ok2")
	end
else		
	Talk(1,"","Xin lçi! Ng­¬i ch­a ®Õn cÊp 5, kh«ng ®ñ søc ngåi thuyÒn ®©u!")
end
end;

function no()
end;


function ok1()
NewWorld(59, 1425, 3472)
SetFightState(0)								--×ª»»Îª·ÇÕ½¶·×´Ì¬
end;


function ok2()
if (GetCash() >= 100) then							--²Î¿¼Öµ
	Pay(100)
	NewWorld(59, 1425, 3472)
	SetFightState(0)							--×ª»»Îª·ÇÕ½¶·×´Ì¬	
else
	Say("§­a ng­¬i ®i c«ng kh«ng vËy gia ®×nh ta chÕt ®ãi µ?", 0)		
end
end;
