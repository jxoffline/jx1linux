--Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\objbuffer_head.lua")
Include("\\script\\global\\judgeoffline_limit.lua")
Include("\\script\\lib\\pay.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\vng_lib\\vngtranslog.lua")
IncludeLib("SETTINGS")
SCRIPT_TREE = "\\script\\vng_event\\trongcaythang112011\\tree.lua"
LOG_HEAD = "Event_TrongCay"
tbTaskInfo = {
	[1] = 
	{
		nTaskID = 2914,
		nStartBit = 1,
		nBitCount = 12,
		nMaxValue = 900,
	},
	[2] = 
	{
		nTaskID = 2914,
		nStartBit = 13,
		nBitCount = 12,
		nMaxValue = 1501,
	},
}
tbKimLangXuanUseCount = {
	nTaskID = 2914,
	nStartBit = 25,
	nBitCount = 6,
	nMaxValue = 20,
}

tbTreeMap = {
	20,		
	53,		
	174,
	121,
	153,
	101,
	99,
	100,
	1,		
	11,	
	37,	
	78,	
	80,
	162,
	176,
}

tbTreeName = {
	[1] = "C©y Hoa Hång",
	[2] = "C©y §a",
--	[3] = "Thiªn TuÕ ThÞnh V­îng",
--	[4] = "Thiªn TuÕ Tµi Léc",
--	[5] = "Thiªn TuÕ Ngµn N¨m",
--	[6] = "Thiªn TuÕ May M¾n",
--	[7] = "Thiªn TuÕ NguyÖt ThÇn",
--	[8] = "Thiªn TuÕ BÊt Tö",
--	[9] = "Thiªn TuÕ Hoµng Kim",
--	[10] = "Thiªn TuÕ B¹ch Kim",
}
--tbTreeRate = {
--	[1] = 50,
--	[2] = 30,
--	[3] = 13.09,
--	[4] = 3,
--	[5] = 2,
--	[6] = 1,
--	[7] = 0.5,
--	[8] = 0.14,
--	[9] = 0.07,
--	[10] = 0.2,
--}

tbMaterial_ = {
[1] = {tbProp = {4,417,1,1,0,0},nCount=67},
[2] = {tbProp = {6,1,2255,1,0,0},nCount=1},
[3] = {tbProp = {0,6,1,3,3,0},nCount=1},
[4] = {tbProp = {1,4,0,2,0,0},nCount=1},
[5] = {tbProp = {6,1,2255,1,0,0},nCount=1},
[6] = {tbProp = {0,7,6,2,1,0},nCount=1},
[7] = {tbProp = {1,4,0,2,0,0},nCount=1},
[8] = {tbProp = {6,1,2255,1,0,0},nCount=1},
}


_Message =  function (nItemIndex)
	local handle = OB_Create()
	local msg = format("<color=green>Ng­êi ch¬i <color=yellow>%s<color=green> trång C©y §a vµ nhËn ®­îc phÇn th­ëng <color=yellow><%s><color>" ,GetName(),GetItemName(nItemIndex))
	ObjBuffer:PushObject(handle, msg)
	RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
	OB_Release(handle)
end

