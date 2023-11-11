Include("\\script\\missions\\miniencounter\\protocol.lua");
Include("\\script\\lib\\objbuffer_head.lua");
Include("\\script\\lib\\awardtemplet.lua");
Include("\\script\\activitysys\\playerfunlib.lua");
Include("\\script\\global\\autoexec_head.lua")
--Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\dailogsys\\dailogsay.lua")

local szThisFile = "\\script\\missions\\miniencounter\\dialog.lua"

function about_mini_encounter()
	local szTitle = "<npc>Mçi ngµy thêi gian më cña Phï Li Xung §ét ChiÕn lµ 9:00 - 23:00. B¸o danh ®­îc 10 ng­êi sÏ më b¶n ®å chiÕn tr­êng ngay, sè ng­êi b¸o danh nhiÒu nhÊt lµ 16 ng­êi. Doanh tr¹i Tèng Kim 2 bªn ®Òu cã cê Nguyªn So¸i, kİch s¸t ®­îc cê Nguyªn So¸i cña ®èi ph­¬ng cã thÓ nhËn ®­îc 1 ®iÓm cho phe m×nh, gi¶m 1 ®iÓm cña ®Şch. Gi÷a b¶n ®å cã cê Rång, phe kİch s¸t ®­îc cê Rång th× sÜ khİ ®¹i thŞnh, cã thÓ nhËn ®­îc 2 ®iÓm. Bªn nµo ®¹t ®­îc 20 ®iÓm tr­íc th× bªn ®ã th¾ng. Bªn th¾ng sÏ nhËn ®­îc phÇn th­ëng ®iÓm c«ng hu©n lín, bªn thua nhËn phÇn th­ëng nhá. §¹i hiÖp cã thÓ ®Õn tiÖm c«ng hu©n mua ®¹o cô cÇn thiÕt. C¨n cø theo biÓu hiÖn cña ®¹i hiÖp trong chiÕn tr­êng cã thÓ nhËn ®iÓm tİch lòy nhÊt ®Şnh, ®iÓm tİch lòy nµy xÕp h¹ng mçi tuÇn, ®¹i hiÖp cã thÓ nhËn phÇn th­ëng xÕp h¹ng phong phó. NhÊn ALT+· cã thÓ xem ®iÓm tİch lòy";
	CreateNewSayEx(szTitle, {{"Trë l¹i", no}});
end


function mini_encounter()
	local tbOption = 
	{
		{"B¸o danh Phï Li Xung §ét ChiÕn", apply_signup},
		{"Quay l¹i chiÕn tr­êng", return_map},
		{"Hñy b¸o danh", cancel_signup},
		{"KiÓm tra sè ng­êi b¸o danh", prepare_query},
		{"§Ó ta suy nghÜ", no},
	}

	local szTitle = "<npc>Ng­¬i ®Õn b¸o danh tham gia Phï Li Xung §ét ChiÕn ®óng kh«ng, b¸o danh nhanh lªn, ®õng cã ®øng ng¬ ra n÷a";
	CreateNewSayEx(szTitle, tbOption)
end

function open_shop()
	Msg2Player(format("HiÖn t¹i ®¹i hiÖp cã %d ®iÓm c«ng hu©n.", GetTask(3450)));
	Sale(184, 23, 100, "open_shop_callback(%d,%d,%d)", "\\script\\missions\\miniencounter\\dialog.lua")
end

function open_shop_callback(nItemIdx, nPrice, nStackCount)
	SetItemBindState(nItemIdx, -2);
	return 1;
end

function sj_score()
	local tbOption = 
	{
		{"KiÓm tra ®iÓm tİch lòy xÕp h¹ng cña tuÇn tr­íc", sj_score_query},
		{"NhËn phÇn th­ëng ®iÓm tİch lòy xÕp h¹ng cña tuÇn tr­íc", sj_score_award},
		{"§Ó ta suy nghÜ", no},
	};

	local szTitle = "<npc>T¹i ®©y cã thÓ kiÓm tra vµ nhËn phÇn th­ëng ®iÓm tİch lòy cña Phï Li Xung §ét ChiÕn";
	CreateNewSayEx(szTitle, tbOption)
end

function sj_score_query()
	local szRoleName = GetName();

	local hObject = OB_Create();
	ObjBuffer:PushObject(hObject, szRoleName);
	RemoteExecute(
		"\\script\\missions\\miniencounter\\weekly_rank.lua",
		"tbMiniEncounterRank:QueryPersonalData",
		hObject,
		"sj_score_query_callback"
	);
	OB_Release(hObject);
end

function sj_score_query_callback(nParam, ParamHandle)
	local nResult = ObjBuffer:PopObject(ParamHandle);

	if nResult <= 0 or nResult > 100 then
		Talk(1, "", "ThËt ®¸ng tiÕc, ®iÓm tİch lòy tuÇn tr­íc cña ng­¬i kh«ng n»m trong nhãm 100 thø h¹ng ®Çu, tuÇn nµy tiÕp tôc cè g¾ng ®i! ");
	else
		Talk(1, "", format("Xin chóc mõng b¹n, ®iÓm tİch lòy xÕp h¹ng tuÇn tr­íc lµ: h¹ng %d", nResult));
	end
