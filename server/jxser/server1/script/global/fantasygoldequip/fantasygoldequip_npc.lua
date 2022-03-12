--Ğş½ğ×°±¸NPC
Include("\\script\\global\\fantasygoldequip\\fantasygoldequip_head.lua");

g_szNpcName = "<color=green>Häc trß thî rÌn:<color>";

--Éı¼¶Ğş½ğ»òĞş½ğÖ®¾«
function fantasygold_upgrade()
	FantasyGoldEquip();
end

---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------

--ĞÂ»Æ½ğ×°±¸Éı¼¶³ÉĞş½ğ×°±¸
function newgold_to_fantasygold()
	--ÈôµÚÎå¸ö²ÎÊı²»Îª0ÔòÔÊĞí°ó¶¨ÎïÆ··ÅÈë
	GiveItemUI("ChÕ t¹o trang bŞ HuyÒn Kim", "Trang bŞ HuyÒn Kim mµ ng­¬i muèn chÕ t¹o cÇn mét phÇn HuyÒn Kim Chi Tinh.Cho vµo cét vËt phÈm bªn d­íi.Ta sÏ thu mét sè ng©n l­îng,nhí chuÈn bŞ tr­íc", "do_up_newgold_to_fantasygold_process", "cancel",1, "do_up_newgold_to_fantasygold_check");
	SetUiGiveItemMsg("Cho vµo trang bŞ muèn chÕ t¹o vµ nguyªn liÖu");
end

--ĞÂ»Æ½ğ×°±¸Éı¼¶³ÉĞş½ğ×°±¸Ô¤ÀÀ
function newgold_to_fantasygold_preview()
	GiveItemUI("Xem tr­íc thuéc tİnh", "Cho vµo trang bŞ ng­¬i muèn chÕ t¹o ta sÏ nãi cho ng­¬i biÕt thuéc tİnh trang bŞ HuyÒn Kim sau khi th¨ng cÊp thµnh c«ng ", "do_up_newgold_to_fantasygold_process_preview", "cancel",1, "do_up_newgold_to_fantasygold_preview_check");
	SetUiGiveItemMsg("Cho vµo trang bŞ muèn xem tr­íc");
end

function do_up_newgold_to_fantasygold_preview_check(nItemCount)
	local tbItemIdx = {};
	for i = 1, nItemCount do
		tinsert(tbItemIdx, GetGiveItemUnit(i));
	end
	do_up_newgold_to_fantasygold_process_check(tbItemIdx, 1);
end

function do_up_newgold_to_fantasygold_check(nItemCount)
	local tbItemIdx = {};
	for i = 1, nItemCount do
		tinsert(tbItemIdx, GetGiveItemUnit(i));
	end
	do_up_newgold_to_fantasygold_process_check(tbItemIdx, 0);
end

function do_up_newgold_to_fantasygold_process(nItemCount)
	do_up_newgold_to_fantasygold_process_p(nItemCount);
end

function do_up_newgold_to_fantasygold_process_preview(nItemCount)
	do_up_newgold_to_fantasygold_process_p(nItemCount, 1);
end

UPNEWGOLDTOFANTASYGOLD_OK = 0;
UPNEWGOLDTOFANTASYGOLD_ITEM_NUM_ERROR = 1;--·ÅÈëÎïÆ·ÊıÁ¿´íÎó
UPNEWGOLDTOFANTASYGOLD_UNKNOWN_ERROR = 2;--Î´Öª´íÎó
UPNEWGOLDTOFANTASYGOLD_EQU_ERROR = 3;--·ÅÈëµÄ×°±¸·ûºÏÌõ¼ş
UPNEWGOLDTOFANTASYGOLD_EQU_PREVIEW_OK = 4;--¿ÉÒÔÔ¤ÀÀ
UPNEWGOLDTOFANTASYGOLD_FANTASYGOLD_ERROR = 5;--Ğş½ğÖ®¾«´íÎó
UPNEWGOLDTOFANTASYGOLD_NOMONEY = 6;--Ç®²»¹»

