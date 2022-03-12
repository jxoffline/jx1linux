--Á½ºşÇø ÄÏÔÀÕò ÌìÈÌ½ÌÍ½¶Ô»°

function main(sel)
Talk(2, "select", "Gi¸o chñ cña bæn gi¸o lµ Hoµn Nhan Hïng LiÖt. Danh chÊn thiªn h¹! Hoµng ®Õ Kim quèc còng ph¶i nh­êng 3 phÇn", "Cao thñ cña bæn gi¸o nhiÒu v« sè! Nh©n tµi ngäa hæ tµng long")
end;

function select()
Say("Cã muèn gia nhËp bæn gi¸o kh«ng?", 2, "Gia nhËp. /yes", "Kh«ng gia nhËp/no");
end;


function yes()
if (GetSeries() ~= 3) then								--Èç¹ûÍæ¼Ò²»ÊôÓÚ»ğÏµ
	Say("Ng­¬i kh«ng thuéc hÖ Háa, kh«ng thÓ gia nhËp bæn gi¸o!", 0)
else
	if (GetFaction() ~= "") then							--Èç¹ûÍæ¼ÒÒÑ¾­ÊôÓÚ»ğÏµµÄÄ³Ò»ÃÅÅÉ
		Say("Ch­a gia nhËp m«n ph¸i kh¸c míi cã thÓ gia nhËp bæn gi¸o", 0)
	else
		if (GetLevel() >= 10) then						--µÈ¼¶´ïµ½Ê®¼¶
			SetFaction("tianren")      					--Íæ¼Ò¼ÓÈëÌìÈÌ½Ì
			--NewWorld(45, x, y)						--°ÑÍæ¼Ò´«ËÍµ½ÃÅÅÉÈë¿Ú
			--SetFightState(1)						--Íæ¼Ò×ª»»³ÉÕ½¶·×´Ì¬
			--SetRevPos(ID)	 						--ÉèÖÃÖØÉúµã
			--SetTask(4, 10)
			Say("Hoan Nghªnh b¹n gia nhËp Thiªn NhÉn gi¸o! ",0)  
		else
			Say("§Ö tö bæn gi¸o toµn lµ anh hïng xuÊt chóng. KĞm câi nh­ ng­¬i kh«ng xøng ®¸ng vµo bæn gi¸o!", 0)
		end		
	end	
end
end;	

function no()
end;

