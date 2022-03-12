CAKE_ITEM = 
{
{"B¸nh sinh nhËt",200000},
{"B¸nh Sinh nhËt th­îng h¹n",1000000},
}

MAX_EXP_CAKE = 50000000
TASK_CAKE_EXP = 1743

function main()
	if (GetTask(TASK_CAKE_EXP) < MAX_EXP_CAKE) then
		Msg2Player("B¹n ®· ¨n 1 "..CAKE_ITEM[caketype][1]..", nhËn ®­îc phÇn th­ëng"..CAKE_ITEM[caketype][2].."®iÓm kinh nghiÖm.")
		AddOwnExp(CAKE_ITEM[caketype][2])
		SetTask(TASK_CAKE_EXP,GetTask(TASK_CAKE_EXP) + CAKE_ITEM[caketype][2]) 
		if (GetTask(TASK_CAKE_EXP) >= MAX_EXP_CAKE) then
			Msg2Player("B¹n chØ cã thÓ nhËn ®­îc 50 triÖu ®iÓm kinh nghiÖm tõ b¸nh sinh nhËt mµ th«i!")
		else
			Msg2Player("B¹n cã thÓ ¨n thªm b¸nh sinh nhËt ®Ó nhËn "..(MAX_EXP_CAKE-GetTask(TASK_CAKE_EXP)).."®iÓm kinh nghiÖm.")
		end
		return 0
	else
		Say("B¹n chØ cã thÓ nhËn ®­îc 50 triÖu ®iÓm kinh nghiÖm tõ b¸nh sinh nhËt mµ th«i!",0)
		return 1
	end
end