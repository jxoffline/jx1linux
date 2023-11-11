--Edit by   Youtube PGaming--
Include("\\script\\lib\\awardtemplet.lua")

function OnDeath () 
if (GetTask(169) == 32) then
if (random(1,100) < 20) then 
AddNote("§¹i hiÖp ®o¹t l¹i B¨ng Tµm TuÕ.")
tbAwardTemplet:GiveAwardByList({tbProp = {6,1,3948,0,0,0}, nBindState=-2}, "test", 1);
Msg2Player("§¹i hiÖp ®o¹t l¹i B¨ng Tµm TuÕ.") 
SetTask(169,33)

end
end 
end

