-- ====================== ÎÄ¼þÐÅÏ¢ ======================

-- ½£ÏÀÇéÔµÍøÂç°æÔ½ÄÏÊÕ·Ñ°æ - ¶Ò»»ÐÂ×°±¸ÁîÅÆ£¨×ÏòþµÈ£©
-- ÎÄ¼þÃû¡¡£ºex_goldequip_lingpai.lua
-- ´´½¨Õß¡¡£º×Ó·Çô~
-- ´´½¨Ê±¼ä£º2010-06-22 11:02:54

-- ======================================================


IncludeLib("ITEM")
Include("\\script\\misc\\itemexchangevalue\\ex_goldequip_head.lua")	-- ¶Ò»»ÐÂ×°±¸ÁîÅÆ£¨×ÏòþµÈ£©
Include( "\\script\\task\\system\\task_string.lua" );
Include("\\script\\lib\\log.lua");

function exchange_lingpai2goldequip()
	local aryDescribe =
	{
		"<dec><npc>Ng­¬i muèn ®æi lo¹i trang bÞ nµo?",
		format("Bé trang bÞ Thanh C©u/#take_xp_equip_1(1,%d)", 905),
		format("Bé trang bÞ V©n Léc/#take_xp_equip_1(2,%d)", 1135),
		format("Bé trang bÞ Th­¬ng Lang/#take_xp_equip_1(3,%d)", 1365),
		format("Bé trang bÞ HuyÒn Viªn/#take_xp_equip_1(4, %d)", 1595),
--		format("Bé trang bÞ Tö M·ng/#take_xp_equip_1(5, %d)", 1825),
--		format("½ðÎÚÌ××°/#take_xp_equip_1(6, %d)", 2055),
--		format("°×»¢Ì××°/#take_xp_equip_1(7, %d)", 2285),
		"L¸t n÷a quay l¹i /no",
	};
	
	CreateTaskSay(aryDescribe);
end


function take_xp_equip_1(n_g, n_d)
	
	if (CalcItemCount(3, tbLingpai[n_g].tbProp[1],tbLingpai[n_g].tbProp[2],tbLingpai[n_g].tbProp[3],-1) <= 0) then
		Talk(1, "", "H×nh nh­ ®¹i hiÖp quªn mang lÖnh bµi µ?")
		return
	end
	
	CreateTaskSay({"<dec><npc>§¹i hiÖp muèn ®æi trang bÞ cña hÖ ph¸i nµo bªn d­íi:", 
						format("QuyÒn ThiÕu L©m/#take_xp_equip_2(%d,%d, 1)", n_g, n_d),
						format("C«n ThiÕu L©m/#take_xp_equip_2(%d,%d, 2)", n_g, n_d),
						format("ThiÕu L©m ®ao/#take_xp_equip_2(%d,%d, 3)", n_g, n_d),
						format("Chïy Thiªn V­¬ng/#take_xp_equip_2(%d,%d, 4)", n_g, n_d),
						format("Th­¬ng Thiªn V­¬ng/#take_xp_equip_2(%d,%d, 5)", n_g, n_d),
						format("§ao Thiªn V­¬ng/#take_xp_equip_2(%d,%d, 6)", n_g, n_d),
						format("Nga Mi kiÕm/#take_xp_equip_2(%d,%d, 7)", n_g, n_d),
						format("Nga Mi ch­ëng/#take_xp_equip_2(%d,%d, 8)", n_g, n_d),
						format("Thóy Yªn ®ao/#take_xp_equip_2(%d,%d, 9)", n_g, n_d),
						format("ThiÕu Yªn néi/#take_xp_equip_2(%d,%d, 10)", n_g, n_d),
						format("Ngò §éc ch­ëng/#take_xp_equip_2(%d,%d, 11)", n_g, n_d),
						format("Ngò §éc ®ao/#take_xp_equip_2(%d,%d, 12)", n_g, n_d),
						format("Trang kÕ /#take_xp_equip_11(%d,%d)", n_g, n_d),
						"L¸t n÷a quay l¹i /no"});
end

