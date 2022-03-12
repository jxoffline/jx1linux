--by ÁÎÖ¾É½ [2006-09-12]
--2006ÖĞÇï»î¶¯Ö®×öµÆÁı»î¶¯,´ò¹ÖµÃµ½µÆÁı,µÆÁı»»È¡¾­ÑéºÍÔÂ±ı.
--Illustration: µÆÁı -- lightcage au06- -- midautumn2006

Include([[\script\event\mid_autumn06\head.lua]]);
Include([[\script\lib\gb_taskfuncs.lua]]);

--ÖĞÇï»î¶¯Èë¿Úº¯Êı
function au06_entrance()
	if (au06_IsPayed_player() == 0) then
		Say("ChØ cã ng­êi ch¬i n¹p thÎ míi cã thÓ tham gia ho¹t ®éng Trung thu", 0);
		return
	end;
	
	local tab_Content = {
		"Ta muèn lµm lång ®Ìn b­¬m b­ím [cÇn 2 giÊy kiÕng vµng, 1 thanh tre, 1 d©y cãi, 1 nÕn  vµ 1000 l­îng]/#determine_process( 1 )",
		"Ta muèn lµm lång ®Ìn ng«i sao [cÇn 2 giÊy kiÕng lam, 1 thanh tre, 1 d©y cãi, 1 nÕn vµ 2000 l­îng]/#determine_process( 2 )",
		"Ta muèn lµm lång ®Ìn èng [cÇn 2 giÊy kiÕng lôc, 1 thanh tre, 1 d©y cãi, 1 nÕn vµ 3000 l­îng]/#determine_process( 3 )",
		"Ta muèn lµm lång ®Ìn trßn [cÇn 2 giÊy kiÕng ®á, 1 thanh tre, 1 d©y cãi, 1 nÕn vµ 4000 l­îng]/#determine_process( 4 )",
		"Ta muèn lµm lång ®Ìn c¸ chĞp [cÇn 1 giÊy kiÕng cam, 1 thanh tre, 1 d©y cãi, 1 nÕn vµ 5000 l­îng]/#determine_process( 5 )",
		"Ta muèn lµm lång ®Ìn kĞo qu©n [cÇn 5 lo¹i giÊy kiÕng, 1 thanh tre, 1 d©y cãi, 1 nÕn vµ 5000 l­îng]/sure_colorfulcage",
		"ChØ ®Õn th¨m «ng chót th«i!/oncancel"
	};
	Say("Lång ®Ìn ta lµm næi danh kh¾p n¬i, ng­êi ng­êi ®Òu thİch. Kh¸ch quan muèn lµm lång ®Ìn g×?", getn(tab_Content), tab_Content);
end;

--È·¶¨ÖÆÔì(ÆÕÍ¨µÆÁı)
function determine_process(nIndex)
	if (nIndex < 1 or nIndex > 5) then
		return
	end;
	tab_Index = {1, 2, 3, 4, 5};
	local szCageName = tab_Lightcage[nIndex][3];
	Say("Lµm "..szCageName.."cÇn <color=yellow>"..tab_Lightcage[nIndex][9].."Më "..tab_Lightcage[nIndex][4]..", 1 thanh tre, 1 d©y cãi, 1 nÕn vµ <color=red>"..tab_Lightcage[nIndex][5].."<color> l­îng tiÒn c«ng, lµm chø?", 2, "§óng! Xin l·o bèi træ tµi!/#process_lightcage("..tab_Index[nIndex]..")", "Ta sÏ quay l¹i sau!/oncancel");
	
end;

--ÖÆÔìµÆÁı(ÆÕÍ¨µÆÁıÖÆÔì)
function process_lightcage(nIndex)
	if (nIndex < 1 or nIndex > 5) then
		return
	end;
	
	local szCageName = tab_Lightcage[nIndex][3];
	local bEnough = 1;
	--¼ì²é²ÄÁÏ
	if (GetCash() < tab_Lightcage[nIndex][5]) then
		bEnough = 0;
	end;
	if (CalcEquiproomItemCount(6, 1, tab_Lightcage[nIndex][2], -1) < tab_Lightcage[nIndex][9]) then
		bEnough = 0;
	end

	for i = 1, getn(tab_BasicMaterial) do
		if (CalcEquiproomItemCount(6, 1, tab_BasicMaterial[i][1], -1) < 1) then
			bEnough = 0;
		end
	end;
	if (bEnough == 0) then
		Say("Kh¸ch quan kh«ng ®ñ vËt liÖu, <color=red>"..szCageName.."<color> cÇn <color=yellow>"..tab_Lightcage[nIndex][9].."Më "..tab_Lightcage[nIndex][4]..", 1 thanh tre, 1 d©y cãi, 1 nÕn vµ <color=red>"..tab_Lightcage[nIndex][5].."<color> l­îng tiÒn c«ng.", 1, "§Ó ta ®i chuÈn bŞ ®·!/oncancel");
		return
	end;
	
	--É¾³ı²ÄÁÏ
	if (Pay(tab_Lightcage[nIndex][5]) == 0) then
		return
	end;
	for i = 1, getn(tab_BasicMaterial) do
		if (ConsumeEquiproomItem(1, 6, 1, tab_BasicMaterial[i][1], -1) ~= 1) then
			return
		end
	end;
	if (ConsumeEquiproomItem(tab_Lightcage[nIndex][9], 6, 1, tab_Lightcage[nIndex][2], -1) ~= 1) then
		return
	end;
	
	local nSeed = random(1, 10);
	if (nSeed <= 8) then
	--¸øÓèÎïÆ·
		AddItem(6, 1, tab_Lightcage[nIndex][1], 1, 0, 0, 0);
	--¹«¸æ
		Say("<color=red>"..szCageName.."<color> ®· lµm xong, Kh¸ch quan võa ı chø?!", 0);
		Msg2Player("B¹n nhËn ®­îc <color=yellow>"..szCageName.."(".."®Æc biÖt"..")<color>");
	else
	--¸øÓèÎïÆ·
		local iIdx = AddItem(6, 1, tab_Lightcage[nIndex][6], 1, 0, 0, 0);
		if (iIdx > 0) then
			SetSpecItemParam(iIdx, 1, 1);
			SyncItem(iIdx);
		end;
	--¹«¸æ
		Say("<color=red>"..szCageName.."<color> ®· lµm xong, nh­ng kh«ng ®­îc nh­ ı. ThËt ng¹i qu¸!", 0);
		Msg2Player("B¹n nhËn ®­îc <color=yellow>"..szCageName.."<color>");
	end;
