IncludeLib("ITEM")
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\event\\change_destiny\\head.lua");

function main()
	return tbChangeDestiny:talk()
end

function callBack_giveZhenDan_sure(nCount)
	return tbChangeDestiny:giveZhenDan_sure(nCount)
end


-- ¼ÓÔØNPC
function tbChangeDestiny:addNpc() 

--	if tonumber(GetLocalDate("%Y%m%d")) > self.nCloseDate then
--		 return 
--	end
	
	for i=1,getn(self.tbNpcPos) do
		npcindex = AddNpc(self.nNpcResIdx, 1, SubWorldID2Idx(self.tbNpcPos[i][1]), self.tbNpcPos[i][2] * 32, self.tbNpcPos[i][3] * 32);
		if npcindex > 0 then
			SetNpcScript(npcindex, "\\script\\event\\change_destiny\\npc.lua");
		end
	end
	
end

-- ¼ì²é»ù±¾µÄ²ÎÓëÌõ¼ş
function tbChangeDestiny:checkBaseCondition()
	
--	if self:isCarryOn() ~= 1 then
--		CreateTaskSay({"<dec><npc>´óÏÀÀ´ÍíÁËÒ»²½£¬ÀÏ·òÕı´òËã»ØÏçÖÖÌïÁË¡£", "ÕæÊÇÒÅº¶°¡£¬ÄúÀÏ¶à¶à±£ÖØ¡£/Cancel"});
--		return 0;
--	end
	
	if self:canJoin() ~= 1 then
		CreateTaskSay({"<dec><npc>§¹i hiÖp cã c«ng lùc ch­a ®ñ th©m hËu, m«n ph¸p tu hµnh nghŞch thiªn nµy kh«ng dÔ tu luyÖn ®©u.", "Th× ra lµ vËy, ®a t¹ cao nh©n chØ ®iÓm/Cancel"});
		return 0;
	end
	
	return 1;
end

-- NPC¶Ô»°
function tbChangeDestiny:talk() 
	
	if self:checkBaseCondition() ~= 1 then
		return
	end
	
	if self.bDeBug == 1 then
		Msg2Player("*************************")
		Msg2Player(format("DayGiveCount:%d  DayGiveDate:%d", self:getTask(self.nTask_ZhenDan_GiveCount), self:getTask(self.nTask_ZhenDan_GiveDate)));
		Msg2Player(format("TotalGive:%d  Receive:%d  Used:%d", self:getTask(self.nTask_ZhenDan_TotalCount), self:getTask(self.nTask_GaiMing_HasReceive), self:getTask(self.nTask_GaiMing_HasUsed)));
		Msg2Player(format("Mission%d: %d	%d", self.nMissionID_Battle, self:getMissionInfo(self.nMissionID_Battle)));
		Msg2Player(format("Mission%d: %d	%d", self.nMissionID_NieShiChen, self:getMissionInfo(self.nMissionID_NieShiChen)));
		Msg2Player(format("Mission%d: %d	%d", self.nMissionID_WaterThief, self:getMissionInfo(self.nMissionID_WaterThief)));
		Msg2Player(format("Mission%d: %d	%d", self.nMissionID_Killer, self:getMissionInfo(self.nMissionID_Killer)));
		Msg2Player(" ")
	end
	
	CreateTaskSay({
		"<dec><npc>VŞ ®¹i hiÖp nµy cã duyªn víi ta, l·o phu kh«ng giÊu diÕm g× ng­¬i. Ta cã biÕt mét m«n ph¸p tu luyÖn nghŞch thiªn hµnh, ®¹i hiÖp cã høng thó t×m gióp ta <color=green>180<color> viªn <color=green>thÇn n«ng ch©n ®¬n<color> vµ giao cho l·o phu. Ta sÏ truyÒn mãn nghÒ nµy cho ng­¬i. L·o chØ dõng t¹i ®©y n÷a th¸ng, ®¹i hiÖp h·y nhanh ch©n lªn nhĞ.", 
		"Ta ®· t×m ®­îc mét sè thÇn n«ng ch©n ®¬n, xin mêi l·o nhËn lÊy./#tbChangeDestiny:giveZhenDan()",
		"Xin hái ta ®· nép ®ñ thÇn n«ng ch©n ®¬n ch­a?/#tbChangeDestiny:queryTotalCount()",
--		"ÇëÎÊÈçºÎµÃµ½ÉñÅ©Õæµ¤£¿/#tbChangeDestiny:zhenDanTask()",
		"Ta ®· hoµn thµnh theo yªu cÇu cña l·o, cã thÓ d¹y ta m«n ph¸p nµy ®­îc kh«ng?/#tbChangeDestiny:awardGaiMingJue()",
		"§­îc råi, ®Ó ta thö xem./Cancel",
		});
