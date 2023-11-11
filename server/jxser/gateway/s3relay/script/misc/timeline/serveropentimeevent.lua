Include("\\script\\lib\\objbuffer_head.lua")

SERVER_OPEN_TIME = nil;

function LoadServerOpenTime()
	local handle = OB_Create();
	OB_LoadShareData(handle, "FUNC_SERVER_OPEN_TIME", 0, 0);
	local nOpenTime = ObjBuffer:PopObject(handle);
	OB_Release(handle);
	
	if (nOpenTime ~= nil and type(nOpenTime) == "number" and nOpenTime > 0) then
		SERVER_OPEN_TIME = nOpenTime;
	else
		if (SERVER_OPEN_TIME == nil or type(SERVER_OPEN_TIME) ~= "number" or SERVER_OPEN_TIME <= 0) then
			local nDate = GetCurrentDate();
			SERVER_OPEN_TIME = ConvertTMToTime(nDate)

			local handle = OB_Create();
			ObjBuffer:PushObject(handle, SERVER_OPEN_TIME);
			OB_SaveShareData(handle, "FUNC_SERVER_OPEN_TIME", 0, 0);
			OB_Release(handle);
		end
	end
	
end

function GetServerOpenTime()
	return SERVER_OPEN_TIME;
end

function SetServerOpenTime(nTime)
	SERVER_OPEN_TIME = nTime;
	local handle = OB_Create();
	ObjBuffer:PushObject(handle, SERVER_OPEN_TIME);
	OB_SaveShareData(handle, "FUNC_SERVER_OPEN_TIME", 0, 0);
	OB_Release(handle);
end

function ConvertTMToTime(nDate)
	local nNowYear = (floor(nDate/10000));
	local nNowMon = floor(mod(nDate, 10000) / 100);
	local nNowDay = mod(nDate, 100);
	return Tm2Time(nNowYear, nNowMon, nNowDay);
end

function ConvertTimeToTM(nTime)
	local tbTM = Time2Tm(nTime);
	return tbTM[1]*10000 + tbTM[2]*100 + tbTM[3];
end

--SetServerOpenTime(0)
LoadServerOpenTime();