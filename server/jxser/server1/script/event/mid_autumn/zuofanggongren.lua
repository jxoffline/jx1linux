-- zuofanggongren.lua 
-- ×÷·»¹¤ÈË½Å±¾
-- 2005-09-07 by steve

Include("\\script\\event\\mid_autumn\\mooncake_head.lua")
IncludeLib("TIMER")
IncludeLib("RELAYLADDER")


-- ²»Í¬ÀàĞÍÔÂ±ıµÄµÈ´ıÊ±¼ä
tbl_time_wait = {
	[TYPE_SHIJIN		  ] = 600,
	[TYPE_GUOREN		  ] = 300,
	[TYPE_DANHUANGLIANRONG] = 180,
	[TYPE_DANHUANGDOUSHA  ] = 180,
	[TYPE_LIANRONG		  ] = 180,
	[TYPE_DOUSHA		  ] = 180,
};

tbl_finish_stat = {
	[STAT_HUOMIAN_MAKING] = STAT_HUOMIAN_FINISH,	-- ºÍÃæÍê³É
	[STAT_BAOXIAN_MAKING] = STAT_BAOXIAN_FINISH,	-- °üÏÚÍê³É
	[STAT_HONGKAO_MAKING] = STAT_HONGKAO_FINISH,	-- ºæ¿¾Íê³É
};

tbl_making_msg = {
	[STAT_BAOXIAN_MAKING] = "<#> b¾t ®Çu lµm <color=yellow>nh©n b¸nh<color>",
	[STAT_HONGKAO_MAKING] = "<#> B¾t ®Çu <color=yellow>n­íng b¸nh<color>",
};

-- ²»Í¬ÀàĞÍµÄÔÂ±ı
tbl_mooncake = {
	"<#> B¸nh trung thu thËp cÈm ",
	"<#> B¸nh Trung thu H¹nh nh©n",
	"<#> B¸nh trung thu ®Ëu trøng",
	"<#> B¸nh Trung Thu §Ëu Trøng",
	"<#> B¸nh Trung Thu Bét Sen",
	"<#> B¸nh trung thu nh©n ®Ëu ",
};

tbl_mooncake_item = {
	{6, 1, 896, 1, 0, 0, 379}, -- Ê²½õÔÂ±ı,
	{6, 1, 895, 1, 0, 0, 251}, -- ¹ûÈÊÔÂ±ı,
	{6, 1, 894, 1, 0, 0, 188}, -- µ°»ÆÁ«ÈØÔÂ±ı,
	{6, 1, 893, 1, 0, 0, 187}, -- µ°»Æ¶¹É³ÔÂ±ı,
	{6, 1, 892, 1, 0, 0, 186}, -- Á«ÈØÔÂ±ı,
	{6, 1, 891, 1, 0, 0, 185}, -- ¶¹É³ÔÂ±ı,
};

-- ÔÂ±ıÊÇ·ñĞèÒªµ½Ã÷ÔÂÕòÖĞµÄÃ÷ÔÂÀÏÈË´¦»»È¡½±Àø
tbl_mooncake_exchangable = {
	1, -- Ê²½õÔÂ±ı
	1, -- ¹ûÈÊÔÂ±ı
	0, -- µ°»ÆÁ«ÈØÔÂ±ı
	1, -- µ°»Æ¶¹É³ÔÂ±ı
	0, -- Á«ÈØÔÂ±ı
	1, -- ¶¹É³ÔÂ±ı
};

