Include("\\script\\global\\platina_head.lua");
Include("\\script\\lib\\basic.lua");
local nOpenLevel = 7
function platina_main()
	local aryDescribe = {
	"<dec><npc>Tr­íc kia, ta tõng gióp quan phñ dïng c¸c <color=yellow>m¶nh Bæ Thiªn Th¹ch<color> ®Ó chÕ t¹o ra thÇn binh lîi khİ. NÕu nh­ <sex>cã thÓ t×m ra<color=yellow>m¶nh Bæ Thiªn Th¹ch<color> nµy, ta cã thÓ gióp ng­¬i chÕ t¹o trang bŞ B¹ch Kim, nhÊt ®Şnh kh«ng thÓ thiÕu vËt liÖu nµy.",
	"Ta muèn th¨ng cÊp cho trang bŞ B¹ch Kim nµy/upgrade_paltinaequip",
	"Ta muèn chÕ t¹o trang bŞ Hoµng Kim thµnh trang bŞ B¹ch Kim/upgrade_goldformplatina",
	"C¸ch thu thËp m¶nh Bæ Thiªn Th¹ch/about_aerolite",
	"Trang bŞ B¹ch Kim lµ g×/about_platina",
	"§Ó ta suy nghÜ kü l¹i xem/cancel",
	};
	CreateTaskSay(aryDescribe);
end;

----½«»Æ½ğ×°±¸´òÔì³É°×½ğ×°±¸
function upgrade_goldformplatina()
	CreateTaskSay({
		"<dec><npc>N©ng cÊp trang bŞ hoµng kim lªn b¹ch kim nguyªn liÖu cÇn cã: 1 bæ thiªn th¹ch (trung), 1 huyÒn tinh kho¸ng th¹ch cÊp 8, 1 thÇn bİ kho¸ng th¹ch vµ 1000 v¹n l­îng. Bæ thiªn th¹ch cã thÓ dïng ®iÓm vinh dù hoÆc mua t¹i Kú Tr©n C¸c. ChuÈn bŞ xong tÊt c¶ nguyªn liÖu th× chóng ta cã thÓ b¾t ®Çu c«ng viÖc chÕ t¹o trang bŞ.<enter> NÕu nh­ ng­¬i muèn biÕt sau khi n©ng cÊp thµnh trang bŞ b¹ch kim cã thuéc tİnh nh­ thÕ nµo, th× cø ®­a trang bŞ hoµng kim cho ta sÏ biÕt ngay.",
		"Ta muèn xem thuéc tİnh cña trang bŞ B¹ch Kim sau khi n©ng cÊp tõ trang bŞ Hoµng Kim nµy./want_upgoldeq_preview",
		"Cã thÓ gióp ta chÕ t¹o trang bŞ nµy thµnh trang bŞ B¹ch Kim ®­îc kh«ng?/want_upgoldeq",
		"ta nghÜ l¹i xem /cancel"
	});
end;

function want_upgoldeq_preview()
	GiveItemUI("Xem qua chÕ t¹o trang bŞ B¹ch Kim", "§Æt trang bŞ Hoµng Kim muèn chÕ t¹o vµo hép ®ùng vËt phÈm.", "do_upgoldeq_preview", "cancel",1);
end;

function do_upgoldeq_preview(nItemCount)
	local tbDialog =
	{
		"",
		"§Ó ta thö l¹i xem/want_upgoldeq_preview",
		"ThËt ng¹i qu¸, ta sÏ quay l¹i sau./cancel"
	};
	
	if (nItemCount ~= 1) then
		tbDialog[1] = "<dec><npc>§¹i hiÖp bá sè l­îng vËt phÈm kh«ng ®óng.";
		CreateTaskSay(tbDialog);
		return
	end

	-- ÅĞ¶Ï»Æ½ğ×°±¸ÊÇ·ñ·ûºÏÒªÇó
	local nCurItemIdx = GetGiveItemUnit(nItemCount);
	local bSuccess, szErrorMsg, nComposeEntryIdx = fit_formed_eq(nCurItemIdx);
	
	if (bSuccess == 0) then
		tbDialog[1] = szErrorMsg;
		return
	end
	
	
	-- Ô¤ÀÀ
	local szDesc = preview_eq_format(nCurItemIdx);
	CreateTaskSay({"<dec><npc>Trang bŞ B¹ch Kim hoµn thµnh lµ <color=yellow>"..TB_PLATINAEQ_GOLDEQ[nComposeEntryIdx][4]..", thuéc tİnh nh­ sau: <enter>"..szDesc,
		"Gióp ta xem trang bŞ B¹ch Kim hoµn thµnh tõ nh÷ng trang bŞ kh¸c sÏ nh­ thÕ nµo./want_upgoldeq_preview",
		"Cã thÓ gióp ta chÕ t¹o trang bŞ nµy thµnh trang bŞ B¹ch Kim ®­îc kh«ng/want_upgoldeq",
		"Ta biÕt råi, xin ®a t¹./cancel"});
