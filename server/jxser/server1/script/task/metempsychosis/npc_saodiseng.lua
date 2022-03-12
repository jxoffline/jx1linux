-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµÍøÂç°æÔ½ÄÏ°æ - NPC¶Ô»°´¦Àí
-- ÎÄ¼şÃû¡¡£ºnpc_saodiseng.lua
-- ´´½¨Õß¡¡£º×Ó·Çô~
-- ´´½¨Ê±¼ä£º2009-02-04 16:25:15

-- ======================================================
Include("\\script\\task\\metempsychosis\\task_head.lua")
Include("\\script\\task\\metempsychosis\\task_func.lua")
Include("\\script\\task\\metempsychosis\\translife_4.lua")
Include("\\script\\task\\metempsychosis\\translife_5.lua")

-- ±»Ô½ÄÏÇ¿ÖÆÇ¨ÒÆµ½ ±±¶·ÀÏÈË´¦
function beidou_translife_main()
	CreateTaskSay({"<dec><npc>L¹i ®Õn 1 ng­êi n÷a? Xem ra chuyÖn ta ®¹t ®­îc <B¾c §Èu Tr­êng Sinh ThuËt - T©m Ph¸p Thiªn> kh«ng cßn lµ bİ mËt n÷a råi. LÏ nµo viÖc phÕ vâ c«ng kh«ng lµm cho thiªn h¹ sî h·i hay sao. ViÖc ®· nh­ thÕ nµy råi, ng­¬i t×m ta cã viÖc g×.",		"PhÕ vâ c«ng? Ng­êi ®õng däa ta chø?/zhuansheng_ondialog",
		"KiÓm tra sè l­îng trång c©y trïng sinh 5/TRANSLIFE5_queryTreeNumber",
		"KiÓm tra kü n¨ng trïng sinh 4 cßn d­ ®iÓm kü n¨ng/querySkillPoint_4",
		"TÈy ®iÓm kü n¨ng trïng sinh 4/wantClearSkillPoint_4",
		"Vâ c«ng, t©m ph¸p c¸i g×! L¹i thªm 1 kÎ ®iªn khïng/OnCancel"
		});
end

function zhuansheng_ondialog()
	if (GetTask(TSK_ZHUANSHENG_FLAG) == 1) then
		Msg2Player("§· häc <B¾c §Èu Tr­êng Sinh ThuËt - C¬ Së Thiªn>");
	end
	
	local tbOpp = {"<dec><npc>Kh«ng sai, lÏ nµo ng­¬i kh«ng biÕt? Tu luyÖn B¾c §Èu Tr­êng Sinh ThuËt xong. CÊp bËc cña ®¹i hiÖp sÏ thµnh cÊp 10, tÊt c¶ kü  n¨ng vâ c«ng sÏ bŞ phÕ, ®¹t ®Õn cÊp bËc t­¬ng øng  míi cã thÓ håi phôc (cÊp 90, 120 sÏ kh«i phôc c¸c kü n¨ng vèn cã). Ngoµi ra, sÏ b¶o l­u tÊt c¶ nh÷ng ®iÓm kü n¨ng vµ tiÒm n¨ng cña ®¹i hiÖp.<enter> Nãi chung, ®¹i hiÖp cÇn b¾t ®Çu tõ ®Çu. Nh­ng còng ®õng  qu¸ n«n nãng, ®îi ng­¬i lªn cÊp 120 130 sÏ t¸i xuÊt  giang hå, thiªn h¹ nµy vÉn lµ thiªn h¹ cña ng­¬i mµ."};
	local n_level = GetLevel();
	local n_transcount = ST_GetTransLifeCount();
	
	local n_date = tonumber(GetLocalDate("%Y%m%d"));
	
	if (n_transcount == 0 and n_level == 199 and (n_date >= ZHUANSHENG_ITEM_BEGIN and n_date <= ZHUANSHENG_ITEM_ENDLE)) then --ĞèÒª¼ÓÈëÊ±¼äÏŞÖÆ
		tinsert(tbOpp, "Ta muèn t×m hiÓu vÒ B¾c §Èu Tiªn §¬n/zhuansheng_xiandan");
	end
	
	tinsert(tbOpp, "Xin hái tu luyÖn <B¾c §Èu Tr­êng Sinh ThuËt - T©m Ph¸p Thiªn> cÇn nh÷ng ®iÒu kiÖn g×?/zhuansheng_help_require");
	tinsert(tbOpp, "Lµm thÕ nµo cã thÓ häc <B¾c §Èu Tr­êng Sinh ThuËt - T©m Ph¸p Thiªn>?/zhuansheng_help_method");
	tinsert(tbOpp, "Xin hái ®¼ng cÊp cña ta cã thÓ l­u gi÷ bao nhiªu ®iÓm kü n¨ng vµ tiÒm n¨ng?/zhuansheng_help_prop");
	tinsert(tbOpp, "Xin hái ta cã thÓ tu luyÖn ®Õn møc ®é nµo råi?/zhuansheng_query");
	tinsert(tbOpp, "Xin hái thêi gian ®Ó chuyÓn sinh lÇn kÕ tiÕp: /zhuansheng_time");
	tinsert(tbOpp, " KÕt thóc ®èi tho¹i!/OnCancel");
	
	CreateTaskSay(tbOpp);
