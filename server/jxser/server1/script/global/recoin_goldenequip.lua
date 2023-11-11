IncludeLib("ITEM");
IncludeLib( "FILESYS" );
Include( "\\script\\item\\item_header.lua" );
Include( "\\script\\task\\system\\task_string.lua" );
Include("\\script\\lib\\log.lua")

FILE_Recoin_COMPOUND = "recoin_goldenequip.txt";
--·ÇÉúÖıÏà¹ØµÄÍ·ÎÄ¼ş×ªÒÆ
-- »Æ½ğ×°±¸ËéÆ·¶ÔÓ¦±í

function initRecoinConfig()
	g_aryRecoinConfig = {};
	
	local nLatestItemVer = ITEM_GetLatestItemVersion();
	for i = 0, nLatestItemVer do
		local strFullPath = makeItemFilePath( i, FILE_Recoin_COMPOUND );
		TabFile_Load( strFullPath, strFullPath );
		g_aryRecoinConfig[i+1] = {};
		local nRowCount = TabFile_GetRowCount( strFullPath );
		for j = 2, nRowCount do
			
			local szGoldName = TabFile_GetCell( strFullPath, j, "DES_GOLDNAME", "NoITEM" );
			local nGenre = tonumber( TabFile_GetCell( strFullPath, j, "DES_GENRE", -1 ) );
			local nDetailtype = tonumber( TabFile_GetCell( strFullPath, j, "DES_DETAILTYPE", -1 ) );
			local nFirstPieceDetail = tonumber( TabFile_GetCell( strFullPath, j, "MAR_FIRST_DETAIL", -1 ) );
			local nPieceSum = tonumber( TabFile_GetCell( strFullPath, j, "MAR_COUNT", -1 ) );
			local nBadValues = tonumber( TabFile_GetCell( strFullPath, j, "DES_BADVALUES", 0 ) );
			local nStandardValues = tonumber( TabFile_GetCell( strFullPath, j, "DES_STANDARDVALUES", 0 ) );
		
		
			local szgoldkey = format("[%d,%d]",nGenre,nDetailtype)
			if g_aryRecoinConfig[i+1][szgoldkey] == nil then
				g_aryRecoinConfig[i+1][szgoldkey] = {}
			end
			g_aryRecoinConfig[i+1][szgoldkey].m_szGoldName = szGoldName
			g_aryRecoinConfig[i+1][szgoldkey].m_nFirstPieceDetail = nFirstPieceDetail
			g_aryRecoinConfig[i+1][szgoldkey].m_nPieceSum = nPieceSum
			g_aryRecoinConfig[i+1][szgoldkey].m_nBadValues = nBadValues
			g_aryRecoinConfig[i+1][szgoldkey].m_nStandardValues = nStandardValues
			local nNo = 1
			for k = nFirstPieceDetail,nFirstPieceDetail+nPieceSum-1 do 
				local szgoldpiecekey = format("[%d]",k)
				if g_aryRecoinConfig[i+1][szgoldpiecekey] == nil then
					g_aryRecoinConfig[i+1][szgoldpiecekey] = {}
				end
				g_aryRecoinConfig[i+1][szgoldpiecekey].m_szGoldName = szGoldName
				g_aryRecoinConfig[i+1][szgoldpiecekey].m_nGenre = nGenre
				g_aryRecoinConfig[i+1][szgoldpiecekey].m_nDetailtype = nDetailtype
				g_aryRecoinConfig[i+1][szgoldpiecekey].m_nPieceSum = nPieceSum
				g_aryRecoinConfig[i+1][szgoldpiecekey].m_nPieceNo = nNo
				nNo = nNo + 1
				--g_aryRecoinConfig[i+1][szgoldpiecekey].m_nBadValues = nBadValues
				--g_aryRecoinConfig[i+1][szgoldpiecekey].m_nStandardValues = nStandardValues
			end
		end
	end
end

initRecoinConfig();

-- »Æ½ğ×°±¸°üº¬ËéÆ·ÊıÁ¿ºÍËùĞèĞÅÎïÊıÁ¿¶ÔÓ¦±í
TB_MARK_ITEM_COUNT =
{
	{6, 1},	-- »Æ½ğ°üº¬6¸öÒÔÉÏËéÆ¬ĞèÒªÖÁÉÙ1¸öĞÅÎï
	{9,	2},	-- »Æ½ğ°üº¬9¸öÒÔÉÏËéÆ¬ĞèÒªÖÁÉÙ2¸öĞÅÎï
};

-- »Æ½ğ×°±¸²ğ·Ö¸½¼ÓÎïÆ·µÄ¼ÛÖµÁ¿
TB_ENHANCE_ITEM = {
		["6,1,398"] = 100000000,	-- ÉñÃØ¿óÊ¯
		["6,1,122"] = 600000,		-- ¸£ÔµÂ¶£¨Ğ¡£©
		["6,1,123"] = 1200000,		-- ¸£ÔµÂ¶£¨ÖĞ£©
		["6,1,124"] = 3000000,		-- ¸£ÔµÂ¶£¨´ó£©
		["4,238,1"] = 5000000,		-- À¼Ë®¾§
		["4,239,1"] = 5000000,		-- ×ÏË®¾§
		["4,240,1"] = 5000000,		-- ÂÌË®¾§
};

