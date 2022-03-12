






function TaskShedule()
	--设置方案名称
	TaskName("shensuanzi")
	
	local  nInterval = 24*60
	
	
	
	local nNextHour, nNextMinute = 19, 05
	
	TaskTime(nNextHour, nNextMinute);

	--设置间隔时间，单位为分钟
	TaskInterval(nInterval) --nInterval分钟一次
	--设置触发次数，0表示无限次数	
	
	TaskCountLimit(0)
	
	local szMsg = format("=====%s ## %d:%d ### %d #? ?###=======", "shensuanzi",nNextHour, nNextMinute, nInterval)
	OutputMsg(szMsg);
end

function TaskContent()
	
	local nDate = tonumber(date("%Y%m%d"))
	
	if  20100709 <= nDate and nDate < 20100816 then
		RemoteExecute("\\script\\event\\other\\shensuanzi\\class.lua",	"tbShenSuanZi:RoundStart_gc", 0)
		OutputMsg("[shensuanzi]start signup")
	end
end



function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end