function do_up_newgold_to_fantasygold_process_check(tbItemIdx, bPreview)
	local tbResult = {};
	tbResult.nRetValue = UPNEWGOLDTOFANTASYGOLD_UNKNOWN_ERROR;
	tbResult.nEquIdx = 0;
	tbResult.nFantasyGoldEssenceIdx = 0;
	tbResult.nFantasyGoldEssenceLevel = 0;
	tbResult.nEquFlag = 0;
	tbResult.nFantasyGoldEssenceFlag = 0;
	tbResult.nNeedMoney = 0;
	tbResult.nItemBindState = 0;
	tbResult.nOtherFlag = 0;
	tbResult.nAddBindDay = 0;
	tbResult.szErrorMsg = "VËt phÈm ng­¬i bá vµo kh«ng phï hîp víi ®iÒu kiÖn chÕ t¹o";

	--ÏÈ¼ì²é×°±¸ÊÇ·ñºÏÌõ¼ş
	for i = 1, getn(tbItemIdx) do
		local nCurItemQuality = GetItemQuality(tbItemIdx[i]);
		if nCurItemQuality == 1 then--Èç¹ûÎïÆ·ÊÇ»Æ½ğ×°±¸
			tbResult.nEquFlag = tbResult.nEquFlag + 1;
			tbResult.nEquIdx = tbItemIdx[i];
		end
	end
	if tbResult.nEquFlag > 1 then
		tbResult.nRetValue = UPNEWGOLDTOFANTASYGOLD_EQU_ERROR;
		tbResult.szErrorMsg = "ChØ cã thÓ cho vµo mét c¸i trang bŞ Hoµng Kim";
		ShowNotice(2, tbResult.szErrorMsg);
		return tbResult;
	end

	local tbEquipProp = pack(GetItemProp(tbResult.nEquIdx));
	local nEquipExpiredTime = ITEM_GetExpiredTime(tbResult.nEquIdx);

	--²»ÊÇ×°±¸»òËğ»µµÄ×°±¸
	if tbEquipProp[1] ~= 0 then
		tbResult.nRetValue = UPNEWGOLDTOFANTASYGOLD_EQU_ERROR;
		tbResult.szErrorMsg = "Ta kh«ng thÓ chÕ t¹o trang bŞ nµy";
		ShowNotice(2, tbResult.szErrorMsg);
		return tbResult;
	end
	-- ÓĞ±£ÖÊÆÚµÄ×°±¸
	if nEquipExpiredTime > 0 then 
		tbResult.nRetValue = UPNEWGOLDTOFANTASYGOLD_EQU_ERROR;
		tbResult.szErrorMsg = "Trang bŞ ®ang bŞ khãa kh«ng thÓ chÕ t¹o";
		ShowNotice(2, tbResult.szErrorMsg);
		return tbResult;
	end

	local nNeedFantasyGoldEssenceLevel = 0;
	local nAddBindDay = 0;
	local nCurGoldId = GetGlodEqIndex(tbResult.nEquIdx);
	for i, v in TB_GOLD_EQUIP_TO_UP_ID_INTERVAL do
		if nCurGoldId >= v[1] and nCurGoldId <= v[2] then
			nNeedFantasyGoldEssenceLevel = v[3];
			tbResult.nAddBindDay = v[4];
			break;
		end
	end

	if nNeedFantasyGoldEssenceLevel <= 0 then
		tbResult.nRetValue = UPNEWGOLDTOFANTASYGOLD_EQU_ERROR;
		tbResult.szErrorMsg = "Ta kh«ng thÓ chÕ t¹o trang bŞ nµy";
		ShowNotice(2, tbResult.szErrorMsg);
		return tbResult;
	end

	if bPreview == 1 then
		tbResult.nRetValue = UPNEWGOLDTOFANTASYGOLD_EQU_PREVIEW_OK;
		ShowNotice(2, "NhÊp vµo\"x¸c nhËn\"xem tr­íc thuéc tİnh");
		return tbResult;
	end


	--ÔÙ¼ì²éĞş½ğÖ®¾«
	for i = 1, getn(tbItemIdx) do
		local tbCurItemProp = pack(GetItemProp(tbItemIdx[i]));
		if tbCurItemProp[1] == TB_FANTASYESSENCE[1] and tbCurItemProp[2] == TB_FANTASYESSENCE[2] and tbCurItemProp[3] == TB_FANTASYESSENCE[3] then
			tbResult.nFantasyGoldEssenceFlag = tbResult.nFantasyGoldEssenceFlag + 1;
			tbResult.nFantasyGoldEssenceIdx = tbItemIdx[i];
			tbResult.nFantasyGoldEssenceLevel = tbCurItemProp[4];
		end
	end

	if tbResult.nFantasyGoldEssenceFlag > 1 then
		tbResult.nRetValue = UPNEWGOLDTOFANTASYGOLD_FANTASYGOLD_ERROR;
		tbResult.szErrorMsg = "ChØ cho phĞp bá mét c¸i HuyÒn Kim Chi Tinh";
		ShowNotice(2, tbResult.szErrorMsg);
            	return tbResult;
	end

	--Èç¹ûµş¼ÓÊı¶àÓÚ1¸ö
	if GetItemStackCount(tbResult.nFantasyGoldEssenceIdx) > 1 then
		tbResult.nRetValue = UPNEWGOLDTOFANTASYGOLD_FANTASYGOLD_ERROR;
		tbResult.szErrorMsg = "ChØ cÇn mét c¸i HuyÒn Kim Chi Tinh,®¹i hiÖp bá nhiÒu lµ l·ng phİ";
		ShowNotice(2, tbResult.szErrorMsg);
            	return tbResult;
	end

	--¼ì²éĞş½ğÖ®¾«µÈ¼¶
	if tbResult.nFantasyGoldEssenceLevel ~= nNeedFantasyGoldEssenceLevel then
		tbResult.nRetValue = UPNEWGOLDTOFANTASYGOLD_FANTASYGOLD_ERROR;
		tbResult.szErrorMsg = format("ChÕ t¹o trang bŞ nµy cÇn 1 c¸i %d cÊp HuyÒn Kim Chi Tinh", nNeedFantasyGoldEssenceLevel);
		ShowNotice(2, tbResult.szErrorMsg);
            	return tbResult;
	end

	tbResult.nNeedMoney = GetUpToFantasyGoldEquipNeedMoney(nNeedFantasyGoldEssenceLevel);
	if GetCash() < tbResult.nNeedMoney then
		tbResult.nRetValue = UPNEWGOLDTOFANTASYGOLD_NOMONEY;
		tbResult.szErrorMsg = format("ChÕ t¹o trang bŞ nµy cÇn %d cña ng©n l­îng", tbResult.nNeedMoney);
		ShowNotice(2, tbResult.szErrorMsg);
            	return tbResult;
	end

	tbResult.nItemBindState = GetItemBindState(tbResult.nEquIdx)	--»ñÈ¡°ó¶¨×´Ì¬

	-----------------¼ì²âÊÇ·ñ·ÅÁËÆäËüÎŞ¹ØÎïÆ·-----------------------------------------
	if getn(tbItemIdx) ~= 2 then
		tbResult.nRetValue = UPNEWGOLDTOFANTASYGOLD_ITEM_NUM_ERROR;
		tbResult.szErrorMsg = format("ChÕ t¹o trang bŞ nµy chØ cho phĞp bá [trang bŞ]#[HuyÒn Kim Chi Tinh].Ng­¬i cho ®å kh¸c vµo råi", tbResult.nNeedMoney);
		ShowNotice(2, tbResult.szErrorMsg);
            	return tbResult;
	end

	tbResult.nRetValue = UPNEWGOLDTOFANTASYGOLD_OK;
	ShowNotice(2, "NhÊp vµo\"x¸c nhËn\"tiÕn hµnh chÕ t¹o");
	return tbResult;
end

