Include( "\\script\\leaguematch\\head.lua" )

function OnReceiveMatchResult(szParam)
	_M("OnReceiveMatchResult("..szParam..")")
	--拆分传入参数
	local aryParam = split(szParam, " ")
	matchtype = tonumber(aryParam[1])
	matchid = tonumber(aryParam[2])
	league1 = aryParam[3]
	league2 = aryParam[4]
	result = tonumber(aryParam[5])

	local logfilename = "\\relay_log\\"..date("%Y_%m_%d").."\\wlls_"..GetGblInt(RLGLB_WLLS_MATCHID)..".log"
	league1 = wlls_getlginfo(league1)
	league2 = wlls_getlginfo(league2)
	
	WriteStringToFile(logfilename, tostring(matchtype).."\t"..tostring(matchid).."\t"..league1.."\t"..league2.."\t"..tostring(result).."\n")
end
