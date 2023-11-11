--description: ÌÆÃÅÌÆÔÆ 30¼¶ÈÎÎñ 
--author: yuanlan	
--date: 2003/3/11
-- Update: Dan_Deng(2003-08-13)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_tm = GetTask(2);
	if (GetFaction() == "tangmen") and (GetSeries() == 1) then
		if ((UTask_tm >= 30*256+50) and (UTask_tm <= 30*256+60) and (HaveItem(42) == 1)) then		--30¼¶ÈÎÎñ
			L30_prise()
		elseif (UTask_tm >= 40*256) and (GetFaction() == "tangmen") then					--ÒÑ¾­Íê³É30¼¶ÈÎÎñ£¬ÉĞÎ´³öÊ¦
			Talk(1,"","Ng­¬i ®· gióp ta b¸o mèi thï nµy, ng­¬i cÇn g×? Ta nhÊt ®Şnh gióp ng­¬i!")
		else								--Ã»ÓĞÍê³É30¼¶ÈÎÎñ£¨È±Ê¡¶Ô»°£©
			Talk(1,"","TiÓu Xuyªn, ®øa con téi nghiÖp cña ta….Thï hËn nµy……ngµy nµo ch­a tr¶, ta chÕt kh«ng nh¾m m¾t!")
		end
	elseif (UTask_tm >= 70*256) then							--ÒÑ¾­³öÊ¦
		Talk(1,"","Giang hå hiÓm ¸c, mét m×nh hµnh hiÖp giang hå ph¶i hÕt søc cÈn thËn! ")
	else
		Talk(1,"","B×nh sinh ta vèn thï hËn bän thæ phØ giÕt ng­êi c­íp bãc!")
	end
end;

function L30_prise()
	Talk(2, "", "§­êng V©n s­ thóc, t¹i h¹ ®· t×m ®­îc nh÷ng tªn Thæ PhØ b¸o thï cho «ng vµ ®o¹t vÒ 'Háa Khİ Phæ'. ChØ cÇn «ng giao cho Ch­ëng m«n sÏ kh«ng ph¶i chŞu h×nh ph¹t n÷a!", "Ta lu«n ®îi ®Õn ngµy nµy. Ng­¬i nãi xem ng­¬i cÇn g×? Ta sÏ ®¸p øng!")
	DelItem(42)
	SetRank(28)
	SetTask(2, 40*256)
--	AddMagic(50)
--	AddMagic(54)
--	AddMagic(47)
--	AddMagic(343)
	add_tm(40)			-- µ÷ÓÃskills_table.luaÖĞµÄº¯Êı£¬²ÎÊıÎªÑ§µ½¶àÉÙ¼¶¼¼ÄÜ¡£
	Msg2Player("Chóc mõng b¹n! B¹n ®· ®­îc th¨ng lµm §­êng M«n Giíi TiÒn Hé VÖ, häc ®­îc: Truy T©m TiÔn, M¹n Thiªn Hoa Vò, Xuyªn T©m Thİch. ")
	AddNote("VÒ ®Õn Háa Khİ phßng, giao Ho¶ Khİ Phæ cho §­êng V©n, hoµn thµnh nhiÖm vô Ho¶ Khİ Phæ, th¨ng lµ: Giíi TiÒn Hé VÖ. ")
end;
