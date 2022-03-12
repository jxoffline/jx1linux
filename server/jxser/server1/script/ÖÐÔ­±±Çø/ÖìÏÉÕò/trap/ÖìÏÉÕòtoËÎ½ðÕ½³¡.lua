--ÖĞÔ­±±Çø ÖìÏÉÕòtoËÎ½ğÕ½³¡
--TrapID£ºÖĞÔ­±±Çø 57
-- Update: Dan_Deng(2003-08-21) ½µµÍ³ö´åµÈ¼¶ÒªÇóÎª5¼¶
Include("\\script\\battles\\battlehead.lua")

function main(sel)
	if ( GetLevel() < 40 ) then
		Talk( 1, "", "ChiÕn tr­êng Tèng Kim gian khæ khèc liÖt, ng­¬i ch­a ®¹t ®Õn cÊp 40 h·y vÒ luyÖn thªm råi h·y tİnh." );
	elseif ( GetLevel() >= 40 and GetLevel() < 80 ) then
		NewWorld( 323, 1570, 3085);
		SetFightState(0);
		Msg2Player( "§Õn n¬i b¸o danh ChiÕn Tr­êng Tèng Kim S¬ CÊp" );
	elseif ( GetLevel() >= 80 and GetLevel() < 120 ) then
		NewWorld( 324, 1570, 3085);
		SetFightState(0);
		Msg2Player( "§Õn n¬i b¸o danh ChiÕn Tr­êng Tèng Kim Trung CÊp" );
	else
		NewWorld( 325, 1570, 3085);
		SetFightState(0);
		Msg2Player( "§Õn n¬i b¸o danh ChiÕn Tr­êng Tèng Kim Cao CÊp" );
	end
end
