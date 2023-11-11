--Edit by Youtube PGaming   --

Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
function main(sel)
if (GetTask(69) == 13)  or GetLastFactionNumber() == 10 then
Say("TiÓu Viªn Tö: ë ®©y cã rÊt nhiÒu thÇn binh lîi khİ, ng­¬i cã muèn mét mãn kh«ng?", 2,"Giao dŞch/yes", "Kh«ng giao dŞch/no");
else 
Talk(1,"","TiÓu Viªn Tö: Ch­ëng m«n cã lÖnh, binh khİ bæn ph¸i chØ b¸n cho ®ång m«n.")	
end
end;


function yes()
Sale(1);  			
end;


function no()
end;
