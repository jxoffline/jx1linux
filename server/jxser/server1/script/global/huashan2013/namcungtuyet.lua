--Edit by Youtube PGaming--


Include("\\script\\global\\skills_table.lua")
Include([[\script\event\teachersday06_v\prize_qingyika.lua]]);
Include("\\script\\task\\lv120skill\\head.lua")
Include("\\script\\misc\\daiyitoushi\\toushi_function.lua")	
Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\lib\\awardtemplet.lua")

function main()
		Say("<color=yellow>Nam Cung TuyÖt<color>: GÇn ®©y ta cã rÊt nhiÒu viÖc gi¶i quyÕt, ng­¬i ®Õn ®©y cã viÖc g×.", 3, "ChuyÓn m«n ph¸i./chuyenphai","Muèn thØnh gi¸o viÖc kh¸c./oldentence", "KÕt thóc ®åi tho¹i./no");
		return
	end;

function oldentence()

if (GetTask(169) == 61)  and (GetLevel() >=50)then
Say("Nam Cung TuyÖt: §Ö tö bæn ph¸i, phµm tôc xuÊt s­, cÇn ph¶i tr·i qua mét lo¹t c¸c kh¶o nghiÖm, ng­¬i cã muèn tiÕp nhËn kh¶o nghiÖm kh«ng?",2,"TiÕp nhËn kiÓm tra/L50_get_yes","§Ó ta suy nghÜ l¹i/L50_get_no")
elseif (GetTask(169) > 61) and (GetTask(169) <69)then
Talk(1,"","Nam Cung TuyÖt: Mau ®i ®i.")
elseif (GetTask(169) > 68) and (GetTask(169) <70) and (HaveCommonItem(6,1,3952) == 1)then
Talk(1,"","Nam Cung TuyÖt: Mau ®i ®i.")
elseif (GetTask(169) == 70) then
Talk(1,"L50_hs","Nam Cung TuyÖt: Tèt l¾m, xem ra ng­¬i ®· hoµn thµnh kh¶o nghiÖm, cã thÓ suÊt s­ su«n sÎ råi!")
elseif (GetTask(169) == 69) and (HaveCommonItem(6,1,3952) == 0) then
Talk(2,"L50222_hs","Nam Cung TuyÖt: Mãn ®å quan träng thÕ nµy mµ ng­¬i còng lµm mÊt? LÇn sau ph¶i cÈn thËn ®Êy.")
elseif (GetTask(169) == 71)  and (GetLevel() >=60) then
Talk(6,"L50_hs2","Ng­êi ch¬i: Ch­ëng m«n ...","Nam Cung TuyÖt: Ng­¬i xuèng nói tr·i nghiÖm l©u nh­ vËy, c¶m gi¸c thÕ nµo?","Ng­¬i ch¬i: §Ö tö tõ khi xuèng nói, lµ phiªu b¹t giang hå, c¶m nhËn s©u s¾c con ng­êi trong giang hå, th©n bÊt do kû, lßng lu«n nhí vÒ nh÷ng ngµy th¸ng t¹i s­ m«n...","Nam Cung TuyÖt: NÕu ®· nh­ vËy, ta cho phĞp ng­¬i quay l¹i m«n ph¸i, chØ cÇn ng­¬i muèn, ph¸i Hoa S¬n lu«n më cöa ®ãn nhËn.","Ng­êi ch¬i: §Ö tö ®ång ı! Ngoµi ra, sau khi h¹ s¬n, ®Ö tö ®· tİch gãp ®­îc 1 İt, qu©n tö ¸i tµi, thñ chi h÷u ®¹o, sè tiÒn nµy lµ do c¸c b»ng h÷u trong giang hå tÆng trong nh÷ng lÇn ®Ö tö hµnh hiÖp tr­îng nghÜa. §Ö tö vèn kh«ng dïng tíi, muèn quyªn gãp cho")
elseif (GetTask(169) == 72) and (GetLevel() >=60) then
Say("Nam Cung TuyÖt: ®· mang 50000 l­îng ®Õn ch­a?.",2,"§· mang ®Õn råi./L503_get_yes","VÉn ch­a ®ñ/L50_get_no")
elseif (GetTask(169) == 73) and (GetLevel() >=60) then
Say("Nam Cung TuyÖt: L¹i muèn h¹ s¬n tr·i nghiÖm sao?",2,"V©ng, mong Ch­ëng m«n cho phĞp./L504_get_yes","Kh«ng, ta tù thÊy c«ng phutËp luyÖn vÉn ch­a ®ñ./L50_get_no")
elseif (GetTask(169) == 74)  and (GetLevel() >=60) then
Talk(6,"L50_hs3","Ng­êi ch¬i: Ch­ëng m«n ...","Nam Cung TuyÖt: Ng­¬i xuèng nói tr·i nghiÖm l©u nh­ vËy, c¶m gi¸c thÕ nµo?","Ng­¬i ch¬i: §Ö tö tõ khi xuèng nói, lµ phiªu b¹t giang hå, c¶m nhËn s©u s¾c con ng­êi trong giang hå, th©n bÊt do kû, lßng lu«n nhí vÒ nh÷ng ngµy th¸ng t¹i s­ m«n...","Nam Cung TuyÖt: NÕu ®· nh­ vËy, ta cho phĞp ng­¬i quay l¹i m«n ph¸i, chØ cÇn ng­¬i muèn, ph¸i Hoa S¬n lu«n më cöa ®ãn nhËn.","Ng­êi ch¬i: §Ö tö ®ång ı! Ngoµi ra, sau khi h¹ s¬n, ®Ö tö ®· tİch gãp ®­îc 1 İt, qu©n tö ¸i tµi, thñ chi h÷u ®¹o, sè tiÒn nµy lµ do c¸c b»ng h÷u trong giang hå tÆng trong nh÷ng lÇn ®Ö tö hµnh hiÖp tr­îng nghÜa. §Ö tö vèn kh«ng dïng tíi, muèn quyªn gãp cho")
elseif (GetTask(169) == 75) and (GetLevel() >=60) then
Say("Nam Cung TuyÖt: ®· mang 50000 l­îng ®Õn ch­a?.",2,"§· mang ®Õn råi./L5032_get_yes","VÉn ch­a ®ñ/L50_get_no")
elseif (HaveMagic(1379) < 0) and (HaveMagic(1347) >= 0) or ((GetTask(169) == 71) and (GetLevel() < 60) )then
Talk(1,"","Nam Cung TuyÖt: §· gia nhËp vµo ph¸i Hoa S¬n ta, th× ph¶i ch¨m chØ luyÖn tËp, nh­ vËy míi xøng danh lµ ®Ö tö Hoa S¬n.")
else
Talk(1,"","Nam Cung TuyÖt: ph¸i Hoa S¬n ta vèn vÜ danh tiÕng ®· l©u, lÇn nµy t¸i xuÊt giang hå, ph¶i cho thÕ nh©n thÊy ®­îc thanh uy cña Hoa S¬n.")
end
end

