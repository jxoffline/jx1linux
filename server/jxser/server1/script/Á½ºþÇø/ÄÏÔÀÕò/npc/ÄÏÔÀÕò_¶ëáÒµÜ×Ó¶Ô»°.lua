--Á½ºşÇø ÄÏÔÀÕò ¶ëáÒµÜ×Ó¶Ô»°

function main(sel)
Talk(4, "select", "Trong thiªn h¹ c¸c m«n ph¸i do n÷ nhi s¸ng lËp th× bæn m«n ®øng ®Çu!", "§Ö tö bæn m«n kh«ng nh÷ng vâ nghÖ cao c­êng, cÇm k× th­ häa ®Òu tinh th«ng! ", "Ai nãi giang hå lµ thÕ giíi cña nam nh©n th× cø nh×n bæn ph¸i mµ lµm g­¬ng", "Bæn ph¸i chØ nhËn ®Ö tö n÷.")
end;

function select()
Say("Cã muèn gia nhËp bæn ph¸i kh«ng?", 2, "Gia nhËp. /yes", "Kh«ng gia nhËp/no");
end;


function yes()
if (GetSeries() ~= 2) then								--Èç¹ûÍæ¼Ò²»ÊôÓÚË®Ïµ
	Say("Ng­¬i kh«ng thuéc hÖ Thñy, kh«ng thÓ gia nhËp bæn m«n!", 0)
else
	if (GetFaction() ~= "") then							--Èç¹ûÍæ¼ÒÒÑ¾­ÊôÓÚË®ÏµµÄÄ³Ò»ÃÅÅÉ
		Say("ChØ cÇn ch­a gia nhËp m«n ph¸i kh¸c lµ cã thÓ gia nhËp bæn m«n!", 0)
	else	
		if (GetLevel() >= 10) then						--µÈ¼¶´ïµ½Ê®¼¶
			if ( GetSex() == 0 ) then     					--Èç¹ûÍæ¼ÒĞÔ±ğÎªÄĞ
				Say("Bæn ph¸i chØ nhËn ®Ö tö n÷.", 0)
			else								--Íæ¼ÒĞÔ±ğÎªÅ®
    				SetFaction("emei")       				--Íæ¼Ò¼ÓÈë¶ëáÒÅÉ
    				NewWorld(13, 1867, 5021)				--°ÑÍæ¼Ò´«ËÍµ½ÃÅÅÉÈë¿Ú	
				SetFightState(1)					--Íæ¼Ò×ª»»³ÉÕ½¶·×´Ì¬
    				SetRevPos(13)		  				--ÉèÖÃÖØÉúµã
    				SetTask(1, 10)
    				Say("Hoan Nghªnh b¹n gia nhËp Nga Mi ph¸i! ",0)  
			end
		else
			Say("C¨n b¶n cña ng­¬i cßn kĞm l¾m! H·y ®i luyÖn tËp thªm, bao giê ®Õn cÊp 10 l¹i ®Õn t×m ta!", 0)	
		end
	end
end;			
end;

function no()
end;


