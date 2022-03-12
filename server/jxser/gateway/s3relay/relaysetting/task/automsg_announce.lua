-- ¶¨Ê±ÏòÒ»×é·þÎñÆ÷µÄËùÓÐGameserver·¢ÏµÍ³¹«¸æ
function TaskShedule()
	TaskName("Tin tøc tù ®éng - th«ng b¸o");
	
	-- 20·ÖÖÓÒ»´Î
	TaskInterval(20);
	
	-- ²»ÉèTaskTme, ÔòÊÇRelayÆô¶¯Ê±¾Í¿ªÊ¼
	-- 0µã00·Ö¿ªÊ¼
	-- TaskTime(0, 0);
	
	TaskCountLimit(0);
	
	OutputMsg("Tù ®éng cuén th«ng b¸o");
end

g_strTipMsg = 
	{
		--"Ã¿¸öÃÅÅÉÓÐ2-3ÌõÇåÎúµÄ¼¼ÄÜ·¢Õ¹Â·Ïß£¬¸÷ÌõÂ·ÏßµÄÌØµã¸üÎªÏÊÃ÷",
		--"ÔÚÓÎÏ·ÊÀ½çÖÐÓë¸÷´ó³ÇÊÐµÄ³ÇÃÅÎÀ±øºÍÐÂÊÖ´åµÄÃÅÅÉ½ÓÒýµÜ×Ó¶Ô»°£¬¿ÉÁË½â±¾ÃÅµÄ¼¼ÄÜ·¢Õ¹Â·ÏßºÍ×îÊÊºÏÁ·¼¶µÄ³¡Ëù",
		--"ÔÚÓÎÏ·ÊÀ½çÖÐÓë¸÷´ó³ÇÊÐµÄ³ÇÃÅÎÀ±øºÍÐÂÊÖ´åµÄÃÅÅÉ½ÓÒýµÜ×Ó¶Ô»°£¬¿ÉÁË½â±¾ÃÅµÄ¼¼ÄÜ·¢Õ¹Â·ÏßºÍ×îÊÊºÏÁ·¼¶µÄ³¡Ëù",
		--"ÔÚÓÎÏ·ÊÀ½çÖÐÓë¸÷´ó³ÇÊÐµÄ³ÇÃÅÎÀ±øºÍÐÂÊÖ´åµÄÃÅÅÉ½ÓÒýµÜ×Ó¶Ô»°£¬¿ÉÁË½â±¾ÃÅµÄ¼¼ÄÜ·¢Õ¹Â·ÏßºÍ×îÊÊºÏÁ·¼¶µÄ³¡Ëù",
		--"ÔÚÓÎÏ·ÊÀ½çÖÐÓë¸÷´ó³ÇÊÐµÄ³ÇÃÅÎÀ±øºÍÐÂÊÖ´åµÄÃÅÅÉ½ÓÒýµÜ×Ó¶Ô»°£¬¿ÉÁË½â±¾ÃÅµÄ¼¼ÄÜ·¢Õ¹Â·ÏßºÍ×îÊÊºÏÁ·¼¶µÄ³¡Ëù",
		"Trong trß ch¬i khi ®èi tho¹i víi VÖ binh Thµnh m«n cña c¸c thµnh thÞ vµ ®Ö tö tiÕp dÉn c¸c m«n ph¸i ë c¸c T©n Thñ th«n ®Ó hiÓu ®­îc c¸c h­íng ph¸t triÓn kü n¨ng cña tõng m«n ph¸i vµ khu vùc luyÖn c«ng thÝch hîp.",
		--"ÒýÈë¡¼¼¼ÄÜ¼Ó³É¡½µÄ¸ÅÄî£¬µÈ¼¶¸ß¼¼ÄÜµã¶àµÄ½ÇÉ«µÄÓÅÊÆ½«¸ü¼ÓµÃµ½ÌåÏÖ",
		--"¡¼¼¼ÄÜ¼Ó³É¡½µÍ¼¶Õ½¶·¼¼ÄÜ¶Ô¸ß¼¶Õ½¶·¼¼ÄÜÊÇÖ¸¼Ó³É¸ß¼¶¼¼ÄÜµÄÉËº¦",
		--"È«ÐÂµÄ¡¼ÎåÐÐÏà¿Ë¡½ÏµÍ³£¬ÈÎºÎÃÅÅÉÔÚºÍ±»×Ô¼º¿ËµÄÃÅÅÉPKÊ±½«»áÓµÓÐ¸ü¼ÓÃ÷ÏÔµÄÓÅÊÆ",
		--"7ÔÂ16ÈÕÖ®ºóµÚÒ»´ÎµÇÂ½ÓÎÏ·ÊÀ½ç£¬ÏµÍ³»á¸ù¾Ý½ÇÉ«µÄ¾É¼¼ÄÜ×´¿ö×Ô¶¯ÐÞÕýÎªÐÂµÄ¼¼ÄÜ£¬Ç±ÄÜµã»Ö¸´µ½Ô­Ê¼Î´·ÖÅä×´Ì¬",
		--"¡¼¼¼ÄÜÊìÁ·¶È¡½Í¨¹ý²»¶ÏÊ¹ÓÃ´Ë¼¼ÄÜ¹¥»÷µÐÈË»ñµÃÌáÉý£¬ÓëµÐÈËµÈ¼¶ºÍÍæ¼Ò»ñµÃµÄÁ·¼¶¾­ÑéÎÞ¹Ø",
		--"Êó±êÒÆµ½NPCÉíÉÏ£¬¿ÉÏÔÊ¾¡¼ÎåÐÐÊôÐÔÍ¼±ê¡½",
		--"NPCÖ»µôÂäÏàÓ¦ÎåÐÐÊôÐÔµÄ±¦Îï£¬ÈçÏëÒªµÃµ½±ùÇ¹£¬¿ÉÒÔÈ¥´òË®ÏµµÄNPC",
		--"NPCÖ»µôÂäÏàÓ¦ÎåÐÐÊôÐÔµÄ±¦Îï£¬ÈçÏëÒªµÃµ½ÐÒÔË×°±¸£¬¿ÉÒÔÈ¥´òÄ¾ÏµµÄNPC",
		--"NPCÎåÐÐÊôÐÔÍ¼±ê£º½ðÉ«-½ðÏµ£»À¶É«-Ë®Ïµ£»ÂÌÉ«-Ä¾Ïµ£»ºìÉ«-»ðÏµ£»ºÖÉ«-ÍÁÏµ",
		--"¡¼NPCµ÷Õû¡½É³Ä®ÃÔ¹¬NPC²»½öµÈ¼¶¸ß¡¢¾­Ñé¶à¡¢Ë¢ÐÂ¿ì£¬¶øÇÒµô±¦ÂÊÊÇÆÕÍ¨NPCµÄ¶þµ½Èý±¶",
		-- "¡¼×é¶Ó¡½×îºóÒ»»÷µÄÍæ¼ÒµÃµ½µÄ¾­Ñé½«ÊÇµ¥ÈË¾­ÑéµÄ1.3±¶",		
		--"¡¼×é¶Ó¡½¶ÓÎé³ÉÔ±µÄÐÒÔËÖµ½«¸ù¾Ý¶ÓÎéÖÐÈËÊýµÃµ½ÏàÓ¦ÌáÉý",
		--"¡¼×é¶Ó¡½¶ÓÎé³ÉÔ±µÄÐÒÔËÖµ½«¸ù¾Ý¶ÓÎéÖÐÈËÊýµÃµ½ÏàÓ¦ÌáÉý£»µôÂä×°±¸µÄÊôÐÔ½«¸ù¾Ý×îºóÒ»»÷Íæ¼Ò½ÇÉ«ÐÒÔËÖµÀ´¾ö¶¨",
		--"¡¼×é¶Ó½¨Òé¡½¸ßµÈ¼¶Íæ¼Ò´øµÍµÈ¼¶Íæ¼Ò£¬µÈ¼¶Ïà²î70¼¶ÒÔÉÏÊ±£¬¸÷×ÔµÄÉý¼¶ËÙ¶È½«Ìá¸ß20£¥ÒÔÉÏ",
		--"¡¼×é¶ÓËÀÍö³Í·£¡½×é¶ÓÈËÊýÔ½¶à£¬ËÀÍöºóµôµÄ¾­ÑéÔ½ÉÙ£»Èô¶ÓÎéÖÐÈËÊý´ïµ½°ËÈË£¬ËÀÍöºó½«²»µô¾­Ñé",
		--"¡¼ÌÒ»¨µº¡½ÏòÌÒ»¨ÒþÊ¿¹ºÂòÀ°°ËÖà£¬¼®×ÅµºÉÏµÄÁéÆø£¬À°°ËÖàµÄÉñÆæ¹¦Ð§½«ÖúÄãÇáËÉÐÞÁ·¡£",
		"NÕu b¹n ph¸t hiÖn m×nh bÞ mÊt nh÷ng kü n¨ng ®· häc ®­îc, h·y håi s­ sÏ häc ®­îc c¸c kü n¨ng nh­ HuyÕt ChiÕn B¸t Ph­¬ng, V« T©m Tr¶m, Thiªn V­¬ng ChiÕn ý (Thiªn V­¬ng Bang) , cïng víi T©m Nh·n vµ Thiªn La §Þa Vâng (§­êng M«n) .",
		--"¡¼Ï´Ëèµº¡½ÕýÊ½¿ª·Å£¬50¼¶»òÒÔÉÏµÄ·Ç°×ÃûÍæ¼ÒÓÐ¡¼Ò»´ÎÃâ·Ñ¡½½øÈë»ú»á¡£½øµººó¿ÉËæÒâÏ´¡¼Ç±ÄÜµã¡½Óë¡¼¼¼ÄÜµã¡½£¬²¢¿ÉÔÚµºÉÏ»ò×é¶ÓÈë¶´ÌåÑé¼ÓµãÐ§¹û",
		--"Ãâ·Ñ½øÈë¡¼Ï´Ëèµº¡½µÄ»ú»áÖ»ÓÐÒ»´Î¡£Àë¿ªÏ´Ëèµº£¬ÄãµÄ¡¼Ç±ÄÜ/¼¼ÄÜ¡½·ÖÅä½«¾Í´ËÈ·¶¨£¬Àë¿ªÊ±ÇëÈýË¼ÔÙÈýË¼£¡£¡",	
		"Mét bé phËn ng­êi ch¬i sau khi hoµn thµnh [NhiÖm vô cÊp 90] cña m«n ph¸i ch­a thÓ nhËn ®­îc kü n¨ng, sau khi [håi s­] vÒ [Viªn Quan tho¸i nhiÖm] L©m An ®Ó chØnh söa l¹i [183,182]) ",
		"Mét bé phËn ng­êi ch¬i §­êng M«n sau khi häc [Tô tiÔn thuËt. B¹o Vò Lª Hoa] gÆp t×nh tr¹ng kh«ng thÓ sö dông B¹o Vò Lª Hoa, sau khi trë vÒ [håi s­] l¹i ®Õn [Viªn quan Tho¸i NhiÖm] L©m An ®Ó chØnh söa l¹i [183,182]) .",
		"Mét bé phËn ng­êi ch¬i Vâ §ang gÆp t×nh tr¹ng bÞ mÊt ®iÓm kü n¨ng, sau khi vÒ [håi s­] ®Õn [Viªn Quan Tho¸i NhiÖm] l©m An ®Ó chØnh söa l¹i (L©m An [183,182]) ",
		--"¡¼ÉùÍû²éÑ¯¡½Çëµ½¸÷´ó³ÇÊÐµÄËãÃüÏÈÉú¡¼ÕÅÌú×ì¡½´¦£¬ÏåÑô[192,193]",
		--"¡¼Ë®¾§·ç±©¡½2004Äê7ÔÂ22ÈÕÔç11£º00ÒÔºó£¬³äÖµ35ÔªÐé¿¨»òÕßÊµ¿¨¶¼¿ÉÒÔÔÚÐÂÊÖ´åÒ°ÛÅÄÇÀïËæ»úÁìÈ¡Ò»¿ÅË®¾§£¬»î¶¯ÑÓ³Ùµ½2004Äê8ÔÂ8ÈÕ½áÊø",
		--"¡¼ÎäÆ÷Í¼Æ×¡½ÓÃÖÐÔ­ÎäÁÖµÄÉñÆæ¡¼Ë®¾§¡½£¬ÓëÒìÓòÉñÃØÉÌÈË»»È¡¡¼ÎäÆ÷Í¼Æ×¡½¡£ÔÙÈÃ¡¼Ìú½³¡½²ÎÕÕÍ¼Æ×£¬°Ù·Ö°ÙµØ°ïÄã°ÑÎäÆ÷ÌáÉýÒ»¸öµÈ¼¶",
		--"¡¼ÎäÆ÷Í¼Æ×¡½ÒìÓòÉñÃØÉÌÈË³öÏÖÔÚÑïÖÝ[207,193]ÓëÁÙ°²[164,177]Á½µØ£¬Òª»»Í¼Æ×Éý¼¶ÎäÆ÷µÄÍæ¼ÒÇëËÙËÙÐÐ¶¯",
		--"¡¼À¶Ãû¹ÖÎï¡½¾ªÏÖ½­ºþ(Ãû×ÖÏÔÊ¾ÎªÀ¶É«)£¬Ð¯´ø²»ÉÙ½ðÇ®ºÍ×°±¸£¬»¹¿ÉÄÜ´øÓÐ¡¼Ë®¾§¡½¡¢¡¼ÐÉºì±¦Ê¯¡½¡¢¡¼»Æ½ð×°±¸¡½¡¢¡¼¼¼ÄÜÊé¡½",
		--"¡¼»Æ½ð×°±¸¡½¡¼¶¨¹ú¡½¡¼°²°î¡½»Æ½ð×°±¸Ì××°ÏÖÉí½­ºþ£¬´ò¡¼À¶Ãû¹ÖÎï¡½¼´ÓÐ»ú»á»ñµÃ¡£²Î¼Ó°ÂÔË¾¹²Â»î¶¯£¬Ã¿ÌìÒ²½«Ëæ»úÒ»¼þ",
		" [TÆng quµ nh©n dÞp Olympic]Mçi lÇn ®éi Trung Quèc nhËn ®­îc phÇn th­ëng, ng­êi ch¬i cã thÓ ®Õn [LÔ Quan] ë c¸c thµnh thÞ ®Ó nhËn vËt phÈm: Kim bµi-Kim Th¶o Lé, Ng©n bµi-B¹ch C©u hoµn,§ång bµi-LÔ Hoa",
		"¡¼°ÂÔË½±ÅÆËÍ´óÀñ¡½ÁìÈ¡ÀñÆ·µÚÒ»Ê±¼ä¶Î£º±±¾©Ê±¼ä10£º00~14£º00ÁìÈ¡Ç°Ò»Ìì22£º00~µ±Ìì4£º00µÄ½±Æ·",
		"¡¼°ÂÔË½±ÅÆËÍ´óÀñ¡½ÁìÈ¡ÀñÆ·µÚ¶þÊ±¼ä¶Î£º19£º00~20£º00ÁìÈ¡µ±Ìì14£º00~18£º00µÄ½±Æ·",
		"¡¼°ÂÔË½±ÅÆËÍ´óÀñ¡½ÁìÈ¡ÀñÆ·µÚÈýÊ±¼ä¶Î£º23£º00~´ÎÈÕ0:00ÁìÈ¡µ±Ìì18£º00~22£º00µÄ½±Æ·",
		" [TÆng quµ nh©n dÞp Olympic]ViÖc nhËn vËt phÈm lµ cã thêi h¹n,ng­êi ch¬i nªn chó ý theo dâi cuéc thi dÊu cña ®éi nhµ vµ ®Õn [LÔ Quan] nhËn th­ëng kÞp thêi.",
		"Sö dông [Kim Th¶o Lé] luyÖn cÊp trong vßng 1 giê sÏ ®­îc ®iÓm kinh nghiÖm gÊp ®«i: Sö dông [B¹ch C©u hoµn] trong vßng 1 giê sÏ ®­îc [tù ®éng ®¸nh qu¸i]. C«ng n¨ng cña 2 lo¹i d­îc phÈm nµy sÏ ®­îc më vµo ngµy ",
		" [Dù ®o¸n thi ®Êu Olympic]®èi tho¹i víi [LÔ Quan] ë c¸c thµnh thÞ ®Ó tham gia ho¹t ®éng dù ®o¸n Olympic",
		"¡¼°ÂÔËÈüÊÂ¾¹²Â¡½¾¹²ÂÖÐ½±µÄÍæ¼ÒÔÚ»ñµÃ½±½ð»Ø±¨µÄÍ¬Ê±£¬»¹ÓÐ¿ÉÄÜ»ñµÃ¡¼¶¨¹ú¡½¡¼°²°î¡½ÏµÁÐ»Æ½ð×°±¸ÖÐµÄÒ»¼þ",
		"ËùÓÐÈüÊÂ½áÊøºó£¬ÏµÍ³½«ÔÚ²ÂÖÐÖÐ¹ú¶Ó»ñµÃµÄ½ð¡¢Òø¡¢Í­ÅÆÊýÁ¿µÄÍæ¼ÒÖÐ²úÉúÒ»Î»³¬¼¶ÐÒÔËÍæ¼Ò£¬½±Àø°ÂÔËÏµÁÐ»Æ½ð×°±¸Ì××°",
		"¡¼°ÂÔË½±ÅÆ¾¹²Â¡½ÖÐ¹ú½±ÅÆÊýÄ¿¾¹²Â£¬½«ÔÚ2004.8.17ÈÕÔçÉÏÎ¬»¤Ç°½ØÖ¹¡£Òª²Î¼ÓµÄÍæ¼ÒÇë×¥½ôÊ±¼ä¹ºÂò´ËÀà²ÊÆ±",
		" [Bé trang bÞ hoµng kim Olympic]gåm 2 bé Athens 2004- [Hån Olympic], B¾c Kinh 2008- [Lßng Olympic]",
		"¡¼°ÂÔËÖ®»ê¡½¡¢¡¼°ÂÔËÖ®ÐÄ¡½ÊôÐÔ¾ùÎª¡¼ËùÓÐÎä¹¦µÈ¼¶¼Ó1¡½£¬´÷Æëºó×Ô¶¯¼¤»îÈ«Éí×°±¸µÄËùÓÐ°µÊôÐÔ",
		" [HÖ thèng phóc duyªn] th«ng qua thêi gian ch¬i t¨ng dÇn ®Ó ®æi lÊy ®iÓm phóc duyªn. Dïng ®iÓm phóc duyªn ®Õn [ThÇn bÝ th­¬ng nh©n LiÔu Êt] T­¬ng D­¬ng ®Ó ®æi lÊy c¸c lo¹i vËt phÈm ®Æc thï.",
		" [HÖ thèng phóc duyªn] ®èi tho¹i víi [Vâ L©m truyÒn nh©n] ë c¸c thµnh thÞ ®Ó biÕt th«ng tin chi tiÕt.",
		" [Ho¹t ®éng Trung Thu] ¡n b¸nh trung thu, ng¾m tr¨ng s¸ng, vÞnh th¬, gi¶i c©u ®è ch÷-----ho¹t ®éng ®ang triÓn khai toµn diÖn, nhiÒu phÇn th­ëng ®ang chê ®ãn b¹n! Vui lßng ®Õn LÔ Quan c¸c thµnh thÞ ®Ó hái thªm chi tiÕt.",
		" [§µo Hoa ®¶o] Olympic v¹n ng­êi cïng vui,tr­íc khi hÖ thèng dõng m¸y b¶o tr× tõ ngµy 14/8/2004 ®Õn 30/8/2004, miÔn phÝ tu luyÖn ë §µo Hoa ®¶o."
	};
	
