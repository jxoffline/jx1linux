Include("\\script\\gb_taskfuncs.lua");

SPRINGFESTIVAL = "springfestival07";
INTERVAL = 15;	--	Ê±¼ä¼ä¸ô
DATEBEGIN = 20070209;
DATEEND = 20070223;
STREXECUTE = "dwf \\script\\missions\\springfestival\\gmstartup.lua startmission()";

NEWS = "the 2007 spring festival game active start up.";

Include([[\RelaySetting\Task\festivals\lib.lua]]);

function righttime_add()
	local nTime = tonumber(date("%H"));
	if (nTime >= 12 and nTime < 14) or (nTime >= 19 and nTime < 23) or (nTime >= 1 and nTime < 3) then
		return 1;
	end;
	return 0;
end;

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