tbAwardList = 
{
	[1] = {
		{szName = "§iÓm Kinh NghiÖm", nExp=2000000, nRate = 59},
		{szName = "§iÓm Kinh NghiÖm", nExp=4000000, nRate = 20},
		{szName = "§iÓm Kinh NghiÖm", nExp=6000000, nRate = 15},
		{szName = "§iÓm Kinh NghiÖm", nExp=10000000, nRate = 5},
		{szName = "§iÓm Kinh NghiÖm", nExp=20000000, nRate = 1},
	},
	[2] = {
		[1] =	{szName = "§iÓm Kinh NghiÖm", nExp = 6000000},
		[2] = {
			{szName="Kim ¤ LÖnh",tbProp={6,1,2349,1,0,0},nCount=1,nRate=0.05, CallBack = _Message},
			{szName="Kim ¤ Kim Bµi",tbProp={6,1,3001,1,0,0},nCount=1,nRate=0.1},
			{szName="§å Phæ Kim ¤ Kh«i",tbProp={6,1,2982,1,0,0},nCount=1,nRate=0.1},
			{szName="§å Phæ Kim ¤ Y",tbProp={6,1,2983,1,0,0},nCount=1,nRate=0.1},
			{szName="§å Phæ Kim ¤ Hµi",tbProp={6,1,2984,1,0,0},nCount=1,nRate=0.1},
			{szName="§å Phæ Kim ¤ Yªu §¸i",tbProp={6,1,2985,1,0,0},nCount=1,nRate=0.1},
			{szName="§å Phæ Kim ¤ Hé UyÓn",tbProp={6,1,2986,1,0,0},nCount=1,nRate=0.1},
			{szName="§å Phæ Kim ¤ H¹ng Liªn",tbProp={6,1,2987,1,0,0},nCount=1,nRate=0.2},
			{szName="§å Phæ Kim ¤ Béi",tbProp={6,1,2988,1,0,0},nCount=1,nRate=0.1},
			{szName="§å Phæ Kim ¤ Th­îng Giíi",tbProp={6,1,2989,1,0,0},nCount=1,nRate=0.1},
			{szName="§å Phæ Kim ¤ H¹ Giíi",tbProp={6,1,2990,1,0,0},nCount=1,nRate=0.1},
			{szName="§å Phæ Kim ¤ KhÝ Giíi",tbProp={6,1,2991,1,0,0},nCount=1,nRate=0.05},
			{szName="Kim Hoa Chi B¶o",tbProp={6,1,3002,1,0,0},nCount=1,nRate=0.2, CallBack = _Message},
			{szName="PhØ Thóy Chi B¶o",tbProp={6,1,3003,1,0,0},nCount=1,nRate=0.1, CallBack = _Message},
			{szName="Thanh C©u Th¹ch",tbProp={6,1,2710,1,0,0},nCount=2,nRate=0.2},
			{szName="V©n Léc Th¹ch",tbProp={6,1,2711,1,0,0},nCount=2,nRate=0.1},
			{szName="Th­¬ng Lang Th¹ch",tbProp={6,1,2712,1,0,0},nCount=1,nRate=0.2},
			{szName="Ngò Hµnh Kú Th¹ch",tbProp={6,1,2125,1,0,0},nCount=1,nRate=25},
			{szName="S¸t Thñ Gi¶n lÔ hép",tbProp={6,1,2339,1,0,0},nCount=1,nRate=1},
			{szName="Thiªn Long LÖnh",tbProp={6,1,2256,1,0,0},nCount=1,nRate=1, nExpiredTime = 20111208},
			{szName="HuyÕt ChiÕn LÖnh Kú LÔ Hép",tbProp={6,1,2401,1,0,0},nCount=1,nRate=1},
			{szName="Viªm §Õ LÖnh",tbProp={6,1,1617,1,0,0},nCount=1,nRate=0.5, nExpiredTime = 20111208},
			{szName="Anh Hïng ThiÕp",tbProp={6,1,1604,1,0,0},nCount=1,nRate=1.5},
			{szName="Tiªu Diªu T¸n",tbProp={6,1,2831,1,0,0},nCount=1,nRate=1, nExpiredTime = 20111208},
			{szName="Cöu Ch©u LÖnh",tbProp={6,1,30117,1,0,0},nCount=1,nRate=1},
			{szName="Ch×a Khãa Nh­ ý",tbProp={6,1,2744,1,0,0},nCount=2,nRate=1, nExpiredTime = 20111208},
			{szName="Hoµn Hån §¬n",tbProp={6,1,2837,1,0,0},nCount=1,nRate=5, nExpiredTime = 20111208},
			{szName="H¶i long ch©u",tbProp={6,1,2115,1,0,0},nCount=1,nRate=1, nExpiredTime = 20111208},
			{szName = "§iÓm Kinh NghiÖm", nExp=5000000,nRate=35},
			{szName = "§iÓm Kinh NghiÖm", nExp=7000000,nRate=16},
			{szName = "§iÓm Kinh NghiÖm", nExp=10000000,nRate=6},
			{szName = "§iÓm Kinh NghiÖm", nExp=15000000,nRate=1.5},
			{szName = "§iÓm Kinh NghiÖm", nExp=20000000,nRate=0.5},
		},
	},
}

