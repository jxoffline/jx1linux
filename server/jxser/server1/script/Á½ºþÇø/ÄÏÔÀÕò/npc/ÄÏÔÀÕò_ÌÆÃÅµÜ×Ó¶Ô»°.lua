--Á½ºşÇø ÄÏÔÀÕò ÌÆÃÅµÜ×Ó¶Ô»°

function main(sel)
Talk(4, "select", "§­êng m«n hïng cø Xuyªn Thôc, ¸m khİ vµ háa khİ ®· lõng danh thiªn h¹. ", "Ng­êi trong giang hå nghe ®Õn §­êng m«n th¶y ®Òu biÕn s¾c, ®ñ thÊy sù lîi h¹i cña bæn m«n", "C¸i g× lµ 'Vâ l©m chİnh ®¹o, d©n téc ®¹i nghÜa'? Toµn lµ bän l¸o toĞt. Bæn m«n kh«ng ­a bän chİnh ®¹o, còng ch¼ng kÕt giao víi tµ ®¹o. ", "Muèn gia nhËp bæn m«n kh«ng ph¶i lµ chuyÖn ®¬n gi¶n!")
end;


function select()
Say("Cã muèn gia nhËp bæn ph¸i kh«ng?", 2, "Gia nhËp. /yes", "Kh«ng gia nhËp/no");
end;


function yes()
if (GetSeries() ~= 1) then								--Èç¹ûÍæ¼Ò²»ÊôÓÚÄ¾Ïµ
	Say("Ng­¬i kh«ng thuéc hÖ Méc, kh«ng thÓ gia nhËp bæn m«n!", 0)
else
	if (GetFaction() ~= "") then							--Èç¹ûÍæ¼ÒÒÑ¾­ÊôÓÚÄ¾ÏµµÄÄ³Ò»ÃÅÅÉ
		Say("Ch­a gia nhËp m«n ph¸i kh¸c míi cã thÓ gia nhËp bæn m«n", 0)
	else
		if (GetLevel() >= 10) then						--µÈ¼¶´ïµ½Ê®¼¶
			SetFaction("tangmen")      					--Íæ¼Ò¼ÓÈëÌÆÃÅ
			NewWorld(25, 3972, 5247)					--°ÑÍæ¼Ò´«ËÍµ½ÃÅÅÉÈë¿Ú
			SetFightState(1)						--Íæ¼Ò×ª»»³ÉÕ½¶·×´Ì¬
			SetRevPos(15)	 						--ÉèÖÃÖØÉúµã
			SetTask(2, 10)
			Say("Hoan Nghªnh b¹n gia nhËp §­êng M«n!",0)  
		else
			Say("C¨n b¶n cña ng­¬i cßn kĞm l¾m! H·y ®i luyÖn tËp thªm, bao giê ®Õn cÊp 10 l¹i ®Õn t×m ta!", 0)			
		end		
	end		
end
end;	

function no()
end;

