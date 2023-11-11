--特效仙草露
--8小时经验双倍
IncludeLib("SETTING"); --载入SETTING脚本指令库

function main()
--	if (GetNpcExpRate() <= 100) then
		AddSkillState(451, 20, 1, 1080 * 60 * 8);
--	else
--		Say("对不起，目前暂时无法使用特效仙草露。", 0)
--		return 1;
--	end;
--	return 0;
end;