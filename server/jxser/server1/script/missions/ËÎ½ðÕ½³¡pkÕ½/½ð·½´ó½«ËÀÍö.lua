Include("\\script\\missions\\ÀŒΩ’Ω≥°PK’Ω\\ÀŒΩ’Ω≥°Õ∑Œƒº˛.lua");

function OnDeath()

State = GetMissionV(1) ;
if (State ~= 2) then
return
end;

--if ( GetMissionV(5) + GetMissionV(6) >= (MAX_S_COUNT + MAX_J_COUNT) * 7 / 10) then

if (GetMissionV(5) >= (MAX_S_COUNT / 2) and GetMissionV(6) >= (MAX_J_COUNT / 2)) then

	if (random(100) > 70) then
	return
	end;

	AddEventItem(195);
	Msg2Player("Bπn l y Æ≠Óc Nhπc V≠¨ng Ki’m! ");
end;


str1 = "<#>K’t qu∂ chi’n dﬁch TËng Kim: Ng≠Íi TËng "..GetName().."<#>Gi’t Æ≠Óc Æπi t≠Ìng phe Kim, phe TËng giµnh Æ≠Óc thæng lÓi! ";
str = "<#>TËt qu∏! [ "..GetName().."<#>]Gi’t Æ≠Óc t≠Ìng Kim, ng≠Íi TËng chÛng ta Æ∑ thæng trÀn nµy! ";
Msg2MSAll(1, str1);
Msg2MSGroup(1, str, 1);
resultstr = WinBonus(1,2);
str1 = str1..resultstr;
SetMissionV(2,2);
SetMissionV(1,3);
AddGlobalCountNews(str1 , 3);
CloseMission(1);
end;