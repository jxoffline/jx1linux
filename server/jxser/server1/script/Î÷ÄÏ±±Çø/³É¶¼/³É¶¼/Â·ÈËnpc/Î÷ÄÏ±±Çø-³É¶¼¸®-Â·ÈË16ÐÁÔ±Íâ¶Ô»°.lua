--Î÷ÄÏ±±Çø ³É¶¼¸® Â·ÈË16ĞÁÔ±Íâ¶Ô»° ¶ëáÒÅÉ40¼¶ÈÎÎñ
--author: yuanlan	
--date: 2003/5/23
-- Update: Dan_Deng(2003-08-12)

function main(sel)
	UTask_em = GetTask(1);
	if (UTask_em == 40*256+50) then 		
		UTask_emsub03 = GetByte(GetTask(29),3)
		if (UTask_emsub03 == 0) then 
			Say("T¹i h¹ b×nh sinh rÊt thİch kÕt giao b»ng h÷u víi hiÖp kh¸ch giang hå, c¸c b»ng h÷u tÆng cho ta ngo¹i hiÖu lµ 'Tr¹i M¹nh Th­êng' qu¶ lµ qu¸ khen. Nh­ng gÇn ®©y cã ng­êi coi t¹i h¹ chØ lµ h­ danh, trong lßng t¹i h¹ v« cïng tøc giËn. ", 2, "Xin hái /L40_V3_Q1", "Ta cßn cã viÖc kh¸c. /no")
		elseif (UTask_emsub03 == 3) then 
			L40_V3_Q1()
		elseif (UTask_emsub03 == 5) then 
			L40_V3_Q2()
		elseif ((UTask_emsub03 == 10) and (HaveItem(168) == 0)) then
			AddEventItem(168)
			Talk(1,"","N÷ hiÖp ®õng kh¸ch khİ, ng­êi ®ang cÇn thiÕt th× h·y lÊy ®i")
		else
			Talk(1,"","Cã thÓ kÕt giao b»ng h÷u víi n÷ hiÖp nh­ thÕ nµy th× thËt h¹ng phóc cho T©n mç.")
		end
	else
		Talk(1,"","T¹i h¹ b×nh sinh rÊt thİch kÕt giao b»ng h÷u víi hiÖp kh¸ch giang hå, c¸c b»ng h÷u tÆng cho ta ngo¹i hiÖu lµ 'Tr¹i M¹nh Th­êng' qu¶ lµ qu¸ khen.")
	end
end;

function no()
	Talk(1,"","VËy t¹i h¹ kh«ng lµm phiÒn n÷a hiÖp n÷a!")
end;

function L40_V3_Q1()
	Say("M¹nh Th­êng Qu©n lµ ng­êi n­íc nµo nhØ?", 4, "Së quèc /f1", "TÒ quèc /L40_V3_Q2", "TriÖu quèc /f1", "Ngôy quèc /f1")
end;

function f1()
	Talk(1,"","H×nh nh­ lµ kh«ng ph¶i? LÇn tr­íc ta còng nãi nh­ thÕ nµy bŞ ng­êi kh¸c c­êi. ")
	SetTask(29, SetByte(GetTask(29),3,3))
end;

function L40_V3_Q2()
	Say("Oa! Th× ra lµ ng­êi n­íc TÒ. Thêi ChiÕn Quèc cã 4 danh nh©n: M¹nh Th­êng Qu©n, Tİn L¨ng V­¬ng vµ B×nh Nguyªn Qu©n. Cßn mét ng­êi n÷a lµ ai nhØ?", 4, "Long D­¬ng Qu©n /f2", "TŞnh Qu¸ch Qu©n /f2", "Xu©n Th©n Qu©n /L40_V3_prise", "ThiÕu Nguyªn Qu©n /f2")
end;

function f2()
	Talk(1,"","H×nh nh­ kh«ng ®óng! Ta ch­a nghe qua bao giê!")
	SetTask(29, SetByte(GetTask(29),3,5))
end;

function L40_V3_prise()
	Talk(4, "select", "§óng råi! Sao ta l¹i kh«ng nghÜ ra nhØ? Nghe nãi n¨m x­a nhµ M¹nh Th­êng Qu©n cã 3000 thùc kh¸ch, ta tuy kh«ng cã khİ ph¸ch nh­ thÕ, nh­ng rÊt thİch kÕt giao b»ng h÷u víi n÷ hiÖp nh­ thÕ nµy! N÷ hiÖp cã cÇn ta gióp ®ì g× kh«ng?", "Ta ®ang t×m Bİch Tû Giíi ChØ ", "Sao kh«ng nãi sím! Ta cã mét chiÕc Bİch Tû Giíi ChØ ®©y! TÆng cho n÷ hiÖp!", "§a t¹ Viªn ngo¹i! ")
end;

function select()
	AddEventItem(168)
	Msg2Player("T×m ®­îc nhÉn M· n·o ")
	SetTask(29, SetByte(GetTask(29),3,10))
	AddNote("ë chç T©n viªn ngo¹i t¹i Thµnh §« t×m ®­îc nhÉn M· n·o. ")
end;
