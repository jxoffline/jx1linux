-- ËÎ½ğÕ½Ú¯Êé ÓÃÀ´°ÑÍæ¼Ò´«ËÍµ½ËÎ½ğÕ½±¨Ãûµã  ĞèÒª¼ÓÏŞÖÆ£ºËÎ½ğÕ½³¡ÄÚ£¨°üÀ¨µ¥ÌõµØÍ¼£©²»ÄÜÊ¹ÓÃ
-- Liu Kuo
-- 2004.12.13
Include("\\script\\battles\\battlehead.lua");
Include("\\script\\battles\\battleinfo.lua");


function main()
	W,X,Y = GetWorldPos();

	local nSongNumber = 60; -- ËÎ·½ÈËÊı
	local nJinNumber = 70;  -- ½ğ·½ÈËÊı
	local nMapId = W;
	tbFORBIDDEN_MAP = { 197, 208, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219, 220, 221, 222, 223, 334, 335, 356, 337, 338,339,387,388,389,390,391,392,393,394,395,396,397,398,399,400,401,402,403,404,405,406,407,408,409,410,411,412,413,414,415,416,417,418,419,420,421,422,423,424,425,426,427,428,429,430,431,432,433,434,435,436,437,438,439,440,441,442,443,444,445,446,447,448,449,450,451,452,453,454,455,456,457,458,459,460,461,462,463,520,521,522,523,524,525,526,527,528,529,530,531,532,533,534,535,536,537,538,825,826};	-- ½ûÓÃÌØÊâµØÍ¼
	tbCD_MAP = {516, 517, 580, 581}	--·é»ğÁ¬³ÇÊØ³ÇµØÍ¼
	for j = 1, getn(tbFORBIDDEN_MAP) do
		if ( nMapId == tbFORBIDDEN_MAP[j] ) then
			Msg2Player("Lóc nµy b¹n kh«ng thÓ sö dông vËt phÈm nµy");
			return 1;
		end
	end		
	for i = 1, getn(tbBATTLEMAP) do 
		if ( nMapId == tbBATTLEMAP[i] ) then
			Msg2Player("Lóc nµy b¹n kh«ng thÓ sö dông vËt phÈm nµy");
			return 1;
		end
	end
	if (nMapId >= 464 and nMapId <= 511) then
		Msg2Player("Lóc nµy b¹n kh«ng thÓ sö dông vËt phÈm nµy");
		return 1
	end
	--[DinhHQ]
	--20110407: kh«ng cho sö dông tèng kim chiªu th­ khi ®ang v­ît ¶i 30
	if (nMapId == 957) then
		Msg2Player("Lóc nµy b¹n kh«ng thÓ sö dông vËt phÈm nµy");
		return 1
	end
	if ( nMapId >= 235 and nMapId <= 318 ) then
		Msg2Player("Lóc nµy b¹n kh«ng thÓ sö dông vËt phÈm nµy");
		return 1;
	end
	for j = 1, getn(tbCD_MAP) do
		if ( nMapId == tbCD_MAP[j] ) then
			Msg2Player("Lóc nµy b¹n kh«ng thÓ sö dông vËt phÈm nµy");
			return 1;
		end
	end	
	if ( nMapId >= 540 and nMapId <= 583 ) then
		Msg2Player("Lóc nµy b¹n kh«ng thÓ sö dông vËt phÈm nµy");
		return 1;
	end
	if (nMapId >= 605 and nMapId <= 613) then	--ÎäÁÖµÚÒ»°ïµØÍ¼
		Msg2Player("Lóc nµy b¹n kh«ng thÓ sö dông vËt phÈm nµy");
		return 1;
	end
	
	if (nMapId == 162) then	--ÎäÁÖµÚÒ»°ïµØÍ¼
		Say("HiÖn t¹i c¸c h¹ ®ang ë thµnh §¹i Lı, cã thÓ ®Õn c¸c ®Şa ®iÓm sau ®Ó b¸o danh:\nPhe Vµng (T): täa ®é <color=red>201/203<color>\nPhe Tİm (K): täa ®é <color=red>195/204<color>", 1, "§ãng/onCancel")
		return 1;
	end
	
	Say ( "<#> <color=red>Chiªu th­<color><enter><enter><color><enter><enter>   sè ng­êi chiÕm thÕ m¹nh tuy trªn chiÕn tr­êng cã 1 vµi ­u thÕ nh­ng ®iÓm tİch lòy nhËn ®­îc<enter> cã thÓ t­¬ng ®èi İt, b¹n muèn ®Õn ®iÓm b¸o danh cña phe nµo?", 
			4, "\tVµo ®iÓm b¸o danh phe Vµng (T) /ToSong", 
			"\tVµo ®iÓm b¸o danh phe Tİm (K) /ToJin", 
			" Ta lµ ®µo binh.../Cancel" );
	-- ¿Õ¸ñ²»Òª¸ÄÁË£¬ÎªÁË¾ÓÖĞÏÔÊ¾
	return 1;

