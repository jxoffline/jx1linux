-- ÄÏÔÀÕò Â·ÈË ±¼»ð
-- 2004/4/17 Ãû¾Ô±¼»ðÈÎÎñ by fangjieying

function main()
	Uworld76 = GetTask(76)
	if (Uworld76 == 10) then
		Talk(1,"","Mét con tuÊn m· ®øng n¬i gèc c©y, h×nh nh­ ®ang dáng tai lªn nghe lêi b¹n nãi")
		SetTask(76,20)
		Msg2Player("Xem ra con ngùa nµy ®· bÞ bÖnh, viÖc Bµnh ®¹i gia nhê ph¶i ch¨ng lµ cã liªn quan ®Õn chuyÖn nµy ")
	elseif (Uworld76 == 50) and (HaveItem(375) == 1) then		-- ÖÎºÃÁË
		DelItem(375)
		SetTask(76,60)
		DelMagic(396)
		if (HaveMagic(397) == -1) then		-- ±ØÐëÃ»ÓÐ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(397)
		end
		Msg2Player("B¹n lÜnh ngé ®­îc t©m ph¸p Vò Lé trïng Sinh ")
		Talk(1,"","B¹n ®­a HuyÕt Dïng hßa cho ngùa nuèt, ®ång thêi vËn khëi 'Xu©n Phong Vò Lé' Kú thuËt T©m ph¸p, m¾t cña B«n Háa dÇn dÇn s¸ng lªn. Cho ®Õn lóc nµy b¹n míi thËt sù lÜnh ngé ®­îc'Vò Lé phôc sinh' T©m ph¸p")
	elseif (Uworld76 >10) and (Uworld76 < 50) then
		Talk(1,"","B«n Háa hÝ vang lªn mét tiÕng nh­ sÊm ®éng ngang tai")
	elseif (Uworld76 > 50) then
		Talk(1,"","B¹n ®· ch÷a lnµh bÖnh cho B«n Háa")
	else
		Talk(1,"","§©y lµ con ngùa cã l«ng ®á nh­ m¸u, tªn gäi 'B«nHáa'")
	end
end
