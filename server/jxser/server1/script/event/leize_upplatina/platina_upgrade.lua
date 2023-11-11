Include("\\script\\event\\leize_upplatina\\platina_head.lua");
Include("\\script\\lib\\basic.lua");
local nOpenLevel = 7
function platina_main()
	local aryDescribe = {
	"<dec><npc>Tr­íc kia, ta tõng gióp quan phñ dïng c¸c <color=yellow>m¶nh Bæ Thiªn Th¹ch<color> ®Ó chÕ t¹o ra thÇn binh lîi khİ. NÕu nh­ <sex>cã thÓ t×m ra<color=yellow>m¶nh Bæ Thiªn Th¹ch<color> nµy, ta cã thÓ gióp ng­¬i chÕ t¹o trang bŞ B¹ch Kim, nhÊt ®Şnh kh«ng thÓ thiÕu vËt liÖu nµy.",
	"Ta muèn th¨ng cÊp cho trang bŞ B¹ch Kim nµy/upgrade_paltinaequip",
	"Ta muèn chÕ t¹o trang bŞ Hoµng Kim thµnh trang bŞ B¹ch Kim/upgrade_goldformplatina",
	"C¸ch thu thËp m¶nh Bæ Thiªn Th¹ch/about_aerolite",
	"Trang bŞ B¹ch Kim lµ g×/about_platina",
	"§Ó ta suy nghÜ kü l¹i xem/no",
	};
	CreateTaskSay(aryDescribe);
end;

----½«»Æ½ğ×°±¸´òÔì³É°×½ğ×°±¸
function upgrade_goldformplatina()
	CreateTaskSay({
		"<dec><npc>Th«ng th­êng trang bŞ hoµng kim n©ng cÊp thµnh b¹ch kim cÇn nh÷ng nguyªn liÖu: L«i Tr¹ch Chïy vµ 1000 v¹n ng©n l­îng. NÕu nh­ muèn gia t¨ng tÊt c¶ vâ c«ng víi ®¼ng cÊp trang bŞ hoµng kim, do v× ®©y lµ nguyªn liÖu ®Æc biÖt, muèn luyÖn thµnh cÇn ph¶i cã  mét lß ®Æc biÖt. Nghe ®ån thiªn h¹ chØ cã Hçn §én §Ønh míi cã thÓ chŞu nhiÖt ®é cao ®­îc.<enter>NÕu nh­ muèn biÕt trang bŞ n©ng cÊp  thµnh b¹ch kim cã thuéc tİnh nh­ thÕ nµo cø viÖc ®­a trang bŞ hoµng kim cho ta th× sÏ biÕt ngay!",
		"Ta muèn xem thuéc tİnh cña trang bŞ B¹ch Kim sau khi n©ng cÊp tõ trang bŞ Hoµng Kim nµy./want_upgoldeq_preview",
		"Cã thÓ gióp ta chÕ t¹o trang bŞ nµy thµnh trang bŞ B¹ch Kim ®­îc kh«ng?/want_upgoldeq",
		"ta nghÜ l¹i xem /no"
	});
end;

function want_upgoldeq_preview()
	GiveItemUI("Xem qua chÕ t¹o trang bŞ B¹ch Kim", "§Æt trang bŞ Hoµng Kim muèn chÕ t¹o vµo hép ®ùng vËt phÈm.", "do_upgoldeq_preview", "no",1);
end;

function want_upgoldeq()
	GiveItemUI("ChÕ t¹o trang bŞ B¹ch Kim", "Muèn n©ng cÊp trang bŞ hoµng kim nµo th× chØ cÇn bá tÊt c¶ nh÷ng nguyªn liÖu vµo bªn d­íi ®ång  thêi cÇn 1000 v¹n.", "do_upgoldeq_process", "no",1);
end;

function do_upgoldeq_process(nItemCount)
	do_upgradeequip_process(nItemCount, 1, 0);
end;

