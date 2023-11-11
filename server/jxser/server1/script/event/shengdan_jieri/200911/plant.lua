-------------------------------------
-- description 	: °ÚÉèÊ¥µ®Ê÷
-- author		: wangbin
-- date			: 2009.11.25
-------------------------------------

Include("\\script\\lib\\pay.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
IL("SETTING")

GAME_FPS 			= 18
LIMIT_JOINCOUNT		= 7					-- Ã¿Ìì²Î¼Ó´ÎÊýÏÞÖÆ
LIMIT_PLANTCOUNT	= 1					-- Ã¿ÌìÖÖÊ÷´ÎÊýÏÞÖÆ
TASK_JOINDATE  		= 1912				-- YMMDD * 100 + ²Î¼Ó´ÎÊý£¬ÄêÊýÎªµ±Ç°Äê·Ý-2000
TASK_PLANTDATE 		= 1913				-- YMMDD * 100 + ÖÖÊ÷´ÎÊý£¬ÄêÊýÎªµ±Ç°Äê·Ý-2000
LOG_HEAD			= "2009CHRISTMAS"
SCRIPT_TREE			= "\\script\\event\\shengdan_jieri\\200911\\tree.lua"

-- ÐÂÊÖ´åµØÍ¼ID
NewbieMapTable = {
	20,		-- ½­½ò´å
	53,		-- °ÍÁêÏØ
	174,	-- ÁúÈª´å
	121,	-- ÁúÃÅÕò
	153,	-- Ê¯¹ÄÕò
	101,	-- µ¾Ïã´å
	99,		-- ÓÀÀÖÕò
	100,	-- ÖìÏÉÕò
	1,		-- ·ïÏè
	11,		-- ³É¶¼
	37,		-- ãê¾©
	78,		-- ÏåÑô
	80,		-- ÑïÖÝ
	162,	-- ´óÀí
	176,	-- ÁÙ°²
}

-- ½±Àø¾­Ñé±í
AwardTable = {
	Leader = {10000000, 15000000, 20000000},	-- ¶Ó³¤µÄ¹Ì¶¨½±Àø£ºÎ´×ªÉú£¬1×ª£¬2×ª
	Member = {5000000,  8000000,  12000000},	-- ¶ÓÔ±µÄ¹Ì¶¨½±Àø£ºÎ´×ªÉú£¬1×ª£¬2×ª
	Extend = {0, 20, 30, 40, 50, 60, 70, 80}	-- ¶îÍâ½±Àø£º¶ÓÎéÈËÊýÎª1-8ÈËµÄ°Ù·Ö±È
}

-- °´ÕÕÊ¥µ®Ê÷NPCINDEXË÷ÒýµÄ¶ÓÎéÊý¾Ý
TreeTable = {}

function DelTree(TreeIdx)
	DelNpc(TreeIdx)
	TreeTable[TreeIdx] = nil
end

-- ½×¶Î´¦Àíº¯Êý
function Process(TreeIdx, Table)
	DelTree(TreeIdx)
	for Name, Step in Table.MemberState do
		if (Table.Step ~= Step) then
			BroadCast(Table, "C©y gi¸ng sinh ®· biÕn mÊt")
			WriteLog(format("[%s]Tree[%d] timeout: Step(%d), Captain(%s), MemberCount(%d)",
				LOG_HEAD,
				TreeIdx,
				Table.Step,
				Table.Captain,
				Table.MemberCount))
			return 0
		end
	end
	-- ´´½¨ÏÂÒ»¸ö½×¶ÎµÄNPC
	local NextStep = Table.Step + 1
	NewTree = CreateTree(ProcTable[NextStep].NpcId, Table)
	if (NewTree == 0) then
		WriteLog(format("[%s ERROR]Failed to create new tree: Tree[%d], Captain(%s), Step(%d)",
			LOG_HEAD,
			TreeIdx,
			Table.Captain,
			Table.Step))
		return 0
	end
	TreeTable[NewTree] = Table
	BroadCast(Table, ProcTable[NextStep].Hint)
	WriteLog(format("[%s]TreeChange[%d]=>[%d], Captain(%s), CurrentStep(%d)",
		LOG_HEAD,
		TreeIdx,
		NewTree,
		Table.Captain,
		Table.Step))
	return NewTree
end

function Wait(TreeIdx, Table)
	WriteLog(format("[%s]Tree[%d] stop award", LOG_HEAD, TreeIdx))
	return TreeIdx
end

function Destroy(TreeIdx, Table)
	DelTree(TreeIdx)
	WriteLog(format("[%s]Tree[%d] destroy", LOG_HEAD, TreeIdx))
	return 0
end

-- ×°ÊÎÊ¥µ®Ê÷
function DecorateTree(TreeIdx, Table)
	local Step = Table.Step
	local Name = GetName()
	if (Table.MemberState[Name] ~= Step) then
		local Msg = ProcTable[Step].DlgMsg
		BroadCast(Table, format(Msg, Name))
		Table.MemberState[Name] = Step
	else
		Say(ProcTable[Step].ErrMsg)
	end
end

-- ÖÖÊ÷µÄ¶ÓÎéÄÚ¹ã²¥
function BroadCast(Table, Msg)
	local CurrentPlayerIdx = PlayerIndex
	for Name, _ in Table.MemberState do
		PlayerIndex = SearchPlayer(Name)
		if (PlayerIndex > 0) then
			Msg2Player(Msg)
		end
	end
	PlayerIndex = CurrentPlayerIdx
end

-- ÊÇ·ñÔÚ¶ÓÎéÖÐ
function InMemberList(Player, Table)
	for Name, _ in Table.MemberState do
		if (Name == Player) then
			return 1
		end
	end
	return 0
end

-- Áì½±
function Award(TreeIdx, Table)
	local Name = GetName()
	local Step = Table.MemberState[Name]
	if (Step == nil) then
		Say("H·y t×m c©y gi¸ng sinh cña m×nh ®Ó lÜnh th­ëng!")
		return
	elseif (Step == Table.Step) then
		Say("§¹i hiÖp ®· nhËn th­ëng råi!")
		return
	end
	local IsCaptain = 0
	if (Name == Table.Captain) then
		IsCaptain = 1
	end
	local Exp = AwardExp(IsCaptain, ST_GetTransLifeCount(), Table.MemberCount)
	AddOwnExp(Exp)
	Table.MemberState[Name] = Table.Step
	
	Msg2Player(format("Tæ ®éi cã %d ng­êi, ®¹i hiÖp nhËn %u ®iÓm kinh nghiÖm", Table.MemberCount, Exp))
	WriteLog(format("[%s]Tree[%d]: %s get exp(%d)", LOG_HEAD, TreeIdx, Name, Exp))
	Say(format("Chóc mõng ®¹i hiÖp ®· nhËn ®­îc phÇn th­ëng <color=red>%d<color> kinh nghiÖm.", Exp))
end

-- ¼ÆËãÁì½±¾­Ñé
function AwardExp(IsCaptain, TranCount, MemberCount)
	local BaseAward = AwardTable.Member
	local ExtAward = AwardTable.Extend
	if (IsCaptain == 1) then
		BaseAward = AwardTable.Leader
	end
	local BaseIdx = TranCount + 1
	if (BaseIdx > getn(BaseAward)) then
		BaseIdx = getn(BaseAward)
	end
	local ExtIdx = MemberCount
	if (ExtIdx > getn(ExtAward)) then
		ExtIdx = getn(ExtAward)
	end
	local Exp = BaseAward[BaseIdx]
	return Exp + floor(Exp * ExtAward[ExtIdx] / 100)
end

ProcTable = {
	[1] = {
		OnTimeout = Process,					-- ¶¨Ê±Æ÷µ½ÆÚ´¥·¢µÄº¯Êý
		Dialog = DecorateTree,					-- ÓëNPC¶Ô»°Ñ¡Ïî´¥·¢µÄº¯Êý
		Timeout = 60,							-- ¶¨Ê±Æ÷Ê±¼ä£¨ÃëÊý£©
		DlgMsg = "Thµnh viªn %s ®· treo t¸o thµnh c«ng lªn c©y gi¸ng sinh.",	-- ²Ù×÷Íê³ÉÌáÊ¾
		ErrMsg = "§· treo t¸o lªn c©y råi.",			-- ²Ù×÷Ê§°ÜÌáÊ¾
		Hint = "Xin mêi treo t¸o lªn c©y gi¸ng sinh!",			-- ½×¶Î¿ªÊ¼Ê±µÄÌáÊ¾
		Option = "Xin mêi treo t¸o lªn c©y gi¸ng sinh!",		-- ¶Ô»°Ñ¡Ïî,
		NpcId = 1490,							-- ¹âÍºÍºµÄÊ¥µ®Ê÷
		},
	[2] = {
		OnTimeout = Process,
		Dialog = DecorateTree,
		Timeout = 60,
		DlgMsg = "Thµnh viªn %s ®· treo ®Ìn thµnh c«ng lªn c©y gi¸ng sinh.",
		ErrMsg = "§· treo ®Ìn lªn c©y råi",
		Hint = "Xin mêi treo ®Ìn lªn c©y gi¸ng sinh!",
		Option = "Xin mêi treo ®Ìn lªn c©y gi¸ng sinh!",
		NpcId = 1491,	-- ¹ÒÉÏÆ»¹ûµÄÊ¥µ®Ê÷
		},
	[3] = {
		OnTimeout = Process,
		Dialog = DecorateTree,
		Timeout = 60,
		DlgMsg = "Thµnh viªn %s ®· treo kÑo thµnh c«ng lªn c©y gi¸ng sinh.",
		ErrMsg = "§· treo kÑo lªn c©y råi",
		Hint = "Xin mêi treo kÑo lªn c©y gi¸ng sinh",
		Option = "Xin mêi treo kÑo lªn c©y gi¸ng sinh",
		NpcId = 1492,	-- ¹ÒÉÏ¹âÇòµÄÃµ¹åÊ÷
		},
	[4] = {
		OnTimeout = Process,
		Dialog = DecorateTree,
		Timeout = 60,
		DlgMsg = "Thµnh viªn %s ®· treo chu«ng thµnh c«ng lªn c©y gi¸ng sinh.",
		ErrMsg = "§· treo chu«ng lªn c©y råi.",
		Hint = "Xin mêi treo chu«ng lªn c©y gi¸ng sinh.",
		Option = "Xin mêi treo chu«ng lªn c©y gi¸ng sinh.",
		NpcId = 1493,	-- ¹ÒÉÏÌÇ¹ûµÄÃµ¹åÊ÷
		},
	[5] = {
		OnTimeout = Process,
		Dialog = DecorateTree,
		Timeout = 60,
		DlgMsg = "Thµnh viªn %s ®· treo ng«i sao thµnh c«ng lªn c©y gi¸ng sinh.",
		ErrMsg = "§· treo ng«i sao lªn c©y råi",
		Hint = "Xin mêi treo ng«i sao lªn c©y gi¸ng sinh!",
		Option = "Xin mêi treo ng«i sao lªn c©y gi¸ng sinh!",
		NpcId = 1494,	-- ¹ÒÉÏÖÓµÄÃµ¹åÊ÷I
		},
	[6] = {
		OnTimeout = Wait,	
		Dialog = Award,
		Timeout = 300,
		Hint = "Chóc mõng c¸c ®¹i hiÖp, chóng ta ®· cã 1 c©y gi¸ng sinh thËt léng lÉy vµ Êm ¸p!",
		Option = "Ta muèn nhËn th­ëng",
		NpcId = 1495,	-- ¹ÒÉÏÐÇÐÇµÄÃµ¹åÊ÷
		},
	[7] = {
		OnTimeout = Destroy,
		Timeout = 24 * 3600 - 300,
		Option = nil,
	}
}

-- ´´½¨Ê¥µ®Ê÷
function CreateTree(Id, Table)
	local TreeIdx = AddNpc(Id, 1, Table.Pos[1], Table.Pos[2] * 32, Table.Pos[3] * 32, 1, Table.Captain)
	if (TreeIdx <= 0) then
		return 0
	end
	SetNpcScript(TreeIdx, SCRIPT_TREE)
	return TreeIdx
end

-- ¼ì²éÊÇ·ñÔÚÐÂÊÖ´å
function InNewbieCity()
	local MapId, _, _ = GetWorldPos()
	for i = 1, getn(NewbieMapTable) do
		if (MapId == NewbieMapTable[i]) then
			return 1
		end
	end
	return 0
end

-- °ÑÈÕÆÚºÍ´ÎÊýºÏ³ÉÈÎÎñ±äÁ¿Öµ
function EncodeTask(Date, Count)
	return Date * 100 + Count
end

-- °ÑÈÎÎñ±äÁ¿Öµ·Ö½â³ÉÈÕÆÚºÍ´ÎÊý
function DecodeTask(Task)
	local Date = floor(Task / 100)
	local Count = mod(Task, 100)
	return Date, Count
end

-- ÀÛ¼Ó´ÎÊý
function IncTaskCount(Task, CurrDate)
	local Date, Count = DecodeTask(Task)
	if (Date == CurrDate) then
		Count = Count + 1
	else
		Date = CurrDate
		Count = 1
	end
	return EncodeTask(Date, Count)
end

-- ¼ì²éÖÖÊ÷ºÍ²Î¼ÓµÄ¹«ÓÃÌõ¼þ
function CheckCommonCondition(Err)
	-- ÒªÇóÊÇ³äÖµÍæ¼Ò
	if (IsCharged() == 0) then
		Err.Msg = format("Thµnh viªn %s ch­a ®ñ ®iÒu kiÖn tham gia ho¹t ®éng.", GetName())
		return 0
	end
	-- Î´×ªÉú£º>=150¼¶£»ÒÑ×ªÉú£º>=90¼¶
	local ReqLevel = 90
	if (ST_IsTransLife() == 0) then
		ReqLevel = 150
	end
	if (GetLevel() < ReqLevel) then
		Err.Msg = format("Thµnh viªn %s ch­a ®ñ ®iÒu kiÖn tham gia ho¹t ®éng.", GetName())
		return 0
	end
	return 1
end

-- ¼ì²éÖÖÊ÷Ìõ¼þ
function CheckPlantCondition(CurrDate, Err)
	-- Ö»ÄÜ¶Ó³¤ÖÖÊ÷
	local TeamId = GetTeam()
	if (TeamId == nil or IsCaptain() == 0) then
		Err.Msg = "Ph¶i lµ ®éi tr­ëng míi cã thÓ trang trÝ c©y gi¸ng sinh!"
		return 0
	end
	-- ¼ì²éÖÖÊ÷´ÎÊýÏÞÖÆ
	local TaskDate, PlantCount = DecodeTask(PlayerFunLib:GetActivityTask(TASK_PLANTDATE))
	if (TaskDate == CurrDate and PlantCount >= LIMIT_PLANTCOUNT) then
		Err.Msg = format("Mét ngµy chØ cã thÓ trång %d c©y gi¸ng sinh!", LIMIT_PLANTCOUNT)
		return 0
	end
	return 1
end

-- ¼ì²é²Î¼ÓÌõ¼þ
function CheckJoinCondition(CurrDate, Err)
	-- Ã¿ÈË²Î¼Ó´ÎÊýÏÞÖÆ
	local Task = PlayerFunLib:GetActivityTask(TASK_JOINDATE)
	if (Task ~= 0) then
		local TaskDate, JoinCount = DecodeTask(Task)
		if (CurrDate == TaskDate and JoinCount >= LIMIT_JOINCOUNT) then
			Err.Msg = format("%s ®· tham gia ®ñ %d lÇn.", GetName(), LIMIT_JOINCOUNT)
			return 0
		end
	end
	return 1
end

-- ¼ì²é¶ÓÎé³ÉÔ±ÊÇ·ñ·ûºÏÌõ¼þ
function CheckTeamCondition(CurrDate, Err)
	local MemberCount = GetTeamSize()
	local Captain = PlayerIndex
	for i = 1, MemberCount do
		local Idx = GetTeamMember(i)
		-- ¶Ó³¤ÒÑ¾­¼ì²é¹ýÁË
		if (Idx ~= Captain) then
			PlayerIndex = Idx
			if (CheckCommonCondition(Err) == 0 or CheckJoinCondition(CurrDate, Err) == 0) then
				PlayerIndex = Captain
				return 0
			end
		end
	end
	PlayerIndex = Captain
	return 1
end

-- ¼ì²éÊÇ·ñ·ûºÏÖÖÊ÷µÄÌõ¼þ
function CheckCondition()
	-- ÐÂÊÖ´å·ÇÕ½¶·Çø
	if (InNewbieCity() == 0 or GetFightState() == 1) then
		Msg2Player("ChØ cã thÓ ë t©n thñ th«n vµ thµnh thÞ sö dông.")
		return 0
	end
	local CurrDate = mod(tonumber(GetLocalDate("%Y%m%d")), 100000)
	local Err = {Msg = ""}
	-- ¼ì²éÖÖÊ÷×Ê¸ñ
	if (CheckCommonCondition(Err) == 0 or CheckPlantCondition(CurrDate, Err) == 0) then
		Msg2Player(Err.Msg)
		return 0
	end
	-- ¼ì²é¶ÓÎé³ÉÔ±Ìõ¼þ
	if (CheckTeamCondition(CurrDate, Err) == 0) then
		Msg2Team(Err.Msg)
		return 0	
	end
	return 1
end

-- ¿ªÊ¼ÖÖÊ¥µ®Ê÷£º·µ»Ø1£¨³É¹¦£©»òÕß0£¨Ê§°Ü£©
function PlantTree()
	local Name = GetName()
	local Table = {
		Pos = {},
		Step = 1,
		Captain = Name,
		MemberState = {},
		MemberCount = 0
		}
	-- ÉèÖÃµ±Ç°Î»ÖÃ
	Table.Pos[1] = SubWorld
	_, Table.Pos[2], Table.Pos[3] = GetWorldPos()
	local TreeIdx = CreateTree(ProcTable[Table.Step].NpcId, Table)
	if (TreeIdx == 0) then
		WriteLog(format("[%s ERROR]%s failed to plant tree", LOG_HEAD, Name))
		return 0
	end
	-- ÀÛ¼ÓÖÖÊ÷´ÎÊý
	local CurrDate = mod(tonumber(GetLocalDate("%Y%m%d")), 100000)
	local Task = IncTaskCount(PlayerFunLib:GetActivityTask(TASK_PLANTDATE), CurrDate)
	PlayerFunLib:SetActivityTask(TASK_PLANTDATE, Task)
	-- ¸ø¶ÓÔ±ÀÛ¼Ó²Î¼Ó´ÎÊý
	local CurrentPlayerIdx = PlayerIndex
	local MemberCount = GetTeamSize()
	Table.MemberCount = MemberCount
	for i = 1, MemberCount do
		PlayerIndex = GetTeamMember(i)
		if (PlayerIndex ~= CurrentPlayerIdx) then
			-- ÖÖÊ÷ÈË²»ÀÛ¼Ó²Î¼Ó´ÎÊý
			Task = IncTaskCount(PlayerFunLib:GetActivityTask(TASK_JOINDATE), CurrDate)
			PlayerFunLib:SetActivityTask(TASK_JOINDATE, Task)
		end
		Table.MemberState[GetName()] = 0
	end
	PlayerIndex = CurrentPlayerIdx
	TreeTable[TreeIdx] = Table
	AddTimer(ProcTable[1].Timeout * GAME_FPS, "OnTime", TreeIdx)
	BroadCast(Table, format("%s ®· tiÕn hµnh trång C©y gi¸ng sinh, h·y nhanh chãng tiÕn hµnh trang trÝ!", Name))
	BroadCast(Table, "Xin mêi treo t¸o lªn c©y gi¸ng sinh!")
	WriteLog(format("[%s]%s plant Tree[%d]", LOG_HEAD, Name, TreeIdx))
	return 1
end

-- ¶¨Ê±Æ÷»Øµ÷º¯Êý
function OnTime(TreeIdx)
	local Table = TreeTable[TreeIdx]
	if (Table == nil) then
		WriteLog(format("[%s ERROR]OnTime: Tree[%d] is nil", LOG_HEAD, TreeIdx))
		return 0
	end
	local Result = ProcTable[Table.Step].OnTimeout(TreeIdx, Table)
	if (Result == 0) then
		return 0
	else
		local Step = Table.Step + 1
		Table.Step = Step
		return ProcTable[Step].Timeout * GAME_FPS, Result
	end
end

-- ÓëÊ¥µ®Ê÷¶Ô»°
function Dlg2Tree()
	local TreeIdx = GetLastDiagNpc()
	local Table = TreeTable[TreeIdx]
	if (Table == nil) then
		WriteLog(format("[%s]Dlg2Tree: Tree[%d] is nil", LOG_HEAD, TreeIdx))
	elseif (InMemberList(GetName(), Table) == 0) then
		Say("Xin mêi t×m ®Õn c©y gi¸ng sinh cña m×nh")
	else
		ProcTable[Table.Step].Dialog(TreeIdx, Table)
	end
end

function TreeDialog()
	local TreeIdx = GetLastDiagNpc()
	local Table = TreeTable[TreeIdx]
	if (Table == nil) then
		local Msg = format("[%s ERROR]TreeDialog: Tree[%d] is nil", LOG_HEAD, TreeIdx)
		WriteLog(Msg)
		return
	end
	local Caption = "§©y lµ mét c©y gi¸ng sinh thËt léng lÉy vµ Êm ¸p."
	local Option = ProcTable[Table.Step].Option
	if (Option ~= nil) then
		Say(Caption,
			2,
			format("%s/%s", Option, "Dlg2Tree"),
			"Ta muèn xem thö /Cancel")
	else
		Say(Caption)
	end
end