MARK_ITEM_ID = "4,979,1";								-- »Æ½ğ×°±¸²ğ·ÖĞÅÎï£¨½ğÏ¬£©
GLBID_SPLIT_LAST_DATE = 919;							-- È«¾Ö±äÁ¿ID of ×îºóÒ»´Î×°±¸²ğ·ÖµÄÈÕÆÚ
GLBID_SPLIT_DAILY_COUNT = 920;							-- È«¾Ö±äÁ¿ID of µ±ÌìÖ´ĞĞ×°±¸²ğ·ÖµÄ´ÎÊı
SPLIT_COUNT_DAILY_THRESHOLD = 500;						-- Ò»Ì¨GameSvrÒ»ÌìÄÚ¿ÉÖ´ĞĞ×°±¸²ğ·ÖµÄ´ÎÊıÉÏÏŞ
SPLIT_AVAILABLE_DATE_RANGE = { 20080113, 20080401 };	-- ×°±¸²ğ·Ö¹¦ÄÜ¿ª·ÅµÄ¿ªÊ¼¡¢½áÊøÊ±¼ä

FRAME_EXCHANGE_COIN = 2;			-- ½»»»×°±¸ËéÆ¬ËùĞèÖ§¸¶µÄÍ­Ç®¸öÊı
TASKTMP_EXCHANGE_FRAME = 194;		-- Òª½»»»µÄ×°±¸ËéÆ¬µÄË÷Òı

-- »Æ½ğ×°±¸²ğ·Ö
-- Fanghao_Wu	2006-06-21
function split_entry()
	local aryDescribe = {};
	local nTodayString = tonumber(GetLocalDate("%Y%m%d"));
	
	aryDescribe =
		{
		"<dec><npc>Ta cã thÓ ph©n m¶nh trang bŞ Hoµng Kim. §©y còng lµ t©m huyÕt c¶ ®êi cña s­ phô ta.",
			"Trang bŞ Hoµng Kim nµy cã thÓ chia thµnh mÊy m¶nh?/want_split_preview",
			"Cã thÓ gióp ta ph©n m¶nh trang bŞ Hoµng Kim nµy ®­îc kh«ng?/#want_split(0)",
			"C¸ch ph©n m¶nh trang bŞ Hoµng Kim./about_split",
			"§õng quan t©m, ta chØ thuËn miÖng nãi ra th«i./cancel",
		};
	CreateTaskSay(aryDescribe);
end

function want_split_preview()
	GiveItemUI("Xem thö ph©n m¶nh trang bŞ.", "§Æt vµo trang bŞ Hoµng Kim, Kim Tª, Kho¸ng th¹ch thÇn bİ, Phóc Duyªn Lé ta sÏ cho ng­¬i biÕt sè l­îng m¶nh trang bŞ cã thÓ ph©n ra.", "do_split_preview", "cancel", 1);
end

function want_split(bNoConfirm)
	if (_is_split_available() ~= 1) then
		return
	end
	if (bNoConfirm ~= 1 and CalcFreeItemCellCount() < 9) then
		CreateTaskSay(	{	"<dec><npc>Hµnh trang kh«ng ®ñ kho¶ng trèng, h·y s¾p xÕp sao cho cßn d­ 9 « trèng. NÕu kh«ng, m¶nh trang bŞ rít ra sÏ bŞ ng­êi kh¸c lÊy mÊt, lóc ®ã ®õng tr¸ch ta kh«ng nh¾c nhë.",
							"Hµnh trang ®· ®ñ chç trèng råi, xin h·y tiÕp tôc!/#want_split(1)",
							"VËy ®Ó ta s¾p xÕp l¹i hµnh trang ®·!/cancel"	}	);
	else
		GiveItemUI("Ph©n m¶nh trang bŞ", "§Æt trang bŞ Hoµng Kim, Kim Tª, Kho¸ng th¹ch thÇn bİ, Thñy Tinh, Phóc Duyªn Lé vµo ta míi cã thÓ gióp ng­¬i ph©n m¶nh, NÕu trang bŞ ®Æt vµo trong tr¹ng th¸i bŞ khãa th× m¶nh trang bŞ ph©n ra còng sÏ ë tr¹ng th¸i nµy!", "do_split", "cancel");
	end
end

function about_split()
	local aryDescribe =
	{
		"<dec><npc>Muèn ph©n m¶nh trang bŞ th× ®­a nã cho ta lµ ®­îc, nh­ng ta cÇn mét thø gäi lµ <color=yellow>Kim Tª<color>. Chó ı trang bŞ Hoµng Kim cã thÓ ph©n thµnh 4, 6, 9 m¶nh tïy theo trang bŞ. Ph©n 4 m¶nh th­êng kh«ng cÇn dïng <color=yellow>Kim Tª<color> còng ®­îc. Muèn ph©n 6 m¶nh th× yªu cÇu ph¶i cã İt nhÊt 1 <color=yellow>Kim Tª<color>, muèn ph©n 9 m¶nh th× cÇn 2 <color=yellow>Kim Tª<color>, ngoµi ra nÕu ®­a ta nhiÒu <color=yellow>Kim Tª<color>, <color=yellow>Kho¸ng th¹ch thÇn bİ<color>, <color=yellow>Thñy Tinh<color> vµ <color=yellow>Phóc Duyªn Lé<color> th× m¶nh trang bŞ ph©n thµnh cã thÓ ®­îc nhiÒu h¬n. Ta nhí <color=yellow>Kim Tª<color> cã b¸n trong <color=blue>Kú Tr©n C¸c<color>.",
		"Ta biÕt råi!/split_entry",
	};
	CreateTaskSay(aryDescribe);
end

function do_split(nItemCount)
	_do_split_process(nItemCount, 0);
end

function do_split_preview(nItemCount)
	_do_split_process(nItemCount, 1);
end