end

--×ªÉúµÄÌõ¼ş
function zhuansheng_help_require()
	
	CreateTaskSay({"<dec><npc>§iÒu kiÖn rÊt ®¬n gi¶n"
		.."<enter>  ".."1. Yªu cÇu ®¼ng cÊp trïng sinh:"
		.."<enter>    "..format("LÇn trïng sinh thø %d, ®¼ng cÊp kh«ng ®­îc nhá h¬n %d", 1, TB_LEVEL_LIMIT[1])
		.."<enter>    "..format("LÇn trïng sinh thø %d, ®¼ng cÊp kh«ng ®­îc nhá h¬n %d", 2, TB_LEVEL_LIMIT[2])
		.."<enter>    "..format("LÇn trïng sinh thø %d, ®¼ng cÊp kh«ng ®­îc nhá h¬n %d", 3, TB_LEVEL_LIMIT[3])
		.."<enter>    "..format("LÇn trïng sinh thø %d, ®¼ng cÊp kh«ng ®­îc nhá h¬n %d", 4, TB_LEVEL_LIMIT[4])
		.."<enter>    "..format("LÇn trïng sinh thø %d, ®¼ng cÊp kh«ng ®­îc nhá h¬n %d", 5, TB_LEVEL_LIMIT[5])
		.."<enter>  ".."2. §· häc <B¾c §Èu Tr­êng Sinh ThuËt - C¬ Së Thiªn>"
		.."<enter>  ".."3. Cëi bá tÊt c¶ trang bŞ vµ ngùa trªn ng­êi."
		.."<enter>  ".."4. B¾t buéc ph¶i tho¸t khái chiÕn ®éi vâ l©m liªn ®Êu."
		.."<enter>  ".."5. Kh«ng ®­îc cßn nhiÖm vô ch­a hoµn thµnh (S¸t thñ, tİn sø, D· TÈu)."
		.."<enter>  ".."6. ChuyÓn sinh lÇn thø 1 ®Õn thø 3 cÇn cã 100 v¹n l­îng, chuyÓn sinh lÇn thø 4 cÇn cã 200 v¹n l­îng"
		.."<enter>  "..format("7. ChuyÓn sinh lÇn 4 cÇn cã %d c¸i %s.", TBITEMNEED_4[1].nCount, TBITEMNEED_4[1].szName)
		.."<enter>  "..format("8. ChuyÓn sinh lÇn 4 cÇn cã %d c¸i %s.", TBITEMNEED_4[2].nCount, TBITEMNEED_4[2].szName)
		.."<enter>  ".."9. Ch­a nhËn hoÆc ch­a hoµn thµnh nhiÖm vô kÜ n¨ng cÊp 150"
		.."<enter>  "..format("10. trïng sinh lÇn 5 yªu cÇu %d c¸i %s", TBITEMNEED_5[1].nCount, TBITEMNEED_5[1].szName)
		--.."<enter>  "..format("11. trïng sinh lÇn 5 yªu cÇu %d c¸i %s", TBITEMNEED_5[2].nCount, TBITEMNEED_5[2].szName)
		--.."<enter>  "..format("12. trïng sinh lÇn 5 yªu cÇu %d c¸i %s", TBITEMNEED_5[3].nCount, TBITEMNEED_5[3].szName)
		--.."<enter>  ".."13. trïng sinh lÇn 5 cÇn ph¶i trång 400 C©y Thiªn Léc.",
		"T×m hiÓu viÖc kh¸c./zhuansheng_ondialog",
		"Ta hiÓu råi./OnCancel"});