end;

function want_upgoldeq()
	GiveItemUI("ChÕ t¹o trang bŞ B¹ch Kim", "Mang trang bŞ Hoµng Kim ng­¬i muèn chÕ t¹o vµ 1 m¶nh Bæ Thiªn Th¹ch (trung), 1 HuyÒn Tinh Kho¸ng Th¹ch cÊp 8, vµ 1 ThÇn bİ kho¸ng th¹ch vµo hép vËt phÈm d­íi ®©y. ChÕ t¹o cÇn tiªu phİ 1000 v¹n l­îng, ng­¬i chuÉn bŞ kü ch­a?", "do_upgoldeq_process", "cancel",1);
end;

function do_upgoldeq_process(nItemCount)
	local tbDialog =
	{
		"",
		"§Ó ta thö l¹i xem/want_upgoldeq",
		"ThËt ng¹i qu¸, ta sÏ quay l¹i sau./cancel"
	};

	local nComposeEntryIdx	= 0;
	local nEquipItemIdx		= 0;
	local nSrcItemValueSum	= 0;
	local tbMaterialIdx		= {};
	
	local tb_material = {};
	for szkey, tb_item in tb_gold2planita_material do
		tb_material[szkey] = {};
		tb_material[szkey][1] = 0;
	end
	
	for i = 1, nItemCount do
		local nCurItemIdx 		= GetGiveItemUnit(i);
		local nCurItemName 		= GetItemName(nCurItemIdx);
		local nCurItemQuality	= GetItemQuality(nCurItemIdx);
		local tbCurItemProp 	= pack(GetItemProp(nCurItemIdx));
		
		-- »Æ½ğ×°±¸
		if (nCurItemQuality == 1) then
			
			-- Ö»ÄÜ·ÅÈëÒ»¼ş»Æ½ğ×°±¸
			if (nComposeEntryIdx ~= 0) then
				tbDialog[1] = "<dec><npc>Rèt cuéc ng­¬i muèn chÕ t¹o trang bŞ Hoµng Kim nµo? Ta kh«ng hoa m¾t chø?";
				CreateTaskSay(tbDialog);
				return
			end
			
			-- ÅĞ¶Ï»Æ½ğ×°±¸ÊÇ·ñ·ûºÏÌõ¼ş
			local bSuccess, szErrorMsg, nEqEntryIdx	= fit_formed_eq(nCurItemIdx);
			if (bSuccess == 0) then
				tbDialog[1] = szErrorMsg;
				CreateTaskSay(tbDialog);
				return
			end

			nEquipItemIdx	= nCurItemIdx;
			nComposeEntryIdx= nEqEntryIdx;
			
		else
			
			local bSuccess, szErrorMsg = fit_formed_material(nCurItemIdx, tb_gold2planita_material, nEquipItemIdx);
			if (bSuccess == 0) then
				tbDialog[1] = szErrorMsg;
				CreateTaskSay(tbDialog);
				return
			end
			
			local szItemKey = tbCurItemProp[1]..","..tbCurItemProp[2]..","..tbCurItemProp[3];
			tb_material[szItemKey][1] = tb_material[szItemKey][1] + GetItemStackCount(nCurItemIdx);
			tbMaterialIdx[getn(tbMaterialIdx) + 1] = nCurItemIdx;
		end
	end
	
	-- ±ØĞëÒªÓĞ¼ş»Æ½ğ×°±¸
	if (nComposeEntryIdx == 0) then
		tbDialog[1] = "<dec><npc>NÕu muèn ta gióp ng­¬i, h·y giao trang bŞ ®ã cho ta.";
		CreateTaskSay(tbDialog);
		return
	end
	
	-- ±ØĞè²ÄÁÏµÄ¸öÊı±ØĞëÂú×ãÒªÇó
	for szkey, tb_item in tb_gold2planita_material do
		if (tb_item.nCount) then
			if (tb_material[szkey][1] ~= tb_item.nCount) then
				tbDialog[1] = "<dec><npc>Muèn chÕ t¹o trang bŞ nµy, tèi thiÓu ta còng cÇn <color=yellow>"..tb_item.nCount.."c¸i"..tb_item.szName.."<color>, ®Æt nhiÒu qu¸ sÏ thiÖt thßi cho ng­¬i, nh­ng İt qu¸ th× ta kh«ng chÕ t¹o ®­îc."
				CreateTaskSay(tbDialog);
				return
			end
		end
	end

	do_upgrade_platina(nEquipItemIdx, TB_PLATINAEQ_GOLDEQ[nComposeEntryIdx][4], tbMaterialIdx, tb_material, 1);
