--description: ĞÂÊÖ´å_¸ğÒ¯
--author: wangzg	
--date: 2003/7/21
--update 2003/7/24 yuanlan
-- Update: Dan_Deng(2003-08-07)

function main()
	UTask_world42=GetTask(70)
	if (UTask_world42==2) then
		Talk(2, "step1", "Ta cã thÓ m­în xem quyÓn s¸ch cña «ng chø?","Ch¾c lµ C¸t l·o ®Çu ë th«n B¾c nhê ng­¬i ®Õn ph¶i kh«ng? Tªn Êy muèn m­în s¸ch th× mang 'Di Kiªn Chİ' ®Õn ®©y trao ®æi víi 'Kª ThÇn lôc' cña ta.")
	elseif ((UTask_world42==6) and (HaveItem(189) == 1)) then		-- »»Êé
		Talk(2, "step3", "§©y lµ quyÓn s¸ch «ng cÇn.", "Hay qu¸! §©y lµ quyÓn s¸ch l·o Êy cÇn.")
	elseif ((UTask_world == 8) and (HaveItem(188) == 0)) then		-- Êé¶ªÁË
		Talk(1,"","B¹n trÎ! D¸m liÒu nh­ thÕ! T¹i sao l¹i nĞm s¸ch ë chç ta mµ bá ch¹y")
		AddEventItem(188)
		Msg2Player("§­îc Kª ThÇn lôc ")
	else
		Talk(1,"","B¹n trÎ! Lµm ng­êi kh«ng nhÊt thiÕt xem träng sÜ diÖn, cã nhiÒu viÖc nãi ra th× kh«ng cÇn sÜ diÖn!")
	end
end;

function step1()
	SetTask(70,4)
	AddNote("T×m ®­îc C¸t gia trÊn nam, «ng Êy muèn Lç gia dïng Di Kiªn chİ ®æi Kª ThÇn lôc. ")
end;

function step3()
DelItem(189)
AddEventItem(188)
SetTask(70,8)
AddNote("Tõ chç C¸t gia, dïng Di Kiªn Chİ ®æi Kª ThÇn lôc ")
Msg2Player("Dïng Di Kiªn Chİ ®æi Kª ThÇn lôc ")
end;