--Éı¼¶Ğş½ğ×°±¸
function do_up_newgold_to_fantasygold_process_p(nItemCount, bPreview)
	local tbItemIdx = {};
	for i = 1, nItemCount do
		tinsert(tbItemIdx, GetGiveItemUnit(i));
	end
	local tbResult = do_up_newgold_to_fantasygold_process_check(tbItemIdx, bPreview); 

	--Èç¹ûÊÇÔ¤ÀÀÊôĞÔ
	if bPreview == 1 then
		if tbResult.nRetValue ~= UPNEWGOLDTOFANTASYGOLD_EQU_PREVIEW_OK then
			ShowNotice(1, tbResult.szErrorMsg);
			return
		end
		local szItemDesc = g_szNpcName .. "Víi kinh nghiÖm cña ta,thuéc tİnh cña trang bŞ HuyÒn Kim nµy lµ:<enter>";
		local tbNextPlatinaMagicAttrib = pack(PreviewPlatinaFromGold(tbResult.nEquIdx));	
		local tbCurPlatinaMagicAttrib = getItemAllMagicList(tbResult.nEquIdx);
		for i = 1, getn(tbNextPlatinaMagicAttrib) do
			if (tbCurPlatinaMagicAttrib[i][1] == tbNextPlatinaMagicAttrib[i][1] and tbCurPlatinaMagicAttrib[i][2] ~= tbNextPlatinaMagicAttrib[i][2]) then
				local szD = (tbNextPlatinaMagicAttrib[i][2]-tbCurPlatinaMagicAttrib[i][2]);
				if (szD > 0) then
					szD = "(+"..szD..")";
				else
					szD = "("..szD..")";
				end
				szItemDesc = szItemDesc.."<color=yellow>"..GetItemMagicDesc(unpack(tbNextPlatinaMagicAttrib[i])).."<color><color=red>"..szD.."<color><enter>";
			else
				szItemDesc = szItemDesc.."<color=green>"..GetItemMagicDesc(unpack(tbNextPlatinaMagicAttrib[i])).."<color><enter>";
			end
		end
		szItemDesc = szItemDesc .. format("Thêi gian khãa (+%d) tiÕng", tbResult.nAddBindDay * 24);
		CreateTaskSay({"<dec>"..szItemDesc, 
			"Ta muèn xem tr­íc mét c¸i thuéc tİnh cña trang bŞ kh¸c sau khi chÕ t¹o/newgold_to_fantasygold_preview",
			"Xin gióp ta chÕ t¹o trang bŞ nµy thµnh trang bŞ HuyÒn Kim/newgold_to_fantasygold",
			"ThËt ng¹i qu¸, ta sÏ quay l¹i sau./cancel"}
		);

		return
	end

	
	if tbResult.nRetValue ~= UPNEWGOLDTOFANTASYGOLD_OK then
		ShowNotice(1, tbResult.szErrorMsg);
		return
	end

	----------------------¼ì²éĞş½ğÖ®¾«ÊÇ·ñ·ûºÏÌõ¼ş-----------------------

	--¿ÛÇ®
	Pay(tbResult.nNeedMoney);
	--É¾³ıÎïÆ·
	if RemoveItemByIndex(tbResult.nFantasyGoldEssenceIdx) ~= 1 then
		--Èç¹ûÉ¾³ıÎïÆ·Ê§°ÜÔòĞ´ÈÕÖ¾
		WriteLog(format("[ChÕ t¹o trang bŞ HuyÒn Kim]\ttµi kho¶n?%s\tnh©n vËt?%s\txãa vËt phÈm[%s]thÊt b¹i?chÕ t¹o thÊt b¹i?", GetAccount(), GetName(), GetItemName(tbResult.nFantasyGoldEssenceIdx)));
		Talk(1, "", g_szNpcName .. format("ChÕ t¹o thÊt b¹i!Trõ ®i<color=red>%d<color><color=yellow>ng©n l­îng<color>#<color=red>%d<color>c¸i<color=yellow>Hçn Nguyªn Linh Lé<color>#<color=red>1<color>c¸i<color=yellow>HuyÒn Kim<color>.", tbResult.nNeedMoney));
		return
	end

	--Éı¼¶
	local nSuccess = UpgradePlatinaFromGoldItem(tbResult.nEquIdx);

	if nSuccess > 0 then
		--ÉèÖÃĞÂÉú³ÉµÄ×°±¸µÄ°ó¶¨×´Ì¬
		local nNewItemBindState = calc_equip_binditem(tbResult.nItemBindState, tbResult.nAddBindDay * 24);
		SetItemBindState(tbResult.nEquIdx, nNewItemBindState);
		Talk(1, "", g_szNpcName .. "ChÕ t¹o thµnh c«ng,ng­¬i nhËn ®­îc mét trang bŞ HuyÒn Kim");

		WriteLog(format("[ChÕ t¹o trang bŞ HuyÒn Kim]\ttµi kho¶n?%s\tnh©n vËt?%s\tchÕ t¹o trang bŞ HuyÒn Kim[%s]thµnh c«ng", GetAccount(), GetName(), GetItemName(tbResult.nEquIdx)));
	else
		--Ğ´Éú³ÉÊ§°ÜÈÕÖ¾
		WriteLog(format("[ChÕ t¹o trang bŞ HuyÒn Kim]\ttµi kho¶n?%s\tnh©n vËt?%s\tchÕ t¹o trang bŞ HuyÒn Kim[%s]thÊt b¹i", GetAccount(), GetName(), GetItemName(tbResult.nEquIdx)));
	end

end

------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------

function fantasygoldequip_upgrade_preview()
	GiveItemUI("Xem tr­íc thuéc tİnh sau khi n©ng cÊp", "Cho vµo trang bŞ mµ ng­¬i muèn n©ng cÊp,ta sÏ nãi cho ng­¬i biÕt thuéc tİnh trang bŞ HuyÒn Kim sau khi n©ng cÊp thµnh c«ng", "do_update_fantasygoldequip_process_preview", "cancel",1,"fantasygoldequip_upgrade_preview_check");
	SetUiGiveItemMsg("Cho vµo trang bŞ muèn xem tr­íc");
end


function fantasygoldequip_upgrade()
	GiveItemUI("N©ng cÊp trang bŞ HuyÒn Kim", "N©ng cÊp cÇn Hçn Nguyªn Linh Lé,ng©n l­îng vµ HuyÒn Kim.ChÕ t¹o thÊt b¹i ngoµi tæn thÊt trang bŞ ra cßn cã nh÷ng thø kh¸c", "do_update_fantasygoldequip_process", "cancel",1, "fantasygoldequip_upgrade_check");
	SetUiGiveItemMsg("Cho vµo trang bŞ muèn n©ng cÊp cïng víi nguyªn liÖu");
end

function do_update_fantasygoldequip_process(nItemCount)
	do_update_fantasygoldequip_process_p(nItemCount, 0)
end

function do_update_fantasygoldequip_process_preview(nItemCount)
	do_update_fantasygoldequip_process_p(nItemCount, 1)
end

function fantasygoldequip_upgrade_preview_check(nItemCount)
	local tbItemIdx = {};
	for i = 1, nItemCount do
		tinsert(tbItemIdx, GetGiveItemUnit(i));
	end
	do_upgrade_fantasygoldequip_check(tbItemIdx, 1);
end

function fantasygoldequip_upgrade_check(nItemCount)
	local tbItemIdx = {};
	for i = 1, nItemCount do
		tinsert(tbItemIdx, GetGiveItemUnit(i));
	end
	do_upgrade_fantasygoldequip_check(tbItemIdx, 0);
end


--·ÅÈëµÄÎïÆ··ûºÏÌõ¼ş
FANTASY_GOLD_EQUIP_OK = 0;
--Ã»ÓĞ·ÅÈë¿ÉÒÔÉı¼¶µÄĞş½ğ×°±¸
FANTASY_GOLD_EQUIP_NOEQU = 1;
--·ÅÈëĞş½ğ×°±¸Ì«¶à
FANTASY_GOLD_EQUIP_TOOMUCH = 2;
--·ÅÈëµÄĞş½ğ×°±¸µÄµÈ¼¶ÒÑ¾­×î¸ß
FANTASY_GOLD_EQUIP_LEVELFULL = 3;
--»ìÔªÁéÂ¶ÊıÁ¿²»¶Ô
REFININGSTONE_NUM_ERROR = 4;
--·ÅÈëµÄĞş½ğÊıÁ¿Ì«¶à
REFININGSTONE_TOOMUCH = 5;
--·ÅÈëÁËÎŞ¹ØÎïÆ·
FANTASY_GOLD_EQUIP_NOUSE = 6;
--Î´Öª´íÎó
FANTASY_GOLD_EQUIP_UNKNOWN_ERROR = 7;
--¿ÉÒÔÔ¤ÀÀ
FANTASY_GOLD_EQUIP_CAN_PREVIEW = 8;
--×°±¸ÓĞ±£ÖÊÆÚ£¬²»ÄÜÉıÕß
FANTASY_GOLD_EQUIP_HAS_EXPIRETIME = 9;
--×°±¸ÓĞËø»êÇÒÖ÷ÈË²»ÊÇÒªÉı¼¶Õß
FANTASY_GOLD_EQUIP_LOCK_ERROR = 10;
--Ç®²»¹»
FANTASY_GOLD_EQUIP_MONEY_NOT_ENOUGH = 11;

