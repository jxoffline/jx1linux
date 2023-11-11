
function GetSkillLevelData(levelname, data, level)
	if (levelname == "showpersoninfo") then
		return "1,360000,0"
	end;
	if (levelname == "ignoredamage") then
		return "1,3600,0"
	end
	return ""
end;