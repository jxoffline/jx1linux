Include("\\script\\event\\other\\jilixinwanjia\\200908\\head.lua")
Include("\\script\\global\\seasonnpc.lua");
Include("\\script\\lib\\awardtemplet.lua")

tbJILIWanJia0908.tbData = 
{
	[1] = 
	{
		nLevel = 30,
		pLimit = function ()
			return  GetLastFactionNumber() > -1, "C«n ph∂i gia nhÀp m´n ph∏i"
		end,
		tbAward = 
		{
			{nExp_tl = 16e6},
			{szName="HÂng bao S¨ nhÀp", tbProp={6, 1, 2101, 1, 0, 0}, nExpiredTime = 20090923},
		}
	},
	[2] = 
	{
		nLevel = 70,
		pLimit = function ()
			return GetTong() ~= nil and GetTong() ~= "", "C∏c hπ v…n ch≠a gia nhÀp bang hÈi"
		end,
		tbAward = 
		{
			{nExp_tl = 2e8},
			{szName="HÂng bao May mæn", tbProp={6, 1, 2102, 1, 0, 0}, nExpiredTime = 20090923},
		}
	},
	[3] = 
	{
		nLevel = 100,
		pLimit = function ()
			return GetLeadLevel() >= 30 and GetTask(151) >= 1000, "C«n Æi”m thËng so∏i 30 trÎ l™n vµ phÛc duy™n 1000"
		end,
		tbAward = 
		{
			{nExp_tl = 11e8},
			{szName="HÂng bao PhÛ qu˝", tbProp={6, 1, 2103, 1, 0, 0}, nExpiredTime = 20090923},
		}
	},
	[4] = 
	{
		nLevel = 125,
		pLimit = function ()
			return GetTask(2463) > 0, "C«n ph∂i h‰c k¸ n®ng c p 120"
		end,
		tbAward = 
		{
			{nExp_tl = 14e8},
			{szName="HÂng bao Sum v«y", tbProp={6, 1, 2104, 1, 0, 0}},
		}
	},
	[5] = 
	{
		nLevel = 140,
		pLimit = function ()
			return GetRepute() > 455 and tl_counttasklinknum(1) >= 300, "ßπt 455 danh v‰ng vµ hoµn thµnh 300 nhi÷m vÙ d∑ t»u."
		end,
		tbAward = 
		{
			{nExp_tl = 42e8},
			{szName="HÂng bao An khang", tbProp={6, 1, 2105, 1, 0, 0}},
		}
	},
}

function tbJILIWanJia0908:DailogMain()
	
	
--	if not tbJILIWanJia0908:IsActDate() then
--		return Talk(1, "", "Hoπt ÆÈng Æ∑ k’t thÛc.")
--	end
	
	local nDay = tonumber(GetLocalDate("%Y%m%d"))
	if nDay >= 20090923 then
		return Talk(1, "", "Hoπt ÆÈng Æ∑ k’t thÛc.")
	end
	
	tbSay = 
	{
		"ßπi hi÷p muËn nhÀn ph«n th≠Îng nµo?",
		"Ta Æ’n nhÀn ph«n th≠Îng c p 30/#tbJILIWanJia0908:GetAwardById(1)",
		"Ta Æ’n nhÀn ph«n th≠Îng c p 70/#tbJILIWanJia0908:GetAwardById(2)",
		"Ta Æ’n nhÀn ph«n th≠Îng c p 100/#tbJILIWanJia0908:GetAwardById(3)",
		"Ta Æ’n nhÀn ph«n th≠Îng c p 125/#tbJILIWanJia0908:GetAwardById(4)",
		"Ta Æ’n nhÀn ph«n th≠Îng c p 140/#tbJILIWanJia0908:GetAwardById(5)",
		"K’t thÛc ÆËi thoπi/OnCancel"
		
	}
	CreateTaskSay(tbSay)
end

function tbJILIWanJia0908:GetAwardById(nId)
	local tbAwardData = self.tbData[nId]
	if self.tbTask:GetAwardState(nId) == 1 then
		return Talk(1, "", "ßπi hi÷p Æ∑ nhÀn ph«n th≠Îng nµy rÂi.")
	end
	
	
	local nResult, szFailMsg = self:IsPlayerEligible()
	if not nResult then
		return Talk(1, "", szFailMsg)
	end
	
	if CalcFreeItemCellCount() < 1 then 
		return Talk(1, "",  format("ChÁ trËng hµnh trang kh´ng ÆÒ %d chÁ, h∑y sæp x’p lπi.", 1))
	end
	
	if GetLevel() < tbAwardData.nLevel then
		return Talk(1, "", format("ßπi hi÷p kh´ng ÆÒ c p %d.", tbAwardData.nLevel))
	end

	local nResult, szFailMsg = tbAwardData.pLimit()
	if not nResult then
		return Talk(1, "", szFailMsg)
	end
	
	tbAwardTemplet:GiveAwardByList(tbAwardData.tbAward, "jili xin wanjia")
	
	self.tbTask:SetAwardState(nId, 1)
end