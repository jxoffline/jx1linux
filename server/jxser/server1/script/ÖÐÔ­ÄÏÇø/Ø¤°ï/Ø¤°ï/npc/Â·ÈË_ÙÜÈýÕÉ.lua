-- Ø¤°ï ÕÆ³j³¤ÀÏÙÜÈıÕÉ ÈëÃÅÈÎÎñ¡¢³öÊ¦ÈÎÎñ
-- by£ºDan_Deng(2003-07-28)

Include("\\script\\global\\repute_head.lua")
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(209) == 1 then
		allbrother_0801_FindNpcTaskDialog(209)
		return 0;
	end
	UTask_gb = GetTask(8)
	Uworld30 = GetByte(GetTask(30),2)
	if (GetSeries() == 3) and (GetFaction() == "gaibang") then
		if (UTask_gb == 60*256+10) then		-- ³öÊ¦ÈÎÎñÖĞ
			if (HaveItem(211)==1) and (HaveItem(201)==1) and (HaveItem(208)==1) and (HaveItem(209)==1) and (HaveItem(210)==1) and (HaveItem(206)==1) and (HaveItem(207)==1) and (HaveItem(200)==1) and (HaveItem(205)==1) then
				L60_prise()
			else
				Talk(1,"","ChØ cÇn lÊy ®­îc 9 tói v¶i, ng­¬i cã thÓ thuËn lîi xuÊt s­. Cè g¾ng lªn! ")
			end
		elseif (UTask_gb == 60*256) and (GetLevel() >= 50) then		--³öÊ¦ÈÎÎñÆô¶¯
			Say("§Ö tö bæn bang muèn xuÊt s­ ®Òu ph¶i ®i vµo trong mËt ®éng t×m ®­îc 9 c¸i tói v¶i. Ng­¬i cã gan ®i vµo trong mËt ®éng ®ã kh«ng? ",2,"§­¬ng nhiªn d¸m. /L60_get_yes","§Ö tö vÉn ch­a muèn xuÊt s­ /no")
		else
			Talk(1,"","Bæn bang ai còng cùc khæ, ha ha! Mäi ng­êi ®oµn kÕt l¹i cã thÓ gióp bæn bang ph¸t d­¬ng quang ®¹i.")
		end
	elseif (Uworld30 == 10) then		--ÈëÃÅÈÎÎñ½øĞĞÖĞ
		if (HaveItem(72) == 1) and (HaveItem(73) == 1) and (HaveItem(74) == 1) and (HaveItem(75) ==1) then
			Talk(1,"enroll_prise","Xµ Tr­ëng l·o! §Ö tö ®· t×m ®­îc 4 mãn ng­êi cÇn: r©u c»m, PhiÕn qu¹t, Thñ ph¸ch, Ban chØ ")
		else
			Talk(1,""," 4 mãn ta cÇn ng­¬i vÉn ch­a cã. Ng­¬i kĞm câi qu¸!")
		end
	elseif (Uworld30 == 0) and (GetLevel() >=10) and (GetFaction() ~= "gaibang") then		--ÈëÃÅÈÎÎñÆô¶¯
		Say("§õng xem th­êng KhiÕu hãa tö nµy! Tuy xin ¨n ®Ó sèng nh­ng còng cã chót kiÕn thøc! Cã muèn thö kh«ng?",2,"§­îc. §Ó ta thö l¹i. /enroll_get_yes","Kh«ng, ta chØ ®Õn tham quan. /enroll_get_no")
	else
		Talk(1,"","Huynh ®Ö trong bang tuy b×nh th­êng cã h¬i khæ mét chót nh­ng mäi ng­êi ®Òu rÊt ®oµn kÕt víi nhau. Cã c¬m cïng ¨n, cã r­îu cïng uèng! Ng­êi ngoµi kh«ng thÓ nµo hiÓu ®­îc c¸i kho¸i l¹c cña chóng ta!")
	end
end;

function enroll_get_yes()
	Talk(1, "", "§­îc råi! Ta ®Ó cho ng­¬i tù thö xem! Ng­¬i h·y ®Õn thµnh D­¬ng Ch©u ®Ó lÊy bèn mãn: r©u c»m, PhiÕn qu¹t, Thñ ph¸ch, Ban chØ vÇ ®©y")
	Uworld30 = SetByte(GetTask(30),2,10)
	SetTask(30,Uworld30)
	AddNote("NhËn nhiÖm vô tiÕp theo: §i D­¬ng Ch©u thµnh lÊy 4 mãn vËt: Hå Tu, PhiÕn Tö, Thñ Ph¸ch, B¶n ChØ ")
	Msg2Player("NhËn nhiÖm vô tiÕp theo: §i D­¬ng Ch©u thµnh lÊy 4 mãn vËt: Hå Tu, PhiÕn Tö, Thñ Ph¸ch, B¶n ChØ ")
end;

function enroll_prise()
	Talk(1,"","Ha ha ha! Ng­¬i ®óng lµ cã khiÕu ¨n xin! Tèt! Ta sÏ nhËn ng­¬i lµm ®Ö tö kı danh! ")
	DelItem(72)
	DelItem(73)
	DelItem(74)
	DelItem(75)
	i = ReturnRepute(15,29,2)		-- È±Ê¡ÉùÍû£¬×î´óÎŞËğºÄµÈ¼¶£¬Ã¿¼¶µİ¼õ
	AddRepute(i)
	Uworld30 = SetByte(GetTask(30),2,127)
	SetTask(30,Uworld30)
	AddNote("Hoµn thµnh nhiÖm vô, trë thµnh ®Ö tö chİnh thøc <color=Red>cña C¸i Bang<color>. ")
	Msg2Player("Hoµn thµnh nhiÖm vô, trë thµnh ®Ö tö chİnh thøc cña C¸i Bang ")
end;

function L60_get_yes()
	SetTask(8,60*256+10)
	AddNote("NhËn nhiÖm vô xuÊt s­: §i vµo trong mËt ®éng, t×m ®­îc 9 c¸i tói v¶i ")
	Msg2Player("NhËn nhiÖm vô xuÊt s­: §i vµo trong mËt ®éng, t×m ®­îc 9 c¸i tói v¶i ")
end;

function L60_prise()
	DelItem(211)
	DelItem(201)
	DelItem(208)
	DelItem(209)
	DelItem(210)
	DelItem(206)
	DelItem(207)
	DelItem(200)
	DelItem(205)
	SetRank(68)
	SetTask(8, 70*256)
	SetFaction("")
	SetCamp(4)
	SetCurCamp(4)
	AddNote("Mang 5 c¸i tói v¶i trë vÒ C¸i Bang, hoµn thµnh nhiÖm vô xuÊt s­, ®­îc phong Tiªu Diªu thÇn c¸i. ")
	Msg2Player("Chóc mõng B¹n! §· thuËn lîi xuÊt s­. §­îc phong lµ Tiªu diªu thÇn c¸i ")
end;

function no()
end;
