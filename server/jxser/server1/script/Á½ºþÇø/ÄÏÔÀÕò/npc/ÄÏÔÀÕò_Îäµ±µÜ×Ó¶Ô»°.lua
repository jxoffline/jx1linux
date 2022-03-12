--Á½ºşÇø ÄÏÔÀÕò Îäµ±µÜ×Ó¶Ô»°

function main(sel)
Talk(3, "select", "Thiªn h¹ vâ häc, 'B¾c t«n ThiÕu l©m, nam sïng Vâ §ang'. Ch¾c ng­¬i ®· tõng nghe qua?", "Vâ c«ng bæn ph¸i lÊy tÜnh chÕ ®éng, lÊy nhu kh¾c c­¬ng, lÊy ng¾n th¾ng dµi, lÊy chËm ®¸nh nhanh, lÊy ı vËn khİ, lÊy khİ vËn th©n, ®¸nh sau tíi tr­íc. Khiªm tèn ®iÒm ®¹m, lÊy v« h×nh th¾ng h÷u h×nh, ®ã lµ c¶nh giíi vâ häc tèi cao!", "Vâ nghÖ bæn m«n cã 'ngò bÊt truyÒn': yÕu ®uèi, hiÓm ®éc, h¸o th¾ng, cuång töu, gian d©m sÏ kh«ng truyÒn vâ c«ng")
end;


function select()
Say("Cã muèn gia nhËp bæn m«n kh«ng?", 2, "Gia nhËp. /yes", "Kh«ng gia nhËp/no");
end;


function yes()
if (GetSeries() ~= 4) then								--Èç¹ûÍæ¼Ò²»ÊôÓÚÍÁÏµ
	Say("Ng­¬i kh«ng thuéc hÖ Thæ, kh«ng thÓ gia nhËp bæn m«n!", 0)
else
	if (GetFaction() ~= "") then							--Èç¹ûÍæ¼ÒÒÑ¾­ÊôÓÚÍÁÏµµÄÄ³Ò»ÃÅÅÉ
		Say("Ch­a gia nhËp m«n ph¸i kh¸c míi cã thÓ gia nhËp bæn m«n", 0)
	else
		if (GetLevel() >= 10) then						--µÈ¼¶´ïµ½Ê®¼¶
			SetFaction("wudang")      					--Íæ¼Ò¼ÓÈëÎäµ±
			--NewWorld(mapID, x, y)						--°ÑÍæ¼Ò´«ËÍµ½ÃÅÅÉÈë¿Ú
			--SetFightState(1)						--Íæ¼Ò×ª»»³ÉÕ½¶·×´Ì¬
			--SetRevPos(ID)	 						--ÉèÖÃÖØÉúµã
			--SetTask(5, 10)
			Say("Hoan Nghªnh b¹n gia nhËp Vâ §ang ph¸i! ",0)  
		else
			Say("§Ö tö bæn m«n toµn lµ anh hïng xuÊt chóng. KĞm câi nh­ ng­¬i kh«ng xøng ®¸ng vµo bæn m«n!", 0)
		end		
	end	
end
end;	

function no()
end;