function do_upgrade_fantasygoldequip_check(tbItemIdx, bPreview)
	local tbResult = {};
	tbResult.nEquFlag = 0;--×°±¸±ê¼Ç
	tbResult.nRefiningStoneFlag = 0;--»ìÔªÁéÂ¶±ê¼Ç
	tbResult.nFantasyGoldFlag = 0;--Ğş½ğ±ê¼Ç
	tbResult.nOtherFlag = 0;--ÆäËüÎïÆ·±ê¼Ç
	tbResult.nNeedRefiningStoneCount = 0;--ĞèÒªµÄ»ìÔªÁéÂ¶ÊıÁ¿
	tbResult.nFantasyGoldValue = 0;--·ÅÈëµÄĞş½ğµÄ×Ü¼ÛÖµÁ¿
	tbResult.nFantasyGoldEquipIdx = 0;--ÕÒµ½²¢ÇÒÎ¨Ò»µÄĞş½ğ×°±¸µÄË÷Òı
	tbResult.nRetValue = FANTASY_GOLD_EQUIP_UNKNOWN_ERROR;
	tbResult.nEquipType = 0;--µ±Ç°×°±¸ÊÇÄÄÒ»Àà£¬Çà¾Ô¡¢ÔÆÂ¹...
	tbResult.nEquipLevel = 0;--Õâ¼ş×°±¸µÄµÈ¼¶
	tbResult.nSuccessRate = 0;--³É¹¦ÂÊ
	tbResult.nNeedMoney = 0;--ĞèÒªµÄ½ğÇ®
	tbResult.nBindState = 0;--×°±¸µÄ°ó¶¨×´Ì¬
	tbResult.nAddBindHour = 0;--×°±¸ĞèÒªÔö¼ÓµÄ°ó¶¨Ê±¼ä
	tbResult.szErrorMsg = "";--´íÎó·µ»ØĞÅÏ¢

	local bCheckOrCommit = 2;
	
	-----------------¼ì²â×°±¸ºÏ·¨ĞÔ-----------------------------------------
	--ÏÈÕÒ³öÒªÉı¼¶µÄ×°±¸
	for i = 1, getn(tbItemIdx) do
		local nCurEquipId = GetPlatinaEquipIndex(tbItemIdx[i]);
		for index, v in TB_FANSTAY_GOLD_EQUIP_TO_UP_ID_INTERVAL do
			if nCurEquipId >= v[1] and nCurEquipId <= v[2] then
				tbResult.nEquFlag = tbResult.nEquFlag + 1;
				tbResult.nFantasyGoldEquipIdx = tbItemIdx[i];
				tbResult.nEquipType = index;
			end
		end
	end
	if tbResult.nEquFlag <= 0 then
		tbResult.nRetValue = FANTASY_GOLD_EQUIP_NOEQU;--Ã»ÓĞ·ÅÈë¿ÉÒÔÉı¼¶µÄĞş½ğ×°±¸
		tbResult.szErrorMsg = "Ng­¬i vÉn ch­a cho  trang bŞ cã thÓ n©ng cÊp vµo";
		ShowNotice(bCheckOrCommit, tbResult.szErrorMsg);
		return tbResult;
	end
	if tbResult.nEquFlag > 1 then
		tbResult.nRetValue = FANTASY_GOLD_EQUIP_TOOMUCH;--·ÅÈëĞş½ğ×°±¸Ì«¶à
		tbResult.szErrorMsg = "Cïng lóc ta chØ cã thÓ chÕ t¹o mét trang bŞ";
		ShowNotice(bCheckOrCommit, tbResult.szErrorMsg);
		return tbResult;
	end
	local tbFantasyGoldEquipProp = pack(GetItemProp(tbResult.nFantasyGoldEquipIdx));
	if tbFantasyGoldEquipProp[1] ~= 0 then--²»ÊÇ×°±¸
		tbResult.nRetValue = FANTASY_GOLD_EQUIP_NOEQU;
		tbResult.szErrorMsg = "Ng­¬i vÉn ch­a cho  trang bŞ cã thÓ n©ng cÊp vµo";
		ShowNotice(bCheckOrCommit, tbResult.szErrorMsg);
		return tbResult;
	end

	tbResult.nEquipLevel = GetPlatinaLevel(tbResult.nFantasyGoldEquipIdx);
	if tbResult.nEquipLevel >= 10 then
		tbResult.nRetValue = FANTASY_GOLD_EQUIP_LEVELFULL;
		tbResult.szErrorMsg = "Trang bŞ ng­¬i cho vµo ®· lµ cÊp m­êi råi,kh«ng thÓ n©ng cÊp n÷a";
		ShowNotice(bCheckOrCommit, tbResult.szErrorMsg);
		return tbResult;
	end

	local nEquipQuality = GetItemQuality(tbResult.nFantasyGoldEquipIdx);
	if nEquipQuality ~= 4 then--²»ÊÇ°×½ğ×°±¸
		tbResult.nRetValue = FANTASY_GOLD_EQUIP_NOEQU;
		tbResult.szErrorMsg = "Ng­¬i vÉn ch­a cho  trang bŞ cã thÓ n©ng cÊp vµo";
		ShowNotice(bCheckOrCommit, tbResult.szErrorMsg);
		return tbResult;
	end

	local nEquipExpiredTime = ITEM_GetExpiredTime(tbResult.nFantasyGoldEquipIdx);
	local tbEquipProp = pack(GetItemProp(nEquIdx));

	-- ÓĞ±£ÖÊÆÚµÄ×°±¸
	if nEquipExpiredTime > 0 then 
		tbResult.nRetValue = FANTASY_GOLD_EQUIP_HAS_EXPIRETIME;
		tbResult.szErrorMsg = "Trang bŞ ®ang bŞ khãa kh«ng thÓ n©ng cÊp";
		ShowNotice(bCheckOrCommit, tbResult.szErrorMsg);
		return tbResult;
	end


	--»ñÈ¡°ó¶¨×´Ì¬
	tbResult.nBindState = GetItemBindState(tbResult.nFantasyGoldEquipIdx)	--»ñÈ¡°ó¶¨×´Ì¬
	tbResult.nAddBindHour = TB_FANSTAY_GOLD_EQUIP_TO_UP_ID_INTERVAL[tbResult.nEquipType][4] * 24;

	--Èç¹ûÊÇÔ¤ÀÀ£¬²»ĞèÒª¼ì²é²ÄÁÏ
	if bPreview and bPreview == 1 then
		tbResult.nRetValue = FANTASY_GOLD_EQUIP_CAN_PREVIEW;
		ShowNotice(bCheckOrCommit, "NhÊp vµo\"x¸c nhËn\"xem tr­íc thuéc tİnh");
		return tbResult;
	end

	-----------------¼ì²â»ìÔªÁéÂ¶ºÏ·¨ĞÔ-----------------------------------------
	tbResult.nNeedRefiningStoneCount = tbResult.nEquipLevel + 1;--ĞèÒªµÄ»ìÔªÁéÂ¶ÊıÁ¿ÎªÒªÉı¼¶µÄ×°±¸µÈ¼¶+1
	for i = 1, getn(tbItemIdx) do
		local tItemProp = pack(GetItemProp(tbItemIdx[i]));
		if tItemProp[1] == TB_REFININGSTONE[1] and tItemProp[2] == TB_REFININGSTONE[2] and tItemProp[3] == TB_REFININGSTONE[3] then--Èç¹û´ËÎïÆ·ÊÇ»ìÔªÁéÂ¶
			--È¡µş¼ÓÊıÁ¿
			local nStackCount = GetItemStackCount(tbItemIdx[i]);
			tbResult.nRefiningStoneFlag = tbResult.nRefiningStoneFlag + nStackCount;
		end
	end

	if tbResult.nRefiningStoneFlag <= 0 or (tbResult.nNeedRefiningStoneCount ~= tbResult.nRefiningStoneFlag) then
		tbResult.nRetValue = REFININGSTONE_NUM_ERROR;--·ÅÈëµÄ»ìÔªÁéÂ¶ÊıÁ¿²»¶Ô
		tbResult.szErrorMsg = format("Ng­¬i ph¶i bá vµo %d Hçn Nguyªn Linh Lé míi cã thÓ n©ng cÊp", tbResult.nNeedRefiningStoneCount);
		ShowNotice(bCheckOrCommit, tbResult.szErrorMsg);
		return tbResult;
	end

	-----------------¼ì²âĞş½ğºÏ·¨ĞÔ-----------------------------------------
	for i = 1, getn(tbItemIdx) do
		local tItemProp = pack(GetItemProp(tbItemIdx[i]));
		if tItemProp[1] == TB_FANTASYGOLD[1] and tItemProp[2] == TB_FANTASYGOLD[2] and tItemProp[3] == TB_FANTASYGOLD[3] then--Èç¹û´ËÎïÆ·ÊÇĞş½ğ
			--È¡µş¼ÓÊıÁ¿
			local nStackCount = GetItemStackCount(tbItemIdx[i]);
			tbResult.nFantasyGoldFlag = tbResult.nFantasyGoldFlag + nStackCount;

			tbResult.nFantasyGoldValue = tbResult.nFantasyGoldValue + nStackCount * CalcFantasyGoldValueByLevel(tItemProp[4]);
		end
	end

	--·ÅÈëµÄĞş½ğ²»ÄÜ³¬¹ı6¸ö
	if tbResult.nFantasyGoldFlag > 6 then
		tbResult.szErrorMsg = format("Sè l­îng HuyÒn Kim bá vµo kh«ng ®­îc v­ît qu¸ s¸u m¶nh");
		ShowNotice(bCheckOrCommit, tbResult.szErrorMsg);
		tbResult.nRetValue = REFININGSTONE_TOOMUCH;
		return tbResult;
	end

	-----------------¼ì²âÊÇ·ñ·ÅÁËÆäËüÎŞ¹ØÎïÆ·-----------------------------------------
	for i = 1, getn(tbItemIdx) do
		local nIsRequireItem = nil
		local tItemProp = pack(GetItemProp(tbItemIdx[i]));
		if (tItemProp[1]==TB_REFININGSTONE[1]) and (tItemProp[2]==TB_REFININGSTONE[2]) and (tItemProp[3]==TB_REFININGSTONE[3]) then
			nIsRequireItem = 1; --Ğş½ğ
		end
		
		if tItemProp[1] == TB_FANTASYGOLD[1] or tItemProp[2] == TB_FANTASYGOLD[2] or tItemProp[3] == TB_FANTASYGOLD[3] then
			nIsRequireItem = 1; --»ìÔªÁéÂ¶
		end
		
		local nCurEquipId = GetPlatinaEquipIndex(tbItemIdx[i]);	
		for nSuite = 1, getn(TB_FANSTAY_GOLD_EQUIP_TO_UP_ID_INTERVAL) do
			if nCurEquipId >= TB_FANSTAY_GOLD_EQUIP_TO_UP_ID_INTERVAL[nSuite][1] and nCurEquipId <= TB_FANSTAY_GOLD_EQUIP_TO_UP_ID_INTERVAL[nSuite][2] then--ÊÇ¿ÉÒÔÉı¼¶µÄ°×½ğ×°±¸
				nIsRequireItem = 1
				break;
			end
		end
		
		if not nIsRequireItem then
			tbResult.nOtherFlag = 1;
			break;
		end
	end
	
	if tbResult.nOtherFlag == 1 then--Èç¹û·ÅÁËÎŞ¹ØÎïÆ·
		tbResult.szErrorMsg = "N©ng cÊp trang bŞ nµy chØ cho bá [trang bŞ]#[Hçn Nguyªn Linh Lé]#[HuyÒn Kim].Ng­¬i bá c¸i kh¸c råi";
		ShowNotice(bCheckOrCommit, tbResult.szErrorMsg);
		tbResult.nRetValue = FANTASY_GOLD_EQUIP_NOUSE;
		return tbResult;
	end


	--¼ÆËã³É¹¦ÂÊ£¨ÕâÀïµÃµ½µÄÊÇ¸ÅÂÊ*100£©
	tbResult.nSuccessRate = floor(tbResult.nFantasyGoldValue * 100 / TB_FANSTAY_GOLD_EQUIP_TO_UP_ID_INTERVAL[tbResult.nEquipType][3][tbResult.nEquipLevel + 1]);
	if tbResult.nSuccessRate > 100 then
		tbResult.nSuccessRate = 100;
	end
	tbResult.nNeedMoney = TB_FANSTAY_GOLD_EQUIP_TO_UP_ID_INTERVAL[tbResult.nEquipType][3][tbResult.nEquipLevel + 1] * 1000;

	--ÅĞ¶Ï½ğÇ®
	if GetCash() < tbResult.nNeedMoney then
		tbResult.szErrorMsg = format("N©ng cÊp trang bŞ nµy cÇn %d ng©n l­îng,tiÒn cña ®¹i hiÖp kh«ng ®ñ", tbResult.nNeedMoney);
		ShowNotice(bCheckOrCommit, tbResult.szErrorMsg);
		tbResult.nRetValue = FANTASY_GOLD_EQUIP_MONEY_NOT_ENOUGH;
		return tbResult;
	end

	if bPreview == 0 then
		tbResult.szErrorMsg = format("TØ lÖ n©ng cÊp thµnh c«ng trang bŞ nµy lµ: %d%%", tbResult.nSuccessRate);
		ShowNotice(bCheckOrCommit, tbResult.szErrorMsg);
	end
	
	tbResult.nRetValue = FANTASY_GOLD_EQUIP_OK;
	return tbResult;
