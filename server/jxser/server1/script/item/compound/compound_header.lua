-- ¹¦ÄÜ£º×°±¸[ºÏ³É]½Å±¾Í·ÎÄ¼ş£¨´Ë´¦[ºÏ³É]·ºÖ¸Ô­ÁÏÉı¼¶¡¢´òÔì¡¢ÏâÇ¶µÈËùÓĞÏà¹Ø²Ù×÷£©
-- ËµÃ÷£º±¾ÎÄ¼şÌá¹©ÁË[ºÏ³É]²Ù×÷µÄÒ»°ãÁ÷³Ì¿ò¼Ü¼°¼¸¸öÏà¹Ø¹¦ÄÜº¯Êı£¬½ö¹©ÆäËû¾ßÌåµÄ[ºÏ³É]²Ù×÷½Å±¾ÎÄ¼ş°üº¬Ê¹ÓÃ
--       °üº¬¸ÃÎÄ¼şÍê³É[ºÏ³É]¹¦ÄÜ£¬ĞèÒªÊµÏÖÒÔÏÂ¼¸¸öº¯ÊıºÍÈ«¾Ö±äÁ¿£º
--       initData() £¨¿ÉÑ¡£©	³õÊ¼»¯Êı¾İ
--       getCompoundParam()		»ñÈ¡[ºÏ³É]²Ù×÷²ÎÊı£¨ÓÃÓÚ´«µİ¸øITEM_CalcItemValue¼ÆËãÎïÆ·¼ÛÖµÁ¿£©
--       verifySrcItems( arynNecessaryItemIdx, arynAlternativeItemIdx )	Ğ£ÑéÔ­ÁÏÊÇ·ñ·ûºÏ[ºÏ³É]¹æÔò£¨Í¬Ê±´æ´¢Ò»Ğ©Ô­ÁÏÊı¾İ£©
--       genDesItemsInfo( arynNecessaryItemIdx )	Éú³ÉÄ¿±êÎïÆ·ĞÅÏ¢
--       	ÎïÆ·ĞÅÏ¢½á¹¹£º{ nItemVer, nRandSeed, nQuality, nGenre, nDetailType, nParticular, nLevel, nSeries, nLuck, {arynMagicLevel}, {arynMagicID}, strCompoundParam }
--       function finalCompound( arynNecessaryItemIdx, arynAlternativeItemIdx, nSrcItemValSum, aryDesItemInfo, arydDesItemVal )	Íê³ÉÑ¡ÔñÄ¿±êÎïÆ·¡¢É¾³ıÔ­ÁÏµÈÊÕÎ²²Ù×÷
--       COMPOUND_COST			[ºÏ³É]·ÑÓÃ
--       * Èç¹û±¾[ºÏ³É]Á÷³Ì¿ò¼Ü²»ÊÊÓÃ£¬Ôò²»°üº¬±¾Í·ÎÄ¼ş£¬×Ô¼ºÖØĞ´Compound½Ó¿Úº¯Êı¼´¿É
-- Fanghao Wu 2005.1.15


IncludeLib( "ITEM" );
Include( "\\script\\item\\itemvalue\\itemvalue_header.lua" );


-- ĞèÒª¼ÇÂ¼LogµÄÎïÆ·
ITEM_TO_LOG =
{
	{ 4, 238, 1, "Lam Thñy Tinh" },
	{ 4, 239, 1, "Tö Thñy Tinh" },
	{ 4, 240, 1, "Lôc Thñy Tinh" },
	{ 6, 1, 122, "Phóc Duyªn Lé (TiÓu) " },
	{ 6, 1, 123, "Phóc Duyªn Lé (Trung) " },
	{ 6, 1, 124, "Phóc Duyªn Lé (§¹i) " },
	{ 6, 1, 398, "ThÇn bİ kho¸ng th¹ch" },
}