function _do_split_process(nItemCount, bPreview)
	local nComposeEntryIdx = 0;
	local nMarkItemCount = 0;
	local nSrcItemValueSum = 0;
	local szContinueFunc = "";
	local szItemInfo = "";
	if (bPreview ~= 1) then
		if (_is_split_available() ~= 1) then
			return
		end
		szContinueFunc = "#want_split(0)";
	else
		szContinueFunc = "#want_split_preview()";
	end
	
	local nItemBindState;	--Ô­ÁÏ»Æ½ğµÄ°ó¶¨×´Ì¬
	local tb_enhanceitem_count = {};
	for szkey, tb_item in TB_ENHANCE_ITEM do
		tb_enhanceitem_count[szkey] = {};
		tb_enhanceitem_count[szkey][1] = 0;
	end;
	local nversion,nFirstPiece,nPieceSum,nBadVaules,nStandardValues,szgoldName;
	-- Ğ£ÑéÎïÆ·ÊÇ·ñÆ¥Åä
	for i = 1, nItemCount do
		local nCurItemIdx = GetGiveItemUnit(i);
		local nCurItemName = GetItemName(nCurItemIdx);
		local nCurItemQuality = GetItemQuality(nCurItemIdx);
		local tbCurItemProp = pack(GetItemProp(nCurItemIdx));
		local nExpiredTime = ITEM_GetExpiredTime(nCurItemIdx);
		local nCurItemValue = 0;
		if (nCurItemQuality == 1) then
			--Èç¹û²»ÊÇ×°±¸(¿ÉÄÜÊÇËğ»µ×°±¸)
			if (tbCurItemProp[1] ~= 0) then
				CreateTaskSay(	{	"<dec><npc>Ngoµi <color=yellow>trang bŞ Hoµng Kim<color> vµ <color=yellow>Kim Tª<color> ra, chØ cã <color=yellow>Kho¸ng th¹ch thÇn bİ<color>, <color=yellow>Thñy Tinh<color> vµ <color=yellow>Phóc Duyªn Lé<color> lµ nguyªn liÖu ta cÇn, nh÷ng thø kh¸c h·y cÊt l¹i ®i.",
					format("Ha ha, ®¹i hiÖp còng cã lóc bÊt cÈn, ®Ó ta ®Æt vµo l¹i./%s",szContinueFunc),
					"ThËt ng¹i qu¸, ta sÏ quay l¹i sau./cancel"	}	);
				return
			end
			
			
			if (nExpiredTime > 0) then -- ÓĞ±£ÖÊÆÚµÄ×°±¸£¬²»ÄÜ²ğ£¡
				CreateTaskSay(	{	"<dec><npc>Trang bŞ cã <color=fire>thêi h¹n sö dông<color> th× kh«ng thÓ rÌn ®­îc.",
									"ThËt lµ thø lçi, ta l¹i bá nhÇm n÷a råi. Mét lóc sau quay l¹i nhĞ/cancel"	}	);
				return
			end
			
			
			nversion = ITEM_GetItemVersion( nCurItemIdx ) + 1;
			
			local szgoldkey = format("[0,%d]",GetGlodEqIndex(nCurItemIdx))
			if nFirstPiece == nil then
				if (g_aryRecoinConfig[nversion][szgoldkey])~= nil then
							szgoldName = g_aryRecoinConfig[nversion][szgoldkey].m_szGoldName
							nFirstPiece = g_aryRecoinConfig[nversion][szgoldkey].m_nFirstPieceDetail
							nPieceSum = g_aryRecoinConfig[nversion][szgoldkey].m_nPieceSum
							nBadVaules = g_aryRecoinConfig[nversion][szgoldkey].m_nBadValues
							nStandardValues = g_aryRecoinConfig[nversion][szgoldkey].m_nStandardValues
				end
			else
				CreateTaskSay(	{	"<dec><npc>Kh¸ch quan muèn ph©n m¶nh trang bŞ Hoµng Kim nµo? Ta kh«ng hoa m¾t chø?",
									format("Ha ha, ®¹i hiÖp còng cã lóc bÊt cÈn, ®Ó ta ®Æt vµo l¹i./%s",szContinueFunc),
									"ThËt ng¹i qu¸, ta sÏ quay l¹i sau./cancel"	}	);
				return
			end
			
			if (nFirstPiece == nil) then
				CreateTaskSay(	{	format("<dec><npc>ThËt ®¸ng tiÕc, víi kh¶ n¨ng hiÖn thêi cña ta, kh«ng thÓ gióp ng­¬i ph©n m¶nh trang bŞ Hoµng Kim <color=yellow>%s<color> nµy.",GetItemName(nCurItemIdx)),
									format("ChÕ t¹o trang bŞ Hoµng Kim kh¸c./%s",szContinueFunc),
									"ThËt ng¹i qu¸, ta sÏ quay l¹i sau./cancel"	}	);
				return
			end
			nCurItemValue = nBadVaules;
			nItemBindState = GetItemBindState(nCurItemIdx)	--»ñÈ¡°ó¶¨×´Ì¬
			szItemInfo = getItemInfo(nCurItemIdx);
			writeRecoinLog("[Nguyªn liÖu chİnh ph©n m¶nh Hoµng Kim]", szItemInfo);
		else
			local szItemKey = format("%s,%s,%s",tbCurItemProp[1],tbCurItemProp[2],tbCurItemProp[3])
			if (szItemKey == MARK_ITEM_ID) then
				nMarkItemCount = nMarkItemCount + 1;
				nCurItemValue = ITEM_CalcItemValue(nCurItemIdx);
			else
				if (TB_ENHANCE_ITEM[szItemKey] == nil) then
					CreateTaskSay(	{	"<dec><npc>Ngoµi <color=yellow>trang bŞ Hoµng Kim<color> vµ <color=yellow>Kim Tª<color> ra, chØ cã <color=yellow>Kho¸ng th¹ch thÇn bİ<color>, <color=yellow>Thñy Tinh<color> vµ <color=yellow>Phóc Duyªn Lé<color> lµ nguyªn liÖu ta cÇn, nh÷ng thø kh¸c h·y cÊt l¹i ®i.",
										format("Ha ha, ®¹i hiÖp còng cã lóc bÊt cÈn, ®Ó ta ®Æt vµo l¹i./%s",szContinueFunc),
										"ThËt ng¹i qu¸, ta sÏ quay l¹i sau./cancel"	}	);
					return
				end
				nCurItemValue = TB_ENHANCE_ITEM[szItemKey];
				tb_enhanceitem_count[szItemKey][1] = tb_enhanceitem_count[szItemKey][1] + 1;
				tb_enhanceitem_count[szItemKey][2] = nCurItemName;
			end
		end
		nSrcItemValueSum = nSrcItemValueSum + nCurItemValue;
	end
	if (szgoldName == nil) then
		CreateTaskSay(	{	"<dec><npc>NÕu muèn ta gióp ph©n m¶nh trang bŞ th× h·y ®em trang bŞ ®ã ®Õn ®©y, kh«ng cã trang bŞ ta kh«ng thÓ gióp ng­¬i.",
							format("Ha ha, ®¹i hiÖp còng cã lóc bÊt cÈn, ®Ó ta ®Æt vµo l¹i./%s",szContinueFunc),
							"ThËt ng¹i qu¸, ta sÏ quay l¹i sau./cancel"	}	);
		return
	end
	for i = getn(TB_MARK_ITEM_COUNT), 1, -1 do
		if (nPieceSum >= TB_MARK_ITEM_COUNT[i][1]) then
			if (nMarkItemCount < TB_MARK_ITEM_COUNT[i][2]) then
				CreateTaskSay(	{	format("<dec><npc>Ph©n m¶nh trang bŞ nµy cÇn İt nhÊt <color=yellow>%s Kim Tª<color>, nÕu kh«ng ph¶i trang bŞ Hoµng Kim th× cã thÓ sÏ bŞ háng. §i t×m ®ñ <color=yellow>Kim Tª<color> råi h·y quay l¹i. Ta nhí vËt nµy cã b¸n ë <color=blue>Kú Tr©n C¸c<color>.",TB_MARK_ITEM_COUNT[i][2]),
									format("§· ®ñ råi, ®Ó ta thö l¹i xem!/%s",szContinueFunc),
									"ThËt ng¹i qu¸, ta sÏ quay l¹i sau./cancel"	}	);
				return
			end
			break;
		end
	end
	
	-- Ğ£ÑéÎïÆ·Æ¥Åä³É¹¦£¬¼ÆËãËéÆ¬ÊıÁ¿¼°¸ÅÂÊ
	local aryProb = { { 0, 0 }, { 0, 0 } };
	local dFrameCount = nSrcItemValueSum / nStandardValues * nPieceSum;
	if (dFrameCount >= nPieceSum) then
		-- Í¶Èë´óÓÚ×î¶àËéÆ¬µÄ×Ü¼ÛÖµÁ¿£¬°Ù·Ö°Ù³ö×î¶àËéÆ¬
		aryProb[1][1] = nPieceSum;
		aryProb[1][2] = 1;
	else
		aryProb[1][1] = ceil(dFrameCount);
		aryProb[1][2] = 1 - (ceil(dFrameCount) - dFrameCount);
		aryProb[2][1] = aryProb[1][1] - 1;
		aryProb[2][2] = 1 - aryProb[1][2];
	end
	
	if (bPreview == 1) then
		local szPrompt = "<dec><npc>"
		for i = 1, 2 do
			if (aryProb[i][2] > 0) then
				if (aryProb[i][1] > 0) then
					szPrompt = szPrompt..format("trang bŞ Hoµng Kim nµy cã x¸c suÊt \n<color=yellow>%5.2f%%<color> cã thÓ ph©n thµnh <color=yellow>%d<color> m¶nh\n", aryProb[i][2] * 100, aryProb[i][1]);
				else
					szPrompt = szPrompt..format("trang bŞ nµy cã \n<color=yellow>%5.2f%%<color> kh¶ n¨ng ph©n m¶nh thÊt b¹i\n", aryProb[i][2] * 100);
				end
			end
		end
		CreateTaskSay(	{	szPrompt,
							"H·y gióp ta xem trang bŞ kh¸c cã thÓ ph©n thµnh bao nhiªu m¶nh./want_split_preview",
							"Cã thÓ gióp ta ph©n m¶nh trang bŞ Hoµng Kim nµy ®­îc kh«ng?/#want_split(0)",
							"Ta biÕt råi, xin ®a t¹./cancel"	}	);
		return
	else
		-- É¾Ô­ÁÏ
		for i = 1, nItemCount do
			if (RemoveItemByIndex(GetGiveItemUnit(i)) ~= 1) then
				WriteLog(format("[Ph©n m¶nh trang bŞ Hoµng Kim] %s\t%s\t%s\t xãa vËt phÈm thÊt b¹i \t%s",GetLocalDate("%Y-%m-%d %H:%M:%S"),GetAccount(),GetName(),GetItemName(GetGiveItemUnit(i))));
				return
			end
		end
		-- ¸øËéÆ¬
		if (random() <= aryProb[1][2]) then
			dFrameCount = aryProb[1][1];
		else
			dFrameCount = aryProb[2][1];
		end
		local aryFrameDetailType = {};
		local szExpendableLog = "";
		local szFrameNameLog = "";
		for i = 1, nPieceSum do
			aryFrameDetailType[i] = nFirstPiece + i - 1;
		end
		for i = 1, dFrameCount do
			local nRandNum = random(getn(aryFrameDetailType));
			local nIdx = NewItemEx(4, 0, 0, 4, aryFrameDetailType[nRandNum], 1, 0, 0, 0);
			if nItemBindState ~= 0 then 
				--°ÑËéÆ¬ÉèÖÃÎªÔ´»Æ½ğ×°±¸µÄ°ó¶¨×´Ì¬Öµ
				SetItemBindState(nIdx, nItemBindState)
			end
			AddItemByIndex(nIdx);
			szFrameNameLog = szFrameNameLog..szgoldName..format("M¶nh [%s]\t",aryFrameDetailType[nRandNum]);
			tremove(aryFrameDetailType, nRandNum);
		end
		if (dFrameCount > 0) then
			CreateTaskSay(	{	format("<dec><npc> Trang bŞ <color=yellow>%s<color> ph©n m¶nh xong råi, h·y mang <color=yellow>%s<color> m¶nh nµy ®i. NÕu ngµy nµo muèn hîp thµnh chóng l¹i th× h·y mang c¸c m¶nh nµy ®Õn gÆp ta.",szgoldName,dFrameCount),
								"Xin ®a t¹!/cancel"	}	);
		else
			CreateTaskSay(	{	format("<dec><npc>Ph©n m¶nh <color=yellow>%s<color> thÊt b¹i, lÇn sau h·y dïng nhiÒu nguyªn liÖu h¬n.",szgoldName),
								"Ta biÕt råi!/cancel"	}	);
		end
		-- ¼ÇÂ¼Ã¿ÈÕ×°±¸²ğ·ÖÖ´ĞĞ´ÎÊı
		SetGlbValue(GLBID_SPLIT_DAILY_COUNT, GetGlbValue(GLBID_SPLIT_DAILY_COUNT) + 1);
		-- ¼ÇÂ¼Log
		for szkey, tb_item in tb_enhanceitem_count do
			if (tb_enhanceitem_count[szkey][1] > 0) then
			szExpendableLog = szExpendableLog..tb_enhanceitem_count[szkey][2]..format("[%s](%s#)\t",szkey,tb_enhanceitem_count[szkey][1]);
			end;
		end;
	WriteLog(format("[Ph©n m¶nh Hoµng Kim] %s\t%s\t%s\t%s\t tiªu hao: Kim Tª (%s)\t%s ph©n thµnh %s m¶nh:",GetLocalDate("%Y-%m-%d %H:%M:%S"),GetAccount(),GetName(),szgoldName,nMarkItemCount,szExpendableLog,dFrameCount,szFrameNameLog));
		writeRecoinLog("[Ph©n m¶nh trang bŞ Hoµng Kim]", szItemInfo);
		return
	end
