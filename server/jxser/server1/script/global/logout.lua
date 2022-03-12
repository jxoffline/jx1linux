-------------------------------------------------------------------------
-- FileName		:	logout.lua
-- Author		:	lailigao
-- CreateTime	:	2005-04-06 23:17:18
-- Desc			:	玩家登出脚本(在退出游戏或跨服前调用)
-------------------------------------------------------------------------
CP_TASKID_LOGOUT = 1094		--武林大会预选赛 0: 已保存相关任务变量； 1：未保存

Include("\\script\\task\\tollgate\\messenger\\messenger_lievegame.lua")
Include("\\script\\event\\storm\\logout.lua")	--Storm
Include("\\script\\misc\\vngpromotion\\ipbonus\\ipbonus_2_head.lua");
Include("\\script\\global\\playerlist.lua")
Include("\\script\\global\\logout_head.lua")

Include("\\script\\misc\\eventsys\\eventsys.lua")

function main()
	if IsIPBonus() == 1 then
		IpBonus_Close()
	end;
	SetTask(CP_TASKID_LOGOUT, 0)
	
	for i = 1, getn(TB_LOGOUT_FILEFUN) do
		local reg = TB_LOGOUT_FILEFUN[i]
		DynamicExecute(reg[1], reg[2], PlayerIndex)
	end

	local MapId = SubWorldIdx2ID( SubWorld )
	if ( MapId >= 387  and MapId <= 395) then
		messenger_livegame()
	end
	
	storm_logout()	--Storm
	PlayerList:DelPlayer(PlayerIndex)
	EventSys:GetType("OnLogout"):OnPlayerEvent(0, PlayerIndex)
end

-- 跨服脚本
function RemoveExchange()
	for i = 1, getn(TB_EXCHANGE_FILEFUN) do
		local reg = TB_EXCHANGE_FILEFUN[i]
		DynamicExecute(reg[1], reg[2], PlayerIndex)
	end
	PlayerList:DelPlayer(PlayerIndex)
end