end

----°×½ğ×°±¸Éı¼¶
function upgrade_paltinaequip()
	CreateTaskSay({
		"<dec><npc>Th¨ng cÊp thµnh trang bŞ B¹ch Kim yªu cÇu nh÷ng vËt liÖu sau: 1 m¶nh <color=yellow>Bæ Thiªn Th¹ch (trung)<color> vµ 1000 v¹n l­îng. Cã thÓ dïng ®iÓm vinh dù ®Ó ®æi m¶nh Bæ Thiªn Th¹ch, ng­¬i ®· chuÈn bŞ s½n sµng råi, chóng ta cã thÓ b¾t ®Çu.<enter><color=red>Th¨ng cÊp trang bŞ B¹ch Kim sÏ cã rñi ro nhÊt ®Şnh, nÕu nh­ thÊt b¹i th× nh÷ng vËt liÖu vµ 1000 v¹n sÏ bŞ mÊt.<color><enter>NÕu ng­¬i muèn biÕt thuéc tİnh trang bŞ B¹ch Kim hoµn thµnh nh­ thÕ nµo cã thÓ mang trang bŞ Hoµng Kim ®Õn ®©y cho ta xem thö.",
		"Ta muèn xem thuéc tİnh trang bŞ B¹ch Kim hoµn thµnh./#want_upplatinaeq(1)",
		"Cã thÓ gióp ta th¨ng cÊp trang bŞ nµy kh«ng/#want_upplatinaeq(0)",
		"ta nghÜ l¹i xem /cancel"
	});
end;

function want_upplatinaeq(bPreview)
	if (bPreview == 1) then
		GiveItemUI("Xem qu¸ tr×nh th¨ng cÊp trang bŞ B¹ch Kim", "H·y ®Æt trang bŞ B¹ch Kim muèn th¨ng cÊp vµ m¶nh Bæ Thiªn Th¹ch vµo hép vËt phÈm.", "do_upplatinaeq_preview", "cancel",1);
	else
		GiveItemUI("Th¨ng cÊp trang bŞ B¹ch Kim", "H·y ®Æt trang bŞ B¹ch Kim muèn th¨ng cÊp vµ m¶nh Bæ Thiªn Th¹ch vµo hép vËt phÈm, th¨ng cÊp tiªu tèn 1000 v¹n l­îng.", "do_upplatinaeq_process", "cancel",1);
	end;
end;

