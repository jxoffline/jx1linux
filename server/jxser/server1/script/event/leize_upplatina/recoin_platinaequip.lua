IncludeLib("ITEM");
IncludeLib("FILESYS")

TB_PLATINARECOIN_INFO ={
--[°×½ğID] = {×°±¸Ãû, ²¹ÌìÖĞÊıÁ¿};
--[1] = {"ÃÎÁúÖ®Õı»ÆÉ®Ã±", 2},
}
RECOIN_PLATINA_DATE_RANGE = {20070420, 20070426};

function LoadPlatinaCoinSettingTmp()
	
	local b1 = TabFile_Load("\\settings\\task\\equipex\\platina_def_tmp.txt", "PlatinaDataRecoinTmp")
	if b1~=1 then
		print("T¶i tËp tin th¨ng cÊp trang bŞ B¹ch Kim thÊt b¹i!")
		return
	end
	local nRowCount = TabFile_GetRowCount("PlatinaDataRecoinTmp", "EQUIPNAME")
	
	for y = 2, nRowCount do
		local platinaid = tonumber(TabFile_GetCell("PlatinaDataRecoinTmp", y, "PLATINAID"));
		local recoin = tonumber(TabFile_GetCell("PlatinaDataRecoinTmp", y, "RECOIN"));
		local name = TabFile_GetCell("PlatinaDataRecoinTmp", y, "EQUIPNAME");
		if (recoin ~= nil and recoin > 0) then
			TB_PLATINARECOIN_INFO[platinaid] = {name, recoin, platinaid};
		end;
	end	
end;

LoadPlatinaCoinSettingTmp()

--°×½ğ×°±¸ÖØÖıÈë¿Ú
function recoin_platina_main()
	local nTodayString = tonumber(GetLocalDate("%Y%m%d"));
	local aryDescribe = {};
	reloadRecoinPlatinaDate();
	if (nTodayString < RECOIN_PLATINA_DATE_RANGE[1] or nTodayString > RECOIN_PLATINA_DATE_RANGE[2]) then
		aryDescribe = {"<dec><npc>Trïng luyÖn trang bŞ b¹ch kim sÏ tån t¹i víi thêi gian, nh­ <color=yellow>"..floor(RECOIN_PLATINA_DATE_RANGE[1]/10000).."n¨m"..mod(floor(RECOIN_PLATINA_DATE_RANGE[1]/100),100).."nguyÖt "..mod(RECOIN_PLATINA_DATE_RANGE[1], 100).." ngµy -"..floor(RECOIN_PLATINA_DATE_RANGE[2]/10000).."n¨m"..mod(floor(RECOIN_PLATINA_DATE_RANGE[2]/100),100).."nguyÖt "..mod(RECOIN_PLATINA_DATE_RANGE[2], 100).." ngµy <color> thËt lµ ®Ñp. H«m nay kh«ng tèt ngµy l¾m cho nªn sÏ kh«ng lµm ®­îc.",
			"ThËt tiÕc qu¸, ®· trÔ giê råi, lóc kh¸c h·y quay l¹i./no",};
	else
		aryDescribe = {"<dec><npc>Trïng luyÖn trang bŞ b¹ch kim cÇn {1 Kim Tª}, {1 huyÒn tinh kho¸ng th¹ch cÊp 8} vµ mét sè l­îng { m¶nh bæ thiªn th¹ch (trung)}. Trïng luyÖn kh«ng cïng lo¹i trang bŞ hoµng kim sÏ cÇn ®¸ thiªn th¹ch sÏ kh«ng gièng nhau. Tranh thñ vÉn cßn sím h·y göi cho ta lµm sím, ®îi  <color=yellow>"..floor(RECOIN_PLATINA_DATE_RANGE[2]/10000).."n¨m"..mod(floor(RECOIN_PLATINA_DATE_RANGE[2]/100),100).."nguyÖt "..mod(RECOIN_PLATINA_DATE_RANGE[2], 100).."<color> kh«ng gióp ®­îc ng­¬i th× ®õng cã tr¸ch ta.", 
		"Trïng luyÖn trang bŞ b¹ch kim nµy cÇn bao nhiªu m¶nh Bæ Thiªn Th¹ch (Trung)/want_recoinplatina_preview",
		"Ta ®· mang ®ñ nguyªn liÖu ®Ó trïng luyÖn trang bŞ b¹ch kim nµy./want_recoinplatina",
		"Ta chØ tiÖn ®­êng ghĞ ngang ®©y/no"}
	end;
	CreateTaskSay(aryDescribe);
