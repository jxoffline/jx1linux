-- 功能：紫色装备系统 - 魔法属性的价值量计算
-- Fanghao Wu 2005.1.15

IncludeLib( "FILESYS" );
Include( "\\script\\item\\item_header.lua" );

FILE_MAGIC_VAL = "magicattriblevel.txt";
FILE_MAGIC_INDEX = "magicattriblevel_index.txt";
FILE_MAGIC_COMBINE_VAL = "itemvalue\\magicattrib_combine.txt";
FILE_MAGIC_POS_VAL = "itemvalue\\equip_enchasable_magic_pos.txt";

loadItemTabFiles( FILE_MAGIC_VAL );
loadItemTabFiles( FILE_MAGIC_INDEX );
loadItemTabFiles( FILE_MAGIC_COMBINE_VAL );
loadItemTabFiles( FILE_MAGIC_POS_VAL );

-- 各装备类型在魔法等级属性表中对应的列名
EQUIP_COLUMNS =
{
	{	"SWORD",			-- 剑		0, 0, 0
		"BLADE",			-- 单刀		0, 0, 1
		"WAND",				-- 棍		0, 0, 2
		"SPEAR",			-- 枪		0, 0, 3
		"HAMMER",			-- 锤		0, 0, 4
		"DUALBLADES",		-- 双刀		0, 0, 5
	},
	{	"DARTS",			-- 飞镖		0, 1, 0
		"KNIFE",			-- 飞刀		0, 1, 1
		"CROSSBOW",			-- 弩		0, 1, 2
	},
	{	"ARMOR"				-- 盔甲		0, 2, *
	},
	{	"RING"				-- 戒指		0, 3, *
	},
	{	"NECKLACE",			-- 项链		0, 4, 0
		"AMULET",			-- 护身符	0, 4, 1
	},
	{	"BOOT"				-- 靴子		0, 5, *
	},
	{	"BELT"				-- 腰带		0, 6, *
	},
	{	"HELM"				-- 头盔		0, 7, *
	},
	{	"CUFF"				-- 护腕		0, 8, *
	},
	{ 	"SACHET",			-- 香囊		0, 9, 0
		"PENDANT",			-- 腰坠		0, 9, 1
	},
};

-- 五行在魔法等级属性表中对应的列名
SERIES_COLUMNS =
{
	"METAL",	-- 0 金
	"WOOD",		-- 1 木
	"WATER",	-- 2 水
	"FIRE",		-- 3 火
	"EARTH"		-- 4 土
};

-- 计算MagicLevel数组的魔法属性总价值量
-- nDetailType, nParticular, nSeries 为MagicLevel所在装备的类别、五行
function calcMagicArrayValue( nItemVer, arynMagAttrLvl, nDetailType, nParticular, nSeries )
	local arynMagAttrLvlVal = {};
	local arynMagAttrLvlType = {};
	local arynMagAttrLvlLevel = {};
	local nMagAttrCount = 0;
	local nMagValSum = 0;
	for i = 1, 6 do
		if( arynMagAttrLvl[i] <= 0 ) then
			break;
		end
--		print( nItemVer, arynMagAttrLvl[i], nDetailType, nParticular, nSeries );
		arynMagAttrLvlVal[i] = calcMagicVal_Single( nItemVer, arynMagAttrLvl[i], nDetailType, nParticular, nSeries, i );
		arynMagAttrLvlType[i] = getMagAttrLvlType( nItemVer, arynMagAttrLvl[i] );
		arynMagAttrLvlLevel[i] = getMagAttrLvlLevel( nItemVer, arynMagAttrLvl[i] );
--		print( arynMagAttrLvlType[i]..": "..arynMagAttrLvlVal[i] );
		nMagAttrCount = nMagAttrCount + 1;
	end
	if( nMagAttrCount == 1 ) then
		nMagValSum = arynMagAttrLvlVal[1];
	elseif( nMagAttrCount > 1 ) then
		for i = 1, nMagAttrCount - 1 do
			for j = i + 1, nMagAttrCount do
				local nCombineVal = calcMagicVal_Combine( nItemVer, arynMagAttrLvlType[i], arynMagAttrLvlType[j] );
