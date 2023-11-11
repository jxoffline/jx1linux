--Edit by Youtube  PGaming--
Include("\\script\\dailogsys\\dailogsay.lua")
function main() 
if (GetTask(69) == 50)  then
Talk(11,"nv15x","C« g¸i khãc: hu hu hu, sî qu¸!","Ng­êi ch¬i: C« n­¬ng, cã chuyÖn g× thÕ?","C« g¸i khãc: xem t­íng m¹o cña ®¹i hiÖp, ®¹i hiÖp cã ph¶i lµ ng­êi trong giang hå?","§óng vËy.","C« g¸i khãc: ng­êi giang hå thËt ®¸ng sî, huhu, tê mê s¸ng h«m qua, n« gia ®ét nhiªn thÊy cã vµi bãng ®en tõ cöa sæ bay vµo, n« gia sî qu¸, véi gi¶ vê ngñ, mÆc dï kh«ng cã chuyÖn g×, nh­ng s¸ng nay nghÜ l¹i thËt lµ ®¸ng sî.","Ng­êi ch¬i: c« n­¬ng ®õng sî, c« n­¬ng cßn nh×n thÊy hay nghe thÊy g× n÷a kh«ng?","C« g¸i khãc: N« gia...n« gia chØ nghe lo¸ng tho¸ng hä nãi '7 ngµy sau, trÊn khÈu nam m«n' g× g× ®ã, cßn l¹i kh«ng nghe râ.","Ng­êi ch¬i: ®a t¹ chØ gi¸o.","Ng­êi ch¬i: H·y mau nãi chuyÖn nµy cho T« S­ huynh biÕt.") 
else 
Talk(1,"","C« g¸i khãc: hu hu hu, sî qu¸!")
end
end

function nv15x() 
SetTask(69,51)
AddNote("Trë vÒ m«n ph¸i t×m T« Phãng.") 
Msg2Player("Trë vÒ m«n ph¸i t×m T« Phãng.") 
end; 