end

function sj_score_award()
	local szRoleName = GetName();

	local hObject = OB_Create()
	ObjBuffer:PushObject(hObject, szRoleName);
	RemoteExecute(
		"\\script\\missions\\miniencounter\\weekly_rank.lua",
		"tbMiniEncounterRank:QueryPersonalData",
		hObject,
		"sj_score_award_callback"
	);
	OB_Release(hObject);
end

function sj_score_award_callback(nParam, ParamHandle)
	local nResult = ObjBuffer:PopObject(ParamHandle);
	
	-- ¼ì²éÈÎÎñ±äÁ¿¸ø½±Àø
	local nTaskValue = GetTask(3475)
	local nWeek = GetByte(nTaskValue, 1)
	local nFlag = GetByte(nTaskValue, 2)
	local nCurWeek = tonumber(GetLocalDate("%W"))
	if nWeek ~= nCurWeek then
		nTaskValue = SetByte(nTaskValue, 1, nCurWeek)
		nFlag = 0
		nTaskValue = SetByte(nTaskValue, 2, nFlag)
		SetTask(3475, nTaskValue)
	end
	
	if nFlag > 0 then
		Talk(1, "", "§· nhËn phÇn th­ëng råi, kh«ng thÓ nhËn l¹i");
		return nil;
	end

	--nResult = 2;												-- ²âÊÔÒ»ÏÂÁì½±»úÖÆ
	if nResult <= 0 or nResult > 100 then
		Talk(1, "", "ThËt ®¸ng tiÕc, ®iÓm tİch lòy tuÇn tr­íc cña ng­¬i kh«ng n»m trong nhãm 100 thø h¹ng ®Çu, tuÇn nµy tiÕp tôc cè g¾ng ®i! ");
		return nil;
	else
		Msg2Player(format("Xin chóc mõng b¹n, ®iÓm tİch lòy xÕp h¹ng tuÇn tr­íc lµ: h¹ng %d", nResult));
	end
	
	
	nTaskValue = SetByte(nTaskValue, 2, 1)
	SetTask(3475, nTaskValue)
end

function sj_history_exploit()
	local hObject = OB_Create();
	RemoteExecute(
		"\\script\\missions\\miniencounter\\history_exploit.lua",
		"tbMiniEncounterHistory:QueryHistoryExploit",
		hObject,
		"sj_history_exploit_callback"
	);
	OB_Release(hObject);
end

function sj_history_exploit_callback(nParam, ParamHandle)
	local nResult = ObjBuffer:PopObject(ParamHandle);
	if nResult == nil or nResult <= 0 then nResult = 0; end
	local strMsg = format("HiÖn t¹i tæng c«ng hu©n lµ: %d", nResult);
	Talk(1, "", strMsg);
end

function onFirstTime()
	if GetTask(3999) ~= 1 then
		Msg2Player("§¹i hiÖp vÉn ch­a tham gia Phï Li Xung §ét ChiÕn, kh«ng thÓ nhËn th­ëng.");
		return 0;
	end

	SetTask(3999, 2);
	PlayerFunLib:AddExp(20000000, 1, "[·ûÀë³åÍ»Õ½]µÚÒ»´Î²ÎÓë»ñµÃ2000W¾­Ñé½±Àø");
	return 1;
end

function main()
--temporarily close - modified by DinhHQ 20130608
do return end
	local tbOption = {
		{"Giíi thiÖu Phï Li Xung §ét ChiÕn", about_mini_encounter},
		{"Phï Li Xung §ét ChiÕn", mini_encounter},
		{"Cöa hµng c«ng hu©n", open_shop},
		{"§iÓm tİch lòy Phï Li Xung §ét ChiÕn®iÓm tİch lòy", sj_score},
		{"§Ó ta suy nghÜ", no},
	}
	local szTitle = "<npc>Ng­¬i ®Õn b¸o danh tham gia Phï Li Xung §ét ChiÕn ®óng kh«ng, b¸o danh nhanh lªn, ®õng cã ®øng ng¬ ra n÷a"
	CreateNewSayEx(szTitle, tbOption)
end

function OnServerStart()
	do return end
	local nSubWorld = SubWorldID2Idx(325)
	local nNpcIndex
	if nSubWorld >= 0 then
		nNpcIndex = AddNpcEx(2068, 1, 0, nSubWorld, 49568, 101376, 1, "Ng­êi tiÕp dÉn chiÕn tr­êng", 0)
		if nNpcIndex > 0 then
			SetNpcScript(nNpcIndex, %szThisFile)
		end
		
		nNpcIndex = AddNpcEx(2068, 1, 0, nSubWorld, 50112, 99040, 1, "Ng­êi tiÕp dÉn chiÕn tr­êng", 0)
		if nNpcIndex > 0 then
			SetNpcScript(nNpcIndex, %szThisFile)
		end
	end
end
--temporarily close - modified by DinhHQ 20130608
--AutoFunctions:Add(OnServerStart)