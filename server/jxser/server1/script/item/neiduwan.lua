-- 内毒丸 10分钟内，增加内功系毒伤害50点

Include( "\\script\\item\\nei_wan.lua" )

function main()
	EatNei_Wan(2, 5, 1, 10800);
	return 0
end