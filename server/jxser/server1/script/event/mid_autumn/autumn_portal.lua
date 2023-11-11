-- Ã÷ÔÂÕòÈë¿Ú ÎäÁÖÃË´«ÈË´¦
-- lixin 2005-9-7

--ÎäÁÖÃË´«ÈË	
WULINMENG_NPC = "<#><link=image[0,1]:\\spr\\npcres\\passerby\\passerby092\\passerby092_st.spr>Vâ l©m truyÒn nh©n<link>"


tab_city = {
{1,520,1601,3269, "<#> Ph­îng T­êng phñ "},
{11,521,1601,3269, "<#> Thµnh §« phñ "},
{37,522,1601,3269, "<#> BiÖn Kinh phñ "},
{78,523,1601,3269, "<#> T­¬ng D­¬ng phñ "},
{80,524,1601,3269, "<#> D­¬ng Ch©u phñ "},
{162,525,1601,3269, "<#> §¹i Lı phñ "},
{176,526,1601,3269, "<#> L©m An phñ "},
}

startdate = 05091618
enddate = 05091824

function mid_autumn_main()
	local nDay = tonumber(GetLocalDate("%y%m%d"))
	local mid_sdate = floor(startdate / 100)
	local mid_edate = floor(enddate / 100)
	if ( nDay >= mid_sdate and nDay <= mid_edate ) then
		Describe(WULINMENG_NPC.."<#> §­êng gia b¶o ë Ba Thôc gÇn ®©y ®· cã nh÷ng biÓu hiÖn trë mÆt víi Vâ l©m! §éc C« minh chñ muèn tæ chøc mét héi thi lµm b¸nh ë Minh NguyÖt trÊn nh»m t×m hiÓu thùc h­ cña §­êng m«n! Xem ra lÇn nµy lµnh İt d÷ nhiÒu. Cã nhiÒu cao thñ sÏ xuÊt hiÖn. C¸c ng­¬i ®Õn ®ã tham gia nhí ph¶i hÕt søc thËn träng!", 4, "<#> Ta biÕt råi!, ®­a ta ®Õn Minh NguyÖt trÊn nhĞ./autumn_enter", "<#> Ta muèn ®Õn chç ®¹i héi hoa ®¨ng /lantern_enter", "<#> Liªn quan vÒ ho¹t ®éng hç trî trung thu /autumn_help","<#> §Ó ta suy nghÜ l¹i!/cancel");
	else
		Describe(WULINMENG_NPC.."<#> §­êng gia b¶o ë Ba Thôc gÇn ®©y ®· cã nh÷ng biÓu hiÖn trë mÆt víi Vâ l©m! §éc C« minh chñ muèn tæ chøc mét héi thi lµm b¸nh ë Minh NguyÖt trÊn nh»m t×m hiÓu thùc h­ cña §­êng m«n! Xem ra lÇn nµy lµnh İt d÷ nhiÒu. Cã nhiÒu cao thñ sÏ xuÊt hiÖn. C¸c ng­¬i ®Õn ®ã tham gia nhí ph¶i hÕt søc thËn träng!", 2, "<#> Ta biÕt råi!, ®­a ta ®Õn Minh NguyÖt trÊn nhĞ./autumn_enter", "<#> §Ó ta suy nghÜ l¹i!/cancel");
	end
end;


function autumn_enter()
	local nDate = tonumber(date("%y%m%d%H"));
	local nCount = getn(tab_city);
	local cityid = 0;

	for i=1,nCount do
		if( SubWorldIdx2ID( SubWorld ) == tab_city[i][1] ) then
			cityid = i
			break
		end;
	end;
	if ( GetPlayerCount() >=700 or cityid <= 0 ) then
		Describe(WULINMENG_NPC..tab_city[cityid][5].."<#> Tõ ®Êy ®Õn Minh NguyÖt trÊn rÊt nguy hiÓm! Hay lµ ng­¬i d0i tõ thµnh thŞ kh¸c vµo ®ã nhĞ!", 1, "<#> VËy còng ®­îc! C¶m ¬n!/cancel");
		return
	end
	NewWorld(tab_city[cityid][2],tab_city[cityid][3],tab_city[cityid][4]);
	SetFightState(0);
	if(nDate >= startdate and nDate <= enddate) then
		Say("<#> C¸c khu vùc tæ chøc héi Hoa §¨ng lµ: Hoa S¬n, Thanh Thµnh s¬n, Vò Di s¬n, §iÓm Th­¬ng s¬n vµ Minh NguyÖt trÊn.Tõ ngµy ®Õn ngµy, mçi ngµy tõ 18:00-24:00, b¹n cã thÓ ®Õn ®ã ng¾m hoa ®¨ng, th­ëng nguyÖt, tham gia c¸c ho¹t ®éng vµ nhËn th­ëng.",0)
	end
end

function autumn_help()
	Describe(WULINMENG_NPC.."<#> Ho¹t ®éng trung thu lÇn nµy bao gåm c¶ <color=red>thi lµm b¸nh t¹i Minh NguyÖt trÊn<color>. Tõ <color=red>Ngµy 16 th¸ng 9 ®Õn ngµy 18 th¸ng 9, mçi ngµy tõ 18:00-24:00<color>, c¶ 4 khu vùc ®Òu më héi <color=red>hoa ®¨ng<color>. Ng­¬i muèn ®Õn khu vùc nµo?", 3, "<#> Liªn quan vÒ Ho¹t ®éng 'Hoa §¨ng' Trung thu /huadeng_help","<#> Liªn quan ®Õn ho¹t ®éng lµm b¸nh trung thu /yuebing_help","<#> Ta ®· biÕt råi /cancel");