function do_upplatinaeq_preview(nItemCount)
	local tbDialog =
	{
		"",
		"§Ó ta thö l¹i xem/#want_upplatinaeq(1)",
		"ThËt ng¹i qu¸, ta sÏ quay l¹i sau./cancel"
	};
	
	local nComposeEntryIdx	= 0;
	local nEquipItemIdx		= 0;
	local nSrcItemValueSum	= 0;
	
	local tb_enhanceitem_count = {};
	for szkey, tb_item in tb_upgrade_material do
		tb_enhanceitem_count[szkey] 	= {};
		tb_enhanceitem_count[szkey][1] 	= 0;
	end;
	 
	for i = 1, nItemCount do
		local nCurItemIdx 		= GetGiveItemUnit(i);
		local nCurItemQuality	= GetItemQuality(nCurItemIdx);
		local tbCurItemProp 	= pack(GetItemProp(nCurItemIdx));

		if (nCurItemQuality == 4) then
			
			if (nComposeEntryIdx ~= 0) then
				tbDialog[1] = "<dec><npc>Rèt cuéc ng­¬i muèn n©ng cÊp thµnh trang bŞ b¹ch kim nµo? Cã ph¶i ta ®ang hoa m¾t ch¨ng?";
				CreateTaskSay(tbDialog);
				return
			end
			
			local bSuccess, szErrorMsg, nEqEntryIdx	= fit_formed_eq(nCurItemIdx);
			if (bSuccess == 0) then
				tbDialog[1] = szErrorMsg;
				CreateTaskSay(tbDialog);
				return
			end

			nEquipItemIdx	= nCurItemIdx;
			nComposeEntryIdx= nEqEntryIdx;
		else
			local bSuccess, szErrorMsg = fit_formed_material(nCurItemIdx, tb_upgrade_material, nEquipItemIdx);
			if (bSuccess == 0) then
				tbDialog[1] = szErrorMsg;
				CreateTaskSay(tbDialog);
				return
			end
			
			local szItemKey = tbCurItemProp[1]..","..tbCurItemProp[2]..","..tbCurItemProp[3];
			if (tb_upgrade_material[szItemKey]["nValue"]) then
				nSrcItemValueSum = nSrcItemValueSum + tb_upgrade_material[szItemKey]["nValue"] * GetItemStackCount(nCurItemIdx);
			end
			
			tb_enhanceitem_count[szItemKey][1] = tb_enhanceitem_count[szItemKey][1] + GetItemStackCount(nCurItemIdx);
		end
	end
	
	if (nComposeEntryIdx == 0) then
		tbDialog[1] = "<dec><npc>H·y ®­a cho ta trang bŞ cÇn n©ng cÊp thµnh b¹ch kim, nÕu kh«ng th× lµm sao ta biÕt c¸ch n©ng cÊp b©y giê?";
		CreateTaskSay(tbDialog);
		return
	end

	local nUpGradeProb = nSrcItemValueSum / (TB_PLATINAEQ_GOLDEQ[nComposeEntryIdx][3] * TB_PLATINAEQ_UPGRADERATE[GetPlatinaLevel(nEquipItemIdx)]);	
	if (nUpGradeProb >= 1) then
		nUpGradeProb = 1;
	elseif (nUpGradeProb >= 0.9999) then
		nUpGradeProb = 0.9999;
	end
	
	local szDesc = preview_eq_format(nEquipItemIdx);
	CreateTaskSay({format("<dec><npc>Theo nh­ kinh nghiÖm cña ta, trang bŞ b¹ch kim nµy cã <color=yellow>%5.2f%%<color>  kh¶ n¨ng n©ng lªn cÊp kÕ tiÕp vµ cã thuéc tİnh: <enter>%s", nUpGradeProb*100, szDesc),
					"Gióp ta xem trang bŞ B¹ch Kim hoµn thµnh tõ nh÷ng trang bŞ kh¸c sÏ nh­ thÕ nµo./#want_upplatinaeq(1)",
					"Cã thÓ gióp ta chÕ t¹o trang bŞ nµy thµnh trang bŞ B¹ch Kim ®­îc kh«ng/#want_upplatinaeq(0)",
					"Ta biÕt råi, xin ®a t¹./cancel"});
end