end

-- ÉÏ½»ÉñÅ©Õæµ¤
function tbChangeDestiny:giveZhenDan()
	
	if self:checkBaseCondition() ~= 1 then
		return
	end
	
	local nGiveDate   = self:getTask(self.nTask_ZhenDan_GiveDate);
	local nGiveCount  = self:getTask(self.nTask_ZhenDan_GiveCount);
	local nTotalCount = self:getTask(self.nTask_ZhenDan_TotalCount);
	local nDate 	  = floor(FormatTime2Number(GetCurServerTime())/10000);	-- µ±Ç°ÈÕÆÚ

	if nDate ~= nGiveDate then
		nGiveDate  = nDate;
		nGiveCount = 0; 
		self:setTask(self.nTask_ZhenDan_GiveDate,   nGiveDate);
		self:setTask(self.nTask_ZhenDan_GiveCount,  nGiveCount);
	end
	
	if nTotalCount >= self.nLimit_TotalGive then
		CreateTaskSay({"<dec><npc>§¹i hiÖp ®· hoµn thµnh yªu cÇu cña l·o råi, kh«ng cÇn ph¶i nép thªm thÇn n«ng ch©n ®¬n n÷a ®©u!", "§­îc råi./Cancel"});
		return
	end
	
	if nGiveCount >= self.nLimit_DayGive then
		CreateTaskSay({format("<dec><npc>H«m nay ®¹i hiÖp ®· nép cho l·o %d ThÇn N«ng Ch©n §¬n råi, ®îi ngµy mai h·y quay l¹i nhĞ!", self.nLimit_DayGive), "§­îc råi./Cancel"});
		return 
	end
	
	GiveItemUI("Nép ThÇn N«ng Ch©n §¬n", format("Mçi ngµy nhiÒu nhÊt chØ nép ®­îc %d viªn ThÇn N«ng Ch©n §¬n, h«m nay ®¹i hiÖp ®· nép %d viªn råi.", self.nLimit_DayGive, nGiveCount), "callBack_giveZhenDan_sure", "Cancel", 1);
end

