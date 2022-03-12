-- ÎÄ¼şÃû¡¡£ºevent.lua
-- ´´½¨Õß¡¡£ºzhongchaolong
-- ´´½¨Ê±¼ä£º2008-01-17 14:48:26
--¶Ó³¤×é¶Ó(8ÈË) ¸ú NPC±±¶·ÀÏÈË¶Ô»°ÒÔ¼°½ÓÊÜÈÎÎñ
Include("\\script\\event\\springfestival08\\lib\\compose.lua")
Include("\\script\\event\\springfestival08\\lib\\addaward.lua")
Include("\\script\\event\\springfestival08\\allbrother\\taskhead.lua")
Include("\\script\\lib\\pay.lua")
Include("\\script\\lib\\log.lua")
allbrother_0801_tbLingPai = 
	{
		{szName="Thiªn Xu LÖnh", tbProp={6, 1, 1643, 1, 0, 0}, },
		{szName="Thiªn Toµn LÖnh", tbProp={6, 1, 1644, 1, 0, 0}, },
		{szName="Thiªn C¬ LÖnh", tbProp={6, 1, 1645, 1, 0, 0}, },
		{szName="Thiªn QuyÒn LÖnh", tbProp={6, 1, 1646, 1, 0, 0}, },
		{szName="Ngäc Hoµnh LÖnh", tbProp={6, 1, 1647, 1, 0, 0}, },
		{szName="Khai D­¬ng LÖnh", tbProp={6, 1, 1648, 1, 0, 0}, },
		{szName="Dao Quang LÖnh", tbProp={6, 1, 1649, 1, 0, 0}, },
		{szName="ThÊt Tinh LÖnh", tbProp={6, 1, 1650, 1, 0, 0}, },
	}

function allbrother_0801_main()
	local nDate = tonumber(GetLocalDate("%y%m%d"))
	
	
	if allbrother_0801_IsAct() ~= 1 then
		Say(format("Xin lçi, <color=yellow>%s<color> ho¹t ®éng ®· kÕt thóc, ®a t¹ ®· tham gia ho¹t ®éng.",allbrother_0801_szActName), 0)
		return 0;
	end
	
	local szTitle = "Xin chµo, t¹i h¹ lµ truyÒn nh©n cña B¾c §Èu M«n, ch¼ng hay c¸c h¹ cÇn g×?";
	local tbOpt = 
	{
		"T¹i h¹ vµ c¸c huynh ®Ö muèn tiÕp nhËn nhiÖm vô./allbrother_0801_WantTask",
		"T¹i h¹ ®· hoµn thµnh nhiÖm vô cña tiÒn bèi./allbrother_0801_TaskPersonTaskAward",
		"T¹i h¹ cïng c¸c huynh ®Ö ®· hoµn thµnh nhiÖm vô cña tiÒn bèi./allbrother_0801_TeamTaskAward",
		"ThËt ¸y n¸y, phiÒn l·o nãi l¹i 1 lÇn n÷a nhiÖm vô./allbrother_0801_QueryPersonTask",
		"T¹i h¹ kh«ng thÓ hoµn thµnh nhiÖm vô c¸ nh©n lÇn nµy./allbrother_0801_CancelTask",
		"T¹i h¹ c¸o tõ./OnCancel"
	}
	Say(szTitle, getn(tbOpt), tbOpt)
end

--Ä³¸öÈËÖ´ĞĞÄ³¸öº¯Êı
function allbrother_0801_PlayerDo(nPlayerIdx,fun,...)
	local nOldPlayer = PlayerIndex;
	PlayerIndex = nPlayerIdx
	local re = call(fun, arg);
	PlayerIndex = nOldPlayer;
	return re
end

--²éÑ¯¸öÈËÈÎÎñ
function allbrother_0801_QueryPersonTask()
	local nTaskState	= GetTask(TSK_allbrother_0801_TaskState)
	if allbrother_0801_CheckTaskState() == 0 then
		Say("C¸c h¹ vÉn ch­a nhËn nhiÖm vô.", 0)
	else
		if nTaskState > 1073741824 then
			nTaskState = nTaskState - 1073741824
		end
		Say(format("NhiÖm vô hiÖn t¹i lµ: %s", allbrother_0801_tbTaskList[nTaskState].szShow), 0)
	end
	