function do_upplatinaeq_process(nItemCount)
	local tbDialog =
	{
		"",
		"§Ó ta thö l¹i xem/#want_upplatinaeq(0)",
		"ThËt ng¹i qu¸, ta sÏ quay l¹i sau./cancel"
	};
	
	local nComposeEntryIdx 	= 0;
	local nEquipItemIdx 	= 0;
	local nSrcItemValueSum 	= 0;
	local nUpGradeProb 		= 0;
	local tbMaterialIdx		= {};

	local tb_enhanceitem_count = {};
	for szkey, tb_item in tb_upgrade_material do
		tb_enhanceitem_count[szkey]		= {};
		tb_enhanceitem_count[szkey][1] 	= 0;
	end
	
	-- ÏÈ±éÀúÒ»±é ÕÒµ½ĞèÒªÉı¼¶µÄ°×½ğ×°±¸»òÕßĞèÒª´òÔìµÄ»Æ½ğ×°±¸
	for i = 1, nItemCount do
		local nCurItemIdx 		= GetGiveItemUnit(i);
		local nCurItemQuality	= GetItemQuality(nCurItemIdx);
		local tbCurItemProp 	= pack(GetItemProp(nCurItemIdx));

		if (nCurItemQuality == 4) then
			if (nComposeEntryIdx ~= 0) then
				tbDialog[1] = "<dec><npc>Rèt cuéc ng­¬i muèn n©ng cÊp thµnh trang bŞ b¹ch kim nµo? Cã ph¶i ta ®ang hoa m¾t ch¨ng?";
				CreateTaskSay(tbDialog);
				return
			end
			
			local bSuccess, szErrorMsg, nEqEntryIdx	= fit_formed_eq(nCurItemIdx);
			if (bSuccess == 0) then
				tbDialog[1] = szErrorMsg;
				CreateTaskSay(tbDialog);
				return
			end

			nEquipItemIdx	= nCurItemIdx;
			nComposeEntryIdx= nEqEntryIdx;
		end
	end
	
	if (nComposeEntryIdx == 0) then
		tbDialog[1] = "<dec><npc>NÕu muèn ta gióp ng­¬i, h·y giao trang bŞ ®ã cho ta.";
		CreateTaskSay(tbDialog);
		return
	end
	
	-- Ğ£Ñé²ÄÁÏÊÇ·ñÆ¥Åä
	for i = 1, nItemCount do
		local nCurItemIdx 		= GetGiveItemUnit(i);
		local nCurItemQuality	= GetItemQuality(nCurItemIdx);
		local nCurItemName 		= GetItemName(nCurItemIdx);
		local tbCurItemProp		= pack(GetItemProp(nCurItemIdx));

		if (nCurItemQuality ~= 4) then
			local bSuccess, szErrorMsg = fit_formed_material(nCurItemIdx, tb_upgrade_material, nEquipItemIdx);
			if (bSuccess == 0) then
				tbDialog[1] = szErrorMsg;
				CreateTaskSay(tbDialog);
				return
			end
				
			local szItemKey = tbCurItemProp[1]..","..tbCurItemProp[2]..","..tbCurItemProp[3];
			if (tb_upgrade_material[szItemKey]["nValue"]) then
				nSrcItemValueSum = nSrcItemValueSum + tb_upgrade_material[szItemKey]["nValue"] * GetItemStackCount(nCurItemIdx);
			end
			
			tbMaterialIdx[getn(tbMaterialIdx) + 1] = nCurItemIdx;
			tb_enhanceitem_count[szItemKey][1] = tb_enhanceitem_count[szItemKey][1] + GetItemStackCount(nCurItemIdx);
		end
	end
	
	for szkey, tb_item in tb_upgrade_material do
		if (tb_item.nCount) then
			if (tb_item.nUpgradeLevel and tb_item.nUpgradeLevel ~= GetPlatinaLevel(nEquipItemIdx)) then
			elseif(tb_item.nCount ~= tb_enhanceitem_count[szkey][1]) then
				tbDialog[1] = "<dec><npc>Muèn chÕ t¹o trang bŞ nµy ta chØ cÇn <color=yellow>"..tb_item.nCount.."c¸i"..tb_item.szName.."<color>, ®Æt nhiÒu qu¸ sÏ thiÖt thßi cho ng­¬i, nh­ng İt qu¸ th× ta kh«ng chÕ t¹o ®­îc."
				CreateTaskSay(tbDialog);
				return
			end
		end
	end
	
	nUpGradeProb = nSrcItemValueSum / (TB_PLATINAEQ_GOLDEQ[nComposeEntryIdx][3] * TB_PLATINAEQ_UPGRADERATE[GetPlatinaLevel(nEquipItemIdx)]);	
	if (nUpGradeProb >= 1) then
		nUpGradeProb = 1;
	elseif (nUpGradeProb >= 0.9999) then
		nUpGradeProb = 0.9999;
	end
	
	do_upgrade_platina(nEquipItemIdx, TB_PLATINAEQ_GOLDEQ[nComposeEntryIdx][4], tbMaterialIdx, tb_enhanceitem_count, nUpGradeProb);
end;
----½«»Æ½ğ×°±¸´òÔì³É°×½ğ×°±¸ END


function getItemAllMagicList(nItemIdx)
	local tb_magic = {};
	for i = 1, 6 do
		tb_magic[getn(tb_magic) + 1] = pack(GetItemMagicAttrib(nItemIdx, i));
	end;
	return tb_magic;
end;

function about_aerolite()
	CreateTaskSay({
		"m¶nh Bæ Thiªn Th¹ch lµ b¶o vËt cña trêi ®Êt, chèn nh©n gian khã t×m. Tuy nhiªn, ng­¬i cã thÓ ®Õn  <color=yellow>Sø gi¶ liªn ®Êu<color> hái xem thÕ nµo, nÕu ng­¬i cã <color=yellow>§iÓm vinh dù<color> th× cã thÓ mua ®­îc. Còng cã thÓ ghĞ vµo <color=yellow>Kú Tr©n C¸c<color> xem thö.",
		"Ta biÕt råi!/cancel",
	});
end;