end

--×ªÉúµÄºÃ´¦
function zhuansheng_help_effect()
	CreateTaskSay({"<dec><npc>1. Thu ®­îc ®iÓm d­ kü n¨ng vµ tiÒm n¨ng"
	.."<enter>  ".."2. Thu ®­îc kh¸ng tİnh cã giíi h¹n cao h¬n, cã ®­îc n¨ng lùc sinh tån nhiÒu h¬n."
	.."<enter>  ".."3. T¨ng giíi h¹n kü n¨ng vâ c«ng cao nhÊt, sÏ cã ®­îc lùc c«ng kİch m¹nh h¬n vµ tèc ®é ®¸nh nhanh h¬n."
	.."<enter>  ".."4. Cã thÓ sö dông 1 sè trang bŞ míi nhÊt"
	.."<enter>  ".."5. Thu ®­îc c¬ héi 1 lÇn tÈy ®iÓm miÔn phİ",
		"T×m hiÓu viÖc kh¸c./zhuansheng_ondialog",
		"Ta hiÓu råi./OnCancel"});
end

--ÈçºÎÑ§Ï°×ªÉú
function zhuansheng_help_method()
	CreateTaskSay({"<dec><npc>NÕu nh­ ng­¬i ®· häc qua <B¾c §Èu Tr­êng Sinh ThuËt - C¬ Së Thiªn>, th× ta cã thÓ ®äc khÈu   quyÕt d¹y ng­¬i <B¾c §Èu Tr­êng Sinh ThuËt - T©m Ph¸p Thiªn>."
		.. "ChuyÓn sinh lÇn 1 ®Õn lÇn 3 cÇn cã 10 ngµn v¹n l­îng lµ ®­îc, chuyÓn sinh lÇn 4 th× ph¶i 20 ngµn v¹n, ha ha."
		.. "<enter>Nh¾c nhë mét chót lµ, nÕu nh­ muèn chuyÓn sinh lÇn 4, tr­íc tiªn b¶n th©n m×nh cÇn ph¶i nhËn nhiÖm vô, sau ®ã h·y ®i"
		.. "<color=yellow>Tr­êng B¹ch S¬n Nam, D­îc V­¬ng §éng TÇng 4, Sa M¹c S¬n §éng 3, Kháa Lang §éng <color> ®¸nh b¹i <color=yellow> S­¬ng §ao, Xuyªn S¬n, TËt Phong, ¶nh C«n <color>"
		.. "Míi cã tØ lÖ nhÊt ®Şnh nhËn ®­îc Tİch LŞch §¬n vËt cÇn thiÕt ®Ó chuyÓn sinh 4."
		.. "<enter>  NÕu muèn trïng sinh 5, cÇn ph¶i nhËn nhiÖm vô, sau ®ã tham gia "
		.. "<color=yellow>ChiÕn Tr­êng Tèng Kim <color> ®iÓm tİch lòy <color=yellow> 300 ®iÓm <color> trë lªn."
		.. "Sö dông <color=yellow> Long HuyÕt Hoµn <color> tham gia <color=yellow> thêi gian khiªu chiÕn <color> vµ v­ît qua <color=yellow> ¶i <color> thø 17."
		.. "Sö dông <color=yellow> Viªm §Õ LÖnh <color> tham gia <color=yellow> Viªm §Õ b¶o Tµng <color> vµ v­ît qua <color=yellow> ¶i <color> thø 6."
		.. "Cã thÓ nhËn <color=yellow>V« Cùc Tiªn §¬n<color>, më<color=yellow>Tinh Mü B¶o R­¬ng, Quı Träng B¶o R­¬ng<color>cã thÓ nhËn ®­îc<color=yellow>H¾c Long Tiªn §¬n<color>."
		.. "§ång thêi cÇn ph¶I trång<color=yellow>400 C©y Thiªn Léc<color>.",
		"§­îc, ta muèn häc ngay./zhuansheng_want_learn",
		"NhËn nhiÖm vô chuyÓn sinh 4/wantGetTranslifeTask_4",
		"NhËn nhiÖm vô trïng sinh 5/TRANSLIFE5_wantGetTranslifeTask",
		"Ta muèn t×m hiÓu chi tiÕt h¬n/zhuansheng_ondialog",
		"Ta biÕt rå/OnCancel"});
