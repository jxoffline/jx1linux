Include("\\script\\misc\\taskmanager.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\remoteexc.lua");

tb2010ZhongQiu = {};
tb2010ZhongQiu.nTaskGroupId 				 = 11;
tb2010ZhongQiu.nTask_HuDie 					 = 1;
tb2010ZhongQiu.nTask_XinXin 				 = 2;
tb2010ZhongQiu.nTask_ZhuXin_YuanXin  = 3;
tb2010ZhongQiu.tbNpcSet = 
{
-- [nNpcIdx] = "XXX", (ËùÓÐÕßÃû×Ö)
};
tb2010ZhongQiu.tbNpcInfo = 
{
	["§¹i Lùc ThÞ VÖ"] = 
	{
		nTempId   = 1579,
		nTaskId   = tb2010ZhongQiu.nTask_XinXin,
		nMaxExp   = 2000000000,
		nAwardExp = 2000000,
		tbDrop		= nil,
	},
	
	["Th­êng Th¾ng ThÞ VÖ"] = 
	{
		nTempId   = 1580,
		nTaskId   = tb2010ZhongQiu.nTask_ZhuXin_YuanXin,
		nMaxExp   = 6000000000,
		nAwardExp = 3000000,
		tbDrop		= {
									{szName = "Lång ®Ìn kÐo qu©n", tbProp = {6, 1, 2506, 1, 0, 0}, nExpiredTime = 20101018, },
									{
										{szName = "Phó Quý CÈm H¹p", 				nRate = 1,   tbProp = {6, 1, 2402, 1, 0, 0}, nExpiredTime = 20101018,},
										{szName = "Tiªn Th¶o Lé ", 					nRate = 5,   tbProp = {6, 1,   71, 1, 0, 0}, },
										{szName = "Phóc Duyªn Lé (TiÓu) ", 		nRate = 5,   tbProp = {6, 1,  122, 1, 0, 0}, },
										{szName = "Phi Tèc hoµn", 					nRate = 2,   tbProp = {6, 0,    6, 1, 0, 0}, },
										{szName = "§¹i Lùc hoµn", 					nRate = 2,   tbProp = {6, 0,    3, 1, 0, 0}, },
										{szName = "Bµn Nh­îc T©m Kinh", 				nRate = 0.4, tbProp = {6, 1,   12, 1, 0, 0}, },
										{szName = "Thiªn V­¬ng Chïy Ph¸p. QuyÓn 1", 		nRate = 0.2, tbProp = {6, 1,   37, 1, 0, 0}, },
										{szName = "Thiªn V­¬ng Th­¬ng ph¸p. QuyÓn 2", 		nRate = 0.2, tbProp = {6, 1,   38, 1, 0, 0}, },
										{szName = "Thiªn V­¬ng §ao ph¸p.QuyÓn 3", 		nRate = 0.2, tbProp = {6, 1,   39, 1, 0, 0}, },
										{szName = "ThiÕu L©m QuyÒn Ph¸p. QuyÓn 1", 		nRate = 0.2, tbProp = {6, 1,   56, 1, 0, 0}, },
										{szName = "ThiÕu L©m C«n ph¸p. QuyÓn 2", 		nRate = 0.2, tbProp = {6, 1,   57, 1, 0, 0}, },										
										{szName = "ThiÕu L©m §ao ph¸p. QuyÓn 3", 		nRate = 0.2, tbProp = {6, 1,   58, 1, 0, 0}, },										
										{szName = "Phi §ao thuËt. NhiÕp Hån NguyÖt ¶nh", 	nRate = 0.2, tbProp = {6, 1,   45, 1, 0, 0}, },										
										{szName = "Phi Tiªu thuËt. Cöu Cung Phi Tinh", 	nRate = 0.2, tbProp = {6, 1,   46, 1, 0, 0}, },										
										{szName = "Tô TiÔn thuËt. B¹o Vò Lª Hoa", 	nRate = 0.2, tbProp = {6, 1,   27, 1, 0, 0}, },
										{szName = "H·m TÜnh thuËt.Lo¹n Hoµn KÝch", 		nRate = 0.2, tbProp = {6, 1,   28, 1, 0, 0}, },										
										{szName = "Ngò §éc ch­ëng ph¸p (quyÓn 1)", 	nRate = 0.2, tbProp = {6, 1,   47, 1, 0, 0}, },										
										{szName = "Ngò §éc §ao ph¸p. QuyÓn 2", 		nRate = 0.2, tbProp = {6, 1,   48, 1, 0, 0}, },
										{szName = "Ngò §éc NhiÕp T©m thuËt. QuyÓn 3", 	nRate = 0.2, tbProp = {6, 1,   49, 1, 0, 0}, },										
										{szName = "DiÖt KiÕm MËt TÞch", 				nRate = 0.2, tbProp = {6, 1,   42, 1, 0, 0}, },
										{szName = "Nga Mi  PhËt Quang Ch­ëng MËt TÞch", 	nRate = 0.2, tbProp = {6, 1,   43, 1, 0, 0}, },										
										{szName = "Phæ §é MËt TÞch", 				nRate = 0.2, tbProp = {6, 1,   59, 1, 0, 0}, },
										{szName = "Thóy Yªn §ao ph¸p", 				nRate = 0.2, tbProp = {6, 1,   40, 1, 0, 0}, },
										{szName = "Thóy Yªn Song ®ao", 				nRate = 0.2, tbProp = {6, 1,   41, 1, 0, 0}, },										
										{szName = "C¸i Bang Ch­ëng Ph¸p", 				nRate = 0.2, tbProp = {6, 1,   54, 1, 0, 0}, },	
										{szName = "C¸i Bang C«n ph¸p", 				nRate = 0.2, tbProp = {6, 1,   55, 1, 0, 0}, },										
										{szName = "L­u Tinh. §ao ph¸p", 				nRate = 0.2, tbProp = {6, 1,   36, 1, 0, 0}, },	
										{szName = "NhiÕp Hån. Chó thuËt", 				nRate = 0.2, tbProp = {6, 1,   53, 1, 0, 0}, },
										{szName = "Th¸i Cùc QuyÒn Phæ. QuyÓn 3", 		nRate = 0.2, tbProp = {6, 1,   33, 1, 0, 0}, },										
										{szName = "Th¸i Cùc KiÕm Phæ. QuyÓn 2", 		nRate = 0.2, tbProp = {6, 1,   34, 1, 0, 0}, },	
										{szName = "Ngù Phong thuËt", 					nRate = 0.2, tbProp = {6, 1,   50, 1, 0, 0}, },		
										{szName = "Ngù L«i thuËt", 					nRate = 0.2, tbProp = {6, 1,   51, 1, 0, 0}, },		
										{szName = "Ngù T©m thuËt", 					nRate = 0.2, tbProp = {6, 1,   52, 1, 0, 0}, },		
										{szName = "1 ®iÓm danh väng", 					nRate = 28,  pFun = function(selfpoint, nItemCount, szLogTitle, nBelongerIndex)
																															   local nOldPlayerIdx = PlayerIndex;
																															 	 PlayerIndex = nBelongerIndex;
																															 	 AddRepute(1);	
																															 	 Msg2Player("T¨ng 1 ®iÓm danh väng");
																															 	 WriteLog(format("%s t¨ng 1 ®iÓm danh väng", szLogTitle));
																															 	 PlayerIndex = nOldPlayerIdx;
																												 			 end, },		
										{szName = "2 ®iÓm danh väng", 					nRate = 26,  pFun = function(selfpoint, nItemCount, szLogTitle, nBelongerIndex)
																															   local nOldPlayerIdx = PlayerIndex;
																															 	 PlayerIndex = nBelongerIndex;
																															 	 AddRepute(2);	
																															 	 Msg2Player("T¨ng 2 ®iÓm danh väng");
																															 	 WriteLog(format("%s t¨ng 2 ®iÓm danh väng", szLogTitle));
																															 	 PlayerIndex = nOldPlayerIdx;
																															 end, },	
										{szName = "3 ®iÓm danh väng", 					nRate = 25,  pFun = function(selfpoint, nItemCount, szLogTitle, nBelongerIndex)
																															   local nOldPlayerIdx = PlayerIndex;
																															 	 PlayerIndex = nBelongerIndex;
																															 	 AddRepute(3);	
																															 	 Msg2Player("T¨ng 3 ®iÓm danh väng");
																															 	 WriteLog(format("%s t¨ng 3 ®iÓm danh väng", szLogTitle));
																															 	 PlayerIndex = nOldPlayerIdx;
																															 end, },																													 																												 									
									},
								},
	},
	
	["Kim C­¬ng ThÞ VÖ"] = 
	{
		nTempId   = 1581,
		nTaskId   = tb2010ZhongQiu.nTask_ZhuXin_YuanXin,
		nMaxExp   = 6000000000,
		nAwardExp = {
									{ 5000000, 30,  30 },
									{ 6000000, 47,  77 },
									{ 8000000, 20,  97 },
									{10000000,  2,  99 },
									{20000000,  1, 100 },
								},
		tbDrop		= {
									{szName = "Lång ®Ìn kÐo qu©n", tbProp = {6, 1, 2506, 1, 0, 0}, nExpiredTime = 20101018, },
									{
										{szName = "HuyÒn Viªn LÖnh", nRate = 0.3,   tbProp = {6, 1, 2351, 1, 0, 0}, },	
										{szName = "Th­¬ng Lang LÖnh", nRate = 0.8,   tbProp = {6, 1, 2352, 1, 0, 0}, },	
										{szName = "V©n Léc LÖnh", nRate = 1,   tbProp = {6, 1, 2353, 1, 0, 0}, },	
										{szName = "Hçn Nguyªn Linh Lé", nRate = 9,   tbProp = {6, 1, 2312, 1, 0, 0}, },	
										{szName = "HuyÒn Thiªn CÈm Nang", nRate = 2,   tbProp = {6, 1, 2355, 1, 0, 0}, },	
										{szName = "Long HuyÕt Hoµn", nRate = 2,   tbProp = {6, 1, 2117, 1, 0, 0}, },	
										{szName = "Phi Tèc hoµn", nRate = 2,   tbProp = {6, 0,    6, 1, 0, 0}, },	
										{szName = "§¹i Lùc hoµn", nRate = 3,   tbProp = {6, 0,    3, 1, 0, 0}, },	
										{szName = "Tiªn Th¶o Lé ®Æc biÖt",nRate = 4,   tbProp = {6, 1, 1181, 1, 0, 0}, },	
										{szName = "Khiªu chiÕn LÔ bao", nRate = 8,tbProp = {6, 1, 2006, 1, 0, 0}, },	
										{szName = "ThÇn bÝ kho¸ng th¹ch", nRate = 0.3,   tbProp = {6, 1,  398, 1, 0, 0}, },	
										{szName = "Phó Quý CÈm H¹p", nRate = 5,   tbProp = {6, 1, 2402, 1, 0, 0}, nExpiredTime = 20101018,},	
										{szName = "Ngò Hµnh Kú Th¹ch", nRate = 22.7,tbProp = {6, 1, 2125, 1, 0, 0}, },	
										{szName = "ThÇn N«ng Ch©n §¬n", nRate = 1,   tbProp = {6, 1, 2113, 1, 0, 0}, },	
										{szName = "NÕn B¸t tr©n phóc nguyÖt", nRate = 3,   tbProp = {6, 1, 1817, 1, 0, 0}, },	
										{szName = "B¸nh Trung Thu Thµnh §«", nRate = 4,   tbProp = {6, 1, 2507, 1, 0, 0}, nExpiredTime = 20101018,},	
										{szName = "B¸nh Trung Thu §¹i Lý", nRate = 4,  tbProp = {6, 1, 2508, 1, 0, 0}, nExpiredTime = 20101018,},	
										{szName = "B¸nh Trung Thu Ph­îng T­êng", nRate = 4,  tbProp = {6, 1, 2509, 1, 0, 0}, nExpiredTime = 20101018,},	
										{szName = "B¸nh Trung Thu T­¬ng D­¬ng", nRate = 4,  tbProp = {6, 1, 2510, 1, 0, 0}, nExpiredTime = 20101018,},	
										{szName = "B¸nh Trung Thu BiÖn Kinh", nRate = 4,  tbProp = {6, 1, 2511, 1, 0, 0}, nExpiredTime = 20101018,},	
										{szName = "B¸nh Trung Thu L©m An", nRate = 4,  tbProp = {6, 1, 2512, 1, 0, 0}, nExpiredTime = 20101018,},	
										{szName = "B¸nh Trung Thu D­¬ng Ch©u", nRate = 4,  tbProp = {6, 1, 2513, 1, 0, 0}, nExpiredTime = 20101018,},	
										{szName="100 v¹n l­îng", nRate = 2, nJxb = 1000000,},	
										{szName="200 v¹n l­îng", nRate = 2,  nJxb = 2000000,},	
										{szName="500 v¹n l­îng", nRate = 5,  nJxb = 5000000,},	
										{szName="1000 v¹n l­îng", nRate = 0.2,  nJxb = 10000000,},	
										{szName="CÈm nang thay ®æi trêi ®Êt", nRate = 1,  tbProp={6,1,1781,1,0,0},},	
										{szName="ThÇn Hµnh Phï", nRate = 0.2,  tbProp={6,1,1266,1,0,0}, nExpiredTime = 10080,},	
										{szName="H¶i Long Ch©u", nRate = 2,  tbProp={6,1,2115,1,0,0},},	
									},
								},
	},
};
tb2010ZhongQiu.tbHengE = 
{
	nNpcRabbitId = 1124,
	
	tbNpcTempId = 
	{
		[1] = 1594,
		[2] = 1595,
		[3] = 1596,
	},
	
	tbInfo = 
	{
		-- ³É¶¼
		{
			tbPos = {11, 3121, 4997},
			nNpcIndex = nil,
			tbRabbitPos = {11, 3123, 4996},
			nRabbitIndex = nil,
		},
	
		-- ÑïÖÝ
		{
			tbPos = {80, 1750, 3000},
			nNpcIndex = nil,
			tbRabbitPos = {80, 1752, 3000},
			nRabbitIndex = nil,			
		},
	
		-- ÏåÑô
		{
			tbPos = {78, 1532, 3241},
			nNpcIndex = nil,
			tbRabbitPos = {78, 1534, 3242},
			nRabbitIndex = nil,			
		},
	
		-- ´óÀí
		{
			tbPos = {162, 1591, 3214},
			nNpcIndex = nil,
			tbRabbitPos = {162, 1593, 3213},
			nRabbitIndex = nil,			
		},	
	},
};
tb2010ZhongQiu.tbFireworks = 
{
	-- ³É¶¼
	{
		tbPos = {11,  3124, 5002},
		nNpcIndex = nil,
		nLeftCount = 0,
	},
	
	-- ÑïÖÝ
	{
		tbPos = {80,  1751, 3018},
		nNpcIndex = nil,
		nLeftCount = 0,
	},
	
	-- ÏåÑô
	{
		tbPos = {78,  1549, 3233},
		nNpcIndex = nil,
		nLeftCount = 0,
	},
	
	-- ´óÀí
	{
		tbPos = {162, 1614, 3201},
		nNpcIndex = nil,
		nLeftCount = 0,
	},		
};