-- ÖÆ×÷²»Í¬ÀàĞÍµÄÔÂ±ıĞèÒªµÄ²ÄÁÏ
tbl_mooncake_material = {
	--µ° ĞÓÈÊ »¨Éú Ò¬Ë¿ Ãæ·Û É°ÌÇ Á«ÈØ ¶¹É³
	{0,	1, 1, 3, 4, 4, 1, 1},	-- Ê²½õÔÂ±ı£º4Ãæ·Û+4É°ÌÇ+¶¹É³+Á«ÈØ+ĞÓÈÊ+»¨Éú+3Ò¬Ë¿
	{0, 1, 2, 0, 6, 6, 0, 0},	-- ¹ûÈÊÔÂ±ı£º6Ãæ·Û+6É°ÌÇ+1ĞÓÈÊ+2»¨Éú
	{2, 0, 0, 0, 5, 6, 2, 0},	-- µ°»ÆÁ«ÈØÔÂ±ı£º5Ãæ·Û+6É°ÌÇ+2Á«ÈØ+2µ°
	{2, 0, 0, 0, 6, 5, 0, 2},	-- µ°»Æ¶¹É³ÔÂ±ı£º6Ãæ·Û+5É°ÌÇ+2¶¹É³+2µ°
	{0, 0, 0, 0, 5, 8, 2, 0},	-- Á«ÈØÔÂ±ı£º5Ãæ·Û+8É°ÌÇ+2Á«ÈØ
	{0, 0, 0, 0, 8, 5, 0, 2},	-- ¶¹É³ÔÂ±ı£º8Ãæ·Û+5É°ÌÇ+2¶¹É³
};

-- È·¶¨ÒªÖÆ×÷ÔÂ±ıµÄ¶Ô»°
tbl_mooncake_talk = {
	"<#> <color=red>B¸nh Trung Thu ThËp CÈm<color> cÇn cã: 4 bét m×, 4 ®­êng c¸t, 1 ®Ëu xanh, 1 gãi bét sen, 1 h¹nh nh©n, 1 ®Ëu phéng, 3 c¬m dõa. Nghe nãi lo¹i c¬m dõa nµy chØ cã ë ph­¬ng Nam th«i, m¾c l¾m ®Êy! NÕu ®· vËy, ta sÏ cÈn  thËn, b¾t ®Çu chø?",
	"<#> <color=red>B¸nh Trung Thu H¹nh nh©n<color> cÇn cã: 6 bét m×, 6 ®­êng c¸t, 1 h¹nh nh©n, 2 ®Ëu phéng. §em mét İt ®Ëu phéng xay cho n¸t sau ®ã ®em bá vµo trong b¸nh trung thu, nh­ vËy míi táa ®­îc h­¬ng th¬m cña b¸nh tõ trong ra. Kh«ng nãi nhiÒu n÷a, b¾t ®Çu chø?",
	"<#> <color=red>B¸nh Trung Thu Sen Trøng<color> cÇn cã: 5 bét m×, 6 ®­êng c¸t, 2 gãi bét sen, 2 trøng. CÇn hai trøng, mét trøng ta dïng lµm nh©n, trøng kia ta b«i lªn bÒ mÆt sau khi n­íng, c¸ch nöa tiÕng b«i lªn mét lÇn. Kh«ng nãi nhiÒu n÷a, b¾t ®Çu chø?",
	"<#> <color=red>B¸nh Trung Thu §Ëu Trøng<color> cÇn cã: 6 bét m×, 5 ®­êng c¸t, 2 ®Ëu xanh, 2 trøng. Ng­¬i biÕt kh«ng vËy? CÇn hai trøng, mét trøng ta dïng lµm nh©n, trøng kia ta b«i lªn bÒ mÆt sau khi n­íng, c¸ch nöa tiÕng b«i lªn mét lÇn. Kh«ng nãi nhiÒu n÷a, b¾t ®Çu chø?",
	"<#> <color=red>B¸nh Trung Thu Bét Sen<color> cÇn cã: 5 bét m×, 8 ®­êng c¸t, 2 gãi bét sen. Bİ quyÕt lµ ph¶i ®em nhôy cña h¹t sen bá ®i sau ®ã xay thµnh bét sen, ®ång thêi ph¶i trén ®Òu víi ®­êng c¸t, nh­ vËy míi lµm ra ®­îc b¸nh ngon. Kh«ng nãi nhiÒu n÷a, b¾t ®Çu chø?",
	"<#> <color=red>B¸nh Trung Thu §Ëu Xanh<color> cÇn cã: 8 bét m×, 5 ®­êng c¸t, 2 ®Ëu xanh. §õng xem th­êng lo¹i b¸nh trung thu nµy, nh­ng muèn lµm ngon ph¶i cã bİ quyÕt ®ã, nh­ ®Ëu xanh ch¼ng h¹n sau khi ng©m xong ph¶i bá vá míi xay n¸t, nh­ vËy sÏ cã vŞ ngon. Kh«ng nãi nhiÒu n÷a, b¾t ®Çu chø?",
};