-- ÐÂ¹¦ÄÜÔ¤¸æÐÅÏ¢
g_nFutureDate = 20040723;
STR_HEAD_FUTURE = " [Giang hå truyÒn r»ng]";
g_strFutureMsg = 
	{
		--"¼´½«¿ª·Å¡¼µ¥Á·µØÍ¼¡½¡¢¡¼´ò±¦µØÍ¼¡½",
		--"¡¼Ï´Ëèµº¡½Ï´¼¼ÄÜµã¹¦ÄÜ½«ÔÚ2004Äê7ÔÂ24ÈÕ¿ª·Å£¬50¼¶»òÒÔÉÏµÄ·Ç°×ÃûÍæ¼ÒÓÐÒ»´ÎÃâ·Ñ½øÈë»ú»á",
		--"½èÖú¡¼×ÏË®¾§¡½»òÉñÃØ¡¼ÎäÆ÷Í¼Æ×¡½¿ÉÒÔÌáÉýÎäÆ÷µÈ¼¶"
		--"¡¼À¶Ãû¹ÖÎï¡½(Ãû×ÖÏÔÊ¾ÎªÀ¶É«)´À´ÀÓû¶¯£¬¾ÝËµ½«Ð¯´ø²»ÉÙ½ðÇ®ºÍ×°±¸ÏÂÉ½£¬»¹¿ÉÄÜ´øÓÐ¡¼Ë®¾§¡½¡¢¡¼ÐÉºì±¦Ê¯¡½¡¢¡¼»Æ½ð×°±¸¡½¡¢¡¼¼¼ÄÜÊé¡½",
		--"¡¼»Æ½ð×°±¸¡½¡¼¶¨¹ú¡½¡¼°²°î¡½»Æ½ð×°±¸Ì××°ÏÖÉí½­ºþ£¬´ò¡¼À¶Ãû¹ÖÎï¡½¼´ÓÐ»ú»á»ñµÃ",
		--"¡¼Ë«±¶½ðÇ®Ë«±¶¾­Ñé¡½90¼¶¼¼ÄÜ¾«²ÊÎ¨ÃÀ£»½£Íø×é¶Ó³É·ç£¬´ò¹ÖÁ·¼¶»ð±¬¡£´ðÐ»ÐÂÀÏÍæ¼Ò£¬½üÆÚ½«»áÓÐË«±¶½ðÇ®Ë«±¶¾­Ñé»î¶¯",
		
	};
