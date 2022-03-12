Include("\\script\\huoyuedu\\huoyuedu.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\misc\\eventsys\\eventsys.lua")
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\misc\\eventsys\\eventsys.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")

--DC ph莕 thng  n╪g ng - Modified By DinhHQ - 20120410
tbHuoYueDu.tbAward =
{
	[1] =
	{
		nValue = 20,
		tbItem = {nExp_tl = 8000000},
	},
	[2] =
	{
		nValue = 50,
		tbItem = {
			{nExp_tl = 15000000},
			{szName = "Ch﹏ Nguy猲 Кn (trung)", tbProp={6,1,30228,1,0,0}, nCount = 1,nBindState=-2},
		},
	},
	[3] =
	{
		nValue = 80,
		tbItem = {
			{nExp_tl = 20000000},
			{szName = "Ch﹏ Nguy猲 Кn (trung)", tbProp={6,1,30228,1,0,0}, nCount = 2,nBindState=-2},
		},
	},
	[4] =
	{
		nValue = 100,
		tbItem = {
			{nExp_tl = 40000000},
			{szName = "Ch﹏ Nguy猲 Кn (trung)", tbProp={6,1,30228,1,0,0}, nCount = 3,nBindState=-2},
		},

	},
}

function tbHuoYueDu:GetTaskDailyBit(nTaskId, nBit)
	local nTaskValue = GetTask(nTaskId)
	local nCurDate = tonumber(GetLocalDate("%y%m%d"))
	if nCurDate ~= floor(nTaskValue / 256) then
		nTaskValue = nCurDate * 256
	end
	return GetBit(nTaskValue, nBit)
end

function tbHuoYueDu:SetTaskDailyBit(nTaskId, nBit, nValue)
	local nTaskValue = GetTask(nTaskId)
	local nCurDate = tonumber(GetLocalDate("%y%m%d"))
	if nCurDate ~= floor(nTaskValue / 256) then
		nTaskValue = nCurDate * 256
		SetTask(nTaskId, nTaskValue)
	end
	SetTask(nTaskId, SetBit(nTaskValue, nBit, nValue))
end

function tbHuoYueDu:GiveAward(nAwardIndex)
	if PlayerFunLib:CheckTaskDaily(self.TSK_TotalHuoYueDu, self.tbAward[nAwardIndex].nValue, "", ">=") ~= 1 then
		return
	end
	if self:GetTaskDailyBit(self.TSK_Award, nAwardIndex) == 1 then--已经领取过
		return
	end
	--DC kinh m筩h - modified by DinhHQ - 20120717
	if (nAwardIndex > 1) and PlayerFunLib:CheckFreeBagCell(5,"default") ~= 1 then
		return
	end
	tbAwardTemplet:GiveAwardByList(self.tbAward[nAwardIndex]["tbItem"], format("ACTIVITY%dPOINT_GETAWARD", self.tbAward[nAwardIndex].nValue))
	self:SetTaskDailyBit(self.TSK_Award, nAwardIndex, 1)
	if nAwardIndex == 3 then
		G_ACTIVITY:OnMessage("HuoYueDu")
	end

	if  ST_GetTransLifeCount() < 5 then
		local nLevel = GetLevel()
		if ST_GetTransLifeCount() == 4 and nLevel >199 then
			return
		end
		local tbAwardItem = {szName = "C鰑 Tuy謙 L╪g Ti猲 Кn", tbProp={6,1,30540,1,0,0}, nCount = 1,nExpiredTime=1440, nBindState=-2}
		tbAwardTemplet:Give(tbAwardItem,1, {"LOGTINHNANGJX1_item_PhanThuongNangDong_NhanCTLTD"})
	end
	G_ACTIVITY:OnMessage("ReceiveAwardHuoYueDu")
end