-- ÊÇ·ñ»î¶¯Ê±¼ä
function tb2010ZhongQiu:IsActivityTime()
	local nCruDate = tonumber(GetLocalDate("%Y%m%d"));
	if (20100920 <= nCruDate and nCruDate < 20101018) then
		return 1;
	end
	return 0;
end

-- ¼Ó¾­Ñé
function tb2010ZhongQiu:AwardExp(nAwardExp, nTaskID, nMaxExp, szReason, szLog)
	
	local nUnit   = 1000000;
	local nCurExp = TaskManager:GetTask(self.nTaskGroupId, nTaskID) * nUnit;
	
	if nCurExp >= nMaxExp then
		Msg2Player("§¹t ®Õn kinh nghiÖm cao nhÊt, kh«ng thÓ nhËn thªm kinh nghiÖm!");
		return
	end
	
	tbAwardTemplet:GiveAwardByList({nExp = nAwardExp}, szLog);	
	nCurExp = nCurExp + nAwardExp;
	TaskManager:SetTask(self.nTaskGroupId, nTaskID, floor(nCurExp / nUnit));
	
	local szMsg = format("%s, c¸c h¹ nhËn ®­îc %s/%s kinh nghiÖm!", szReason, tostring(nCurExp), tostring(nMaxExp));
	Msg2Player(szMsg);
