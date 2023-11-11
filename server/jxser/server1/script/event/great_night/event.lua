Include("\\script\\lib\\gb_taskfuncs.lua")
Include("\\script\\event\\great_night\\lantern\\create_lanterns.lua")
Include("\\script\\event\\great_night\\huangzhizhang\\event.lua")
DescLink_LiGuan = "<#><link=image[0,13]:\\spr\\npcres\\passerby\\passerby181\\passerby181_pst.spr>LÔ quan:<link>"

Great_Night_DiaStr = {
	"§ªm Huy Hoµng",
	format("%s Huy chi ch­¬ng b¾t ®Çu lóc 12h00 mçi ngµy. Vâ L©m Minh Chñ sÏ tËn t©m gieo trång nh÷ng h¹t huy hoµng. Sau 5 phót, c¸c vÞ vâ l©m nh©n sü cã thÓ b¾t ®Çu h¸i nh÷ng qu¶ huy hoµng chÝn nµy, ¨n vµo c«ng lùc sÏ t¨ng tiÕn.<enter>",DescLink_LiGuan),
	
	format("%s Hoµng chi ch­¬ng b¾t ®Çu mçi tèi <color=yellow>tõ 19h55 giê ®Õn 21h45 giê<color>. Trong kho¶ng thêi gian nµy, c¸c vÞ ®¹i hiÖp cã thÓ tham gia c¸c ho¹t ®éng ®Ó ®­îc nh©n ®«i phÇn th­ëng. <enter> Tr­íc m¾t gåm c¸c ho¹t ®éng:  <enter>%s<enter>%s<enter>%s<enter>. C¸c vÞ ®¹i hiÖp vµo lóc <color=yellow>19h45<color> cã thÓ ®Õn gÆp LÔ Quan ®Ó hái xem ho¹t ®éng nµo ®­îc nh©n ®«i phÇn th­ëng trong ngµy.",DescLink_LiGuan,"ChiÕn tr­êng Tèng Kim","Th¸ch thøc thêi gian","Chuçi nhiÖm vô D· TÈu"),
	
	"T×m hiÓu ho¹t ®éng 'Huy hoµng'/gn_huizhizhang",
	"T×m hiÓu ho¹t ®éng 'Hoµng chi ch­¬ng'/gn_huangzhizhang",
	"ChØ lµ ®i d¹o ch¬i th«i!/OnCancel",
	"Trë l¹i/onGreat_Night",
	"HiÓu råi/OnCancel",
}

function onGreat_Night()
	Describe(format("%s Tr­íc m¾t lµ thêi gian m­a thuËn giã hßa, ®Ó ®¸p t¹ c«ng søc ®ãng gãp c¸c vÞ ®¹i hiÖp, Vâ l©m minh chñ §éc C« KiÕm ®· tæ chøc ho¹t ®éng <color=yellow>'§ªm huy hoµng'<color>. Thêi gian b¾t ®Çu ho¹t ®éng mçi ngµy lµ 12h00. <enter><color=yellow>12h00 tr­a nay sÏ diÔn ra ho¹t ®éng 'Huy chi ch­¬ng', nh÷ng n¬i sÏ xuÊt hiÖn qu¶ hoµng kim lµ:  %s<color><enter><color=yellow>19h45 h«m nay sÏ diÔn ra ho¹t ®éng 'Hoµng chi ch­¬ng', ho¹t ®éng nh©n ®«i phÇn th­ëng lµ: %s<color><enter>",
				DescLink_LiGuan,
				"M¹c B¾c Th¶o Nguyªn",
				huang_event_name()),
	 3, 
	Great_Night_DiaStr[4], 
	Great_Night_DiaStr[5],
	Great_Night_DiaStr[6]
 	)
end

function gn_huizhizhang()
	Describe(Great_Night_DiaStr[2],2,
	 Great_Night_DiaStr[7],
	 Great_Night_DiaStr[8])
end

function gn_huangzhizhang()
	Describe(Great_Night_DiaStr[3], 2, Great_Night_DiaStr[7], Great_Night_DiaStr[8])
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

function gn_lanternjoin()
	local area = gb_GetTask(GN_LANTERN_NAME_TSK, GN_LANTERN_TSK_MAP)
	if (area == 0 or area == nil) then
		Describe(DescLink_LiGuan.."Ho¹t ®éng ®o¸n ch÷ 'Hoa §¨ng' vÉn ch­a b¾t ®Çu! Xin trë l¹i sau nhÐ!", 1, "Ta biÕt råi!/OnCancel")
		return
	end
	for i = 1, getn(tbLANTERNS_NPC) do
		if (area == tbLANTERNS_NPC[i][1]) then
			Describe(DescLink_LiGuan.."tèi nay ho¹t ®éng 'Hoa §¨ng' sÏ tæ chøc t¹i <color=yellow>"..tbLANTERNS_NPC[i][7].."<color>, hay lµ b©y giê ®Õn ®ã tr­íc nhÐ!", 2, "§Õn khu vùc ®o¸n ch÷ hoa ®¨ng/lantern_enter_lantern", "§Ó ta suy nghÜ l¹i ®·!/OnCancel")
		end
	end
end

function lantern_enter_lantern()
	local nNowTime = tonumber(GetLocalDate("%H%M"));
	if (nNowTime < 1930 or nNowTime > 2001) then
		Describe(DescLink_LiGuan.."Ho¹t ®éng ®o¸n ch÷ 'Hoa §¨ng' vÉn ch­a b¾t ®Çu! Xin trë l¹i sau nhÐ!", 1, "Ta biÕt råi!/OnCancel")
		return
	end
	
	local area = gb_GetTask(GN_LANTERN_NAME_TSK, GN_LANTERN_TSK_MAP)
	if (area == 0 or area == nil) then
		Describe(DescLink_LiGuan.."Ho¹t ®éng ®o¸n ch÷ 'Hoa §¨ng' vÉn ch­a b¾t ®Çu! Xin trë l¹i sau nhÐ!", 1, "Ta biÕt råi!/OnCancel")
		return
	end
	local tb_enter_pos = tbLANTERN_ENTER_POS[area]
	if ( tb_enter_pos ~= nil ) then
		local randnum = random( getn( tb_enter_pos ) )
		NewWorld(area, tb_enter_pos[randnum][1], tb_enter_pos[randnum][2])
		SetFightState(1)
	end
end

function OnCancel()
end