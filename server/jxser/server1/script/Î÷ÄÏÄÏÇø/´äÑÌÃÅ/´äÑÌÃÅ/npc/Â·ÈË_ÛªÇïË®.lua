-------------------------------------------------------------------------
-- FileName		:	Â·ÈË_ÛªÇïË®.lua
-- Author		:	xiaoyang
-- CreateTime	:	2004-12-27 14:40:10
-- Desc			:	´äÑÌ90¼¶ÈÎÎñ£¿£¿
-------------------------------------------------------------------------

Include("\\script\\task\\newtask\\master\\zhongli\\zhonglitasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\misc\\eventsys\\eventsys.lua")
Include("\\script\\dailogsys\\dailog.lua")

function main()
	local nNpcIndex = GetLastDiagNpc()
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	EventSys:GetType("AddNpcOption"):OnEvent(szNpcName,tbDailog , nNpcIndex)
	if getn(tbDailog.tbOptionList) > 0 then
		tbDailog:AddOptEntry("Ta ®Õn t×m «ng cã viÖc kh¸c", old_main)
		tbDailog:Show()
	else
		old_main()
	end
end
function old_main()
	Uworld126 = nt_getTask(126)
	Uworld1002 = nt_getTask(1002)
	Say(" Ng­êi sèng trªn ®êi cÇn ph¶i biÕt tr©n träng h¹nh phóc.",3,
		--"Ta ®Õn lµm nhiÖm vô chÝnh tuyÕn/branch_branchliqiushui",
		"Ta ®Õn lµm nhiÖm vô cÊp 90/tasknpc_nity",
		"Kh«ng hái n÷a!/no")
end

function tasknpc_nity()
Uworld126 = nt_getTask(126)
	if (Uworld126 == 10) and (HaveItem(391) == 1) then
		Talk(4,"Uworld126_lose","LÖ tiÓu th­! C« cã th­!","§oµn T­ Thµnh còng cã ngµy hèi hËn? Qu¸ trÔ råi! Ta ch¼ng cßn tin t­ëng vµo ®µn «ng n÷a.","C« n­¬ng hµ tÊt ph¶i cè chÊp, tôc ng÷ cã c©u 'SÜ biÖt tam nhËt, ®­¬ng qu¸t môc t­¬ng khan', lÏ n·o kh«ng thÓ cho §oµn c«ng tö mét c¬ héi sao?","Cho h¾n c¬ héi? Lóc h¾n rêi xa ta sao h¾n kh«ng cho ta mét c¬ héi kh«ng? Ta kh«ng muèn nãi n÷a, ng­¬i r¶nh rçi th× h·y ®i t×m Ch­ëng m«n, bµ ta thÝch nãi nh÷ng chuyÖn nµy.")
	elseif (Uworld126 == 10) then			-- Ã»ÓÐÊéÐÅ
		Talk(3,"","LÖ tiÓu th­! C« cã th­!","Th­ g× vËy?","µ! Ta ®Ó quªn ë chç §oµn T­ Thµnh.")
	elseif (Uworld126 == 30)then
   	Talk(3,"Uworld126_cant","LÖ tiÓu th­!",".....","Xem ra ph¶i quay l¹i gÆp §oµn c«ng tö t×m biÖn ph¸p míi ®­îc.")
   elseif (Uworld126 == 60)then
   	Talk(12,"Uworld126_beleive","LÖ tiÓu th­! Kh«ng xong råi! ","Véi c¸i g×! Cã g× tõ tõ nãi.","§oµn c«ng tö….","H¾n thÕ nµo?","§oµn c«ng tö v× b¶o vÖ c« bÞ kÎ thï ®¸nh träng th­¬ng, tÝnh m¹ng ®ang nguy hiÓm!","Ng­¬i kh«ng cÇn bÞa ®Æt, ta quyÕt kh«ng tin ng­¬i ®©u!","T¹i h¹ lÊy danh tiÕng cña m×nh trªn giang hå ra b¶o ®¶m, ta kh«ng g¹t c« n­¬ng ®©u..","Ch¼ng lÏ.....T­ Thµnh. Qua nhiÒu n¨m nh­ thÕ råi ng­¬i hµ tÊt ph¶i thay ng­¬i kh¸c chÞu trËn, nh÷ng n¨m gÇn ®©y tÝnh t×nh ta ®· thay ®æi, ®· t¹o ra nhiÒu hËn thï, ng­¬i kh«ng cã vâ c«ng thËt lµ chuèc khæ vµo th©n.","NÕu ngµy Êy c« chÞu tha thø cho h¾n th× ®©u ®Õn nçi.","MÊy ngµy nµy ta kh«ng sao ngñ ®­îc, trong lßng lu«n nghØ vÒ y, b©y giê y ®ang ë ®©u?","§¹i Lý!","Ta sÏ ®Õn ®ã ngay, tÊt c¶ nh÷ng thï hËn ®· kÕt thóc!")	
   elseif (Uworld126 > 10) and (Uworld126 < 60) then				-- ÈÎÎñÖÐµÄÈ±Ê¡¶Ô»°
   	Talk(1,"","Ta vµ T­ Thµnh kh«ng liªn can g× nhau, ng­¬i ®õng l¾m lêi! ")
   else
   	Talk(1,"","M«n chñ kh«ng thÓ thµnh th©n víi §­êng NhÊt TrÇn, nh­ thÕ sÏ ph¹m m«n quy.....")
   end
end

function Uworld126_lose()
	DelItem(391)
	nt_setTask(126,20)
	Msg2Player("Sau khi xem th­, LÖ Thu Thñy kh«ng chót xóc ®éng, b¹n quyÕt ®Þnh ®i t×m Do·n Hµm Yªn gióp ®ì.")
	AddNote("Sau khi xem th­, LÖ Thu Thñy kh«ng chót xóc ®éng, b¹n quyÕt ®Þnh ®i t×m Do·n Hµm Yªn gióp ®ì.")
end

function Uworld126_cant()
	nt_setTask(126,40)
	Msg2Player("LÖ Thu Thñy kh«ng nghe lêi khuyªn, b¹n quyÕt ®Þnh trë vÒ t×m §oµn T­ Thµnh.")
	AddNote("LÖ Thu Thñy kh«ng nghe lêi khuyªn, b¹n quyÕt ®Þnh trë vÒ t×m §oµn T­ Thµnh.")
end

function Uworld126_beleive()
	nt_setTask(126,70)
	Msg2Player("Trong lßng LÖ Thu Thñy vÉn cßn v­¬ng vÊn §oµn T­ Thµnh, quyÕt ®Þnh ®i gÆp mÆt h¾n lÇn cuèi! KÕ ho¹ch thµnh c«ng.")
	AddNote("Trong lßng LÖ Thu Thñy vÉn cßn v­¬ng vÊn §oµn T­ Thµnh, quyÕt ®Þnh ®i gÆp mÆt h¾n lÇn cuèi! KÕ ho¹ch thµnh c«ng.")
end

function branch_branchliqiushui()
	Uworld1002 = nt_getTask(1002)
   	liqiushui()
end

function no()
end