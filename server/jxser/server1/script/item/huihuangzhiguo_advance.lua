Include("\\script\\activitysys\\playerfunlib.lua");

huihuangzhiguo_advance = {}

huihuangzhiguo_advance.nDailyCountLimit = 5;
huihuangzhiguo_advance.nLevelLimit = 120;
huihuangzhiguo_advance.tbEXP =  --¹û×Ó¶ÔÓ¦¾­Ñé±í
{
	{15000000, "B¸ch Niªn Huy Hoµng qu¶"},
	{23000000, "Thiªn Niªn Huy Hoµng qu¶"},
	{30000000, "V¹n Niªn Huy Hoµng qu¶"},
};

huihuangzhiguo_advance.tbZhenLuTSK =  --Ê¹ÓÃÕäÂ¶TSKIDºÍ¸øÓè¶ÔÓ¦ÎïÆ·±í
{
	{2669, {tbProp={6,1,2269,1,0,0}}, "B¸ch Niªn Tr©n Lé", "B¸ch Niªn Huy Hoµng qu¶"},
	{2670, {tbProp={6,1,2270,1,0,0}}, "Thiªn Niªn Tr©n Lé", "Thiªn Niªn Huy Hoµng qu¶"},
	{2671, {tbProp={6,1,2271,1,0,0}}, "V¹n Niªn Tr©n Lé", "V¹n Niªn Huy Hoµng qu¶"},
};

function huihuangzhiguo_advance:UseGuoZi(nGuoziLevel)
	if (self:CheckLevelLimit() ~= 1) then
		return 0;
	end
	
	if (self:CheckCountLimit() ~= 1) then
		return 0;
	end
	
	if (self.tbEXP[nGuoziLevel] == nil) then
		return 0;
	end
	
	PlayerFunLib:AddExp(self.tbEXP[nGuoziLevel][1], 0, format("%s phÇn th­ëng",self.tbEXP[nGuoziLevel][2]));
	SetTask(2313, GetTask(2313) + 1)
	return 1;
end

function huihuangzhiguo_advance:UseZhenLu(nZhenLuLevel)
	if (self:CheckLevelLimit() ~= 1) then
		return 0;
	end
	
	self:AddZhenLuCount(nZhenLuLevel);
	Msg2Player(format("§¹i hiÖp ®· sö dông %d %s, lóc nhÆt qu¶ huy hoµng cßn cã thÓ thu ®­îc %d %s, tr¹ng th¸i nµy sÏ mÊt vµo 0 giê", 
										PlayerFunLib:GetTaskDailyCount(self.tbZhenLuTSK[nZhenLuLevel][1]), self.tbZhenLuTSK[nZhenLuLevel][3], 
										PlayerFunLib:GetTaskDailyCount(self.tbZhenLuTSK[nZhenLuLevel][1]), self.tbZhenLuTSK[nZhenLuLevel][4]));
	return 1;
end

function huihuangzhiguo_advance:CheckLevelLimit()
	if (GetLevel() < self.nLevelLimit) then
		lib:ShowMessage(format("CÊp %d trë lªn (kÓ c¶ %d) míi cã thÓ sö dông!", self.nLevelLimit, self.nLevelLimit));
		return 0;
	end
	
	return 1;
end

function huihuangzhiguo_advance:CheckCountLimit()
	local nDate = tonumber(GetLocalDate("%m%d"))
	if ( GetTask(2312) ~= nDate ) then
		SetTask(2312, nDate)
		SetTask(2313, 0)
	end
	
	if (GetTask(2313) >= self.nDailyCountLimit) then
		lib:ShowMessage(format("H«m nay c¸c h¹ ®· sö dông %d qu¶ huy hoµng råi, c«ng lùc t¨ng qu¸ nhanh còng sÏ bÞ ph¶n t¸c dông ®ã. §îi ngµy mai råi h·y dïng nhÐ.", self.nDailyCountLimit));
		return 0;
	end
	
	return 1;
end

function huihuangzhiguo_advance:AddZhenLuCount(nZhenLuLevel)
	if (self.tbZhenLuTSK[nZhenLuLevel] ~= nil) then
		PlayerFunLib:AddTaskDaily(self.tbZhenLuTSK[nZhenLuLevel][1], 1);
	end
end

function huihuangzhiguo_advance:ReduceZhenLuCount(nZhenLuLevel)
	if (self.tbZhenLuTSK[nZhenLuLevel] ~= nil) then
		PlayerFunLib:AddTaskDaily(self.tbZhenLuTSK[nZhenLuLevel][1], -1);
	end
end

function huihuangzhiguo_advance:GetGuoZiAvd()
	local nCount = 0;
	for i=getn(self.tbZhenLuTSK),1,-1 do --´Ó¸ß¼¶µ½µÍ¼¶±éÀú
		local nZhenLu = PlayerFunLib:GetTaskDailyCount(self.tbZhenLuTSK[i][1]);
		if (nZhenLu > 0) then
			tbAwardTemplet:GiveAwardByList(self.tbZhenLuTSK[i][2], "NhÆt qu¶ huy hoµng");
			self:ReduceZhenLuCount(i);
			nCount = 1;
			break;
		end
	end
	
	return nCount;
end