tbTreeList = {}
tbSeed = {}
tbTree = {}
tbTeam = {}
tbMaintainState = {}
tbAwardState = {}
tbShowState = {}

function clone(obj)
	local otype = type(obj)
	if (otype == "number") then
		return obj
	elseif (otype == "string") then
		local ret = obj
		return ret
	elseif (otype == "nil") then
		return obj
	elseif (otype == "table") then
		local ret = {}
		for key, val in obj do
			ret[clone(key)] = clone(val)
		end
		return ret
	else
		return obj
	end
end

function dialog_tree()
	local npc = GetLastDialogNpc()
	local tree = tbTreeList[npc]
	if (tree) then
		tree:Dialog()
	end
end

function select_tree()
	local npc = GetLastDlgNpc()
	if (npc > 0) then
		local tree = tbTreeList[npc]
		if (tree) then
			tree:Select()
		end
	end
end

function ontime(npcidx)
	local tree = tbTreeList[npcidx]
	if (tree) then
		return tree:Upgrade()
	else
		return 0, 0
	end
end

function tbSeed:InMapList(MapList)
	local MapId, _, _ = GetWorldPos()
	for i = 1, getn(MapList) do
		if (MapId == MapList[i]) then
			return 1
		end
	end
	return 0
end

-- DEBUG
function getplantcount()
	return tbSeed:GetPlantCount()
end

function setplantcount(Count)
	tbSeed:SetPlantCount(Count)
end

function addplantcount()
	tbSeed:AddPlantCount()
end
--Tæng sè c©y ®· sö dông trong suèt event
function tbSeed:GetPlantCount(kind)
	return  tbVNG_BitTask_Lib:getBitTask(tbTaskInfo[kind])
end

function tbSeed:AddPlantCount(kind)
	tbVNG_BitTask_Lib:addTask(tbTaskInfo[kind], 1)
	if kind == 1 then
		local tbLogTittle = {
			[500] = "SuDungHatGiongHoaHong500Lan",
			[900] = "SuDungHatGiongHoaHong900Lan",
		}
		local nUsedCount = self:GetPlantCount(kind)
		if tbLogTittle[nUsedCount] then
			tbLog:PlayerActionLog(LOG_HEAD,tbLogTittle[nUsedCount])
			tbVngTransLog:Write("201111_EventTrongCay/", 19, tbLogTittle[nUsedCount], "N/A", 1)
		end
	elseif kind == 2 then
		local tbLogTittle = {
			[50] = "SuDung50LanHatGiongCayDa",
			[100] = "SuDung100LanHatGiongCayDa",
			[200] = "SuDung200LanHatGiongCayDa",
			[300] = "SuDung300LanHatGiongCayDa",
			[400] = "SuDung400LanHatGiongCayDa",
			[500] = "SuDung500LanHatGiongCayDa",
			[600] = "SuDung600LanHatGiongCayDa",
			[700] = "SuDung700LanHatGiongCayDa",
			[800] = "SuDung800LanHatGiongCayDa",
			[900] = "SuDung900LanHatGiongCayDa",
			[1000] = "SuDung1000LanHatGiongCayDa",
			[1100] = "SuDung1100LanHatGiongCayDa",
			[1200] = "SuDung1200LanHatGiongCayDa",
			[1300] = "SuDung1300LanHatGiongCayDa",
			[1400] = "SuDung1400LanHatGiongCayDa",
			[1501] = "SuDung1500LanHatGiongCayDa",
		}
		local nUsedCount = self:GetPlantCount(kind)
		if tbLogTittle[nUsedCount] then
			tbLog:PlayerActionLog(LOG_HEAD,tbLogTittle[nUsedCount])
			tbVngTransLog:Write("201111_EventTrongCay/", 19, tbLogTittle[nUsedCount], "N/A", 1)
		end
	end
	--print(tbVNG_BitTask_Lib:getBitTask(tbTaskInfo[kind]))
end