--				print( "Combine "..i.." "..j..": "..nCombineVal );
				nMagValSum = nMagValSum + ( arynMagAttrLvlVal[i] + arynMagAttrLvlVal[j] ) * ( nCombineVal - 1 ) * arynMagAttrLvlLevel[i]/10 * arynMagAttrLvlLevel[j]/10;
			end
		end
		for i = 1, nMagAttrCount do
			nMagValSum = nMagValSum + arynMagAttrLvlVal[i];
		end
	end
	return nMagValSum;
end

-- 计算单个魔法属性的价值量
function calcMagicVal_Single( nItemVer, nMagAttrLvl, nDetailType, nParticular, nSeries, nMagicPos )
	local nEquipVal = getMagAttrLvlEquipVal( nItemVer, nMagAttrLvl, nDetailType, nParticular );
--	print( "    equip:"..nEquipVal );
	local nSeriesVal = getMagAttrLvlSeriesVal( nItemVer, nMagAttrLvl, nSeries );
--	print( "    series:"..nSeriesVal );
	local nPosVal = getMagAttrLvlPosVal( nItemVer, nMagicPos );
--	print( "    pos:"..nMagicPos.." "..nPosVal );
	return nEquipVal * nSeriesVal * nPosVal;
end

-- 计算两个魔法属性的加成价值量%
function calcMagicVal_Combine( nItemVer, nMagicAttrib1, nMagicAttrib2 )
	local nCombineVal = 1;
	local strMagIdxPath = makeItemFilePath( nItemVer, FILE_MAGIC_COMBINE_VAL );
	local nMagic1Index = TabFile_Search( strMagIdxPath, 2, nMagicAttrib1, 3 );
	local nMagic2Index = TabFile_Search( strMagIdxPath, 2, nMagicAttrib2, 3 );
	if( nMagic1Index > nMagic2Index ) then
		nMagic1Index, nMagic2Index = nMagic2Index, nMagic1Index;
	end
	if( nMagic1Index >= 3 and nMagic2Index >= 3 ) then
		nCombineVal = tonumber( TabFile_GetCell( strMagIdxPath, nMagic1Index, nMagic2Index, 100 ) ) / 100;
	end
	return nCombineVal;
end

-- 获取指定魔法属性ID的魔法等级属性范围
-- bDiffOpera 表示是否区别正负
function getMagAttrLvlRange( nItemVer, nMagicID, bDiffOpera )
	local aryMagAttrLvlRange = {};
	local nRangeCount = 0;
	local nSearchRow = 1;
	local strMagIdxPath = makeItemFilePath( nItemVer, FILE_MAGIC_INDEX );
	local MAX_LOOP = 100;
	for i = 1, MAX_LOOP do
		nSearchRow = TabFile_Search( strMagIdxPath, "MAGIC_ID", nMagicID, nSearchRow + 1 );
		if( nSearchRow > 1 ) then
			nRangeCount = nRangeCount + 1;
			aryMagAttrLvlRange[nRangeCount] = {};
			aryMagAttrLvlRange[nRangeCount][1] = tonumber( TabFile_GetCell( strMagIdxPath, nSearchRow, "MAGATTRLVL_START", -1 ) );
			aryMagAttrLvlRange[nRangeCount][2] = tonumber( TabFile_GetCell( strMagIdxPath, nSearchRow, "MAGATTRLVL_END", -1 ) );
		else
			if( bDiffOpera == 1 ) then
				break;
			else
				nMagicID = -nMagicID;
				nSearchRow = 1;
			end
		end
	end
	return aryMagAttrLvlRange;
end