-- ÒÔÏÂ¸÷²Ù×÷½á¹ûÖµ±ØĞëºÍ³ÌĞòÖĞGameDataDef.hÀïFOUNDRY_RESULT_TYPEÃ¶¾ÙÖµÒ»Ò»¶ÔÓ¦
RESULT_UNKNOWN			=	-1;						-- Î´Öª´íÎó
RESULT_SUCCEED			=	0;						-- [ºÏ³É]³É¹¦
RESULT_FAIL				=	1;						-- [ºÏ³É]Ê§°Ü
RESULT_NO_MONEY			=	2;						-- ½ğÇ®²»×ã
RESULT_LEVEL_FULL		=	3;						-- Ô­ÁÏÒÑ´ïµ½×î¸ßµÈ¼¶
RESULT_LACK_RESOURCE	=	4;			 			-- Ô­ÁÏ²»×ã
RESULT_LEVEL_ERROR		=	5;						-- Ô­ÁÏµÈ¼¶´íÎó
RESULT_MAGIC_ERROR		=	6;						-- Ô­ÁÏÄ§·¨Öµ´íÎó
RESULT_SERIES_ERROR		=	7;						-- Ô­ÁÏÎåĞĞ´íÎó
RESULT_RULE_ERROR		=	8;						-- Ô­ÁÏ²»·ûºÏ¹æÔò


GLBID_LAST_CMP_DATE		=	32;						-- È«¾Ö±äÁ¿ID of ×îºóÒ»´Î[ºÏ³É]µÄÈÕÆÚ
GLBID_COMMON_VAL_SUM	=	33;						-- È«¾Ö±äÁ¿ID of ÆÕÍ¨ÎïÆ·¼ÛÖµÁ¿»ã×ÜÖµ
GLBID_GOLD_VAL_SUM		=	34;						-- È«¾Ö±äÁ¿ID of »Æ½ğ×°±¸¼ÛÖµÁ¿»ã×ÜÖµ

SUM_UNIT				=	10000000;					-- ´æ´¢µ½GlobalValueµÄµ¥Î»£¨Ç§Íò£©
COMMON_SUM_BASE_VAL		=	100000000 / SUM_UNIT;		-- ĞèÒª¼ÆÈëÆÕÍ¨ÎïÆ·¼ÛÖµÁ¿»ã×ÜÖµµÄ×îµÍ¼ÛÖµÁ¿
COMMON_SUM_MAX_VAL		=	200000000000 / SUM_UNIT;	-- Ã¿ÈÕÔÊĞí[ºÏ³É]µÄÆÕÍ¨ÎïÆ·¼ÛÖµÁ¿»ã×ÜÖµµÄ×î´óÖµ£¬µ½´ï´ËÖµ½«²»ÔÙÔÊĞí½øĞĞÈÎºÎ[ºÏ³É]²Ù×÷
GOLD_SUM_BASE_VAL		=	1000000000 / SUM_UNIT;		-- ĞèÒª¼ÆÈë»Æ½ğ×°±¸¼ÛÖµÁ¿»ã×ÜÖµµÄ×îµÍ¼ÛÖµÁ¿
GOLD_SUM_MAX_VAL		=	200000000000 / SUM_UNIT;	-- Ã¿ÈÕÔÊĞí[ºÏ³É]µÄ»Æ½ğ×°±¸¼ÛÖµÁ¿»ã×ÜÖµµÄ×î´óÖµ£¬µ½´ï´ËÖµ½«²»ÔÙÔÊĞí½øĞĞÈÎºÎ[ºÏ³É]²Ù×÷