end

-- ÅĞ¶ÏÊÇ·ñ¿ÉÒÔ½øĞĞ×°±¸²ğ·Ö£¬¼´ÔÚ¿ª·ÅÈÕÆÚÄÚ£¬²¢ÇÒ»¹Ã»µ½´ïµ±ÈÕ×°±¸²ğ·Ö´ÎÊıÉÏÏŞ
function _is_split_available()
	local nTodayString = tonumber(GetLocalDate("%Y%m%d"));
	--reloadRecoinGoldenDate();
	
	local nLastDate = GetGlbValue(GLBID_SPLIT_LAST_DATE);
	if (nLastDate ~= nTodayString) then
		SetGlbValue(GLBID_SPLIT_LAST_DATE, nTodayString);
		SetGlbValue(GLBID_SPLIT_DAILY_COUNT, 0);
	else
		local nDailySplitCount = GetGlbValue(GLBID_SPLIT_DAILY_COUNT);
		if (nDailySplitCount >= SPLIT_COUNT_DAILY_THRESHOLD) then
			CreateTaskSay(	{	"<dec><npc>Xin thø lçi, h«m nay ta ®· qu¸ mÖt, ngµy mai h·y quay l¹i nhĞ!",
								"VËy ta sÏ quay l¹i sau!/cancel"	}	);
			return 0;
		end
	end
	return 1;