end

function ToSong()	-- ½øÈëËÎ·½±¨Ãûµã	
	if ( GetLevel() < 120 ) then
		Talk( 1, "", "Phong V©n LuËn KiÕm gian khæ khèc liÖt, ng­¬i ch­a ®¹t ®Õn cÊp 120 h·y vÒ luyÖn thªm råi h·y tİnh." );
		return
	end
	if ( GetLevel() < 40 ) then
		Talk( 1, "", "ChiÕn tr­êng Tèng Kim gian khæ khèc liÖt, ng­¬i ch­a ®¹t ®Õn cÊp 40 h·y vÒ luyÖn thªm råi h·y tİnh." );
	elseif ( GetLevel() >= 40 and GetLevel() < 80 ) then
		if (DelCommonItem( 6, 1, 155, 1, 0, 0) == 1) then
			NewWorld( 323, 1541, 3178);
			DisabledUseTownP(0); -- ²»ÏŞÖÆÆäÊ¹ÓÃ»Ø³Ç·û
			Msg2Player( "§Õn n¬i b¸o danh ChiÕn Tr­êng Tèng Kim S¬ CÊp" );
		end
	elseif ( GetLevel() >= 80 and GetLevel() < 120 ) then
		if (DelCommonItem( 6, 1, 155, 1, 0, 0) == 1) then
			NewWorld( 324, 1541, 3178);
			DisabledUseTownP(0); -- ²»ÏŞÖÆÆäÊ¹ÓÃ»Ø³Ç·û
			Msg2Player( "§Õn n¬i b¸o danh ChiÕn Tr­êng Tèng Kim Trung CÊp" );
		end
	else
		if (DelCommonItem( 6, 1, 155, 1, 0, 0) == 1) then
			NewWorld( 162,1608,3254);
			DisabledUseTownP(0); -- ²»ÏŞÖÆÆäÊ¹ÓÃ»Ø³Ç·û
			Msg2Player( "§· ®Õn thµnh §¹i Lı" );
		end
	end
end

function ToJin()	-- ½øÈë½ğ·½±¨Ãûµã
	if ( GetLevel() < 120 ) then
		Talk( 1, "", "Phong V©n LuËn KiÕm gian khæ khèc liÖt, ng­¬i ch­a ®¹t ®Õn cÊp 120 h·y vÒ luyÖn thªm råi h·y tİnh." );
		return
	end
	if ( GetLevel() < 40 ) then
		Talk( 1, "", "ChiÕn tr­êng Tèng Kim gian khæ khèc liÖt, ng­¬i ch­a ®¹t ®Õn cÊp 40 h·y vÒ luyÖn thªm råi h·y tİnh." );
	elseif ( GetLevel() >= 40 and GetLevel() < 80 ) then
		if (DelCommonItem( 6, 1, 155, 1, 0, 0) == 1) then
			NewWorld( 323, 1570, 3085);
			DisabledUseTownP(0); -- ²»ÏŞÖÆÆäÊ¹ÓÃ»Ø³Ç·û
			Msg2Player( "§Õn n¬i b¸o danh ChiÕn Tr­êng Tèng Kim S¬ CÊp" );
		end
	elseif ( GetLevel() >= 80 and GetLevel() < 120 ) then
		if (DelCommonItem( 6, 1, 155, 1, 0, 0) == 1) then
			NewWorld( 324, 1570, 3085);
			DisabledUseTownP(0); -- ²»ÏŞÖÆÆäÊ¹ÓÃ»Ø³Ç·û
			Msg2Player( "§Õn n¬i b¸o danh ChiÕn Tr­êng Tèng Kim Trung CÊp" );
		end
	else
		if (DelCommonItem( 6, 1, 155, 1, 0, 0) == 1) then
			NewWorld( 162,1566,3277);
			DisabledUseTownP(0); -- ²»ÏŞÖÆÆäÊ¹ÓÃ»Ø³Ç·û
			Msg2Player( "§· ®Õn thµnh §¹i Lı" );
		end
	end
end


function Cancel()
end