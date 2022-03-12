--   Edit by Youtube PGaming  --

Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
function main() 
if (GetTask(169) == 10)  then
Talk(4,"L10_hs","V¹n T­ ViÔn: trµ ngon, tiÕc lµ...","Ng­êi ch¬i: S­ huynh, trµ nµy cã g× kh«ng tháa ®¸ng?") 
elseif (GetTask(169) == 12) and (HaveCommonItem(6,1,3943)>0) then
Talk(2,"L10_prise","Ng­êi ch¬i: S­ huynh, huynh xem n­íc suèi nµy s¹ch thËt.","V¹n T­ ViÔn: N­íc suèi nµy thËt trong lµnh thuÇn khiÕt, ®óng lµ th­îng phÈm, rÊt hîp ®Ó pha trµ, ®a t¹!") 
elseif (GetTask(169) > 10) and (GetTask(169) < 12)then
Talk(1,"","V¹n T­ ViÔn: §Õn dßng suèi lµ cã thÓ nhËn ®­îc Thanh TuyÒn Kho¸ng Thñy")
elseif (GetTask(69) == 52) then
Say("V¹n T­ ViÔn: TiÓu Phãng tİnh t×nh lç m·ng kİch ®éng, haizz...",2,"NhiÖm vô kü n¨ng cÊp 150/nv15x","Ta ®Õn t×m «ng cã viÖc kh¸c/L50_get_no")
elseif (GetTask(69) > 52 ) and (GetTask(69) < 54) then 
Say("V¹n T­ ViÔn: TiÓu Phãng tİnh t×nh lç m·ng kİch ®éng, haizz...",2,"NhiÖm vô kü n¨ng cÊp 150/nv15x4","Ta ®Õn t×m «ng cã viÖc kh¸c/L50_get_no")
elseif (GetTask(69) == 61) then
Say("V¹n T­ ViÔn: TiÓu Phãng tİnh t×nh lç m·ng kİch ®éng, haizz...",2,"NhiÖm vô kü n¨ng cÊp 150/nv15x2","Ta ®Õn t×m «ng cã viÖc kh¸c/L50_get_no") 
elseif (HaveMagic(1349) >= 0) then
Talk(1,"","V¹n T­ ViÔn: Kú thñy, dông s¬n thñy th­îng, giang thñy trung, c¶nh thñy h¹. Kú s¬n thñy luyÖn khæng tuyÒn, th¹ch tr× m¹n l­u gi¶ th­îng, vËt thùc chi...")	
else 
Talk(1,"","V¹n T­ ViÔn: TiÓu Phãng tİnh t×nh lç m·ng kİch ®éng, haizz...")	
end
end


function nv15x4() 
Talk(1,"","V¹n T­ ViÔn: Mau ®i ®i.")	
end; 


function nv15x2() 
if CalcFreeItemCellCount() < 6 then
CreateTaskSay({"Xin h·y s¾p xÕp l¹i hµnh trang! Nhí ®Ó trèng 6 « trë lªn nhĞ!",  "§­îc råi./Cancel",});
return 1;
end
Talk(5,"","Ng­êi ch¬i: S­ huynh! m¾t huynh lµm sao thÕ?","V¹n T­ ViÔn: ...§õng lo, V©n Mi ®· gióp ta ®i t×m thuèc råi.","Ng­êi ch¬i: ...S­ huynh, lµ do lçi cña ®Ö.","V¹n T­ ViÔn: Kh«ng cÇn Êy n¸y, viÖc nµy kh«ng ph¶i lçi cña ®Ö, ng­îc l¹i ta ph¶i c¶m ¬n ®Ö ®· cøu ThÈm MÆc.","Ng­êi ch¬i: Kh«ng cã g× ®©u, t­¬ng trî ®ång m«n lµ chuyÖn nªn lµm.","V¹n T­ ViÔn: Kú thùc chuyÖn nµy lµ trong häa cã may, TiÓu Phãng sau nµy sÏ kh«ng cßn lç m·ng n÷a. ChØ lµ tr­íc ®©y vµi ngµy ta cã nhËn ®­îc 1 lÖnh bµi, t×nh h×nh thÕ nµy th× e lµ kh«ng thùc hiÖn ®­îc, ph¶i nhê ®Ö thay ta chuyÕn nµy vËy.")
tbAwardTemplet:GiveAwardByList({tbProp = {6,1,2908,1,0,0}, nBindState=-2}, "test", 1);
AddNote("NhËn ®­îc NguyÖt Ca LÖnh.") 
Msg2Player("NhËn ®­îc NguyÖt Ca LÖnh.") 
AddNote("§Õn chç D­¬ng Ch©u t×m thuyÒn phu lªn ®¶o.") 
Msg2Player("§Õn chç D­¬ng Ch©u t×m thuyÒn phu lªn ®¶o.") 
SetTask(2885,1) 
SetTask(69,62) 
AddGoldItem(0, 4660)
AddGoldItem(0, 4670)
Talk(1,"","§Ö h·y nhËn chót lßng thµnh nµy.")
Msg2Player("NhËn ®­îc <color=yellow>trang bŞ hoµng kim cÊp V©n Léc.") 
end; 


