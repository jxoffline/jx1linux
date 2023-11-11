--   Edit by Youtube PGaming--
Include("\\script\\dailogsys\\dailogsay.lua")
function main() 
if (GetTask(169) == 40) and (GetLevel() >=40) then
Talk(1,"nvL40","ThÈm MÆc: Kh«ng l©u n÷a lµ ®Õn sinh nhËt s­ phô råi, s­ phô b×nh th­êng rÊt nghiªm nghŞ, chØ cã së thİch ®¸nh cê, ta vµ T« s­ huynh bµn víi nhau lµm mét dông cô ®¸nh cê tinh tÕ tÆng cho s­ phô.")
elseif (GetTask(169) > 40) and (GetTask(169) < 45)then
Talk(1,"","ThÈm MÆc: Ng­¬i cã thÓ ®Õn Ph­îng T­êng Phñ t×m thö.")
elseif (GetTask(169) == 45) and (HaveCommonItem(6,1,3950)>0) then
Talk(3,"nvL402","Ng­êi ch¬i: bé V©n Tö Tr¾c Thu B×nh nµy dïng ®Ó lµm quµ cho LËn s­ thóc.","ThÈm MÆc: §©y lµ mãn ®å quı gi¸ s­ phô sÏ thİch l¾m ®©y, c¶m ¬n!")
elseif (GetTask(69) == 53) then
Say("ThÈm MÆc: ThÕ giíi vâ l©m...rÊt hçn lo¹n!",2,"NhiÖm vô kü n¨ng cÊp 150/nv15x","Ta ®Õn t×m «ng cã viÖc kh¸c/L50_get_no")
elseif (GetTask(69) > 53 ) and (GetTask(69) < 55) then 
Say("ThÈm MÆc: ThÕ giíi vâ l©m...rÊt hçn lo¹n!",2,"NhiÖm vô kü n¨ng cÊp 150/nv15x4","Ta ®Õn t×m «ng cã viÖc kh¸c/L50_get_no")
elseif  (HaveMagic(1354) < 0) and (HaveMagic(1347) >= 0) then
Talk(1,"","ThÈm MÆc: S­ phô lu«n quë tr¸ch ta nh¸t gan, trong m¾t ng­êi, ta vÉn kh«ng b»ng T« S­ huynh...")	
elseif  (HaveMagic(1354) >= 0) then
Talk(1,"","ThÈm MÆc: MÆc dï s­ phô ch­a bao giê nãi ra, nh­ng chóng ta ®Òu biÕt ng­êi rÊt thİch ch¬i cê.")	
else
Talk(1,"","ThÈm MÆc: ThÕ giíi vâ l©m...rÊt hçn lo¹n!")	
end
end

function nv15x4() 
Talk(1,"","ThÈm MÆc: ta sÏ hµnh ®éng ngay.")
end; 

function nv15x() 
Talk(2,"","Ng­êi ch¬i: T« S­ huynh h¹ s¬n ®i Chu Tiªn TrÊn, Ph­¬ng S­ huynh ®· ®i råi, b¶o ta ®Õn nãi víi ng­¬i mét tiÕng.","ThÈm MÆc: Sao? vËy ta còng ph¶i ®i theo tiÕp øng.")
SetTask(69,54)
AddNote("§Õn chæ Chu Tiªn TrÊn t×m ThÈm MÆc.") 
Msg2Player("§Õn chæ Chu Tiªn TrÊn t×m ThÈm MÆc.") 
end; 

function L50_get_no() 
end; 	





function nvL402()
DelCommonItem(6,1,3950)
AddMagic(1354)
AddMagic(1378)
SetTask(169,50)
SetRank(86)
 AddNote("Håi ®¸p ThÈm MÆc, hoµn thµnh V©n Tö Tr¾c Thu B×nh nhiÖm vô §¹i hiÖp t¨ng cÊp thµnh §an Thanh Sø, häc ®­îc vâ c«ng Hi Di KiÕm Ph¸p, Khİ ChÊn S¬n Hµ.") 
Msg2Player("Håi ®¸p ThÈm MÆc, hoµn thµnh V©n Tö Tr¾c Thu B×nh nhiÖm vô §¹i hiÖp t¨ng cÊp thµnh §an Thanh Sø, häc ®­îc vâ c«ng Hi Di KiÕm Ph¸p, Khİ ChÊn S¬n Hµ.") 
AddGoldItem(0, 4637)
AddGoldItem(0, 4638)
AddGoldItem(0, 4647)
AddGoldItem(0, 4648)
Msg2Player("NhËn ®­îc <color=yellow>trang bŞ hoµng kim cÊp Thanh C©u.")
end; 

function nvL40()
Say("ThÈm MÆc: Vèn dù ®Şnh mÊy h«m nay sÏ xuèng nói t×m, kÕt qu¶ lµ T« S­ huynh nghe nãi ë l©n cËn BiÖn Kinh cã vô c­íp tiªu liªn quan ®Õn Thiªn NhÉn Gi¸o, bÌn ®İch th©n xuèng nói, c­ìi ngùa kh«ng ngõng nghØ ®Ó ®Õn BiÖn Kinh, lÇn nµy e r»ng khã mµ quay vÒ, chØ cã m×nh ta, xuèng nói mét m×nh cã nhiÒu bÊt tiÖn, ng­¬i cã thÓ ®i víi ta kh«ng.",2,"Ta sÏ gióp ng­¬i./L40_get_yes","Ng­¬i t×m ng­êi kh¸c ®i./L40_get_no") 
end; 


function L40_get_yes()  
	SetTask(169,41)
	Talk(1,"","ThÈm MÆc: Ng­¬i cã thÓ ®Õn Ph­îng T­êng Phñ t×m thö.")	
AddNote("GÆp ThÈm MÆc, tiÕp nhËn nhiÖm vô V©n Tö Tr¾c Thu B×nh, ®Õn tiÖm t¹p hãa Ph­îng T­êng hái th¨m.") 
Msg2Player("GÆp ThÈm MÆc, tiÕp nhËn nhiÖm vô V©n Tö Tr¾c Thu B×nh, ®Õn tiÖm t¹p hãa Ph­îng T­êng hái th¨m.") 
end; 

function L40_get_no() 
end; 



