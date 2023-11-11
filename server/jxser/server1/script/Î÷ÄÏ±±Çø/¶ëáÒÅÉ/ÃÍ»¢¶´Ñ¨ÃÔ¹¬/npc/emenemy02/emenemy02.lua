--description: ¶ëáÒÅÉÃÍ»¢¶´Ñ¨µĞÈË
--author: yuanlan	
--date: 2003/3/4
-- Update: Dan_Deng(2003-08-12)

function OnDeath()
	UTask_em = GetTask(1)
	if (UTask_em >= 20*256+50) and (UTask_em < 20*256+53) then	
		UTask_em = UTask_em + 1
		SetTask(1,UTask_em)
		if (UTask_em == 20*256+53) then
			Talk(1,"","Tuy B¹ch Hæ Tinh hung h·n, nh­ng sau khi bŞ b¹n 3 lÇn thu phôc, cuèi cïng ®· ngoan ngo·n khuÊt phôc. N¹n Hæ d÷ ®· diÖt xong, b¹n cã thÓ trë vÒ phôc mÖnh!")
			SetTask(1,20*256+80)
			Msg2Player("Chóc mõng b¹n thu phôc ®­îc m·nh hæ! ")
			AddNote("ë M·nh Hæ ®éng sau nói, liªn tôc ba lÇn ®¸nh b¹i hæ v­¬ng b¹ch hæ tinh, thu phôc thµnh c«ng m·nh hæ. ")
		else
			Msg2Player("Ng­¬i ®· ®¸nh b¹i b¹ch hæ tinh, nh­ng tİnh hæ cøng ®Çu ch­a ch¾c ®· thu phôc ®­îc. ")
		end
	end
end;