end

--¶ÓÎéÏë½ÓÈÎÎñ
function allbrother_0801_WantTask()
	local nTeamSize = GetTeamSize()
	local i
	if IsCaptain() ~= 1 then
		Say("ViÖc nµy…… PhiÒn c¸c h¹ nhê ®éi tr­ëng cïng ta bµn chuyÖn.", 0)
		return 0;
	end
	if nTeamSize < allbrother_0801_TeamSizeLimit then
		Say(format("Sè thµnh viªn trong tæ ®éi kh«ng ®ñ, xin h·y chiªu mé thªm <color=yellow>%d<color> ng­êi n÷a råi quay l¹i ®©y ta giao cho nhiÖm vô.", allbrother_0801_TeamSizeLimit-nTeamSize), 0)
		return 0;
	end
	for i=1,nTeamSize do
		if not allbrother_0801_PlayerDo(GetTeamMember(i), allbrother_0801_islvl50) then
			Say("Tæ ®éi cña b¹n cã ng­êi ®¼ng cÊp ch­a ®¹t 50 hoÆc ch­a n¹p thÎ, kh«ng thÓ tiÕp nhËn nhiÖm vô.", 0)
			return 
		end
	end
	
	local nCount = allbrother_0801_CheckTeamTaskState();
	local tbTeamTask = {}
	if nCount == nTeamSize then
		for i=1,nTeamSize do
			local nTaskId = random(1,getn(allbrother_0801_tbTaskList))
			while tbTeamTask[nTaskId] == 1 do
				nTaskId = random(1,getn(allbrother_0801_tbTaskList))
			end
			tbTeamTask[nTaskId] = 1
			allbrother_0801_PlayerDo(GetTeamMember(i), allbrother_0801_AcceptTask, nTaskId)
		end
	else
		Say("Tæ ®éi cña b¹n cã ng­êi ch­a hoµn thµnh nhiÖm vô hoÆc ®· lµm hÕt nhiÖm vô råi .", 0)
	end
	tbLog:PlayerActionLog("TinhNangKey","NhanNhiemVuBacDau")
end


--¼ì²é ¶ÓÎéÄÚÃ¿¸öÈËµÄÈÎÎñ×´Ì¬£¬ ·µ»ØÃ»½ÓÈÎÎñµÄÈËÊı
function allbrother_0801_CheckTeamTaskState()
	local nTeamSize = GetTeamSize()
	local nCount = 0;
	for i=1,nTeamSize do
		nCount = nCount + allbrother_0801_PlayerDo(GetTeamMember(i), allbrother_0801_CheckTaskState)
	end
	return nTeamSize-nCount;
end

