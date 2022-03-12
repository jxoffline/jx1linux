--description: ÌÆÃÅÖñº£µÚÈı¹ØµĞÈË
--author: yuanlan	
--date: 2003/3/10
-- Update: Dan_Deng(2003-08-13)

function OnDeath()
	Uworld37 = GetByte(GetTask(37),1)
	if (Uworld37 == 60) then
		i = random(0,7)
		if (i == 0) then
			Talk(1,"","Chİnh §«ng lµ L«i ")
			Msg2Player("Cã ®­îc khÈu quyÕt: Chİnh §«ng Vi L«i ")
		elseif (i == 1) then
			Talk(1,"","Chİnh Nam lµ Háa")
			Msg2Player("Cã ®­îc khÈu quyÕt  Chİnh Nam Vi Háa ")
		elseif (i == 2) then 
			Talk(1,"","Chİnh T©y lµ méc")
			Msg2Player("Cã ®­îc khÈu quyÕt  Chİnh T©y Vi ChiÓu ")
		elseif (i == 3) then 
			Talk(1,"","Chİnh B¾c lµ n­íc")
			Msg2Player("Cã ®­îc khÈu quyÕt  Chİnh B¾c Vi Thuû ")
		elseif (i == 4) then 
			Talk(1,"","§«ng Nam lµ giã ")
			Msg2Player("Cã ®­îc khÈu quyÕt  §«ng Nam Vi Phong ")
		elseif (i == 5) then 
			Talk(1,"","§«ng B¾c lµ nói")
			Msg2Player("Cã ®­îc khÈu quyÕt  §«ng B¾c Vi s¬n  ")
		elseif (i == 6) then 
			Talk(1,"","T©y Nam lµ ®Êt")
			Msg2Player("Cã ®­îc khÈu quyÕt: T©y Nam Vi §Şa ")
		else
			Talk(1,"","T©y B¾c lµ trêi")
			Msg2Player("Cã ®­îc khÈu quyÕt  T©y B¾c Vi Thiªn ")
		end
	end
end;