end;

--Ô¤ÀÀµÄÆğÊ¼
function want_recoinplatina_preview()
	GiveItemUI("Trïng luyÖn trang bŞ b¹ch kim", "Xin mêi bá trang bŞ b¹ch kim cÇn trïng luyÖn vµo « bªn d­íi. Ta sÏ gióp ng­¬i xem thö cÇn bao nhiªu m¶nh Bæ Thiªn Th¹ch (Trung)", "do_recoinplatina_preview", "no", 1);
end;

function do_recoinplatina_preview(nCount)
	if (nCount <= 0) then	--Ã»ÓĞ¸ø³ö¶«Î÷£¬²»×ö¶Ô»°Ö±½Ó·µ»Ø
		return 0;
	end;
	
	if (nCount > 1) then	--Ò»´ÎÒ»¼ş£¬¸øÓÚÌáÊ¾
		CreateTaskSay({"<dec><npc>Mét lÇn chØ ®­a ta 1 vËt phÈm th× ta míi cã thÓ gióp ng­¬i xem ®­îc.",
			"Thµnh thËt xin lçi, ta sÏ s¾p xÕp l¹i/want_recoinplatina_preview",
			"§îi 1 l¸t n÷a quay l¹i nhĞ/no"});
		return 0;
	end;
	
	local nItemIdx = GetGiveItemUnit(nCount);
	local nCurItemName = GetItemName(nItemIdx);
	local nCurItemQuality = GetItemQuality(nItemIdx);
	local tbCurItemProp = pack(GetItemProp(nItemIdx));
	if (nCurItemQuality == 4) then		--¸øÓÚµÄÊÇ°×½ğ×°±¸
		if (tbCurItemProp[1] == 0) then		--²»ÊÇÆÆËğµÄ×°±¸
			local nCurPlatinaEqID = GetPlatinaEquipIndex(nItemIdx);
			if (TB_PLATINARECOIN_INFO[nCurPlatinaEqID]) then
				CreateTaskSay({format("<dec><npc>Trang bŞ b¹ch kim %s  cÇn {%d m¶nh} bæ thiªn th¹ch (trung) vµ 1 Kim Tª víi 1 huyÒn tinh cÊp 8.",TB_PLATINARECOIN_INFO[nCurPlatinaEqID][1],TB_PLATINARECOIN_INFO[nCurPlatinaEqID][2]),
					"Xin h·y gióp ta trïng luyÖn trang bŞ b¹ch kim nµy/want_recoinplatina",
					"§îi ta chuÈn bŞ xong sÏ quay l¹i t×m ng­¬i/no"});
			else
				CreateTaskSay({format("<dec><npc>Víi n¨ng lùc hiÖn t¹i cña ta kh«ng thÓ gióp ng­¬i trïng luyÖn {%s} ®­îc.",nCurItemName),
				"ThÕ th× ta sÏ ®æi/want_recoinplatina_preview",
				"§îi 1 l¸t n÷a quay l¹i nhĞ/no"});
			end;
			return 0;
		end;
	end;
	CreateTaskSay({"<dec><npc>Kh«ng ph¶i ng­¬i muèn biÕt trïng luyÖn b¹ch kim cÇn bao nhiªu m¶nh bæ thiªn th¹ch, ng­¬i kh«ng ®­a cho ta trang bŞ b¹ch kim th× lµm sao xem nµo?",
		"Thµnh thËt xin lçi, ta sÏ s¾p xÕp l¹i/want_recoinplatina_preview",
		"§îi 1 l¸t n÷a quay l¹i nhĞ/no"});
end;

--ÖØÖıµÄÆğÊ¼
function want_recoinplatina()
	GiveItemUI("Trïng luyÖn trang bŞ b¹ch kim", "Xin mêi bá nh÷ng nguyªn liÖu cÇn thiÕt ®Ó trïng luyÖn trang bŞ b¹ch kim vµo « bªn d­íi (1 Kim Tª, 1 huyÒn tinh cÊp 8, vµ mét sè l­îng Bæ Thiªn Th¹ch (Trung))", "do_recoinplatina", "no", 1);