function do_upgoldeq_preview(nItemCount)
	if (nItemCount == 0) then
		CreateTaskSay({"<dec><npc>Ng­¬i kh«ng mang trang bŞ Hoµng Kim ®Õn ®©y, ta lµm sao gióp ng­¬i xem trang bŞ B¹ch Kim hoµn thµnh sÏ nh­ thÕ nµo? H·y yªn t©m, ta sÏ kh«ng lµm tæn h¹i g× ®Õn trang bŞ cña ng­¬i ®©u.", "§Ó ta ®Æt l¹i vËy./want_upgoldeq_preview", "Lóc kh¸c quay l¹i./no"});
		return 0;
	elseif (nItemCount > 1) then
		CreateTaskSay({"<dec><npc>ChØ cÇn ®Æt vµo trang bŞ Hoµng Kim muèn chÕ t¹o lµ ®­îc råi, nh÷ng thø kh¸c ta kh«ng cÇn.", "Ha ha, ®¹i hiÖp còng cã lóc bÊt cÈn, ®Ó ta ®Æt vµo l¹i./want_upgoldeq_preview", "§Ó ta s¾p l¹i hµnh trang ®·/no"});
		return 0;
	end;
	local nComposeEntryIdx = 0;
	local nCurItemIdx = GetGiveItemUnit(nItemCount);
	local nCurItemName = GetItemName(nCurItemIdx);
	local nCurItemQuality = GetItemQuality(nCurItemIdx);
	local tbCurItemProp = pack(GetItemProp(nCurItemIdx));
	if (nCurItemQuality == 1) then
		if (tbCurItemProp[1] ~= 0) then
			CreateTaskSay({"<dec><npc>ChØ cÇn ®Æt vµo trang bŞ Hoµng Kim muèn chÕ t¹o lµ ®­îc råi, nh÷ng thø kh¸c ta kh«ng cÇn.", "Ha ha, ®¹i hiÖp còng cã lóc bÊt cÈn, ®Ó ta ®Æt vµo l¹i./want_upgoldeq_preview", "§Ó ta s¾p l¹i hµnh trang ®·/no"});
			return 0;
		end;
		for szkey, tbPlatinaData in TB_PLATINAEQ_GOLDEQ do
			if (tbPlatinaData[2] == GetGlodEqIndex(nCurItemIdx)) then
				nComposeEntryIdx = szkey;
				break
			end;
		end;
	end;
	if (nCurItemQuality == 4) then
		CreateTaskSay(	{	"<dec><npc>Trang bŞ <color=yellow>"..GetItemName(nCurItemIdx).."<color> ®· ®­îc chÕ t¹o thµnh trang bŞ B¹ch Kim råi.",
							"ChÕ t¹o trang bŞ Hoµng Kim kh¸c./want_upgoldeq_preview",
							"ThËt ng¹i qu¸, ta sÏ quay l¹i sau./no"	}	);
		return
	elseif (nComposeEntryIdx == 0) then
		CreateTaskSay(	{	"<dec><npc>ThËt ®¸ng tiÕc, kh¶ n¨ng cña ta cã h¹n, kh«ng thÓ gióp ®­îc cho ng­¬i<color=yellow>"..GetItemName(nCurItemIdx).."<color>Trang bŞ Hoµng Kim nµy ®· ®­îc chÕ t¹o thµnh trang bŞ B¹ch Kim råi.",
							"ChÕ t¹o trang bŞ Hoµng Kim kh¸c./want_upgoldeq_preview",
							"ThËt ng¹i qu¸, ta sÏ quay l¹i sau./no"	}	);
		return
	end
	
	local tbPlatinaMagicAttrib = pack(PreviewPlatinaFromGold(nCurItemIdx));
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
	end;
	CreateTaskSay({"<dec><npc>Trang bŞ B¹ch Kim hoµn thµnh lµ <color=yellow>"..TB_PLATINAEQ_GOLDEQ[nComposeEntryIdx][4]..", thuéc tİnh nh­ sau: <enter>"..szItemDesc,
	"Gióp ta xem trang bŞ B¹ch Kim hoµn thµnh tõ nh÷ng trang bŞ kh¸c sÏ nh­ thÕ nµo./want_upgoldeq_preview",
	"Cã thÓ gióp ta chÕ t¹o trang bŞ nµy thµnh trang bŞ B¹ch Kim ®­îc kh«ng/want_upgoldeq",
	"Ta biÕt råi, xin ®a t¹./no"});
