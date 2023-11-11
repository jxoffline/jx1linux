
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main(sel)
if allbrother_0801_CheckIsDialog(198) == 1 then
		allbrother_0801_FindNpcTaskDialog(198)
		return 0;
	end
	
if (GetTask(169) == 53) then
Talk(3,"nv5xHS","Th­ N·i N·i: nghe nãi bän S¬n PhØ tÊn c«ng th«n lµng cã b¶n doanh t¹i ®éng Kim Quang, ®¹i hiÖp xin h·y th­¬ng lßng, gióp chóng t«i ®o¹t l¹i tµi vËt!","Ng­êi ch¬i: c¸c vÞ h­¬ng th©n yªn t©m, t¹i h¹ nhÊt ®Þnh sÏ gióp.")
elseif (GetTask(169) > 53) and (GetTask(169) < 59) then
Talk(1,"","Th­ N·i N·i: ®¹i hiÖp, mäi ®Òu trong mong nhê ngµi.")
elseif (GetTask(169) == 59) and (HaveCommonItem(6,1,3951)>0) then
Talk(2,"nv5xHS2","Th­ Bµ Bµ: a, ®©y kh«ng ph¶i lµ tµi s¶n cña ta sao, ®a t¹, ®a t¹!")
else
Say("Hai c¸i l·o Lç vµ l·o C¸t ®ã quanh n¨m cø ®Êu ®¸ víi nhua nh­ trÎ con!",0)
end
end;

function nv5xHS()  
	SetTask(169,54)
	AddNote("®èi tho¹i víi th«n d©n, quyÕt ®Þnh ®Õn th¶o ph¹t bän S¬n PhØ t¹i §éng Kim Quang (197/194), ®o¹t l¹i tµi vËt.") 
Msg2Player("®èi tho¹i víi th«n d©n, quyÕt ®Þnh ®Õn th¶o ph¹t bän S¬n PhØ t¹i §éng Kim Quang (197/194), ®o¹t l¹i tµi vËt.") 
end; 

function nv5xHS2()  
	ConsumeEquiproomItem(1,6,1,3951,-1)
	SetTask(169,60)
	AddNote("mang tµi vËt tr¶ l¹i cho c¸c vÞ th«n l·o") 
Msg2Player("mang tµi vËt tr¶ l¹i cho c¸c vÞ th«n l·o") 
end; 