-- ²»Í¬ÔÂ±ı×´Ì¬µÄ¶Ô»°
tbl_maketalk = {
	-- ºÍÃæÍê³É
	[STAT_HUOMIAN_FINISH] = {
		"<#> Bét ®· ®¸nh xong, b©y giê b¾t ®Çu lµm nh©n, cÇn mét İt thêi gian, cã thÓ nhê ng­¬i phô ®Êy, v× vËy trong lóc lµm nh©n ng­¬i ®õng rêi khái Minh NguyÖt trÊn, sau khi xong ta sÏ th«ng b¸o cho ng­¬i. Sau khi nghe ta gäi th× lËp tøc ®Õn ®©y, nguyªn liÖu ®Ó l©u sÏ bŞ háng!",
		"<#> Ta biÕt råi! B¾t ®Çu ®i!/keep_making_mooncake",
		"<#> L¸t n÷a ta sÏ quay l¹i!/cancel"},
	-- °üÏÚÍê³É
	[STAT_BAOXIAN_FINISH] = {
		"<#> Nh©n ®· lµm xong råi, qua giai ®o¹n n­íng ®©y, cÇn mét İt thêi gian, cã thÓ nhê sù gióp ®ì cña ng­¬i, trong thêi gian nµy ng­¬i ®õng nªn rêi khái Minh NguyÖt trÊn, xong ta sÏ th«ng b¸o cho ng­¬i, nhí ®Êy khi nghe ta gäi ph¶i lËp tøc ®Õn ngay kh«ng th× khĞt b¸nh ®ã!",
		"<#> Ta biÕt råi! B¾t ®Çu ®i!/keep_making_mooncake",
		"<#> L¸t n÷a ta sÏ quay l¹i!/cancel"},
};


tbl_stoptalk = {
	-- ÕıÔÚºÍÃæ
	[STAT_HUOMIAN_MAKING] = {
		"<#> NÕu vËy ta b¾t ®Çu pha bét ®©y, cÇn mét İt thêi gian, cã thÓ nhê ng­¬i phô ®Êy, v× vËy trong lóc lµm nh©n ng­¬i ®õng rêi khái Minh NguyÖt trÊn, sau khi xong ta sÏ th«ng b¸o cho ng­¬i. Sau khi nghe ta gäi th× mau lËp tøc ®Õn ®©y, nguyªn liÖu ®Ó l©u sÏ bŞ háng!",
		"<#> Ta biÕt råi! B¾t ®Çu ®i!/resume_making_mooncake",
		"<#> L¸t n÷a ta sÏ quay l¹i!/cancel"},
	-- ÕıÔÚ°üÏÚ
	[STAT_BAOXIAN_MAKING] = {
		"<#> Bét ®· ®¸nh xong, b©y giê b¾t ®Çu lµm nh©n, cÇn mét İt thêi gian, cã thÓ nhê ng­¬i phô ®Êy, v× vËy trong lóc lµm nh©n ng­¬i ®õng rêi khái Minh NguyÖt trÊn, sau khi xong ta sÏ th«ng b¸o cho ng­¬i. Sau khi nghe ta gäi th× lËp tøc ®Õn ®©y, nguyªn liÖu ®Ó l©u sÏ bŞ háng!",
		"<#> Ta biÕt råi! B¾t ®Çu ®i!/resume_making_mooncake",
		"<#> L¸t n÷a ta sÏ quay l¹i!/cancel"},
	-- ÕıÔÚºæ¿¾
	[STAT_HONGKAO_MAKING] = {
		"<#> Nh©n ®· lµm xong råi, qua giai ®o¹n n­íng ®©y, cÇn mét İt thêi gian, cã thÓ nhê sù gióp ®ì cña ng­¬i, trong thêi gian nµy ng­¬i ®õng nªn rêi khái Minh NguyÖt trÊn, xong ta sÏ th«ng b¸o cho ng­¬i, nhí ®Êy khi nghe ta gäi ph¶i lËp tøc ®Õn ngay kh«ng th× khĞt b¸nh ®ã!",
		"<#> Ta biÕt råi! B¾t ®Çu ®i!/resume_making_mooncake",
		"<#> L¸t n÷a ta sÏ quay l¹i!/cancel"},
};

