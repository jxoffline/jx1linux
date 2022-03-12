Include("\\script\\activitysys\\config\\35\\head.lua")
Include("\\script\\activitysys\\config\\35\\variables.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\activitysys\\config\\35\\produce.lua")

Tree2Owner = {}
Tree = {}
Tree.STATE2FEATURE = 
{
	[1] = 1252,
	[2] = 1253,
	[3] = 1254,
	[4] = 1884,	
}

Tree.tbAward = tbAwardList["TREE"]
Tree.tbLog = tbAwardLog["TREE"]

Tree.TimeList = {
	[1] = 10,
	[2] = 20,
	[3] = 30,
	[4] = 50,
	[5] = 50,
	}
	
Tree.TIME = 10	
Tree.PARAM_STATE = 1
Tree.PARAM_TIME = 2
--Fix long tree name makes
Tree.szNameSuffix = "%s"

function Tree:Create(szOwner, nMapIndex, nX32, nY32)
	
	local nState = 1
	
	local nFeartueId = self.STATE2FEATURE[nState]
	if not nFeartueId then
		return
	end
	local szNpcName = format(self.szNameSuffix, szOwner)
	local nNpcIndex = AddNpc(nFeartueId, 1, nMapIndex, nX32, nY32, 0, szNpcName);
	
	Tree2Owner[nNpcIndex] = szOwner;
	SetNpcTimer(nNpcIndex, Tree.TIME*18)
	SetNpcScript(nNpcIndex, "\\script\\activitysys\\config\\35\\tree.lua")
	SetNpcParam(nNpcIndex, self.PARAM_STATE, nState)
	SetNpcParam(nNpcIndex, self.PARAM_TIME, 0)
end

function Tree:ChangeFeature(nNpcIndex, nFeatureId)
	ChangeNpcFeature(nNpcIndex, 0, 0, nFeatureId)
end

function Tree:Destroy(nNpcIndex)
	Tree2Owner[nNpcIndex] = nil
	DelNpc(nNpcIndex)
	DynamicExecute("\\script\\activitysys\\config\\35\\consume.lua", "pActivity:DestoryTree")
end

function Tree:Dialog()
	local nNpcIndex = GetLastDiagNpc()
	if not self:CheckOwner(nNpcIndex, GetName()) then
		return 
	end
	local nState =  GetNpcParam(nNpcIndex, self.PARAM_STATE)
	if nState <= 0 then
		return
	end
	
	if nState < getn(self.STATE2FEATURE) then
		Talk(1,"","HiÖn t¹i vÉn ch­a thu ho¹ch ®­îc, xin h·y kiªn nhÉn chê ®îi!")
		return
	end
	
	if nState > getn(self.STATE2FEATURE) then
		Talk(1,"","§¹i hiÖp ®· thu ho¹ch råi, trªn c©y kh«ng cßn lo¹i qu¶ nµo n÷a!")
		return
	end
	
	self:GetAward(nNpcIndex)
end

function Tree:GetAward(nNpcIndex)
	if not self:CheckOwner(nNpcIndex, GetName()) then
		return 
	end
	
	local nKind = random(1,getn(self.tbAward))
	tbAwardTemplet:Give(self.tbAward[nKind], 1, {EVENT_LOG_TITLE, self.tbLog[nKind]})
	local nState =  GetNpcParam(nNpcIndex, self.PARAM_STATE)
	SetNpcParam(nNpcIndex, self.PARAM_STATE, nState + 1)
end
function Tree:CheckOwner(nNpcIndex, szOwner)
	if format(self.szNameSuffix, szOwner) ~= GetNpcName(nNpcIndex) then
		Talk(1, "", "§©y kh«ng ph¶i lµ c©y b¹n trång.")
		return
	end
	return 1
end

function main()
	%Tree:Dialog()
end

function OnTimer(nNpcIndex, nTimeOut)
	local nPassTime = GetNpcParam(nNpcIndex, %Tree.PARAM_TIME) + %Tree.TIME
	local nState =  GetNpcParam(nNpcIndex, %Tree.PARAM_STATE)

	-- change the state
	if nState <= getn(%Tree.TimeList) and nPassTime >= %Tree.TimeList[nState] then
		nState = nState + 1
		SetNpcParam(nNpcIndex, %Tree.PARAM_STATE, nState)
	end
	SetNpcParam(nNpcIndex, %Tree.PARAM_TIME, nPassTime)
	
	-- do something
	nState =  GetNpcParam(nNpcIndex, %Tree.PARAM_STATE)
	if nState > getn(%Tree.TimeList) then
		%Tree:Destroy(nNpcIndex)
	elseif nState <= getn(%Tree.STATE2FEATURE) then
		%Tree:ChangeFeature(nNpcIndex, %Tree.STATE2FEATURE[nState])
	end
	
	SetNpcTimer(nNpcIndex, %Tree.TIME * 18)
end

