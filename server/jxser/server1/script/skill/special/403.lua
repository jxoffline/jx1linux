function GetSkillLevelData(levelname, data, level)

	if (levelname == "physicsres_p") then
		return Getphysicsres_p()
	end;

	if (levelname == "coldres_p") then
		return Getcoldres_p()
	end;
	
	if (levelname == "lightingres_p") then
		return Getlightingres_p()
	end;

	if (levelname == "fireres_p") then
		return Getfireres_p()
	end;

	if (levelname == "poisonres_p") then
		return Getpoisonres_p()
	end;

	return ""
end;

function Getphysicsres_p()
	return Param2String(5,10800,0)
end;


function Getcoldres_p()
	return Param2String(5,10800,0)
end;


function Getlightingres_p()
	return Param2String(5,10800,0)
end;

function Getfireres_p()
	return Param2String(5,10800,0)
end;

function Getpoisonres_p()
	return Param2String(5,10800,0)
end;



function Param2String(Param1, Param2, Param3)
	return Param1..","..Param2..","..Param3
end;

