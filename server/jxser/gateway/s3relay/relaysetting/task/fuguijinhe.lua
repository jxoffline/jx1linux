Include("\\script\\event\\expansion\\201006\\fuguijinhe\\fuguijinhe.lua")



local _GetNexStartTime = function(nStartHour, nStartMinute, nInterval)
	local nNextHour = nStartHour
	local nNextMinute = 0;
	
	if (nStartMinute <= 10) then
		nNextMinute = 10;
	else
		nNextMinute = nInterval * ceil(nStartMinute / nInterval)
	end
	
	if nNextMinute >= 60 then	
		nNextHour = nNextHour + floor(nNextMinute / 60)
		nNextMinute = mod(nNextMinute, 60) + 10
	end
	
	if (nNextHour >= 24) then
		nNextHour = mod(nNextHour, 24);
	end;
	return nNextHour, nNextMinute
end

function TaskShedule()
	TaskName("Hoπt ÆÈng PBM 2010 ---- PhÛ qu˝ c»m hπp");
	
	local  nInterval = 60
	
	local nStartHour = tonumber(date("%H")) ;
	local nStartMinute = tonumber(date("%M"));
	
	local nNextHour, nNextMinute = %_GetNexStartTime(nStartHour, nStartMinute, nInterval)
	
	TaskTime(nNextHour, nNextMinute);

	--…Ë÷√º‰∏Ù ±º‰£¨µ•ŒªŒ™∑÷÷”
	TaskInterval(nInterval) --nInterval∑÷÷”“ª¥Œ
	--…Ë÷√¥•∑¢¥Œ ˝£¨0±Ì æŒﬁœﬁ¥Œ ˝
	
	TaskCountLimit(0)
	OutputMsg("Hoπt ÆÈng PBM 2010 --- PhÛ qu˝ c»m hÈp");
end

function TaskContent()
	
	local nDate = tonumber(date("%Y%m%d"));
	local nTime = tonumber(date("%H%M%S"));

--	if nDate < %nStartDate or nDate > %nCloseDate then
--		return 
--	end
	
	local logfilename = "\\relay_log\\"..date("%Y_%m_%d").."\\fuguijinhe.log";
	
	if (220000 <= nTime and nTime < 230000) then
		-- random bet number
		tbBetInfo:ClearNumInfo();
		tbBetInfo:SetTotalBetCount(0);
		tbBetInfo:GenNumber();
		
		local szLog = "[2010 expansion fuguijinhe bet number] ";
		local szNormalNumInfo = "";
		local szSpecNumInfo = "";
		local tbNormal = tbBetInfo.tbNormalNum;
		local tbSpec = tbBetInfo.tbSpecNum;
		
		-- ’‚¿Ô“™Ω¯––œ¬“ª¬÷,ªÒ»°µ⁄∂˛ÃÏµƒ»’∆⁄
		local nTime = Tm2Time(tonumber(date("%Y")), tonumber(date("%m")), tonumber(date("%d")))
		nTime = nTime + 24 * 60 * 60;
		local tbTM = Time2Tm(nTime);
		local nNextDay = tbTM[1]*10000 + tbTM[2]*100 + tbTM[3];

		RemoteExc("\\script\\event\\expansion\\201006\\fuguijinhe\\fuguijinhe.lua", "tbBetInfo:ClearNumInfo");
		RemoteExc("\\script\\event\\expansion\\201006\\fuguijinhe\\fuguijinhe.lua", "tbJinhe_tsk:SetCurBetDate", {nNextDay});
		RemoteExc("\\script\\event\\expansion\\201006\\fuguijinhe\\fuguijinhe.lua", "tbBetInfo:SetTotalBetCount", {0});
		--GlobalExecute("dwf \\script\\event\\expansion\\201006\\fuguijinhe\\fuguijinhe.lua tbBetInfo:ClearNumInfo()");
		--GlobalExecute(format("dwf \\script\\event\\expansion\\201006\\fuguijinhe\\fuguijinhe.lua tbJinhe_tsk:SetCurBetDate(%d)", nNextDay));
		--GlobalExecute("dwf \\script\\event\\expansion\\201006\\fuguijinhe\\fuguijinhe.lua tbBetInfo:SetTotalBetCount(0)");

		szLog = format("%s %d  Normal Number:",szLog, nDate);
		for i=1,getn(tbNormal) do
			szNormalNumInfo = format("%s %d",szNormalNumInfo, tbNormal[i]);
			szLog = format("%s %d",szLog, tbNormal[i]);
			RemoteExc("\\script\\event\\expansion\\201006\\fuguijinhe\\fuguijinhe.lua", "tbBetInfo:AddNormalNum", {tbNormal[i]});
			--GlobalExecute(format("dwf \\script\\event\\expansion\\201006\\fuguijinhe\\fuguijinhe.lua tbBetInfo:AddNormalNum(%d)",tbNormal[i]));
		end
		
		szLog = format("%s Special Number:",szLog);
		for i=1,getn(tbSpec) do
			szSpecNumInfo = format("%s %d",szSpecNumInfo, tbSpec[i]);
			szLog = format("%s %d",szLog, tbSpec[i]);
			RemoteExc("\\script\\event\\expansion\\201006\\fuguijinhe\\fuguijinhe.lua", "tbBetInfo:AddSpecNum", {tbSpec[i]});
			--GlobalExecute(format("dwf \\script\\event\\expansion\\201006\\fuguijinhe\\fuguijinhe.lua tbBetInfo:AddSpecNum(%d)",tbSpec[i]));
		end
		OutputMsg(szLog);
		WriteStringToFile(logfilename, format("%s\n",szLog));
		
		local szMsg = format("C´ng bË sË may mæn cÒa ÆÓt nµy ! %s  sË Æ∆c bi÷t: <color=green>%s<color>", szNormalNumInfo, szSpecNumInfo)
		GlobalExecute(format("dw AddLocalCountNews([[%s]], 1)", szMsg))
		GlobalExecute(format("dw Msg2SubWorld([[%s]])", szMsg))
		SaveBetInfo();
	end
	
	if (170000 <= nTime and nTime < 180000) then
		-- clear bet result
		OutputMsg(format("%d bet number end", nDate));
		RemoteExc("\\script\\event\\expansion\\201006\\fuguijinhe\\fuguijinhe.lua", "tbBetInfo:ClearNumInfo");
		--GlobalExecute("dwf \\script\\event\\expansion\\201006\\fuguijinhe\\fuguijinhe.lua tbBetInfo:ClearNumInfo()");
	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
	local nTime = tonumber(date("%H%M%S"));
	
	SendBetCount();
	
	if (171000 >= nTime or nTime >= 221000) then
		SendBetNumber();
	end
end