Include("\\script\\tong\\tong_header.lua")

local tbLadderId = 
{
	10263,10264,10265
}
local tbTongTSK_Exploit = 
{
	TONGTSK_Gongde_meici,
	TONGTSK_Gongde_meizhou,
	TONGTSK_Gongde_Total,
}


IncludeLib("TONG")
function TaskShedule()
	--设置方案名称
	TaskName("init data for act")
	
	local  nInterval = 10080

	--设置间隔时间，单位为分钟
	TaskInterval(nInterval) --nInterval分钟一次
	--设置触发次数，0表示无限次数
	

	TaskCountLimit(1)
	
end

local clearLaddderData = function (nId)
	OutputMsg("clear ladder ing ...");
	Ladder_ClearLadder(%tbLadderId[nId])
	local nTongID = TONG_GetFirstTong();
	while(nTongID and nTongID ~= 0)do
		TONG_ApplySetTaskValue(nTongID, %tbTongTSK_Exploit[nId], 0);
		nTongID = TONG_GetNextTong(nTongID);
	end
	OutputMsg("clear ladder over");
end
function TaskContent()
	%clearLaddderData(1)
	%clearLaddderData(2)
	%clearLaddderData(3)
	
end



function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end