function take_xp_equip_11(n_g, n_d)
	CreateTaskSay({"<dec><npc>§¹i hiÖp muèn ®æi trang bÞ cña hÖ ph¸i nµo bªn d­íi:", 
						format("§­êng M«n phi ®ao/#take_xp_equip_2(%d,%d, 13)", n_g, n_d),
						format("§­êng M«n ná/#take_xp_equip_2(%d,%d, 14)", n_g, n_d),
						format("§­êng M«n tiÓu/#take_xp_equip_2(%d,%d, 15)", n_g, n_d),
						format("C¸i Bang ch­ëng/#take_xp_equip_2(%d,%d, 16)", n_g, n_d),
						format("C¸i Bang c«n/#take_xp_equip_2(%d,%d, 17)", n_g, n_d),
						format("Thiªn NhÉn chiÕn/#take_xp_equip_2(%d,%d, 18)", n_g, n_d),
						format("Thiªn NhÉn ma/#take_xp_equip_2(%d,%d, 19)", n_g, n_d),
						format("Vâ §ang khÝ/#take_xp_equip_2(%d,%d, 20)", n_g, n_d),
						format("Vâ §ang kiÕm/#take_xp_equip_2(%d,%d, 21)", n_g, n_d),
						format("§ao C«n L«n/#take_xp_equip_2(%d,%d, 22)", n_g, n_d),
						format("KiÕm C«n L«n/#take_xp_equip_2(%d,%d, 23)", n_g, n_d),
						format("Trang tr­íc/#take_xp_equip_1(%d,%d)", n_g, n_d),
						"L¸t n÷a quay l¹i /no"});
end


function take_xp_equip_2(n_g, n_d, n_p)
	local n_count = 10;
	
	if (n_g == 5) then		
		n_count = 5;
	end
	
	local n_s =(n_p - 1)*n_count + 1;
	
	local aryDescribe = {
		"<dec><npc>§¹i hiÖp muèn ®æi trang bÞ cña hÖ ph¸i nµo bªn d­íi:",
	};
	for i = n_s, n_s+n_count-1 do
		tinsert(aryDescribe, tbGoldEquip_Lingpai[n_g][i][1]..format("/#take_xp_equip_3(%d, %d, %d, %d)", n_g, n_d, n_p,i));
	end
	
	tinsert(aryDescribe, "L¸t n÷a quay l¹i /no");
	CreateTaskSay(aryDescribe);
end

function take_xp_equip_3(n_g, n_d, n_p, n_x)
	if (CountFreeRoomByWH(2,4,1) < 1) then
		Talk(1, "", "Hµnh trang kh«ng ®ñ « trèng! Xin h·y s¾p xÕp råi quay l¹i nhÐ.");
		return
	end
	
	local nLingpaiIdx = GetNextItemIndexInRoom(0, tbLingpai[n_g].tbProp[1],tbLingpai[n_g].tbProp[2],tbLingpai[n_g].tbProp[3],-1, 3);
	local n_bindstate = GetItemBindState(nLingpaiIdx);
	local n_expiredtime = ITEM_GetExpiredTime(nLingpaiIdx);
	
	if (ConsumeItem(3,1, tbLingpai[n_g].tbProp[1],tbLingpai[n_g].tbProp[2],tbLingpai[n_g].tbProp[3],-1) ~= 1) then
		Talk(1, "", "H×nh nh­ ®¹i hiÖp quªn mang lÖnh bµi µ?")
		return
	end
	
	local nItemIdx = AddGoldItem(0, tbGoldEquip_Lingpai[n_g][n_x][2]);
	
--	Ô½ÄÏ°æ±¾Ã»ÓÐ´ËÐèÇó
--	if (n_expiredtime ~= 0 ) then
--		ITEM_SetExpiredTime(nItemIdx,86400)
--		SyncItem(nItemIdx)
--	end
	
	if (n_bindstate ~= 0) then
		
		if (n_bindstate == -2) then
			n_new_bindtime = take_xp_equip_calc_binditem(tbLingpai_BindTime[n_g].nBindState);
		else
			n_new_bindtime = n_bindstate;
		end
		
		SetItemBindState(nItemIdx, n_new_bindtime);
	end
	
	Msg2Player("NhËn ®­îc ——"..GetItemName(nItemIdx));
	
	local szLog = format("%s\t%s\t%u",tbLingpai[n_g].szName, GetItemName(nItemIdx), ITEM_GetItemRandSeed(nItemIdx))
	
	_WritePlayerLog("Token Exchange Equip", szLog)
end

TIME_2000_1_1 = 946656000;		-- 2000Äê1ÔÂ1ÈÕ Ïà¶ÔÓÚ 1970Äê1ÔÂ1ÈÕµÄÃëÊý

function take_xp_equip_calc_binditem(nLingpaiBindTime)
	if (nLingpaiBindTime == -2) then
		return -2;
	end
	local n_new_bindtime = nLingpaiBindTime - 7*24 + floor((GetCurServerTime() - TIME_2000_1_1) / 3600);
	return n_new_bindtime;
end