end

-- »Æ½ğ×°±¸ËéÆ¬ºÏ³É
-- Ğ¡ÀË¶à¶à
function compose_entry()
	local aryDescribe =
	{
		"<dec><npc>ChØ cÇn ®­a ta toµn bé m¶nh trang bŞ, kh«ng d­ kh«ng thiÕu hoÆc cã 2 m¶nh trang bŞ gièng nhau, ta sÏ gióp ng­¬i hîp thµnh.",
		"Ta cã ®ñ bé m¶nh trang bŞ muèn nhê «ng hîp thµnh./want_compose",
		"Ta chØ ghĞ xem cho biÕt./cancel",
	};
	CreateTaskSay(aryDescribe);
end

function want_compose(bNoConfirm)
--	if (bNoConfirm ~= 1 and CalcFreeItemCellCount() < 6) then
--		CreateTaskSay(	{	"<dec><npc>Äã±³°üµÄÊ£Óà¿Õ¼ä²»¶àÁË£¬×îºÃÕûÀíÒ»ÏÂÁô³ö6¸ñ¿Õ¼äÀ´£¬·ñÔòºÏ³ÉºÃµÄ»Æ½ğ×°±¸µôµØÉÏ±»±ğÈË¼ñ×ß¿É±ğ¹ÖÎÒÃ»ÌáĞÑÄãÅ¶¡£",
--							"±³°ü¿Õ¼ä¹»ÁË£¬Ã»¹ØÏµ£¬¼ÌĞø°É/#want_compose(1)",
--							"ÄÇÎÒÏÈÕûÀíÒ»ÏÂ±³°ü°É/cancel"	}	);
--	else
		GiveItemUI("Hîp thµnh trang bŞ", "Muèn hîp thµnh trang bŞ ph¶i cã ®ñ bé c¸c m¶nh cña trang bŞ ®ã. NÕu m¶nh trang bŞ ®ang trong tr¹ng th¸i bŞ khãa th× trang bŞ hîp thµnh vÉn sÏ trong tr¹ng th¸i khãa.", "do_compose", "cancel", 1);
--	end
end

