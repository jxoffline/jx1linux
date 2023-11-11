-- ÑïÖİ Â·ÈËNPC ËïÔ±Íâ£¨ÈëÃÅÈÎÎñ£©
-- by£ºDan_Deng(2003-07-28)

function main()
	Uworld30 = GetByte(GetTask(30),2)
	if ((Uworld30 == 10) and (HaveItem(75) == 0)) then		--ÈëÃÅÈÎÎñÖĞ²¢ÇÒÃ»ÓĞ¸ÃÎïÆ·
		Say("Ph¶i khen thÕ nµo ®©y?",4,"B¹n bÌ /prise_1","Tµi phóc /prise_2","Con ch¸u. /prise_3","Rêi khái/prise_exit")
	else					--ÔÚÆÕÍ¨¶Ô»°ÖĞ¸øÒ»µãµãÈÎÎñÌáÊ¾¡£
		if (random(0,1) == 0) then
			Talk(1,"","Bän cïng khæ ®ã suèt ngµy cø ®Õn quÊy rèi! Hõm! Mét chót ta còng kh«ng cho!")
		else
			Talk(1,"","Ta n¨m nay ®· gÇn 50 tuæi råi, mét ®øa con trai còng kh«ng cã. Sau nµy bao nhiªu s¶n nghiÖp nµy ta kh«ng biÕt ph¶i nh­êng l¹i cho ai ®©y!")
		end
	end
end;

function prise_1()
	Talk(2,"","VŞ l·o gia nµy, võa nh×n ®· biÕt ngay lµ ng­êi hµo hiÖp th­¬ng ng­êi. B»ng h÷u n¬i nµo còng cã. ThËt ®óng lµ M¹nh Th­êng Qu©n thø hai vËy"," M¹nh Th­êng Qu©n lµ c¸i th¸ g×? H¾n cã ®­îc bao nhiªu tiÒn? C¸i ®¸m bÇn cïng nµy suèt ngµy cø ®Õn ®©y ®Ó vßi xin! Ch¾c ng­¬i còng vËy th«i! §i! §i! §i!")
end;

function prise_2()
	Talk(2,"","VŞ l·o gia nµy giµu cã nhÊt vïng, danh tiÕng kh¾p n¬i. §Õn Hoµng Th­îng còng khã mµ b× ®­îc víi sù phó quı cña ngµi! Ta chóc «ng tiÒn v« ngµy cµng nhiÒu,phiÒn phøc ngµy cµng İt!"," Hõm!C¸i tªn tiÓu quû nµy miÖng l­ìi cña h¾n míi ngät lµm sao! §­îc! Xem nh­ h«m nay ta më lßng mét lÇn vËy. MiÕng 'b¶n chØ' nµy ta tÆng cho ng­¬i!")
	AddEventItem(75)
	Msg2Player("T«n Viªn Ngo¹i tÆng b¹n B¶n chØ ")
	AddNote("T«n Viªn Ngo¹i tÆng b¹n B¶n chØ ")
end;

function prise_3()
	Talk(2,"","VŞ l·o gia nµy thËt cã phóc t­íng. Trong nhµ nhÊt ®Şnh lµ cã nhiÒu 'kiÒu thª mü thiÕp ' vµ quı tö ®Çy nhµ ph¶i kh«ng?","Hõm! Kh«ng nãi th× th«i! Nãi ra l¹i cßn buån! Ta n¨m nay ®· gÇn 50 tuæi, mét ®øa con trai còng kh«ng cã, bao nhiªu s¶n nghiÖp ngµy sau kh«ngbiÕt ®Ó l¹i cho ai?")
end;

function prise_exit()
end;
