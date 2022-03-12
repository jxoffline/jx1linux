-- ´äÑÌÃÅ Â·ÈËNPC ´ºÏãÆÅÆÅ£¨´äÑÌÃÅ³öÊ¦ÈÎÎñ£©
-- by£ºDan_Deng(2003-07-27)

function main()
	UTask_cy = GetTask(6)
	if (GetFaction() == "cuiyan") then
		if (UTask_cy == 60*256+20) then				--³öÊ¦ÈÎÎñ½øĞĞÖĞ
			Talk(2,"","Bµ bµ! L·o b¸ ®ã ®· nãi cho ta nghe ch©n t­íng sù thËt, ta sÏ ®­a bøc th­ n¨m ®ã cho Ch­ëng m«n, mäi ng­êi xem xong sÏ hiÓu nçi khæ t©m cña S­ tæ! ","T©m nguyÖn n¨m ®ã cña S­ tû, ta ®· thay S­ tû hoµn thµnh, vËy còng ®· may råi! ")
			SetTask(6,60*256+30)
		elseif (UTask_cy == 60*256) and (GetLevel() >= 50) then		--³öÊ¦ÈÎÎñ
			Talk(3,"L60_get","Ng­êi ngoµi lu«n cã thµnh kiÕn víi Thóy Yªn chóng ta, ngay c¶ ®Ö tö còng truyÒn r»ng tæ s­ s¸ng lËp ph¸i, do bŞ ng­êi yªu ruång bá nªn tİnh t×nh thay ®æi rÊt nhiÒu, c¨m hËn hÕt tÊt c¶ ®µn «ng trong thiªn h¹, cho nªn ®· ®Şnh ra m«n quy kh¾c nghiÖt, khiÕn cho c¸c ®Ö tö trong m«n ®êi ®êi c¨m ghĞt ®µn «ng.","Nh÷ng m«n quy nµy nh­ mét sîi d©y lu«n buéc chÆt tÊt c¶ mäi ng­êi, kú thùc vèn kh«ng ph¶i nh­ vËy, nguyªn do trong ®ã ng­êi ngoµi kh«ng hiÓu th× mÆc, tù b¶n th©n chïng ta còng kh«ng muèn khiÕn ng­êi kh¸c th­¬ng t©m nh­ vËy.","Lµm thÕ nµo míi cã thÓ khiÕn mäi ng­êi hiÓu ®­îc ch©n t­íng sù viÖc nµy chø?")
		else
			Talk(1,"","Tõ nhá ®· l­u l¹c trong chèn giang hå, chíp m¾t ®· nhiÒu n¨m tr«i qua råi ")
		end
	else
		Talk(1,"","Nhí ngµy nµo ta cßn ½m Do·n ch­ëng m«n trªn tay, b©y giê ®· lín thÕ nµy råi! Thêi gian tr«i qua nhanh nh­ tªn b¾n! ")
	end
end;

function L60_get()
	Say("Ch©n t­íng sù thËt cã liªn quan ®Õn mét ng­êi trong cÊm ®Şa, chØ cã t×m ®­îc ng­êi nµy th× tr¾ng ®en sÏ râ rµng",2,"TiÕp tôc t×m hiÓu /L60_get_yes","Hay mÆc kÖ kh«ng lo /L60_get_no")
end;

function L60_get_yes()
	Talk(4,"","Th©n lµ ®Ö tö bæn m«n, tù thÊy cã tr¸ch nhiÖm ph¶i t×m ra sù thËt.","Ra khái cæng ®i theo h­íng §«ng B¾c sÏ ®Õn Ngäc N÷ hå, cÊm ®Şa ë gÇn Ngäc N÷ hå.","§­îc råi! Ta ®i ®©y! ","§õng véi! Ng­êi b¹n trÎ! §Ó b¶o vÖ tİnh m¹ng cho ng­¬i, tr­íc khi gÆp ng­êi ®ã cÇn ph¶i cã mét c¸i kh¨n t¬, kh¨n t¬ nµy sÏ xuÊt hiÖn trong S¬n §éng cña CÊm Cung."	)
	SetTask(6,60*256+10)
	AddNote("TiÕp nhËn nhiÖm vô xuÊt s­ cña Thóy Yªn M«n, ®iÒu tra ch©n t­íng cña cÊm ®Şa Thóy Yªn m«n ")
	Msg2Player("TiÕp nhËn nhiÖm vô xuÊt s­ cña Thóy Yªn M«n, ®iÒu tra ch©n t­íng cña cÊm ®Şa Thóy Yªn m«n ")
end;

function L60_get_no()
end;
