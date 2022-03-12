--Edit    by Youtube PGaming--
Include("\\script\\dailogsys\\dailogsay.lua")
function main() 
if (GetTask(169) == 30) and (GetLevel() >=30) then
Say("LËn V©n Mi: C¸ch ®©y vµi ngµy cã ng­êi cña Thiªn NhÉn Gi¸o xuÊt hiÖn t¹i VÜnh L¹c TrÊn, d­êng nh­ lµ cã ©m m­u g× ®ã, cha thÊy thÕ liÒn mang theo mét sè s­ huynh ®Ö ®Õn ng¨n c¶n, mÆc dï ®· ®¸nh lïi Thiªn NhÉn Gi¸o, nh­ng còng cã nhiÒu s­ huynh ®Ö bŞ th­¬ng, ta cã tr¸ch nhiÖm ch¨m sãc hä. Nh­ng mÊy h«m nay thuèc trŞ th­¬ng s¾p dïng hÕt råi.",2,"§i mua thuèc gióp./L30_get_yes","Ta cã viÖc kh¸c ph¶i lµm/L30_get_no")
elseif (GetTask(169) > 30) and (GetTask(169) < 34)then
Talk(1,"","LËn V©n Mi: C¸c s­ huynh ®Ö ®ang rÊt cÇn thuèc trŞ th­¬ng, ng­¬i mau ®i ®i.")
elseif (GetTask(169) == 35) and (HaveCommonItem(6,1,3949)>0) then
Talk(2,"nvL30","LËn V©n Mi: Tèt qu¸, sè thuèc nµy ®ñ dïng råi, c¶m ¬n ®¹i hiÖp.")
elseif (HaveMagic(1351) < 0) and (HaveMagic(1347) >= 0) then
Talk(1,"","LËn V©n Mi: ng­êi ta kh©m phôc nhÊt, chİnh lµ s­ huynh ®ã.")	
elseif (HaveMagic(1351) >= 0) then
Talk(1,"","LËn V©n Mi: ng­¬i ®· gióp ta mét viÖc lín, c¸c s­ huynh ®Ö bŞ th­¬ng ®Òu rÊt c¶m kİch.")	
else 
Talk(1,"","LËn V©n Mi: ®Ö tö Hoa S¬n ta häc vÒ nho thuËt, thi th­, tö häa, kú nghÖ ®Òu rÊt am hiÓu.")	
end
end

function nvL30()
SetRank(85)  
DelCommonItem(6,1,3949)
SetTask(169,40)
AddNote("Håi ®¸p LËn V©n Mi, hoµn thµnh nhiÖm vô B¨ng Tµm Ngäc Lé Cao §¹i hiÖp t¨ng cÊp thµnh ®Ö tö chÊp kiÕm, häc ®­îc vâ c«ng Kim Nh¹n Hoµnh Kh«ng, Long HuyÒn KiÕm Khİ.") 
Msg2Player("Håi ®¸p LËn V©n Mi, hoµn thµnh nhiÖm vô B¨ng Tµm Ngäc Lé Cao §¹i hiÖp t¨ng cÊp thµnh ®Ö tö chÊp kiÕm, häc ®­îc vâ c«ng Kim Nh¹n Hoµnh Kh«ng, Long HuyÒn KiÕm Khİ.") 
AddMagic(1351)
AddMagic(1376)
AddGoldItem(0, 4635)
AddGoldItem(0, 4636)
AddGoldItem(0, 4645)
AddGoldItem(0, 4646)
Msg2Player("NhËn ®­îc <color=yellow>trang bŞ hoµng kim cÊp Thanh C©u.")
end; 


function L30_get_yes()  
	SetTask(169,31)
AddNote("GÆp LËn V©n Mi, nhËn nhiÖm vô B¨ng Tµm Ngäc Lé Cao, ®Õn tiÖm thuèc Ph­îng T­êng mua B¨ng Tµm Ngäc Lé Cao.") 
Msg2Player("GÆp LËn V©n Mi, nhËn nhiÖm vô B¨ng Tµm Ngäc Lé Cao, ®Õn tiÖm thuèc Ph­îng T­êng mua B¨ng Tµm Ngäc Lé Cao.") 
end; 

function L30_get_no() 
end; 



