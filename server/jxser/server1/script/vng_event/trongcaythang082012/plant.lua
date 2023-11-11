Include("\\script\\activitysys\\\playerfunlib.lua")
Include("\\script\\lib\\objbuffer_head.lua")
Include("\\script\\global\\judgeoffline_limit.lua")
Include("\\script\\lib\\pay.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\vng_event\\trongcaythang082012\\awardlist.lua")
Include("\\script\\lib\\log.lua")
IncludeLib("SETTINGS")
SCRIPT_TREE = "\\script\\vng_event\\trongcaythang082012\\tree.lua"

LOG_HEAD = "EventTrongCay30Thang4"
--sè lÇn nhËn th­ëng tõ c©y
tbTaskTreeInfo = {
	[1] = {
		nTaskID = 2948,
		nStartBit = 1,
		nBitCount = 11,
		nMaxValue = 1000,
	},
	[2] = {
		nTaskID = 2948,
		nStartBit = 12,
		nBitCount = 12,
		nMaxValue = 2000,
	},
}

tbTaskInfo = {
	[1] = 
	{
		nTaskID = 2949,
		nStartBit = 1,
		nBitCount = 11,
		nMaxValue = 1000,
	},
	[2] = --Sö dông h¹t gièng c©y ®a, xµi 11 bit
	{
		nTaskID = 2949,
		nStartBit = 12,
		nBitCount = 12,
		nMaxValue = 2000,
	},
}
tbTSK_Reset = {
		nTaskID = 2987,
		nStartBit = 28,
		nBitCount = 1,
		nMaxValue = 1,
	}

tbTreeName = {
	[1] = "C©y Hoa Hång",
	[2] = "C©y §a NguyÖt ThÇn",
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

function tbSeed:AddTreePlantCount(kind)
	tbVNG_BitTask_Lib:addTask(tbTaskTreeInfo[kind], 1)	
end	
--Tong so cay da nhan thuong
function tbSeed:GetTreePlantCount(kind)
	return  tbVNG_BitTask_Lib:getBitTask(tbTaskTreeInfo[kind])
end

--Tæng sè hat giong ®· sö dông trong suèt event
function tbSeed:GetPlantCount(kind)
	return  tbVNG_BitTask_Lib:getBitTask(tbTaskInfo[kind])
end

--reset c¸c task cò
function tbSeed:ResetOldTask()
	if tbVNG_BitTask_Lib:getBitTask(tbTSK_Reset) == 0 then
		tbVNG_BitTask_Lib:addTask(tbTSK_Reset, 1)
		SetTask(2948, 0)
		SetTask(2949, 0)
	end
end

function tbSeed:AddPlantCount(kind)
	tbVNG_BitTask_Lib:addTask(tbTaskInfo[kind], 1)
	local tbLogTittle = %tbLogTittle[kind]
	local nMaxCount = tbTaskInfo[kind].nMaxValue
	local nUsedCount = self:GetPlantCount(kind)
	if kind == 1 then		
		tbLog:PlayerActionLog(LOG_HEAD,"SuDung1HatGiongHoaHong",  "Tong: "..nUsedCount)
	elseif kind == 2 then
		tbAwardTemplet:Give(%tbAward_A, 1, {LOG_HEAD, "SuDung1HatGiongCayDa", "Tong: "..nUsedCount})
		 if mod(nUsedCount, 2) == 0 and CalcFreeItemCellCount() >= 1 then
		 	tbAwardTemplet:Give(%tbAward_B, 1, {LOG_HEAD, "SuDung2HatGiongCayDa", "Tong: "..nUsedCount})
		 end		
	end
end

--[1] Hoa Hång vµ [2] C©y §a vµ [3] c©y Hoa Hång Gai
function tbSeed:Check(kind)
	tbSeed:ResetOldTask()
	if PlayerFunLib:VnCheckInCity("default") ~= 1 then --KiÓm tra phi chiÕn ®Êu
		return 0
	end

	if (offlineCheckPermitRegion() == 0) then
		Say("Kh«ng ®­îc trång c©y t¹i nh÷ng n¬i gÇn xa phu hoÆc xung quanh nh÷ng n¬i ®«ng ng­êi")
		return 0
	end
	local mate_name = GetName()
	if PlayerFunLib:CheckTotalLevel(150,"default",">=") ~= 1 then
		return 0
	end
	local nCount = tbVNG_BitTask_Lib:getBitTask(tbTaskInfo[kind])
	local nMaxCount = tbTaskInfo[kind].nMaxValue
	if nCount >= nMaxCount  then
		Talk(1, "", "Trång c©y ®· ®¹t giíi h¹n, kh«ng thÓ trång thªm")
		return 0
	end
	if kind == 2 and mod(nCount +1, 2) == 0  and CalcFreeItemCellCount() < 3 then
		Talk(1,"","Hµnh trang cÇn 3 « trèng míi cã thÓ trång")
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
		return 0
	end	
	tbSeed:AddPlantCount(Kind)
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
--		Dlg = "TrÈy l¸ cho c©y",
--		Msg = "H·y tiÕn hµnh trÈy l¸ cho c©y",
--		Err = "§¹i hiÖp ®· trÈy l¸ råi",
--		Npc = {1255, 1453},
--		}
}