-- ¹¦ÄÜ£º±»³ÌĞò·ÃÎÊµÄ½Ó¿Úº¯Êı£¬ÊµÏÖÄ³Ò»[ºÏ³É]²Ù×÷
-- ²ÎÊı£ºarynNecessaryItemIdx		±ØĞëÔ­ÁÏµÄÎïÆ·Ë÷ÒıÊı×é
--       arynAlternativeItemIdx		¿ÉÑ¡Ô­ÁÏµÄÎïÆ·Ë÷ÒıÊı×é
--       bPreview					Ô¤ÀÀ
-- ·µ»Ø£ºÉú³ÉµÄÎïÆ·Ë÷Òı, [ºÏ³É]½á¹û
function Compound( arynNecessaryItemIdx, arynAlternativeItemIdx, bPreview )
	if( isCompoundableToday() ~= 1 ) then
		Say( "Thî rÌn thÇn bİ: H«m nay l·o phu ®· qu¸ mÖt mái, ngµy mai hiÖp sÜ h·y ®Õn ®óc trang bŞ!", 0 );
		return -1, RESULT_FAIL;
	end
	-- ³õÊ¼»¯Êı¾İ
	if( initData ~= nil ) then
		initData();
	end
	-- Ğ£ÑéÔ­ÁÏÊÇ·ñ·ûºÏ[ºÏ³É]¹æÔò£¨Í¬Ê±´æ´¢Ò»Ğ©Ô­ÁÏÊı¾İ£©
	local nResult = verifySrcItems( arynNecessaryItemIdx, arynAlternativeItemIdx );
	if( nResult ~= RESULT_SUCCEED ) then
		return -1, nResult;
	end
	-- Ö§¸¶[ºÏ³É]·ÑÓÃ
	if( COMPOUND_COST == nil or Pay( COMPOUND_COST ) ~= 1 ) then
		return -1, RESULT_NO_MONEY;
	end
	-- ¼ÆËãËùÓĞÔ­ÁÏ¼ÛÖµÁ¿×ÜºÍ
	local nNecItemValSum = sumItemsVal( arynNecessaryItemIdx );
	local nAltItemValSum = sumItemsVal( arynAlternativeItemIdx );
	local dAltItemFinalVal = nAltItemValSum;
	if( sumMainItemVal ~= nil ) then
		nMainItemValSum = sumMainItemVal( arynNecessaryItemIdx );
		dAltItemFinalVal = calcAltItemFinalVal( nMainItemValSum, nAltItemValSum );
	end
	local nSrcItemValSum = nNecItemValSum + dAltItemFinalVal;
--	Msg2Player( "<color=yellow>-----------------------------------" );
--	Msg2Player( "<color=gold>TotalSrcSum: "..nNecItemValSum.."+"..dAltItemFinalVal.."="..nSrcItemValSum );
--	Msg2Player( "<color=yellow>-----------------------------------" );
	-- Éú³ÉÄ¿±êÎïÆ·ĞÅÏ¢
	local aryDesItemInfo = genDesItemsInfo( arynNecessaryItemIdx );
	-- ¼ÆËãÃ¿¸öÄ¿±êÎïÆ·µÄ¼ÛÖµÁ¿
	local arydDesItemVal = {};
	local nDesItemCount = getn( aryDesItemInfo );
	for i = 1, nDesItemCount do
		arydDesItemVal[i] = funitem_calcItemValue(aryDesItemInfo[i]);
--Msg2Player( "<color=green>DesValue"..i..": "..arydDesItemVal[i] );
	end
--	Msg2Player( "<color=yellow>-----------------------------------" );
	
	if( bPreview == 1 ) then	-- Ô¤ÀÀ[ºÏ³É]µÄ³É¹¦ÂÊ
		if( previewProb ~= nil ) then
			previewProb( arynNecessaryItemIdx, arynAlternativeItemIdx, nSrcItemValSum, aryDesItemInfo, arydDesItemVal );
		end
		return -1, RESULT_SUCCEED;
	else						-- ½øĞĞ[ºÏ³É]²Ù×÷
		-- Íê³ÉÑ¡ÔñÄ¿±êÎïÆ·¡¢É¾³ıÔ­ÁÏµÈÊÕÎ²²Ù×÷
		nResultDesItemIdx, nResult = finalCompound( arynNecessaryItemIdx, arynAlternativeItemIdx, nSrcItemValSum, aryDesItemInfo, arydDesItemVal );
		-- ·µ»ØÉú³ÉÎïÆ·Ë÷Òı£¬[ºÏ³É]½á¹û
		return nResultDesItemIdx, nResult;
	end
end

