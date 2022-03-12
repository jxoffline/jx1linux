--description: ÌÆÃÅÆÕÍ¨µÜ×Ó Öñº£µÚ¶þ¹Ø
--author: yuanlan	
--date: 2003/3/10
-- Update: Dan_Deng(2003-08-13)
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(9) == 1 then
		allbrother_0801_FindNpcTaskDialog(9)
		return 0;
	end
	UTask_tm = GetTask(2)
	Uworld37 = GetByte(GetTask(37),1)
	if (Uworld37 == 20) then					--ÈëÃÅÈÎÎñ
		if (HaveItem(33) == 1) then
			Talk(1,"enroll_V2_Q1","GËy tróc nµy ®óng råi! B©y giê xin tr¶ lêi mét vÊn ®Ò!")
		else
			Talk(1,"","Cã ®­îc <color=Red>gËy tróc mµu xanh<color> råi ®Õn t×m ta!")
		end
	elseif (Uworld37 >= 60) and (Uworld37 < 127) then						--ÒÑ¾­¹ýÁËÕâÒ»¹Ø
		if (HaveItem(34) == 1) then
			Talk(1,"","Muèn qua ¶i thuËn lîi, ng­¬i ph¶i lÊy ®ñ 3 c©y tróc, sau ®ã ®­a cho ®ång m«n ë lèi ra.")
		else
			AddEventItem(34)
			Talk(1,"","T¹i sao ng­¬i l¹i vøt gËy tróc trong rõng? Ta sÏ gióp ng­¬i nhÆt l¹i, ®õng vøt lung tung n÷a! ")
		end
	else
		Talk(1,"","ë ®©y thêi gian dµi míi biÕt th× ra §¹i M· hÇu nµy còng biÕt tÝnh ng­êi.")
	end
end;

function enroll_V2_Q1()
	Say("Cöu cung trËn cã 9 «, mçi « cã 1 sè, sau khi ®iÒn ®ñ råi, bÊt luËn ngang hay däc cø 3 sè céng l¹i cã tæng lµ 15, ng­¬i biÕt lµm kh«ng? Hµng thø nhÊt lµ:", 3, "4, 9, 2 /False1", "2, 4, 9 /False1", "2, 9, 4 /enroll_V2_Q2")
end;

function False1()
	Talk(1,"","Kh«ng ®óng! MÊy con <color=Red>§¹i M· hÇu, §¹i D· hÇu<color> xem ra cßn th«ng minh h¬n ng­¬i!")
end;

function enroll_V2_Q2()
	Say("§¸p ®óng råi! Cßn hµng thø 2 ®­îc ch­a?", 3, "7, 5, 3 /enroll_V2_Q3", "5, 3, 7 /False2", "5, 7, 3 /False2")
end;

function False2()
	Talk(1,"","Kh«ng ®óng! H·y ®i hái <color=Red>§¹i M· hÇu, §¹i D· hÇu<color>®i! ")
end;

function enroll_V2_Q3()
	Say("§óng råi! VËy hµng cuèi cïng ®iÒn thÕ nµo:", 3, "6, 8, 1 /False3", "8, 1, 6 /False3", "6, 1, 8 /enroll_V2_prise")
end;

function False3()
	Talk(1,"","Kh«ng ®óng! T¹i sao kh«ng ®i hái <color=Red>§¹i M· hÇu, §¹i D· hÇu<color> chø?")
end;

function enroll_V2_prise()
	Talk(1,"","Tèt l¾m! GËy tróc mµu tr¾ng nµy cña ng­¬i! Qua ¶i thø 3 t×m Tr¸ng §inh lÊy <color=Red>gËy tróc mµu tÝm<color> ®i!")
	AddEventItem(34)
	Msg2Player("T¹i ¶i thø 2 tr¶ lêi §­êng M«n tr¸ng ®inh vÒ c©u ®è ma trËn 9 sè, cã ®­îc gËy tróc mµu tr¾ng. ")
	Uworld37 = SetByte(GetTask(37),1,60)
	SetTask(37,Uworld37)
	AddNote("T¹i ¶i thø 2 tr¶ lêi §­êng M«n tr¸ng ®inh vÒ c©u ®è ma trËn 9 sè, cã ®­îc gËy tróc mµu tr¾ng. ")
end;