end;

function huadeng_help()
	Describe(WULINMENG_NPC.."<#> Tõ <color=red>ngµy 16 th¸ng 9 ®Õn 18 th¸ng 9, mçi ngµy 18:00-24:00 <color>, <color=yellow>Thanh Thµnh s¬n<color>, <color=yellow>Vò Di s¬n<color>, <color=yellow>§iÓm Th­¬ng s¬n<color>, <color=yellow>Hoa S¬n<color> sÏ ®ång lo¹t më héi hoa ®¨ng. ChØ cÇn b¹n <color=red>liªn tôc ®¸p d®óng 3 c©u ®è<color> sÏ nhËn ®­îc phÇn th­ëng. Mçi ngµy chØ cã <color=red>100 phÇn th­ëng<color>!",1,"<#> Ta ®· biÕt råi /cancel")
end

function yuebing_help()
	Describe(WULINMENG_NPC.."<#> Trong thêi gian tõ 16/9 ®Õn 30/9 mäi ng­êi cã thÓ nhê Vâ L©m TruyÒn Nh©n ®­a vµo Minh NguyÖt trÊn, sau ®ã t×m c¸c <color=red>Thî b¸nh<color> ®Ó t×m hiÓu quy t¾c lµm b¸nh. §ång thêi mçi ngµy tõ <color=red>9:00-24:00<color> t¹i 7 thµnh thŞ sÏ cã Hµnh C­íc th­¬ng nh©n trao ®æi c¸c nguyªn liÖu lµm b¸nh!",1,"<#> Trang kÕ /yuebing_help2")
end

function yuebing_help2()
	Describe(WULINMENG_NPC.."<#> Lµm b¸nh trung thu gåm 3 b­íc: <color=red>'nhµo bét' <color>, <color=red>'lµm nh©n b¸nh'<color>, <color=red>'n­íng b¸nh'<color>, mçi kh©u cã mét thêi gian nhÊt ®Şnh, hoµn thµnh mçi kh©u b¹n sÏ ®­îc th«ng b¸o ®Õn b­íc kÕ tiÕp, nÕu v­ît qu¸ thêi gian, sÏ bŞ thÊt b¹i. NÕu b¹n lµm thµnh c«ng <color=red>B¸nh trung thu ThËp cÈm<color>, <color=red>B¸nh trung thu H¹nh nh©n<color>, <color=red>B¸nh trung thu ®Ëu trøng<color>, <color=red>B¸nh trung thu nh©n ®Ëu<color> cã thÓ mang ®Õn Minh NguyÖt trÊn t×m <color=red>Minh NguyÖt L·o nh©n<color> ®æi th­ëng!",1,"<#> KÕt thóc ®èi tho¹i!/cancel")
end

function lantern_enter()
	Describe(WULINMENG_NPC.."<#> §¹i héi trung thu hoa ®¨ng ®­îc tæ chøc ë 4 khu vùc: Thanh Thµnh s¬n, Vò Di s¬n, §iÓm Th­¬ng s¬n, Hoa S¬n. Ng­¬i thİch ®Õn khu nµo?",5, "<#> Thanh Thµnh s¬n/#lantern_enter_lantern(21)", "<#> Vò Di s¬n/#lantern_enter_lantern(193)", "<#> §iÓm Th­¬ng s¬n/#lantern_enter_lantern(167)", "<#> Hoa S¬n/#lantern_enter_lantern(2)", "<#> KÕt thóc ®èi tho¹i!/cancel")
end

tbLANTERN_ENTER_POS = {
		[2] = { 	--huashan
			{ 2287 ,4092 },
			{ 2595, 3501 },
			{ 2546, 3618 },
			{ 2360, 3758 },
			{ 2332, 3912 },
			{ 2355, 4045 },
			{ 2428, 4054 },
			{ 2525, 4052 },
			{ 2290, 4087 },
			{ 2546, 4035 },
		 },
		[21] = { 	--qingchengshan
			{ 2621, 4501 },
			{ 2577, 3292 },
			{ 2387, 3706 },
			{ 2561, 3313 },
			{ 2365, 4016 },
			{ 2735, 3965 },
			{ 2542, 3915 },
			{ 2270, 3842 },
			{ 2830, 3700 },
			{ 2049, 4107 },
		 },
		[167] = { 	--diancangshan
			{ 1606, 3214 },
			{ 1373, 2532 },
			{ 1689, 2620 },
			{ 1430, 2692 },
			{ 1617, 2738 },
			{ 1216, 2805 },
			{ 1586, 2850 },
			{ 1430, 2950 },
			{ 1671, 3034 },
			{ 1517, 3215 },
		 },
		[193] = { 	--wuyishan
			{ 1937, 2851},
			{ 1071, 2843 },
			{ 1130, 3074 },
			{ 1113, 2641 },
			{ 1447, 3243 },
			{ 1808, 2705 },
			{ 1513, 2497 },
			{ 1213, 2565 },
			{ 1431, 2776 },
			{ 1310, 2435 },
		 },
}

function lantern_enter_lantern(area)
	local tb_enter_pos = tbLANTERN_ENTER_POS[area]
	if ( tb_enter_pos ~= nil ) then
		local randnum = random( getn( tb_enter_pos ) )
		NewWorld(area, tb_enter_pos[randnum][1], tb_enter_pos[randnum][2])
		SetFightState(1)
	end
end



function cancel()
end
	