function L50222_hs() 
 tbAwardTemplet:GiveAwardByList({tbProp = {6,1,3952,0,0,0}, nBindState=-2}, "test", 1);
end


function L504_get_yes()  
SetCurCamp(4)
SetCamp(4) 
SetTask(169,74)
Msg2Player("Ta rêi ph¸i Hoa S¬n, t¸i xuÊt giang hå.") 
AddNote("Ta rêi ph¸i Hoa S¬n, t¸i xuÊt giang hå.") 
end

function L5032_get_yes()  
if GetCash() >= 50000 then
Pay(50000)
Talk(1,"","Nam Cung TuyÖt: Giê con cã thÓ tù do ra vµo Hoa S¬n ph¸i.")
SetTask(169,73)
Msg2Player("Ng­¬i ®· trë l¹i s­ m«n, nhËn ®­îc danh hiÖu Th¸i Häc C¸c Chñ.") 
AddNote("Ng­¬i ®· trë l¹i s­ m«n, nhËn ®­îc danh hiÖu Th¸i Häc C¸c Chñ.") 
SetCurCamp(3)
SetCamp(3) 
SetRank(89)
else
Talk(2,"","Nam Cung TuyÖt: Ng­¬i ch­a mang ®ñ 50000 l­îng.","Ng­êi ch¬i: Ta l¹i t×m thö xem sao.")
end; 
end

function L503_get_yes()  
if GetCash() >= 50000 then
Pay(50000)
Talk(1,"","Nam Cung TuyÖt: Giê ta phong con lµm Th¸i Häc C¸c Chñ, vµ truyÒn thô tuyÖt häc bæn m«n: Th­¬ng Tïng Nghªnh Kh¸ch, Ma V©n KiÕm Khİ, HuyÒn Nh·n V©n yªn.")
SetTask(169,73)
Msg2Player("Ng­¬i ®· trë l¹i s­ m«n, nhËn ®­îc danh hiÖu Th¸i Häc C¸c Chñ, häc ®­îc vâ c«ng Th­¬ng Tïng Nghªnh Kh¸ch, Ma V©n KiÕm Khİ, HuyÒn Nh·n V©n Yªn.") 
AddNote("Ng­¬i ®· trë l¹i s­ m«n, nhËn ®­îc danh hiÖu Th¸i Häc C¸c Chñ, häc ®­îc vâ c«ng Th­¬ng Tïng Nghªnh Kh¸ch, Ma V©n KiÕm Khİ, HuyÒn Nh·n V©n Yªn.") 
SetCurCamp(3)
SetCamp(3) 
AddMagic(1358)
AddMagic(1360)
AddMagic(1380)
SetRank(89)
AddGoldItem(0, 4642)
AddGoldItem(0, 4652)
Msg2Player("NhËn ®­îc <color=yellow>trang bŞ hoµng kim cÊp Thanh C©u.")
else
Talk(2,"","Nam Cung TuyÖt: Ng­¬i ch­a mang ®ñ 50000 l­îng.","Ng­êi ch¬i: Ta l¹i t×m thö xem sao.")
end; 
end

