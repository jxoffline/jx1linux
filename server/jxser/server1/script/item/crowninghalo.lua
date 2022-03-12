Include([[\script\lib\string.lua]]);
Include([[\script\lib\coordinate.lua]]);
IL("TIMER")
IL("TONG")
MAPFILE = [[\settings\item\004\mask.txt]];

--====Task Value====--
TIMER_ID	= 78				-- ID£¬ÌîĞ´ÔÚ\settings\timertask.txt
TIMER_LAST	= 3 * 60 * 60 * 18	-- ¿ÉÊ¹ÓÃ×ÜÊ±¼ä£¬10·ÖÖÓ
TIMER_FREQ	= 10 * 18			-- ÊÍ·ÅÆµÂÊ£¬5Ãë
USE_YES = 1						-- ÕıÔÚÊ¹ÓÃ
USE_NO = 0						-- Ã»ÓĞÊ¹ÓÃ

TTK_FACE = {1024, 1025, 1026, 1027, 1028, 1029, 1030, 1031, 1032, 1033};
WSSZ_TK_USING = 1758		--ÊÇ·ñÕıÔÚÊ¹ÓÃÎŞË«É±Õó
TK_MASK = 1759;				--ÎŞË«É±ÕóÃæ¾ßµÄIdx

function main(nItem)
	local nRestCount = GetItemParam(nItem, 1)
	
	if (nRestCount <= 0) then
		Say("V« song s¸t trËn ®· më ra, cã muèn ®ãng l¹i kh«ng?", 2, "§ãng/#closebook("..nItem..")", "T¹m dõng/no")
			--, "ÔÙ¸øÒ»±¾/addbook", "Ñ¡ÔñÎÒÏëÒªµÄÃæ¾ß/selectface")
	else
		Say("V« song s¸t trËn ®· ®ãng, cã muèn më ra kh«ng?", 2, "Më ra /#openbook("..nItem..")", "T¹m dõng/no")
		--, "ÔÙ¸øÒ»±¾/addbook", "Ñ¡ÔñÎÒÏëÒªµÄÃæ¾ß/selectface")
	end
	return 1;
end

function addbook()
	local nItem = AddItem(6,1,1106,1,0,0,0)	-- ÒªÌîÒ»¸öĞÂÎïÆ·ÔÚmagicscript.txt
	set_rest_count(nItem, TIMER_LAST/TIMER_FREQ)
end

function openbook(nItem)
	local nRestCount = GetItemParam(nItem, 1)
	ItemGenre, DetailType, ParticualrType = GetItemProp(nItem); --µÃµ½ÎïÆ·Àà±ğ
	if (PlayerIndex ~= GetItemBelong(nItem) or ItemGenre ~= 6 or DetailType ~= 1 or ParticualrType ~= 1106) then
		return
	end;
	
	if (GetTask(WSSZ_TK_USING) == USE_YES) then
		Say("§· më ra 1 V« song s¸t trËn", 0);
		Msg2Player("§· më ra 1 V« song s¸t trËn");
		return
	end;
	
	SetTaskTemp(193, nItem);
	local nMaskIdx = GetItemParam(nItem, 2);
	Say("V« song s¸t trËn vÉn ch­a chän khu«n mÉu, cã thÓ chØnh söa lo¹i h×nh ®· cã. Cã muèn lùa chän khu«n mÉu kh«ng?", 2, 
	"Chän khu«n mÉu ®Æc s¾c/sel_face", 
	"Ta c¶m thÊy lo¹i nµy còng tèt råi/select_no");
end

function sel_face()
	nItem = GetTaskTemp(193);
	_, nTongID = GetTongName();
	local tab_face = {};
	local nMaskIdx;
	local szMaskName = "";
	for i = 1, 10 do
		nMaskIdx = TONG_GetTaskValue(nTongID, TTK_FACE[i]);
		if (nMaskIdx > 0) then
			szMaskName = gettabfilestring(MAPFILE, (nMaskIdx + 2), 1);
			tinsert(tab_face, szMaskName.."khu«n mÉu kh¸ tèt/#sel_mask("..i..")");
		end;
	end;
	
	if (getn(tab_face) == 0) then
		Say("Quİ bang ch­a thªm vµo h×nh thï V« song s¸t trËn, bang chñ hoÆc tr­ëng l·o cã thÓ ®Õn Cét biÓu t­îng ®Ó thay ®æi. Tèi ®a cã 10 khu«n mÉu, cã ®ång ı sö dông V« song s¸t trËn kh«ng?", 2,
		"Ta c¶m thÊy khu«n mÉu nhİm còng tèt/select_no",
		"KÕt thóc ®èi tho¹i/no");
		return
	end;
	
	tinsert(tab_face, "KÕt thóc ®èi tho¹i/no");
	Say("H×nh thï V« song s¸t trËn quİ bang hiÖn cã gåm nh÷ng c¸i bªn d­íi, tèi ®a cã 10 c¸i, bang chñ hoÆc tr­ëng l·o cã thÓ ®Õn Cét biÓu t­îng cña bang ®Ó thay ®æi, ng­¬i chän khu«n mÉu nµo", getn(tab_face), tab_face);
end;

function select_no()
	SetTask(TK_MASK, 35);
	start_book(0);
end;

function sel_mask(nMaskIdx)
	local nItem = GetTaskTemp(193);
	if (nItem <= 0) then
		return
	end;
	local nMask = TONG_GetTaskValue(nTongID, TTK_FACE[nMaskIdx]);
	if (nMask == 0) then
		nMask = 35;
	end
	SetTask(TK_MASK, nMask);
	
	SetSpecItemParam(nItem, 2, nMaskIdx);
	SyncItem(nItem);
	start_book(nMaskIdx)