end;
----°×½ğ×°±¸Éı¼¶
function upgrade_paltinaequip()
	CreateTaskSay({
		"<dec><npc>Th¨ng cÊp thµnh trang bŞ B¹ch Kim yªu cÇu nh÷ng vËt liÖu sau: 1 m¶nh <color=yellow>Bæ Thiªn Th¹ch (trung)<color> vµ 1000 v¹n l­îng. Cã thÓ dïng ®iÓm vinh dù ®Ó ®æi m¶nh Bæ Thiªn Th¹ch, ng­¬i ®· chuÈn bŞ s½n sµng råi, chóng ta cã thÓ b¾t ®Çu.<enter><color=red>Th¨ng cÊp trang bŞ B¹ch Kim sÏ cã rñi ro nhÊt ®Şnh, nÕu nh­ thÊt b¹i th× nh÷ng vËt liÖu vµ 1000 v¹n sÏ bŞ mÊt.<color><enter>NÕu ng­¬i muèn biÕt thuéc tİnh trang bŞ B¹ch Kim hoµn thµnh nh­ thÕ nµo cã thÓ mang trang bŞ Hoµng Kim ®Õn ®©y cho ta xem thö.",
		"Ta muèn xem thuéc tİnh trang bŞ B¹ch Kim hoµn thµnh./#want_upplatinaeq(1)",
		"Cã thÓ gióp ta th¨ng cÊp trang bŞ nµy kh«ng/#want_upplatinaeq(0)",
		"ta nghÜ l¹i xem /no"
	});
end;

function want_upplatinaeq(bPreview)
	if (bPreview == 1) then
		GiveItemUI("Xem qu¸ tr×nh th¨ng cÊp trang bŞ B¹ch Kim", "H·y ®Æt trang bŞ B¹ch Kim muèn th¨ng cÊp vµ m¶nh Bæ Thiªn Th¹ch vµo hép vËt phÈm.", "do_upplatinaeq_preview", "no",1);
	else
		GiveItemUI("Th¨ng cÊp trang bŞ B¹ch Kim", "H·y ®Æt trang bŞ B¹ch Kim muèn th¨ng cÊp vµ m¶nh Bæ Thiªn Th¹ch vµo hép vËt phÈm, th¨ng cÊp tiªu tèn 1000 v¹n l­îng.", "do_upplatinaeq_process", "no",1);
	end;
end;

function do_upplatinaeq_preview(nItemCount)
	do_upgradeequip_process(nItemCount, 3, 1);
end;

function do_upplatinaeq_process(nItemCount)
	do_upgradeequip_process(nItemCount, 3, 0);
end;

function do_upgradeequip_process(nItemCount, nStep, bPreview)
	local nComposeEntryIdx = 0;
	local nEquipIndex = 0;
	local nEquipItemIdx = 0;
	local nSrcItemValueSum = 0;
	local nUpGradeProb = 0;
	
	local nItemBindState;	--Ô­ÁÏ»Æ½ğµÄ°ó¶¨×´Ì¬
	--local nItemLockState = 0;   --Ô­ÁÏµÄËø»ê×´Ì¬
	local tb_enhanceitem_count = {};
	local tb_tempUpgrade = tbUpGradeProcess[nStep];
	local szContinueFunc = tb_tempUpgrade.szContinueFunc;
	
