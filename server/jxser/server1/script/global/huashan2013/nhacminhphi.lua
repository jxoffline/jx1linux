Include("\\script\\lib\\awardtemplet.lua")
--Edit by Youtube PGaming  --

Include("\\script\\dailogsys\\dailogsay.lua")

function main() 
if ((GetLevel() >=90) and (GetTask(69) == 13) and  GetRepute() > 239 and (HaveMagic(1347) >= 0)) then 
Talk(8,"L90_hs","Ng­êi ch¬i: ThËp niªn giang hå vò phiªu linh. ChÊp ®ao tr­îng kiÕm ®­¬ng bÊt b×nh. Håi thñ méng trung th©n nh­ kh¸ch, bÊt nh­îc quy khø v¹n trïng thanh. VÞ c«ng tö nµy qu¶ thËt kh«ng tÇm th­êng, kh«ng biÕt t¹i h¹ cã thÓ ®èi t­ víi c«ng tö.","Nh¹c Minh Phi: Huynh §µi, qu¸ khen råi, t¹i h¹ chØ lµ ng­êi tÇm th­êng trong v¹n v¹n chóng sinh th«i.","Ng­êi ch¬i: c«ng tö kh«ng cÇn qu¸ khiªm nh­êng? HiÖn nay thiªn h¹ ®¹i lo¹n, kh«ng Ýt ng­êi bÞ tôc l­u c¶ ®êi, nh­ng c«ng tö l¹i cã thÓ ng©m ra thÕ sù thøc tØnh, kh«ng khái khiÕn ng­êi kh¸c ng­ìng mé.","Nh¹c Minh Phi: Ha ha, Huynh ®µi. hiÓu ta! Kh«ng biÕt Huynh ®µi cao danh quý t¸nh lµ g×? quý danh, cã thÓ chóng ta sÏ trë thµnh mét tri giao!","Ng­êi ch¬i: t¹i h¹ "..GetName()..".","Nh¹c Minh Phi: t¹i h¹ Nh¹c Minh Phi, h«m nay ®­îc uèng r­îu ng©m th¬ cïng Huynh ®µi, kh«ng say kh«ng vÒ","Töu qua 3 giê...")
elseif (GetTask(69) > 19) and (GetTask(69) < 21)then
Talk(1,"","Nh¹c Minh Phi: thÕ Huynh ®µi, cßn muèn uèng víi ta vµi ly kh«ng, haha.")
elseif (GetTask(69) == 22) and (HaveCommonItem(6,1,3958)>0) then 
Talk(8,"L902_hs","Nh¹c Minh Phi: µi...","Ng­êi ch¬i: Minh Phi Huynh sao thÕ","Nh¹c Minh Phi: ...khi n·y cã mÊy tªn h¾c y nh©n ®Õn hµnh thÝch ta, ta ®· cùc lùc chèng l¹i nh­ng vÉn bÞ th­¬ng, may thay khi Êy quan binh ®i ngang, nªn chóng t¹m rót lui...nãi thÕ ch¼ng lÏ c¸c h¹ còng ®· ®ông ®é chóng??","Ng­êi ch¬i: §óng, t¹i h¹ ph¸t hiÖn ra 1 sè m¸u tÝch t¹i thµnh ngoµi, ®ang tÝnh truy lïng th× bÞ mét tªn ng­êi ThÇn BÝ ®ét kÝch, trªn ng­êi h¾n cã 1 th­ mËt lÖnh nghe nãi sÏ g©y bÊt lîi víi huynh, nh­ng kh«ng ngê ®Õn trÔ 1 b­íc...","Nh¹c Minh Phi: kh«ng sao, ®©y kh«ng ph¶i lµ vÕt th­¬ng nÆng g×","Nh¹c Minh Phi: nh÷ng tªn lóc n·y cã thÓ thÊy r»ng chóng ®Õn tõ Thiªn NhÉn Gi¸o, viÖc nµy nhÊt ®Þnh liªn quan ®Õn Thiªn NhÉn M«n, "..GetName()..", t¹i h¹ muèn nhê mét viÖc","Ng­êi ch¬i: Huynh cø nãi.")
elseif (GetTask(69) > 22) and (GetTask(69) < 24)then
Talk(1,"","Nh¹c Minh Phi: thÕ nµo? §· göi th­ ch­a?")
elseif (GetTask(69) > 25) and (GetTask(69) < 31)then 
Talk(1,"","Nh¹c Minh Phi: Huynh ®µi, trªn ®­êng cÈn thËn.") 
elseif (GetTask(69) == 25) then 
Talk(7,"L903_hs","Ng­êi ch¬i: Minh Phi Huynh, LËn tiÒn bèi nhê ta ®Õn hç trî huynh.","Nh¹c Minh Phi: cuèi cïng còng ph¶i nhê ®Õn c¸c h¹.","Ng­êi ch¬i: hai ta ®· lµ tri giao th× kh«ng cÇn ph¶i nãi nh­ thÕ, huynh cø s¾p xÕp.","Nh¹c Minh Phi: thÕ th× Minh Phi kh«ng kh¸ch khÝ n÷a, ta ®· th¸m thÝnh ®­îc ngµy mai s¸t thñ cña Thiªn NhÉn Gi¸o sÏ ®Õn Phôc Ng­u S¬n mai phôc, ta hµnh ®éng bÊt tiÖn, ®¸nh nhê c¸c h¹ ®i ng¨n c¶n chóng","Ng­êi ch¬i: nhÊt ®Þnh kh«ng phô së th¸c.","Nh¹c Minh Phi: c¸c h¹ h·y cÈn träng.")
elseif (GetTask(69) == 31) then 
Talk(7,"L904_hs","Ng­êi ch¬i: t¹i h¹ ®· gi¶i quyÕt toµn bé s¸t thñ.","Nh¹c Minh Phi: Tèt qu¸, lÇn nµy Thiªn NhÉn Gi¸o sÏ kh«ng cßn thùc hiÖn ®­îc ©m m­u n÷a. "..GetName()..", qu¶ thËt ®a t¹.","Ng­êi ch¬i: chØ lµ chuyÖn nhá nh¹t, huynh kh«ng cÇn kh¸ch s¸o.","Nh¹c Minh Phi: haha, t¹i h¹ cã mét quÈn MËt TÞch Hoa S¬n, do chÝnh tay ta sao chÐp, xem nh­ lÔ vËt håi ®¸p.","Ng­êi ch¬i: c¸i nµy, t¹i h¹ sao d¸m nhËn...","Nh¹c Minh Phi: kh«ng sao, víi vâ c«ng vµ phÈm chÊt nh­ Huynh ®µi. ®©y, quyÓn mËt tÞch nµy kh«ng cßn ai thÝch hîp h¬n.","Ng­êi ch¬i: thÕ nµy t¹i h¹ ®µnh thÊt lÔ.")
else
Talk(1,"","Nh¹c Minh Phi: ThËp niªn giang hå vò phiªu linh. ChÊp ®ao tr­îng kiÕm ®­¬ng bÊt b×nh. Håi thñ m«ng trung th©n nh­ kh¸ch, bÊt nh­îc quy khø v¹n trïng thanh.")