function tbMaintainState:New(Tree)
	local tb = clone(tbMaintainState)
	tb.Turn = 1
	tb.Step = 1
	tb.OpFlag = {}
	tb.Time = tbMaintainState:Now()
	tb.Timeout = 30
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
	if (Team.MemberList[self.Turn] ~= Name) then
		Say("VÉn ch­a ®Õn l­ît, xin ®îi mét lóc n÷a")
		return
	elseif (self.OpFlag[Name] == 1) then
		Say(tbMaintainInfo[self.Step].Err)
		return
	end
	self.OpFlag[Name] = 1
	local current = tbMaintainState:Now()
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
	tb.Timeout = 91
	return tb
end

function tbAwardState:Dialog()
--	if CalcFreeItemCellCount() < 4 then
--		Talk(1, "", "Xin h·y chõa Ýt nhÊt 4 « trèng trong hµnh trang råi míi nhËn th­ëng")
--		return
--	end
	select_tree()
end
--1
function tbAwardState:Process(Tree, Team, Name)
	if (self.AwardFlag[Name] == 1) then
		Say("§¹i hiÖp ®· nhËn th­ëng råi")
		return
	end
	if GetNpcParam(Tree.Npc, 1) == 1 then
		Say("C©y ®· nhËn th­ëng.")
		return
	end
	if tbVNG_BitTask_Lib:IsMaxValue(tbTaskTreeInfo[Tree.Kind]) == 1 then
		Say("C¸c h¹ ®· ®¹t tèi ®a sè lÇn nhËn th­ëng tõ c©y "..tbTreeName[Tree.Kind])
		return
	end
	if Tree.Kind == 2 and CalcFreeItemCellCount() < 10 then
		Say("§¹i hiÖp h·y chõa Ýt nhÊt 10 « trèng trong hµnh trang råi míi nhËn th­ëng.")
		return
	end
	local tbAward = tbAwardState:GetAward(Tree.Kind)	
	if tbAward then
		self.AwardFlag[Name] = 1
		SetNpcParam(Tree.Npc, 1, 1)
		tbSeed:AddTreePlantCount(Tree.Kind)  --Tang so lan nhan thuong
		tbAwardTemplet:Give(tbAward, 1, {LOG_HEAD, "NhanPhanThuong["..tbTreeName[Tree.Kind].."]", "Sè lÇn nhËn th­ëng: "..tbSeed:GetTreePlantCount(Tree.Kind)})
	end
end

--function tbAwardState:GetAward(kind)
--	return tbAwardList[kind]
--end
function tbAwardState:GetAward(kind)
	local tbtmp = nil
	if kind == 1 then
		tbtmp = %tbAward_C
	elseif kind == 2 then
		local nGetCount = tbSeed:GetTreePlantCount(kind)
		if %tbAward_E and mod(nGetCount + 1, 33) == 0 then
			tbtmp = %tbAward_E
		else
			tbtmp = %tbAward_D
		end
	end
	return tbtmp
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