--description: ÖĞÔ­±±Çø ãê¾©¸® Â·ÈË16ÆòØ¤¶Ô»° ÌìÈÌ½Ì³öÊ¦ÈÎÎñ
--author: yuanlan	
--date: 2003/5/19
-- Update: Dan_Deng(2003-08-14)

function main(sel)
	UTask_tr = GetTask(4)
	Uworld38 = GetByte(GetTask(38),2)
	if (UTask_tr == 60*256+20) then
		UTask_trsub60 = GetByte(GetTask(28),4)
		if (UTask_trsub60 == 0) then 
			DelItem(131)			--´¦ÀíÖØ½ÓÈÎÎñºó£¬Íæ¼Ò¼ñÆğÈÎÎñµÀ¾ßµÄÇé¿ö
			Say("Xin cho chót tiÒn lÎ! ", 2, "Cho /yes1", "Kh«ng cho! /no")
		elseif (UTask_trsub60 == 2) then 
			Say("Xin cho chót tiÒn lÎ! ", 2, "Cho /yes2", "Kh«ng cho! /no")
		elseif (UTask_trsub60 == 4) then 
			Say("Xin cho chót tiÒn lÎ! ", 2, "Cho /yes3", "Kh«ng cho! /no")
		elseif (UTask_trsub60 == 10) then
			if (HaveItem(131) == 0) then
				AddEventItem(131)
				Talk(1,"","Thanh kiÕm nµy mÆc dï kh«ng ®¸ng tiÒn, nh­ng còng lµ mét chót t©m ı cña ta, xin ®õng chèi tõ!")
			else
				Talk(1,"","Xøng ®¸ng lµ b¹n tèt! §­îc! Ta nhËn ng­¬i lµ h¶o huynh ®Ö!")
			end
		end
	elseif (Uworld38 == 10) then		-- ÉÙÁÖÈëÃÅÈÎÎñ½øĞĞÖĞ
		if ((HaveItem(121) == 1) and (HaveItem(122) == 1) and (HaveItem(218) == 1)) then		-- ³àÍ­¿ó¡¢¹ãŞ½Ïã¡¢¼á¾§Ê¯
			Say("ChØ cÇn cho ta ba mãn g× kh«ng ®¸ng gi¸ trªn ng­êi cña ng­¬i còng ®­îc",2,"Cho ng­¬i /SLenroll_S4_yes","ChØ lµ gi¶ dèi mµ th«i. Kiªn quyÕt kh«ng cho /no")
		else
			Talk(1,"","VŞ hiÖp kk¸ch nµy! TiÒn ®å réng thªnh thang! Xin bè thİ cho kÎ hÌn İt b¹c lÎ!")
		end
	elseif ((Uworld38 == 20) and (HaveItem(219) == 0)) then		--ÈÎÎñÖĞ£¬Ö¤Ã÷ÊéĞÅ¶ªÁË
		Talk(2,"","TĞ ra ng­¬i còng ch¶ kh¸ h¬n ta chót nµo!","Kh«ng sao! Ta viÕt l¹i cho ng­¬i bøc th­ lµ ®­îc.")
		AddEventItem(219)
	elseif (UTask_tr > 60*256+20) then
		Talk(1,"","Xøng ®¸ng lµ b¹n tèt! §­îc! Ta nhËn ng­¬i lµ h¶o huynh ®Ö!")
	else
		Talk(1,"","VŞ thiÕu hiÖp nµy, h·y ph¸t huy tinh thÇn hiÖp nghÜa v« t­ ®i! ThËt ®¸ng th­¬ng cho KhiÕu hãa tö ta! Cho ta xin m­êi mÊy v¹n l­îng ®i!")
--		Talk(1,"","ÆòØ¤£º´óÏÀ£¬ÓĞ¾ÆÂğ£¿ÇóÄãÉÍÎÒÒ»¿Ú¾ÆºÈ°É£¡ÎÒ¿ÉÒÔÃ»·¹³Ô£¬¿É²»ÄÜÃ»¾ÆºÈ°¡¡£")
	end
end;

function SLenroll_S4_yes()
	Talk(1,"","Xøng ®¸ng lµ b¹n tèt! §­îc! Ta nhËn ng­¬i lµ h¶o huynh ®Ö!")
	DelItem(121)
	DelItem(122)
	DelItem(218)
	AddEventItem(219)
	Uworld38 = SetByte(GetTask(38),2,20)
	SetTask(38,Uworld38)
	Msg2Player("NhËn ®­îc mét bøc th­ tõ tay ¨n mµy. ")
	AddNote("NhËn ®­îc mét bøc th­ tõ tay ¨n mµy. ")
end;

function yes1()
	if (GetCash() >= 10) then
		Pay(10)
		Talk(1,"","ChØ bÊy nhiªu th«i µ? Hõ! Sao keo kiÖt vËy! ")
		SetTask(28, SetByte(GetTask(28),4,2))
	else
		Talk(1,"","Xin lçi! Ta kh«ng ®em ®ñ tiÒn.")
	end
end;

function yes2()
	if (GetCash() >= 50) then
		Pay(50)
		Talk(1,"","Hõ! §õng t­ëng ta lµ ¨n mµy th× dÔ xem th­êng nha! ")
		SetTask(28, SetByte(GetTask(28),4,4))
	else
		Talk(1,"","Ta kh«ng cã tiÒn!.")
	end
end;

function yes3()
	if (GetCash() >= 100) then
		Pay(100)
		Talk(1,"","Ta tÆng ng­¬i thanh kiÕm nµy, gäi lµ chót lßng thµnh ı! Xin ®õng tõ chèi!")
		AddEventItem(131)
		Msg2Player("NhËn ®­îc thanh kiÕm: DiÖt Hån ")
		SetTask(28, SetByte(GetTask(28),4,10))
		AddNote("GÆp ®­îc ¨n mµy tr­íc cöa T­íng quèc tù ë BiÖn Kinh, bè thİ liªn tiÕp 3 lÇn, nhËn ®­î thanh kiÕm DiÖt Hån ")
	else
		Talk(1,"","Ta thËt lùc bÊt tßng t©m! ")
	end
end;

function no()
	Talk(1,"","Trªn ®êi nµy ng­êi thÊy lîi quªn nghÜa nhiÒu qu¸! ")
end;