-- ºËÊµÉÏ½»ÉñÅ©Õæµ¤
function tbChangeDestiny:giveZhenDan_sure(nCount)
	
	if self:checkBaseCondition() ~= 1 then
		return
	end
	
	if nCount <= 0 then
		CreateTaskSay({"<dec><npc>§¹i hiÖp ®ang ®ïa ta µ, l·o phu vÉn ch­a thÊy ®¹i hiÖp nép vËt phÈm g× c¶.", "He he./Cancel"});
		return 
	end
	
	for i = 1, nCount do
		local nItemidx = GetGiveItemUnit(i);
		local g, d, p = GetItemProp(nItemidx);
		if (g ~= self.tbItem_ShenLongZhenDan[1] or d ~= self.tbItem_ShenLongZhenDan[2] or p ~= self.tbItem_ShenLongZhenDan[3]) then
			CreateTaskSay({"<dec><npc>§¹i hiÖp kh«ng cÇn nép vËt phÈm g× kh¸c, chØ cÇn ®­a ta <color=yellow> ThÇn N«ng Ch©n §¬n <color> lµ ®­îc råi.", "§­îc råi./Cancel"});
			return 
		end
	end
	
	local nGiveDate   = self:getTask(self.nTask_ZhenDan_GiveDate);
	local nGiveCount  = self:getTask(self.nTask_ZhenDan_GiveCount);
	local nTotalCount = self:getTask(self.nTask_ZhenDan_TotalCount);
	local nDate 	  = floor(FormatTime2Number(GetCurServerTime())/10000);	-- µ±Ç°ÈÕÆÚ

	if nDate ~= nGiveDate then
		nGiveDate  = nDate;
		nGiveCount = 0; 
		self:setTask(self.nTask_ZhenDan_GiveDate,   nGiveDate);
		self:setTask(self.nTask_ZhenDan_GiveCount,  nGiveCount);
	end
	
	local nCanGive = self.nLimit_DayGive - nGiveCount;
	
	if nCount > nCanGive or nCanGive <= 0 then
		CreateTaskSay({format("<dec><npc>H«m nay ®¹i hiÖp chØ cÇn ®­a ta %d viªn ThÇn N«ng Ch©n §¬n lµ ®­îc, kh«ng cÇn nhiÒu h¬n ®©u.", nCanGive), "§­îc råi./Cancel"});
		return 
	end
	
	local nCanGive_Total = self.nLimit_TotalGive - nTotalCount;
	
	if nCount > nCanGive_Total or nCanGive_Total <= 0 then
		CreateTaskSay({format("<dec><npc>§¹i hiÖp chØ cÇn nép cho ta %d ThÇn N«ng Ch©n §¬n lµ ®· hoµn thµnh yªu cÇu cña ta råi, kh«ng cÇn nhiÒu h¬n ®©u.", nCanGive_Total), "§­îc råi./Cancel"});
		return 
	end
	
	for i = 1, nCount do
		local nItemidx = GetGiveItemUnit(i);
		RemoveItemByIndex(nItemidx)
	end;

	nGiveCount  = nGiveCount  + nCount;
	nTotalCount = nTotalCount + nCount;
	
	self:setTask(self.nTask_ZhenDan_GiveDate,   nGiveDate);
	self:setTask(self.nTask_ZhenDan_GiveCount,  nGiveCount);
	self:setTask(self.nTask_ZhenDan_TotalCount, nTotalCount);
	
	local szMsg = format("[ChangeDestiny]GiveZhenDan: %s give %d ZhenDan On %d. Now the DayCount is %s and TotalCount is %s.",GetName(), nCount, nGiveDate, nGiveCount, nTotalCount);
	WriteLog(szMsg);
	
	CreateTaskSay({format("<dec><npc>H«m nay ®¹i hiÖp ®· nép cho ta %d viªn ThÇn N«ng Ch©n §¬n råi, tæng céng ®· nép %d, chØ cÇn ®¹i hiÖp kh«ng ngõng nç lùc sau nµy sÏ thµnh c«ng nhanh mµ.", nGiveCount, nTotalCount), "Ta sÏ trë l¹i sau./Cancel"});
end

-- ²éÑ¯½ÉÄÉÁË¶àÉÙÉñÅ©Õæµ¤
function tbChangeDestiny:queryTotalCount()
	
	if self:checkBaseCondition() ~= 1 then
		return
	end
	
	local nTotalCount = self:getTask(self.nTask_ZhenDan_TotalCount);
	
	if nTotalCount >= self.nLimit_TotalGive then
		CreateTaskSay({"<dec><npc>Chóc mõng ®¹i hiÖp, ®¹i hiÖp ®· hoµn thµnh yªu cÇu cña l·o phu råi!", "ThËt kh«ng l·o? ThËt lµ kh«ng dÔ dµng g× ®¹t ®­îc!/Cancel"});
		return
	else
		CreateTaskSay({format("<dec><npc>§¹i hiÖp ®· nép cho l·o %d ThÇn N«ng Ch©n §¬n råi, chØ cÇn sù cè g¾ng th× nhÊt ®Şnh sÏ ®¹t ®­îc tháa nguyÖn.", nTotalCount), "Ta sÏ cè g¾ng nç lùc!/Cancel"});
		return
	end
	
