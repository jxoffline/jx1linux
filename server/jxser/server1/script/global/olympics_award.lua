GLBID_GOLD_COUNT = 3;					--È«¾Ö±äÁ¿ID of ÉÏÒ»Ê±¶ÎÖĞ¹ú¶Ó»ñµÃµÄ½ğÅÆÊı
GLBID_SILVER_COUNT = 4;					--È«¾Ö±äÁ¿ID of ÉÏÒ»Ê±¶ÎÖĞ¹ú¶Ó»ñµÃµÄÒøÅÆÊı
GLBID_BRONZE_COUNT = 5;					--È«¾Ö±äÁ¿ID of ÉÏÒ»Ê±¶ÎÖĞ¹ú¶Ó»ñµÃµÄÒøÅÆÊı
EXTPOINT_LAST_AWARD_DATETIME = 6;		--À©Õ¹µãID of Íæ¼ÒÉÏ´ÎÁìÈ¡ÀñÆ·µÄÊ±¼ä

--Áì½±Ê±¼ä¶Î ( { ÆğÊ¼Ê±¼ä£¬ ½áÊøÊ±¼ä } Ê±¼ä¸ñÊ½ÎªHHMM )
aryAwardTime = { { 1000, 1400 }, { 1900, 2000 }, { 2300, 2400 } };

--"È«¾Ö±äÁ¿ID of ½±ÅÆÊı"µÄÊı×é
arynMedalCountGlbID = { GLBID_GOLD_COUNT, GLBID_SILVER_COUNT, GLBID_BRONZE_COUNT };

--½±Æ·Êı×é
aryAwardItem = {{ "Tiªn Th¶o Lé ", {6,1,71,1,0,0,0} },	--½ğÅÆ½±Æ·
				{ "B¹ch C©u hoµn", {6,1,74,1,0,0,0} },	--ÒøÅÆ½±Æ·
				{ "Ph¸o Hoa", {6,0,11,1,0,0,0} }};	--Í­ÅÆ½±Æ·
				
--°ÂÔËËÍÀñ	·µ»ØÖµ£¨3¸ö£© ½ğÅÆÊı£¬ÒøÅÆÊı£¬Í­ÅÆÊı£» Èô½ğÅÆÊıÎª¸ºÊı -1:Î´³ä¿¨  -2:µ±Ç°²»ÊÇÁì½±Ê±¼ä  -3:ÒÑÁì¹ı½±
function olympics_Award()
	--Î´³ä¿¨
	if( IsCharged() ~= 1 ) then
		return -1;
	end
	
	local nCurrTime = tonumber( date( "%H%M" ) );
	local nAwardTimeCount = getn( aryAwardTime );
	local nCurrTimeIndex = -1;
	
	for i = 1, nAwardTimeCount do
		if( aryAwardTime[i][1] <= nCurrTime and nCurrTime < aryAwardTime[i][2] ) then
			nCurrTimeIndex = i;
			break;
		end
	end
	
	--µ±Ç°²»ÊÇÁì½±Ê±¼ä
	if( nCurrTimeIndex == -1 ) then
		return -2;
	end	
	
	local nCurrAwardDateTime = tonumber( date( "%m%d" )..nCurrTimeIndex );
	local nLastAwardDateTime = GetExtPoint( EXTPOINT_LAST_AWARD_DATETIME );
	
	if( nCurrAwardDateTime == nLastAwardDateTime ) then
		--ÒÑÁì¹ı½±
		return -3;
	else
		local nMedalRankCount = getn( arynMedalCountGlbID );
		local arynMedalCount = {};
		
		for i = 1, nMedalRankCount do
			arynMedalCount[i] = GetGlbValue( arynMedalCountGlbID[i] );
			for j =1, arynMedalCount[i] do
				AddItem( aryAwardItem[i][2][1], aryAwardItem[i][2][2], aryAwardItem[i][2][3], aryAwardItem[i][2][4], aryAwardItem[i][2][5], aryAwardItem[i][2][6] , aryAwardItem[i][2][7]);
			end
			if( arynMedalCount[i] > 0 ) then
				Msg2Player( "B¹n ®¹t ®­îc"..arynMedalCount[i].."c¸i"..aryAwardItem[i][1] );
			end
		end		
		
		--ÉèÖÃÁì½±±êÖ¾
		if( nCurrAwardDateTime > nLastAwardDateTime and ( arynMedalCount[1] > 0 or arynMedalCount[2] > 0 or arynMedalCount[3] > 0 ) ) then
			AddExtPoint( EXTPOINT_LAST_AWARD_DATETIME, nCurrAwardDateTime - nLastAwardDateTime );
		else
			PayExtPoint( EXTPOINT_LAST_AWARD_DATETIME, nLastAwardDateTime - nCurrAwardDateTime );
		end
				
		return arynMedalCount[1], arynMedalCount[2], arynMedalCount[3];
	end	
end

--ÅĞ¶ÏÍæ¼ÒÊÇ·ñ³ä¹ı¿¨
function IsCharged()
	if( GetExtPoint( 0 ) >= 1 ) then
		return 1;
	else
		return 0;
	end
end