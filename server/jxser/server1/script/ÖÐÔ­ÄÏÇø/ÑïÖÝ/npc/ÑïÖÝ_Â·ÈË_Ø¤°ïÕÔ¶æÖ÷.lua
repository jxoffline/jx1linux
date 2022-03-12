-- ÑïÖİ Â·ÈËNPC Ø¤°ïÕÔ¶æÖ÷£¨Ø¤°ï30¼¶ÈÎÎñ£©
-- by£ºDan_Deng(2003-07-28)
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(193) == 1 then
		allbrother_0801_FindNpcTaskDialog(193)
		return 0;
	end
	UTask_gb = GetTask(8)
	if (UTask_gb == 30*256+10) then		--30¼¶ÈÎÎñ¿ªÊ¼
		Talk(3,"","TriÖu §µ chñ! La tr­ëng l·o b¶o ®Ö tö ®Õn hái nguyªn nh©n t¹i sao trÔ hÑn!","Lµ v× gÇn ®©y n¬i ®©y x¶y ra nhiÒu chuyÖn l¹ kú. §Ö tö bæn tr¹i ®Õn Thôc C­¬ng s¬n s¨n b¾n ®Òu kh«ng thÊy trë vÒ! H×nh nh­ trªn ®ã cã ma quû ","Cã chuyÖn nµy sao? §Ö tö sÏ lªn Thôc C­¬ng s¬n mét chuyÕn!")
		SetTask(8,30*256+20)
		AddNote("TriÖu ®µ chñ nãi cho b¹n biÕt t¹i Thôc C­¬ng s¬n cã ®Ö tö mÊt tİch, b¹n quyÕt ®Şnh ®i ®iÒu tra ")
		Msg2Player("TriÖu ®µ chñ nãi cho b¹n biÕt t¹i Thôc C­¬ng s¬n cã ®Ö tö mÊt tİch, b¹n quyÕt ®Şnh ®i ®iÒu tra ")
	elseif (UTask_gb == 30*256+30) then		--30¼¶ÈÎÎñ½áÊø
		Talk(3,"","TriÖu §µ chñ! Kú thùc kh«ng cã ma quû! Mµ lµ bän s¸t thñ Kim quèc ®· phuc ë ®Êy b¾t tÊt c¶ ®Ö tö C¸i bang. T¹i hä ®· cøu ®­îc hä vÒ!","Nguyªn do lµ vËy! Ng­¬i cßn trÎ mµ b¶n lÜnh cao c­êng! Béi phôc!","PhiÒn ng­¬i mang van th­ nµy vÒ cho la t­ëng l·o, trong ®ã ta ®· tr×nh tÊu rÊt chi tiÕt!")
		SetTask(8,30*256+40)
		AddEventItem(81)
		AddNote("Cøu ®­îc c¸c ®Ö tö bŞ b¾t, nãi sù t×nh cho TriÖu §µ chñ, nhËn ®­îc v¨n th­ ")
		Msg2Player("Cøu ®­îc c¸c ®Ö tö bŞ b¾t, nãi sù t×nh cho TriÖu §µ chñ, nhËn ®­îc v¨n th­ ")
	elseif ((UTask_gb == 30*256+40) and (HaveItem(81) == 0)) then		-- ÈÎÎñÖĞ£¬µÀ¾ß¶ªÁË
		Talk(1,"","MÊt råi µ! Khæ th©n ta l¹i ph¶i viÕt mét quyÓn kh¸c!")
		AddEventItem(81)
	else
		Talk(1,"","Kim binh ngµy mét léng hµnh. Xem ra D­¬ng Ch©u ®· kh«ng thÓ b×nh yªn n÷a råi!")
	end
end;
