--by ÁÎÖ¾É½ [2006-09-12]
--2006ÖĞÇï»î¶¯Ö®×ö¶Ô»°½±Àø,ĞÂÊÖ´åĞ¡º¢¶Ô»°½±Àø
--Illustration: µÆÁı -- lightcage au06- -- midautumn2006

Include([[\script\event\mid_autumn06\head.lua]]);

--Áì½±Èë¿Ú
function main()
	if (au06_is_inperiod() == 0) then --
		Say("Ho¹t ®éng ®· kÕt thóc.", 0);
		return 1;
	end;
	if (au06_IsPayed_player() == 0) then
		Say("ChØ cã ng­êi ch¬i n¹p thÎ míi cã thÓ tham gia ho¹t ®éng Trung thu", 0);
		return
	end;
	local str_Content = {
		"TÆng lång ®Ìn b­¬m b­ím ®Æc biÖt./#determine_get( 1 )",
		"TÆng lång ®Ìn ng«i sao ®Æc biÖt./#determine_get( 2 )",
		"TÆng lång ®Ìn èng ®Æc biÖt./#determine_get( 3 )",
		"TÆng lång ®Ìn trßn ®Æc biÖt./#determine_get( 4 )",
		"TÆng lång ®Ìn c¸ chĞp ®Æc biÖt./#determine_get( 5 )",
		"TÆng lång ®Ìn kĞo qu©n ®Æc biÖt./#determine_get( 6 )",
		"HiÖn t¹i ta ®ang rÊt bËn!/oncancel"
	};
	Say("<color=yellow>Lång ®Ìn<color> nµy ®Ñp qu¸! Cã thÓ tÆng cho muéi lµm quµ cho c¸c em nhá  kh«ng? Muéi sÏ tÆng l¹i ®¹i hiÖp b¸nh Trung Thu do chİnh tay muéi lµm.", getn(str_Content), str_Content);
end;

--È·¶¨Áì½±
function determine_get(nIndex)
	if (nIndex < 1 or nIndex > 6) then
		return
	end;
	tab_Index = {1, 2, 3, 4, 5, 6};
	Say("§¹i hiÖp muèn tÆng lång ®Ìn nµy cho c¸c em nhá sao?", 2, "Uhm! Hy väng muéi kh«ng chª!/#getaward("..tab_Index[nIndex]..")", "Ch­a ®­îc! Lång ®Ìn nµy ta cßn ®ang dïng/oncancel");
end;

--×îÖÕµÃ½±
function getaward(nIndex)
	if (nIndex < 1 or nIndex > 6) then
		return
	end;
	local szCageName = tab_Lightcage[nIndex][3];
	
	--Èç¹ûÃ»ÓĞÎïÆ·
	if (CalcEquiproomItemCount(6, 1, tab_Lightcage[nIndex][1], -1) < 1) then
		Say("Sao høa lµ tÆng muéi lång ®Ìn mµ vÉn ch­a thÊy vËy!?", 1, "Ah! Ta ®Ó quªn ë r­¬ng chøa ®å./oncancel");
		return
	end;
	
	--Èç¹û¾­Ñé´ïµ½ÉÏÏŞ
	if (GetTask(AU06_TK_EXP) >= EXP_AWARD_LIMIT) then
		Say("§a t¹! Nh­ng muéi ®· cã ®ñ lång ®Ìn råi.", 1, "H× h×! §i ch¬i héi nhí cÈn thËn nhĞ!/oncancel");
		return
	end;
	
	--¿Û³ı¶«Î÷
	if (ConsumeEquiproomItem(1, 6, 1, tab_Lightcage[nIndex][1], -1) ~= 1) then
		return
	end;
	--¸øÓèÎïÆ·
	AddItem(6, 1, tab_Lightcage[nIndex][7], 1, 0, 0, 0);
	--¹«¸æ
	Say("C¶m ¬n! §©y lµ b¸nh trung thu do muéi lµm, xin h·y nhËn lÊy.", 0);
	Msg2Player("B¹n nhËn ®­îc <color=yellow>"..tab_Lightcage[nIndex][8].."<color>.");
end;
