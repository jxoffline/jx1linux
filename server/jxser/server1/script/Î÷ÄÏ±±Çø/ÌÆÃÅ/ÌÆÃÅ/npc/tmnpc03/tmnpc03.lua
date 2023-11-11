--description: ÌÆÃÅÆÕÍ¨µÜ×Ó Öñº£µÚÈı¹Ø
--author: yuanlan	
--date: 2003/3/10
-- Update: Dan_Deng(2003-08-13)
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(10) == 1 then
		allbrother_0801_FindNpcTaskDialog(10)
		return 0;
	end
	UTask_tm = GetTask(2)
	Uworld37 = GetByte(GetTask(37),1)
	if (Uworld37 == 60) then					--ÈëÃÅÈÎÎñ
		if (HaveItem(33) == 0) then
			Talk(1,"","LÊy ®­îc gËy tróc mµu xanh råi ®Õn t×m ta!")
		elseif (HaveItem(34) == 0) then
			Talk(1,"","LÊy ®­îc gËy tróc mµu tr¾ng råi ®Õn t×m ta!")
		else
			Talk(1,"enroll_V3_Q1","§¸p ®óng 3 quÎ cña ta, th× cã thÓ lÊy ®­îc <color=Red>gËy tróc mµu tİm<color>. Nghe kü ®©y:")
		end
	elseif (Uworld37 == 80) then						--ÒÑ¾­¹ıÁËÈı¹Ø
		if (HaveItem(35) == 1) then
			Talk(1,"","Muèn qua ¶i thuËn lîi, ng­¬i ph¶i lÊy ®ñ 3 c©y tróc, sau ®ã ®­a cho ®ång m«n ë lèi ra.")
		else
			AddEventItem(35)
			Talk(1,"","T¹i sao ng­¬i l¹i vøt gËy tróc trong rõng? Ta sÏ gióp ng­¬i nhÆt l¹i, ®õng vøt lung tung n÷a! ")
		end
	elseif (GetFaction() == "tangmen") then
		Talk(1,"","Mäi ng­êi ®Òu lµ huynh ®Ö ®ång m«n, ng­¬i kh«ng cÇn x«ng vµo Tróc H¶i Tam Quan! ")
	else
		Talk(1,"","§õng ch¹y lung tung, coi chõng bŞ khØ c¾n!")
	end
end;

function enroll_V3_Q1()
	Say("QuÎ thø nhÊt lµ 'Chİnh Nam vµ Chİnh §«ng':", 3, "LiÖt Háa Oanh L«i /enroll_V3_Q2", "NghŞch nh­ n­íc löa /False1", "§æ dÇu vµo löa /False1")
end;

function False1()
	Talk(1,"","QuÎ thø nhÊt ®¸p sai råi, cã thÓ mÊy con khØ ®ã sÏ nãi cho ng­¬i biÕt.")
end;

function enroll_V3_Q2()
	Say("§óng råi! QuÎ thø 2 lµ '§«ng Nam vµ Chİnh B¾c':", 3, "Nói cao s«ng dµi /False2", "M­a giã khëi sinh /enroll_V3_Q3", "ThÕ nh­ vò b·o /False2")
end;

function False2()
	Talk(1,"","Kh«ng ®óng! Sao kh«ng hái mÊy con khØ?")
end;

function enroll_V3_Q3()
	Say("§óng råi! QuÎ cuèi lµ 'T©y B¾c vµ T©y Nam':", 3, "Phong Hµnh Thñy Th­îng /False3", "Thiªn tai ®Şch häa /enroll_V3_prise", "Non s«ng gÊm vãc /False3")
end;	

function False3()
	Talk(1,"","Sai råi! §õng t­ëng ng­¬i th«ng minh h¬n con khØ, kh«ng chõng nã biÕt nhiÒu h¬n ®Êy! ")
end;

function enroll_V3_prise()
	Talk(1,"","3 quÎ ng­¬i ®Òu ®¸p ®óng, ®©y lµ gËy tróc mµu tİm cña ng­¬i. NÕu lÊy ®ñ 3 c©y gËy tróc giao cho ®ång m«n ë lèi ra, sÏ thuËn lîi qua ¶i.")
	AddEventItem(35)
	Msg2Player("T¹i ¶i thø 3 tr¶ lêi §­êng M«n tr¸ng ®inh c©u ®è vÒ 8 quÎ bãi, cã ®­îc gËy tróc tİm. ")
	Uworld37 = SetByte(GetTask(37),1,80)
	SetTask(37,Uworld37)
	AddNote("T¹i ¶i thø 3 tr¶ lêi §­êng M«n tr¸ng ®inh c©u ®è vÒ 8 quÎ bãi, cã ®­îc gËy tróc tİm. ")
end;	
