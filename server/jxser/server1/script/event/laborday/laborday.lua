--5.1ÀÍ¶¯½Ú»î¶¯½Å±¾
--By LiuKuo 2005.4.20
IncludeLib("NPCINFO")

BOSSLASTDATE = tonumber(date("%d")) --ÉÏÒ»´Î»Æ½ğBoss±»ÕÙ»½µÄÈÕÆÚ Ö»¼ÇÂ¼Ìì
BOSSMAXCOUNT = 3	--Ã¿Ììµ¥·ş¿ÉÒÔÕÙ³öµÄ»Æ½ğBossµÄ×î´óÊı£¬Ã¿Ì¨gameserverµÄÉÏÏŞ£¬¹²24¸ö
BOSSNOWCOUNT = 0 --µ±Ç°ÕÙ»½µÄ»Æ½ğBossÊı

--ÒÔÏÂµØÍ¼½ûÓÃ
ForbiddenMap = {44, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219, 220, 221, 222, 223, 326, 327, 328, 329, 330, 331, 334, 335, 337, 338, 339, 344, 345, 346, 347, 348, 349, 350, 351, 352, 353, 354, 355, 356, 357, 358, 359, 360, 361, 362, 363, 364, 365, 366, 367, 368, 369, 370, 371, 372, 373, 374}

--»Æ½ğBoss	{ID,Name,Series}
GoldenBoss = {{562, "§¹o Thanh Ch©n Nh©n", 4},
			  {563, "Gia LuËt TŞ Ly", 3},
			  {564, "Hoµn Nhan TuyÕt Y", 3},
			  {565, "§oan Méc DuÖ ", 3},
			  {566, "Cæ B¸ch", 0},
			  {567, "Chung Linh Tó ", 2},
			  {568, "Hµ Linh Phiªu", 2},
			  {582, "Lam Y Y", 1},
			  {583, "M¹nh Th­¬ng L­¬ng", 3},
			  {739, "V­¬ng T¸ ", 0},
			  {740, "HuyÒn Gi¸c §¹i S­ ", 0},
			  {741, "§­êng BÊt NhiÔm", 1},
			  {742, "B¹ch Doanh Doanh", 1},
			  {743, "Thanh HiÓu S­ Th¸i ", 2},
			  {744, "Yªn HiÓu Tr¸i", 2},
			  {745, "Hµ Nh©n Ng· ", 3},
			  {746, "§¬n T­ Nam", 4},
			  {747, "TuyÒn C¬ Tö ", 4},
			  {748, "Hµn M«ng", 1},
			  {751, "§¹i M· Hæ ", 0}}

--´óÂí»¢Boss {ID,Name,Series}
DamahuBoss = {{751, "§¹i M· Hæ ", 0},
			  {752, "§¹i M· Hæ ", 0},
			  {753, "§¹i M· Hæ ", 1},
			  {754, "§¹i M· Hæ ", 1},
			  {755, "§¹i M· Hæ ", 2},
			  {756, "§¹i M· Hæ ", 2},
			  {757, "§¹i M· Hæ ", 3},
			  {758, "§¹i M· Hæ ", 3},
			  {759, "§¹i M· Hæ ", 4},
			  {760, "§¹i M· Hæ ", 4}}
			  
--Ğ¡Boss	{ID,Name}
NormalBoss = {{511, "Tr­¬ng T«ng Chİnh"},
			  {513, "DiÖu Nh­ "},
			  {523, "LiÔu Thanh Thanh"},
			  {725, "Thñy tÆc ®Çu lÜnh"}}
			  
--É±ÊÖÈÎÎñBoss	{ID,Name,Ãæ¾ß±àºÅ}
MiniBoss = {{851, "Bé Hiªu TrÇn", 79},
			{852, "KiÒu §Ønh Thiªn", 80},
			{853, "§iªu DŞch §ao", 81},
			{854, "T©y M«n V« Giíi", 82},
			{855, "HËu  KhÊt KiÕm", 83},
			{856, "øng  Tiªu Phong", 84},
			{857, "Viªn NiÖm TŞch", 85},
			{858, "Trö Thiªn MÉn", 86}}