end

function do_update_fantasygoldequip_process_p(nItemCount, bPreview)
	local tbItemIdx = {};
	for i = 1, nItemCount do
		tinsert(tbItemIdx, GetGiveItemUnit(i));
	end

	local tbResult = do_upgrade_fantasygoldequip_check(tbItemIdx, bPreview);
	if bPreview == 1 then--Èç¹ûÊÇÔ¤ÀÀ
		if tbResult.nRetValue ~= FANTASY_GOLD_EQUIP_CAN_PREVIEW then
			ShowNotice(1, tbResult.szErrorMsg);
			return
		end
		local szItemDesc = g_szNpcName .. "Thuéc tİnh cña trang bŞ HuyÒn Kim nµy sau khi n©ng cÊp lµ: <enter>";
		local tbNextPlatinaMagicAttrib = pack(PreviewPlatinaUpgrade(tbResult.nFantasyGoldEquipIdx));
		local tbCurPlatinaMagicAttrib = getItemAllMagicList(tbResult.nFantasyGoldEquipIdx);
		for i = 1, getn(tbNextPlatinaMagicAttrib) do
			if (tbCurPlatinaMagicAttrib[i][1] == tbNextPlatinaMagicAttrib[i][1] and tbCurPlatinaMagicAttrib[i][2] ~= tbNextPlatinaMagicAttrib[i][2]) then
				local szD = (tbNextPlatinaMagicAttrib[i][2]-tbCurPlatinaMagicAttrib[i][2]);
				if (szD > 0) then
					szD = "(+"..szD..")";
				else
					szD = "("..szD..")";
				end
				szItemDesc = szItemDesc.."<color=yellow>"..GetItemMagicDesc(unpack(tbNextPlatinaMagicAttrib[i])).."<color><color=red>"..szD.."<color><enter>";
			else
				szItemDesc = szItemDesc.."<color=green>"..GetItemMagicDesc(unpack(tbNextPlatinaMagicAttrib[i])).."<color><enter>";
			end
		end
		szItemDesc = szItemDesc .. format("Thêi gian khãa (+%d) tiÕng", tbResult.nAddBindHour);
		CreateTaskSay({"<dec>"..szItemDesc, 
			"Xem tr­íc thuéc tİnh cña trang bŞ kh¸c sau khi n©ng cÊp/fantasygoldequip_upgrade_preview",
			"Xin gióp ta n©ng cÊp trang bŞ nµy/fantasygoldequip_upgrade",
			"ThËt ng¹i qu¸, ta sÏ quay l¹i sau./cancel"}
		);
		--Talk(1, "", szItemDesc);
		--Talk(1, "", g_szNpcName .. format("ÄãÏëÒªÉı¼¶µÄĞş½ğ×°±¸ĞèÒª<color=red>%d<color>¸ö<color=yellow>»ìÔªÁéÂ¶<color>£¬<color=red>%d<color>Á½<color=yellow>Òø×Ó<color>£¬³É¹¦ÂÊÎª<color=red>%d%%<color>", tbResult.nNeedRefiningStoneCount, tbResult.nNeedMoney, tbResult.nSuccessRate));
		return
	end

	if tbResult.nRetValue ~= FANTASY_GOLD_EQUIP_OK then
		ShowNotice(1, tbResult.szErrorMsg);
		return
	end


	--¿ÛÇ®ºÍÉ¾³ıÎïÆ·£¨ÕâĞ©ÊÇ²»¹Ü³É¹¦Ê§°Ü¶¼ÒªÉ¾³ıµÄ£©
	Pay(tbResult.nNeedMoney);
	for i = 1, getn(tbItemIdx) do
		if tbItemIdx[i] ~= tbResult.nFantasyGoldEquipIdx then--×°±¸ÏÈ²»É¾³ı
			if RemoveItemByIndex(tbItemIdx[i]) ~= 1 then
			--Èç¹ûÉ¾³ıÎïÆ·Ê§°ÜÔòĞ´ÈÕÖ¾
			WriteLog(format("[N©ng cÊp trang bŞ HuyÒn Kim]\ttµi kho¶n?%s\tnh©n vËt?%s\txãa vËt phÈm[%s]thÊt b¹i?chÕ t¹o thÊt b¹i?", GetAccount(), GetName(), GetItemName(tbItemIdx[i])));
			end
		end
	end

	--Ëæ»ú
	local nRandom = random(1, 100);
	if nRandom <= tbResult.nSuccessRate then--Éı¼¶³É¹¦
		if UpgradePlatinaItem(tbResult.nFantasyGoldEquipIdx) > 0 then
			Talk(1, "", g_szNpcName .. "Chóc mõng ®¹i hiÖp n©ng cÊp thµnh c«ng!Ng­¬i nhËn ®­îc mét trang bŞ cao cÊp");
			--ÉèÖÃĞÂÉú³ÉµÄ×°±¸µÄ°ó¶¨×´Ì¬
			local nNewItemBindState = calc_equip_binditem(tbResult.nBindState, tbResult.nAddBindHour);
			SetItemBindState(tbResult.nFantasyGoldEquipIdx, nNewItemBindState);
			WriteLog(format("[N©ng cÊp trang bŞ HuyÒn Kim]\ttµi kho¶n?%s\tnh©n vËt?%s\tn©ng cÊp[%d]cÊp[%s]thµnh c«ng\ttiªu hao tiÒn%dhai\tHçn Nguyªn Linh Lé%dc¸i\tHuyÒn Kim%dc¸i", GetAccount(), GetName(), tbResult.nEquipLevel + 1, GetItemName(tbResult.nFantasyGoldEquipIdx), tbResult.nNeedMoney, tbResult.nNeedRefiningStoneCount, tbResult.nFantasyGoldFlag));
		else
			Talk(1, "", g_szNpcName .. format("N©ng cÊp thÊt b¹i!Trõ<color=red>%d<color><color=yellow>ng©n l­îng<color>#<color=red>%d<color>c¸i<color=yellow>Hçn Nguyªn Linh Lé<color>#<color=red>%d<color>c¸i<color=yellow>HuyÒn Kim<color>.", tbResult.nNeedMoney, tbResult.nNeedRefiningStoneCount, tbResult.nFantasyGoldFlag));
			WriteLog(format("[N©ng cÊp trang bŞ HuyÒn Kim]\ttµi kho¶n?%s\tnh©n vËt?%s\tn©ng cÊp[%d]##[%s]thÊt b¹i\t#tiÒn tiªu hao%d\tHçn Nguyªn Linh Lé%dc¸i\tHuyÒn Kim%dc¸i", GetAccount(), GetName(), tbResult.nEquipLevel + 1, GetItemName(tbResult.nFantasyGoldEquipIdx), tbResult.nNeedMoney, tbResult.nNeedRefiningStoneCount, tbResult.nFantasyGoldFlag));

		end

	else--Éı¼¶Ê§°Ü
		Talk(1, "", g_szNpcName .. format("N©ng cÊp thÊt b¹i!Trõ<color=red>%d<color><color=yellow>ng©n l­îng<color>#<color=red>%d<color>c¸i<color=yellow>Hçn Nguyªn Linh Lé<color>#<color=red>%d<color>c¸i<color=yellow>HuyÒn Kim<color>.", tbResult.nNeedMoney, tbResult.nNeedRefiningStoneCount, tbResult.nFantasyGoldFlag));
		WriteLog(format("[N©ng cÊp trang bŞ HuyÒn Kim]\ttµi kho¶n?%s\tnh©n vËt?%s\tn©ng cÊp[%d]##[%s]thÊt b¹i\t#tiÒn tiªu hao%d\tHçn Nguyªn Linh Lé%dc¸i\tHuyÒn Kim%dc¸i", GetAccount(), GetName(), tbResult.nEquipLevel + 1, GetItemName(tbResult.nFantasyGoldEquipIdx), tbResult.nNeedMoney, tbResult.nNeedRefiningStoneCount, tbResult.nFantasyGoldFlag));
	end

