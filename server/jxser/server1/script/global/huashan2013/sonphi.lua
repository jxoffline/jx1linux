--  Edit by Youtube PGaming--

Include("\\script\\lib\\awardtemplet.lua")

function OnDeath () 
if (GetTask(169) == 54) then
AddNote("NhËn ®­îc 1 tµi s¶n cña d©n lµng.")
tbAwardTemplet:GiveAwardByList({tbProp = {6,1,3951,0,0,0}, nBindState=-2}, "test", 1);
SetTask(169,55)
elseif (GetTask(169) == 55) then
AddNote("NhËn ®­îc 1 tµi s¶n cña d©n lµng.")
tbAwardTemplet:GiveAwardByList({tbProp = {6,1,3951,0,0,0}, nBindState=-2}, "test", 1);
SetTask(169,56)
elseif (GetTask(169) == 56) then
AddNote("NhËn ®­îc 1 tµi s¶n cña d©n lµng.")
tbAwardTemplet:GiveAwardByList({tbProp = {6,1,3951,0,0,0}, nBindState=-2}, "test", 1);
SetTask(169,57)
end
end 