-- ²½ÖèÃû³Æ
tbl_stepname = {
	[STAT_HUOMIAN_MAKING] = "<#> Pha bét",	-- ÕıÔÚºÍÃæ
	[STAT_BAOXIAN_MAKING] = "<#> Lµm nh©n",	-- ÕıÔÚ°üÏÚ
	[STAT_HONGKAO_MAKING] = "<#> N­íng",	-- ÕıÔÚºæ¿¾
};

tbMOONCAKE_LADDERID = {
				{ 10189, 40 },
				{ 10190, 41 },
				{ 10191, 42 },
				{ 10192, 43 },
				{ 10193, 44 },
				{ 10194, 45 },
}


function resume_making_mooncake()
	TM_ResumeTimer(TIMER_MOONCAKE)
	
end

-- È·¶¨ÒªÖÆ×÷µÄÔÂ±ıÀàĞÍ
function confirm_mooncake(ltype)
	Say(tbl_mooncake_talk[ltype], 2,
		"§óng råi./" .. format("#make_mooncake(%d)", ltype),
		"Kh«ng! §Ó ta suy nghÜ l¹i!/cancel")
end

-- ¶Ô»°£ºÖÆ×÷ÔÂ±ı
function talk_makemooncake()
	local caption = "<#> Thî b¸nh: X­ëng chóng ta cã bİ quyÕt lµm b¸nh riªng cã thÓ t¹o ra nh÷ng chiÕc b¸nh hîp khÈu vŞ ng­êi khã tİnh nhÊt. ng­¬i muèn lµm b¸nh trung thu lo¹i nµo?"
	Say(caption,
		7,
		"<#> Ta muèn lµm B¸nh Trung Thu §Ëu Xanh/" .. format("#confirm_mooncake(%d)", TYPE_DOUSHA),
		"<#> Ta muèn lµm B¸nh Trung Thu Bét Sen/" .. format("#confirm_mooncake(%d)", TYPE_LIANRONG),
		"<#> Ta muèn lµm B¸nh Trung Thu §Ëu Trøng/" .. format("#confirm_mooncake(%d)", TYPE_DANHUANGDOUSHA),
		"<#> Ta muèn lµm B¸nh Trung Thu Sen Trøng/" .. format("#confirm_mooncake(%d)", TYPE_DANHUANGLIANRONG),
		"<#> Ta muèn lµm B¸nh Trung Thu H¹nh nh©n/" .. format("#confirm_mooncake(%d)", TYPE_GUOREN),
		"<#> Ta muèn lµm B¸nh Trung Thu ThËp CÈm/" .. format("#confirm_mooncake(%d)", TYPE_SHIJIN),
		"<#> Ta chØ ®i d¹o th«i/cancel")
end

