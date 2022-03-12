Include("\\script\\event\\wulin_2nd\\data.lua")
--Role Value--
WULIN_TASK_LOGIN = 1570

WULIN_TB_TIME = {
	register = {open = 03030000, close = 03162400},	--确认资格时间
	elector = {open = 03100000, close = 03162400},		--竞选时间
	leader = {open = 03162400, close = 03232400}		--票选总领队
}

function wulin_canInfo2Player()
	nClientID = WULIN_TB_ZONEID[GetGateWayClientID()]
	if (nClientID == nil or nClientID == 0) then
		return
	end
	local curdate = tonumber(date("%m%d%H%M"))
	if (curdate >= WULIN_TB_TIME.register.open and curdate <= WULIN_TB_TIME.register.close) then
		if (GetTask(WULIN_TASK_LOGIN) == 0) then
			if (WULIN_TB_ROLES[nClientID][GetName()]) then
				Msg2Player("“第二届武林大会”提前入围选手资格确认已经开始，您可以在<color=yellow>临安-武林大会官员(202,202)<color>处确认您的资格。确认资格日期截止<color=yellow>2006年3月17日零时<color>。")
			else
				SetTask(WULIN_TASK_LOGIN, -1)
			end
		end	
	end
end

if login_add then login_add(wulin_canInfo2Player, 2) end