end

-- ÐÂÔöNPC
function tb2010ZhongQiu:AddNpc(szNpcName)
	
	local nTempId = self.tbNpcInfo[szNpcName].nTempId;
	if nTempId == nil then 
		return 
	end
	
	local w,x,y = GetWorldPos();
	local nNpcIdx = AddNpc(nTempId, 95, SubWorldID2Idx(w), x*32, y*32, 1);
	
	if nNpcIdx <= 0 then
		return
	end
	
	self.tbNpcSet[nNpcIdx] = GetName();
	SetNpcDeathScript(nNpcIdx, "\\script\\event\\zhongqiu_jieri\\201009\\npcdeath.lua");
	AddTimer(1800 * 18, "OnTimeout", nNpcIdx);
end

-- ¶¨Ê±Æ÷µ½Ê±¼ä É¾³ýNPC
function OnTimeout(nNpcIndex)
	
	if tb2010ZhongQiu.tbNpcSet[nNpcIndex] ~= nil then
		 tb2010ZhongQiu.tbNpcSet[nNpcIndex] =  nil;
		 DelNpc(nNpcIndex);
	end

	return 0;
end

-- ¼ÓÔØŠ¬¶ð
function tb2010ZhongQiu:AddTaskNpc()
	RemoteExc("\\script\\event\\zhongqiu_jieri\\2010\\head.lua", "tbMidAut2010:SynShape", {}, "", "", {});