function about_platina()
	CreateTaskSay({"<dec><npc>Thuéc tİnh cña trang bŞ B¹ch Kim sÏ do thuéc tİnh cña trang bŞ Hoµng Kim chÕ t¹o quyÕt ®Şnh. Thuéc tİnh trang bŞ Hoµng Kim cµng tèt th× trang bŞ B¹ch Kim t¹o thµnh sÏ cµng tèt. NÕu kh«ng hµi lßng víi trang bŞ Hoµng Kim hiÖn t¹i, ta kiÕn nghŞ h·y t×m trang bŞ Hoµng Kim kh¸c.", "KÕt thóc ®èi tho¹i/cancel"});
end;


-- new func
-- ÅĞ¶Ï¸øÓè½çÃæÖĞµÄ°×½ğ»òÕß»Æ½ğ×°±¸ÊÇ·ñÊÇ´æÔÚ²¢ÇÒÎ¨Ò»
function fit_formed_eq(nCurItemIdx)	
	local nCurItemQuality	= GetItemQuality(nCurItemIdx);
	local nExpiredTime 		= ITEM_GetExpiredTime(nCurItemIdx);
	local tbCurItemProp 	= pack(GetItemProp(nCurItemIdx));
	
	local szErrorMsg 		= "";	
	local szGetEquipIDFunc 	= "";
	local nComposeEntryIdx	= 0;
	local szEqType			= "";
	if (nCurItemQuality == 1) then
		szGetEquipIDFunc = "GetGlodEqIndex";
		szEqType	= "Trang bŞ Hoµng Kim";
	else
		szGetEquipIDFunc = "GetPlatinaEquipIndex";
		szEqType	= "Trang bŞ B¹ch Kim";
	end

	if (tbCurItemProp[1] ~= 0) then	--Èç¹û²»ÊÇ×°±¸(¿ÉÄÜÊÇËğ»µ×°±¸)
		szErrorMsg = format("<dec><npc>ChØ cÇn ®­a cho ta %s chÕ t¹o trang bŞ b¹ch kim lµ ®ñ, nh÷ng thø kh¸c ng­¬i h·y thu l¹i.", szEqType);
		return 0, szErrorMsg
	end
	
	if (nExpiredTime > 0) then -- ÓĞ±£ÖÊÆÚµÄ×°±¸£¬²»ÄÜ£¡
		szErrorMsg = "<dec><npc>Trang bŞ cã <color=fire>thêi h¹n sö dông<color> th× kh«ng thÓ rÌn ®­îc.";
		return 0, szErrorMsg
	end
	
	for szkey, tb_item in TB_PLATINAEQ_GOLDEQ do
		if (szkey == getglobal(szGetEquipIDFunc)(nCurItemIdx)) then
			nComposeEntryIdx = szkey;
			break;
		end
	end                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
	if (nComposeEntryIdx == 0) then
		szErrorMsg = format("<dec><npc>RÊt tiÕc, víi kinh nghiÖm hiÖn t¹i cña ta th× kh«ng thÓ chÕ t¹o ®­îc <color=yellow>%s<color>.", GetItemName(nCurItemIdx));
		return 0, szErrorMsg
	end
	
	
	if (nCurItemQuality == 4 and GetPlatinaLevel(nCurItemIdx) >= %nOpenLevel) then
		szErrorMsg = "<dec><npc>Víi søc hiÖn t¹i cña ta chØ cã thÓ gióp ng­¬i c­êng hãa trang bŞ nµy ®Õn cÊp nµy th«i, nh­ng mµ sau nµy ta cã thÓ gióp ng­¬i tu luyÖn tiÕp. Cø tin ta ®i råi sÏ cã mét ngµy ta sÏ gióp ng­¬i c­êng hãa mãn ®å nµy lªn, ®Õn lóc ®ã ng­¬i h·y quay l¹i gÆp ta nhĞ!";
		return 0, szErrorMsg
	end;
	
	
	if (nCurItemQuality == 4 and GetPlatinaLevel(nCurItemIdx) >= 10) then
		szErrorMsg = "<dec><npc>Trang bŞ nµy ®· ®¹t ®¼ng cÊp cao nhÊt, kh«ng cÇn ph¶i th¨ng cÊp n÷a.";
		return 0, szErrorMsg
	end;
	
	return 1, szErrorMsg, nComposeEntryIdx;
end