-- ¶Ô»°£º¼ì²éÔÂ±ıÖÆ×÷×´Ì¬
function talk_querymooncake(varv)
	local ltype = floor(varv / 1000)	-- ÔÂ±ıÀàĞÍ
	local stat = mod(varv, 1000)	-- ÔÂ±ı×´Ì¬
	name = tbl_mooncake[ltype]
	-- ÔÂ±ı¿¾½¹ÁË
	if (stat == STAT_PARCHED or stat == STAT_HUOMIAN_PARCHED) then
		Say("<#> ThËt xin lçi vŞ kh¸ch quan nµy, ta thÊy ng­¬i l©u qu¸ ch­a ®Õn ®· lµm khĞt b¸nh råi!",
			1,
			"<#> NhËn b¸nh trung thu bŞ khĞt/#take_parched_mooncake("..stat..")")
	-- ÔÂ±ı×öºÃÁË
	elseif (stat == STAT_HONGKAO_FINISH) then
		close_hint()
		local caption = ""
		if (tbl_mooncake_exchangable[ltype] == 1) then
			caption = "<#> VŞ kh¸ch quan nµy, <color=red>" .. tbl_mooncake[ltype] .. "<color> ®· lµm xong råi, cã th¬m kh«ng vËy? Mau th­ëng thøc xem! Nghe ®©u trong thŞ trÊn cã vŞ Minh NguyÖt l·o nh©n thİch ¨n b¸nh trung thu l¾m, ng­¬i ®em ®Õn cho «ng ta ®i biÕt ®©u cã tÆng phÈm bÊt ngê!"
		else
			caption = "<#> VŞ kh¸ch quan nµy, <color=red>" .. tbl_mooncake[ltype] .. "<color> ®· ®­îc lµm xong, th¬m kh«ng vËy? Mau th­ëng thøc ®i nµo!"
		end
		Say(caption, 1, "<#> NhËn b¸nh trung thu/" .. format("#take_mooncake(%d)", ltype))
	elseif (tbl_stoptalk[stat] ~= nil) then		-- ÖÆ×÷ÖĞ
		-- ÔİÍ£
		if (TM_IsTimerSuspending(TIMER_MOONCAKE) == 1) then
			Say(tbl_stoptalk[stat][1], 2, tbl_stoptalk[stat][2], tbl_stoptalk[stat][3])
		-- ÔÂ±ıÖÆ×÷ÖĞ
		else
			local talk = "<#> VŞ kh¸ch quan nµy ®õng gÊp, <color=red>" .. tbl_mooncake[ltype] .. "<color> cßn ®ang <color=red>" .. tbl_stepname[stat] .. "<color>, sau khi xong giai ®o¹n nµy ta sÏ th«ng b¸o cho!"
			Talk(1, "", talk)
		end
	elseif (tbl_maketalk[stat] ~= nil) then		-- ²½ÖèÍê³É
		close_hint()
		-- ÔİÍ£¼ÆÊ±
		TM_SuspendTimer(TIMER_MOONCAKE)
		Say(tbl_maketalk[stat][1], 2, tbl_maketalk[stat][2], tbl_maketalk[stat][3])
	else
		print("MOONCAKE: something is wrong!!!")
	end
end

-- ¼ÆËãµ±Ç°²½ÖèĞèÒªµÄÖÆ×÷Ê±¼ä
function get_make_time()
	return random(30, 60)
end

-- ÏûºÄÍæ¼ÒÉíÉÏµÄÔÂ±ıÔ­ÁÏ
function consume_material(ltype)
	local material_list = tbl_mooncake_material[ltype]
	-- ¼ì²éÔ­ÁÏÊÇ·ñ³ä×ã
	for i = 1, getn(material_list) do
		local want_count = material_list[i]
		local material_item = tbl_material[i]
		if (want_count ~= 0) then
			local curr_count = CalcEquiproomItemCount(material_item[2], material_item[3], 1, -1)
			if (curr_count < want_count) then
				Talk(1, "", "<#> VŞ kh¸ch quan nµy, nguyªn liÖu trªn ng­êi ng­¬i kh«ng ®ñ, ®îi t×m ®ñ nguyªn liÖu råi h·y ®Õn!")
				return 0
			end
		end
	end
	-- ÏûºÄÔ­ÁÏ
	for i = 1, getn(material_list) do
		local want_count = material_list[i]
		local material_item = tbl_material[i]
		if (want_count ~= 0) then
			ConsumeEquiproomItem(want_count, material_item[2], material_item[3], 1, -1)
		end
	end
	return 1
end

-- ¿ªÊ¼ÖÆ×÷ÔÂ±ı
function make_mooncake(ltype)
	if (consume_material(ltype) == 1) then
		local varv = ltype * 1000 + STAT_HUOMIAN_MAKING
		nt_setTask(VARV_MOONCAKE, varv)
		-- DEBUG
		--print(format("make_mooncake: nt_setTask(%d, %d)", VARV_MOONCAKE, varv))
		local resttime = get_make_time()
		TM_SetTimer(resttime * 18,
			TIMER_MOONCAKE,
			1,	-- ¶¨Ê±Æ÷Ö»Ö´ĞĞÒ»´Î 
			2);	-- ¼ÆÊ±ÒÔÍæ¼ÒÔÚÏßÊ±¼äÎª×¼
		-- DEBUG
		--print(format("TM_SetTimer(%d, %d, %d, %d)", resttime * 18, TIMER_MOONCAKE, 1, 2))
		TM_SuspendTimer(TIMER_MOONCAKE)
		
		Say("<#> NÕu vËy ta b¾t tay <color=red>pha bét<color>, cÇn mét İt thêi gian, cã thÓ nhê ng­¬i phô ®Êy, v× vËy trong lóc lµm nh©n ng­¬i ®õng rêi khái Minh NguyÖt trÊn, sau khi xong ta sÏ th«ng b¸o cho ng­¬i. Sau khi nghe ta gäi th× lËp tøc ®Õn ®©y, nguyªn liÖu ®Ó l©u sÏ bŞ háng!",
			2,
			"<#> Ta biÕt råi! B¾t ®Çu ®i!/resume_mooncake",
			"<#> L¸t n÷a ta sÏ quay l¹i!/cancel")
	end