end

--ÏëÒªÑ§Ï°×ªÉú
--ÔÚ´ËÅĞ¶ÏÊÇ·ñ·ûºÏ×ªÉúµÄÌõ¼ş
function zhuansheng_want_learn()
	local n_transcount = ST_GetTransLifeCount()
	
	if (n_transcount >= NTRANSLIFE_MAX) then
		CreateTaskSay({"<dec><npc>"..format("LÇn chuyÓn sinh thø %d vÉn ch­a më, thêi gian cô thÓ sÏ cËp nhËt sau", NTRANSLIFE_MAX+1), 
			" KÕt thóc ®èi tho¹i!/OnCancel"});
		return 0;
	end

	if (check_zhuansheng() == 0) then
		return 0;
	end
	
	if (n_transcount == 0) then
		CreateTaskSay({"<dec><npc>".."LÇn chuyÓn sinh thø nhÊt 5 lo¹i phßng ngù sÏ gia t¨ng.", 
			"§­îc, ta muèn häc ngay./#zhuansheng_sure_learn(-1)", " KÕt thóc ®èi tho¹i!/OnCancel"});
	elseif (n_transcount < 0 or n_transcount >=5) then
		Say("Tr¹ng th¸i bÊt th­êng xin mêi liªn l¹c víi nhµ ®iÒu hµnh xö lı.", 0);
	else
		local tbOpp = {"<dec><npc>".."Xin mêi chän ®iÓm phßng ngù muèn t¨ng:"};
		
		for k, sz in TB_BASE_RESIST do
			tinsert(tbOpp, format("%s%s/#zhuansheng_sure_learn(%d)", "+", sz, k));
		end
		tinsert(tbOpp, " KÕt thóc ®èi tho¹i!/OnCancel")
		CreateTaskSay(tbOpp);
		
	end
end

function zhuansheng_sure_learn(n_resist)
	if (check_zhuansheng() == 0) then
		return 0;
	end
	
	local n_transcount = ST_GetTransLifeCount();
	
	if (n_transcount >= 2) then
		for i = 2, n_transcount do
			local n_translevel, n_transresist = zhuansheng_get_gre(i);
			if (n_translevel ~= 0 and n_transresist == n_resist) then
				CreateTaskSay({"<dec><npc>"..format("§©y lµ lÇn chuyÓn sinh thø %d vµ ®· chän %s kh«ng thÓ chän nhiÒu lÇn 1 ®iÓm phßng ngù, xin mêi h·y chän l¹i.", i, TB_BASE_RESIST[n_resist]),
								"Ta muèn chän l¹i/zhuansheng_want_learn",
								" KÕt thóc ®èi tho¹i!/OnCancel"});
				return 0;
			end
		end
	end
	
	SetTaskTemp(TSKM_ZHUANSHENG_RESISTID, n_resist);
	if (n_transcount == 2 and GetLevel() >= 190) then
		SetTask(TSK_ZHUANSHENG_AWARD, 1);
	end
	local nlevel = GetLevel();
	--×ªÉúÊ±µÄ´¦Àí
	LeaveTeam();	--½âÉ¢×é¶Ó¹ØÏµ
	
	ST_DoTransLife();		--Ö´ĞĞ×ªÉú£¬»á×Ô¶¯µ÷ÓÃ\\script\\global\\translife.luaµÄmainº¯Êı ·µ»ØÖµÎª1Îª³É¹¦£¬³É¹¦ºó»á¼ÇÂ¼×ªÉúÇ°µÄµÈ¼¶¡£
	
	CreateTaskSay({"<dec><npc>Ng­¬i ®· häc <B¾c §Èu Tr­êng Sinh ThuËt - T©m Ph¸p Thiªn> råi.", "§a ta s­ phô ®· chØ gi¸o/OnCancel"});
