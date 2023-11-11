--прткТувс

function GetSkillLevelData(levelname, data, level)
	if (levelname == "lucky_v") then
		return Getlucky_v()
	end;
	

	return ""
end;


function Getlucky_v()
	return Param2String(30,32400,0)
end;



function Param2String(Param1, Param2, Param3)
	return Param1..","..Param2..","..Param3
end;