---- DEBUG
--function tbSeed:SetPlantCount(Count)
--	local curr_date = tonumber(GetLocalDate("%y%m%d"))
--	TaskManager:SetTask(TASKGROUP_WINTERSWEET, TASKINDEX_DATE, curr_date)
--	TaskManager:SetTask(TASKGROUP_WINTERSWEET, TASKINDEX_COUNT, Count)
--end

function tbSeed:Check(kind)
	if (tbSeed:InMapList(tbTreeMap) == 0 or GetFightState() == 1) then
		Say("ChØ ®­îc trång c©y t¹i n¬i phi chiÕn ®Êu thµnh thÞ, t©n thñ th«n!")
		return 0
	end

	if (offlineCheckPermitRegion() == 0) then
		Say("Kh«ng ®­îc trång c©y t¹i nh÷ng n¬i gÇn xa phu hoÆc xung quanh nh÷ng n¬i ®«ng ng­êi")
		return 0
	end
	local mate_name = GetName()
	if ST_GetTransLifeCount() < 1 and (GetLevel() < 50) then
		Say(format("Nh©n vËt %s ch­a ®ñ cÊp 50!", mate_name))
		return 0
	end		
	local nCount = tbVNG_BitTask_Lib:getBitTask(tbTaskInfo[kind])
	local nMaxCount = 0
	if kind == 1 then		
		nMaxCount = 500 + tbVNG_BitTask_Lib:getBitTask(tbKimLangXuanUseCount)*20
	else
		nMaxCount = tbTaskInfo[kind].nMaxValue
	end
	if nCount >= nMaxCount  then
		Talk(1, "", "Trång c©y ®· ®¹t giíi h¹n, kh«ng thÓ trång thªm")
		return 0
	end
	return 1
end

function tbSeed:RandomKind()
	local num = floor(random(1, 10000))
	local sum = 0
	local count = getn(tbTreeRate)
	for i = 1, count do
		sum = floor(sum + tbTreeRate[i]*100)
		if (num <= sum) then
			return i
		end
	end	
	return count
end

function tbSeed:Grow(Kind)
	local self_name = GetName()
	local members = {self_name}
	local tree = tbTree:New(Kind, members)
	if (not tree) then
		tbLog:PlayerActionLog(LOG_HEAD,"TrongCayThatBai")
		return 0
	end	
	tbSeed:AddPlantCount(Kind)
	if Kind == 2 and tbVNG_BitTask_Lib:getBitTask(tbTaskInfo[Kind]) == 1501 then
		local tbAward = {szName="R­¬ng ThÇn BÝ",tbProp={6,1,30158,1,0,0},nCount=1, nExpiredTime = 20111201}
		local tbTranslog = {strFolder ="201111_EventTrongCay/", nPromID = 19, nResult = 1}	
		tbAwardTemplet:Give(tbAward, 1, {"Event_TrongCay", "SuDung1501LanHatGiongCayDaNhanRuongThanBi", tbTranslog})
	end
	if (Kind == 7 or Kind == 8 or Kind == 9 or Kind == 10) then
		local handle = OB_Create()
		local msg = format("Chóc mõng cao thñ <color=yellow>%s<color> ®· trång thµnh c«ng <color=yellow>%s<color>!", GetName(), tbTreeName[Kind])
		local _, nTongID = GetTongName()
		Msg2Tong(nTongID, msg)
		ObjBuffer:PushObject(handle, msg)
		RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
		OB_Release(handle)
	end
	tbLog:PlayerActionLog(LOG_HEAD,"TrongCayThanhCong", tree.Name)
	return 1
end

function tbTeam:New(Members)
	local tb = clone(tbTeam)
	tb.MemberList = Members
	tb.Score = 0
	return tb
end

function tbTeam:FindMember(Name)
	for i = 1, getn(self.MemberList) do
		if (self.MemberList[i] == Name) then
			return 1
		end
	end
	return 0
end

function tbTeam:BroadCast(Msg)
	local player = PlayerIndex
	for i = 1, getn(self.MemberList) do
		local member = SearchPlayer(self.MemberList[i])
		if (member > 0) then
			PlayerIndex = member
			Msg2Player(Msg)
		end
	end
	PlayerIndex = player
