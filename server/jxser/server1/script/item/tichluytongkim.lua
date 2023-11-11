
function main()
	local UserDefineTask_TK = 747
	local nAdd =10000
	local nScoreTK = GetTask(UserDefineTask_TK)
	SetTask(UserDefineTask_TK,  nScoreTK + nAdd)
	Msg2Player("Chóc mõng ®¹i hiÖp nhËn ®­îc 10000 ®iÓm tİch lòy tèng kim")
	return 0
end