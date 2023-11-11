-- 帮会写日至用的
if not cTongLog then

cTongLog = {
}

function cTongLog:TB2StrMsg(szAction, nTongID, tbMsg)
	local szMag	= ""
	for key, value in tbMsg do
		szMag	= szMag.."\t"..key..":"..tostring(value)
	end
	if (nTongID) then
		szMag	= "\ttong:"..TONG_GetName(nTongID)..szMag
		if (ExecutorId) then
			szMag	= szMag.."\texecutor:"..TONGM_GetName(nTongID, ExecutorId)
		end
	end
	return "act:"..tostring(szAction)..szMag
end

function cTongLog:WriteLog(szLevel, szMod, szMsg)
	TONG_WriteLog(date("%Y-%m-%d %H:%M:%S\t(")..tostring(szLevel)..")\tmod:"..tostring(szMod).."\t"..tostring(szMsg).."\r\n")
end

function cTongLog:WriteInf(szMod, szMsg)
	self:WriteLog("INF", szMod, szMsg)
end
function cTongLog:WriteInfTB(szMod, szAction, nTongID, tbMsg)
	cTongLog:WriteInf(szMod, self:TB2StrMsg(szAction, nTongID, tbMsg))
end

function cTongLog:WriteWar(szMod, szMsg)
	self:WriteLog("WAR", szMod, szMsg)
	print("Ton["..szMod.."]\t"..tostring(szMsg))
end
function cTongLog:WriteWarTB(szMod, szAction, nTongID, tbMsg)
	cTongLog:WriteWar(szMod, self:TB2StrMsg(szAction, nTongID, tbMsg))
end

function cTongLog:WriteErr(szMod, szMsg)
	self:WriteLog("ERR", szMod, szMsg)
	_ERRORMESSAGE("["..szMod.."]\t"..tostring(szMsg))
end
function cTongLog:WriteErrTB(szMod, szAction, nTongID, tbMsg)
	self:WriteErr(szMod, self:TB2StrMsg(szAction, nTongID, tbMsg))
end

end	--if not cTongLog

