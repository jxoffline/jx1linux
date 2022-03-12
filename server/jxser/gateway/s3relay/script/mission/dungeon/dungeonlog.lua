Include("\\script\\lib\\common.lua")

if not tbDungeonLog then
	tbDungeonLog = {}
end

function tbDungeonLog:WriteLog(szFormat,...)
	local logfilename = "\\relay_log\\"..date("%Y_%m_%d").."\\dungeon.log";
	WriteStringToFile(logfilename, format(szFormat, unpack(arg)) .. "\n");
end