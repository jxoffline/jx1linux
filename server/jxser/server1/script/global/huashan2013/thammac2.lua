--   Edit by Youtube PGaming--
Include("\\script\\dailogsys\\dailogsay.lua")
function main() 
if (GetTask(69) == 54) then
Talk(5,"nv15x","ThÈm MÆc: Ng­¬i ®· quay trë vÒ.","ChuyÖn g× vËy?","ThÈm MÆc: um...h·y tiªu diÖt bän chóng tr­íc.","Ng­êi ch¬i: Ta ®Õn gióp ®©y.")
elseif  (GetTask(69) == 60) then
Talk(9,"nv15x2","Ng­êi ch¬i: c¸c h¹ kh«ng sao chø, ®· x¶y ra chuyÖn g×?","ThÈm MÆc: qu¶ nhiªn lµ Thiªn NhÉn Gi¸o ®Æt bÉy! T« S­ huynh ®· tróng bÉy, khi ta ®Õn ®©y S­ huynh ®· vµo trong cøu ng­êi, vâ c«ng ta kĞm cái, kh«ng thÓ gióp...","Ng­êi ch¬i: hiÖn t¹i hä ®ang ë ®©u?","ThÈm MÆc: Ph­¬ng S­ huynh ®· tiªu diÖt ®­îc mét sè kÎ thï, sau ®ã do bŞ tÈm ®éc m¾t kh«ng cßn nh×n thÊy ®­êng n÷a.","Ng­êi ch¬i: Sao?!","ThÈm MÆc: ta gióp hä nhanh chãng mang T« S­ huynh rêi khái, sau ®ã liÒu mét phen ë l¹i chèng chäi víi bän ¸m ®en, thËt may c¸c h¹ ®Õn kŞp lóc.","Ng­êi ch¬i: chóng ta mau ®uæi theo hä!","ThÈm MÆc: ®i th«i!")
elseif (GetTask(69) > 60 ) and (GetTask(69) < 62) then 
Talk(1,"","ThÈm MÆc: chóng ta ®i th«i")	
else 
Talk(1,"","ThÈm MÆc: ...")	
end
end

function nv15x2() 
SetTask(69,61)
AddNote("Trë vÒ m«n ph¸i t×m V¹n T­ ViÔn.") 
Msg2Player("Trë vÒ m«n ph¸i t×m V¹n T­ ViÔn.") 
end; 

function nv15x() 
SetTask(69,55)
AddNote("Tiªu diÖt 5 Gi¸o chóng Thiªn NhÉn Gi¸o.") 
Msg2Player("Tiªu diÖt 5 Gi¸o chóng Thiªn NhÉn Gi¸o.") 
end; 