function do_compose(n_count)
	if (n_count <= 0) then
		CreateTaskSay(	{	"<dec><npc>NÕu muèn hîp thµnh trang bŞ th× h·y ®em c¸c m¶nh trang bŞ cho ta, nÕu kh«ng ®ñ bé ta kh«ng gióp ng­êi ®­îc.",
							"Ha ha, ®¹i hiÖp còng cã lóc bÊt cÈn, ®Ó ta ®Æt vµo l¹i./want_compose",
							"ThËt ng¹i qu¸, ta sÏ quay l¹i sau./cancel"	}	);
		return
	end

	--¿´¿´ÊÇ²»ÊÇËùÓĞÎïÆ·¶¼ÊÇÍ¬Ò»ÖÖÀà
	local n_goldgenre,n_golddetail,nversion,szgoldname,nPieceSum,nFirstPiece
	local tb_tgot = {}
	for i = 1, n_count do 
		local n_itemidx = GetGiveItemUnit(i)
		
		nversion = ITEM_GetItemVersion( n_itemidx ) + 1;

		local tb_p
		tb_p = pack(GetItemProp(n_itemidx))
		local szgoldkey = format("[%d]",tb_p[2])

--		print(GetItemProp(n_itemidx))
		if (tb_p[1] ~= 4 or g_aryRecoinConfig[nversion][szgoldkey] == nil ) then
			CreateTaskSay(	{	"<dec><npc>Hîp thµnh trang bŞ chØ cÇn cã m¶nh trang bŞ t­¬ng øng lµ ®­îc, nh÷ng thø kh¸c ng­¬i h·y cÊt l¹i ®i.",
								"Ha ha, ®¹i hiÖp còng cã lóc bÊt cÈn, ®Ó ta ®Æt vµo l¹i./want_compose",
								"ThËt ng¹i qu¸, ta sÏ quay l¹i sau./cancel"	}	);
			return
		elseif (GetItemStackCount(n_itemidx) ~= 1) then
			CreateTaskSay(	{	"<dec><npc>m¶nh trang bŞ kh«ng thÓ xÕp chång. Ng­¬i kh«ng nghe ta dÆn råi!",
								"Ha ha, ®¹i hiÖp còng cã lóc bÊt cÈn, ®Ó ta ®Æt vµo l¹i./want_compose",
								"ThËt ng¹i qu¸, ta sÏ quay l¹i sau./cancel"	}	);
			return
		elseif not n_golddetail then	--¸ù¾İµÚÒ»¸öÎïÆ·ÕÒµ½ÒªºÏ³ÉµÄÊÇÄÄÖÖËéÆ¬

				nPieceSum = g_aryRecoinConfig[nversion][szgoldkey].m_nPieceSum
				n_goldgenre = g_aryRecoinConfig[nversion][szgoldkey].m_nGenre
				n_golddetail = g_aryRecoinConfig[nversion][szgoldkey].m_nDetailtype
				szgoldname = g_aryRecoinConfig[nversion][szgoldkey].m_szGoldName
				
				if (n_count > nPieceSum) then
					CreateTaskSay(	{	format("<dec><npc>Kh¸ch quan muèn hîp thµnh <color=yellow]>%s<color>? §­a ta nhiÒu ®å vËy ®Ó lµm g×? ChØ cÇn <color=yellow>%s<color> m¶nh lµ ®­îc.",szgoldname,nPieceSum),
											"Ha ha, ®¹i hiÖp còng cã lóc bÊt cÈn, ®Ó ta ®Æt vµo l¹i./want_compose",
											"ThËt ng¹i qu¸, ta sÏ quay l¹i sau./cancel"	}	);
						return
				elseif (n_count < nPieceSum) then
					CreateTaskSay(	{	format("<dec><npc>Kh¸ch quan muèn hîp thµnh <color=yellow>%s<color>? Kh«ng cã ®ñ m¶nh trang bŞ, kh«ng thÓ hîp thµnh.",szgoldname),
											"Ha ha, ®¹i hiÖp còng cã lóc bÊt cÈn, ®Ó ta ®Æt vµo l¹i./want_compose",
											"ThËt ng¹i qu¸, ta sÏ quay l¹i sau./cancel"	}	);
						return
				end
					n_type = 1

		elseif (g_aryRecoinConfig[nversion][szgoldkey].m_nDetailtype ~= n_golddetail) then	--³ıµÚÒ»¸öÍâ£¬ËùÓĞËéÆ¬¶¼Ó¦ÊÇÍ¬Ò»ÖÖÀà
			CreateTaskSay(	{	"<dec><npc>Hîp thµnh trang bŞ cÇn cã m¶nh trang bŞ, ng­¬i ®­a ta m¶nh trang bŞ kh«ng ®óng, kh«ng thÓ hîp thµnh.",
								"Ha ha, ®¹i hiÖp còng cã lóc bÊt cÈn, ®Ó ta ®Æt vµo l¹i./want_compose",
								"ThËt ng¹i qu¸, ta sÏ quay l¹i sau./cancel"	}	);
			return
		end

		local n_sid = tb_p[2]
		if tb_tgot[n_sid] then	--·ÅÁËÁ½ÕÅÍ¬ÑùµÄËéÆ¬½øÀ´
			CreateTaskSay(	{	format("<dec><npc>Ta kh«ng cÇn 2 m¶nh trang bŞ gièng nhau, hîp thµnh <color=yellow>%s<color> cÇn <color=yellow>%s<color>  <color=yellow>m¶nh %s<color>, h·y nhí kü!",szgoldname,nPieceSum,szgoldname),
								"Ha ha, ®¹i hiÖp còng cã lóc bÊt cÈn, ®Ó ta ®Æt vµo l¹i./want_compose",
								"ThËt ng¹i qu¸, ta sÏ quay l¹i sau./cancel"	}	);
			return
		end
		tb_tgot[n_sid] = 1	--ÒÑÓĞËéÆ¬±ê¼Ç
	end
	--°²È«¼ì²é£¬·¢²¼ºó¿ÉÒÔÉ¾µô£¨Èç¹ûÓĞĞÅĞÄµÄ»°£©
	local szkey = format("[0,%d]",n_golddetail)
	if g_aryRecoinConfig[nversion][szkey] == nil then
			CreateTaskSay(	{	"<dec><npc>Ph¸t sinh lçi hÖ thèng?", "Cho¸ng.../cancel"	}	);
			local str = "do_compose ERROR!!! not tb_tgot "..i;
			WriteLog(format("[Hîp thµnh m¶nh trang bŞ Hoµng Kim] %s\t%s\t%s\t%s",GetLocalDate("%Y-%m-%d %H:%M:%S"),GetAccount(),GetName(),str));		
	end
	for i = g_aryRecoinConfig[nversion][szkey].m_nFirstPieceDetail,g_aryRecoinConfig[nversion][szkey].m_nPieceSum-1 do
		if not tb_tgot[i] then
			CreateTaskSay(	{	"<dec><npc>Ph¸t sinh lçi hÖ thèng?", "Cho¸ng.../cancel"	}	);
			local str = "do_compose ERROR!!! not tb_tgot "..i;
			WriteLog(format("[Hîp thµnh m¶nh trang bŞ Hoµng Kim] %s\t%s\t%s\t%s",GetLocalDate("%Y-%m-%d %H:%M:%S"),GetAccount(),GetName(),str));
			return
		end
	end
	--É¾Ô­ÁÏ
	local bBind = nil
	for i=1, n_count do
		local nIdx = GetGiveItemUnit(i)
		if (GetItemBindState(nIdx) ~= 0) then
			bBind = 1
		end
		if (RemoveItemByIndex(nIdx) ~= 1) then
			WriteLog(format("<Hîp thµnh m¶nh Hoµng Kim> %s\t%s\t%s\t xãa vËt phÈm thÊt b¹i \t%s",GetLocalDate("%Y-%m-%d %H:%M:%S"),GetAccount(),GetName(),GetItemName(GetGiveItemUnit(i))));
			return
		end
	end
	--¸øÎïÆ·
	
	local str = format("Hîp thµnh <color=yellow>%s<color> thµnh c«ng!",szgoldname)
	Msg2Player(str)
	local nItem = AddGoldItem(n_goldgenre,n_golddetail)
	local szItemInfo = getItemInfo(nItem);
	--Ö»ÒªÔ­ÁÏÖĞÓĞ°ó¶¨»ò½â°ó×´Ì¬£¬ºÏ³öµÄ»Æ½ğÎª°ó¶¨
	if (bBind) then
		BindItem(nItem)
	end
	--AddGlobalNews("¾İ´«ÎÅ "..GetName().." ÓÃ×°±¸ËéÆ¬³É¹¦ºÏ³ÉÁË"..szgoldname.."¡£")
	WriteLog(format("[Hîp thµnh m¶nh trang bŞ Hoµng Kim] %s\t%s\t%s\t%s",GetLocalDate("%Y-%m-%d %H:%M:%S"),GetAccount(),GetName(),str));
	writeRecoinLog("[M¶nh Hoµng Kim hîp thµnh Hoµng Kim]", szItemInfo);