-- Ò»°ãµÄÊÕÎ²²Ù×÷º¯Êı£¨Íê³ÉÑ¡ÔñÄ¿±êÎïÆ·¡¢É¾³ıÔ­ÁÏµÈÊÕÎ²²Ù×÷£©
function defFinalCompound( arynNecessaryItemIdx, arynAlternativeItemIdx, nSrcItemValSum, aryDesItemInfo, arydDesItemVal, funcTransItemVal )
	if (funcTransItemVal == nil) then
		funcTransItemVal = TransItemVal;
	end
	local nSelDesItemIdx, arydDesItemProb, dDesItemProbSum = funcTransItemVal( nSrcItemValSum, arydDesItemVal );
	if( nSelDesItemIdx > 0 ) then
		-- ÀÛ»ıÃ¿ÈÕ[ºÏ³É]µÄÎïÆ·¼ÛÖµÁ¿»ã×ÜÖµ
		local nDesItemValCut = floor( arydDesItemVal[nSelDesItemIdx] / SUM_UNIT );
		if( aryDesItemInfo[nSelDesItemIdx][3] == 1 ) then
			if( nDesItemValCut >= GOLD_SUM_BASE_VAL ) then
				local nGoldEqVal = GetGlbValue( GLBID_GOLD_VAL_SUM );
				SetGlbValue( GLBID_GOLD_VAL_SUM, nGoldEqVal + nDesItemValCut );
				if( nGoldEqVal + nDesItemValCut >= GOLD_SUM_MAX_VAL ) then
					local strMsg = format( " [C¶nh b¸o]%s Tæng gi¸ trŞ trang bŞ Hoµng Kim [ghĞp]h«m nay (%0.2fE) , ®· v­ît qu¸ møc c¶nh b¸o tæng gi¸ trŞ (%0.2fE) , cã thÓ xuÊt hiÖn hiÖn t­îng quĞt vËt phÈm, h·y liªn hÖ khÈn víi bé phËn nghiªn cøu!!!  ", date( "%Y-%m-%d %H:%M:%S" ), ( nGoldEqVal + nDesItemValCut ) * SUM_UNIT / 100000000, GOLD_SUM_MAX_VAL * SUM_UNIT / 100000000 );
					print( strMsg );
					WriteLog( strMsg );
				end
			end
		else
			if( nDesItemValCut >= COMMON_SUM_BASE_VAL ) then
				local nCommonItemVal = GetGlbValue( GLBID_COMMON_VAL_SUM );
				SetGlbValue( GLBID_COMMON_VAL_SUM, nCommonItemVal + nDesItemValCut );
				if( nCommonItemVal + nDesItemValCut >= COMMON_SUM_MAX_VAL ) then
				local strMsg = format( " [C¶nh b¸o]%s Tæng gi¸ trŞ vËt phÈm t­¬ng quan cña Trang bŞ HuyÒn Tinh [ghĞp]h«m nay (%0.2fE) , ®· v­ît qu¸ møc c¶nh b¸o tæng gi¸ trŞ (%0.2fE) , cã thÓ xuÊt hiÖn hiÖn t­îng quĞt vËt phÈm, h·y liªn hÖ khÈn víi bé phËn nghiªn cøu!!!  ", date( "%Y-%m-%d %H:%M:%S" ), ( nCommonItemVal + nDesItemValCut ) * SUM_UNIT / 100000000, COMMON_SUM_MAX_VAL * SUM_UNIT / 100000000 );
					print( strMsg );
					WriteLog( strMsg );
				end
			end
		end
		writeCompoundLog( arynNecessaryItemIdx, arynAlternativeItemIdx, nSrcItemValSum, aryDesItemInfo[nSelDesItemIdx], arydDesItemVal[nSelDesItemIdx], arydDesItemProb[nSelDesItemIdx] );
		removeItems( arynNecessaryItemIdx );
		removeItems( arynAlternativeItemIdx );
		local nResultDesItemIdx = addItemByInfo( aryDesItemInfo[nSelDesItemIdx] );
		if( nResultDesItemIdx > 0 ) then
			return nResultDesItemIdx, RESULT_SUCCEED;
		else	-- Éú³ÉÎïÆ·Ê§°ÜµÄÒì³£Ò²µ±×÷Ëæ»úÊ§°Ü£¬×îºÃ×ö¼ÇÂ¼
			return -1, RESULT_FAIL;
		end
	else
		writeCompoundLog( arynNecessaryItemIdx, arynAlternativeItemIdx, nSrcItemValSum, nil, 0, 1 - dDesItemProbSum );
		removeItems( arynNecessaryItemIdx );
		removeItems( arynAlternativeItemIdx );
		return -1, RESULT_FAIL;
	end
end

