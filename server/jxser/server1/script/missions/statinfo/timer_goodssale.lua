--------------------------------------------------------------------
-- 使用战队结构来记录统计信息 
-- 每类统计为一个战队，每项统计记录在战队成员的任务变量上
-- 数据组织：
--	.社团类型(LeagueType)：全局唯一标识，注意不要重用
--	.社团名称(LeagueName)：根据统计类型而定("goodssale" - 物品销售统计)
--	.社团成员(LeagueMember)：统计详细项目
--------------------------------------------------------------------

IncludeLib("LEAGUE")
IncludeLib("STATINFO")
Include( "\\script\\missions\\statinfo\\head.lua")

-----------------------------------------------------------------------------
-- 定时响应函数
function OnTimer()
	print("OnTime: update_goods_stat")
	update_goods_stat(0)
end

-----------------------------------------------------------------------------
-- 战队创建回调函数
function on_create_stat_league(nLeagueType, szLeagueName, szMemberName, bSucceed)
	if (bSucceed == 0) then
		WriteLog("[stat_error]createstatleague fail: "..szLeagueName);
		return 0;
	end
	
	-- 再统计一次
	update_goods_stat(0)
	return 1;
end

-----------------------------------------------------------------------------
-- 战队成员添加回添函数(销售的物品)
function on_add_stat_item(nLeagueType, szLeagueName, szMemberName, bSucceed)
	if (bSucceed == 0) then
		WriteLog("[stat_error]createstatitem fail: "..szLeagueName.." ItemName: "..szMemberName);
		return 0;
	end
	
	local nLeagueID = LG_GetLeagueObj(LGTYPE_STATINFO, LGNAME_STAT_GOODS_SALE);
	if (nLeagueID == 0) then
		WriteLog("[stat_error]createstatitem error: "..szLeagueName.." ItemName: "..szMemberName);
		return 0;
	end
	
	update_goods_stat_item(nLeagueID, szMemberName, 0);
	
	return 1;
end

-----------------------------------------------------------------------------
-- 创建统计战队
function create_stat_league()
		local nLeagueID = LG_CreateLeagueObj();
		
		LG_SetLeagueInfo(nLeagueID, LGTYPE_STATINFO, LGNAME_STAT_GOODS_SALE);
		LG_ApplyAddLeague(nLeagueID, 
							"\\script\\missions\\statinfo\\timer_goodssale.lua", 
							"on_create_stat_league");
		
		LG_FreeLeagueObj(nLeagueID);
end

-----------------------------------------------------------------------------
-- 添加统计项目
function add_stat_item(nLeagueID, szItemName)
		local nMemberID = LGM_CreateMemberObj();
		LGM_SetMemberInfo(nMemberID, szItemName, 0, 
							LGTYPE_STATINFO, LGNAME_STAT_GOODS_SALE);
		LGM_ApplyAddMember(nMemberID, 
							"\\script\\missions\\statinfo\\timer_goodssale.lua", 
							"on_add_stat_item");
		
		LGM_FreeMemberObj(nMemberID);
end

-----------------------------------------------------------------------------
-- 更新某个销售物品的统计计数到战队
function update_goods_stat_item(nLeagueID, szItemName, bCheckItem)
	
	local nNumber = STAT_GetGoodsSaleNum(szItemName, 
											CURRENCYTYPE_COIN, 
											STATDATA_LATECACHE);
	if (nNumber == 0) then
		return 0; -- 缓冲没有数据，不需生成或更新league的item
	end

	-- 检查item是否存在league中
	if (bCheckItem == 1) then
		local nMemberID = LG_GetMemberObj(nLeagueID, szItemName);
		if (nMemberID == 0) then
			add_stat_item(nLeagueID, szItemName); -- 添加item到league
			return 0;
		end
	end	

	---------------------------------------
	-- 申请更新数据(记录到总记数、当天、当月)，然后清除缓冲
	LG_ApplyAppendMemberTask(LGTYPE_STATINFO, LGNAME_STAT_GOODS_SALE, 
								szItemName, 
								LG_STATITEM_TASKID_TOTAL, nNumber);
	
	---------------------------------------
	-- 记录当天统计数据 -- start
	local nCurDate = tonumber(date("%Y%m%d")); -- 20060121
	local nStatDate = LG_GetLeagueTask(nLeagueID, LG_STAT_TASKID_CURDATE)
	if (nCurDate == nStatDate) then
		LG_ApplyAppendMemberTask(LGTYPE_STATINFO, LGNAME_STAT_GOODS_SALE, 
								szItemName, 
								LG_STATITEM_TASKID_TODAY, nNumber);
	else
		LG_ApplySetLeagueTask(LGTYPE_STATINFO, LGNAME_STAT_GOODS_SALE, 
								LG_STAT_TASKID_CURDATE, nCurDate);
		LG_ApplySetMemberTask(LGTYPE_STATINFO, LGNAME_STAT_GOODS_SALE, 
								szItemName, 
								LG_STATITEM_TASKID_TODAY, nNumber);	
	end
	-- 记录当天统计数据 -- end
	
	---------------------------------------
	-- 记录当月统计数据 -- start
	local nCurYearMonth = tonumber(date("%y%m")) -- 601
	LG_ApplyAppendMemberTask(LGTYPE_STATINFO, LGNAME_STAT_GOODS_SALE, 
								szItemName, 
								nCurYearMonth, nNumber);
	-- 记录当月统计数据 -- end

	STAT_CleanGoodsSaleNum(szItemName, CURRENCYTYPE_COIN, STATDATA_LATECACHE);
	return 1;
end

-----------------------------------------------------------------------------
-- 更新物品销售的统计数据
function update_goods_stat(nCurPos)
	local i = nCurPos;
	local nGoodsCount = STAT_GetGoodsCount();
	-- 没有需统计的销售物品
	if (nCurPos >= nGoodsCount) then
		return 0;
	end
	
	local nLeagueID = LG_GetLeagueObj(LGTYPE_STATINFO, LGNAME_STAT_GOODS_SALE);
	-- 战队未存在，先创建
	if (nLeagueID == 0) then
		create_stat_league();
		return 1;
	end
	
	local szItemName = "";
	for i = nCurPos, nGoodsCount-1 do
		szItemName = STAT_GetGoodsName(i);
		update_goods_stat_item(nLeagueID, szItemName, 1);
	end
end
