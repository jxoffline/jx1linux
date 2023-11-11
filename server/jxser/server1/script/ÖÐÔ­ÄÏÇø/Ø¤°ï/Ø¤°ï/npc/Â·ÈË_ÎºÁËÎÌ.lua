-- Ø¤°ï ´«¹¦³¤ÀÏÎºÁËÎÌ 40¼¶ÈÎÎñ
-- by£ºDan_Deng(2003-07-28)

Include("\\script\\global\\skills_table.lua")

Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")

function main()
	UTask_gb = GetTask(8)
	if (GetSeries() == 3) and (GetFaction() == "gaibang") then
		if (UTask_gb == 40*256+30) then		--40¼¶ÈÎÎñÍê³É
			Talk(2,"L40_prise","§Ö tö tõng gÆp Tr­¬ng ®¹i nh©n vµ ®· ®­a mËt hµm cho «ng ta.","VËy th× ta yªn t©m! Ng­¬i thËt vÊt v¶! ChuyÖn nµy ta sÏ bÈm râ víi Bang chñ, phong ng­¬i lµm ®¹i ®Ö tö cÊp 40 cña.")
		elseif (UTask_gb == 40*256+10) then		--40¼¶ÈÎÎñÖĞ
			if (HaveItem(236) == 1) then
				Talk(4,"","Ngôy tr­ëng l·o! Ta ®· giÖt trõ s¸t thñ Kim Quèc, ®©y lµ mËt hµm lÊy ®­îc trªn ng­êi chóng.","§­a ta xem.....","¶! Trong bøc mËt hµm nµy cã viÕt tªn tÊt c¶ nh÷ng m«n ph¸i vµ tÊt c¶ nh÷ng ng­êi trong triÒu ®×nh cÊu kÕt víi Kim quèc. Ph¶i giao bøc mËt hµm nµy cho Tr­¬ng TuÊn ®¹i nh©n, b¶o «ng Êy ph¶i hÕt søc ®Ò phßng.","Ng­¬i ph¶i nhanh chãng ®i D­¬ng Ch©u mét chuyÕn!. Tr­¬ng ®¹i nh©n hiÖn ®ang ë l÷ qu¸n'Héi h÷u'. Ng­¬i ph¶i giao tËn tay bøc mËt hµm nµy cho «ng Êy!")
				SetTask(8,40*256+20)
				AddNote("Mang mËt hµm ®i giao cho Tr­¬ng TuÊn ")
				Msg2Player("Mang mËt hµm ®i giao cho Tr­¬ng TuÊn ")
			else
				Talk(1,"","Thêi gian cÊp b¸ch! Ph¶i lËp tøc tiÔu trõ ngay nh÷ng ch­íng ng¹i tr­íc m¾t Tr­¬ng ®¹i nh©n! ")
			end
		elseif ((UTask_gb == 40*256) and (GetLevel() >= 40)) then		--40¼¶ÈÎÎñÆô¶¯
			Say("Theo tin th¸m b¸o cña ®Ö tö ë L©m An ®­a vÒ: ph¸i chñ hßa trong triÒu ®×nh ®· liªn kÕt víi bän s¸t thñ ng­êi Kim. Chóng ©m m­u sÏ ¸m s¸t Khu MËt sø Tr­¬ng TuÊn. Tr­íc khi Tr­¬ng ®¹i nh©n vÒ ®Õn L©m An, chóng ta ph¶i giÕt s¹ch bän s¸t thñ ",2,"Xin h·y giao cho ®Ö tö. /L40_get_yes","§Ö tö c«ng lùc cßn yÕu, e kh«ng ®­¬ng næi träng nhiÖm /L40_get_no")
		elseif (UTask_gb == 40*256+20) and (HaveItem(236) == 0) then		-- ÈÎÎñÖĞÎïÆ·¶ªÊ§´¦Àí
			AddEventItem(236)
			Talk(1,"","ChuyÖn nµy nhÊt nhÊt ®Òu kh«ng ®­îc sai sãt. Bøc mËt hµm nµy ng­¬i nhí ph¶i lu«n mang theo bªn ng­êi!")
		else
			Skill150Dialog("NÕu nh­ §¹i H¹ nghiªng ®æ, C¸i bang ta mét c©y khã chèng, chØ cã thÓ cóc cung tËn tuş gièng nh­ Gia C¸t Khæng Minh, thµ chÕt kh«ng tõ.")
		end
	else
		Skill150Dialog("Ng­êi ma ta ng­ìng mé nhÊt lµ Gia C¸t Khæng Minh, ®Õn phót cuèi vÉn trung thµnh!")
	end
end;

function Skill150Dialog(szTitle)
	local nNpcIndex = GetLastDiagNpc()
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = format("<npc>%s", szTitle)
	G_TASK:OnMessage("C¸i Bang", tbDailog, "DialogWithNpc")
	tbDailog:Show()
end


function L40_get_yes()
	Talk(1,"","Ng­¬i nªn cÈn thËn! ")
	SetTask(8,40*256+10)
	AddNote("NhËn nhiÖm vô: GiÕt bän s¸t thñ ng­êi Kim, b¶o vÖ an toµn cho Tr­¬ng TuÊn ")
	Msg2Player("NhËn nhiÖm vô: GiÕt bän s¸t thñ ng­êi Kim, b¶o vÖ an toµn cho Tr­¬ng TuÊn ")
end;

function L40_get_no()
end;

function L40_prise()
	Talk(3,"","§a t¹ Ngôy tr­ëng l·o! ")
	SetTask(8,50*256)
	SetRank(41)
--	AddMagic(277)
	add_gb(50)			-- µ÷ÓÃskills_table.luaÖĞµÄº¯Êı£¬²ÎÊıÎªÑ§µ½¶àÉÙ¼¶¼¼ÄÜ¡£
	Msg2Player("Chóc mõng B¹n! §· ®­îc th¨ng lµ: C¸i Bang Long §Çu ®Ö tö ®­îc häc Ho¹t BÊt L­u Thñ ")
	AddNote("B¶o vÖ an toµn cho Tr­¬ng TuÊn, hoµn thµnh nhiÖm vô cÊp 40, ®­îc th¨ng Long §Çu ®Ö tö ")
end;