-- ÅĞ¶Ï¸øÓè½çÃæÖĞ·ÅÈëµÄ²ÄÁÏÊÇ·ñºÏÀí£¨Èç¹ûÊÇÔ¤ÀÀ£¬Ö»ÒªÅĞ¶ÏÓĞ¼ÛÖµÁ¿µÄ²ÄÁÏÊÇ·ñ¶¼ÔÚ£¨ÎŞ¼ÛÖµÁ¿µ«ÊÇ´òÔìËùĞèµÄ²ÄÁÏ²»ÓÃ¹Ü£©£¬Èç¹ûÊÇ´òÔì£¬Ôò¶¼ÒªÅĞ¶Ï£©
-- ²ÎÊı£º²ÄÁÏIdx£¬ÊÇ·ñÎªÔ¤ÀÀ£¬²ÄÁÏtable£¬»Æ½ğ×°±¸idx
function fit_formed_material(nCurItemIdx, tb_material, nPlatinaIdx)
	local szErrorMsg	= "";
	local tbCurItemProp	= pack(GetItemProp(nCurItemIdx));
	local szItemKey		= tbCurItemProp[1]..","..tbCurItemProp[2]..","..tbCurItemProp[3];

	if (tb_material[szItemKey] == nil)  then
		szErrorMsg = "<dec><npc>§¹i hiÖp bá nguyªn liÖu vµo kh«ng ®óng nh­ yªu cÇu";
		return 0, szErrorMsg;
	end
	
	if (tb_material[szItemKey].nItemLevel) then
		if (tbCurItemProp[4] ~= tb_material[szItemKey]["nItemLevel"]) then
			szErrorMsg = format("<dec><npc>CÊp trang bŞ cña %s h×nh nh­ lµ kh«ng ®óng th× ph¶i.", GetItemName(nCurItemIdx));
			return 0, szErrorMsg;
		end
	end
	if (tb_material[szItemKey]["nUpgradeLevel"]) then
		if (GetPlatinaLevel(nPlatinaIdx) ~= tb_material[szItemKey]["nUpgradeLevel"]) then
			szErrorMsg = "<dec><npc>N©ng cÊp trang bŞ b¹ch kim nµy cã nguyªn liÖu kh«ng ®óng nh­ yªu cÇu";
			return 0, szErrorMsg;
		end
	end
	
	return 1, szErrorMsg;
end

-- Ô¤ÀÀµÄ¸ñÊ½
function preview_eq_format(nCurItemIdx)
	local tbPlatinaMagicAttrib	= {};
	if (GetItemQuality(nCurItemIdx) == 4) then
		tbPlatinaMagicAttrib = pack(PreviewPlatinaUpgrade(nCurItemIdx));
	else
		tbPlatinaMagicAttrib = pack(PreviewPlatinaFromGold(nCurItemIdx));
	end
	
	local tbGoldMagicAttrib = getItemAllMagicList(nCurItemIdx);
	local szItemDesc = "";
	
	for i = 1, getn(tbPlatinaMagicAttrib) do
		if (tbGoldMagicAttrib[i][1] == tbPlatinaMagicAttrib[i][1] and tbGoldMagicAttrib[i][2] ~= tbPlatinaMagicAttrib[i][2]) then
			local szD = (tbPlatinaMagicAttrib[i][2]-tbGoldMagicAttrib[i][2]);
			if (szD > 0) then
				szD = "(+"..szD..")";
			else
				szD = "("..szD..")";
			end;
			szItemDesc = szItemDesc.."<color=yellow>"..GetItemMagicDesc(unpack(tbPlatinaMagicAttrib[i])).."<color><color=red>"..szD.."<color><enter>";
		else
			szItemDesc = szItemDesc.."<color=green>"..GetItemMagicDesc(unpack(tbPlatinaMagicAttrib[i])).."<color><enter>";
		end;
	end
	return szItemDesc;
end