end

-- »Ö¸´ÖÆ×÷ÔÂ±ı
function resume_mooncake()
	Msg2Player("<#> B©y giê b¾t ®Çu <color=yellow>pha bét <color>®©y!")
	TM_ResumeTimer(TIMER_MOONCAKE)
end

-- ¼ÌĞøÖÆ×÷ÔÂ±ı
function keep_making_mooncake()
	local varv = GetTask(VARV_MOONCAKE)
	local ltype = floor(varv / 1000)
	local stat = mod(varv, 1000)
	if (stat < STAT_MAX) then
		stat = stat + 1
		nt_setTask(VARV_MOONCAKE, ltype * 1000 + stat)
		
		if (tbl_making_msg[stat] ~= nil) then
			Msg2Player(tbl_making_msg[stat])
		end
	
		local nExp = makecake_addexp(GetLevel(), 0.20)
		if (nExp ~= 0 and nExp ~= nil) then
			AddOwnExp(nExp)
		end
		-- DEBUG
		--print(format("keep_making_mooncake: nt_setTask(%d, %d)", VARV_MOONCAKE, ltype * 1000 + stat))
		
		TM_SetTimer(get_make_time() * 18,
			TIMER_MOONCAKE,
			1,	-- ¶¨Ê±Æ÷Ö»Ö´ĞĞÒ»´Î 
			2);	-- ¼ÆÊ±ÒÔÍæ¼ÒÔÚÏßÊ±¼äÎª×¼
	end
end

-- ÁìÈ¡¿¾½¹µÄÔÂ±ı
function take_parched_mooncake(stat)
	local varv = GetTask(VARV_MOONCAKE)
	local lstat = mod(varv, 1000)		-- ÔÂ±ı×´Ì¬
	if (lstat == STAT_HUOMIAN_PARCHED or lstat == STAT_PARCHED) then
		nt_setTask(VARV_MOONCAKE, 0)
		AddItem(6,1,890,1,0,0)
		Msg2Player("<#> ng­¬i nhËn ®­îc mét b¸nh trung thu n­íng xong")
		CastSkill(358, 1)
		local nExp = 0;
		if (stat == STAT_PARCHED) then
			nExp = makecake_addexp(GetLevel(), 0.20)
		else
			nExp = makecake_addexp(GetLevel(), 0.10)
		end
		if (nExp ~= 0 and nExp ~= nil) then
			AddOwnExp(nExp)
		end
	end
end

-- ÁìÈ¡×öºÃµÄÔÂ±ı
function take_mooncake(ltype)
	local varv = GetTask(VARV_MOONCAKE)
	local stat = mod(varv, 1000)		-- ÔÂ±ı×´Ì¬
	local type = floor(varv / 1000)		-- ÔÂ±ıÀàĞÍ
	if (type == ltype and stat == STAT_HONGKAO_FINISH) then
		nt_setTask(VARV_MOONCAKE, 0)
		local cakename = tbl_mooncake[ltype]
		local item = tbl_mooncake_item[ltype]
		AddItem(item[1], item[2], item[3], item[4], item[5], item[6])
		Msg2Player("<#> B¹n nhËn ®­îc mét <color=yellow>" .. cakename .. "<color>")
		if (ltype == 1) then
			AddGlobalNews("<#> Chóc mõng ng­êi ch¬i"..GetName().."<#> lµm ®­îc B¸nh Trung Thu ThËp CÈm")
		end
		ladder_mooncake_ladder(ltype)
		local nExp = makecake_addexp(GetLevel(), 0.60)
		if (nExp ~= 0 and nExp ~= nil) then
			AddOwnExp(nExp)
		end
		WriteLog(date("%y-%m-%d,%H:%M,") .. GetAccount() .. "(".. GetName().. ") get a " .. cakename)
		CastSkill(item[7],1)
	end
