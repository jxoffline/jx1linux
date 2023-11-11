function OnDeath()
	Uworld76 = GetTask(76)
	if (Uworld76 == 40) and (HaveItem(370) == 0) and (random(0,99) < 50) then
		AddEventItem(370)
		Msg2Player("Nghe thÊy tiÕng sÊm sÐt næ ")
		AddNote("Nghe thÊy tiÕng sÊm sÐt næ ")
	end
end
