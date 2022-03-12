--Edit by Youtube PGaming   --

Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
function main(sel)
if (GetTask(69) == 13) or GetLastFactionNumber() == 10 then
Say("Phô Dung: Lo¹i thuèc nµy lµ do lóc LËn s­ tû r·nh rçi ®· dÉn c¸c s­ tû muéi ®i h¸i thuèc lµ chÕ t¹o, rÊt lµ linh nghiÖm.", 2,"Giao dÞch/yes", "Kh«ng giao dÞch/no");
else 
Talk(1,"","Phô Dung: Ch­ëng m«n cã lÖnh, thuèc cña bæn ph¸i chØ b¸n cho ®ång m«n.")	
end
end;


function yes()
Sale(3);  			
end;


function no()
end;