end

function tbTree:New(Kind, Members)
	local tb = clone(tbTree)
	tb.Team = tbTeam:New(Members)
	local pos = {}
	pos[1] = SubWorld
	_, pos[2], pos[3] = GetWorldPos()
	pos[2] = pos[2] * 32
	pos[3] = pos[3] * 32
	tb.Pos = pos
	tb.Kind = Kind
	tb.Name = format("%s[%s]", tbTreeName[Kind], GetName())
	tb.Npc = AddNpc(tbMaintainInfo[1].Npc[Kind], 1, pos[1], pos[2], pos[3], 1, tb.Name)
	if (tb.Npc > 0) then
		SetNpcScript(tb.Npc, SCRIPT_TREE)
		tbLog:PlayerActionLog(LOG_HEAD, "TrongCayThanhCong", tb.Name, pos[1]..", "..pos[2]..", "..pos[3])	
	else
		tbLog:PlayerActionLog(LOG_HEAD, "TrongCayThatBai", tb.Name)
		return nil
	end

	local state = tbMaintainState:New(tb)
	--state:NotifyTeam(tb.Team)
	tb.State = state

	tbTreeList[tb.Npc] = tb
	-- ¼ÓÈë¶¨Ê±Æ÷
	AddTimer(state.Timeout * 18, "ontime", tb.Npc)
	return tb
end

function tbTree:Dialog()
	local name = GetName()
	if (self.Team:FindMember(name) == 0) then
		Say("§©y kh«ng ph¶i lµ c©y trång cña c¸c h¹.")
	else
		self.State:Dialog()
	end
end

function tbTree:Select()
	local name = GetName()
	if (self.Team:FindMember(name) == 1) then
		self.State:Process(self, self.Team, name)
	end
end
tbFicusSeed={}
function tbFicusSeed:CheckMaterials()
	tbRoomItems = GetRoomItems(0)
	for i=1,getn(tbRoomItems)do
		if not tbMaterial_[i] then
			return 0
		end
		local nG,nD,nP,nG1,nG2,nG3=GetItemProp(tbRoomItems[i])
		if nG ~= tbMaterial_[i].tbProp[1] or nD ~= tbMaterial_[i].tbProp[2] or nP ~= tbMaterial_[i].tbProp[3] or nG1 ~= tbMaterial_[i].tbProp[4] or nG2 ~= tbMaterial_[i].tbProp[5] or nG3 ~= tbMaterial_[i].tbProp[6] or tbMaterial_[i].nCount ~= GetItemStackCount(tbRoomItems[i]) then
			return 0
		end		
	end
	return 1
end

function tbTree:Upgrade()
	local oldnpc = self.Npc	
	local state = self.State:NextState(self, self.Team)
	if (not state) then
		DelNpc(self.Npc)		
		if self.State.nDidGetAward == 1 then --®· nhËn th­ëng
		WriteLog(format("%s\t%s\tCayBienMatDaNhanThuong\t%s\t%s",			
			GetLocalDate("%Y-%m-%d %H:%M:%S"),
			LOG_HEAD,
			self.Name,
			self.State.strName))
		else			
			WriteLog(format("%s\t%s\tCayBienMatChuaNhanThuong\t%s\t%s",			
			GetLocalDate("%Y-%m-%d %H:%M:%S"),
			LOG_HEAD,
			self.Name,
			self.State.strName))
		end
		tbTreeList[self.Npc] = nil
		return 0, 0
	else
		state:NotifyTeam(self.Team, self.Kind)
		self.State = state
		local newnpc = self.Npc
		if (oldnpc ~= newnpc) then
			tbTreeList[oldnpc] = nil
			tbTreeList[newnpc] = self
		end
		return state.Timeout * 18, self.Npc
	end
end