-- ¼ÆËãÎïÆ·Êı×é¼ÛÖµÁ¿×ÜºÍ
function sumItemsVal( arynItemIdx )
	local nItemCount = getn( arynItemIdx );
	local nItemValSum = 0;
	local nCurItemVal;
--	Msg2Player( "<color=yellow>-----------------------------------" );
	for i = 1, nItemCount do
		nCurItemVal = ITEM_CalcItemValue( arynItemIdx[i], getCompoundParam() );
--		Msg2Player( "<color=yellow>Value"..i..": "..nCurItemVal );
		nItemValSum = nItemValSum + nCurItemVal;
	end	
--	Msg2Player( "<color=gold>ValueSum: "..nItemValSum );
	return nItemValSum;
end

-- ´ÓÍæ¼ÒÉíÉÏÉ¾³ıÖ¸¶¨ÎïÆ·Êı×éÖĞµÄËùÓĞÎïÆ·
function removeItems( arynItemIdx )
	local nItemCount = getn( arynItemIdx );
	for i = 1, nItemCount do
		if( arynItemIdx[i] ~= nil ) then
			RemoveItemByIndex( arynItemIdx[i] );
		end
	end
end

-- ¸øÍæ¼ÒÔö¼ÓÖ¸¶¨ÎïÆ·ĞÅÏ¢µÄÎïÆ·
function addItemByInfo( iteminfo )
	local nItemIdx;
	if( iteminfo[10] ~= nil ) then
		nItemIdx = AddItemEx( iteminfo[1], iteminfo[2], iteminfo[3], iteminfo[4], iteminfo[5], iteminfo[6], iteminfo[7], iteminfo[8], iteminfo[9], iteminfo[10][1], iteminfo[10][2], iteminfo[10][3], iteminfo[10][4], iteminfo[10][5], iteminfo[10][6] );
	else
		nItemIdx = AddItemEx( iteminfo[1], iteminfo[2], iteminfo[3], iteminfo[4], iteminfo[5], iteminfo[6], iteminfo[7], iteminfo[8], iteminfo[9], 0 );
	end
	if( nItemIdx > 0 ) then
		WriteCompoundLog( format( "DES_RANDSEED:\t%0.0f\tDES_GEN_TIME:\t%0.0f\r\n", ITEM_GetItemRandSeed( nItemIdx ), GetItemGenTime( nItemIdx ) ) );
	else
		WriteCompoundLog( format( "ADD_ITEM_BY_INFO FAILED:\t{%d,%d,%d,%d,%d,%d,%d,%d,%d}\r\n", iteminfo[1], iteminfo[2], iteminfo[3], iteminfo[4], iteminfo[5], iteminfo[6], iteminfo[7], iteminfo[8], iteminfo[9] ) );
	end
	return nItemIdx;
end