end;

--È·¶¨ÖÆÔì(Îå²ÊµÆÁı)
function sure_colorfulcage()
	Say("<color=red>lång ®Ìn Ngò s¾c<color><color> cÇn cã <color=yellow>5 lo¹i giÊy kiÕng, 1 thanh tre, 1 d©y cãi, 1 nÕn<color> vµ <color=red>5000 l­îng<color> tiÒn c«ng, lµm chø?", 2, "§óng! Xin l·o bèi træ tµi!/make_colorfulcage", "Ta sÏ quay l¹i sau!/oncancel");
end;

--ÖÆÔìÎå²ÊµÆÁı
function make_colorfulcage()
	local szCageName = "Lång ®Ìn kĞo qu©n";
	--¼ì²éÊÇ·ñÒÑ¾­×öÁË300¸ö
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	local w = GetWorldPos();
	local szCityLGName = "midautumn2006_city_"..tostring(w);
	local n_wc_Count = gb_GetTask(szCityLGName, 2);
	if (gb_GetTask(szCityLGName, 1) ~= nDate) then
		gb_SetTask(szCityLGName, 1, nDate);
		n_wc_Count = 0;
	end;
	
	if (n_wc_Count >= AU06_COLORED_LIMITED) then
		Say("H«m nay ta ®· lµm<color=yellow>3000 c¸i lång ®Ìn kĞo qu©n<color> råi, ta ®· qu¸ mÖt, h«m kh¸c quay l¹i nhĞ.", 0);
		return
	end;
	
	--¼ì²é²ÄÁÏ
	local bEnough = 1;
	if (GetCash() < 5000) then
		bEnough = 0;
	end;
	for i = 1221, 1225 do
		if (CalcEquiproomItemCount(6, 1, i, -1) < 1) then
			bEnough = 0;
		end
	end;
	for i = 1, getn(tab_BasicMaterial) do
		if (CalcEquiproomItemCount(6, 1, tab_BasicMaterial[i][1], -1) < 1) then
			bEnough = 0;
		end
	end;
	if (bEnough == 0) then
		Say("Kh¸ch quan kh«ng ®ñ vËt liÖu, <color=red>"..szCageName.."<color> cÇn <color=yellow>5 lo¹i giÊy kiÕng, 1 thanh tre, 1 d©y cãi, 1 nÕn<color> vµ <color=red>5000 l­îng<color> tiÒn c«ng.", 1, "§Ó ta ®i chuÈn bŞ ®·!/oncancel");
		return
	end;
	
	--É¾³ı²ÄÁÏ
	if (Pay(5000) == 0) then
		return
	end;
	for i = 1221, 1225 do
		if (ConsumeEquiproomItem(1, 6, 1, i, -1) ~= 1) then
			return
		end
	end;
	for i = 1, getn(tab_BasicMaterial) do
		if (ConsumeEquiproomItem(1, 6, 1, tab_BasicMaterial[i][1], -1) ~= 1) then
			return
		end
	end;
	
	local nSeed = random(1, 10);
	if (nSeed <= 8) then
		gb_SetTask(szCityLGName, 2, n_wc_Count + 1);
	--¸øÓèÎïÆ·
		AddItem(6, 1, 1234, 1, 0, 0, 0);
	--¹«¸æ
		Say("<color=red>"..szCageName.."<color> ®· lµm xong, Kh¸ch quan võa ı chø?!", 0);
		Msg2Player("B¹n nhËn ®­îc <color=yellow>"..szCageName.."(".."®Æc biÖt"..")<color>");
	else
	--¸øÓèÎïÆ·
		local iIdx = AddItem(6, 1, 1246, 1, 0, 0, 0);
		if (iIdx > 0) then
			SetSpecItemParam(iIdx, 1, 1);
			SyncItem(iIdx);
		end;
	--¹«¸æ
		Say("<color=red>"..szCageName.."<color> ®· lµm xong, nh­ng kh«ng ®­îc nh­ ı. ThËt ng¹i qu¸!", 0);
		Msg2Player("B¹n nhËn ®­îc <color=yellow>"..szCageName.."<color>");
	end;
end;