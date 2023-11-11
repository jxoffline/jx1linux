-- ËÎ½ðµÀ¾ßÎåÐÐÖù
-- ·Ö »ðÖù¡¢±ùÖù¡¢¶¾Öù¡¢À×Öù

Include( "\\script\\item\\checkmapid.lua" )

function EatMedicine(nItemIdx)	-- Í¨¹ýÅÐ¶ÏÕ½³¡µÄµÈ¼¶ºÍÍæ¼ÒµÄÕóÓªÀ´¼ÓNPC
	if (GetFightState() == 0) then
		Say("Kh«ng thÓ sö dông ë tr¹ng th¸i phi chiÕn ®Çu!", 0)
		return -1
	end;
	tbPK_MAP = {357, 358, 359, 360, 361, 362, 363, 364, 365, 366, 367, 368, 369, 370, 371, 372, 373, 374} -- µ¥ÌôµØÍ¼½ûÖ¹Ê¹ÓÃºÅ½Ç
	for j = 1, getn(tbPK_MAP) do
		if ( nMapId == tbPK_MAP[j] ) then
			Msg2Player("Trong khu vùc ®¬n ®Êu kh«ng thÓ sö dông vËt phÈm nµy!");
			return -1
		end
	end

	for j = 1, getn(tbCD_MAP) do
		if ( nMapId == tbCD_MAP[j] ) then
			Msg2Player("VËt phÈm nµy chØ cã thÓ sö dông ë ChiÕn tr­êng Tèng Kim");
			return -1
		end
	end
	
	local szNpcName = "";
	local n_player_camp = GetCurCamp();
	
	if (n_player_camp == 1) then
		if (GetMissionV(MS_WUXINGZHUCNT_S) >= MAX_CALLWUXINGZHU) then
			Msg2Player("Sè trô hiÖn cã ë chiÕn tr­êng ®· ®¹t giíi h¹n, kh«ng thÓ sö dông n÷a.")
			return -1
		else
			SetMissionV(MS_WUXINGZHUCNT_S, GetMissionV(MS_WUXINGZHUCNT_S) + 1)
			szNpcName = "Phe Tèng - 	";
		end
	elseif (n_player_camp == 2) then
		if (GetMissionV(MS_WUXINGZHUCNT_J) >= MAX_CALLWUXINGZHU) then
			Msg2Player("Sè trô hiÖn cã ë chiÕn tr­êng ®· ®¹t giíi h¹n, kh«ng thÓ sö dông n÷a.")
			return -1
		else
			SetMissionV(MS_WUXINGZHUCNT_J, GetMissionV(MS_WUXINGZHUCNT_J) + 1)
			szNpcName = "Phe Kim -	";
		end
	end
	
	local n_level = check_pl_level(GetLevel);
	local _, _, n_part = GetItemProp(nItemIdx);
	local tb_npc_level = {50, 70, 90};
	local tb_npc_id = {	[1768] = {id = 1343, szname="Háa Trô"},
						[1769] = {id = 1344, szname="B¨ng Trô"},
						[1770] = {id = 1345, szname="§éc Trô"},
						[1771] = {id = 1346, szname="L«i Trô"},
						[1772] = {id = 1347, szname="Kim Trô"},
						};
	
	if (not n_level or not tb_npc_id[n_part]) then	--²»´æÔÚµÄËÎ½ðµÈ¼¶ »òÕß µÀ¾ßÎÞ·¨ºÍÕÙ»½NPC¶ÔÓ¦
		return -1;
	end
	
	local n_npcidex = AddNpc( tb_npc_id[n_part].id, tb_npc_level[n_level], SubWorldID2Idx(W), (X - 3) * 32, Y * 32, 1, szNpcName..tb_npc_id[n_part].szname, 0);
	SetNpcCurCamp(n_npcidex, n_player_camp);
	
end	