end

-- ÖÆ×÷Íê³ÉµÄÏìÓ¦º¯Êı
function timeout_make(ltype, stat)
	local finish_stat = tbl_finish_stat[stat];
	-- DEBUG
	--print(format("Msg2Player(%s)", tbl_notice[finish_stat]))
	Msg2Player(tbl_notice[finish_stat])

	-- µ±Ç°½×¶ÎÍê³ÉÁË£¬µÈ´ıÍæ¼ÒÖ´ĞĞÏÂÒ»²½Öè
	-- DEBUG
	--print(format("timeout_make(%d, %d)", ltype, stat))
	nt_setTask(VARV_MOONCAKE, ltype * 1000 + finish_stat)
	-- DEBUG
	--print(format("timeout_make: nt_setTask(%d, %d)", VARV_MOONCAKE, ltype * 1000 + finish_stat))
	TM_SetTimer(tbl_time_wait[ltype] * 18,
		TIMER_MOONCAKE,
		1,	-- ¶¨Ê±Æ÷Ö»Ö´ĞĞÒ»´Î 
		2);	-- ¼ÆÊ±ÒÔÍæ¼ÒÔÚÏßÊ±¼äÎª×¼
	-- Æô¶¯ÌáĞÑÁìÈ¡ÔÂ±ıµÄ¶¨Ê±Æ÷
	start_hint()
end

-- µÈ´ı³¬Ê±µÄÏìÓ¦º¯Êı
function timeout_wait(ltype, stat)
	close_hint()
	-- µÈ´ıµÄÊ±¼äµ½ÁË£¬Íæ¼Ò»¹Ã»ÓĞÖ´ĞĞÏÂÒ»²½ÔòÔÂ±ı¿¾½¹
	if (stat == STAT_HONGKAO_FINISH ) then
		--yuebing guoshi 
		nt_setTask(VARV_MOONCAKE, ltype * 1000 + STAT_PARCHED)
		-- DEBUG
		--print(format("timeout_wait: nt_setTask(%d, %d)", VARV_MOONCAKE, ltype * 1000 + STAT_PARCHED))
	else
		nt_setTask(VARV_MOONCAKE, ltype * 1000 + STAT_HUOMIAN_PARCHED)
		-- DEBUG
		--print(format("timeout_wait: nt_setTask(%d, %d)", VARV_MOONCAKE, ltype * 1000 + STAT_HUOMIAN_PARCHED))
	end

end

-- ²»Í¬×´Ì¬µÄ¶¨Ê±Æ÷
tbl_timer = {
	[STAT_HUOMIAN_MAKING] = timeout_make,	-- ÕıÔÚºÍÃæ
	[STAT_HUOMIAN_FINISH] = timeout_wait,	-- ºÍÃæÍê³É
	[STAT_BAOXIAN_MAKING] = timeout_make,	-- ÕıÔÚ°üÏÚ
	[STAT_BAOXIAN_FINISH] = timeout_wait,	-- °üÏÚÍê³É
	[STAT_HONGKAO_MAKING] = timeout_make,	-- ÕıÔÚºæ¿¾
	[STAT_HONGKAO_FINISH] = timeout_wait,	-- ºæ¿¾Íê³É
};

-- ¶¨Ê±Æ÷
function OnTimer()
	local varv = GetTask(VARV_MOONCAKE)
	local ltype = floor(varv / 1000)
	local stat = mod(varv, 1000)
	if (ltype >= TYPE_MIN and
		ltype <= TYPE_MAX and
		stat >= STAT_MIN and
		stat <= STAT_MAX) then
		timer = tbl_timer[stat]
		if (timer ~= nil) then
			timer(ltype, stat)
		end
	end
end

