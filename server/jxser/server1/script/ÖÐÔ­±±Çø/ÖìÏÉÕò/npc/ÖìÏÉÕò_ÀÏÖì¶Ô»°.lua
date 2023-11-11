--description: ĞÂÊÖ´å_ÀÏÖì
--author: wangzg	
--date: 2003/7/22
--update 2003/7/25 yuanlan
-- Update: Dan_Deng(2003-08-07)

function main()
	UTask_world46=GetTask(74)
	if (UTask_world46==2) then
		Talk(3, "select", "L·o lµ L·o Chu?", "î~ chuyÖn g×?", "Phu nh©n l·o tr­îng gäi l·o quay vÒ.")
	elseif (UTask_world46==10) then
		Talk(1,"","Ta nghÜ ®· th«ng, mÊy n¨m nay cuéc sèng kh«ng dÔ dµng g×, kh«ng cã g× th× ®õng quÊy rèi ta.")
	else
		Talk(1,"","TiÓu huynh ®µi, ®õng nghe lêi ng­êi phô n÷ kia, bŞ bän Man Di thèng trŞ, lµm sao cã ®­îc cuéc sèng th¸i b×nh?")
	end
end

function select()
	Say("î ~ ®õng nh¾c ®Õn mô d¹ xoa Êy, ta lµm viÖc g× mô Êy còng muèn qu¶n, ta uèng chót r­îu còng kh«ng ®­îc µ?", 2, "Khuyªn can /reason","Kh«ng quan t©m ®Õn chuyÖn vî chång ng­êi kh¸c /no")
end

function reason()
	Talk(2, "prise", "Tu m­êi n¨m míi ®­îc ngåi chung thuyÒn, tu tr¨m n¨m míi n»m chung gèi, ®· lµ vî chång ®ã lµ duyªn phËn, l·o h·y vÒ lµm hßa víi vî ®i.","…..õm, th«i §­îc!còng lµ vî chång giµ c¶ råi, ta sÏ kh«ng c·i nhau víi vî n÷a.")
end;

function prise()
	Talk(1,"","Ta ®îi chót míi quay vÒ, ë ®©y cã İt thuèc trŞ th­¬ng, xem ra ng­¬i lµ ng­êi luyÖn vâ, ta tÆng ng­¬i ®ã.")
	SetTask(74,10)
	AddItem(1,0,0,1,0,0)
	AddItem(1,0,0,1,0,0)
	AddItem(1,0,0,1,0,0)
	AddRepute(5)
	AddNote("ThuyÕt phôc thµnh c«ng l·o Chu vÒ nhµ, hoµn thµnh nhiÖm vô. ")
	Msg2Player("ThuyÕt phôc thµnh c«ng l·o Chu vÒ nhµ, hoµn thµnh nhiÖm vô. ")
	Msg2Player("§­îc ba gãi Kim Th­¬ng d­îc ")
	Msg2Player("Danh väng cña b¹n t¨ng thªm 5 ®iÓm ")
end

function no()
end