end

-- ·¢·ÅÄæÌì¸ÄÃü¾÷
function tbChangeDestiny:awardGaiMingJue()
	
	if self:checkBaseCondition() ~= 1 then
		return
	end
	
	local nTotalCount = self:getTask(self.nTask_ZhenDan_TotalCount);
	local nHasAward	  = self:getTask(self.nTask_GaiMing_HasReceive);
	
	if nTotalCount < self.nLimit_TotalGive then
		CreateTaskSay({"<dec><npc>Lµm ng­êi ph¶i cã lßng trung thùc, kh«ng dÔ g× lõa ®­îc l·o phu ®©u.", "Ta chØ ®ïa ng­¬i th«i, ®õng t­ëng thËt nhĞ!/Cancel"});
		return
	end
	
	if nHasAward ~= 0 then
		CreateTaskSay({"<dec><npc>L·o phu b×nh sinh rÊt ghĞt bän tiÓu nh©n cã lßng tham v« ®¸y, kh«ng ph¶i ng­¬i ®· nhËn råi hay sao?", "L·o phu gi¸o huÊn chİ ph¶i, v·n bèi biÕt lçi råi!/Cancel"});
		return
	end
	
	local free = FindFreeRoomByWH(1, 1)
	if (free ~= 1) then
		CreateTaskSay({"<dec><npc>Hµnh trang kh«ng ®ñ « trèng, xin mêi s¾p xÕp hµnh trang råi quay trë l¹i nhĞ.", "§­îc råi./Cancel"});
		return
	end
	
	local item = AddItem(self.tbItem_GaiMingJue[1],self.tbItem_GaiMingJue[2],self.tbItem_GaiMingJue[3],1,0,0)
	if (item == 0) then
			WriteLog(format("[ChangeDestiny]Failed to give GaiMingJue to %s", GetName()));
			CreateTaskSay({"<dec><npc>Ta c¶m nhËn cã g× kh«ng æn, vËt phÈm tuyÖt thÕ nµy t¹m thêi kh«ng thÓ giao phã cho ng­¬i ®­îc.", "T¹i sao?/Cancel"});
			return
	else
--			ITEM_SetExpiredTime(item, self.nCloseDate, 235959)
			SyncItem(item)
			SetItemBindState(item, -2)

			self:setTask(self.nTask_GaiMing_HasReceive, 1);
			WriteLog(format("[ChangeDestiny]Give GaiMingJue to %s", GetName()))
			CreateTaskSay({"<dec><npc>§©y lµ phÇn th­ëng cho ng­¬i! Tõ nay vÒ sau ng­¬i h·y cè rÌn luyÖn vâ c«ng ®Ó kh«ng phô lßng l·o phu nhĞ.", "§a t¹ tiÒn bèi!/Cancel"});
			return
	end
end

-- ÉñÅ©Õæµ¤ÈÎÎñ
function tbChangeDestiny:zhenDanTask()
	
	if self:checkBaseCondition() ~= 1 then
		return
	end
	
	local nTotalCount = self:getTask(self.nTask_ZhenDan_TotalCount);
	
	if nTotalCount >= self.nLimit_TotalGive then
		CreateTaskSay({"<dec><npc>§¹i hiÖp ®· hoµn thµnh yªu cÇu cña l·o phu råi, vËt phÈm thÇn n«ng ch©n ®¬n nµy ta kh«ng cÇn thªm n÷a ®©u.", "Ta ®· hiÓu råi!/Cancel"});
		return
	end
	
	CreateTaskSay({
		"<dec><npc>L·o phu tuæi ta ®· cao, cã nh÷ng viÖc muèn mµ kh«ng lµm ®­îc, ®¹i hiÖp cã muèn gióp l·o phu mét phen kh«ng, thÇn n«ng ch©n ®¬n nµy lµ tÆng phÈm nÕu ng­¬i gióp ta.",
		"TiÒn bèi qu¸ lêi råi, ®©y lµ viÖc ta cÇn lµm, xin l·o phu cø giao phã!/#tbChangeDestiny:zhenDanTask_accepte()",
		"Nh÷ng viÖc tiÒn bèi giao phã ta ®· lµm xong råi./#tbChangeDestiny:zhenDanTask_delivery()",
		"T¹i h¹ ®· râ råi./Cancel",
		});
	
