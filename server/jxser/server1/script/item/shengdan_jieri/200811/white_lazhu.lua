IncludeLib("SETTING"); --载入SETTING脚本指令库

function main()
	--Msg2Player("此功能稍后开放.多谢支持!")
	--return 1
--	if (GetNpcExpRate() <= 100) then
		AddSkillState(451, 20, 1, 1080 * 60);
--	else
--		Say("对不起，目前暂时无法使用仙草露。", 0)
--		return 1
--	end
--	return 0
end