-- ÄÚÆÕÍè¡¢ÄÚ¶¾Íè¡¢ÄÚ±ùÍè¡¢ÄÚ»ğÍè¡¢ÄÚµçÍè¹²ÓĞº¯Êı
-- ÎåÖÖÍèÈç¹ûÖØ¸´³Ô£¬Ö®Ç°³Ô¹ıµÄÍèµÄ¹¦Ğ§½«ÏûÊ§£¬Ö»±£Áô×îºó³ÔµÄÍèµÄ¹¦Ğ§
-- Fanghao_Wu 2004.9.13

aryWan = {	{"<#> Néi Phæ hoµn", 453},
			{"<#> Néi §éc hoµn", 454},
			{"<#> Néi B¨ng hoµn", 455},
			{"<#> Néi Háa hoµn", 456},
			{"<#> Néi §iÖn hoµn", 457} };
			
function EatNei_Wan( eatIndex, level, statetype, time )
	local nCount = getn( aryWan );
	for i = 1, nCount do
		if( i ~= eatIndex ) then
			local nLeftTime = AddSkillState( aryWan[i][2], 1, 1, 0 );
			if( nLeftTime > 0 ) then
				Msg2Player( aryWan[i][1].."<#> HÕt c«ng hiÖu" );
			end
		end
	end
	AddSkillState( aryWan[eatIndex][2], level, statetype, time );
	Msg2Player( "<#> B¹n ®· sö dông"..aryWan[eatIndex][1] );
end