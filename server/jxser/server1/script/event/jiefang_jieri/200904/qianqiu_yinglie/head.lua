-- ====================== ÎÄ¼þÐÅÏ¢ ======================

-- ½£ÏÀÇéÔµÍøÂç°æÔ½ÄÏ°æ - Ç§ÇïÓ¢ÁÒ
-- ÎÄ¼þÃû¡¡£ºhead.lua
-- ´´½¨Õß¡¡£º×Ó·Çô~
-- ´´½¨Ê±¼ä£º2009-04-08 14:16:06

-- ======================================================

Include("\\script\\lib\\pay.lua");

TB_QIANQIU_YINGLIE0904 = {
	-- C --
	VERSION		= 20090428,--20090428,		-- ½â·Å»î¶¯°æ±¾
	START		= 20090428,--20090428		-- Ç§ÇïÓ¢ÁÒ¿ªÊ¼Ê±¼ä
	CLOSE		= 20090531,		-- Ç§ÇïÓ¢ÁÒ½áÊøÊ±¼ä
	ItemEnd		= 20090601,		-- µÀ¾ß½áÊøÊ¹ÓÃÆÚ
	
	MAX_EXP		= 300000000,	-- ¾­ÑéÉÏÏÞ 3ÒÚ
	PER_EXP		= 4000000,		-- Ã¿´Î¾­Ñé¸øÓë 4°ÙÍò
	MAX_YAOBAO	= 4,			-- Ã¿Ìì×î¶à4¸öÒ½Ò©°ü
	
	-- TSK --
	TSK_VERSION	= 1970,			-- ¼ÇÂ¼°æ±¾ºÅ
	TSK_SJ_MAXEXP	= 1971,		-- ¼ÇÂ¼²Î¼ÓÇ§ÇïÓ¢ÁÒ»ñµÃ¾­Ñé
	TSK_YIYAO_BAO	= 1972,		-- ¼ÇÂ¼Ã¿Ìì²Î¼Ó»ñµÃ×î¶àÒ½Ò©°ü
	
}

function TB_QIANQIU_YINGLIE0904:reset_task()
	if (GetTask(self.TSK_VERSION) ~= self.VERSION) then
		SetTask(self.TSK_VERSION, self.VERSION);
		SetTask(self.TSK_SJ_MAXEXP, 0);
		SetTask(self.TSK_YIYAO_BAO, 0);
	end
end

function TB_QIANQIU_YINGLIE0904:check_date()
	local n_date = tonumber(GetLocalDate("%Y%m%d"));
	
	if (n_date >= self.START and n_date <= self.CLOSE) then
		return 1;
	else
		return 0;
	end
end

function TB_QIANQIU_YINGLIE0904:check_right()
	local n_level = GetLevel();
	if (n_level < 50 or IsCharged() ~= 1) then
		return 0;
	end
	return 1;
end

function TB_QIANQIU_YINGLIE0904:check_mask_ex()
	if (CalcItemCount(2,0,11,482,-1) > 0) then
		return 3;
	end
	local tbEquips = GetAllEquipment()
	local nMaskIndex = tbEquips[12]
	if nMaskIndex <= 0 then
		return 1
	end
	local nQuality = GetItemQuality(nMaskIndex)
	if nQuality == 1 then
		local nRecordIndex = GetGlodEqIndex(nMaskIndex)
		if 4493 <= nRecordIndex and nRecordIndex <= 4630 then
			return 3
		end
	elseif nQuality == 0 then
		local nG,nD,nP = GetItemProp(nMaskIndex)
		if nG == 0 and nD == 11 and ( 806 <= nP and nP <= 838) then
			return 3
		end
		if nG == 0 and nD == 11 and (647 <= nP and nP <= 657) then
			return 3
		end
	end
	
	return 1
end

function TB_QIANQIU_YINGLIE0904:check_mask()
	--CalcItemCount(2,0,-1,-1,-1)
	if ((CalcItemCount(2,0,11,446,-1) > 0) or (CalcItemCount(2,0,11,450,-1) > 0)) then
		return 1.5;
	elseif (CalcItemCount(2,0,11,447,-1) > 0) then
		return 2;
--	elseif (CalcItemCount(2,0,11,482,-1) > 0) then
--		return 3;
	else
		return 1;
	end
