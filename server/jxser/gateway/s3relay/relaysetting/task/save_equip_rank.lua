Include("\\script\\misc\\rank\\rank.lua")

function TaskShedule()
	-- 设置方案名称
	TaskName( "Save Equip Rank At Monday 3:00" );
	TaskInterval( 1440 );
	TaskTime( 3, 00 );
	TaskCountLimit( 0 );
	-- 输出启动消息
	OutputMsg( "Save Equip Rank At Monday 3:00" );
end

function TaskContent()
	local nCurWeekDay = tonumber(date("%w"));

	if (nCurWeekDay == 1) then --星期一
		tbRankClass:SortAndSave("FUNC_RANK_EQUIPVALUE");
	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end