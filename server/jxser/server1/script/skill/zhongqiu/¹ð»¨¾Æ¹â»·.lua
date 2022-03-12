--Create by mengfan ,2004-9-17
--桂花酒技能
--作用：使用后，使用者及其组队队员幸运值30分钟内增加20点。
--获得条件：系统发放，集齐获得此物品所需要的所有单字。

function GetSkillLevelData(levelname, data, level)

if (levelname == "lucky_v") then
return Getlucky_v(level)
end;

str1 = ""
return str1
end;

function Param2String(Param1, Param2, Param3)
return Param1..","..Param2..","..Param3
end;

function Getlucky_v(level)
return Param2String(20,32400,0)
end;