function nv15x() 
Talk(5,"","Ng­êi ch¬i: T« S­ huynh nghe nãi Chu Tiªn TrÊn cã tung tİch cña Thiªn NhÉn Gi¸o, ®· ®İch th©n xuèng nói t×m hiÓu.","V¹n T­ ViÔn: C¸i g×?! H¾n nghe ®­îc tõ ®©u?","Ng­êi ch¬i: lµ...lµ do ta nãi víi h¾n, chuyÖn lµ nh­ thÕ nµy.","V¹n T­ ViÔn: ...uh, còng kh«ng tr¸ch ng­¬i ®­îc, ®Çu tiªn lµ ®Ö tö ®­a c¬m nãi lé. ChØ lµ chuyÖn cña Chu Tiªn TrÊn cßn mét sè ®iÓm ®¸ng nghi, ta e r»ng cã sù lõa g¹t...","V¹n T­ ViÔn: S­ phô ®ang bÕ quan, chØ cã thÓ ®i theo xem, còng cÇn ph¶i phèi hîp víi ta, chuyÖn chóng ta xuèng nói, ng­¬i h·y nãi víi ThÈm MÆc S­ ®Ö mét tiÕng.")
SetTask(69,53)
AddNote("kÓ l¹i sù t×nh cho ThÈm MÆc.") 
Msg2Player("kÓ l¹i sù t×nh cho ThÈm MÆc.") 
end; 

function L50_get_no() 
end; 	

function L10_hs() 
Say("V¹n T­ ViÔn: §©y lµ trµ Tö D­¬ng Ng©n ChËm lÇn tr­íc ta xuèng nói mang vÒ, vèn lµ trµ ngon, nh­ng ph¶i dïng n­íc giÕng ®Ó nÊu, NÕu dïng n­íc kh¸c sÏ mÊt vŞ ngon. §¹i hiÖp s­ ®Ö, ®¹i hiÖp cã thÓ ®i lÊy İt n­íc suèi trong nói vÒ ®©y kh«ng?",2,"Ta ®i ngay./L10_get_yes","Ta cã viÖc kh¸c ph¶i lµm/L10_get_no") 
end 

function L10_get_yes()  
	tbAwardTemplet:GiveAwardByList({tbProp = {6,1,3942,0,0,0}, nBindState=-2}, "test", 1);
	SetTask(169,11)
	AddNote("GÆp V¹n T­ ViÔn, nhËn nhiÖm vô lÊy n­íc pha trµ, ®Õn khe suèi ®Ó lÊy n­íc.") 
	Msg2Player("GÆp V¹n T­ ViÔn, nhËn nhiÖm vô lÊy n­íc pha trµ, ®Õn khe suèi ®Ó lÊy n­íc.") 
end; 

function L10_get_no() 
end; 

function L10_prise() 
Talk("Ng­êi ch¬i: S­ huynh, huynh xem n­íc suèi nµy s¹ch thËt.","V¹n T­ ViÔn: N­íc suèi nµy thËt trong lµnh thuÇn khiÕt, ®óng lµ th­îng phÈm, rÊt hîp ®Ó pha trµ, ®a t¹!") 
SetTask(169,20)
DelCommonItem(6,1,3943)
SetRank(83) 
AddMagic(1349,0)
AddMagic(1374,0)
Msg2Player("Håi §¸p V¹n T­ ViÔn, hoµn thµnh nhiÖm vô lÊy n­íc pha trµ ®¹i hiÖp t¨ng cÊp thµnh ®Ö tö phông trµ, häc ®­îc vâ c«ng KiÕm T«ng Tæng QuyÕt, Long NhiÔu Th©n.") 
AddGoldItem(0, 4633)
AddGoldItem(0, 4643)
Msg2Player("NhËn ®­îc <color=yellow>d©y chuyÒn hoµng kim cÊp Thanh C©u.") 
AddNote("H¸i thuèc trë l¹i , thÊy tiÓu hµn phôc mÖnh , th¨ng cÊp thµnh phông kiÕm ®Ö tö ") 
end; 