-- ´òÔì°×½ğµÄ¹ı³Ì
function do_upgrade_platina(nEqIdx, nUpgradeEqName, tbMaterialIdx, tb_enhanceitem_count, nUpGradeProb)
	-- ¿ÛÇ®
	if (GetCash() < 10000000) then
		CreateTaskSay({"<dec><npc>Ng­¬i kh«ng mang theo chi phİ chÕ t¹o <color=yellow>1000 v¹n<color> l­îng.", "Ta biÕt råi, ®Ó ta chuÈn bŞ ®·/cancel"});
		return
	end
	Pay(10000000);
	
	-- É¾Ô­ÁÏ
	for i = 1, getn(tbMaterialIdx) do
		if (RemoveItemByIndex(tbMaterialIdx[i]) ~= 1) then
			WriteLog(format("[%s]\t Date:%s\t Account:%s\t Name:%s\t xãa vËt phÈm thÊt b¹i:%s",
						"[Task n©ng cÊp trang bŞ B¹ch Kim ERROR!!]",
						GetLocalDate("%y-%m-%d %H:%M:%S"),
						GetAccount(),
						GetName(),
						GetItemName(tbMaterialIdx[i])));
			return
		end
	end
	
	if (random() > nUpGradeProb) then
		CreateTaskSay({"<dec><npc>N©ng cÊp trang bŞ B¹ch Kim thÊt b¹i, bŞ mÊt ®i vËt liÖu chÕ t¹o vµ 1000 v¹n l­îng.", "Ta sÏ quay l¹i sau/cancel"});
		Msg2Player("N©ng cÊp trang bŞ B¹ch Kim thÊt b¹i, bŞ mÊt ®i vËt liÖu chÕ t¹o vµ 1000 v¹n l­îng.");
		
		WriteLog(format("[%s]\t Date:%s\t Account:%s\t Name:%s\t gi¸ trŞ l­îng kh«ng ®ñ, x¸c suÊt lµ:%.4f",
						"[Task n©ng cÊp trang bŞ B¹ch Kim FAIL!!]",
						GetLocalDate("%y-%m-%d %H:%M:%S"),
						GetAccount(),
						GetName(),
						nUpGradeProb))
		return
	end

	local szLog = "tiªu hao \t"..GetItemName(nEqIdx).."1 \t";
	for szkey, tb_temp in tb_enhanceitem_count do
		if (tb_temp[2]) then
			szLog = szLog..tb_temp[2]..":"..tb_temp[1].." \t"
		end;
	end;
	
	local szUpgradeItemFunc	= "";
	if (GetItemQuality(nEqIdx) == 1) then
		szUpgradeItemFunc = "UpgradePlatinaFromGoldItem";
	else
		szUpgradeItemFunc = "UpgradePlatinaItem";
	end
	
	local szBeforeItemInfo	= getItemInfo(nEqIdx);	--»ñµÃÉı¼¶Ç°µÄÏêÏ¸ĞÅÏ¢
	
	-- Éı¼¶ºó
	local nSuccess			= getglobal(szUpgradeItemFunc)(nEqIdx);
	local nItemLevel		= GetPlatinaLevel(nEqIdx);
	if nSuccess > 0 then		
		local szBehindItemInfo	= getItemInfo(nEqIdx);--»ñµÃÉı¼¶ºóµÄÏêÏ¸ĞÅÏ¢
		
		CreateTaskSay({"<dec><npc>N©ng cÊp trang bŞ B¹ch Kim thµnh c«ng, nhËn ®­îc 1 trang bŞ B¹ch Kim <color=yellow>"..nUpgradeEqName.."<color>, cÊp"..nItemLevel..".", "Ta sÏ quay l¹i sau/cancel"});
		Msg2Player("N©ng cÊp trang bŞ B¹ch Kim thµnh c«ng, ®¼ng cÊp lµ"..nItemLevel.."trang bŞ B¹ch Kim:"..nUpgradeEqName);
		
		WriteLog(format("[%s]\t Date:%s\t Account:%s\t Name:%s\t nhËn trang bŞ b¹ch kim:%s\t %s",
					"[Task n©ng cÊp trang bŞ B¹ch Kim SUCCESS!!]",
					GetLocalDate("%Y-%m-%d %H:%M:%S"),
					GetAccount(),
					GetName(),
					nUpgradeEqName,
					szLog));
		writeRecoinLog("[Nguyªn liÖu n©ng cÊp trang bŞ B¹ch Kim]", szBeforeItemInfo);
		writeRecoinLog("[KÕt qu¶ n©ng cÊp trang bŞ B¹ch Kim]", szBehindItemInfo);
	else
		WriteLog(format("[%s]\t Date:%s\t Account:%s\t Name:%s\t Thu ®­îc trang bŞ b¹ch kim thÊt b¹i:%s",
					"[Task n©ng cÊp trang bŞ B¹ch Kim ERROR!!]",
					GetLocalDate("%Y-%m-%d %H:%M:%S"),
					GetAccount(),
					GetName(),
					szLog));
		writeRecoinLog("[Nguyªn liÖu n©ng cÊp trang bŞ B¹ch Kim]", szBeforeItemInfo);
	end	
end
