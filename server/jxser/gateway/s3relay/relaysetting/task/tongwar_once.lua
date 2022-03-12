TONGWAR_LGTYPE = 10
TONGWAR_LGMTASK_JOB = 1
LOGFILE = "relay_log\\tongwar.log"
function TaskShedule()
	-- …Ë÷√∑Ω∞∏√˚≥∆
	TaskName("Tham gia trÀn tranh ß÷ nh t ang V‚ L©m")
	-- ÷ª÷¥––“ª¥Œ
	TaskInterval( 244000 )
	TaskCountLimit( 1 )
end

function TaskContent()
	for i = 1, 7 do
		local strCityName = GetCityAreaName(i)
		local strCityTongName = GetCityOwner(i)
		if (FALSE(LG_GetLeagueObj(TONGWAR_LGTYPE, strCityName))) then
			nLeagueID = LG_CreateLeagueObj()
			LG_SetLeagueInfo(nLeagueID, TONGWAR_LGTYPE, strCityName)
			LG_ApplyAddLeague(nLeagueID, "", "")
			LG_FreeLeagueObj(nLeagueID)
			
			if (not FALSE(strCityTongName))then
				nMemberID = LGM_CreateMemberObj()
				--…Ë÷√…ÁÕ≈≥…‘±µƒ–≈œ¢(Ω«…´√˚°¢÷∞Œª°¢…ÁÕ≈¿‡–Õ°¢…ÁÕ≈√˚≥∆)
				LGM_SetMemberInfo(nMemberID, strCityTongName, 1, TONGWAR_LGTYPE, strCityName)
				LGM_ApplyAddMember(nMemberID, "", "")
				LGM_FreeMemberObj(nMemberID)
				LG_ApplySetMemberTask(TONGWAR_LGTYPE, strCityName, strCityTongName, TONGWAR_LGMTASK_JOB, 1)
			end
			WriteStringToFile(LOGFILE, strCityName.."\t"..strCityTongName.."\n")
		end
	end
end


function _msg(...)
local str = ""
	for i = 1, getn(arg) do
		str = str.." "..arg[i]
	end
	OutputMsg(str)
end

--»Áπ˚Œ™nilªÚ0£¨∑µªÿ1£¨∑Ò‘Ú∑µªÿ0
function FALSE(value)
	if (value == 0 or value == nil or value == "") then
		return 1
	else
		return nil
	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