function TaskContent()
	str = "";
	nFutureCount = getn(g_strFutureMsg);
	nCount = getn(g_strTipMsg) + nFutureCount;
	nIndex = random(1, nCount);
	if (nIndex <= nFutureCount) then -- 1-È¡Ô¤¸æÐÅÏ¢£¬2-È¡ÌáÊ¾ÐÅÏ¢
		str = getFutureMsg();
		if (strlen(str) <= 0) then -- Ã»ÓÐÔ¤¸æÐÅÏ¢£¬¾ÍÈ¡ÌáÊ¾ÐÅÏ¢
			str = getTipMsg();
		end
	else
		str = getTipMsg();
	end
	
	GlobalExecute(format("dw Msg2SubWorld([[%s]])", str));
end

-- È¡ÌáÊ¾ÐÅÏ¢
function getTipMsg()

	nCount = getn(g_strTipMsg);
	nIndex = random(1, nCount);

	return g_strTipMsg[nIndex];
end

-- È¡Ô¤¸æÐÅÏ¢
function getFutureMsg()
	nCurDate = tonumber(date("%Y%m%d"));
	str = "";
	if (g_nFutureDate > nCurDate) then -- ÊÇ·ñÔÚÖ¸¶¨ÈÕÆÚÖ®Ç°£¬·ñÔò²»·¢
		nCount = getn(g_strFutureMsg);
		nIndex = random(1, nCount);
		str = STR_HEAD_FUTURE..(g_strFutureMsg[nIndex]);
	end
	
	return str;
end