--À¶¹Önpc	{ID,Name}	Í¬Ò»ĞĞ²»Í¬µÄid¶ÔÓ¦²»Í¬µÈ¼¶À¶¹ÖµÄdroprate
GoldenNpc = {{859, 859, 859, 859, 860, 861, 862, 863, "B¹ch hæ "},
			 {864, 864, 864, 864, 865, 866, 867, 868, "H¾c DiÖp HÇu "},
			 {869, 869, 869, 869, 870, 871, 872, 873, "S¬n TÆc "},
			 {874, 874, 874, 874, 875, 876, 877, 878, "Thñy TÆc "},
			 {879, 879, 879, 879, 880, 881, 882, 883, "Phi Sa "},
			 {884, 884, 884, 884, 885, 886, 887, 888, "L·nh Th­¬ng"},
			 {889, 889, 889, 889, 890, 891, 892, 893, "Ng©n Nha "},
			 {894, 894, 894, 894, 895, 896, 897, 898, "Thõa Phong"},
			 {899, 899, 899, 899, 900, 901, 902, 903, "M«ng Cæ Vâ sÜ "},
			 {904, 904, 904, 904, 905, 906, 907, 908, "S­¬ng §ao"}}
			 
--ÆÕÍ¨npc	{ID,Name}
NormalNpc = {{2, "B¹ch hæ "},
			 {37, "H¾c DiÖp HÇu "},
			 {169, "S¬n TÆc "},
			 {674, "Thñy TÆc "},
			 {703, "Phi Sa "},
			 {708, "L·nh Th­¬ng"},
			 {589, "Ng©n Nha "},
			 {713, "Thõa Phong"},
			 {673, "M«ng Cæ Vâ sÜ "},
			 {598, "S­¬ng §ao"}}

