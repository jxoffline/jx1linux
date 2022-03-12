-- ¹¦ÄÜ£º×ÏÉ«×°±¸ÏµÍ³ - ¿óÊ¯Éı¼¶
-- Fanghao Wu 2005.1.15

Include( "\\script\\item\\compound\\compound_header.lua" );

-- [ºÏ³É]·ÑÓÃ
COMPOUND_COST = 5000;

-- Ğş¾§¿óÊ¯ÎïÆ·²ÎÊı£¨ÒÔºóÈç¹ûÔö¼ÓĞÂ°æ±¾ÎïÆ·ĞèÒª×÷ÏàÓ¦µÄ´¦Àí£©
XUANJING =	{ 6, 1, 147 };
-- Ä§·¨ÊôĞÔ¿óÊ¯µÄÎïÆ·²ÎÊı£¨ÒÔºóÈç¹ûÔö¼ÓĞÂ°æ±¾ÎïÆ·ĞèÒª×÷ÏàÓ¦µÄ´¦Àí£©
MAGIC_ORE =	{
			{ 6, 1, 200 },
			{ 6, 1, 201 },
			{ 6, 1, 202 },
			{ 6, 1, 203 },
			{ 6, 1, 204 },
			{ 6, 1, 205 }
			};


-- ³õÊ¼»¯Êı¾İ
function initData()
	g_nOreGenre = 0;
	g_nOreDetailType = 0;
	g_nOreParticular = 0;
	g_nOreLevel = 0;
	g_nOreSeries = 0;
	g_nOreMagicID = 0;
end

-- »ñÈ¡[ºÏ³É]²Ù×÷²ÎÊı£¨ÓÃÓÚ´«µİ¸øITEM_CalcItemValue¼ÆËãÎïÆ·¼ÛÖµÁ¿£©
function getCompoundParam()
	return "ORE_UPGRADE";
end

-- Ğ£ÑéÔ­ÁÏÊÇ·ñ·ûºÏ[ºÏ³É]¹æÔò£¨Í¬Ê±´æ´¢Ò»Ğ©Ô­ÁÏÊı¾İ£©
function verifySrcItems( arynNecessaryItemIdx, arynAlternativeItemIdx )
	local nNecessaryItemCount = getn( arynNecessaryItemIdx );
	if( nNecessaryItemCount ~= 3 ) then
		return RESULT_LACK_RESOURCE;
	end
	local bIsXuanjing = 0;
	local nGenre, nDetailType, nParticular, nLevel, nSeries = GetItemProp( arynNecessaryItemIdx[1] );
	if( nGenre == XUANJING[1] and nDetailType ==XUANJING[2] and nParticular == XUANJING[3] ) then
		bIsXuanjing = 1;
	else
		for i = 1, getn( MAGIC_ORE ) do
			if( nGenre == MAGIC_ORE[i][1] and nDetailType == MAGIC_ORE[i][2] and nParticular == MAGIC_ORE[i][3] ) then
				g_nOreMagicID = GetItemParam( arynNecessaryItemIdx[1], 1 );
				break;
			end
		end
	end
	if( bIsXuanjing ~= 1 and g_nOreMagicID <= 0 ) then
		return RESULT_LACK_RESOURCE;
	end
	if( nLevel >= 10 ) then
		return RESULT_LEVEL_FULL;
	end
	g_nOreGenre = nGenre;
	g_nOreDetailType = nDetailType;
	g_nOreParticular = nParticular;
	g_nOreLevel = nLevel;
	g_nOreSeries = nSeries;
	for i = 2, 3 do
		local nGenre, nDetailType, nParticular, nLevel, nSeries = GetItemProp( arynNecessaryItemIdx[i] );
		if( g_nOreGenre ~= nGenre or g_nOreDetailType ~= nDetailType or g_nOreParticular ~= nParticular ) then
			return RESULT_LACK_RESOURCE;
		end
		if( g_nOreLevel ~= nLevel ) then
			return RESULT_LEVEL_ERROR;
		end
		if( g_nOreMagicID > 0 ) then
			if( mod( nParticular, 2 ) ~= 0 and g_nOreSeries ~= nSeries ) then
				return RESULT_SERIES_ERROR;
			end
			if( GetItemParam( arynNecessaryItemIdx[i], 1 ) ~= g_nOreMagicID ) then
				return RESULT_MAGIC_ERROR;
			end
		end
	end
	return RESULT_SUCCEED;
end

-- Éú³ÉÄ¿±êÎïÆ·ĞÅÏ¢
function genDesItemsInfo( arynNecessaryItemIdx )
	local aryDesItemInfo = {};
	local nLatestItemVer = ITEM_GetLatestItemVersion();
	local arynMagLvl = { g_nOreMagicID, 0, 0, 0, 0, 0 };
	aryDesItemInfo[1] = { nLatestItemVer, 0, 0, g_nOreGenre, g_nOreDetailType, g_nOreParticular, g_nOreLevel + 1, g_nOreSeries, 0, arynMagLvl, nil, getCompoundParam() };
	return aryDesItemInfo;
end

-- Íê³ÉÑ¡ÔñÄ¿±êÎïÆ·¡¢É¾³ıÔ­ÁÏµÈÊÕÎ²²Ù×÷
function finalCompound( arynNecessaryItemIdx, arynAlternativeItemIdx, nSrcItemValSum, aryDesItemInfo, arydDesItemVal )
	local dDesProb = (nSrcItemValSum/3) / (arydDesItemVal[1]-(nSrcItemValSum/3)*2);
	if( random() < dDesProb ) then
		local nDesItemValCut = floor( arydDesItemVal[1] / SUM_UNIT );
		if( nDesItemValCut >= COMMON_SUM_BASE_VAL ) then
			local nCommonItemVal = GetGlbValue( GLBID_COMMON_VAL_SUM );
			SetGlbValue( GLBID_COMMON_VAL_SUM, nCommonItemVal );
			if( nCommonItemVal + nDesItemValCut >= COMMON_SUM_MAX_VAL ) then
				local strMsg = format( " [C¶nh b¸o]%s Tæng gi¸ trŞ vËt phÈm t­¬ng quan cña Trang bŞ HuyÒn Tinh [ghĞp]h«m nay (%0.2fE) , ®· v­ît qu¸ møc c¶nh b¸o tæng gi¸ trŞ (%0.2fE) , cã thÓ xuÊt hiÖn hiÖn t­îng quĞt vËt phÈm, h·y liªn hÖ khÈn víi bé phËn nghiªn cøu!!!  ", date( "%Y-%m-%d %H:%M:%S" ), ( nCommonItemVal + nDesItemValCut ) * SUM_UNIT / 100000000, COMMON_SUM_MAX_VAL * SUM_UNIT / 100000000 );
				print( strMsg );
				WriteLog( strMsg );
			end
		end
		writeCompoundLog( arynNecessaryItemIdx, arynAlternativeItemIdx, nSrcItemValSum, aryDesItemInfo[1], arydDesItemVal[1], dDesProb );
		local nResultDesItemIdx = addItemByInfo( aryDesItemInfo[1] );
		if( nResultDesItemIdx > 0 ) then
			removeItems( arynNecessaryItemIdx );
			removeItems( arynAlternativeItemIdx );
			return nResultDesItemIdx, RESULT_SUCCEED;
		end
	end
	writeCompoundLog( arynNecessaryItemIdx, arynAlternativeItemIdx, nSrcItemValSum, nil, 0, 1 - dDesProb );
	RemoveItemByIndex( arynNecessaryItemIdx[1] );
	removeItems( arynAlternativeItemIdx );
	return -1, RESULT_FAIL;
end