end

-- ÉñÅ©Õæµ¤ÈÎÎñ ½ÓÊÜÈÎÎñ
function tbChangeDestiny:zhenDanTask_accepte()
	
	if self:checkBaseCondition() ~= 1 then
		return
	end
	
	CreateTaskSay({
		"<dec><npc>Ta ®©y cã mét sè nhiÖm vô, phiÒn ®¹i hiÖp mét phen.",
		format("T¹i h¹ muèn nhËn nhiÖm vô “3000 ®iÓm tİch lòy Tèng Kim”./#tbChangeDestiny:zhenDanTask_accepte_hand(%d)", self.nMissionID_Battle),
		format("T¹i h¹ muèn nhËn nhiÖm vô “§¸nh b¹i NhiÕp Thİ TrÇn”./#tbChangeDestiny:zhenDanTask_accepte_hand(%d)", self.nMissionID_NieShiChen),
		format("T¹i h¹ muèn nhËn nhiÖm vô “§¸nh b¹i Thñy TÆc ®Çu lÜnh”./#tbChangeDestiny:zhenDanTask_accepte_hand(%d)", self.nMissionID_WaterThief),
		format("T¹i h¹ muèn nhËn nhiÖm vô “§¶ b¹i tø ®¹i s¸t thñ”./#tbChangeDestiny:zhenDanTask_accepte_hand(%d)", self.nMissionID_Killer),
		"Cã mét sè nhiÖm vô h¬i khã, xin h·y ®Ó t¹i h¹ cã thêi gian chuÈn bŞ./Cancel",
		});
end

-- ÉñÅ©Õæµ¤ÈÎÎñ ´¦Àí½ÓÊÜÉêÇë
function tbChangeDestiny:zhenDanTask_accepte_hand(nMissionID)
	
	if self:checkBaseCondition() ~= 1 then
		return
	end
	
	local nMissionStep, nMissionDate = self:getMissionInfo(nMissionID);
	local nDate = floor(FormatTime2Number(GetCurServerTime())/10000);	-- µ±Ç°ÈÕÆÚ
	
	if nMissionStep ~= self.nStep_free then
		CreateTaskSay({format("<dec><npc>§¹i hiÖp ®· nhËn nhiÖm vô råi, xin h·y cè g¾ng hoµn thµnh nhiÖm vô. Môc tiªu nhiÖm vô cña ®¹i hiÖp lµ: <color=green>%s<color>, hoµn thµnh xong thu ®­îc <color=green>%d<color> viªn ThÇn N«ng Ch©n §¬n!", self.tbMissionInfo[nMissionID][2], self.tbMissionInfo[nMissionID][1]), "§­îc råi./Cancel"});
		return
	end
	
	if nMissionDate == nDate then
		CreateTaskSay({"<dec><npc>§¹i hiÖp h«m nay ®· hoµn thµnh lo¹i nhiÖm vô nµy råi, ngµy mai quay l¹i nhĞ!", "§­îc råi./Cancel"});
		return
	end
	
	self:setMissionInfo(nMissionID, self.nStep_accepted , nMissionDate);
	CreateTaskSay({format("<dec><npc>Môc tiªu nhiÖm vô cña ®¹i hiÖp lµ: <color=green>%s<color>, hoµn thµnh xong thu ®­îc <color=green>%d<color> ThÇn N«ng Ch©n §¬n!", self.tbMissionInfo[nMissionID][2], self.tbMissionInfo[nMissionID][1]), "Ta sÏ lªn ®­êng ngay!/Cancel"});
	Msg2Player(self.tbMissionInfo[nMissionID][3]);
end

