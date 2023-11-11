--  Edit by Youtube PGaming--
Include("\\script\\dailogsys\\dailogsay.lua")
function main() 
if (GetTask(169) == 50)  and (GetLevel() >=50)then
Say("L©n H¹o Thiªn: GÇn ®©y b¸ch tÝnh ë VÜnh L¹c TrÊn bÞ ®¹o tÆc quÊy nhiÔu, mµ còng ch¼ng coi ph¸i Hoa S¬n ta ra g×, ng­¬i ®· gia nhËp ph¸i còng l©u råi, còng ®· ®Õn lóc xuèng nói råi, viÖc nµy giao cho ng­¬i gi¶i quyÕt.",2,"§Ö tö tu©n mÖnh./L50_get_yes","§Ö tö n¨ng lùc kh«ng ®ñ/L50_get_no")
elseif (GetTask(169) > 50) and (GetTask(169) < 60)then
Talk(1,"","L©n H¹o Thiªn: mau ®i ®i.")
elseif (GetTask(169) == 60) then
Talk(4,"nv5xHS","L©n H¹o Thiªn: §· lµm xong viÖc ch­a?","Ng­êi ch¬i: V©ng, ®Ö tö ®· rêi khái S¬n PhØ, ®· lÊy nh÷ng vËt bÞ c­íp tr¶ l¹i cho d©n råi.","L©n H¹o Thiªn: Tèt l¾m, kh«ng hæ danh ®Ö tö ph¸i Hoa S¬n.")
elseif (GetTask(69) == 24) then
Talk(9,"nv9xHS","Ng­êi ch¬i: LËn tiÒn bèi, ®©y lµ tin cña Nh¹c Minh Phi ë T­¬ng D­¬ng nhê ta ®­a tíi, «ng ta bÞ ®¸nh lÐn bÞ th­¬ng, kh«ng tiÖn trë vÒ.","LËn H¹o Thiªn: Thiªn NhÉn Gi¸o cã ý ®å m­u h¹i quan viªn triÒu ®×nh.","LËn H¹o Thiªn: §· lµ ng­êi cña Thiªn NhÉn Gi¸o, ph¸i Hoa S¬n kh«ng thÓ kh«ng qu¶n, ta vèn muèn cho T« Phãng ®i gióp ®ì Nh¹c Minh Phi, nh­ng h¾n bÞ S­ huynh nhèt t¹i T­ Qu¸ Nhai råi.","Ng­êi ch¬i: H¾n sao råi?","LËn H¹o Thiªn: §õng nh¾t chuyÖn nµy n÷a. S­ huynh thùc sù ®· suy nghÜ qu¸ nhiÒu råi, ®¹i hiÖp, kh«ng biÕt cã thÓ nhê ng­¬i mét viÖc kh«ng?","Ng­êi ch¬i: LËn tiÒn bèi cø sai b¶o.","LËn H¹o Thiªn: Ta vµ Minh Phi vèn lµ t©m giao, bÌn nhê T« Phãng gióp chuyÖn nµy, ph¸ tan ©m m­u cña Thiªn NhÉn gi¸o.","Ng­êi ch¬i: TiÒn bèi yªn t©m, ta ®i ngay.")
elseif (HaveMagic(1355) < 0) and (HaveMagic(1347) >= 0) then
Talk(4,"","L©n H¹o Thiªn: NÕu cã thêi gian th× h·y rÌn luyÖn b¶n th©n thªm nhÐ!")
elseif (HaveMagic(1355) >= 0) and GetCurCamp() == 1 and GetCamp() == 1 or (HaveMagic(1355) >= 0) and GetCurCamp() == 2 and GetCamp() == 2 or (HaveMagic(1355) >= 0) and GetCurCamp() == 3 and GetCamp() == 3 then
Talk(1,"","L©n H¹o Thiªn: Dùa vµo t­ chÊt cña ng­¬i, thµnh tùu sau nµy kh«ng chØ dõng ë ®ã.")
elseif (GetTask(69) > 24) and (GetTask(69) < 31)then
Talk(1,"","L©n H¹o Thiªn: mau ®i ®i.")
elseif GetCurCamp() == 4 and GetCamp() == 4  and  (HaveMagic(1355) >= 0) then 
Talk(1,"","L©n H¹o Thiªn: D¸m lõa ph¸i Hoa S¬n ta, ®¸ng bÞ trõng ph¹t!")	
else 
Talk(1,"","L©n H¹o Thiªn: D¸m lõa ph¸i Hoa S¬n ta, ®¸ng bÞ trõng ph¹t!")	
end
end

function nv9xHS()  
	SetTask(69,25)
	AddNote("§Õn T­¬ng D­¬ng gióp Nh¹c Minh Phi.") 
Msg2Player("§Õn T­¬ng D­¬ng gióp Nh¹c Minh Phi.") 
end; 

function nv5xHS()  

AddMagic(1355)
AddMagic(1379)
	SetTask(169,61)
	SetRank(87)
	AddNote("Håi ®¸p L©n H¹o Thiªn, hoµn thµnh nhiÖm vô VÜnh L¹c Phong V©n, ng­¬i th¨ng cÊp thµnh DÞch Thu Sø, häc ®­îc vâ c«ng Cµn Kh«n §¶o HuyÒn, KhÝ Qu¸n Tr­êng Hång.") 
Msg2Player("Håi ®¸p L©n H¹o Thiªn, hoµn thµnh nhiÖm vô VÜnh L¹c Phong V©n, ng­¬i th¨ng cÊp thµnh DÞch Thu Sø, häc ®­îc vâ c«ng Cµn Kh«n §¶o HuyÒn, KhÝ Qu¸n Tr­êng Hång.") 
AddGoldItem(0, 4640)
AddGoldItem(0, 4650)
Msg2Player("NhËn ®­îc <color=yellow>trang bÞ hoµng kim cÊp Thanh C©u.")
end; 

function L50_get_yes()  
	SetTask(169,51)
	AddNote("GÆp L©n H¹o Thiªn, nhËn nhiÖm vô VÜnh L¹c Phong V©n, h·y ®Õn gióp ®ì d©n c­ VÜnh L¹c TrÊn.") 
	Msg2Player("NhËn nhiÖm vô VÜnh L¹c Phong V©n, h·y ®Õn gióp ®ì d©n c­ VÜnh L¹c TrÊn.") 
	Msg2Player("§Õn VÜnh L¹c TrÊn t×m Hoµng thóc <color=yellow>202/198<color>, §æng ®¹i thóc <color=yellow>198/200<color> vµ bµ Th­ <color=yellow>204/206<color>.") 
end; 

function L50_get_no() 
end; 

