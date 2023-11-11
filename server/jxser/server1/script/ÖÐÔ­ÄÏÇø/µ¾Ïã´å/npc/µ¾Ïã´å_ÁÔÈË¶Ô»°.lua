--description: ĞÂÊÖ´å_ÁÔÈË
--author: wangzg	
--date: 2003/7/21
--update 2003/7/28 yuanlan

function main()
	UTask_world38=GetTask(66)
	if (UTask_world38==2) then
		Say("Sè cña ta gÇn ®©y kh«ng tÖ, c¸ch ®©y kh«ng l©u lªn nói s¨n ®­îc 1 con m·nh hæ, x­¬ng con hæ nµy cã thÓ lµ d­îc liÖu quı, ta muèn 150 l­îng b¹c.", 2 ,"Mua/yes","Kh«ng mua/no")
	else	
		Say("Trong sè nh÷ng ng­êi ®i s¨n ë vïng nµy, ta x­ng thø hai kh«ng ai d¸m x­ng thø nhÊt! ",0)	
	end
end;

function yes()
	if (GetCash() < 150) then
		Talk(1,"","§îi cã tiÒn råi ng­¬i h·y ®Õn t×m ta!")
	else
		Pay(150)
		AddEventItem(185)
		Msg2Player("Tõ chç thî s¨n mua x­¬ng Hæ. ")
		AddNote("Tõ chç thî s¨n mua x­¬ng Hæ. ")
	end
end;

function no()
end
	
