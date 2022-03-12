-- ÊÔ½£¹È»¤½£Ê¹
Include("\\script\\missions\\maze\\maze.lua")
Include("\\script\\global\\station.lua")
Include("\\script\\global\\autoexec_head.lua")
Include("\\script\\global\\dlgnpc_list.lua")
Include("\\script\\missions\\maze\\head.lua")
Include("\\script\\missions\\maze\\addstatdata.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

LEVEL_MIN = 120

LIMITS = {
	MIN_TEAMSIZE = 6,
	FLAG_CHECKTIME = 1,
}

-- ³µ·ò
NpcChefu = {
	m_Caption = "Muèn ngåi xe ®i ®©u? ",
	m_Options = {
		"Ta muèn ®i Ph­îng T­êng",
		"Ta muèn ®i Thµnh §«",
		"Ta muèn ®i §¹i Lı",
		"Ta muèn ®i BiÖn Kinh",
		"Ta muèn ®i T­¬ng D­¬ng.",
		"Ta muèn ®i D­¬ng Ch©u.",
		"Ta muèn ®i L©m An",
		"Kh«ng ®i ®©u c¶"
	}
}
function NpcChefu:Say(player)
	return self.m_Caption, self.m_Options
end

function NpcChefu:OnAnswer(player, sel)
	if (sel > 0 and sel < 8) then
		local mapid, x, y = GetStationPos(sel)
		if (mapid ~= nil and NewWorld(mapid, x, y) == 1) then
			player:Msg2Player("Ngåi yªn ch­a? Chóng ta ®i ")
		end
	end
end

-- ÖÜ¾ı
NpcZhoujun = {
	m_Caption = "Cung nghªnh ®¹i hiÖp, l·o phu ta lµ Thiªn Xu Hé KiÕm Sø cña Ngäc Long S¬n Trang .",
	m_Options = {
		"Lµ ta ®Õn ®©y ®Ó hoµn thµnh nhiÖm vô vña Ngäc Long Anh hïng ThiÕp",
		"Ta ®Õn ®Ó nhËn Ngäc Long Danh KiÕm Phæ cña Kh«ng B¹ch",
		"Ta ®Õn ®Ó nhËn phÇn th­ëng thu thËp Ngäc Long Danh KiÕm cña th¸ng nµy",
		"Ta chØ ®Õn ch¬i",
	}
}

function NpcZhoujun:Say(player)
	do
		player:Say("Tİnh n¨ng nµy t¹m thêi ®ãng.")
		return
	end
	return self.m_Caption, self.m_Options
end

function NpcZhoujun:OnAnswer(player, nIndex)
	if (nIndex == 1) then
		local nTask = player:GetTask(TASK_MAZEINVITATION)
		if (nTask == 0) then
			player:Say("Xin l­îng thø, ng­¬i ch­a nhËn ®­îc nhiÖm vô nµy.")
		elseif (nTask == 1) then
			if (player:CalcFreeItemCellCount() == 0) then
				player:Say("Xin h·y s¾p xÕp l¹i hµnh trang sau nµy h·y ®Õn gÆp ta.")
				return
			end
			player:Describe(
				format("%s ®¹i hiÖp, l·o phu ta ®· nghe danh ngµi tõ l©u, h«m nay ®­îc t­¬ng ngé, qu¶ lµ nh©n trung long ph­îng. LÇn nµy Ngäc Long S¬n Trang mêi ngµi ®Õn ®©y lµ cã viÖc muèn th­¬ng l­îng, l·o phu sÏ kÓ ®Çu ®u«i c©u chuyÖn. <enter> S¬n Trang cña ta tr­íc ®©y cã nghe ®Æc th¸m b¸o l¹i, Kim Quèc ®ang ©m thÇm chuÈn bŞ mét ©m m­u to lín, hä dù tİnh mét ©m m­u ph¸t ®éng mét cuéc ®¹i chiÕn kinh thiªn ®èi víi v­¬ng triÒu cña ta . §Ó chèng l¹i ©m m­u cña hä, Ngäc Long S¬n Trang ®· quyÕt ®Şnh tuyÓn chän vµ huÊn luyÖn mét sè cao thñ tuyÖt ®Ønh vâ l©m trİ dòng song toµn, th©m nhËp vµo néi cung cña kÎ ®Şch ¸m s¸t thñ lÜnh cña hä. Trang chñ c¶u chóng t«i mét ®êi cña ngµi rÊt thİch thu thËp danh kiÕm, ®Ó ®Ò phßng §éc C« CÇu B¹i nªn ®· cÊt gi÷ danh kiÕm ë trong “KiÕm Gia”. H¬n n÷a ®·  tuyÓn chän no÷ng vÖ sü tinh anh . <enter> h«m nay lµ ®Ó m­u cÇu ®¹i sù, Bæn Trang chóng t«i nguyÖn lßng më cöa KiÕm Gia ®Ó cho nh÷ng anh hïng vâ l©m kh¾p n¬i héi tô cïng chung chİ h­íng rÌn luyÖn vâ c«ng v× n­íc b¸o ©n, ®ång thêi còng cèng hiÕn tÊt c¶ nh÷ng thÇn binh lîi khİ cña Bæn Trang, nh÷ng b¸u vËt ®ã sÏ d©ng tÆng cho nh÷ng anh hïng kiÖt xuÊt , nh­ng ®Ó t×m ra mét cao thñ ch©n chİnh th× thËt lµ vÜ ®¹i. §¹i hiÖp lÇn nµy ®Õn ®©y, Bæn Trang ta qu¶ lÊy lµm vinh h¹nh v« cïng. §©y lµ tİn vËt cña Bæn Trang<color=red> “Ngäc Long LÖnh Bµi” <color>, cã tİn vËt nµy trªn tay, ®¹i hiÖp cã thÓ ®i vµo KiÕm Gia bÊt cø lóc nµo. Mong r»ng ®¹i hiÖp cã thÓ qua viÖc huÊn luyÖn t¹i ®©y, nhËn ®­îc nh÷ng trang bŞ cùc phÈm, sím muén g× còng cã ngµy®Òn ©n b¸o quèc.", player:GetName()),
				1,
				"BiÕt råi/Cancel")
			if (player:AddItem(6, 1, 2623, 1, 0, 0) > 0) then
				player:SetTask(TASK_MAZEINVITATION, 2)
			end
		elseif (nTask == 2) then
			player:Say("Ng­¬i ®· hoµn thµnh nhiÖm vô nµy råi, kh«ng cÇn ph¶i lµm l¹i ®©u")		
		end
	elseif (nIndex ~= 4) then
		player:Say("Tİnh n¨ng nµy t¹m thêi ch­a më.")
	end
end

-- ÁøÒ©Ê¦
NpcLiuyaoshi = {}
function NpcLiuyaoshi:Say(player)
	player:Sale(99, 1)
end

-- Ğ¡ÖéÖé
NpcXiaozhuzhu = {
	m_Caption = "Chµo ®¹i hiÖp, ta lµ mét ng­êi con g¸i nghiªng n­íc nghiªng thµnh, tuyÕt nh­êng mµu da Ngäc Long S¬n Trang ®Ö nhÊt mü nh©n TiÓu Ch©u Ch©u, xin hái ®¹i hiÖp kiÕm ta cã chuyÖn g× xin chØ gi¸o?",
	m_Options = {
		"Giíi thiÖu vÒ Phã B¶n KiÕm Gia",
		"B¸o danh vµo KiÕm Gia",
		--"KiÓm tra sè lÇn h«m nay ta cã thÓ ®i vµo KiÕm Gia",
		"Ta chØ ghĞ th¨m",
	}
}
NpcXiaozhuzhu.tbTSK_JoinTotal = 3075
function NpcXiaozhuzhu:Say(player)
	return self.m_Caption, self.m_Options
end

function NpcXiaozhuzhu:CheckTime()
	if (LIMITS.FLAG_CHECKTIME == 0) then
		return 1
	end
	local _, _, _, _, m = MakeDateTime(5, GetCurServerTime())
	if (m > 30) then
		return 0
	else
		return 1
	end
end

function NpcXiaozhuzhu:CheckTeam(player)
	local count = player:GetTeamSize()
	if (count < LIMITS.MIN_TEAMSIZE) then
		player:Say("Tõ 6-8 ng­êi cÊp 120 trë lªn cïng nhau tæ ®éi míi ®­îc ®i vµo.")
		return 0
	elseif (self:CheckTime() == 0) then
		player:Say("ChØ cã thÓ b¸o danh sau ®Çu mçi giê vµ tr­íc 30 phót.")
		return 0
	end
	local mapid, _, _ = player:GetWorldPos()
	for i = 1, count do
		local index = player:GetTeamMember(i)
		local mate = PlayerList:GetPlayer(index)
		if (not mate) then
			return 0
		elseif (mate:GetLevel() < LEVEL_MIN) then
			player:Say(format("Thµnh viªn tæ ®éi<color=red>%s<color> ®¼ng cÊp ch­a ®ñ.", mate:GetName()))
			return 0
		elseif(self:VnCheckNLPass(mate) == 0) then	--KiÓm tra ngoc long lÖnh bµi
			player:Say(format("Xin thø lçi,<color=red>%s<color> kh«ng cã Ngäc Long LÖnh Bµi. Kh«ng ®ñ ®iÒu kiÖn ®i vµo KiÕm Gia tiÕn hµnh thİ luyÖn.", mate:GetName()))
			return 0
		elseif (self:VnGetJoinTotal(mate) == 0) then --KiÓm tra sè lÇn ®i
			player:Say(format("<color=red>%s<color> H«m nay hÕt sè lÇn ®i vµo thİ luyÖn ë KiÕm Gia råi.", mate:GetName()))
			return 0	
--		elseif (MazePermission:CheckPermission(mate) == 0) then
--			player:Say(format("Xin thø lçi,<color=red>%s<color> kh«ng ®ñ ®iÒu kiÖn ®i vµo KiÕm Gia tiÕn hµnh thİ luyÖn.", mate:GetName()))
--			return 0
--		elseif (MazePermission:QueryLeftCount(mate) == 0) then
--			player:Say(format("<color=red>%s<color>H«m nay hÕt sè lÇn ®i vµo thİ luyÖn ë KiÕm Gia råi.", mate:GetName()))
--			return 0
		else
			local m, _, _ = mate:GetWorldPos()
			if (m ~= mapid) then
				player:Say("Yªu cÇu tÊt c¶ ®éi viªn ®Òu ë gÇn ®©y th× míi cã thÓ tiÕn hµnh b¸o danh tham gia.")
				return 0
			end
		end
	end
	return 1
end

function NpcXiaozhuzhu:Enter(player, maze)
	AddStatDataTeamEnterMazeCount(1)
	local count = player:GetTeamSize()
	local members = {}
	for i = 1, count do
		local index = player:GetTeamMember(i)
		local mate = PlayerList:GetPlayer(index)
		tinsert(members, mate)
	end
	for i = 1, getn(members) do
		local mate = members[i]
		self:VnSetJoinTotal(mate) --Thªm lÇn ®i KiÕm Gia
		self:VnConsumeNLPass(mate) -- Thu LÖnh Bµi
		maze:Join(mate)
		if (not maze:Enter(mate)) then
			maze:Log(format("[MAZE ERROR]player(%s) failed to enter maze(%d)", mate:GetName(), maze.m_Id))
			player:Msg2Player(format("ThËt sù xin lçi, thµnh viªn ®éi ngò [%s] t¹m thêi kh«ng thÓ ®I vµo KiÕm Gia.", mate:GetName()))
		else
			mate:Msg2Player("Ng­¬i vµ ®éi ngò cña ng­¬i ®· ®i vµo KiÕm Gia, b¾t ®Çu huÊn luyÖn.")
			AddStatDataPlayerEnterMazeCount(1)
			MazePermission:ReduceLeftCount(mate)
		end
	end
end

function NpcXiaozhuzhu:OnAnswer(player, sel)
	if (sel == 1) then
		player:Describe(
			"Tæ ®éi tõ 6-8 ng­êi cÊp 120 trë lªn, vµo ®Çu mçi giê vµ tr­íc 30 phót cã thÓ ®Õn chç cña ta ®Ó b¸o danh, sau khi b¸o danh tiÕn vµo phã b¶n. Sau khi tiÕn vµo phã b¶n ng­¬i sÏ ®­îc chuyÓn ®Õn mét c¨n phßng trong KiÕm Gia, chØ cÇn hoµn thµnh sù kiÖn cña c¨n phßng nµy, ng­¬i vµ tæ ®éi cña ng­¬i sÏ tiÕp tôc tham gia vµo mét c¨n phßng tiÕp theo, nh÷ng cao thñ cã thÓ thµnh c«ng ®i vµo c¨n phßng cuèi cïng th× cã thÓ gÆp ®­îc trang chñ cña Ngäc Long S¬n Trang vµ nhËn ®­îc t­ c¸ch thİ luyÖn cuèi cïng. NÕu nh­ trong lóc chiÕn ®Êu ë trong c¨n phßng ph¸t sinh sù kiÖn cña KiÕm Gia mµ bŞ träng th­¬ng, ng­¬I cã thÓ ®Õn V¹n Hoa Tr× ®Ó trŞ th­¬ng, sau khi trŞ th­¬ng thµnh c«ng sÏ ®­îc quay trë l¹i trong c¨n phßng ®· tong ®­îc v­ît qua tr­íc ®ã, ®­¬ng nhiªn ng­¬i còng cã thÓ sö dông Phôc SŞnh Phï cã ë trªn Kú Tr©n C¸c ®Ó quay trë l¹i c¨n phßng mµ tæ ®éi ng­¬i ®ang chiÕn ®Êu ®Ó tiÕp tôc t¸c chiÕn. Mçi ng­êi mçi lÇn tham gia phã b¶n sÏ cã 3 lÇn c¬ héi ®i vµo vµo V¹n Hoa Tr× ®Ó trŞ th­¬ng. Mçi lÇn tham gia phã b¶n nhiÒu nhÊt lµ 30 phót. Chóc ng­¬i may m¾n",
			1,
			"BiÕt råi/Cancel")
	elseif (sel == 2) then	
		if (player:IsCaptain() == 0) then
			player:Say("ChØ cã ®éi tr­ëng míi cã thÓ dÉn d¾t ®éi ngò ®i vµo KiÕm Gia")
			return
		elseif (self:CheckTeam(player) == 0) then
			return
		elseif (MazeList:CheckCount() == 0) then
			player:Say("Sè l­¬ng më mª cung ®· ®Õn giíi h¹n, xin h·y thö l¹i sau.")
			return
		end
		local maze = Maze:New()
		if (not maze) then
			player:Say("Ng­êi tham gia mª cung ®· ®Çy, xin h·y thö l¹i sau.")
			return
		end
		maze:SetCaptainName(player:GetName())
		self:Enter(player, maze)
	elseif (sel == 3) then
		local count = MazePermission:QueryLeftCount(player)
		if (count <= 0) then
			player:Say("H«m nay ng­¬i kh«ng thÓ ®i vµo KiÕm Gia tiÕn hµnh thİ luyÖn n÷a.")
		else
			player:Say(format("H«m nay tİch lòy sè lÇn ®i vµo KiÕm Gia lµ<color=red>%d<color> lÇn.", count))
		end
	end
end
function NpcXiaozhuzhu:VnCheckNLPass(mate)
	local nOldPlayer = PlayerIndex
	PlayerIndex = mate.m_PlayerIndex
	if CalcItemCount(3, 6, 1, 2623, -1) < 1 then
		PlayerIndex = nOldPlayer
		return 0
	end
	PlayerIndex = nOldPlayer	
	return 1
end
function NpcXiaozhuzhu:VnConsumeNLPass(mate)
	local nOldPlayer = PlayerIndex
	PlayerIndex = mate.m_PlayerIndex
	ConsumeItem(3, 1, 6, 1, 2623, -1)
	PlayerIndex = nOldPlayer
end
function NpcXiaozhuzhu:VnGetJoinTotal(mate)
	local nOldPlayer = PlayerIndex
	PlayerIndex = mate.m_PlayerIndex
	print("PlayerFunLib:GetTaskDaily(self.tbTSK_JoinTotal)",PlayerFunLib:GetTaskDaily(NpcXiaozhuzhu.tbTSK_JoinTotal))
	if PlayerFunLib:GetTaskDaily(NpcXiaozhuzhu.tbTSK_JoinTotal) >= 3 then
		PlayerIndex = nOldPlayer
		return 0
	end
	PlayerIndex = nOldPlayer
	return 1
end
function NpcXiaozhuzhu:VnSetJoinTotal(mate)
	local nOldPlayer = PlayerIndex
	PlayerIndex = mate.m_PlayerIndex
	PlayerFunLib:AddTaskDaily(NpcXiaozhuzhu.tbTSK_JoinTotal, 1);
	print("PlayerFunLib:GetTaskDaily(self.tbTSK_JoinTotal)",PlayerFunLib:GetTaskDaily(NpcXiaozhuzhu.tbTSK_JoinTotal))
	PlayerIndex = nOldPlayer
end
function LoadNpc()
	DlgNpcManager:AddNpc("Chu Qu©n", 1614, 949, 49344, 102720, NpcZhoujun)
	DlgNpcManager:AddNpc("§­êng Vò", 1615, 949, 49408, 101408)
	DlgNpcManager:AddNpc("V­¬ng Binh", 1616, 949, 49152, 101856)
	DlgNpcManager:AddNpc("Vu KhiÕt", 1617, 949, 49536, 100576)
	DlgNpcManager:AddNpc("Tr­¬ng Chiªu", 1618, 949, 49760, 100576)
	DlgNpcManager:AddNpc("§æng Chİ", 1619, 949, 49760, 103488)
	DlgNpcManager:AddNpc("TiÓu Chu Chu.", 1620, 949, 50880, 100736, NpcXiaozhuzhu)
	DlgNpcManager:AddNpc("LiÔu D­îc S­", 1621, 949, 50496, 100608, NpcLiuyaoshi)
	DlgNpcManager:AddNpc("Xa phu", 238, 949, 51264, 101984, NpcChefu)
end

AutoFunctions:Add(LoadNpc)