end

function check_zhuansheng()
	-- Ô½ÄÏ°æÔÊĞí¶à´Î×ªÉú ×î¶à 5´Î
	if (check_zhuansheng_level() ~= 1) then	
		return 0;
	end
	
	if zhuansheng_check_common() ~= 1 then
		return 0
	end

	local ntranscount = ST_GetTransLifeCount()
	--Make change translife for free - Modified by DinhHQ - 20130531
--	if (ntranscount == 2 and GetCash() < 3000000) then				--jxbÒª1ÒÚ
--		CreateTaskSay({"<dec><npc>H×nh nh­ tiÒn vÉn ch­a ®ñ <color=red>3000000<color>.", "§­îc råi./OnCancel"});
--		return 0;
--	end
	-- ĞèÒªµÚ4´Î×ªÉú£¬ÅĞ¶ÏÊÇ·ñ¾ßÓĞ999¸öÅùö¨µ¯£¬±±¶·³¤ÉúÊõ¡ª´ó³ËĞÄ·¨ ºÍ ¶şÒÚjxb
--	if ntranscount == 3 then
		--Make change translife for free - Modified by DinhHQ - 20130531
--		for i=1,getn(TBITEMNEED_4) do
--			local tbProb = TBITEMNEED_4[i].tbProb
--			if CalcItemCount(3,tbProb[1], tbProb[2],tbProb[3], -1) < TBITEMNEED_4[i].nCount then
--				CreateTaskSay({TB_TRANSLIFE_ERRORMSG[13 + i], "§­îc råi./OnCancel"})
--				return 0
--			end
--		end
		
		-- 4×ª¶şÒÚjxb
--		if GetCash() < ZHUANSHENG_TUITION_4 then	
--			CreateTaskSay({TB_TRANSLIFE_ERRORMSG[13], "§­îc råi./OnCancel"});
--		return 0;
--		end
--	end
	
	-- 5×ªÅĞ¶Ï
	if ntranscount==4 and TRANSLIFE5_canTranslife()==0 then
		return 0
	end
	
	-- ¾­ÑéÖµ²»ÄÜÎª¸ºGetExp()>=0
	if GetLevel()==200 and GetExp()<0 then 
		CreateTaskSay({TB_TRANSLIFE_ERRORMSG[20], "§­îc råi./OnCancel"})
		return 0
	end
	
	--ÆäËû£¿É±ÊÖÈÎÎñ£¿
	return 1;
end	

--×ªÉúºóÄÜ±£ÁôµÄÇ±ÄÜµã ¼¼ÄÜµãËµÃ÷
function zhuansheng_help_prop()
	local nlevel = GetLevel();
	local ncurexp = GetExp();
	local ntranscount = ST_GetTransLifeCount();
	
	if (check_zhuansheng_level() ~= 1) then
		return 0;
	end
	
	local nmgpoint, nprop, nresist, naddskill  = 	TB_LEVEL_REMAIN_PROP[nlevel][ntranscount+1][1],
													TB_LEVEL_REMAIN_PROP[nlevel][ntranscount+1][2],
													TB_LEVEL_REMAIN_PROP[nlevel][ntranscount+1][3],
													TB_LEVEL_REMAIN_PROP[nlevel][ntranscount+1][4];
	
	local sz_res = "Chän 1 lo¹i kh¸ng tİnh";
	local sz_addskill = "";
	
	if (ntranscount == 0) then
		sz_res = "TÊt c¶ kh¸ng tİnh";
	end
	
	if (nlevel == 199 and ncurexp >= ZHUANSHENG_XIANDAN_MINEXP and ntranscount == 0) then
		nmgpoint, nprop, nresist, naddskill  = 	TB_LEVEL_REMAIN_PROP[200][ntranscount+1][1],
												TB_LEVEL_REMAIN_PROP[200][ntranscount+1][2],
												TB_LEVEL_REMAIN_PROP[200][ntranscount+1][3],
												TB_LEVEL_REMAIN_PROP[200][ntranscount+1][4];
		sz_addskill = "[HiÖn t¹i kinh nghiÖm ®· v­ît qu¸ 2 tû:]";
	end
	
	CreateTaskSay({"<dec><npc>"..format("Theo nh­ cÊp %d cña ng­¬i vµ trïng sinh %d lÇn, %s cã thÓ t¨ng <color=yellow>%d<color> tiÒm n¨ng, <color=yellow>%d <color> kü n¨ng, t¨ng <color=yellow>%d%%<color> kh¸ng tİnh (%s), n©ng cao <color=yellow>%d <color> giíi h¹n kü n¨ng cao nhÊt.", 
				nlevel, (ntranscount+1), sz_addskill, nprop, nmgpoint, nresist, sz_res, naddskill), 
		"T×m hiÓu viÖc kh¸c./zhuansheng_ondialog",
		"§­îc råi./OnCancel"});
