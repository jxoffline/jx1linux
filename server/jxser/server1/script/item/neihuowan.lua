-- 内火丸 10分钟内，增加内功系火伤害100点

Include( "\\script\\item\\nei_wan.lua" )

function main()
	EatNei_Wan(4, 10, 1, 10800);
	return 0
end