end

-- Š¬¶ð±äÐÎ
function tb2010ZhongQiu:TaskNpcChangeShape(nShape)
		
	local nNpcTempId = self.tbHengE.tbNpcTempId[nShape];
	local tbNpcInfo  = self.tbHengE.tbInfo;
	
	if nNpcTempId == nil or tbNpcInfo == nil then 
		return 
	end
	
	for i = 1,getn(tbNpcInfo) do
		
		-- É¾³ýÔ­ÓÐNPC
		if tbNpcInfo[i].nNpcIndex ~= nil then
			DelNpc(tbNpcInfo[i].nNpcIndex);
			tbNpcInfo[i].nNpcIndex = nil;
		end
		
		if tbNpcInfo[i].nRabbitIndex ~= nil then
			DelNpc(tbNpcInfo[i].nRabbitIndex);
			tbNpcInfo[i].nRabbitIndex = nil;
		end
		
		-- ¼ÓÔØÐÂµÄNPC
		local tbPos = tbNpcInfo[i].tbPos;
		local nSubWorldIdx = SubWorldID2Idx(tbPos[1]);

		if nSubWorldIdx >= 0 then
			local nNpcIdx = AddNpc(nNpcTempId, 90, nSubWorldIdx, tbPos[2]*32, tbPos[3]*32, 0, "H»ng Nga");
			if nNpcIdx > 0 then
				SetNpcScript(nNpcIdx, "\\script\\activitysys\\npcdailog.lua");
				tbNpcInfo[i].nNpcIndex = nNpcIdx;
			end
			local nRabbitIndex = AddNpc(self.tbHengE.nNpcRabbitId, 90, nSubWorldIdx, tbNpcInfo[i].tbRabbitPos[2]*32, tbNpcInfo[i].tbRabbitPos[3]*32, 0, " ");
			if nRabbitIndex > 0 then
				tbNpcInfo[i].nRabbitIndex = nRabbitIndex;
			end			
		end
	end	
	