end


function zhuansheng_query()
	--do return Say("Î´Íê³É", 0)end
	local n_transcount = ST_GetTransLifeCount();
	local nmgpoint, nprop, nskill = 0,0,0;
	local tbresist = {0, 0, 0, 0, 0};
	local sz_msg = "";
	
	if (n_transcount ~= 0) then
		for i = 1, n_transcount do
			nlevel, nresistid = zhuansheng_get_gre(i);
			
			nmgpoint = TB_LEVEL_REMAIN_PROP[nlevel][i][1] + nmgpoint;
			nprop  = TB_LEVEL_REMAIN_PROP[nlevel][i][2] + nprop;
			nskill = TB_LEVEL_REMAIN_PROP[nlevel][i][4] + nskill;
			if (nresistid >= 0 and nresistid <= 4) then
				tbresist[nresistid+1] = tbresist[nresistid+1] + TB_LEVEL_REMAIN_PROP[nlevel][i][3];
				sz_msg = sz_msg.."<enter>"..format("Trïng sinh lÇn %d ®¼ng cÊp: %d; chän kh¸ng tİnh: %s", i, nlevel, TB_BASE_RESIST[nresistid]);
			elseif (nresistid == 255) then
				tbresist[1] = tbresist[1] + TB_LEVEL_REMAIN_PROP[nlevel][i][3];
				tbresist[2] = tbresist[2] + TB_LEVEL_REMAIN_PROP[nlevel][i][3];
				tbresist[3] = tbresist[3] + TB_LEVEL_REMAIN_PROP[nlevel][i][3];
				tbresist[4] = tbresist[4] + TB_LEVEL_REMAIN_PROP[nlevel][i][3];
				tbresist[5] = tbresist[5] + TB_LEVEL_REMAIN_PROP[nlevel][i][3];
				sz_msg = sz_msg.."<enter>"..format("Trïng sinh lÇn %d ®¼ng cÊp: %d; chän kh¸ng tİnh: %s", i, nlevel, "TÊt c¶ kh¸ng tİnh");
			end
		end
	end
	
	CreateTaskSay({format("%s<enter>%s<enter>%s<enter>%s<enter>%s<enter>%s<enter>%s<enter>%s<enter>%s<enter>%s%s", 
					"<dec><npc>",
					format("Sè lÇn chuyÓn sinh: %d", n_transcount),
					format("Thu ®­îc ®iÓm kü n¨ng: %d", nmgpoint),
					format("Thu ®­îc ®iÓm tiÒm n¨ng: %d", nprop),
					format("§iÓm kü n¨ng cao nhÊt t¨ng thªm: %d", nskill),
					format("Háa phßng t¨ng: %d", tbresist[1]),
					format("B¨ng phßng t¨ng: %d", tbresist[2]),
					format("§éc phßng t¨ng: %d", tbresist[3]),
					format("L«i phßng t¨ng: %d", tbresist[4]),
					format("Phæ phßng t¨ng: %d", tbresist[5]),
					sz_msg
					), 
			"T×m hiÓu viÖc kh¸c./zhuansheng_ondialog",
			"§­îc råi./OnCancel"});
	
end