-- °ïÖúËµÃ÷
function about_mooncake(step)
	if (step == 1) then
		Talk(1,"#about_mooncake(2)","<#> Thî b¸nh: Lµm b¸nh trung thu cÇn tiÕn hµnh <color=red>3<color> giai ®o¹n. Chän lo¹i h×nh b¸nh trung thu cÇn lµm, chuÈn bŞ ®ñ c¸c thø nguyªn liÖu, c¸c b­íc ®­îc tiÕn hµnh nh­ sau: <color=red>'Pha bét<color>', <color=red>'Lµm nh©n'<color>, <color=red>'N­íng'<color>. Qua ba giai ®o¹n trªn hoµn thµnh b¸nh trung thu.")
	elseif (step == 2) then
		Talk(1, "#about_mooncake(3)","<#> Mçi mét giai ®o¹n ®Òu cã mét thêi gian lµm nhÊt ®Şnh, sau mçi giai ®o¹n lµm xong, sÏ cã h¹n sö dông (Lµm ra b¸nh cµng ngon th× b¶o qu¶n ®­îc cµng l©u) , <color=red>cÊp 50 vµ cÊp 50 trë lªn <color>ng­êi ch¬i sau khi tr¶i qua mçi giai ®o¹n lµm sÏ nhËn ®­îc ®iÓm kinh nghiÖm nhÊt ®Şnh.")
	elseif (step == 3) then
		Talk(1, "","<#> NÕu trong thêi gian lµm, ch­a tr¶i qua giai ®o¹n tiÕp theo hoÆc nhËn b¸nh, th× xem nh­ thÊt b¹i, chØ nhËn ®­îc <color=red>b¸nh trung thu bŞ khĞt<color>.")

	end
end

function main()
	local varv = GetTask(VARV_MOONCAKE)
	-- DEBUG
	--print(format("GetTask(%d):%d", VARV_MOONCAKE, varv))
	if (varv == 0) then
		local caption = "<#> B¸nh ë Minh NguyÖt trÊn næi tiÕng kh¾p n¬i. B¸nh trung thu chóng ta lµm ra b¶o ®¶m khÈu vŞ th¬m ngon. VŞ kh¸ch quan nµy cã mua kh«ng?"
		Say(caption,
			3,
			"<#> Ta muèn lµm mét vµi b¸nh trung thu/talk_makemooncake",
			"<#> Liªn quan ®Õn viÖc lµm b¸nh trung thu/#about_mooncake(1)",
			"<#> §Ó ta suy nghÜ l¹i!/cancel")
	else
		talk_querymooncake(varv)
	end
end

function makecake_addexp(level, percent)
	if ( percent == nil or percent == 0 ) then
		return 0
	end
	local ratio = random( 15, 20 ) * percent ;
	local nExp = 0;
	if ( level == 50 ) then
		nExp = floor( 700 * ratio )
	elseif ( level > 50 and level < 100 ) then
		nExp = floor(( 700 + floor((level - 50)/5) * 100) * ratio )
	elseif ( level > 100 ) then
		nExp = floor( 1700 * ratio )
	else
		nExp = 0
	end
	return nExp
end

function nt_setTask(taskid, value)
	SetTask(taskid, value)
	SyncTaskValue(taskid) -- Í¬²½µ½¿Í»§¶Ë
end

	
function ladder_mooncake_ladder(ltype)
	local RoleName = "";
	local Data = "";
	local mooncake_data = 0;
	local mapid = SubWorldIdx2ID(SubWorld);
	local ladderid = tbMOONCAKE_LADDERID[ltype][1]
	local glbvalueid = tbMOONCAKE_LADDERID[ltype][2]
	
	SetGlbValue(glbvalueid, GetGlbValue(glbvalueid) + 1)
	if (ltype == 4 or ltype == 5 or ltype == 6 ) then
		if ( GetGlbValue(glbvalueid) ~= 5) then
			return
		end
	end
	
	for i = 1, 10 do
		RoleName, Data = Ladder_GetLadderInfo(ladderid, i);
		if ( RoleName == tostring(mapid) ) then
			mooncake_data = tonumber(Data)
			break
		end
	end
	
	if (mooncake_data == "" or mooncake_data == nil) then
		mooncake_data = 0
	end
	
	Ladder_NewLadder(ladderid, tostring(mapid), mooncake_data + GetGlbValue(glbvalueid), 1)
	SetGlbValue(glbvalueid, 0)
end
	
	