--¼ì²éÒ»¸öÈËµÄÈÎÎñ×´Ì¬ 0ÎªÃ»ÓĞÈÎÎñ£¬·ÇÁã´ú±í½ÓÊÜÁËÄÄÖÖÈÎÎñ£¬Èç¹ûÈÎÎñÒÑ¾­³¬Ê±£¬Ö´ĞĞÈ¡ÏûÈÎÎñ·µ»Ø0 Ã»ÓĞ½ÓÈÎÎñ
function allbrother_0801_CheckTaskState()
	local nTaskState	= GetTask(TSK_allbrother_0801_TaskState)
	local nTaskLimit	= GetTask(TSK_allbrother_0801_TaskLimit)
	local nTaskTime		= GetTask(TSK_allbrother_0801_TaskTime)
	local nDate			= tonumber(GetLocalDate("%y%m%d"))
	
	if nTaskState == 0 then --Ã»ÓĞ½ÓÈÎÎñ
		if nDate ~= floor(nTaskLimit/256) then --Èç¹û²»ÊÇ½ñÌì £¬¼ÆÊıÇåÁã
			nTaskLimit = nDate * 256
			SetTask(TSK_allbrother_0801_TaskLimit, nTaskLimit)
		end
		if mod(nTaskLimit, 256) < TSKV_allbrother_0801_TaskLimit then --²¢ÇÒ½ñÌì»¹ÄÜ½Ó
			return 0
		else
			Msg2Team(format("%s H«m nay ®· tiÕp nhËn %d lÇn nhiÖm vô c¸ nh©n, h«m sau quay l¹i nhĞ.", GetName(), TSKV_allbrother_0801_TaskLimit))
			return 1;
		end
	else --½ÓÁËÈÎÎñ£¬¿´ÊÇ·ñ³¬Ê±
		if nTaskTime + TSKV_allbrother_0801_TaskTime <= GetCurServerTime() then --³¬Ê±
			allbrother_0801_CancelTask()
			Msg2Team(format("%s §· v­ît qu¸ thêi gian quy ®Şnh, nhiÖm vô bŞ hñy bá.", GetName()))
			Msg2Player(format("%s §· v­ît qu¸ thêi gian quy ®Şnh, nhiÖm vô bŞ hñy bá.", GetName()))
			return 0;
		else --Ã»ÓĞ³¬Ê±£¬ËµÃ÷ÒÑ¾­½ÓÁËÈÎÎñ
			Msg2Team(format("%s §· tiÕp nhËn nhiÖm vô cña B¾c §Èu L·o Nh©n.", GetName()))
			return 1;
		end
	end
end

--Ò»¸öÈË½ÓÊÜÈÎÎñµÄ´¦Àí ¸øËûÒ»¸önTaskIdµÄÈÎÎñ£¬²¢ÇÒÉèÖÃÊ±¼ä£¬¸öÈËÈÎÎñ´ÎÊı+1
function allbrother_0801_AcceptTask(nTaskId)
	--ÉèÖÃÈËÎïÉíÉÏ nÈÎÎñ×´Ì¬
	SetTask(TSK_allbrother_0801_TaskState, nTaskId)
	SetTask(TSK_allbrother_0801_TaskLimit, GetTask(TSK_allbrother_0801_TaskLimit)+1)
	SetTask(TSK_allbrother_0801_TaskTime, GetCurServerTime())
	Msg2Player(format("NhËn ®­îc nhiÖm vô: %s", allbrother_0801_tbTaskList[nTaskId].szShow))
end



--¶ÓÎéÈ¡ÏûÈÎÎñ 
function allbrother_0801_TeamCancelTask()
	local nTeamSize = GetTeamSize()
	for i=1,nTeamSize do
		allbrother_0801_PlayerDo(GetTeamMember(i), allbrother_0801_CancelTask)
	end
end
--¸öÈËÈ¡ÏûÈÎÎñ,ÈÎÎñ×´Ì¬ÉèÎª0
function allbrother_0801_CancelTask()
	if GetTask(TSK_allbrother_0801_TaskState) == 0 then
		Say("HiÖn t¹i, b¹n vÉn ch­a cã nhiÖm vô µ? V­ît qu¸ thêi gian quy ®Şnh lµm nhiÖm vô xem nh­ nhiÖm vô bŞ hñy bá.", 0)
		return 0;
	end
	SetTask(TSK_allbrother_0801_TaskState, 0)
	Msg2Player("Hñy bá nhiÖm vô.")
end

--ÊÇ·ñ50¼¶
function allbrother_0801_islvl50()
	if GetLevel() >= 50 and IsCharged() == 1 then
		return 1
	else 
		Msg2Team(format("%s §¼ng cÊp ch­a ®¹t 50 hoÆc ch­a n¹p thÎ.",GetName()))
	end
end