function zhuansheng_xiandan()
	
	CreateTaskSay({"<dec><npc>".."'B¾c ®Èu tiªn ®¬n' lµ lo¹i linh d­îc mµ vŞ vâ l©m cao thñ cã néi c«ng th©m hËu nµo muèn häc 'B¾c ®Èu tr­êng sinh thuËt'  ®Òu ph¶i dïng ®Õn, sau khi sö dông cã thÓ t¨ng thªm nhiÒu phÇn c«ng lùc. ChÕ t¹o B¾c §Èu Tiªn §¬n b¾t buéc cÊp 199 vµ cã 201000 v¹n kinh nghiÖm míi chÕ t¹o ®­îc, lóc chÕ t¹o B¾c §Èu Tiªn §¬n nh÷ng kinh nghiÖm v­ît qu¸ 2 tû sÏ chuyÓn hãa vµo tiªn ®¬n. Nªn nhí r»ng ph¶i chuyÓn sinh xong míi sö dông ®­îc, mçi ng­êi nhiÒu nhÊt sö dông 1 linh ®¬n, ®ång thêi b¾t buéc trong vßng 30 ngµy ph¶i sö dông. Tiªn ®¬n cã ®¬n vŞ kinh nghiÖm lµ 1000 v¹n, v× vËy nh÷ng kinh nghiÖm thõa cã nh÷ng sè kh«ng bŞ l­ît bá ®i. Ng­¬i muèn chÕ t¹o 'B¾c §Èu Tiªn §¬n' kh«ng?",
				"ChÕ t¹o B¾c §Èu Tiªn §¬n/zhuansheng_makexiandan",
				"T×m hiÓu vÒ ®iÓm kinh nghiÖm/zhuansheng_help_xiandan",
				"Ta muèn t×m hiÓu thªm./zhuansheng_ondialog",
				" KÕt thóc ®èi tho¹i!/OnCancel"
				});
end


function zhuansheng_makexiandan()
	local n_level = GetLevel();
	local n_transcount = ST_GetTransLifeCount();
	if (n_level ~= 199 or n_transcount ~= 0) then
		return
	end
	
	if (GetTask(TSK_ZHUANSHENG_XIANDAN) > 0) then
		CreateTaskSay({"<dec><npc>".."Mçi ng­êi chØ cã thÓ chÕ t¹o 1 B¾c §Èu Tiªn §¬n, c¸c h¹ kh«ng thÓ lµm thÕ.", " KÕt thóc ®èi tho¹i!/OnCancel"});
		return
	end
	
	local n_curexp = GetExp();
	if (n_curexp - ZHUANSHENG_XIANDAN_MINEXP >= ZHUANSHENG_XIANDAN_BASEEXP) then
		local n_addexp = n_curexp - ZHUANSHENG_XIANDAN_MINEXP;
		n_addexp = floor(n_addexp / 10e7) * 10e7;
		CreateTaskSay({"<dec><npc>".."Ng­¬i cã"..n_addexp.." kinh nghiÖm sÏ bŞ chuyÓn vµo tiªn ®¬n. Ng­¬i cã x¸c nhËn muèn chÕ t¹o 'B¾c §Èu Tiªn §¬n'?",
				"§óng råi, ta muèn luyÖn tiªn ®¬n!/zhuansheng_surexiandan",
				"Ta muèn t×m hiÓu thªm./zhuansheng_ondialog",
				" KÕt thóc ®èi tho¹i!/OnCancel"});
	else
		CreateTaskSay({"<dec><npc>".."Theo nh­ c«ng lùc cña c¸c h¹ kh«ng thÓ luyÖn thµnh B¾c §Èu Tiªn §¬n, muèn luyÖn thµnh tiªn ®¬n th× xin h·y luyÖn thªm thêi gian n÷a nhĞ!",
				"Ta muèn t×m hiÓu thªm./zhuansheng_ondialog",
				" KÕt thóc ®èi tho¹i!/OnCancel"});
	end
end


