--Edit by Youtube PGaming  --
Include("\\script\\lib\\awardtemplet.lua")

function OnDeath () 
if (GetTask(69) == 20) then
Msg2Player("ßπi hi÷p Æ∑ Æ∏nh bπi Ng≠Íi Th«n B›, nhÀn Æ≠Óc 1 MÀt l÷nh.") 
AddNote("ßπi hi÷p Æ∑ Æ∏nh bπi Ng≠Íi Th«n B›, nhÀn Æ≠Óc 1 MÀt l÷nh.")
tbAwardTemplet:GiveAwardByList({tbProp = {6,1,3958,0,0,0}, nBindState=-2}, "test", 1);
SetTask(69,21)
end
end 



