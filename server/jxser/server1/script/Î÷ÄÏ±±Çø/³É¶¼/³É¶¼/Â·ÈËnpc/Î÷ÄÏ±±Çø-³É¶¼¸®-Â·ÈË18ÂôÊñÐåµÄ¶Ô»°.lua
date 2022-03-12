--Î÷ÄÏ±±Çø ³É¶¼¸® Â·ÈË18ÂôÊñĞåµÄ¶Ô»°
--author: yuanlan	
--date: 2003/3/10
-- Update: Dan_Deng(2003-08-13)

function main(sel)
	UTask_tm = GetTask(2)
	if (UTask_tm == 10*256+20) then			--ÌÆÃÅÊ®¼¶ÈÎÎñ¹ı³ÌÖĞ
		Talk(2, "", "Ta b¸n ë ®©y ®Òu lµ hµng thªu Tø Xuyªn cña danh gia T«n UyÓn. C« Êy rÊt næi tiÕng ë phñ Thµnh §« nµy, ®­êng kim mòi chØ rÊt khĞo, ®øng ®Çu c¶ phñ, Nhµ c« ta ë gÇn qu¸n trµ Phï dung phia ®«ng nam thµnh. ", "§· lµ danh gia thªu, ch¾c h¼n trong nhµ kim thªu kh«ng thiÕu, cã lÏ c« Êy ë ®ã cã thÓ nghe ®­îc mét sè tin tøc vÒ Ma Vò Ch©m.")
		AddNote("T¹i chç Mai N­¬ng ®­îc biÕt Danh gia thªu lôa Tø Xuyªn T«n UyÓn cã ®­êng kim mòi chØ rÊt kú tµi, ë gÇn qu¸n trµ Phï Dung phİa ®«ng nam thµnh. ")
		SetTask(2,10*256+30)
	elseif (UTask_tm == 10*256+30) then			--ÌÆÃÅÊ®¼¶ÈÎÎñ¹ı³ÌÖĞ
		Talk(1, "", "Ta b¸n ë ®©y ®Òu lµ hµng thªu Tø Xuyªn cña danh gia T«n UyÓn. C« Êy rÊt næi tiÕng ë phñ Thµnh §« nµy, ®­êng kim mòi chØ rÊt khĞo, ®øng ®Çu c¶ phñ, Nhµ c« ta ë gÇn qu¸n trµ Phï dung phia ®«ng nam thµnh. ")
	elseif (random(0,1) == 0) then
		Talk(1,"","Ng­êi ë ®©u ®Õn vËy? Hµng thªu Tø Xuyªn nµy lµ 'Thôc Trung Chi B¶o' cña chóng ta, ng­êi thö nh×n xem, ®­êng may hoµn chØnh, ®­êng c¾t bãng nho¸ng, chÆt chÏ ªm dŞu, ®©y ®óng lµ thñ c«ng th­îng h¹ng ®ã, mua mét c¸i vÒ lµm kû niÖm ®i!")
	else
		Talk(1,"","Thİch bé 'phï dung lı ng­' kh«ng? Cã thÊy thªu gièng y nh­ thËt kh«ng?")
	end
end;
