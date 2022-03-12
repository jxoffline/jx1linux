-- 内电丸 10分钟内，增加内功系电攻伤害100点

Include( "\\script\\item\\nei_wan.lua" )

function main()
	EatNei_Wan(5, 10, 1, 10800);
	return 0
end