function zhuansheng_surexiandan()
	local n_level = GetLevel();
	local n_transcount = ST_GetTransLifeCount();
	if (n_level ~= 199 or n_transcount ~= 0) then
		return
	end
	
	if (CalcFreeItemCellCount() < 10) then
		CreateTaskSay({"<dec><npc>".."Hµnh trang kh«ng ®ñ 10 «, xin mêi h·y thu dän hµnh lı.", " KÕt thóc ®èi tho¹i!/OnCancel"});
		return
	end
	
	local n_curexp = GetExp();
	if (n_curexp - ZHUANSHENG_XIANDAN_MINEXP >= ZHUANSHENG_XIANDAN_BASEEXP) then
		local n_addexp = n_curexp - ZHUANSHENG_XIANDAN_MINEXP;
		
		local nitemidx = AddItem(6,1,1970,1,1,0);
		if (nitemidx > 0) then

			ReduceOwnExp(n_addexp);
			
			SetSpecItemParam(nitemidx, 1, floor(n_addexp / ZHUANSHENG_XIANDAN_BASEEXP));
			ITEM_SetExpiredTime(nitemidx, ZHUANSHENG_ITEM_EXTIME);	-- ÓĞĞ§ÆÚ30Ìì
			SyncItem(nitemidx);
			SetTask(TSK_ZHUANSHENG_XIANDAN, 1);
			WriteLog(format("[%s]\t%s\tName:%s\tAccount:%s\tMakeSuccess,LEVEL:%d,FACTION:%d,ReduceExp:"..n_addexp..",ItemExp:%d",
						"B¾c §Èu Tiªn §¬n",
						GetLocalDate("%Y-%m-%d %X"),GetName(), GetAccount(),
						GetLevel(), GetLastFactionNumber(), floor(n_addexp / ZHUANSHENG_XIANDAN_BASEEXP)));
			Msg2Player(format("Thu ®­îc 1 %s", "B¾c §Èu Tiªn §¬n"));
		end
	end
	
end


function zhuansheng_help_xiandan()
	CreateTaskSay({"<dec><npc>".."Phµm nh÷ng ng­êi cã cÊp 199 vµ h¬n 2 tû kinh nghiÖm tu luyÖn 'B¾c §Èu Tr­êng Sinh ThuËt' sÏ ®­îc n©ng cao nh÷ng thuéc tİnh, nh­ng nh÷ng kinh nghiÖm thõa ra sÏ bŞ l·ng phİ. V× vËy cã mét ngµy kia ta vµ 1 vŞ Èn sü ph¸t minh ra lo¹i tiªn ®¬n nµy, th«ng qua 'B¾c §Èu Tiªn §¬n' ng­¬i cã thÓ l­u gi÷ nh÷ng kinh nghiÖm cßn thõa ®Ó lóc trïng sinh xong th× cã thÓ sö dông.",
				"Ta muèn t×m hiÓu thªm./zhuansheng_ondialog",
				" KÕt thóc ®èi tho¹i!/OnCancel"});
end


function zhuansheng_time()
	local ntranscount = ST_GetTransLifeCount();
	local n_last_time = GetTask(TSK_ZHUANSHENG_LASTTIME);
	local n_cur_time = GetCurServerTime();
	local n_add_time = n_cur_time - n_last_time;
	
	if (ntranscount == 0) then
		CreateTaskSay({"<dec><npc>".."C¸c h¹ vÉn ch­a häc B¾c §Èu TruyÒn Sinh ThuËt, chØ cÇn ®ñ ®iÒu kiÖn nµy th× cã thÓ chuyÓn sinh ngay lËp tøc.", " KÕt thóc ®èi tho¹i!/OnCancel"})
	else
		if (n_add_time >= TB_TRANSTIME_LIMIT[ntranscount]*24*60*60) then
			CreateTaskSay({"<dec><npc>".."§· ®ñ ®iÒu kiÖn gi·n c¸ch thêi gian chuyÓn sinh, chØ cÇn ®ñ ®iÒu kiÖn th× cã thÓ lËp tøc chuyÓn sinh.", " KÕt thóc ®èi tho¹i!/OnCancel"})
		else
			
			CreateTaskSay({"<dec><npc>"..format("Cßn %d ngµy míi cã thÓ tiÕp tôc chuyÓn sinh.",ceil((TB_TRANSTIME_LIMIT[ntranscount]*24*60*60 - n_add_time) / (24*60*60))), " KÕt thóc ®èi tho¹i!/OnCancel"})
		end
	end
end

