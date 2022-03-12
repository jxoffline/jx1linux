-- ÁúÃÅÕò Õ½¶· Ò°Öí ĞÂÊÖÈÎÎñ£ºÒ°ÖíÈâ
-- By£ºDan_Deng(2003-09-17)

function OnDeath()
	UTask_world27 = GetTask(27)
	if (UTask_world27 == 5) and (random(0,99) < 80) then
		AddEventItem(228)
		if (GetItemCount(228) >= 3) then
			Msg2Player("Khi nµo ng­¬i lÊy ®ùîc 3 miÕng thŞt heo rõng th× míi cã thÓ ®i tiÕp ")
			AddNote("Khi nµo ng­¬i lÊy ®ùîc 3 miÕng thŞt heo rõng th× míi cã thÓ ®i tiÕp ")
		else
			Msg2Player("GiÕt ®­îc mét con heo rõng th× b¹n lÊy ®­îc mét miÕng thŞt ")
		end
	end
end;
