--Create by mengfan ,2004-9-17
--团圆饼技能
--作用：使用后，使用者及其附近队员30分钟内获得双倍经验时间。
--获得条件：系统发放，集齐获得此物品所需要的所有单字。

function GetSkillLevelData(levelname, data, level)

if (levelname == "expenhance_p") then
return Getexpenhance_p(level)
end;

str1 = ""
return str1
end;

function Param2String(Param1, Param2, Param3)
return Param1..","..Param2..","..Param3
end;

function Getexpenhance_p(level)
return Param2String(100, 32400, 0)
end;