end

function TB_QIANQIU_YINGLIE0904:add_sj_point_ex(npoint)
	local game_level = BT_GetGameData(GAME_LEVEL);
	if (game_level == 3) then
		if (self:check_right() == 1) then
			nMask = self:check_mask_ex();
			npoint = floor(npoint * nMask);
		end
	end
	return npoint;
end

function TB_QIANQIU_YINGLIE0904:add_sj_point(npoint)
	local game_level = BT_GetGameData(GAME_LEVEL);
	if (game_level == 3) then
		if (self:check_right() == 1) then
			nMask = self:check_mask();
			npoint = floor(npoint * nMask);
		end
	end
	return npoint;
end


function TB_QIANQIU_YINGLIE0904:sorter_award(game_level)
--	if (self:check_date() == 1 and game_level == 3) then
	if (game_level == 3) then
		local old_player = PlayerIndex;
		-- ÀÛ¼Æ»ý·Ö
		local tbPlayer = {}
		battle_rank_GetSortPlayer0808(tbPlayer, 0, battle_rank_sort_Point)
		for i = 1, 3 do 
			if tbPlayer[i] and tbPlayer[i] > 0 then
				PlayerIndex = tbPlayer[i];
				Msg2Player(format("B¶ng xÕp h¹ng ®iÓm: ®øng thø %d", i));
				self:add_rank_award(i);
			end
		end
		
		-- Á¬Õ¶ÅÅÃû
		tbPlayer = {}
		battle_rank_GetSortPlayer0808(tbPlayer, 0, battle_rank_sort_SER)
		for i = 1, 3 do
			if tbPlayer[i] and tbPlayer[i] > 0 then
				PlayerIndex = tbPlayer[i];
				Msg2Player(format("B¶ng xÕp h¹ng liªn tr¶m: ®øng thø %d", i));
				self:add_rank_award(i);
			end
		end
		
		-- PKÍæ¼ÒÅÅÃû
		tbPlayer = {}
		battle_rank_GetSortPlayer0808(tbPlayer, 0, battle_rank_sort_PK)
		for i = 1, 3 do
			if tbPlayer[i] and tbPlayer[i] > 0 then
				PlayerIndex = tbPlayer[i];
				Msg2Player(format("B¶ng xÕp h¹ng PK: ®øng thø %d", i));
				self:add_rank_award(i);
			end
		end
		
		-- ÍÀÉ±NPCÅÅÃû ½öÔªË§±£ÎÀÄ£Ê½
		if (MISSIONID == 16) then
			tbPlayer = {}
			battle_rank_GetSortPlayer0808(tbPlayer, 0, battle_rank_sort_NPC)
			for i = 1, 3 do
				if tbPlayer[i] and tbPlayer[i] > 0 then
					PlayerIndex = tbPlayer[i];
					Msg2Player(format("B¶ng xÕp h¹ng giÕt NPC: ®øng thø %d", i));
					self:add_rank_award(2);
				end
			end
		end
		PlayerIndex = old_player;
	end
end


function TB_QIANQIU_YINGLIE0904:add_rank_award(nrank)
	if (self:check_right() ~= 1) then
		return 
	end
	
	if (nrank == 1) then
		if CalcFreeItemCellCount()== 0 then
			Msg2Player("Kho¶ng trèng hµnh trang kh«ng ®ñ, kh«ng thÓ nhËn mÆt n¹ ®¹i t­íng qu©n");
		else
			local n_itemidx = AddItem(0,11,446,1,1,0);
			if (n_itemidx > 0) then
				--ITEM_SetLeftUsageTime(n_itemidx, 60);
				--ITEM_SetExpiredTime(n_itemidx, self.ItemEnd);
				SyncItem(n_itemidx);
				Msg2Player(format("NhËn ®­îc %d %s", 1, "MÆt n¹ §¹i T­íng qu©n"));
			end
		end
	end
		
	local nLiBaoCount = 0
	for i = 1, 3 do
		if CalcFreeItemCellCount() == 0 then
			break
		end
		local n_itemidx = AddItem(6, 1, 2005, 1, 1, 0);
		if (n_itemidx > 0) then
			local nExpiredDate = FormatTime2Date(7 * 24 * 60 *60 + GetCurServerTime());
			ITEM_SetExpiredTime(n_itemidx, nExpiredDate);
			SyncItem(n_itemidx);
			nLiBaoCount = nLiBaoCount + 1;
		end
	end
	
	if nLiBaoCount == 3 then
		Msg2Player(format("NhËn ®­îc %d %s", nLiBaoCount, "Tèng Kim lÔ bao"));
	else
		Msg2Player(format("Do v× chç trèng hµnh trang kh«ng ®ñ, chØ nhËn ®­îc %d %s", nLiBaoCount, "Tèng Kim lÔ bao"));
	end