-- Ğ´[ºÏ³É]ÈÕÖ¾
function writeCompoundLog( arynNecessaryItemIdx, arynAlternativeItemIdx, nSrcItemValSum, desItemInfo, dDesItemVal, dDesProb )
	local arystrSrc = { "", "" };
	local arynItemIdx = { arynNecessaryItemIdx, arynAlternativeItemIdx };
	for i = 1, 2 do
		for j = 1, getn( arynItemIdx[i] ) do
			local nGenre, nDetailType, nParticular, nLevel, nSeries, nLuck = GetItemProp( arynItemIdx[i][j] );
			local nQuality = GetItemQuality( arynItemIdx[i][j] );
			local arynMagLvl = GetItemAllParams( arynItemIdx[i][j] );
			local nStackCount = GetItemStackCount( arynItemIdx[i][j] );
			arystrSrc[i] = arystrSrc[i]..format( "{%d, %d, %d, %d, %d, %d, %d, <%d, %d, %d, %d, %d, %d>}#%d\t", nQuality, nGenre, nDetailType, nParticular, nLevel, nSeries, nLuck, arynMagLvl[1], arynMagLvl[2], arynMagLvl[3], arynMagLvl[4], arynMagLvl[5], arynMagLvl[6], nStackCount );
		end
	end
	local strDes = "";
	local strResult = "";
	if( desItemInfo ~= nil ) then
		strResult = "SUCCEED";
		if( desItemInfo[10] ~= nil ) then
			strDes = format( "{%d,%d,%d,%d,%d,%d,%d,<%d,%d,%d,%d,%d,%d>}", desItemInfo[3], desItemInfo[4], desItemInfo[5], desItemInfo[6], desItemInfo[7], desItemInfo[8], desItemInfo[9], desItemInfo[10][1], desItemInfo[10][2], desItemInfo[10][3], desItemInfo[10][4], desItemInfo[10][5], desItemInfo[10][6] );
		else
			strDes = format( "{%d,%d,%d,%d,%d,%d,%d,<%d,%d,%d,%d,%d,%d>}", desItemInfo[3], desItemInfo[4], desItemInfo[5], desItemInfo[6], desItemInfo[7], desItemInfo[8], desItemInfo[9], 0, 0, 0, 0, 0, 0 );
		end
	else
		strResult = "FAIL";
		strDes = "NONE";
	end
	WriteCompoundLog( format( "[%s]\t%s\t%s(%s)", getCompoundParam(), strResult, GetAccount( PlayerIndex ), GetName( PlayerIndex ) ) );
	WriteCompoundLog( format( "SRC:\t%s", arystrSrc[1] ) );
	WriteCompoundLog( format( "SRC_EX:\t%s", arystrSrc[2] ) );
	WriteCompoundLog( format( "DES:\t%s", strDes ) );
	WriteCompoundLog( format( "SRC_VAL_SUM:\t%0.0f\tDES_VAL:\t%0.0f\tDES_PROB:\t%0.2f%%", nSrcItemValSum, dDesItemVal, dDesProb*100 ) );
end

-- ÅĞ¶ÏÊÇ·ñ¿ÉÒÔ½øĞĞ[ºÏ³É]£¬¼´»¹Ã»µ½´ïµ±ÈÕ[ºÏ³É]¼ÛÖµ×ÜÁ¿ÉÏÏŞ
function isCompoundableToday()
	local nLastDate = GetGlbValue( GLBID_LAST_CMP_DATE );
	local nTodayString = tonumber( date( "%y%m%d" ) );
	if( nLastDate ~= nTodayString ) then
		SetGlbValue( GLBID_LAST_CMP_DATE, nTodayString );
		SetGlbValue( GLBID_COMMON_VAL_SUM, 0 );
		SetGlbValue( GLBID_GOLD_VAL_SUM, 0 );
	else
		local nCommonItemVal = GetGlbValue( GLBID_COMMON_VAL_SUM );
		local nGoldEqVal = GetGlbValue( GLBID_GOLD_VAL_SUM );
		if( nCommonItemVal >= COMMON_SUM_MAX_VAL or nGoldEqVal >= GOLD_SUM_MAX_VAL ) then
			return 0;
		end
	end
	return 1;
end

-- ¼ÆËã¿ÉÑ¡ÎïÆ·µÄÊÜ[ºÏ³É]¹Ø¼üÎïÆ·ÏŞÖÆ¼ÓÈ¨ºóµÄ¼ÛÖµÁ¿
function calcAltItemFinalVal( nMainItemValSum, nAltItemValSum )
	local dAltItemFinalVal = 0;
	local arySegmentScale = { { 0, 1 }, { 0.5, 0.9 }, { 1, 0.8 }, { 1.5, 0.7 }, { 2, 0.6 } };
	local nSegmentCount = getn( arySegmentScale );
	for i = nSegmentCount, 1, -1 do
		local nSegmentDiff = nAltItemValSum - nMainItemValSum * arySegmentScale[i][1];
		if( nSegmentDiff > 0 ) then
			dAltItemFinalVal = dAltItemFinalVal + nSegmentDiff * arySegmentScale[i][2];
			nAltItemValSum = nAltItemValSum - nSegmentDiff;
		end
	end
	return dAltItemFinalVal;
end

function funitem_calcItemValue(aryDesItemInfo)
	return ITEM_CalcItemValue(aryDesItemInfo[1], aryDesItemInfo[3], aryDesItemInfo[4], aryDesItemInfo[5], aryDesItemInfo[6], aryDesItemInfo[7], aryDesItemInfo[8], aryDesItemInfo[9], aryDesItemInfo[10], aryDesItemInfo[11])
end