end;

function do_recoinplatina(nCount)
	if (nCount <= 0) then	--Ã»ÓĞ¸ø³ö¶«Î÷£¬²»×ö¶Ô»°Ö±½Ó·µ»Ø
		return 0;
	end;
	local nComposeEntryIdx = 0;
	local nComposeEntryLvl = 0;
	local szBeforeItemInfo = "";
	local szBehindItemInfo = ""
	local nMarkCount = 0;
	local nItemBindState = 0;	--Ô­ÁÏ»Æ½ğµÄ°ó¶¨×´Ì¬
	local nItemLockState = 0;
	local bHaveLockItem  = 0;	
	local szMARKITEM_KEY = "6,1,1309";
	local tb_material = {
		--key = {ÊıÁ¿£¬Ãû³Æ£¬µÈ¼¶} 
		["4,979,1"] = {1, "Kim Tª", -1},
		["6,1,147"] = {1, "HuyÒn Tinh Kho¸ng Th¹ch cÊp 8", 8},
		};
	local tb_curmaterial = {};
	for key, tb in tb_material do
		tb_curmaterial[key] = {};
		tb_curmaterial[key][1] = 0;
	end;
	
	for i = 1, nCount do
		local nCurItemIdx = GetGiveItemUnit(i);
		local nCurItemName = GetItemName(nCurItemIdx);
		local nCurItemQuality = GetItemQuality(nCurItemIdx);
		local tbCurItemProp = pack(GetItemProp(nCurItemIdx));
		local nExpiredTime = ITEM_GetExpiredTime(nCurItemIdx);
		if (nCurItemQuality == 4) then		--¸øÓÚµÄÊÇ°×½ğ×°±¸
			if (nExpiredTime > 0) then -- ÓĞ±£ÖÊÆÚµÄ×°±¸£¬²»ÄÜ²ğ£¡
				CreateTaskSay(	{	"<dec><npc>Trang bŞ cã <color=fire>thêi h¹n sö dông<color>, kh«ng thÓ trïng luyÖn ®­îc.",
									"ThËt lµ thø lçi, ta l¹i bá nhÇm n÷a råi. Mét lóc sau quay l¹i nhĞ/no"	}	);
				return
			end
			if (tbCurItemProp[1] == 0) then		--²»ÊÇÆÆËğµÄ×°±¸
				local nCurPlatinaEqID = GetPlatinaEquipIndex(nCurItemIdx);
				if (TB_PLATINARECOIN_INFO[nCurPlatinaEqID]) then
					if (nComposeEntryIdx ~= 0) then
						CreateTaskSay({"<dec><npc>Ng­¬i rèt cuéc muèn trïng luyÖn trang bŞ b¹ch kim nµo ®©y?",
							"Ha ha, ®¹i hiÖp còng cã lóc bÊt cÈn, ®Ó ta ®Æt vµo l¹i./want_recoinplatina",
							"ThËt ng¹i qu¸, ta sÏ quay l¹i sau./no"	});
									return 0;
					else
						nComposeEntryIdx = nCurPlatinaEqID;
						nComposeEntryLvl = GetPlatinaLevel(nCurItemIdx);
						szBeforeItemInfo = getItemInfo(nCurItemIdx);	--»ñµÃÖØÖıÇ°µÄÏêÏ¸ĞÅÏ¢
						nItemBindState = GetItemBindState(nCurItemIdx)	--»ñÈ¡°ó¶¨×´Ì¬
					end;
				else
					CreateTaskSay({format("<dec><npc>Víi n¨ng lùc hiÖn t¹i cña ta kh«ng thÓ gióp ng­¬i trïng luyÖn {%s} ®­îc.",nCurItemName),
						"ThÕ th× ta sÏ ®æi/want_recoinplatina_preview",
						"§îi 1 l¸t n÷a quay l¹i nhĞ/no"});
					return 0;
				end;
			end;
		else		--Èç¹û²»ÊÇ°×½ğ×°±¸£¬¾ÍÅĞ¶ÏÊÇ²»ÊÇËùĞè²ÄÁÏ
			local szItemKey = tbCurItemProp[1]..","..tbCurItemProp[2]..","..tbCurItemProp[3];
			if (szItemKey == szMARKITEM_KEY) then	--²¹ÌìÊ¯ËéÆ¬
				nMarkCount = nMarkCount + 1;
			else
				if (tb_material[szItemKey] == nil) then	--²»ÊÇ°ËĞş and ²»ÊÇ½ğÏ¬
					CreateTaskSay({	"<dec><npc>Ngoµi {trang bŞ b¹ch kim} vµ {kim tª}, { huyÒn tinh cÊp 8}, { m¶nh bæ thiªn th¹ch (trung)} lµ nh÷ng nguyªn liÖu ta cÇn. Nh÷ng thø kh¸c xin h·y thu l¹i.",
						"Ha ha, ®¹i hiÖp còng cã lóc bÊt cÈn, ®Ó ta ®Æt vµo l¹i./want_recoinplatina",
						"ThËt ng¹i qu¸, ta sÏ quay l¹i sau./no"	});
					return 0;
				else
					if (tb_material[szItemKey][3] ~= -1) then
						if (tb_material[szItemKey][3] ~= tbCurItemProp[4]) then
							CreateTaskSay({"<dec><npc>§¼ng cÊp cña trang bŞ"..nCurItemName.." nµy d­êng nh­ kh«ng ®óng.",
								"Ha ha, ®¹i hiÖp còng cã lóc bÊt cÈn, ®Ó ta ®Æt vµo l¹i./want_recoinplatina",
								"ThËt ng¹i qu¸, ta sÏ quay l¹i sau./no"	}	);
							return 0;
						end;
					end;
					tb_curmaterial[szItemKey][1] = tb_curmaterial[szItemKey][1] + 1;
					tb_curmaterial[szItemKey][2] = nCurItemName;
				end;
			end;
		end;
	end;	--end for nCout
	
	local szlog = ""
	if (nComposeEntryIdx == 0) then		--¾¹È»²»¸ø°×½ğ×°±¸
		CreateTaskSay({"<dec><npc>Kh«ng ph¶i ng­¬i muèn trïng luyÖn trang bŞ b¹ch kim sao, ng­¬i kh«ng giao cho ta trang bŞ lµm sao ta lµm ®­îc.",
			"Thµnh thËt xin lçi, ta sÏ s¾p xÕp l¹i/want_recoinplatina",
			"§îi 1 l¸t n÷a quay l¹i nhĞ/no"});
		return 0;
	end;
	if (nMarkCount ~= TB_PLATINARECOIN_INFO[nComposeEntryIdx][2]) then
		CreateTaskSay({format("<dec><npc>Trang bŞ b¹ch kim {%s} cÇn (%d) m¶nh bæ thiªn th¹ch (trung).",TB_PLATINARECOIN_INFO[nComposeEntryIdx][1],TB_PLATINARECOIN_INFO[nComposeEntryIdx][2]),
					"Thµnh thËt xin lçi, ta sÏ s¾p xÕp l¹i/want_recoinplatina",
					"§îi ta chuÈn bŞ xong sÏ quay l¹i t×m ng­¬i/no"});
		return 0;
	end;
	for key, tb in tb_material do
		if (tb[1] ~= tb_curmaterial[key][1]) then
			CreateTaskSay({format("<dec><npc>Trïng luyÖn trang bŞ b¹ch kim ta cÇn {%d} %s.", tb[1],tb[2]),
					"Thµnh thËt xin lçi, ta sÏ s¾p xÕp l¹i/want_recoinplatina",
					"§îi ta chuÈn bŞ xong sÏ quay l¹i t×m ng­¬i/no"});
			return 0;
		end;
	end;

