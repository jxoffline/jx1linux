-- ====================== 文件信息 ======================

-- 剑侠情缘网络版越南版 - 千秋英烈 - 显示战场信息
-- 文件名　：sj_announce.lua
-- 创建者　：子非魚
-- 创建时间：2009-04-08 14:15:25

-- ======================================================

if not TB_QIANQIU_YINGLIE0904 then
	Include("\\script\\event\\jiefang_jieri\\200904\\qianqiu_yinglie\\head.lua");
end

Include("\\script\\lib\\common.lua");
Include("\\script\\battles\\battle_rank_award.lua");

function TB_QIANQIU_YINGLIE0904:announce(lsf_level, n_time)
	
	if (mod(n_time, 30) == 0) then
		if (self:check_date() == 1 and lsf_level == 3) then
			local old_player = PlayerIndex;
			-- 积分排名
--			Msg2MSAll(MISSIONID, strfill_center(format("积分最高%d个人排名", 10), 30));
--			Msg2MSAll(MISSIONID, strfill_center("序", 4)..strfill_center("玩家名", 20)..strfill_center("积分", 6));
--			for i = 1, 10 do 
--				local szname, npoint = BT_GetTopTenInfo(i, PL_TOTALPOINT);
--				if (szname and szname ~= "") then
--					Msg2MSAll(MISSIONID, strfill_center(tostring(i), 4)..strfill_center(szname, 20)..strfill_center(tostring(npoint), 6));
--				end
--			end
			
			-- 连斩排名
			tbPlayer = {};
			battle_rank_GetSortPlayer0808(tbPlayer, 0, battle_rank_sort_SER);
			Msg2MSAll(MISSIONID, "<color=green>"..strfill_center("Top li猲 tr秏", 30));
			Msg2MSAll(MISSIONID, "<color=green>"..strfill_center("STT", 4)..strfill_center("T猲 ngi ch琲", 20)..strfill_center("Li猲 tr秏", 6));
			for i = 1, 5 do
				if tbPlayer[i] and tbPlayer[i] > 0 then
					PlayerIndex = tbPlayer[i];
					local szname, npoint = GetName(), BT_GetData(PL_MAXSERIESKILL);
					if (szname and szname ~= "") then
						Msg2MSAll(MISSIONID, strfill_center(tostring(i), 4)..strfill_center(szname, 20)..strfill_center(tostring(npoint), 6));
					end
				end
			end
			
			-- PK玩家排名
			tbPlayer = {};
			battle_rank_GetSortPlayer0808(tbPlayer, 0, battle_rank_sort_PK);
			Msg2MSAll(MISSIONID, "<color=green>"..strfill_center("TOP PK", 30));
			Msg2MSAll(MISSIONID, "<color=green>"..strfill_center("STT", 4)..strfill_center("T猲 ngi ch琲", 20)..strfill_center("PK", 6));
			for i = 1, 5 do 
				if tbPlayer[i] and tbPlayer[i] > 0 then
					PlayerIndex = tbPlayer[i];
					local szname, npoint = GetName(), BT_GetData(PL_KILLPLAYER);
					if (szname and szname ~= "") then
						Msg2MSAll(MISSIONID, strfill_center(tostring(i), 4)..strfill_center(szname, 20)..strfill_center(tostring(npoint), 6));
					end
				end
			end
			
			-- 屠杀NPC排名 仅元帅保卫模式
			if (MISSIONID == 16) then
				tbPlayer = {};
				battle_rank_GetSortPlayer0808(tbPlayer, 0, battle_rank_sort_NPC);
				Msg2MSAll(MISSIONID, "<color=green>"..strfill_center("TOP NPC", 30));
				Msg2MSAll(MISSIONID, "<color=green>"..strfill_center("STT", 4)..strfill_center("T猲 ngi ch琲", 20)..strfill_center("NPC", 6));
				for i = 1, 5 do 
					if tbPlayer[i] and tbPlayer[i] > 0 then
						PlayerIndex = tbPlayer[i];
						local szname, npoint = GetName(), BT_GetData(PL_KILLNPC);
						if (szname and szname ~= "") then
							Msg2MSAll(MISSIONID, strfill_center(tostring(i), 4)..strfill_center(szname, 20)..strfill_center(tostring(npoint), 6));
						end
					end
				end
			end
		end
	end
end