end


function ShowNotice(nType, szNotice)
	if nType == 1 then
		Talk(1, "", g_szNpcName .. szNotice);
	elseif nType == 2 then
		SetUiGiveItemMsg(szNotice);
	end
end

function getItemAllMagicList(nItemIdx)
	local tb_magic = {};
	for i = 1, 6 do
		tb_magic[getn(tb_magic) + 1] = pack(GetItemMagicAttrib(nItemIdx, i));
	end;
	return tb_magic;
end;

function cancel()
end

--²ğ½âĞş½ğ×°±¸
function split_fantasygoldequip_configm()
--ÈôµÚÎå¸ö²ÎÊı²»Îª0ÔòÔÊĞí°ó¶¨ÎïÆ··ÅÈë
	GiveItemUI("Th¸o trang bŞ HuyÒn Kim", "Ng­¬i sÏ nhËn ®­îc +0 thuéc tİnh trang bŞ HuyÒn Kim vµ tæng sè l­îng tiªu hao n©ng cÊp 88% nguyªn liÖu ", "do_split_fantasygoldequip_process", "cancel",1, "do_split_fantasygoldequip_check");
	SetUiGiveItemMsg("Cho vµo trang bŞ HuyÒn Kim muèn th¸o");
end


function do_split_fantasygoldequip_process(nItemCount)
	local tbResult = do_split_fantasygoldequip_check(nItemCount);
	if tbResult.nRetValue == FANTASY_GOLD_EQUIP_UNKNOWN_ERROR then
		ShowNotice(1, tbResult.szErrorMsg);
		return 0;
	end

	if DegradePlatinaItem(tbResult.nFantasyGoldEquipIdx, tbResult.nEquipLevel) > 0 then
		Talk(1, "", g_szNpcName .. "Chóc mõng ®¹i hiÖp th¸o bá thµnh c«ng!");

		--¸øĞş½ğ
		local szCountLog = "";
		for i, v in tbResult.tbFantasyGoldCount do
			if v ~= 0 then
				PlayerFunLib:GetItem({tbProp={TB_FANTASYGOLD[1], TB_FANTASYGOLD[2], TB_FANTASYGOLD[3], i},nBindState=-2,},v,"Trang bŞ HuyÒn Kim th¸o bá")
				szCountLog = szCountLog .. format("%dcÊp HuyÒn Kim%dc¸i,", i, v);
			end
		end
		--ÉèÖÃĞÂÉú³ÉµÄ×°±¸µÄ°ó¶¨×´Ì¬
		--local nNewItemBindState = calc_equip_binditem(tbResult.nBindState, tbResult.nAddBindHour);
		--if nNewItemBindState > 0 then
		--	SetItemBindState(tbResult.nFantasyGoldEquipIdx, nNewItemBindState);
		--end

		if tbResult.nBindState > 0 then
			local nNewBindTime = tbResult.nBindState - (floor((GetCurServerTime() - 946656000) / 3600) - 7 * 24) + tbResult.nAddBindHour;
			if nNewBindTime <= 0 then
				SetItemBindState(tbResult.nFantasyGoldEquipIdx, 0)
			else
				SetItemBindState(tbResult.nFantasyGoldEquipIdx, tbResult.nBindState + tbResult.nAddBindHour)
			end
		else
			SetItemBindState(tbResult.nFantasyGoldEquipIdx, tbResult.nBindState);
		end

		--ÈÕÖ¾
		WriteLog(format("[Th¸o bá trang bŞ HuyÒn Kim]\ttµi kho¶n?%s\tnh©n vËt?%s\tth¸o[%d]cÊp[%s]thµnh c«ng\tnhËn ®­îc%s", GetAccount(), GetName(), tbResult.nEquipLevel, GetItemName(tbResult.nFantasyGoldEquipIdx), szCountLog));
	else
		Talk(1, "", g_szNpcName .. "Th¸o bá thÊt b¹i");
		WriteLog(format("[Th¸o bá trang bŞ HuyÒn Kim]\ttµi kho¶n?%s\tnh©n vËt?%s\tth¸o[%d]cÊp[%s]thÊt b¹i", GetAccount(), GetName(), tbResult.nEquipLevel, GetItemName(tbResult.nFantasyGoldEquipIdx)));

	end


