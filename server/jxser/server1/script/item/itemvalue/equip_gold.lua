-- 功能：紫色装备系统 - 黄金装备的价值量计算
-- Fanghao Wu 2005.1.15

IncludeLib( "FILESYS" );
Include( "\\script\\item\\item_header.lua" );
Include( "\\script\\item\\itemvalue\\magicattriblevel.lua" );

FILE_EQUIP_GOLD_VAL = "itemvalue\\equip_gold.txt";

loadItemTabFiles( FILE_EQUIP_GOLD_VAL );

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
	local nEquipVal = 0;
	local strEquipValPath = makeItemFilePath( nItemVer, FILE_EQUIP_GOLD_VAL );
	local nSearchRow = 1;
	local MAX_LOOP = 100;
	for i = 1, MAX_LOOP do
		nSearchRow = TabFile_Search( strEquipValPath, "INDEX", nDetailType + 1, nSearchRow + 1 );
		if( nSearchRow < 2 ) then
			break;
		end
		if( nGenre == tonumber( TabFile_GetCell( strEquipValPath, nSearchRow, "GENRE", -1 ) ) ) then
			nEquipVal = tonumber( TabFile_GetCell( strEquipValPath, nSearchRow, "VALUE", 0 ) );
			break;
		end
	end
	return nEquipVal;
end