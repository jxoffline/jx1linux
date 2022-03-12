-- ÁÙ°²µÄ²Ã·ì£¬¿ÉÒÔÂò»éÀñ¼ª·þ
-- By: Dan_Deng(2003-12-29)
-- GetTask(67): µÚ24×ÖÎ»Îª»é·ñ±ê¼Ç£¬µÚ1×ÖÎ»ÎªÊÇ·ñÒÑÂò¼ª·þ

function main(sel)
	Uworld67 = GetTask(67)
	if (GetBit(Uworld67,24) == 1) then			-- ÒÑ»é
		if (GetBit(Uworld67,1) == 0) then		-- ÉÐÎ´Âò¹ý£¬¿ÉÒÔÂò»éÀñ·þ
			if (GetSex() == 0) then					-- ÄÐ¶Ô»°£¬ÂòÄÐ×°
				Talk(1,"buy_sale","¤ng chñ! Nghe vî ta nãi lÔ phôc ®¸m c­íi nhµ «ng trø danh thiªn h¹, b©y giê cã b¸n kh«ng? ")
			else
				Talk(1,"buy_sale","¤ng chñ! V¸y c­íi nhµ «ng cùc kú ®Ñp,lÇn nµy cã hµng kh«ng vËy? ")
			end
		else
			Talk(1,"","QuÇn ¸o lÇn tr­íc mua ë bæn tiÖm mÆc vÉn võa vÆn chø! Nhí nãi víi b¹n bÌ th©n thÝch cña ng­¬i nhÐ!")
		end
	else
		Talk(1,"","Kh«ng ph¶i ta nãi qu¸ ®©u, c¸c lo¹i lÔ phôc cña nhµ ta lµ tèt nhÊt trªn thÕ gian, lóc nµo cÇn nhí ghÐ ®Õn nhÐ! ")
	end
end

function buy_sale()
	Say("ë ®©y ta chuyªn may quÇn ¸o lÔ phôc, ®­¬ng nhiªn lo¹i nµo còng cã, chØ lµ gi¸ tiÒn h¬i ®¾t mét chót, cÇn 88888 l­îng. ",2,"Ngµy ®¹i hû, ®­¬ng nhiªn Ta muèn mua mét bé. /buy_yes","Kh«ng cÇn ®©u, ta ch­a lµm ®¸m c­íi /no")
end

function buy_yes()
	if (GetCash() >= 88888) then
		Pay(88888)
		if (GetSex() == 0) then
			AddItem(0,2,28,1,random(0,4),0,0)
		else
			AddItem(0,2,28,4,random(0,4),0,0)
		end
		Uworld67 = GetTask(67)
		Uworld67 = SetBit(Uworld67,1,1)
		SetTask(67,Uworld67)
		Talk(1,"","Kh«ng thµnh vÊn ®Ò, sÏ gãi l¹i cho kh¸c quan ngay, nh©n thÓ chóc kh¸ch quan tr¨m n¨m h¹nh phóc!")
	else
		Talk(1,"","Kh«ng ph¶i lµ ng­êi giµu cã, th× ®õng ®ßi hái mÊy thø lÔ nghi nµy. Muèn g×, kiÕm ®ñ tiÒn ®· råi h½ng ®Õn mua!")
	end
end

function no()
end
