-- 功能：紫色装备系统 - 矿石的价值量计算
-- Fanghao Wu 2005.1.15

IncludeLib( "FILESYS" );
Include( "\\script\\item\\item_header.lua" );

FILE_ORE_VAL = "itemvalue\\ore.txt";

loadItemTabFiles( FILE_ORE_VAL );

-- 功能：被程序访问的接口函数，计算指定物品信息的价值量
-- 参数：nItemVer 物品版本号
--       nQuality 物品品质
--       nGenre, nDetailType, nParticular 物品类别
--       nLevel 物品级别
--       nSeries 物品五行
--       nLuck 物品生成参数的幸运值
--       arynMagLvl 物品MagicLevel数组
--       aryMagic 物品MagicID数组
--       strParam [合成]操作参数
-- 返回：价值量结果（错误返回0）
function CalcItemValue( nItemVer, nQuality, nGenre, nDetailType, nParticular, nLevel, nSeries, nLuck, arynMagLvl, aryMagic, strParam )
	local nItemVal = 0;
	local strOreValPath = makeItemFilePath( nItemVer, FILE_ORE_VAL );
	local nSearchRow = TabFile_Search( strOreValPath, "LEVEL", nLevel );
	if( nSearchRow >= 2 ) then
		nItemVal = tonumber( TabFile_GetCell( strOreValPath, nSearchRow, "VALUE", 0 ) );
	end
	return nItemVal;
end