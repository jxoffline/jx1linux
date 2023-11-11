function OnDeath()
	Uworld76 = GetTask(76)
	if (Uworld76 == 40) and (HaveItem(371) == 0) and (random(0,99) < 50) then
		AddEventItem(371)
		Msg2Player("LÊy ®­îc n­íc cña §¬n Tr¹ch ")
		AddNote("LÊy ®­îc n­íc cña §¬n Tr¹ch ")
	end
end