end

function do_split_fantasygoldequip_check(nItemCount)
	local tbResult = {};
	tbResult.nFantasyGoldEquipIdx = 0;--ÕÒµ½²¢ÇÒÎ¨Ò»µÄĞş½ğ×°±¸µÄË÷Òı
	tbResult.nRetValue = FANTASY_GOLD_EQUIP_UNKNOWN_ERROR;
	tbResult.nEquipType = 0;--µ±Ç°×°±¸ÊÇÄÄÒ»Àà£¬Çà¾Ô¡¢ÔÆÂ¹...
	tbResult.nEquipLevel = 0;--Õâ¼ş×°±¸µÄµÈ¼¶
	tbResult.tbFantasyGoldCount = 0;--²ğ½â³ÉĞş½ğµÄÊıÁ¿
	tbResult.nBindState = 0;--×°±¸µÄ°ó¶¨×´Ì¬
	tbResult.nAddBindHour = 0;--×°±¸ĞèÒªÔö¼ÓµÄ°ó¶¨Ê±¼ä
	tbResult.szErrorMsg = "";--´íÎó·µ»ØĞÅÏ¢

	if GetBoxLockState() == 1 then
		tbResult.szErrorMsg = "Ng­¬i ®ang trong tr¹ng th¸i r­¬ng chøa ®å bŞ khãa, h·y më khãa tr­íc!";
		ShowNotice(2, tbResult.szErrorMsg);
		return tbResult;
	end

	if nItemCount > 1 or nItemCount <= 0 then
		tbResult.szErrorMsg = "§¹i hiÖp chØ cã thÓ cho vµo mét trang bŞ muèn th¸o bá";
		ShowNotice(2, tbResult.szErrorMsg);
		return tbResult;
	end

	local nItemIdx = GetGiveItemUnit(1);

	-----------------¼ì²â×°±¸ºÏ·¨ĞÔ-----------------------------------------
	local nEquipRecordIdx = GetPlatinaEquipIndex(nItemIdx);
	for index, v in TB_FANSTAY_GOLD_EQUIP_TO_UP_ID_INTERVAL do
		if nEquipRecordIdx >= v[1] and nEquipRecordIdx <= v[2] then
			tbResult.nFantasyGoldEquipIdx = nItemIdx;
			tbResult.nEquipType = index;
		end
	end
	if tbResult.nFantasyGoldEquipIdx <= 0 then
		tbResult.szErrorMsg = "§¹i hiÖp ph¶i cho trang bŞ HuyÒn Kim vµo";
		ShowNotice(2, tbResult.szErrorMsg);
		return tbResult;
	end
	local tbFantasyGoldEquipProp = pack(GetItemProp(tbResult.nFantasyGoldEquipIdx));
	if tbFantasyGoldEquipProp[1] ~= 0 then--²»ÊÇ×°±¸
		tbResult.szErrorMsg = "§¹i hiÖp ph¶i cho trang bŞ HuyÒn Kim vµo";
		ShowNotice(2, tbResult.szErrorMsg);
		return tbResult;
	end

	tbResult.nEquipLevel = GetPlatinaLevel(tbResult.nFantasyGoldEquipIdx);
	if tbResult.nEquipLevel <= 0 then
		tbResult.szErrorMsg = "Trang bŞ HuyÒn Kim cÊp 0 kh«ng thÓ th¸o bá";
		ShowNotice(2, tbResult.szErrorMsg);
		return tbResult;
	end

	local nEquipQuality = GetItemQuality(tbResult.nFantasyGoldEquipIdx);
	if nEquipQuality ~= 4 then--²»ÊÇ°×½ğ×°±¸
		tbResult.szErrorMsg = "§¹i hiÖp ph¶i cho trang bŞ HuyÒn Kim vµo";
		ShowNotice(2, tbResult.szErrorMsg);
		return tbResult;
	end
	
	local nEquipExpiredTime = ITEM_GetExpiredTime(tbResult.nFantasyGoldEquipIdx);
	local tbEquipProp = pack(GetItemProp(nEquIdx));
	-- ÓĞ±£ÖÊÆÚµÄ×°±¸
	if nEquipExpiredTime > 0 then 
		tbResult.szErrorMsg = "Trang bŞ ®ang bŞ khãa kh«ng thÓ th¸o bá";
		ShowNotice(2, tbResult.szErrorMsg);
		return tbResult;
	end

	--»ñÈ¡°ó¶¨×´Ì¬
	tbResult.nBindState = GetItemBindState(tbResult.nFantasyGoldEquipIdx)	--»ñÈ¡°ó¶¨×´Ì¬
	tbResult.nAddBindHour = -TB_FANSTAY_GOLD_EQUIP_TO_UP_ID_INTERVAL[tbResult.nEquipType][4] * 24 * (tbResult.nEquipLevel + 1);
	
	--¼ì²â±³°ü¿Õ¼ä
	if PlayerFunLib:CheckFreeBagCell(10, "") == nil then
		tbResult.szErrorMsg = "CÇn İt nhÊt m­êi tói ®å";
		ShowNotice(2, tbResult.szErrorMsg);
		return tbResult;
	end
	
	--¼ì²âÄÜ»ñµÃ¶àÉÙĞş½ğ	
	local nEquipValue = GetFantasyGoldEquipValueByLevel(tbResult.nEquipType, tbResult.nEquipLevel);
	tbResult.tbFantasyGoldCount = FantasyGoldEquipValueToFantasyGoldCount(floor(nEquipValue * 0.88));

	tbResult.nRetValue = FANTASY_GOLD_EQUIP_OK;
	local szCount = "";
	for i, v in tbResult.tbFantasyGoldCount do
		if v ~= 0 then
			szCount = szCount .. format("%dcÊp%dc¸i ", i, v)
		end
	end
	tbResult.szErrorMsg = format("NhËn ®­îc HuyÒn Kim:%s", szCount);
	ShowNotice(2, tbResult.szErrorMsg);

	return tbResult;