function CallBoss( Level, Series )
	local W,X,Y = GetWorldPos();
	local nMapId = W;
	if ( GetFightState() == 0 ) then	--·ÇÕ½¶·Çø½ûÓÃ
		Msg2Player("Kh«ng ë trong tr¹ng th¸i chiÕn ®Êu th× kh«ng thÓ sö dông");
		return 1
	end
	for i = 249, 318 do	--Ï´ËèµºÉ½¶´
		if ( i == nMapId ) then
			Msg2Player("N¬i ®©y kh«ng thÓ sö dông vËt phÈm nµy ");
			return 1
		end
	end	
	for i = 375, 415 do	--ĞÂÔöËÎ½ğÕ½³¡µØÍ¼ ËÍĞÅÈÎÎñµØÍ¼ ±ÈÎä´ó»áµØÍ¼
		if ( i == nMapId ) then
			Msg2Player("N¬i ®©y kh«ng thÓ sö dông vËt phÈm nµy ");
			return 1
		end
	end	
	for i = 1, getn( ForbiddenMap ) do		--ÌØÊâµØÍ¼½ûÓÃ
		if( ForbiddenMap[i] == nMapId ) then
			Msg2Player("N¬i ®©y kh«ng thÓ sö dông vËt phÈm nµy ");
			return 1
		end
	end
	local nNowDate = tonumber(date("%d"));
	
	if ( nNowDate == BOSSLASTDATE ) then	--Èç¹ûÉÏ´ÎÕÙ»½ÈÕÆÚÊÇµ±ÌìµÄ»°
		if ( BOSSNOWCOUNT >= BOSSMAXCOUNT ) then	--´óÓÚÕÙ»½×î´óÊıÔò²»ÄÜÔÙÕÙ»½»Æ½ğBoss
			print("Sè Boss Hoµng Kim b¹n gäi ®· qu¸ giíi h¹n.")
			nBossRate =  random( 101, 10000);
		else
			nBossRate = random( 1, 10000);
		end
	else	--Èç¹ûÉÏ´ÎÕÙ»½ÈÕÆÚÓëµ±Ç°²»ÊÇÍ¬Ò»Ìì
		BOSSLASTDATE = nNowDate;	--¸üĞÂ×î½üµÄÈÕÆÚ
		BOSSNOWCOUNT = 0;	--µ±Ç°ÕÙ»½ÊıÖÃ0
		nBossRate = random( 1, 10000);
	end
	
	if( Level < 90 ) then
		nBossRate =  random( 101, 10000);
	end
	
	if( nBossRate <= 100 ) then		--ÕÙ»½»Æ½ğBoss
		local i = random( 1, getn(GoldenBoss));
		local GoldenBossId = GoldenBoss[i][1];
		local GoldenBossName = GoldenBoss[i][2];
		local GoldenBossSeries = GoldenBoss[i][3];
		if( GoldenBossId == 748 ) then	--º«ÃÉÎåĞĞËæ»ú
			GoldenBossSeries = random( 0, 4);
		end
		if( GoldenBossId == 751 ) then	--Ëæ»ú´óÂí»¢
			i = random( 1, getn(DamahuBoss));
			GoldenBossId = DamahuBoss[i][1];
			GoldenBossName = DamahuBoss[i][2];
			GoldenBossSeries = DamahuBoss[i][3];
		end
		AddNpcEx( GoldenBossId, 95, GoldenBossSeries, SubWorldID2Idx(W), X * 32, (Y +  5)* 32, 1, GoldenBossName, 1 );
		BOSSNOWCOUNT = BOSSNOWCOUNT + 1;	--µ±Ç°ÕÙ»½µÄ»Æ½ğBossÊı¼Ó1
		WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."] gäi Boss Hoµng Kim:"..GoldenBossName);
		Msg2Player("B¹n gäi Boss Hoµng Kim:"..GoldenBossName);
	elseif ( nBossRate > 100 and nBossRate <= 300 ) then	--ÕÙ»½Ğ¡Boss
		local i = random( 1, getn(NormalBoss));
		local NormalBossId = NormalBoss[i][1];
		local NormalBossName = NormalBoss[i][2];
		AddNpcEx( NormalBossId, 95, Series, SubWorldID2Idx(W), X * 32, (Y +  5) * 32, 1, NormalBossName, 1 );
		WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."] Gäi mét tiÓu boss:"..NormalBossName);
		Msg2Player("B¹n gäi mét tiÓu Boss:"..NormalBossName);
	elseif ( nBossRate > 300 and nBossRate <= 3000 ) then	--ÕÙ»½É±ÊÖBoss
		local i = floor( Level - 20 ) / 10 + 1;	--¸ù¾İÉ±ÊÖïµµÄµÈ¼¶Ñ¡ÔñÕÙ»½µÄÉ±ÊÖBoss
		local MiniBossId = MiniBoss[i][1];
		local MiniBossName = MiniBoss[i][2];
		local MaskId = MiniBoss[i][3];
	 	AddNpcEx( MiniBossId, Level + 5, Series, SubWorldID2Idx(W), X * 32, (Y +  5) * 32, 1, MiniBossName, 1 );
	 	Msg2Player("B¹n gäi mét Boss s¸t thñ:"..MiniBossName);
	 	AddItem( 0, 11, MaskId, 1, 0, 0 );	--¸ù¾İÕÙ³öµÄBoss¸øÍæ¼ÒÒ»¸öÃæ¾ß
	 	Msg2Player("B¹n nhËn ®­îc mét MÆt n¹ ");
	elseif ( nBossRate > 3000 and nBossRate <= 6000 ) then	--ÕÙ»½À¶¹Ö
		local i =  random( 1, getn(GoldenNpc));		--Ëæ»úÑ¡Ò»¸öÀ¶¹Önpc
		local j =  floor( Level - 20 ) / 10 + 1;	--¸ù¾İÉ±ÊÖïµµÄµÈ¼¶È¡¶ÔÓ¦droprateµÄÀ¶¹Ö
		local GoldenNpcId = GoldenNpc[i][j];
		local GoldenNpcName = GoldenNpc[i][9];
		NPCINFO_AddBlueNpc( Series, GoldenNpcId, Level, SubWorldID2Idx(W), X * 32, (Y +  5) * 32, 1, GoldenNpcName, 15 );	--Ôö¼ÓÀ¶¹ÖµÄ½Å±¾£¬×îºóÒ»¸öÊıÊÇÀ¶¹ÖÄ£°æ
		Msg2Player("B¹n gäi mét boss xanh:"..GoldenNpcName);
	else	--ÕÙ»½ÆÕÍ¨¹Ö
		local i = random( 1, getn(NormalNpc));
		local NormalNpcId = NormalNpc[i][1];
		local NormalNpcName = NormalNpc[i][2];
		AddNpcEx( NormalNpcId, Level + 5, Series, SubWorldID2Idx(W), X* 32, (Y +  5) * 32, 1, NormalNpcName, 0 );
		AddNpcEx( NormalNpcId, Level + 5, Series, SubWorldID2Idx(W), X * 32, (Y -  5) * 32, 1, NormalNpcName, 0 );
		Msg2Player("B¹n chØ cã thÓ gäi mét sè qu¸i th«ng th­êng ");
	end
	return 0	
end