end

-- ÉÏ½»×ß¾üµÆÁý
function tb2010ZhongQiu:GiveItem2HengE()
	RemoteExc("\\script\\event\\zhongqiu_jieri\\2010\\head.lua", "tbMidAut2010:AddCount", {GetName()}, "\\script\\event\\zhongqiu_jieri\\201009\\support.lua", "tb2010ZhongQiu:GiveItem2HengE_CallBack", {});
end

-- ÉÏ½»×ß¾üµÆÁý£¨»Øµ÷£©
function tb2010ZhongQiu:GiveItem2HengE_CallBack(szName, nCount)
	
	local nPlayerIndex = SearchPlayer(szName);
	if nPlayerIndex <= 0 then
		return
	end

	local nOldPlayerIndex = PlayerIndex;	
	PlayerIndex = nPlayerIndex;
	
	Msg2Player(format("§¹i hiÖp lµ ng­êi thø %d nép lång ®Ìn kÐo qu©n.", nCount));
	
	if mod(nCount, 1000) == 0 then
		Msg2Player("Chóc mõng ®¹i hiÖp nhËn ®­îc phÇn th­ëng t¨ng thªm!")
		tbAwardTemplet:GiveAwardByList({nExp = 5000000}, format("[Ho¹t ®éng trung thu][Lång ®Ìn kÐo qu©n phÇn th­ëng t¨ng thªm] ng­êi thø %d", nCount));	
	end
	
	PlayerIndex = nOldPlayerIndex;
end

-- ÏÔÊ¾ÉÏ½»µÄµÆÁýÊýÄ¿
function tb2010ZhongQiu:ShowGiveCount(nTaskID)
	local nCurCount = TaskManager:GetTask(self.nTaskGroupId, nTaskID);
	CreateTaskSay({format("<dec><npc>C¸c h¹ ®· nép %d Lång ®Ìn kÐo qu©n!", nCurCount),  "§­îc!/Cancel",});
end

-- ÉèÖÃÉÏ½»ÊýÄ¿
function tb2010ZhongQiu:SetCountForDeBug(nCount)
	RemoteExc("\\script\\event\\zhongqiu_jieri\\2010\\head.lua", "tbMidAut2010:SetCountForDeBug", {nCount}, "", "", {});
end

-- ·ÅÑÌ»¨
function tb2010ZhongQiu:Fireworks()
	for i = 1,getn(self.tbFireworks) do
		local tbPos = self.tbFireworks[i].tbPos;
		local nSubWorldIdx = SubWorldID2Idx(tbPos[1]);
		if nSubWorldIdx >= 0 then
			local nNpcIdx = AddNpc(1575, 90, nSubWorldIdx, tbPos[2]*32, tbPos[3]*32, 0, "");
			if nNpcIdx > 0 then
				self.tbFireworks[i].nNpcIndex = nNpcIdx;
				self.tbFireworks[i].nLeftCount = 80;			-- Ã¿·ÖÖÓ4´Î£¬20·ÖÖÓ Ò»¹² 80´Î
				AddTimer(15 * 18, "FireworksOnTimeout", i);
			end
		end
	end		
