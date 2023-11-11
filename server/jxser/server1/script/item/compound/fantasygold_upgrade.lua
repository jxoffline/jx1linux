-- 功能：玄金升级

IncludeLib("ITEM");
Include("\\script\\item\\itemvalue\\fantasygold.lua");

RESULT_UNKNOWN = -1;				-- 未知错误
RESULT_SUCCEED = 0;				-- [合成]成功
RESULT_FAIL = 1;				-- [合成]失败
RESULT_NO_MONEY = 2;				-- 金钱不足
RESULT_LEVEL_FULL = 3;				-- 原料已达到最高等级
RESULT_LACK_RESOURCE = 4;			-- 原料不足
RESULT_LEVEL_ERROR = 5;				-- 原料等级错误
RESULT_MAGIC_ERROR = 6;				-- 原料魔法值错误
RESULT_SERIES_ERROR = 7;			-- 原料五行错误
RESULT_RULE_ERROR = 8;				-- 原料不符合规则

-- 初始化数据
g_nOreGenre = 0;
g_nOreDetailType = 0;
g_nOreParticular = 0;
g_nOreLevel = 0;

-- 校验原料是否符合[合成]规则（同时存储一些原料数据）
-- 第二个返回值返回想要升级到的玄金级别（用于取得需要消耗的剑侠币数量）
function verifySrcItems(arynNecessaryItemIdx)
	local nNecessaryItemCount = getn(arynNecessaryItemIdx);
	if nNecessaryItemCount ~= 3 then
		return RESULT_LACK_RESOURCE;
	end

	local nGenre, nDetailType, nParticular, nLevel, nSeries = GetItemProp(arynNecessaryItemIdx[1]);
	if( nLevel >= 10 ) then
		return RESULT_LEVEL_FULL;
	end

	g_nOreGenre = nGenre;
	g_nOreDetailType = nDetailType;
	g_nOreParticular = nParticular;
	g_nOreLevel = nLevel;

	for i = 2, 3 do
		local nGenre, nDetailType, nParticular, nLevel, nSeries = GetItemProp(arynNecessaryItemIdx[i]);
		if g_nOreGenre ~= nGenre or g_nOreDetailType ~= nDetailType or g_nOreParticular ~= nParticular then
			return RESULT_LACK_RESOURCE;
		end
		if( g_nOreLevel ~= nLevel ) then
			return RESULT_LEVEL_ERROR;
		end
	end

	local nBind = 0;
	for i = 1, nNecessaryItemCount do
		if GetItemBindState(arynNecessaryItemIdx[i]) ~= 0 then
			nBind = 1
			break;
		end
	end

	return RESULT_SUCCEED, nLevel + 1, nBind;
end

-- 功能：被程序访问的接口函数，实现某一[合成]操作
-- 参数：arynNecessaryItemIdx		必须原料的物品索引数组
--       arynAlternativeItemIdx		可选原料的物品索引数组
--       nExParam					扩展参数
-- 返回：生成的物品索引, [合成]结果
function Compound(arynNecessaryItemIdx, arynAlternativeItemIdx, nExParam)

	-- 校验原料是否符合[合成]规则（同时存储一些原料数据）
	local nResult, nWantLevel, nBind = verifySrcItems(arynNecessaryItemIdx);
	if( nResult ~= RESULT_SUCCEED ) then
		return -1, nResult;
	end

	-- 取得要要升级到的玄金的价值量
	local nItemValue = CalcFantasyGoldValueByLevel(nWantLevel);
	if nItemValue == 0 then
		return RESULT_LEVEL_ERROR;
	end
	
	-- 支付[合成]费用
	-- 玄金支付 对应级数的玄金价值量*1000
	local nPay = nItemValue * 1000;
	if Pay(nPay) ~= 1 then
		return -1, RESULT_NO_MONEY;
	end

	-- 生成目标物品信息
	local nLatestItemVer = ITEM_GetLatestItemVersion();
	local aryDesItemInfo = {
		nLatestItemVer, 
		0, 
		0, 
		g_nOreGenre, 
		g_nOreDetailType, 
		g_nOreParticular, 
		g_nOreLevel + 1, 
		g_nOreSeries, 
		0,
	};

	-- 完成选择目标物品、删除原料等收尾操作
	-- 返回生成物品索引，[合成]结果
	local nResultDesItemIdx = AddItemEx(
		aryDesItemInfo[1], 
		aryDesItemInfo[2], 
		aryDesItemInfo[3], 
		aryDesItemInfo[4], 
		aryDesItemInfo[5], 
		aryDesItemInfo[6], 
		aryDesItemInfo[7], 
		aryDesItemInfo[8], 
		aryDesItemInfo[9], 
		0
	);

	if nBind == 1 then
		SetItemBindState(nResultDesItemIdx, -2);
	end

	if nResultDesItemIdx > 0 then
		local nItemCount = getn(arynNecessaryItemIdx);
		for i = 1, nItemCount do
			if arynNecessaryItemIdx[i] ~= nil then
				RemoveItemByIndex(arynNecessaryItemIdx[i]);
			end
		end
		WriteLog(format("[N﹏g c蕄 Huy襫 Kim]\tt礽 kho秐:%s\tnh﹏ v藅:%s\tti襫 v筺 ti猽 hao%d\tnh薾 頲 m閠 c竔%dc蕄 Huy襫 Kim th祅h c玭g", GetAccount(), GetName(), nPay, nWantLevel));
		return nResultDesItemIdx, RESULT_SUCCEED;
	else
		WriteLog(format("[N﹏g c蕄 Huy襫 Kim]\tt礽 kho秐:%s\tnh﹏ v藅:%s\tti襫 v筺 ti猽 hao%d\tnh薾 頲 m閠 c竔%dc蕄 Huy襫 Kim th蕋 b筰", GetAccount(), GetName(), nPay, nWantLevel));
		return -1, RESULT_FAIL;
	end
end


