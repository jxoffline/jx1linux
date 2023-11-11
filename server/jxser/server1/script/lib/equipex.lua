
-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonline ÊÀ½ç±­»î¶¯ÊµÌå´¦ÀíÎÄ¼ş
-- Edited by peres
-- 2006/05/31 PM 16:13

-- Áè³¿Îåµã£¬¸Ğ¾õÉí±ßÌÉ×ÅµÄÅ®º¢ÒªÆğÉíÀë¿ª¡£
-- ³¤³¤·¢±èÉ¨¹ı£¬ÉíÉÏÈ¹ñŞ·¢³öóùóùÏìÉù¡£
-- ´ÓÆ¤·ôÉ¢·¢³öÀ´µÄÎÂÈÈÈçĞ¡ÊŞµÄÆøÏ¢£¬ÒÀ¾ÉÊìÏ¤¡£
-- Ëû¾ªĞÑ¹ıÀ´£¬¿´µ½Ëı±³¿¿×ÅÇ½×øÔÚ´²µÄÀï±ß£¬¾²¾²¶Ô×ÅÈ÷½øÀ´µÄÔÂ¹â³éÒ»Ö¦ÑÌ¡£
-- ¿´×ÅËû£¬ÇáÉùÎ¢Ğ¦£¬
-- Ëµ£¬ÎÒÔÚÕâÀï¡£
-- ÎÒ»¹Î´×ß¡£

-- ======================================================

-- ¶ÁÈë DEBUG Êä³ö´¦ÀíÎÄ¼ş
Include("\\script\\task\\system\\task_debug.lua");

IncludeLib("ITEM");

-- ²úÉúÒ»¼şÓë´«ÈëµÄ Index µÄ nMagicType ÀàËÆµÄ»Æ½ğ×°±¸
-- ´«Èë²ÎÊı
-- nIndex: Ô­Ê¼×°±¸µÄ Index
-- nNeedGold: ÏëÒªÉú³ÉµÄ»Æ½ğ×°±¸Ë÷Òı
-- nMagicType: ÏëÒª¹Ì¶¨µÄ×°±¸Ä§·¨ÊôĞÔÀàĞÍ
-- nCount: ¼ÆËãµÄ´ÎÊı
-- ·µ»ØÖµ
-- int: ·ÇÁãÔòÎªÔÚ·şÎñÆ÷ÖĞ²úÉú×°±¸µÄĞòºÅ£¬0 ÔòÎªÊ§°Ü
-- ary: ·µ»ØËù²úÉúµÄËùÓĞ×°±¸µÄ Index Êı×é
function createLikeEquip(nIndex, nNeedGold, nNeedMagicType, nCount)
	local nGoldIndex = 0;
	local nCreateIndex = 0;
	
	local nMagicIndex = 0;
	local nNeedValue = 0;
	
	local aryIndex = {};
	
	local nMagicType, nP1, nP2, nP3
	local i=0;
	
	if nIndex<1 or nIndex==nil then
		return 0;
	end;
	
	CDebug:MessageOut("B¾t ®Çu t¹o ra trang bŞ t¹m thêi!");
	
	nGoldIndex = GetGlodEqIndex(nIndex);

	CDebug:MessageOut("NhËn ®­îc sè hiÖu trang bŞ hoµng kim ®­a vµo lµ:"..nGoldIndex);
	
	-- »ñÈ¡Ö¸¶¨Ä§·¨ÊôĞÔµÄÖµ
	for i=1, 6 do
		nMagicType, nP1, nP2, nP3 = GetItemMagicAttrib(nIndex, i);
		if nMagicType==nNeedMagicType then
			nMagicIndex = i;
			nNeedValue = nP1;
			CDebug:MessageOut("NhËn ®­îc vŞ trİ thuéc tİnh chØ ®Şnh t¹i:"..i.."  Gi¸ trŞ:"..nNeedValue);
		end;
	end;
	
	if nNeedValue==0 then
		return 0;
	end;

	--  // ¹¦ÄÜ£ºÔö¼ÓÖ¸¶¨ÏêÏ¸ĞÅÏ¢µÄÎïÆ·µ½ÓÎÏ·ÊÀ½ç // 
	-- // ¸ñÊ½£ºNewItemEx( nVersion, uRandSeed, nQuality, nItemClass, nDetailType, nParticualrType, nLevel, nSeries, nLuck, nItemLevel..6 ) 
	--// ·µ»Ø£ºnItemIdx // Fanghao_Wu 2006.06.01 //--
	for i=1, nCount do
		
		nCreateIndex = NewItemEx(4, 0, 1, 0, nNeedGold - 1, 0, 0, 0, 0, 0);
		nMagicType, nP1, nP2, nP3 = GetItemMagicAttrib(nCreateIndex, nMagicIndex);
		
		CDebug:MessageOut("T¹o sè thø tù vËt phÈm:"..nCreateIndex.." Thuéc tİnh ma ph¸p:"..nP1);
		
		tinsert(aryIndex, nCreateIndex);
		
			if nMagicType==nNeedMagicType and nP1==nNeedValue then
				CDebug:MessageOut("Ngang b»ng víi thuéc tİnh chØ ®Şnh:"..nCreateIndex);
				return nCreateIndex, aryIndex;
			end;
	end;
	
	return 0, aryIndex;
end;