--	if (bPreview ~= 1) then
--		szContinueFunc = "#"..szContinueFunc.."(0)";
--	else
--		szContinueFunc = "#"..szContinueFunc.."(1)";
--	end
	
	-- Ğ£ÑéÎïÆ·ÊÇ·ñÆ¥Åä
	for i = 1, nItemCount do
		local nCurItemIdx = GetGiveItemUnit(i);
		local nCurItemName = GetItemName(nCurItemIdx);
		local nCurItemQuality = GetItemQuality(nCurItemIdx);
		local nExpiredTime = ITEM_GetExpiredTime(nCurItemIdx);
		local tbCurItemProp = pack(GetItemProp(nCurItemIdx));
		local nCurItemValue = 0;
		if (nCurItemQuality == tb_tempUpgrade.nItemQuality) then
			--Èç¹û²»ÊÇ×°±¸(¿ÉÄÜÊÇËğ»µ×°±¸)
			if (tbCurItemProp[1] ~= 0) then
				CreateTaskSay(	{	szErrorMsg,
					"Ha ha, ®¹i hiÖp còng cã lóc bÊt cÈn, ®Ó ta ®Æt vµo l¹i./".."#"..szContinueFunc.."("..bPreview..")",
					"ThËt ng¹i qu¸, ta sÏ quay l¹i sau./no"	}	);
				return
			end
			if (nExpiredTime > 0) then -- ÓĞ±£ÖÊÆÚµÄ×°±¸£¬²»ÄÜ£¡
				CreateTaskSay(	{	"<dec><npc>Trang bŞ cã <color=fire>thêi h¹n sö dông<color> th× kh«ng thÓ rÌn ®­îc.",
									"ThËt lµ thø lçi, ta l¹i bá nhÇm n÷a råi. Mét lóc sau quay l¹i nhĞ/cancel"	}	);
				return
			end
			if (nComposeEntryIdx ~= 0) then
				CreateTaskSay(	{	"<dec><npc>Rèt cuéc ng­¬i muèn chÕ t¹o trang bŞ Hoµng Kim nµo? Ta kh«ng hoa m¾t chø?",
									"Ha ha, ®¹i hiÖp còng cã lóc bÊt cÈn, ®Ó ta ®Æt vµo l¹i./".."#"..szContinueFunc.."("..bPreview..")",
									"ThËt ng¹i qu¸, ta sÏ quay l¹i sau./no"	}	);
				return
			end
			
			local szcurEqGold = getglobal(tb_tempUpgrade.szGetEquipIDFunc)(nCurItemIdx);
			
			for szkey, tb_item in TB_PLATINAEQ_GOLDEQ do
			
				if (szkey == szcurEqGold) then
					nComposeEntryIdx = szkey;
					nEquipIndex = nCurItemIdx;
					if (nStep == 1 and tb_item[5] and tb_item[5] == 1) then
						tb_tempUpgrade = tbUpGradeProcess[4];
					end
					break;
				end
			end
			
			if (nComposeEntryIdx == 0) then
				CreateTaskSay(	{	"<dec><npc>ThËt ng¹i qu¸, kh¶ n¨ng ta hiÖn giê kh«ng gióp ®­îc g× cho ng­¬i<color=yellow>"..GetItemName(nCurItemIdx).."<color>.",
									"Thö mãn trang bŞ kh¸c/".."#"..szContinueFunc.."("..bPreview..")",
									"ThËt ng¹i qu¸, ta sÏ quay l¹i sau./no"	}	);
				return
			end
			
			if (tb_tempUpgrade.nItemQuality == 4 and GetPlatinaLevel(nCurItemIdx) >= %nOpenLevel) then
				CreateTaskSay(	{"<dec><npc>Víi søc hiÖn t¹i cña ta chØ cã thÓ gióp ng­¬i c­êng hãa trang bŞ nµy ®Õn cÊp nµy th«i, nh­ng mµ sau nµy ta cã thÓ gióp ng­¬i tu luyÖn tiÕp. Cø tin ta ®i råi sÏ cã mét ngµy ta sÏ gióp ng­¬i c­êng hãa mãn ®å nµy lªn, ®Õn lóc ®ã ng­¬i h·y quay l¹i gÆp ta nhĞ!",
									"Thö mãn trang bŞ kh¸c/".."#"..szContinueFunc.."("..bPreview..")",
									"ThËt ng¹i qu¸, ta sÏ quay l¹i sau./cancel"	}	);
				return
			end;
			if (tb_tempUpgrade.nItemQuality == 4 and GetPlatinaLevel(nCurItemIdx) >= 10) then
				CreateTaskSay(	{	"<dec><npc>Trang bŞ nµy ®· ®¹t ®¼ng cÊp cao nhÊt, kh«ng cÇn ph¶i th¨ng cÊp n÷a.",
									"Thö mãn trang bŞ kh¸c/".."#"..szContinueFunc.."("..bPreview..")",
									"ThËt ng¹i qu¸, ta sÏ quay l¹i sau./no"	}	);
				return
			end;
			
			nEquipItemIdx = nCurItemIdx;
			nCurItemValue = 0;
			nItemBindState = GetItemBindState(nCurItemIdx)	--»ñÈ¡°ó¶¨×´Ì¬
		end
	end
	
	for szkey, tb_item in tb_tempUpgrade.tbUpItemList do
		tb_enhanceitem_count[szkey] = {};
		tb_enhanceitem_count[szkey][1] = 0;
	end;
	
	for i = 1, nItemCount do
		local nCurItemIdx = GetGiveItemUnit(i);
		local nCurItemName = GetItemName(nCurItemIdx);
		local nCurItemQuality = GetItemQuality(nCurItemIdx);
		local tbCurItemProp = pack(GetItemProp(nCurItemIdx));
		local nCurItemValue = 0;
		if (nCurItemQuality ~= tb_tempUpgrade.nItemQuality) then
			local szItemKey = tbCurItemProp[1]..","..tbCurItemProp[2]..","..tbCurItemProp[3];
			if (tb_tempUpgrade.tbUpItemList[szItemKey] == nil) then
				CreateTaskSay(	{	tb_tempUpgrade.szErrorMsg,
									"Ha ha, ®¹i hiÖp còng cã lóc bÊt cÈn, ®Ó ta ®Æt vµo l¹i./".."#"..szContinueFunc.."("..bPreview..")",
									"ThËt ng¹i qu¸, ta sÏ quay l¹i sau./no"	}	);
				return
			end
			if (tb_tempUpgrade.tbUpItemList[szItemKey][3] ~= -1) then
				if (tbCurItemProp[4] ~= tb_tempUpgrade.tbUpItemList[szItemKey][3]) then
					CreateTaskSay(	{	"<dec><npc>§¼ng cÊp cña trang bŞ"..GetItemName(nCurItemIdx).." nµy d­êng nh­ kh«ng ®óng.",
									"Ha ha, ®¹i hiÖp còng cã lóc bÊt cÈn, ®Ó ta ®Æt vµo l¹i./".."#"..szContinueFunc.."("..bPreview..")",
									"ThËt ng¹i qu¸, ta sÏ quay l¹i sau./no"	}	);
					return
				end;
			end;
			nCurItemValue = tb_tempUpgrade.tbUpItemList[szItemKey][1];
			tb_enhanceitem_count[szItemKey][1] = tb_enhanceitem_count[szItemKey][1] + GetItemStackCount(nCurItemIdx);
			tb_enhanceitem_count[szItemKey][2] = nCurItemName;
			if (tb_tempUpgrade.tbUpItemList[szItemKey][4] == nil) then
				nSrcItemValueSum = nSrcItemValueSum + nCurItemValue;
			end
		end
	end
	if (nComposeEntryIdx == 0) then
		CreateTaskSay(	{	"<dec><npc>NÕu muèn ta gióp ng­¬i, h·y giao trang bŞ ®ã cho ta.",
							"Ha ha, ®¹i hiÖp còng cã lóc bÊt cÈn, ®Ó ta ®Æt vµo l¹i./".."#"..szContinueFunc.."("..bPreview..")",
							"ThËt ng¹i qu¸, ta sÏ quay l¹i sau./no"	}	);
		return
	end
	
	local tbBeidoujuan = 
	{
		[6] = "B¾c ®Èu luyÖn kim thuËt (QuyÓn 1)", [7] = "B¾c ®Èu luyÖn kim thuËt (QuyÓn 2)", [8] = "B¾c ®Èu luyÖn kim thuËt (QuyÓn 3)", [9] = "B¾c ®Èu luyÖn kim thuËt (QuyÓn 4)"
	};
	local PLevel = GetPlatinaLevel(nEquipItemIdx);
	if (nStep == 3 and bPreview == 0) then
		for szkey, tb_item in tb_tempUpgrade.tbUpItemList do
			if (tb_item[4]) then
				if (PLevel == tb_item[4] and tb_enhanceitem_count[szkey][1] ~= tb_item[1] or (PLevel ~= tb_item[4] and tb_enhanceitem_count[szkey][1] ~= 0)) then
					local szErrorMsg = "";
					if (PLevel < 6) then
						szErrorMsg = "<dec><npc> ChÕ t¹o trang bŞ nµy kh«ng cÇn b¾c ®Èu luyÖn kim thuËt";
					else
						szErrorMsg = "<dec><npc>ChÕ t¹o trang bŞ nµy chØ cÇn <color=yellow>1"..tbBeidoujuan[GetPlatinaLevel(nEquipItemIdx)].."<color>, ®Æt nhiÒu qu¸ sÏ thiÖt thßi cho ng­¬i, nh­ng İt qu¸ th× ta kh«ng chÕ t¹o ®­îc.";
					end
					CreateTaskSay({szErrorMsg,
									"§Ó ta thö l¹i./".."#"..szContinueFunc.."("..bPreview..")",
									"ThËt ng¹i qu¸, ta sÏ quay l¹i sau./no"	}	);
					return
				end
			end
		end
	end
	if (nStep == 1) then
		for szkey, tb_item in tb_tempUpgrade.tbUpItemList do
			if (tb_enhanceitem_count[szkey][1] ~= tb_tempUpgrade.tbUpItemList[szkey][1]) then
				CreateTaskSay(	{	"<dec><npc>Muèn chÕ t¹o trang bŞ nµy, tèi thiÓu ta còng cÇn <color=yellow>"..tb_tempUpgrade.tbUpItemList[szkey][1].."c¸i"..tb_tempUpgrade.tbUpItemList[szkey][2].."<color>, ®Æt nhiÒu qu¸ sÏ thiÖt thßi cho ng­¬i, nh­ng İt qu¸ th× ta kh«ng chÕ t¹o ®­îc.",
										"§Ó ta thö l¹i./".."#"..szContinueFunc.."("..bPreview..")",
										"ThËt ng¹i qu¸, ta sÏ quay l¹i sau./no"	}	);
				return
			end
		end
		nUpGradeProb = 1;
	else
	
		nUpGradeProb = nSrcItemValueSum / (TB_PLATINAEQ_GOLDEQ[nComposeEntryIdx][3] * TB_PLATINAEQ_UPGRADERATE[GetPlatinaLevel(nEquipItemIdx)]);
		
		if (nUpGradeProb >= 1) then
			nUpGradeProb = 1;
		elseif (nUpGradeProb >= 0.9999) then
			nUpGradeProb = 0.9999;
		end;
		if (bPreview == 1) then
			local szItemDesc = format("<dec><npc>Theo kinh nghiÖm cña ta, trang bŞ B¹ch Kim nµy cã x¸c suÊt <color=yellow>%5.2f%%<color> n©ng lªn 1 cÊp, thuéc tİnh nh­ sau:  <enter>", nUpGradeProb*100);
			
			local tbNextPlatinaMagicAttrib = pack(PreviewPlatinaUpgrade(nEquipIndex));
			
			local tbCurPlatinaMagicAttrib = getItemAllMagicList(nEquipIndex);
			
			for i = 1, getn(tbNextPlatinaMagicAttrib) do
				if (tbCurPlatinaMagicAttrib[i][1] == tbNextPlatinaMagicAttrib[i][1] and tbCurPlatinaMagicAttrib[i][2] ~= tbNextPlatinaMagicAttrib[i][2]) then
					local szD = (tbNextPlatinaMagicAttrib[i][2]-tbCurPlatinaMagicAttrib[i][2]);
					if (szD > 0) then
						szD = "(+"..szD..")";
					else
						szD = "("..szD..")";
					end;
					szItemDesc = szItemDesc.."<color=yellow>"..GetItemMagicDesc(unpack(tbNextPlatinaMagicAttrib[i])).."<color><color=red>"..szD.."<color><enter>";
				else
					szItemDesc = szItemDesc.."<color=green>"..GetItemMagicDesc(unpack(tbNextPlatinaMagicAttrib[i])).."<color><enter>";
				end;
			end;
			CreateTaskSay({szItemDesc,
								"Gióp ta xem trang bŞ B¹ch Kim hoµn thµnh tõ nh÷ng trang bŞ kh¸c sÏ nh­ thÕ nµo./".."#"..szContinueFunc.."("..bPreview..")",
								"Cã thÓ gióp ta chÕ t¹o trang bŞ nµy thµnh trang bŞ B¹ch Kim ®­îc kh«ng/".."#"..szContinueFunc.."(0)",
								"Ta biÕt råi, xin ®a t¹./no"});
			return
		end;
	end;
	
