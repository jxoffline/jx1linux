-- 第一名帮会帮主可以登记自己的队友
-- 在2007-10-07-24（10-08-0时）时 产生名单
-- 在2008-04-07-24（04-08-0时）时 产生名单
-- 在2008-10-20-24（10-21-0时）时 产生名单
-- 在2009-04-24-24（04-25-0时）时 产生名单
-- 在2009-10-24-24（10-25-0时）时 产生名单

SZONETONG_LGNAME	=	"ONETONG_ONETONG";
ONETONG_LGTYPE		=	541;
ONETONG_ACC_LGTYPE	=	542;
--THDNB15 - Th阨 gian ghi log - Modified by ThanhLD - 24h 20140417
ONETONG_TIME_CREATE	=	20140418

function TaskShedule()
	TaskName("OneTongCreateList");
	TaskInterval(1440);	--每天
	TaskTime(0, 1);			--0点 触发
	TaskCountLimit(0);	--无限次
end

function TaskContent()
	local nDate = tonumber(date("%Y%m%d"));
	if (nDate == ONETONG_TIME_CREATE) then
		local n_lid = LG_GetLeagueObj(ONETONG_LGTYPE, SZONETONG_LGNAME);
		local szlogfile = "relay_log\\onetong\\onetong_list_"..nDate..".log"
		OutputMsg("--------------------------Tao duong dan file THNDB15 %d--------------------------------")
		if (n_lid == nil or n_lid == 0) then
			WriteStringToFile(szlogfile, "Error!!! No OneTong ListMember!!");
			return
		end;
		
		local nMemCount = LG_GetMemberCount(n_lid);
		if (nMemCount == 0) then
			WriteStringToFile(szlogfile, "No OneTong ListMember!! Count == 0");			
			return
		end;
		
		WriteStringToFile(szlogfile, format("OneTongMemList Have Member %d\n",nMemCount));
		OutputMsg(format("--------------------------So luong mem  THNDB15 %d--------------------------------", nMemCount));
		WriteStringToFile(szlogfile, "Account\tName\n");
		for i = 0, nMemCount - 1 do
			local szmem = LG_GetMemberInfo(n_lid, i);
			local n_acclid = LG_GetLeagueObjByRole(ONETONG_ACC_LGTYPE, szmem);
			local szacc = "Error_NoAccount";
			if (n_acclid ~= nil and n_acclid ~= 0) then
				szacc = LG_GetLeagueInfo(n_acclid);
			end;
			
			WriteStringToFile(szlogfile, format("%s\t%s\n", szacc, szmem));			
		end;
	end;
end;



function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
