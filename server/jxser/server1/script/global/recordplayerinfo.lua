Include("\\script\\global\\login_head.lua")

--用于记录玩家的信息
G_TSK_PlayerLastLoginTime = 601

local _SetPlayerLoginTime = function (bExchangeIn)
	if bExchangeIn ~= 1 then
		SetTask(G_TSK_PlayerLastLoginTime, GetCurServerTime())
	end
	
end



if login_add then
	login_add(_SetPlayerLoginTime, 0)
end