-- 获取指定魔法属性（包括数值）的魔法等级属性
-- bDiffOpera 表示是否区别正负
function getMagAttrLvl( nItemVer, nMagicID, nMagicParam1, nMagicParam2, nMagicParam3, bDiffOpera )
	local aryMagAttrLvlRange = getMagAttrLvlRange( nItemVer, nMagicID, bDiffOpera );
	local nRangeCount = getn( aryMagAttrLvlRange );
	local strMagValPath = makeItemFilePath( nItemVer, FILE_MAGIC_VAL );
	local arynMagP1 = {};
	local arynMagP2 = {};
	local arynMagP3 = {};
	for i = 1, nRangeCount do
		for j = aryMagAttrLvlRange[i][1], aryMagAttrLvlRange[i][2] do
			if( j >= 1 ) then
				arynMagP1[1] = tonumber( TabFile_GetCell( strMagValPath, j + 1, "MAG_P1_MIN", -1 ) );
				arynMagP1[2] = tonumber( TabFile_GetCell( strMagValPath, j + 1, "MAG_P1_MAX", -1 ) );
				arynMagP2[1] = tonumber( TabFile_GetCell( strMagValPath, j + 1, "MAG_P2_MIN", -1 ) );
				arynMagP2[2] = tonumber( TabFile_GetCell( strMagValPath, j + 1, "MAG_P2_MAX", -1 ) );
				arynMagP3[1] = tonumber( TabFile_GetCell( strMagValPath, j + 1, "MAG_P3_MIN", -1 ) );
				arynMagP3[2] = tonumber( TabFile_GetCell( strMagValPath, j + 1, "MAG_P3_MAX", -1 ) );
				if( ( arynMagP1[1] < 0 or arynMagP1[2] < 0 or ( arynMagP1[1] <= nMagicParam1 and nMagicParam1 <= arynMagP1[2] ) ) and
					( arynMagP2[1] < 0 or arynMagP2[2] < 0 or ( arynMagP2[1] <= nMagicParam2 and nMagicParam2 <= arynMagP2[2] ) ) and
					( arynMagP3[1] < 0 or arynMagP3[2] < 0 or ( arynMagP3[1] <= nMagicParam3 and nMagicParam3 <= arynMagP3[2] ) ) ) then
					return j;
				end
			end
		end
	end
	-- 魔法属性MagicID正确，但属性值不在表中该MagicID的任何值域内
	if( nRangeCount > 0 ) then
		if( nMagicParam1 > arynMagP1[2] ) then		-- 第一个属性值比该MagicID的最高级魔法等级属性的第一个属性值高，则取最高级的魔法等级属性
			return aryMagAttrLvlRange[getn(aryMagAttrLvlRange)][2];
		else										-- 否则取该Magic的最低级魔法等级属性
			return aryMagAttrLvlRange[1][1];
		end
	end
	return 0;
end

-- 获取指定魔法等级属性的魔法属性ID
function getMagAttrLvlType( nItemVer, nMagAttrLvl )
	local strMagValPath = makeItemFilePath( nItemVer, FILE_MAGIC_VAL );
	return tonumber( TabFile_GetCell( strMagValPath, nMagAttrLvl + 1, "MAGIC_ID", -1 ) );
end

-- 获取指定魔法等级属性的级别
function getMagAttrLvlLevel( nItemVer, nMagAttrLvl )
	local strMagValPath = makeItemFilePath( nItemVer, FILE_MAGIC_VAL );
	return tonumber( TabFile_GetCell( strMagValPath, nMagAttrLvl + 1, "LEVEL", -1 ) );
end

-- 获取指定魔法等级属性的基础价值量
function getMagAttrLvlBaseVal( nItemVer, nMagAttrLvl )
	local strMagValPath = makeItemFilePath( nItemVer, FILE_MAGIC_VAL );
	return tonumber( TabFile_GetCell( strMagValPath, nMagAttrLvl + 1, "BASE_VALUE", 0 ) );
end