function allbrother_0801_TaskPersonTaskAward() --
	local nTaskState	= GetTask(TSK_allbrother_0801_TaskState)
	local nTaskTime		= GetTask(TSK_allbrother_0801_TaskTime)
	local nTaskId		= 0;
	if nTaskState == 0 then
		Say("B¹n vÉn ch­a tiÕp nhËn nhiÖm vô nµo c¶.",0)
		return	
	end
	if nTaskState < 1073741824 then
		if nTaskTime + TSKV_allbrother_0801_TaskTime <= GetCurServerTime() then --³¬Ê±
			SetTask(TSK_allbrother_0801_TaskState, 0)
			Say("Xin chia buån! Thêi gian tr«i qua thËt nhanh, vÉn ch­a hoµn thµnh, nhiÖm vô thÊt b¹i råi.", 0)
			return
		end
		nTaskId = nTaskState
		if allbrother_0801_tbTaskList[nTaskId].nTaskType == 0 then 
			local tbAward = {0, allbrother_0801_TaskFindItemAward, 1}
			springfestival08_lib_material_compose({allbrother_0801_tbTaskList[nTaskId].tbList, tbAward, "Hoµn thµnh nhiÖm vô ", "VËt phÈm nhiÖm vô kh«ng ®óng hoÆc sè l­îng kh«ng ®ñ", "NhiÖm vô sai"}, "Giao vËt phÈm")
		else
			Say("NhiÖm vô vÉn ch­a hoµn thµnh", 0)	
		end
	else
		allbrother_0801_TaskFindNpcAward();
	end
	
	
	
end

function allbrother_0801_TaskFindItemAward(nTaskId)
	if allbrother_0801_CompleteTask() == 1 then
		return allbrother_0801_TaskFindNpcAward()
	end
end

--¸öÈËÈÎÎñÁì½±£¬ÅĞ¶ÏÈÎÎñÊÇ·ñÍê³É£¬ÊÇ·ñ³¬Ê±£¬È»ºó¸øÎïÆ·£¬ÈÎÎñ×´Ì¬ÉèÖÃÎª0
function allbrother_0801_TaskFindNpcAward()
	
	local nExpAward = 0;
	local nTransCount = ST_GetTransLifeCount();
	
	if nTransCount == 0 then
		nExpAward = 5000000;
	elseif nTransCount == 1 then
		nExpAward = 9000000;
	elseif nTransCount >= 2 then
		nExpAward = 12000000;
	end
		
	local nTaskState	= GetTask(TSK_allbrother_0801_TaskState)
	local nTaskTime		= GetTask(TSK_allbrother_0801_TaskTime)
	local tbAward = 
	{
		{szName="Phóc Duyªn Lé (§¹i) ", tbProp={6, 1, 124, 1, 0, 0}},
		{nExp = nExpAward},
	}
	if (nTaskState > 1073741824) then --Ïàµ±ÓÚÅĞ¶Ï×î¸ßÎ»ÉèÖÃÊÇ·ñÎª1
		SetTask(TSK_allbrother_0801_TaskState, 0)
		--ÊÇ·ñ³¬Ê±
		if nTaskTime + TSKV_allbrother_0801_TaskTime <= GetCurServerTime() then --³¬Ê±
			Say("Xin chia buån! Thêi gian tr«i qua thËt nhanh, vÉn ch­a hoµn thµnh, nhiÖm vô thÊt b¹i råi.", 0)
			return
		end
		--¸ø½±Àø
		springfestival08_lib_AddAward(tbAward[2], allbrother_0801_szActName)
		
		local nCurRate = random(1,100)
		if nCurRate < 20 then
			springfestival08_lib_AddAward(tbAward[1], allbrother_0801_szActName)
		end
		
		nCurRate = random(1,getn(allbrother_0801_tbLingPai))
		springfestival08_lib_AddAward(allbrother_0801_tbLingPai[nCurRate], allbrother_0801_szActName)
		return 1;
	else
		Say("B¹n d­êng nh­ vÉn ch­a hoµn thµnh nhiÖm vô.", 0)
	end
end