function L50_hs3() 
Say("Nam Cung TuyÖt: Tèt l¾m, h·y ®em 50000 l­îng tíi ®©y.",2,"§­îc!/L5023_get_yes","§Ó ta suy nghÜ l¹i/L50_get_no")
end; 		
	
function L5023_get_yes()  
Talk(1,"","Ng­êi ch¬i: §­îc, §Ö tö sÏ ®i lÊy 50000 l­îng.")
SetTask(169,75)
Msg2Player("Cèng hiÕn 50000 l­îng lµ cã thÓ trë l¹i s­ m«n.") 
AddNote("Cèng hiÕn 50000 l­îng lµ cã thÓ trë l¹i s­ m«n.") 
end; 	

function L50_hs2() 
Say("Nam Cung TuyÖt: Tèt l¾m, h·y ®em 50000 l­îng tíi ®©y.",2,"§­îc!/L502_get_yes","§Ó ta suy nghÜ l¹i/L50_get_no")
end; 		
	
function L502_get_yes()  
Talk(1,"","Ng­êi ch¬i: §­îc, §Ö tö sÏ ®i lÊy 50000 l­îng.")
SetTask(169,72)
Msg2Player("Cèng hiÕn 50000 l­îng lµ cã thÓ trë l¹i s­ m«n.") 
AddNote("Cèng hiÕn 50000 l­îng lµ cã thÓ trë l¹i s­ m«n.") 
end; 	

function L50_hs() 
DelCommonItem(6,1,3952)
AddRepute(120)
SetCurCamp(4)
SetCamp(4) 
SetTask(169,71)
SetRank(88)
Msg2Player("Håi ®¸p Nam Cung TuyÖt, hoµn thµnh nhiÖm vô xuÊt s­ Ng­¬i ®· xuÊt s­ thµnh c«ng, NhËn ®­îc danh hiÖu Lôc NghÖ TruyÒn Nh©n.") 
AddNote("Håi ®¸p Nam Cung TuyÖt, hoµn thµnh nhiÖm vô xuÊt s­ Ng­¬i ®· xuÊt s­ thµnh c«ng, NhËn ®­îc danh hiÖu Lôc NghÖ TruyÒn Nh©n.") 
AddGoldItem(0, 4641)
AddGoldItem(0, 4651)
Msg2Player("NhËn ®­îc <color=yellow>trang bŞ hoµng kim cÊp Thanh C©u.")
end; 	
	
function L50_get_yes()  
Talk(1,"","Nam Cung TuyÖt: trong cÈm nang nµy cã 3 m·nh giÊy, mçi m·nh giÊy lµ mét nhiÖm vô, sau khi hoµn thµnh mét nhiÖm vô míi cã thÓ më m·nh giÊy thø 2 cø nh­ thÕ mµ hoµn thµnh, ng­¬i mau ®i ®i.")
	SetTask(169,62)
	tbAwardTemplet:GiveAwardByList({tbProp = {6,1,3952,0,0,0}, nBindState=-2}, "test", 1);
AddNote("GÆp Nam Cung TuyÖt, tiÕp nhËn nhiÖm vô xuÊt s­ kiÓm tra cÈm nang.") 
Msg2Player("GÆp Nam Cung TuyÖt, tiÕp nhËn nhiÖm vô xuÊt s­ kiÓm tra cÈm nang.") 

end; 

function no()
end

function L50_get_no() 
end; 	


---------------------chuyen phai test lai sau ---------------------------------------

function chuyenphai()
local tbDes = {"§¸i nghÖ ®Çu s­/#daiyitoushi_main(10)", "Muèn thØnh gi¸o viÖc kh¸c/common_talk"};
Say("GÇn ®©y ta cã rÊt nhiÒu viÖc gi¶i quyÕt, ng­¬i ®Õn ®©y cã viÖc g×.", getn(tbDes), tbDes);
end





