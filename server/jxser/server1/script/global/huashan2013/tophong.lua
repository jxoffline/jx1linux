--   Edit by Youtube PGaming--
Include("\\script\\dailogsys\\dailogsay.lua")
function main() 
if  (GetTask(69) == 23) and (HaveCommonItem(6,1,3959)>0) then
Talk(5,"L90_hs","Ng­êi ch¬i: §©y lµ cña Minh Phi huynh nhê ta ®­a cho ng­¬i...","Ng­êi ch¬i: ...Sù t×nh ®¹i ®Ó lµ nh­ vËy.","T« Phãng: §¸ng ghĞt, Thiªn NhÉn Gi¸o qu¶ lµ ng¹o m¹n!","T« Phãng: MÊy h«m nay ta bŞ s­ phô nhèt trong Tø Qu¸ Nhai, t¹m thêi kh«ng thÓ ra ngoµi, ng­¬i h·y ®em phong th­ nµy ®­a cho LËn s­ thóc, «ng Êy tù quyÕt ®o¸n.")
elseif ((GetLevel() >=150) and (HaveMagic(1365) >= 0) and (GetTask(69) < 50) and (HaveMagic(1369) < 0)) then 
Say("T« Phãng: ChuyÖn g×?",2,"NhiÖm vô kü n¨ng cÊp 150/nv15x","Ta ®Õn t×m «ng cã viÖc kh¸c/L50_get_no")
elseif (GetTask(69) > 49 ) and (GetTask(69) < 51) then 
Say("T« Phãng: ChuyÖn g×?",2,"NhiÖm vô kü n¨ng cÊp 150/nv15x3","Ta ®Õn t×m «ng cã viÖc kh¸c/L50_get_no")
elseif (GetTask(69) > 51 ) and (GetTask(69) < 54) then 
Say("T« Phãng: ChuyÖn g×?",2,"NhiÖm vô kü n¨ng cÊp 150/nv15x4","Ta ®Õn t×m «ng cã viÖc kh¸c/L50_get_no")
elseif (GetTask(69) == 51) then
Say("T« Phãng: ChuyÖn g×?",2,"NhiÖm vô kü n¨ng cÊp 150/nv15x2","Ta ®Õn t×m «ng cã viÖc kh¸c/L50_get_no")
else
Talk(1,"","ChuyÖn g×?")

end
end; 

function nv15x4() 
Talk(1,"","T« Phãng: TuyÖt ®èi kh«ng ®­îc nãi víi ng­êi kh¸c.")
end; 

function nv15x3() 
Talk(1,"","T« Phãng: cËy nhê ®¹i hiÖp.")
end; 

function nv15x2() 
Talk(4,"","§¹i hiÖp kÓ l¹i c©u chuyÖn...","T« Phãng: §©y ch¾c ch¾n lµ ©m m­u cña Thiªn NhÉn Gi¸o, chØ do mét c« g¸i ®­a tin, xem nh­ ta xui xÎo.","T« Phãng: ViÖc quan träng nh­ vËy, ta ph¶i ®i mét chuyÕn, ph¸ vì ı ®å cña chóng, nh©n dŞp s­ phô ®ang bÕ quan tu hµnh, ta sÏ lĞn ra ngoµi mét chuyÕn! Ng­¬i kh«ng ®­îc nãi chuyÖn nµy cho ng­êi kh¸c biÕt.","Ng­êi ch¬i: (Néi t©m) Sao l¹i c¶m thÊy bÊt an nh­ thÕ nµy, hay lµ ta nãi cho s­ huynh biÕt nhØ.")
SetTask(69,52)
AddNote("kÓ l¹i sù t×nh cho V¹n T­ ViÔn.") 
Msg2Player("kÓ l¹i sù t×nh cho V¹n T­ ViÔn.") 
end; 


function nv15x() 
Talk(4,"","Tè Phãng: C¬ héi lín, ta ®· bŞ nhèt trong Tø Qu¸ Nhai nµy l©u l¾m råi...","Ng­êi ch¬i: Xem ra S­ huynh chäc giËn Tõ s­ thóc råi, cã chuyÖn g× cÇn ta gióp kh«ng?","T« Phãng: Ta nghe §Ö tö ®­a c¬m h«m qua cã nãi, ®¸m cÆn b· Thiªn NhÉn Gi¸o ®ang lµm g× ®ã ë Chu Tiªn TrÊn, tiÕc lµ ta kh«ng ®i ®­îc, ng­¬i cã thÓ gióp ta t×m hiÓu chuyÖn nµy kh«ng?","Ng­êi ch¬i: §­¬ng nhiªn råi, ta ®i ngay.")
SetTask(69,50)
AddNote("§Õn chæ Chu Tiªn TrÊn t×m C« g¸i khãc.") 
Msg2Player("§Õn chæ Chu Tiªn TrÊn t×m C« g¸i khãc.") 
end; 


function L90_hs() 
DelCommonItem(6,1,3959)
SetTask(69,24)
AddNote("Nãi cho LËn H¹o Thiªn.") 
Msg2Player("Nãi cho LËn H¹o Thiªn.") 
end; 

function L50_get_no() 
end; 	