end

-- ÑÌ»¨¶¨Ê±Æ÷
function FireworksOnTimeout(nIndex)
	
	local tbNpc = tb2010ZhongQiu.tbFireworks[nIndex];
	if tbNpc == nil then
		return 0;
	end
	
	if tbNpc.nNpcIndex == nil then
		tbNpc.nLeftCount = 0;
		return 0;
	end
	
	if tbNpc.nLeftCount <= 0 then
		DelNpc(tbNpc.nNpcIndex);
		tbNpc.nNpcIndex = nil;
		tbNpc.nLeftCount = 0;
		return 0;
	end
	
	-- ¼Ó¾­Ñé
	local nOldPlayer = PlayerIndex;	
	local tbAllPlayer, nPlayerCount = GetNpcAroundPlayerList(tbNpc.nNpcIndex, 16);
	for i = 1, nPlayerCount do
		PlayerIndex = tbAllPlayer[i];
		if ST_IsTransLife() ~= 1 and GetLevel() < 50 then
			Msg2Player("Ph¶i cÊp 50 trë lªn míi cã thÓ tham gia ho¹t ®éng!");
		else
			tbAwardTemplet:GiveAwardByList({nExp = 1000000}, "[Ho¹t ®éng trung thu][Ph¸o hoa nhËn kinh nghiÖm]");	
		end
	end	
	
	PlayerIndex = nOldPlayer;
	tbNpc.nLeftCount = tbNpc.nLeftCount - 1;
	return 15 * 18, nIndex;
end

