-- 西北北区 龙门镇 木桩死亡 新手村练级任务(不可重复的任务)
-- Update: Dan_Deng(2003-08-09)
-- Update: Dan_Deng(2003-11-04)改为模板方式，全服统一调用一个函数以利于维护、扩展

Include("\\script\\global\\各派接引弟子\\轻功_木桩模板.lua")

function OnDeath()
	learn()
end;
