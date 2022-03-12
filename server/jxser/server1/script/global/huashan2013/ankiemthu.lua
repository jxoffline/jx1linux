--Edit by Youtube PGaming--
Include("\\script\\dailogsys\\dailogsay.lua")
function main() 
if (GetTask(169) == 63)  then
Talk(3,"L50_hs","Ng­êi ch¬i: ta ®Õn ®Ó hæ trî tu söa ThÇn KiÕm cña bæn m«n.","Ên KiÕm Thu: 2 thanh huy li kiÕm nµy vèn lµ thÇn kiÕm cña Ch­ëng m«n c¸c ®êi truyÒn l¹i, nh­ng ®· bŞ tæn h¹i tõ cuéc chiÕn nhiÒu n¨m tr­íc, ta phông mÖnh tu s÷a ®· l©u, nh­ng vÉn ch­a thÓ hoµn thµnh, vÉn cÇn thªm m·nh thó hung d÷ nhÊt thiªn h¹ dïng m¸u ®Ó") 
elseif (GetTask(169) > 63) and (GetTask(169) < 65)then
Talk(1,"","Ên KiÕm Thu: B¹ch Hæ huyÕt mµ ta cÇn ®©u?")
elseif (GetTask(169) == 65) and (HaveCommonItem(6,1,3956)>0) then
Talk(2,"L50_hs2","Ên KiÕm Thu: Ng­¬i lµm tèt l¾m! ThÇn binh Huy Li t¸i xuÊt sÏ kh«ng cßn xa n÷a.")
else 
Talk(1,"","Ên KiÕm Thu: c¸c h¹ cÇn g×?")	
end
end

function L50_hs() 
SetTask(169,64)
AddNote("§Õn khu vùc TuyÕt B¸o §éng (190/207) tiªu diÖt §iÕu T×nh B¹ch Hæ ®Ó ®o¹t lÊy m¸u.") 
Msg2Player("§Õn khu vùc TuyÕt B¸o §éng (190/207) tiªu diÖt §iÕu T×nh B¹ch Hæ ®Ó ®o¹t lÊy m¸u.") 
end 

function L50_hs2() 
DelCommonItem(6,1,3956)
DelCommonItem(6,1,3953)
SetTask(169,66)
AddNote("§· hæ trî Ên KiÕm Thu, cã thÓ kiÓm tra cÈm nang råi.") 
Msg2Player("§· hæ trî Ên KiÕm Thu, cã thÓ kiÓm tra cÈm nang råi.") 
end 