-- 获取指定魔法等级属性的在特定装备类型上的价值量
function getMagAttrLvlEquipVal( nItemVer, nMagAttrLvl, nDetailType, nParticular )
	local nMagEquipVal = 0;
	if( nDetailType >= 0 and nDetailType < getn( EQUIP_COLUMNS ) and nParticular >= 0 ) then
		local nParticularCount = getn( EQUIP_COLUMNS[nDetailType+1] );
		local nParticularCol = nParticular;
		if( nParticular >= nParticularCount ) then
			nParticularCol = 0;
		end
		local strMagValPath = makeItemFilePath( nItemVer, FILE_MAGIC_VAL );
		nMagEquipVal = tonumber( TabFile_GetCell( strMagValPath, nMagAttrLvl + 1, EQUIP_COLUMNS[nDetailType+1][nParticularCol+1], 0 ) );
	end
	return nMagEquipVal;
end

-- 获取指定魔法等级属性的在特定五行上的价值量
function getMagAttrLvlSeriesVal( nItemVer, nMagAttrLvl, nSeries )
	local strMagValPath = makeItemFilePath( nItemVer, FILE_MAGIC_VAL );
	return tonumber( TabFile_GetCell( strMagValPath, nMagAttrLvl + 1, SERIES_COLUMNS[nSeries+1], 100 ) ) / 100;
end

-- 获取指定魔法等级属性的在装备MagicLevel不同位置上的价值量
function getMagAttrLvlPosVal( nItemVer, nMagicPos )
	local nValue_MagicPos = 1;
	local strMagPosValPath = makeItemFilePath( nItemVer, FILE_MAGIC_POS_VAL );
	local nSearchRow = TabFile_Search( strMagPosValPath, "MAGIC_POS", nMagicPos );
	if( nSearchRow >= 2 ) then
		nValue_MagicPos = tonumber( TabFile_GetCell( strMagPosValPath, nSearchRow, "VALUE%", 100 ) ) / 100;
	end
	return nValue_MagicPos;
end

-- 判断指定魔法属性是否适合出现在特定装备类型上
function isMagicMatchEquip( nItemVer, nMagicID, nDetailType, nParticular )
	local aryMagAttrLvlRange = getMagAttrLvlRange( nItemVer, nMagicID, 1 );
	if( getn( aryMagAttrLvlRange ) > 0 ) then
		if( nDetailType >= 0 and nDetailType < getn( EQUIP_COLUMNS ) and nParticular >= 0 ) then
			local nParticularCount = getn( EQUIP_COLUMNS[nDetailType+1] );
			local nParticularCol = nParticular;
			if( nParticular >= nParticularCount ) then
				nParticularCol = 0;
			end
			local strMagValPath = makeItemFilePath( nItemVer, FILE_MAGIC_VAL );
			if( tonumber( TabFile_GetCell( strMagValPath, aryMagAttrLvlRange[1][1]+1, EQUIP_COLUMNS[nDetailType+1][nParticularCol+1], 0 ) ) ~= 0 ) then
				return 1;
			end
		end
	end
	return 0;
end

-- 判断指定魔法属性是否适合出现在特定五行上
function isMagicMatchSeries( nItemVer, nMagicID, nSeries )
	local aryMagAttrLvlRange = getMagAttrLvlRange( nItemVer, nMagicID, 1 );
	if( getn( aryMagAttrLvlRange ) > 0 ) then
--		print( nSeries );
		if( nSeries >= 0 and nSeries < getn( SERIES_COLUMNS ) ) then
			local strMagValPath = makeItemFilePath( nItemVer, FILE_MAGIC_VAL );
--			print( aryMagAttrLvlRange[1][1]+1, SERIES_COLUMNS[nSeries+1] );
			if( tonumber( TabFile_GetCell( strMagValPath, aryMagAttrLvlRange[1][1]+1, SERIES_COLUMNS[nSeries+1], 0 ) ) ~= 0 ) then
				return 1;
			end
		end
	end
	return 0;
end