tbMaintainInfo = {
	[1] = {
		Dlg = "Bãn ph©n cho c©y thiªn tuÕ",
		Msg = "H·y tiÕn hµnh bãn ph©n cho c©y thiªn tuÕ",
		Err = "§¹i hiÖp ®· bãn ph©n cho c©y råi",
		Npc = {1253, 1530},
		},
	[2] = {
		Dlg = "T­íi n­íc cho c©y thiªn tuÕ",
		Msg = "H·y tiÕn hµnh t­íi n­íc cho c©y thiªn tuÕ",
		Err = "§¹i hiÖp ®· t­íi n­íc cho c©y råi.",
		Npc = {1254, 1531},
		},
	[3] = {
		Dlg = "DiÖt cá d¹i cho c©y",
		Msg = "H·y tiÕn hµnh diÖt cá d¹i cho c©y",
		Err = "§¹i hiÖp ®· diÖt cá cho c©y råi",
		Npc = {1255, 1453},
		},
--	[4] = {
--		Dlg = "B¾t s©u cho c©y",
--		Msg = "H·y tiÕn hµnh b¾t s©u cho c©y",
--		Err = "§¹i hiÖp ®· b¾t s©u cho c©y råi",
--		Npc = 1532,
--		},
	[4] = {
		Dlg = "TrÈy l¸ cho c©y",
		Msg = "H·y tiÕn hµnh trÈy l¸ cho c©y",
		Err = "§¹i hiÖp ®· trÈy l¸ råi",
		Npc = {1255, 1453},
		}
}

function tbMaintainState:New(Tree)
	local tb = clone(tbMaintainState)
	tb.Turn = 1
	tb.Step = 1
	tb.OpFlag = {}
	tb.Time = tbMaintainState:Now()
	tb.Timeout = 30
	--print(format("[%s]Tree[%d] begin to maintain",
--		GetLocalDate("%Y-%m-%d %H:%M:%S"),
--		Tree.Npc))
	return tb
end

function tbMaintainState:Dialog()
	Say("Bá c«ng søc trång c©y ¾t cã ngµy ®­îc h­ëng hoa th¬m, tr¸i ngät!",
		1,
--		format("%s/select_tree", tbMaintainInfo[self.Step].Dlg),
		"Ta chØ ®Õn ch¬i/Cancel")
end

function tbMaintainState:NotifyTeam(Team)
--	local msg = tbMaintainInfo[self.Step].Msg
--	Team:BroadCast(msg)
end

function tbMaintainState:Now()
	return GetLocalTime()
end

function tbMaintainState:CaculateScore(Seconds)
	if (Seconds >= 46) then
		return 2
	elseif (Seconds >= 36) then
		return 4
	elseif (Seconds >= 26) then
		return 5
	elseif (Seconds >= 16) then
		return 3
	else
		return 1
	end
end

function tbMaintainState:Process(Tree, Team, Name)
--	if (PlayerFunLib:CheckItemInBag({tbProp={6,1,2348,1,-1,0}},1,"CÇn %d HuyÒn Thiªn Chïy, c¸c h¹ ®em kh«ng ®ñ sè l­îng!") ~= 1) then
--		return
--	end
	
	if (Team.MemberList[self.Turn] ~= Name) then
		Say("VÉn ch­a ®Õn l­ît, xin ®îi mét lóc n÷a")
		return
	elseif (self.OpFlag[Name] == 1) then
		Say(tbMaintainInfo[self.Step].Err)
		return
	end
	self.OpFlag[Name] = 1
	local current = tbMaintainState:Now()
	
--	PlayerFunLib:ConsumeEquiproomItem({tbProp={6,1,2348,1,-1,0},},1)
	-- LOG
	WriteLog(format("[%s %s]%s maintain Tree[%d]",
		LOG_HEAD,
		GetLocalDate("%Y-%m-%d %H:%M:%S"),
		Name,
		Tree.Npc))
	-- ¸ø¶ÓÎé¼Ó·Ö
	local add = tbMaintainState:CaculateScore(current - self.Time)
	Team.Score = Team.Score + add
	local msg = format("NhËn ®­îc %d ®iÓm, hiÖn t¹i tæng ®iÓm lµ %d!", add, Team.Score)
	Team:BroadCast(msg)
	-- LOG
	WriteLog(format("[%s %s]Tree[%d] add score(%d), total(%d)",
		LOG_HEAD,
		GetLocalDate("%Y-%m-%d %H:%M:%S"),
		Tree.Npc,
		add,
		Team.Score))
