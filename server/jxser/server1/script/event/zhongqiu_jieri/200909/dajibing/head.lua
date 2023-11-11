
Include("\\script\\lib\\gb_taskfuncs.lua")

Include("\\script\\global\\login_head.lua")
Include("\\script\\activitysys\\npcdailog.lua")
tbZhongqiuDajibin = {}

local tbAward = 
{
	{50e6, 40e6},
	{45e6, 35e6},
	{40e6, 30e6},
	{35e6, 25e6},
	{30e6, 25e6},
	{20e6, 20e6},
	{20e6, 10e6},
	{20e6, 10e6},
	{20e6, 10e6},
	{20e6, 10e6},
	{10e6, 5e6},

}
function tbZhongqiuDajibin:AddCount()
	
	PlayerFunLib:AddTask(2643,1)
	
	local nPlayerCount =  PlayerFunLib:GetActivityTask(2643)
	local nServerCount = gb_GetTask("ZhongqiuDajibin2009", 1)
	LadderFunLib:UpdatePlayer(10266,2643)
	gb_AppendTask("ZhongqiuDajibin2009", 1, 1)
	Msg2Player(format("§¹i hiÖp ®· nép %d, toµn server ®· nép %d.", nPlayerCount, nServerCount+1))
end

function tbZhongqiuDajibin:GetRank()
	local szPlayerName = GetName()
	for i = 1, 10 do
		local szName, nValue = Ladder_GetLadderInfo(10266, i);
		if (szName ~= nil and nValue ~= "" and szName == szPlayerName) then
			return i
		end
	end
	
	if PlayerFunLib:GetActivityTask(2643) >= 1 then
		return 11
	end
end

function tbZhongqiuDajibin:CheckLastAward()
	
	local nCount = gb_GetTask("ZhongqiuDajibin2009", 1)
	
	local nPlayerCount = PlayerFunLib:GetActivityTask(2643)
	local nRank = self:GetRank()
	
	if nPlayerCount < 0 then
		Talk(1, "", "§¹i hiÖp ®· nhËn phÇn th­ëng nµy råi.")
		return 
	end
	
	if not nRank then
		Talk(1, "", "§¹i hiÖp kh«ng thÓ nhËn phÇn th­ëng nµy.")
		return 
	end
	local nIdex = 1
	if nCount <= 5000 then
		nIdex = 2
	end
	local tbExp = {nExp = %tbAward[nRank][nIdex]}
	
	tbAwardTemplet:GiveAwardByList(tbExp, "MidAutumn,RankAward"..nRank, 1)
	--Msg2Player(format("<color=yellow>µÃµ½ÅÅÃû½±Àø%u¾­Ñé.<color>", tbExp.nExp))
	local tbExp2 = {nExp_tl = nPlayerCount * 8000000}
	
	tbAwardTemplet:GiveAwardByList(tbExp2, "MidAutumn,RankAward"..nRank, 1)
	--Msg2Player(format("<color=yellow>ÄãÒÑ¾­½»ÄÉ%u¸öÈýÉ«Ö®±¦²¢»ñµÃ½±Àø%u¾­Ñé.<color>", nPlayerCount, tbExp2.nExp_tl))
	PlayerFunLib:SetActivityTask(2643, -nPlayerCount) 
	
	
	
	
end

function tbZhongqiuDajibin:GetLianziCookie()
	local nCount = gb_GetTask("ZhongqiuDajibin2009", 1)
	
	local nPlayerFlag = PlayerFunLib:GetActivityTask(2654)
	if nPlayerFlag < 0 then
		Talk(1, "", "§¹i hiÖp ®· nhËn phÇn th­ëng nµy råi.")
		return 
	end
	
	if PlayerFunLib:CheckLevel(50, "default", ">=") ~= 1 or PlayerFunLib:IsCharged("default") ~= 1 then
		return
	end
	
	
	if PlayerFunLib:CheckFreeBagCell(1, "default") ~= 1 then
		return 
	end
	
	if nPlayerFlag ~= 1 then
		Talk(1, "", "§¹i hiÖp kh«ng thÓ nhËn phÇn th­ëng nµy.")
		return 
	end
	local nItemCount = 2
	if nCount <= 5000 then
		nItemCount = 1
	end
	local tbItem = {szName = "B¸nh h¹t sen", tbProp={6,1,2159,1,0,0},nCount = nItemCount, nExpiredTime=20091123}
	
	tbAwardTemplet:GiveAwardByList(tbItem, "MidAutumn,GetLianzibing")
	PlayerFunLib:SetActivityTask(2654, -nPlayerFlag)
end



login_add(function ()
	 local nDate = tonumber(GetLocalDate("%y%m%d"))
		if 091001 <= nDate and nDate < 091102 then
	 		PlayerFunLib:SetActivityTask(2654, 1)
		end
	end, 
	2)