-- ÉñÅ©Õæµ¤ÈÎÎñ ½»¸¶ÈÎÎñ
function tbChangeDestiny:zhenDanTask_delivery()
	
	if self:checkBaseCondition() ~= 1 then
		return
	end
	
	CreateTaskSay({
		"<dec><npc>§¹i hiÖp qu¶ nhiªn kh«ng lµm ta thÊt väng, ng­¬i ®· hoµn thµnh nhiÖm vô nµo råi?",
		format("T¹i h¹ ®Õn giao nhiÖm vô “3000 ®iÓm tİch lòy Tèng Kim”./#tbChangeDestiny:zhenDanTask_delivery_hand(%d)", self.nMissionID_Battle),
		format("T¹i h¹ ®Õn giao nhiÖm vô “§¸nh b¹i NhiÕp Thİ TrÇn”./#tbChangeDestiny:zhenDanTask_delivery_hand(%d)", self.nMissionID_NieShiChen),
		format("T¹i h¹ ®Õn giao nhiÖm vô “§¸nh b¹i Thñy TÆc ®Çu lÜnh”./#tbChangeDestiny:zhenDanTask_delivery_hand(%d)", self.nMissionID_WaterThief),
		format("T¹i h¹ ®Õn giao nhiÖm vô “§¶ b¹i tø ®¹i s¸t thñ”./#tbChangeDestiny:zhenDanTask_delivery_hand(%d)", self.nMissionID_Killer),
		"T¹i h¹ nhí nhÇm, t¹m thêi vÉn ch­a xong nhiÖm vô./Cancel",
		});
end

-- ÉñÅ©Õæµ¤ÈÎÎñ ´¦Àí½»¸¶ÉêÇë
function tbChangeDestiny:zhenDanTask_delivery_hand(nMissionID)
	
	if self:checkBaseCondition() ~= 1 then
		return
	end
	
	local nMissionStep, nMissionDate = self:getMissionInfo(nMissionID);
	local nDate = floor(FormatTime2Number(GetCurServerTime())/10000);	-- µ±Ç°ÈÕÆÚ
	
	if nMissionStep ~= self.nStep_completed then
		CreateTaskSay({"<dec><npc>Ta tuy giµ nh­ng kh«ng hay quªn ®©u, ng­¬i ®õng hßng lõa g¹t ta", "V·n bèi biÕt lçi råi./Cancel"});
		return
	end
	
	if nMissionDate == nDate then
		CreateTaskSay({"<dec><npc>§¹i hiÖp h«m nay ®· hoµn thµnh lo¹i nhiÖm vô nµy råi, ngµy mai quay l¹i nhĞ!", "§­îc råi./Cancel"});
		return
	end
	
	local nFree = CalcFreeItemCellCount();
	local nAwardCount = self.tbMissionInfo[nMissionID][1];
	
	if (nFree < nAwardCount) then
		CreateTaskSay({"<dec><npc>Hµnh trang kh«ng ®ñ « trèng, xin mêi s¾p xÕp hµnh trang råi quay trë l¹i nhĞ.", "§­îc råi./Cancel"});
		return
	end
	
	for i=1,nAwardCount do
		local item = AddItem(self.tbItem_ShenLongZhenDan[1],self.tbItem_ShenLongZhenDan[2],self.tbItem_ShenLongZhenDan[3],1,0,0);
		if (item == 0) then
			WriteLog(format("[ChangeDestiny]Failed to give ShenLongZhenDan to %s", GetName()));
		else
			ITEM_SetExpiredTime(item, self.nCloseDate, 235959)
			SyncItem(item)
			SetItemBindState(item, -2)
			WriteLog(format("[ChangeDestiny]Give ShenLongZhenDan to %s", GetName()))
		end
	end
	 
	self:setMissionInfo(nMissionID, self.nStep_free , nDate);
	CreateTaskSay({"<dec><npc>§©y lµ phÇn th­ëng cña ®¹i hiÖp!", "§a t¹ tiÒn bèi!/Cancel"});
end