end

-- »Æ½ğ×°±¸ËéÆ¬½»»»
--
function exchange_entry()
	local aryDescribe =
	{
		format("<dec><npc>ChØ cÇn ®­a <color=yellow>%s tiÒn ®ång<color> ta sÏ gióp ng­¬i ®æi m¶nh trang bŞ t­¬ng øng.",FRAME_EXCHANGE_COIN),
		"§õng quan t©m, ta chØ thuËn miÖng nãi ra th«i./cancel",
	};
	for i = 9, 1, -1 do
		tinsert(aryDescribe, 2, format("M¶nh thø %d/#want_exchange(%d)",i,i));
	end
	CreateTaskSay(aryDescribe);
end

function want_exchange(nFrameIdx)
	if (CalcItemCount(3, 4, 417, 1, -1) < FRAME_EXCHANGE_COIN) then
		CreateTaskSay(	{	format("<dec><npc>Kh«ng cã tiÒn ®ång lµm sao ®æi m¶nh trang bŞ. H·y t×m ®ñ <color=yellow>%s tiÒn ®ång<color> råi h·y quay l¹i gÆp ta.",FRAME_EXCHANGE_COIN),
							"ThËt ng¹i qu¸, ta sÏ quay l¹i sau./cancel"	}	);
		return
	end
	SetTaskTemp(TASKTMP_EXCHANGE_FRAME, nFrameIdx);
	GiveItemUI("§æi m¶nh trang bŞ", "§Æt vµo 1 m¶nh trang bŞ muèn ®æi. TiÒn ®ång sÏ tù ®éng bŞ khÊu trõ.", "do_exchange", "cancel", 1);
end