end

function tbMaintainState:NextState(Tree, Team)
	if (self.Step >= getn(tbMaintainInfo)) then
		return tbAwardState:New()
	else
		self.OpFlag = {}
		self.Time = tbMaintainState:Now()
		self.Step = self.Step + 1
		local count = getn(Team.MemberList)
		self.Turn = mod(self.Turn, count) + 1
		DelNpc(Tree.Npc)
		local nNpcID = tbMaintainInfo[self.Step].Npc[Tree.Kind]		
		local npc = AddNpc(nNpcID, 1, Tree.Pos[1], Tree.Pos[2], Tree.Pos[3], 1, Tree.Name)
		if (npc > 0) then
			WriteLog(format("[%s %s]Tree[%d] upgrade to Tree[%d]",
				LOG_HEAD,
				GetLocalDate("%Y-%m-%d %H:%M:%S"),
				Tree.Npc,
				npc))
			SetNpcScript(npc, SCRIPT_TREE)
			Tree.Npc = npc
		end
		return self
	end
end

function tbAwardState:New()
	local tb = clone(tbAwardState)
	tb.AwardFlag = {}
	tb.Timeout = 120
	return tb
end

function tbAwardState:Dialog()
--	Say("§©y lµ 1 c©y thiªn tuÕ thËt ®Ñp",
--		2,
--		"Ta muèn nhËn th­ëng/select_tree",
--		"Ta chØ ®Õn ch¬i/Cancel")
	if CalcFreeItemCellCount() <= 10 then
		Talk(1, "", "Xin h·y chõa Ýt nhÊt 10 « trèng trong hµnh trang råi míi nhËn th­ëng")
		return
	end
	select_tree()
end

function tbAwardState:Process(Tree, Team, Name)
	if (self.AwardFlag[Name] == 1) then
		Say("§¹i hiÖp ®· nhËn th­ëng råi")
		return
	end
	
	local tbAward = tbAwardState:GetAward(Tree.Kind)	
	if tbAward then
		self.AwardFlag[Name] = 1
		local tbTranslog = {strFolder ="201111_EventTrongCay/", nPromID = 19, nResult = 1}
		tbAwardTemplet:Give(tbAward, 1, {"Event_TrongCay", "NhanPhanThuong["..tbTreeName[Tree.Kind].."]", tbTranslog})
	end
--	if (exp > 0) then
--		AddOwnExp(exp)
--		Team:BroadCast(format("%s ®· nhËn ®­îc phÇn th­ëng kinh nghiÖm lµ %d!", Name, exp))
--	else
--		Say("Thµnh thËt ®¸ng tiÕc, ®¹i hiÖp kh«ng cã phÇn th­ëng nµo. Xin h·y nç lùc lÇn tíi!")
--	end
--	self.AwardFlag[Name] = 1
end

function tbAwardState:GetAward(kind)
	return tbAwardList[kind]
end

function tbAwardState:NotifyTeam(Team, Kind)
	Team:BroadCast(format("<color=green>Chóc mõng ®¹i hiÖp ®· trång ®­îc %s thËt ®Ñp, h·y nhanh ch©n ®Õn ®ã nhËn th­ëng.<color>", tbTreeName[Kind]))
end

function tbAwardState:NextState(Tree, Team)
	local tb = tbShowState:New()
	local strName = Team.MemberList[1]
	tb.strName = strName
	if self.AwardFlag and self.AwardFlag[strName] then
		tb.nDidGetAward = self.AwardFlag[strName]
	else 
		tb.nDidGetAward = 0
	end
	return tb
end

function tbShowState:New()
	local tb = clone(tbShowState)
	tb.Timeout = 3
	return tb
end

function tbShowState:Dialog()
	Say("Bá c«ng søc trång c©y ¾t cã ngµy ®­îc h­ëng hoa th¬m, tr¸i ngät!")
end

function tbShowState:Process(Tree, Team, Name)
	-- Do nothing
end

function tbShowState:NotifyTeam(Team)
	Team:BroadCast("Thêi gian nhËn th­ëng kÕt thóc")
end

function tbShowState:NextState(Tree, Team)
	return nil
end