end

--¼ÆËãÄ³ÖÖÀàÄ³µÈ¼¶µÄĞş½ğ×°±¸µÄ¼ÛÖµÁ¿
function GetFantasyGoldEquipValueByLevel(nEquipType, nLevel)
	local nEquipTypeCount = getn(TB_FANSTAY_GOLD_EQUIP_TO_UP_ID_INTERVAL)
	if nEquipType <= 0 or nEquipType > nEquipTypeCount then
		return 0;
	end
	if nLevel <= 0 then
		return 0;
	end

	local tbValueList = TB_FANSTAY_GOLD_EQUIP_TO_UP_ID_INTERVAL[nEquipType][3];
	local nRetValue = 0;
	for i = 1, nLevel do
		nRetValue = nRetValue + tbValueList[i];
	end
	return nRetValue;
end

--¼ÆËãÄ³¼ÛÖµÁ¿¿ÉÒÔ¶Ò»»³É¶àÉÙĞş½ğ£¨·ÖµÈ¼¶£©·µ»Øtable
function FantasyGoldEquipValueToFantasyGoldCount(nEquipValue)
	local nTotalValue = nEquipValue;
	local nMaxLevel = 10
	local tbRetCount = {};
	local nCurCount = 0;
	for i = nMaxLevel, 1, -1 do
		local nFantasyGoldValue = CalcFantasyGoldValueByLevel(i);
		nCount = floor(nTotalValue / nFantasyGoldValue);
		
		nCurCount = nCurCount + nCount;
		if nCurCount >= 30 then
			nCount = nCount - (nCurCount - 30)
		end

		tbRetCount[i] = nCount;

		nTotalValue = nTotalValue - nCount * nFantasyGoldValue;

		if nCurCount >= 30 then
			break;
		end
	end
	return tbRetCount;
end