end
end;

function L904_hs() 
AddNote("Häc ®­îc vâ c«ng §o¹t MÖnh Liªn Hoµn Tam Tiªn KiÕm, BÝch Th¹ch Ph¸ Ngäc, Tö Hµ KiÕm KhÝ.") 
Msg2Player("Häc ®­îc vâ c«ng §o¹t MÖnh Liªn Hoµn Tam Tiªn KiÕm, BÝch Th¹ch Ph¸ Ngäc, Tö Hµ KiÕm KhÝ.")
AddNote("Hoµn thµnh nhiÖm vô. NhËn ®­îc 1 ®iÓm danh väng.") 
Msg2Player("Hoµn thµnh nhiÖm vô. NhËn ®­îc 1 ®iÓm danh väng.")
AddRepute(1)
AddMagic(1364,1)
AddMagic(1382,1)
AddMagic(1365,1)
AddItem(6,1,2424,0,0,0)
AddItem(6,1,2425,0,0,0)
Msg2Player("Ng­¬i nhËn ®­îc <color=yellow>®¹i thµnh bÝ kÝp cÊp 90 vµ 120.")
SetTask(69,32)
AddGoldItem(0, 4659)
AddGoldItem(0, 4669)
Msg2Player("Ng­¬i nhËn ®­îc <color=yellow>trang bÞ hoµng kim Hoa S¬n cÊp V©n Léc.")
end  

function L903_hs() 
SetTask(69,26)
AddNote("§Õn Phôc Ng­u S¬n phÝa ®«ng, tiªu diÖt s¸t thñ Thiªn NhÉn Gi¸o") 
Msg2Player("§Õn Phôc Ng­u Sín phÝa ®«ng, tiªu diÖt s¸t thñ Thiªn NhÉn Gi¸o")
end 


function L90_hs() 
SetTask(69,20)
AddNote("KÕt giao víi Nh¹c Minh Phi, nhËn nhiÖm vô T­¬ng D­¬ng KÕt Tri Giao. §Õn ngo¹i « T­¬ng D­¬ng kiÓm tra") 
Msg2Player("KÕt giao víi Nh¹c Minh Phi, nhËn nhiÖm vô T­¬ng D­¬ng KÕt Tri Giao. §Õn ngo¹i « T­¬ng D­¬ng kiÓm tra")
end 


function L902_hs() 
tbAwardTemplet:GiveAwardByList({tbProp = {6,1,3959,0,0,0}, nBindState=-2}, "test", 1);
DelCommonItem(6,1,3958)
SetTask(69,23)
AddNote("§Õn chæ ph¸i Hoa S¬n mang th­ cña Nh¹c Minh Phi giao cho T« Phãng")
Msg2Player("§Õn chæ ph¸i Hoa S¬n mang th­ cña Nh¹c Minh Phi giao cho T« Phãng")
end 