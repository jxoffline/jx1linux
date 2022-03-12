--Á½ºşÇø ÄÏÔÀÕò ÌìÍõ°ïÖÚ¶Ô»°

function main(sel)
Talk(3, "select", "Bang chñ D­¬ng Anh vâ nghÖ cao c­êng, gan d¹ h¬n ng­êi, kh«ng kĞm g× tu mi nam tö!", "Bæn m«n quy luËt uy nghiªm, ng­êi ®«ng thÕ m¹nh! Kh«ng ai trong thiªn h¹ d¸m coi khinh!", "Bæn bang võa chèng Kim võa kh¸ng Tèng! Huynh ®Ö ®Òu xuÊt th©n lµ d©n nghÌo, phiªu b¹t giang hå lµ v× kÕ sinh nhai! Ai lµm vua bän ta ch¶ cÇn quan t©m")
end;

function select()
Say("Cã muèn gia nhËp bæn gi¸o kh«ng?", 2, "Gia nhËp. /yes", "Kh«ng gia nhËp/no");
end;


function yes()
if (GetSeries() ~= 0) then								--Èç¹ûÍæ¼Ò²»ÊôÓÚ½ğÏµ
	Say("§Ö tö bæn bang toµn lµ anh hïng xuÊt chóng. KĞm câi nh­ ng­¬i kh«ng xøng ®¸ng vµo bæn bang!", 0)
else
	if (GetFaction() ~= "") then							--Èç¹ûÍæ¼ÒÒÑ¾­ÊôÓÚ½ğÏµµÄÄ³Ò»ÃÅÅÉ
		Say("Ch­a gia nhËp m«n ph¸i kh¸c míi cã thÓ gia nhËp bæn bang", 0)
	else	
		if (GetLevel() >= 10) then						--µÈ¼¶´ïµ½Ê®¼¶
			if ( GetSex() == 1 ) then 					--Èç¹ûÍæ¼ÒĞÔ±ğÎªÅ®
				Say("Thiªn V­¬ng bang luyÖn tËp cùc khæ, yÕu ®uèi nh­ c« n­¬ng kh«ng thİch hîp ®©u!", 0)
			else								-- Íæ¼ÒĞÔ±ğÎªÄĞ
    				SetFaction("tianwang")       				--Íæ¼Ò¼ÓÈëÌìÍõ°ï
    				--NewWorld(59, 1425, 3472)				--°ÑÍæ¼Ò´«ËÍµ½ÃÅÅÉÈë¿Ú
				--SetFightState(1)					--Íæ¼Ò×ª»»³ÉÕ½¶·×´Ì¬	
    				--SetRevPos(21)		  				--ÉèÖÃÖØÉúµã
    				--SetTask(3, 10)
    				Say("Hoan Nghªnh b¹n gia nhËp Thiªn V­¬ng bang! ",0)  
			end
		else
			Say("C¨n b¶n cña ng­¬i cßn kĞm l¾m! H·y ®i luyÖn tËp thªm, bao giê ®Õn cÊp 10 l¹i ®Õn t×m ta!", 0)	
		end
	end
end;			
end;