--	for i = 1, nCount do
--		local nCurItemIdx = GetGiveItemUnit(i)
--		nItemLockState = GetLockItemState(nCurItemIdx)
--		if (nItemLockState == 1) then
--			local bOwner = IsLockItemOwner(nCurItemIdx)
--			if (bOwner == 0)   then
--				CreateTaskSay({"<dec><npc>ÖØÖıµÄ°×½ğ×°±¸ÊÇËø»êÎïÆ·£¬Ëø»êÎïÆ·´¦ÓÚËø»ê×´Ì¬£¬Ö»ÔÊĞíÎïÆ·¹éÊôÈËÖØÖı¡£","ÖªµÀÁË/cancel"});
--				return
--			else
--				bHaveLockItem =	1;
--			end							
--		elseif (nItemLockState == 2) then
--			CreateTaskSay({"<dec><npc>ÖØÖıµÄ°×½ğ×°±¸ÊÇËø»êÎïÆ·£¬Ëø»êÎïÆ·´¦ÓÚ½â»ê×´Ì¬£¬½ûÖ¹ÖØÖı¡£","ÖªµÀÁË/cancel"});
--			return
--		end
--	end;	
	
	-- É¾Ô­ÁÏ
	for i = 1, nCount do
		if (RemoveItemByIndex(GetGiveItemUnit(i)) ~= 1) then
			WriteLog("[Trïng luyÖn trang bŞ b¹ch kim]"..GetLocalDate("%Y-%m-%d %H:%M:%S").."\t"..GetAccount().."\t"..GetName().."\t Xãa vËt phÈm thÊt b¹i\t"..GetItemName(GetGiveItemUnit(i)));
			return 0;
		end
	end
	
	--ĞÂ¸ø¸ö°×½ğ×°±¸
	local nNewItemIdx = AddPlatinaItem(0, nComposeEntryIdx);	--´ËÊ± ÊÇ0¼¶°×½ğ
	if (nNewItemIdx <= 0) then
		WriteLog("[Trïng luyÖn trang bŞ b¹ch kim]"..GetLocalDate("%Y-%m-%d %H:%M:%S").."\t"..GetAccount().."\t"..GetName().."\tThªm trang bŞ b¹ch kim hoµng kim thÊt b¹i\t"..GetItemName(GetGiveItemUnit(i)));
		return 0;
	end;

	if nItemBindState ~= 0 then 
		--°ÑËéÆ¬ÉèÖÃÎªÔ´»Æ½ğ×°±¸µÄ°ó¶¨×´Ì¬Öµ
		SetItemBindState(nNewItemIdx, nItemBindState)
	end

	for i = 1, nComposeEntryLvl do								--Éı¼¶Ö®Ô­×°±¸µÈ¼¶
		UpgradePlatinaItem(nNewItemIdx);
	end;
	