function allbrother_0801_TeamTaskAward()
	local nTeamSize = GetTeamSize()
	if IsCaptain() ~= 1 then
		Say("ViÖc nµy…… PhiÒn c¸c h¹ nhê ®éi tr­ëng cïng ta bµn chuyÖn.", 0)
		return 0;
	end
	if nTeamSize < allbrother_0801_TeamSizeLimit then
		Say("Huynh ®Ö trong tæ ®éi vÉn ch­a ®ñ, xin chiªu mé thªm nhĞ.", 0)
		return
	end
	for i=1,nTeamSize do
		if not allbrother_0801_PlayerDo(GetTeamMember(i), allbrother_0801_islvl50) then
			Say("Tæ ®éi cña b¹n cã ng­êi ®¼ng cÊp ch­a ®¹t 50 hoÆc ch­a n¹p thÎ, kh«ng thÓ tiÕp nhËn nhiÖm vô.", 0)
			return 
		end
	end
	local tbAward = {0, allbrother_0801_TeamTaskAwardFun, 1}
	springfestival08_lib_material_compose({allbrother_0801_tbLingPai, tbAward, "Hoµn thµnh nhiÖm vô ", "VËt phÈm nhiÖm vô kh«ng ®óng hoÆc sè l­îng kh«ng ®ñ", "NhiÖm vô sai"}, "Giao vËt phÈm", "8 lo¹i lÖnh bµi B¾c §Èu M«n (Thiªn Xu LÖnh, Thiªn Toµn LÖnh, Thiªn C¬ LÖnh, Thiªn QuyÒn LÖnh, Ngäc Hoµnh LÖnh, Khai D­¬ng LÖnh, Dao Quang LÖnh, ThÊt Tinh LÖnh)")
end

--function allbrother_0801_CheckAllTeamTaskLimit()
--	local nTeamSize = GetTeamSize()
--	local nCount = 0;
--	for i=1,nTeamSize do
--		nCount = nCount + allbrother_0801_PlayerDo(GetTeamMember(i), allbrother_0801_CheckTeamTaskLimit)
--	end
--	return nCount;
--end

function allbrother_0801_CheckTeamTaskLimit()
	local nTaskTeamLimit = GetTask(TSK_allbrother_0801_TaskTeamLimit)
	local nDate = tonumber(GetLocalDate("%y%m%d"))
	if nDate ~= floor(nTaskTeamLimit/256) then
		nTaskTeamLimit = nDate * 256
		SetTask(TSK_allbrother_0801_TaskTeamLimit, nTaskTeamLimit)
	end
	if mod(nTaskTeamLimit, 256) < TSKV_allbrother_0801_TaskTeamLimit then
		return 1;
	else
		Msg2Player(format("%s H«m nay ®· hoµn thµnh %d lÇn nhiÖm vô tËp thÓ, ®· ®¹t ®Õn tèi ®a, kh«ng thÓ nhËn phÇn th­ëng.", GetName(), TSKV_allbrother_0801_TaskTeamLimit))
		return 0;
	end
	return 0;
end

function allbrother_0801_TeamTaskAwardFun()
	local nTeamSize = GetTeamSize()
	for i=1,nTeamSize do
		allbrother_0801_PlayerDo(GetTeamMember(i), allbrother_0801_TaskAwardFun)
	end
	while GetTeamSize() > 0 do
		allbrother_0801_PlayerDo(GetTeamMember(1), LeaveTeam);
	end
	return 1;	
end

function allbrother_0801_TaskAwardFun()
	
	if allbrother_0801_CheckTeamTaskLimit() == 0 then
		return 1
	end
	
	local tbExp = {nExp = 8000000}
	local tbItem = 
	{
		{szName="Phóc Duyªn Lé (§¹i) ", tbProp={6, 1, 124, 1, 0, 0}, nRate = 20},
		{szName="Tiªn Th¶o Lé ", tbProp={6, 1, 71, 1, 0, 0}, nRate = 5},
		{szName="Tö Thñy Tinh", tbProp={4, 239, 1, 0, 0, 0}, nRate = 1},
	}
	springfestival08_lib_AddAward(tbExp, allbrother_0801_szActName)
	springfestival08_lib_GiveRandomAward(tbItem, allbrother_0801_szActName)
	SetTask(TSK_allbrother_0801_TaskTeamLimit, GetTask(TSK_allbrother_0801_TaskTeamLimit)+1)
	return 1;
end


function OnCancel()
end