function do_exchange(nItemCount)
	if (nItemCount ~= 1) then
		CreateTaskSay(	{	"<dec><npc>Mét lÇn chØ cã thÓ ®æi 1 m¶nh.",
							"Ha ha, ®¹i hiÖp còng cã lóc bÊt cÈn, ®Ó ta ®Æt vµo l¹i./exchange_entry",
							"ThËt ng¹i qu¸, ta sÏ quay l¹i sau./cancel"	}	);
		return
	end
	local nItemIdx = GetGiveItemUnit(1);
	local tbItemProp = pack(GetItemProp(nItemIdx));
	local nFirstPiece,nPieceSum,nPieceNo,nFirstPiece
	if GetItemStackCount(nItemIdx) ~= 1 then
		CreateTaskSay(	{	"<dec><npc> M¶nh trang bŞ kh«ng thÓ xÕp chång, mçi lÇn chØ cã thÓ ®æi 1 m¶nh.",
							"Ha ha, ®¹i hiÖp còng cã lóc bÊt cÈn, ®Ó ta ®Æt vµo l¹i./exchange_entry",
							"ThËt ng¹i qu¸, ta sÏ quay l¹i sau./cancel"	}	);
		return		
	end
	if (tbItemProp[1] == 4) then
		local szgoldkey = format("[%d]",tbItemProp[2])
		local nversion = ITEM_GetItemVersion( nItemIdx ) + 1;
		
		if g_aryRecoinConfig[nversion][szgoldkey] ~= nil then
			--nFirstPiece = g_aryRecoinConfig[nversion][szgoldkey].m_nFirstPieceDetail
			nPieceSum = g_aryRecoinConfig[nversion][szgoldkey].m_nPieceSum
			szGoldName = g_aryRecoinConfig[nversion][szgoldkey].m_szGoldName
			nPieceNo = g_aryRecoinConfig[nversion][szgoldkey].m_nPieceNo
			nFirstPiece = tbItemProp[2] - (nPieceNo - 1)
		end
	end
	if nPieceSum == nil then
		CreateTaskSay(	{	"<dec><npc>Ta chØ cã thÓ gióp ng­¬i ®æi m¶nh trang bŞ Hoµng Kim, ng­¬i ®­a ta c¸i g× vËy?",
							"Ha ha, ®¹i hiÖp còng cã lóc bÊt cÈn, ®Ó ta ®Æt vµo l¹i./exchange_entry",
							"ThËt ng¹i qu¸, ta sÏ quay l¹i sau./cancel"	}	);
		return
	end
	local nExchangeFrameIdx = GetTaskTemp(TASKTMP_EXCHANGE_FRAME);
	if (nExchangeFrameIdx < 1 or nExchangeFrameIdx > nPieceSum) then
		CreateTaskSay(	{	format("<dec><npc>M¶nh <color=yellow>%s<color> muèn ®æi tæng céng cã <color=yellow>%s<color> m¶nh, kh«ng cã m¶nh thø <color=yellow>%s<color>.",szGoldName,nPieceSum,nExchangeFrameIdx),
							"Ha ha, ®¹i hiÖp còng cã lóc bÊt cÈn, ®Ó ta ®Æt vµo l¹i./exchange_entry",
							"ThËt ng¹i qu¸, ta sÏ quay l¹i sau./cancel"	}	);
		return
	end
	if (CalcItemCount(3, 4, 417, 1, -1) < FRAME_EXCHANGE_COIN) then
		CreateTaskSay(	{	format("<dec><npc>Kh«ng cã tiÒn ®ång lµm sao ®æi m¶nh trang bŞ. H·y t×m ®ñ <color=yellow>%s tiÒn ®ång<color> råi h·y quay l¹i gÆp ta.",FRAME_EXCHANGE_COIN),
							"ThËt ng¹i qu¸, ta sÏ quay l¹i sau./cancel"	}	);
		return
	end
	if (ConsumeItem(3, FRAME_EXCHANGE_COIN, 4, 417, 1, -1) ~= 1) then
		WriteLog(format("[§æi m¶nh Hoµng Kim] %s\t%s\t%s\t Xãa tiÒn ®ång thÊt b¹i.",GetLocalDate("%Y-%m-%d %H:%M:%S"),GetAccount(),GetName()));
		return
	end
	if (RemoveItemByIndex(nItemIdx) ~= 1) then
		WriteLog(format("[§æi m¶nh Hoµng Kim] %s\t%s\t%s\t Xãa vËt phÈm thÊt b¹i \t%s",GetLocalDate("%Y-%m-%d %H:%M:%S",GetAccount(),GetName(),GetItemName(nItemIdx))));
	end
	AddItem(4, nFirstPiece + nExchangeFrameIdx - 1, 1, 0, 0, 0);
	CreateTaskSay(	{	format("<dec><npc>T×m thÊy m¶nh thø  <color=yellow>%s<color> cña  <color=yellow>%s<color>, h·y cÇm lÊy ®i!",nExchangeFrameIdx,szGoldName),
						"Xin ®a t¹!/cancel"	}	);
	WriteLog(format("[§æi m¶nh Hoµng Kim] %s\t%s\t%s\t%s m¶nh(%s) ®æi thµnh (%s)",GetLocalDate("%Y-%m-%d %H:%M:%S"),GetAccount(),GetName(),szGoldName,tbItemProp[2],(nFirstPiece + nExchangeFrameIdx - 1)));
end

function pack(...)
	return arg
end

function cancel()
end

--{randseed,q,g,d,P,level,series,lucky,<magic1,magic2,magic3,magic4,magic5,magic6>}(gentime)(platinalvl)

--[Ê±¼ä]	[»Æ½ğ²ğ·Ö]	Account	Name
--[Ê±¼ä]	Ö÷Òª²ÄÁÏ£º

function writeRecoinLog(szTitle, szLog)
	WriteLog(format("  %s\t%s\tNAME:%s\tACCOUNT:%s",GetLocalDate("%Y-%m-%d %H:%M:%S"), szTitle,GetName(),GetAccount()));
	WriteLog(format("  %s\t%s", GetLocalDate("%Y-%m-%d %H:%M:%S"), szLog));
end;

function reloadRecoinGoldenDate()
	local tb_NewAvailableDate = {gb_GetTask("RECOIN_GOLDENEQUIP",1), gb_GetTask("RECOIN_GOLDENEQUIP",2)};
	if (tb_NewAvailableDate[1] ~= 0 and tb_NewAvailableDate[2] ~= 0 and tb_NewAvailableDate[2] ~= SPLIT_AVAILABLE_DATE_RANGE[2]) then
		SPLIT_AVAILABLE_DATE_RANGE[1] = tb_NewAvailableDate[1];
		SPLIT_AVAILABLE_DATE_RANGE[2] = tb_NewAvailableDate[2];
	end;
end;