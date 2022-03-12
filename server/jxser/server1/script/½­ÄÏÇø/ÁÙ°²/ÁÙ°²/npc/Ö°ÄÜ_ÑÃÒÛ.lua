-- 职能_衙役.lua 临安（坐牢洗PK）
-- By: Dan_Deng(2003-12-01)

FESTIVAL06_NPCNAME = "<color=yellow>:<color>";
Include("\\script\\global\\洗pk的衙役.lua")
Include([[\script\global\路人_衙门卫兵.lua]]);

function main(sel)
    gsoldier_entance();
end;

function main_former()
	SetTask(93,1)		-- 记住是由临安进来的
	default_talk()
end;
