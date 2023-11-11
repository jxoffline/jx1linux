Task_TongGet_Award = 2739
Task_TongCityWar_Bonus = 2740
Task_TongCityWar_Date = 2741
End_TongGetBonus_Date = 20101024
End_TongGetCityWarBonus_Date = 20101112

function MergerSV_TongGetBonus_Date()
		local nDate = tonumber(GetLocalDate("%Y%m%d"))
		if (nDate > End_TongGetBonus_Date) then
			return 0
		end
		return 1
end


function MergerSV_TongGetBonusCitywar_Time()
		local nDate = tonumber(GetLocalDate("%Y%m%d"))
		local nTime = tonumber(GetLocalDate("%H%M"))
		local nDOW = tonumber(date("%w"))
		if (nDate > 20101112) then
			return 0
		end
		if (nDOW ~= 5) then
			return 0
		end
		if (nTime < 2130 ) then
			return 0
		end
		return 1
end

function Check_PlayerObj()
	local nLevel = GetLevel()
	if (ST_GetTransLifeCount() < 2) then
		if (nLevel < 150) then
			return 0
		end
	else
		if (nLevel < 80) then
			return 0
		end
	end
	return 1
end

function Check_CityTongWar()
	local szTongName, nTongID = GetTongName();
	for i = 1, 7 do
		local strCityTongName = GetCityOwner(i)
		if (szTongName == strCityTongName) then
			return 1
		end
	end
	return 0
end