end


function TB_QIANQIU_YINGLIE0904:add_end_award(tb_player, b_win)
	local game_level = BT_GetGameData(GAME_LEVEL);
	local nExpiredDate = FormatTime2Date(7 * 24 * 60 *60 + GetCurServerTime());
	local tb_award = {tbProp = {6,1,2005,1,1,0}, szName = "Tèng Kim lÔ bao",  nCount = 1+b_win, nExpiredTime = nExpiredDate};
	 
	if (game_level == 3) then
		local old_player = PlayerIndex;
		for i = 1, getn(tb_player) do
			PlayerIndex = tb_player[i];
			local player_total_point=BT_GetData(PL_TOTALPOINT) --»ñµÃ»ý·Ö
			
			if (player_total_point >= 6000 and self:check_right() == 1) then
				tbAwardTemplet:GiveAwardByList(tb_award);
				Msg2Player(format("Do v× ®iÓm tèng kim trªn 6000, nªn sÏ ®­îc th­ëng %d Tèng Kim lÔ bao", tb_award.nCount))
			end
		end
		PlayerIndex = old_player;
	end
end


function TB_QIANQIU_YINGLIE0904:add_lucky_award(tb_player)
	
	if BT_GetGameData(GAME_LEVEL)~= 3 then
		return
	end
	
	for i = 1, getn(tb_player) do
		local exchangeIndex = random(i,  getn(tb_player)) 
		if tb_player[i]>0 and tb_player[exchangeIndex]>0 then
			local temp_A = tb_player[i];
			local temp_B = tb_player[exchangeIndex];
			tb_player[i] = temp_B;
			tb_player[exchangeIndex] = temp_A;
		end
	end
	
	i = 1;
	local nLuckyCount = 0;
	local old_player = PlayerIndex;
	 
	while (tb_player[i] and tb_player[i]>0 and nLuckyCount<3) do
		
		PlayerIndex = tb_player[i];
		i=i+1;
		
		if BT_GetData(PL_TOTALPOINT) >= 3000 then
			
			if CalcFreeItemCellCount()== 0 then
				 Msg2Player("Hµnh trang kh«ng ®ñ chç trèng, kh«ng thÓ nhËn ®­îc mÆt n¹ nguyªn so¸i");
			else
				nLuckyCount=nLuckyCount+1;
				local n_itemidx = AddItem(0,11,447,1,1,0);
				if (n_itemidx > 0) then
					SyncItem(n_itemidx);
					Msg2Player(format("NhËn ®­îc %d %s", 1, "MÆt n¹ Nguyªn so¸i"));
				end
			end
		end
	end 
	 
	PlayerIndex = old_player;
end


function TB_QIANQIU_YINGLIE0904:check_yiyaobao()
	local n_value = GetTask(self.TSK_YIYAO_BAO);
	local n_last_date = GetByte(n_value, 1);
	local n_yiyaobao = GetByte(n_value, 2);
	local n_cur_date = tonumber(GetLocalDate("%j"));
	
	if (n_cur_date ~= n_last_date) then
		n_yiyaobao = 0;
		n_value = SetByte(n_value, 1, n_cur_date);
		n_value = SetByte(n_value, 2, n_yiyaobao);
		SetTask(self.TSK_YIYAO_BAO, n_value);
	end
	
	if (n_yiyaobao >= 4) then
		return 0;
	end
	
	return 1;
end


function TB_QIANQIU_YINGLIE0904:add_yiyaobao_tsk()
	local n_value = GetTask(self.TSK_YIYAO_BAO);
	SetTask(self.TSK_YIYAO_BAO, SetByte(n_value, 2, GetByte(n_value,2)+1 ));
end