--	nItemLockState = GetLockItemState(nEquipItemIdx)  --»ñÈ¡Ëø»ê×´Ì¬
--	if (nItemLockState == 1) then	--Ëø»ê
--        	local bOwner = IsLockItemOwner(nEquipItemIdx)
--		if (bOwner == 0) then
--			CreateTaskSay({"<dec><npc>Éı¼¶µÄÎïÆ·´æÔÚËø»êÎïÆ·£¬Ëø»êÎïÆ·ÔÚËø»ê×´Ì¬ÏÂ£¬Ö»ÔÊĞíÎïÆ·¹éÊôÈËÉı¼¶¡£", "ÖªµÀÁË/cancel"});
--            		return
--            	end
--	elseif (nItemLockState == 2) then	--½â»ê
--			CreateTaskSay({"<dec><npc>Éı¼¶µÄÎïÆ·´æÔÚËø»êÎïÆ·£¬Ëø»êÎïÆ·ÔÚ½â»ê×´Ì¬ÏÂ£¬½ûÖ¹Éı¼¶¡£", "ÖªµÀÁË/cancel"});
--        		return	
--	end
	
	if (GetCash() < 10000000) then
		CreateTaskSay({"<dec><npc>Ng­¬i kh«ng mang theo chi phİ chÕ t¹o <color=yellow>1000 v¹n<color> l­îng.", "Ta biÕt råi, ®Ó ta chuÈn bŞ ®·/no"});
		return
	end;
	Pay(10000000);
	
	-- É¾Ô­ÁÏ
	for i = 1, nItemCount do
		if (GetGiveItemUnit(i) ~= nEquipItemIdx and RemoveItemByIndex(GetGiveItemUnit(i)) ~= 1) then
			WriteLog("[Task n©ng cÊp trang bŞ B¹ch Kim ERROR!!]"..GetLocalDate("%Y-%m-%d %H:%M:%S").."\t"..GetAccount().."\t"..GetName().."\t Xãa vËt phÈm thÊt b¹i\t"..GetItemName(GetGiveItemUnit(i)));
			return
		end
	end
	if (random() > nUpGradeProb) then
		CreateTaskSay({"<dec><npc>N©ng cÊp trang bŞ B¹ch Kim thÊt b¹i, bŞ mÊt ®i vËt liÖu chÕ t¹o vµ 1000 v¹n l­îng.", "Ta sÏ quay l¹i sau/no"});
		Msg2Player("N©ng cÊp trang bŞ B¹ch Kim thÊt b¹i, bŞ mÊt ®i vËt liÖu chÕ t¹o vµ 1000 v¹n l­îng.");
		WriteLog("[Task n©ng cÊp trang bŞ B¹ch Kim FAIL!!]"..GetLocalDate("%Y-%m-%d %H:%M:%S").."\t"..GetAccount().."\t"..GetName().."\t Gi¸ trŞ l­îng kh«ng ®ñ, x¸c suÊt lµ"..nUpGradeProb);
		return
	end;
	
	local szLog = "tiªu hao \t"..GetItemName(nEquipItemIdx).."1 \t";
	local szBeforeItemInfo = getItemInfo(nEquipItemIdx);	--»ñµÃÉı¼¶Ç°µÄÏêÏ¸ĞÅÏ¢
	
	local nSuccess = getglobal(tb_tempUpgrade.szDoProcessFunc)(nEquipItemIdx);
	for szkey, tb_temp in tb_enhanceitem_count do
		if (tb_temp[2]) then
			szLog = szLog..tb_temp[2]..":"..tb_temp[1].." \t"
		end;
	end;
	
	local nItemLevel = GetPlatinaLevel(nEquipItemIdx);
	if nSuccess > 0 then
		if (nItemBindState ~= 0) then
			--BindItem(nEquipItemIdx);
			SetItemBindState(nEquipItemIdx, nItemBindState)
		end;
		local szBehindItemInfo = getItemInfo(nEquipItemIdx);--»ñµÃÉı¼¶ºóµÄÏêÏ¸ĞÅÏ¢
		CreateTaskSay({"<dec><npc>N©ng cÊp trang bŞ B¹ch Kim thµnh c«ng, nhËn ®­îc 1 trang bŞ B¹ch Kim <color=yellow>"..TB_PLATINAEQ_GOLDEQ[nComposeEntryIdx][4].."<color>, cÊp"..nItemLevel..".", "Ta sÏ quay l¹i sau/no"});
		Msg2Player("N©ng cÊp trang bŞ B¹ch Kim thµnh c«ng, ®¼ng cÊp lµ"..nItemLevel.."trang bŞ B¹ch Kim:"..TB_PLATINAEQ_GOLDEQ[nComposeEntryIdx][4]);
		WriteLog("[Task n©ng cÊp trang bŞ B¹ch Kim SUCCESS!!]"..GetLocalDate("%Y-%m-%d %H:%M:%S").."\t"..GetAccount().."\t"..GetName().."\t nhËn ®­îc trang bŞ B¹ch Kim"..TB_PLATINAEQ_GOLDEQ[nComposeEntryIdx][4].."\t"..szLog);
		writeRecoinLog("[Nguyªn liÖu n©ng cÊp trang bŞ B¹ch Kim]", szBeforeItemInfo);
		writeRecoinLog("[KÕt qu¶ n©ng cÊp trang bŞ B¹ch Kim]", szBehindItemInfo);
	else
		WriteLog("[Task n©ng cÊp trang bŞ B¹ch Kim ERROR!!]"..GetLocalDate("%Y-%m-%d %H:%M:%S").."\t"..GetAccount().."\t"..GetName().."\t NhËn ®­îc trang bŞ B¹ch Kim thÊt b¹i \t"..szLog);
		writeRecoinLog("[Nguyªn liÖu n©ng cÊp trang bŞ B¹ch Kim]", szBeforeItemInfo);
	end;
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
		"Ta biÕt råi!/no",
	});
end;

function about_platina()
	CreateTaskSay({"<dec><npc>Thuéc tİnh cña trang bŞ B¹ch Kim sÏ do thuéc tİnh cña trang bŞ Hoµng Kim chÕ t¹o quyÕt ®Şnh. Thuéc tİnh trang bŞ Hoµng Kim cµng tèt th× trang bŞ B¹ch Kim t¹o thµnh sÏ cµng tèt. NÕu kh«ng hµi lßng víi trang bŞ Hoµng Kim hiÖn t¹i, ta kiÕn nghŞ h·y t×m trang bŞ Hoµng Kim kh¸c.", "KÕt thóc ®èi tho¹i/no"});
end;
