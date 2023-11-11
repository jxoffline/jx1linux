--description: ÖÐÔ­ÄÏÇø ÏåÑô¸® Â·ÈË8µË¼ÒÉ©×Ó¶Ô»° Îäµ±ÅÉ50¼¶ÈÎÎñ
--author: yuanlan	
--date: 2003/5/16
-- Update: Dan_Deng(2003-08-17)

function main(sel)
	UTask_wd = GetTask(5);
	if (UTask_wd == 50*256+50) then 
		Talk(3, "select", "Nhµ ta kh«ng cßn g× ®Ó ¨n, nh×n con nhá lu«n miªng kªu ®ãi, lµm mÑ nh­ ta thËt rÊt ®au lßng!", "§¹i tÈu, ta ®©y cã 1 v¹n l­îng. TÈu mau nhËn ®i! ChØ cÇn cã ®Ö tö Vâ §ang ta ë ®©y, c¸c ng­êi sÏ kh«ng ph¶i chÞu ®ãi l¹nh n÷a!", "¸i da,ta qu¶ lµ gÆp ®­îc bå t¸t sèng råi! Ta ®ang tØnh hay m¬? B©y giê cßn cã ng­êi tèt vËy sao?")
	elseif (UTask_wd > 50*256+50) then
		Talk(1,"","C¸c ®¹i hiÖp trªn Vâ §ang s¬n thËt lµ bå t¸t sèng cøu m¹ng bän ng­êi cïng khæ ta! NÕu hä kh«ng th­êng gióp ®ì, mÑ con ta ch¾c ®· chÕt ®ãi mÊt råi!")
	else
		Talk(1,"","Nhµ ta kh«ng cßn g× ®Ó ¨n, nh×n con nhá lu«n miªng kªu ®ãi, lµm mÑ nh­ ta thËt rÊt ®au lßng!")
	end
end;

function select()
	if (GetCash() >= 10000) then
		Pay(10000)
		Msg2Player("§em toµn bé mét v¹n l¹ng b¹c c­íp ®­îc trao cho con d©u §Æng gia ")
		SetTask(5, 50*256+80)
		AddNote("§em toµn bé mét v¹n l¹ng b¹c c­íp ®­îc trao cho con d©u §Æng gia ")
	else
		Talk(1,"","ThËt tÖ! 1 v¹n l­îng ®ã ta ®· dïng mÊt råi, thÕ nµy th× lµm sao míi ph¶i ®©y?Ta ph¶i ®i kiÕm chót ng©n l­îng!")
		AddNote("Ng©n l­îng kh«ng ®ñ, ®i kiÕm tiÒn tr­íc. ")
	end
end;