end;
	
function start_book(nMaskIdx)
	local nItem = GetTaskTemp(193);
	if (nItem <= 0) then
		return
	end;
	
	_, nTongID = GetTongName();
	local nRestCount = GetItemParam(nItem, 1)
	local nRestTime = getresttime(nRestCount) * 18;
	local nMask = 35;
	if (nMaskIdx > 0 and nMaskIdx <= 10) then
		nMask = TONG_GetTaskValue(nTongID, TTK_FACE[nMaskIdx]);
	end;

	if (nRestCount > 0) then
		-- TM_SetTimer(ÆµÂÊ£¬ID£¬´ÎÊı£¬ÀàĞÍ£º0-ÏÂÏßÏûÊ§,1-ÕæÊµÊ±¼ä,2-ÔÚÏßÊ±¼ä)
		TM_SetTimer(TIMER_FREQ, TIMER_ID, nRestCount, 2)
		nt_setTask(WSSZ_TK_USING, USE_YES);
		set_rest_count(nItem, 0)
		
		emitskill(nMask, nRestCount)
		Msg2Player("B¹n ®· më ra V« song s¸t trËn!")
	end
end

function getresttime(nTimes)
	if (nTimes <= 0) then
		return 0
	end;
	return nTimes * 5;
end;

function closebook(nItem)
	local nRestCount = GetItemParam(nItem, 1)
	ItemGenre, DetailType, ParticualrType = GetItemProp(nItem); --µÃµ½ÎïÆ·Àà±ğ
	if (PlayerIndex ~= GetItemBelong(nItem) or ItemGenre ~= 6 or DetailType ~= 1 or ParticualrType ~= 1106) then
		return
	end;
	if (nRestCount <= 0) then
		nRestCount = TM_GetRestCount(TIMER_ID)
		-- ÕâÀï»¹ÒªÅĞ¶ÏÒ»ÏÂÏÖÔÚtimerÀïÃæµÄ¼¼ÄÜºÍ¸ÃÎŞË«É±ÕóÊÇ²»ÊÇÅäÌ×£¨Èç¹ûÓĞ¶àÖÖÎŞË«É±ÕóµÄ»°£©
		-- if (²»ÅäÌ×) then nRestCount = 0 end
		TM_StopTimer(TIMER_ID)
		if (not nRestCount or nRestCount <= 0) then
			Msg2Player("V« song s¸t trËn nµy ®· tiªu hao hÕt!")
			RemoveItemByIndex(nItem)
		else
			ChangeOwnFeature( 1, 0, 12);
			SetPkReduceState(0, 80, 80, 50);
			Msg2Player("V« song s¸t trËn ®· ®ãng l¹i!")
			set_rest_count(nItem, nRestCount)
		end
		nt_setTask(WSSZ_TK_USING, USE_NO);
	else
		Say("B¹n ch­a më ra V« song s¸t trËn", 0);
		Msg2Player("B¹n ch­a më ra V« song s¸t trËn");
	end
end

function GetDesc(nItem)
	local nRestCount = GetItemParam(nItem, 1)
	if (nRestCount <= 0) then
		return "<color=blue>V« song s¸t trËn nµy ®· më<color>"
	else
		return format("<color=blue>V« song s¸t trËn nµy cßn cã thÓ sö dông trong %d giê %.2f phót<color>", floor(nRestCount / 360), mod(nRestCount, 360) / 6)
	end
end

function set_rest_count(nItem, nRestCount)
	SetSpecItemParam(nItem, 1, nRestCount)
	SyncItem(nItem)
end

function no()
	SetTaskTemp(193, 0);
end

function OnTimer()
	local nRestCount = TM_GetRestCount(TIMER_ID)

	if (nRestCount == 0) then --Èç¹û´ÎÊıÎª0£»
		nt_setTask(WSSZ_TK_USING, USE_NO);
		Msg2Player("V« song s¸t trËn nµy ®· tiªu hao hÕt.")
		return
	end
	
	_, nTongID = GetTongName();
	local nMask = GetTask(TK_MASK);
	
	emitskill(nMask, nRestCount);
	if (mod(nRestCount, 30) == 0 and nRestCount > 0) then
		Msg2Player("B¹n ®· më ra <color=yellow>V« song s¸t trËn<color>, cã thÓ t¸c dông <color=yellow>"..floor(nRestCount / 360).."<color> giê <color=yellow>"..floor(mod(nRestCount, 360) / 6).."<color> phót.");
	end;
end

function emitskill(nMask, nRestCount) --·¢¼¼ÄÜ
	local nCamp = GetCamp();
	local nTongID;
	_, dwTongID = GetTongName();
	local tab_P = GetMapPlayerList( nCamp, 1, dwTongID );--ÕâÀïËÑÑ°È«°ï
	local nOrgPlayerIdx = PlayerIndex;
	--±éÀú£¬È»ºóÔÙÉèÉÏ¼¼ÄÜ  
	local nRestTime = 15 * 18;
	local nMaskIdx = GetTabFileData(MAPFILE, nMask + 2, 15);
	
	for i = 1, getn(tab_P) do
		PlayerIndex = tab_P[i];
		if (PlayerIndex > 0) then
			SetPkReduceState(nRestTime, 80, 80, 50);
			--±äÑù×Ó
			ChangeOwnFeature( 1, nRestTime, nMaskIdx);
		end;
	end
	
	PlayerIndex = nOrgPlayerIdx;
end;

function nt_setTask(nTaskID, nTaskValue)
	SetTask(nTaskID, nTaskValue)
	SyncTaskValue(nTaskID) -- Í¬²½µ½¿Í»§¶Ë
end
