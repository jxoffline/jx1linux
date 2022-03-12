-- 功能：紫色装备系统 - 提取蓝色装备魔法属性到属性矿石
-- Fanghao Wu 2005.1.15

Include( "\\script\\item\\compound\\compound_header.lua" );
Include( "\\script\\item\\itemvalue\\magicattriblevel.lua" );

-- [合成]费用
COMPOUND_COST = 5000;


-- 初始化数据
function initData()
	g_nOreSeries = 0;
	g_nDistillMagicPos = 0;
	g_nDistillMagicID = 0;
end

-- 获取[合成]操作参数（用于传递给ITEM_CalcItemValue计算物品价值量）
function getCompoundParam()
	return "MAGIC_DISTILL"..g_nDistillMagicPos;
end

-- 校验原料是否符合[合成]规则（同时存储一些原料数据）
function verifySrcItems( arynNecessaryItemIdx, arynAlternativeItemIdx )
	local nNecessaryItemCount = getn( arynNecessaryItemIdx );
	local nEquipIdx = 0;
	local nEquipSeries = 0;
	for i = 1, nNecessaryItemCount do
		local nGenre, nDetailType, nParticular, nLevel, nSeries, nLuck = GetItemProp( arynNecessaryItemIdx[i] );
		if( nGenre == 0 ) then
			nEquipIdx = arynNecessaryItemIdx[i];
			nEquipSeries = nSeries;
			if( g_nDistillMagicPos > 0 ) then
				g_nDistillMagicID = GetItemMagicAttrib( nEquipIdx, g_nDistillMagicPos );
				break;
			end
		end
		if( nGenre == 6 and nDetailType == 1 and 149 <= nParticular and nParticular <= 154 ) then
			g_nDistillMagicPos = nParticular - 148;
			g_nOreSeries = nSeries;
			if( nEquipIdx > 0 ) then
				g_nDistillMagicID = GetItemMagicAttrib( nEquipIdx, g_nDistillMagicPos );
				break;
			end
		end
	end
	-- 判断是否缺装备或原矿
	if( nEquipIdx <= 0 or g_nDistillMagicPos <= 0 ) then
		return RESULT_LACK_RESOURCE;
	-- 判断是否五行不匹配
	elseif( mod( g_nDistillMagicPos, 2 ) == 0 and nEquipSeries ~= g_nOreSeries ) then
		return RESULT_SERIES_ERROR;
	-- 判断装备提取位置上是否有魔法属性
	elseif(	g_nDistillMagicID <= 0 ) then
		return RESULT_MAGIC_ERROR;
	-- 判断提取的魔法属性可否出现在最新版本的装备上
	elseif(	getn( getMagAttrLvlRange( ITEM_GetLatestItemVersion(), g_nDistillMagicID, 1 ) ) <= 0 or
			isMagicMatchSeries( ITEM_GetLatestItemVersion(), g_nDistillMagicID, g_nOreSeries ) ~= 1 ) then
		return RESULT_MAGIC_ERROR;
	end
	return RESULT_SUCCEED;
end

-- 生成目标物品信息
function genDesItemsInfo( arynNecessaryItemIdx )
	local aryDesItemInfo = {};
	local nLatestItemVer = ITEM_GetLatestItemVersion();
	for i = 1, 10 do
		aryDesItemInfo[i] = { nLatestItemVer, 0, 0, 6, 1, 199 + g_nDistillMagicPos, i, g_nOreSeries, 0, { g_nDistillMagicID, 0, 0, 0, 0, 0 }, nil, getCompoundParam() };
	end
	return aryDesItemInfo;
end

-- 完成选择目标物品、删除原料等收尾操作
function finalCompound( arynNecessaryItemIdx, arynAlternativeItemIdx, nSrcItemValSum, aryDesItemInfo, arydDesItemVal )
	return defFinalCompound( arynNecessaryItemIdx, arynAlternativeItemIdx, nSrcItemValSum, aryDesItemInfo, arydDesItemVal );
end

-- 计算必须材料中的[合成]关键物品的价值总量，限制可选材料价值量加权
function sumMainItemVal( arynNecessaryItemIdx )
	local nMainItemValSum = 0;
	for i = 1, getn( arynNecessaryItemIdx ) do
		local nGenre, nDetailType, nParticular, nLevel, nSeries, nLuck = GetItemProp( arynNecessaryItemIdx[i] );
		if( nGenre == 0 or ( nGenre == 6 and nDetailType == 1 and nParticular == 147 ) ) then
			nMainItemValSum = nMainItemValSum + ITEM_CalcItemValue( arynNecessaryItemIdx[i], getCompoundParam() );
		end
	end
	return nMainItemValSum;
end