-- ¼ÓÔØ×°ÊÎNPC
function tb2010ZhongQiu:AddDecorationNpc()
	
	local tbNpcPosInfo = 
	{
		-- ·ïÏè
		[1] = 
		{
			{	1656	,	3156	},
			{	1649	,	3164	},
			{	1655	,	3172	},
			{	1662	,	3165	},
			{	1634	,	3178	},
			{	1644	,	3169	},
			{	1642	,	3186	},
			{	1650	,	3177	},
			{	1620	,	3085	},
			{	1611	,	3095	},
			{	1604	,	3088	},
			{	1612	,	3078	},
			{	1605	,	3296	},
			{	1598	,	3276	},
			{	1594	,	3273	},
			{	1602	,	3264	},
			{	1643	,	3285	},
			{	1636	,	3278	},
			{	1651	,	3278	},
			{	1643	,	3249	},
			{	1574	,	3117	},
			{	1582	,	3109	},
			{	1581	,	3125	},
			{	1589	,	3117	},
			{	1516	,	3117	},
			{	1523	,	3170	},
			{	1518	,	3182	},
			{	1526	,	3174	},
			{	1526	,	3167	},
			{	1532	,	3161	},
			{	1529	,	3171	},
			{	1535	,	3164	},
			{	1553	,	3122	},
			{	1545	,	3220	},
			{	1560	,	3220	},
			{	1551	,	3288	},
			{	1562	,	3228	},
			{	1579	,	3268	},
			{	1570	,	3258	},
			{	1566	,	3262	},
			{	1574	,	3270	},
			{	1589	,	3277	},
			{	1581	,	3270	},
			{	1578	,	3274	},
			{	1586	,	3282	},
			{	1620	,	3247	},
			{	1611	,	3238	},
			{	1604	,	3246	},
			{	1612	,	3254	},
		},
		
		-- ÏåÑô
		[78] = 
		{
			{	1645	,	3276	},
			{	1638	,	3268	},
			{	1636	,	3287	},
			{	1628	,	3279	},
			{	1637	,	3267	},
			{	1627	,	3279	},
			{	1620	,	3271	},
			{	1628	,	3258	},
			{	1618	,	3250	},
			{	1618	,	3269	},
			{	1609	,	3260	},
			{	1706	,	3234	},
			{	1714	,	3225	},
			{	1698	,	3224	},
			{	1705	,	3216	},
			{	1553	,	3179	},
			{	1546	,	3173	},
			{	1545	,	3192	},
			{	1537	,	3183	},
			{	1520	,	3146	},
			{	1531	,	3135	},
			{	1530	,	3155	},
			{	1539	,	3144	},
			{	1538	,	3128	},
			{	1546	,	3119	},
			{	1545	,	3137	},
			{	1553	,	3127	},
			{	1535	,	3108	},
			{	1541	,	3113	},
			{	1551	,	3102	},
			{	1545	,	3097	},
			{	1520	,	3232	},
			{	1511	,	3223	},
			{	1520	,	3214	},
			{	1529	,	3222	},
			{	1530	,	3309	},
			{	1599	,	3316	},
			{	1592	,	3323	},
			{	1602	,	3336	},
			{	1610	,	3328	},
			{	1449	,	3198	},
			{	1439	,	3208	},
			{	1405	,	3221	},
			{	1460	,	3211	},
			{	1450	,	3220	},
			{	1492	,	3268	},
			{	1500	,	3278	},
			{	1481	,	3279	},
			{	1489	,	3288	},
			{	1522	,	3298	},
			{	1531	,	3290	},
			{	1510	,	3287	},
			{	1519	,	3278	},
		},
				
		-- ãê¾©
		[37] = 
		{
			{	1603	,	3007	},
			{	1611	,	3016	},
			{	1606	,	3021	},
			{	1597	,	3012	},
			{	1613	,	3018	},
			{	1622	,	3026	},
			{	1617	,	3032	},
			{	1608	,	3023	},
			{	1624	,	3029	},
			{	1632	,	3036	},
			{	1619	,	3034	},
			{	1626	,	3041	},
			{	1633	,	3049	},
			{	1623	,	3060	},
			{	1629	,	3066	},
			{	1640	,	3056	},
			{	1616	,	3066	},
			{	1606	,	3076	},
			{	1622	,	3072	},
			{	1612	,	3082	},
			{	1591	,	3092	},
			{	1600	,	3083	},
			{	1596	,	3098	},
			{	1606	,	3088	},
			{	1622	,	3127	},
			{	1612	,	3117	},
			{	1616	,	3132	},
			{	1607	,	3123	},
			{	1628	,	3133	},
			{	1639	,	3143	},
			{	1633	,	3149	},
			{	1623	,	3138	},
			{	1842	,	2960	},
			{	1851	,	2969	},
			{	1846	,	2975	},
			{	1837	,	2966	},
			{	1845	,	2972	},
			{	1862	,	2980	},
			{	1857	,	2985	},
			{	1849	,	2978	},
			{	1885	,	3003	},
			{	1886	,	3016	},
			{	1876	,	3026	},
			{	1882	,	3032	},
			{	1892	,	3032	},
			{	1863	,	3051	},
			{	1854	,	3060	},
			{	1849	,	3055	},
			{	1859	,	3045	},
			{	1837	,	3067	},
			{	1848	,	3057	},
			{	1853	,	3062	},
			{	1843	,	3072	},
			{	1661	,	3221	},
			{	1672	,	3232	},
			{	1666	,	3237	},
			{	1656	,	3227	},
			{	1693	,	3222	},
			{	1684	,	3230	},
			{	1679	,	3225	},
			{	1688	,	3216	},
			{	1696	,	3028	},
			{	1704	,	3200	},
			{	1701	,	3213	},
			{	1710	,	3205	},
			{	1705	,	3165	},
			{	1715	,	3176	},
			{	1710	,	3181	},
			{	1700	,	3171	},
			{	1650	,	3166	},
			{	1639	,	3177	},
			{	1650	,	3188	},
			{	1660	,	3177	},
			{	1655	,	3160	},
			{	1666	,	3150	},
			{	1676	,	3161	},
			{	1666	,	3172	},
			{	1741	,	3057	},
			{	1731	,	3047	},
			{	1726	,	3053	},
			{	1736	,	3063	},
			{	1759	,	2989	},
			{	1770	,	2978	},
			{	1775	,	2984	},
			{	1765	,	2994	},
			{	1815	,	2994	},
			{	1826	,	2954	},
			{	1831	,	2924	},
			{	1820	,	2938	},
		},
				
		-- ´óÀí
		[162] = 
		{
			{	1621	,	3169	},
			{	1628	,	3161	},
			{	1639	,	3171	},
			{	1631	,	3180	},
			{	1570	,	3163	},
			{	1580	,	3154	},
			{	1590	,	3164	},
			{	1581	,	3174	},
			{	1605	,	3258	},
			{	1597	,	3267	},
			{	1603	,	3276	},
			{	1613	,	3266	},
			{	1565	,	3283	},
			{	1555	,	3273	},
			{	1562	,	3265	},
			{	1572	,	3276	},
			{	1537	,	3294	},
			{	1530	,	3302	},
			{	1539	,	3310	},
			{	1536	,	3292	},
			{	1527	,	3283	},
			{	1519	,	3290	},
			{	1528	,	3300	},
			{	1456	,	3281	},
			{	1466	,	3271	},
			{	1465	,	3291	},
			{	1475	,	3281	},
			{	1464	,	3171	},
			{	1466	,	3188	},
			{	1456	,	3179	},
			{	1473	,	3180	},
			{	1483	,	3191	},
			{	1467	,	3189	},
			{	1476	,	3197	},
			{	1623	,	3199	},
			{	1632	,	3208	},
			{	1623	,	3219	},
			{	1613	,	3210	},
			{	1654	,	3136	},
			{	1643	,	3146	},
			{	1653	,	3157	},
			{	1664	,	3146	},
			{	1583	,	3220	},
			{	1593	,	3230	},
			{	1587	,	3239	},
			{	1576	,	3228	},
		},
		
		-- ÑïÖÝ
		[80] = 
		{
			{	1684	,	3003	},
			{	1691	,	3009	},
			{	1699	,	3000	},
			{	1694	,	2993	},
			{	1717	,	2982	},
			{	1709	,	2991	},
			{	1703	,	2983	},
			{	1710	,	2975	},
			{	1654	,	3031	},
			{	1662	,	3037	},
			{	1651	,	3048	},
			{	1644	,	3041	},
			{	1667	,	3095	},
			{	1656	,	3083	},
			{	1650	,	3091	},
			{	1645	,	3117	},
			{	1652	,	3126	},
			{	1661	,	3117	},
			{	1653	,	3109	},
			{	1660	,	3117	},
			{	1660	,	3102	},
			{	1667	,	3110	},
			{	1657	,	3121	},
			{	1650	,	3112	},
			{	1621	,	3142	},
			{	1628	,	3151	},
			{	1618	,	3160	},
			{	1612	,	3152	},
			{	1662	,	3224	},
			{	1670	,	3231	},
			{	1671	,	3214	},
			{	1678	,	3222	},
			{	1703	,	3230	},
			{	1694	,	3237	},
			{	1693	,	3220	},
			{	1686	,	3228	},
			{	1681	,	3157	},
			{	1688	,	3165	},
			{	1681	,	3173	},
			{	1673	,	3165	},
			{	1653	,	3170	},
			{	1663	,	3160	},
			{	1661	,	3178	},
			{	1670	,	3168	},
			{	1771	,	3089	},
			{	1780	,	3098	},
			{	1777	,	3080	},
			{	1786	,	3089	},
			{	1810	,	3061	},
			{	1817	,	3069	},
			{	1810	,	3076	},
			{	1802	,	3068	},
			{	1838	,	3050	},
			{	1828	,	3059	},
			{	1835	,	3067	},
			{	1844	,	3058	},
		},
				
		-- ³É¶¼
		[11] = 
		{
			{	3169	,	5178	},
			{	3161	,	5186	},
			{	3168	,	5194	},
			{	3177	,	5185	},
			{	3164	,	5198	},
			{	3147	,	5201	},
			{	3157	,	5190	},
			{	3154	,	5209	},
			{	3095	,	5024	},
			{	3103	,	5031	},
			{	3111	,	5022	},
			{	3106	,	5014	},
			{	3139	,	4980	},
			{	3145	,	4988	},
			{	3154	,	4979	},
			{	3148	,	4971	},
			{	3158	,	4961	},
			{	3164	,	4969	},
			{	3173	,	4961	},
			{	3167	,	4952	},
			{	3197	,	4960	},
			{	3190	,	4969	},
			{	3199	,	4978	},
			{	3206	,	4970	},
			{	3214	,	4978	},
			{	3222	,	4969	},
			{	3199	,	4978	},
			{	3206	,	4970	},
			{	3214	,	4978	},
			{	3222	,	4986	},
			{	3217	,	4994	},
			{	3205	,	4984	},
			{	3249	,	5013	},
			{	3260	,	5025	},
			{	3259	,	5005	},
			{	3268	,	5015	},
			{	3220	,	5045	},
			{	3227	,	5075	},
			{	3218	,	5067	},
			{	3209	,	5065	},
			{	3008	,	5112	},
			{	3016	,	5120	},
			{	3011	,	5126	},
			{	3002	,	5119	},
			{	3030	,	5134	},
			{	3025	,	5141	},
			{	3036	,	5152	},
			{	3041	,	5144	},
			{	3061	,	5165	},
			{	3049	,	5153	},
			{	3045	,	5160	},
			{	3056	,	5171	},
		},		
	};
	
	local tbNpcTempId = {1592, 1593};
	
	for nSubWorldId,tbPos in tbNpcPosInfo do
		local nSubWorldIdx = SubWorldID2Idx(nSubWorldId);
		if nSubWorldIdx > 0 then
			local nRand = random(1, getn(tbNpcTempId));
			for i = 1, getn(tbPos) do
				AddNpc(tbNpcTempId[nRand], 90, nSubWorldIdx, tbPos[i][1]*32, tbPos[i][2]*32, 0, " ");
			end
		end
	end

end