--	if (bHaveLockItem == 1) then
--		LockItem(nNewItemIdx);
--	end
		
	szlog = format("[Trïng luyÖn trang bŞ b¹ch kim]\t%s\tAccount:%s\tName:%s\tTrïng luyÖn %s xãa nguyªn liÖu: 1 Kim Tª, 1 huyÒn tinh cÊp 8, %d m¶nh bæ thiªn th¹ch", 
				GetLocalDate("%Y-%m-%d %X"), GetAccount(), GetName(),
				TB_PLATINARECOIN_INFO[nComposeEntryIdx][1], nMarkCount);
	szBehindItemInfo = getItemInfo(nNewItemIdx);	--ÖØÖıºóµÄĞÅÏ¢
	WriteLog(szlog);
	writeRecoinLog("[Thuéc tİnh tr­íc khi trïng luyÖn trang bŞ b¹ch kim]", szBeforeItemInfo);
	writeRecoinLog("[Thuéc tinh sau khi trïng luyÖn trang bŞ b¹ch kim]", szBehindItemInfo);
	Msg2Player("Trïng luyÖn thµnh c«ng——<color=green>"..TB_PLATINARECOIN_INFO[nComposeEntryIdx][1]);
end;

function reloadRecoinPlatinaDate()
	local tb_NewAvailableDate = {gb_GetTask("RECOIN_PLATINAEQUIP",1), gb_GetTask("RECOIN_PLATINAEQUIP",2)};
	if (tb_NewAvailableDate[1] ~= 0 and tb_NewAvailableDate[2] ~= 0 and tb_NewAvailableDate[2] ~= RECOIN_PLATINA_DATE_RANGE[2]) then
		RECOIN_PLATINA_DATE_RANGE[1] = tb_NewAvailableDate[1];
		RECOIN_PLATINA_DATE_RANGE[2] = tb_NewAvailableDate[2];
	end;
end;