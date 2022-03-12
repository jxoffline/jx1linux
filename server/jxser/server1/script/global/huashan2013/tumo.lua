--  Edit by Youtube PGaming--
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
function main() 
if (GetLevel() >=20) and (GetTask(169) == 20) then
Talk(3,"L20_hs","Tõ Mé: Ng­¬i gia nhËp ph¸i Hoa S¬n còng ®­îc mét thêi gian råi, ta thÊy ng­êi ngµy ®ªm khæ luyÖn dông c«ng, hiÖn giê ng­¬i cã g× ch­a hiÓu kh«ng?","Ng­êi ch¬i: §Ö tö gÇn ®©y cã tû thİ víi c¸c vŞ S­ huynh, th¾ng İt thua nhiÒu, §Ö tö thÊy ®éng t¸c xuÊt chiªu cña S­ huynh thËt kh«ng gièng víi ®Ö tö, t¹i sao uy lùc chiªu thøc l¹i kh¸c nhau nhiÒu nh­ vËy?")
elseif (GetTask(169) > 20) and (GetTask(169) <= 25)then
Talk(1,"","Tõ Mé: Cßn kh«ng mau ®i?")
elseif (GetTask(169) == 26) and (HaveCommonItem(6,1,3945)>0) and (HaveCommonItem(6,1,3946)>0) and (HaveCommonItem(6,1,3947)>0) then
Talk(4,"L20_hs2","Tõ Mé: B©y giê ng­¬i suy nghÜ nh­ thÕ nµo?","Ng­êi ch¬i: v©ng, ®Ö tö chiªu thøc ®Ö tö ®¸nh ra Kh«ng h÷u h×nh nh­ng v« thÇn","Ng­êi ch¬i: ta thÊy nói Hoa S¬n khİ thÕ hïng vÜ, c¶m thô sù uy dòng cña thÕ vâ, nÕu nh­ cã thÓ bÊt ®éng nh­ s¬n, kiªn cè nh­ th¹ch, cang khinh nh­ tïng, nhu nhuyÔn nh­ thñy nhÊt ®Şnh sÏ ®¹t ®­îc ®Ønh cao cña kiÕm chiªu, hiÖu qu¶ gÊp béi.","Tõ Mé: rÊt tèt, nÕu nh­ ng­¬i cã c¶m thô nh­ thÕ, sau nµy nhÊt ®Şnh sÏ tiÕn bé v­ît bËc, ta sÏ t¨ng cÊp cho ng­¬i lµ T­ M¹c ®Ö tö")
elseif (HaveMagic(1375) < 0) and (HaveMagic(1347) >= 0) then
Talk(1,"","Tõ Mé: T×nh tr¹ng cña Phãng Nhi gÇn ®©y, lµm ta v« cïng lo l¾ng...")
elseif (HaveMagic(1375) >= 0)  then
Talk(1,"","Tõ Mé: H·y nhí lÊy c¶m nhËn cña ng­¬i, sÏ häc ®­îc cµng nhiÒu thø")
else
Talk(1,"","Tõ Mé: GÇn ®©y mét sè ®Ö tö trong ph¸i s«i sôc muèn b¸o thï, viÖc nµy kh«ng thßa ®¸ng...")
end
end; 

function L20_hs() 
Say("Tõ Mé: Nh­ vËy, ng­¬i h·y ®i mét chuyÕn ®Õn sau nói, lÊy Nhai Bİch Chi Th¹ch, Dung TuyÕt Chi Thñy vµ Th­¬ng Tïng Ch©m DiÖp, ®em ®Õn chç s­ huynh ®ång m«n cña ng­¬i nhê chØ gi¸o ®i.",2,"§Ö tö ®i ngay./L20_get_yes","§Ö tö sÏ ®i sau./L20_get_no") 
end 


function L20_get_yes()  
tbAwardTemplet:GiveAwardByList({tbProp = {6,1,3944,0,0,0}, nBindState=-2}, "test", 1);
	SetTask(169,21)
AddNote("GÆp Tõ Mé, nhËn nhiÖm vô Ng« KiÕm, ®Õn ph¸i Hoa S¬n hËu s¬n ®¹ot lÊy Nhai Bİch Th¹ch, Thôc TuyÕt Chi Thñy, Th­¬ng Tïng Ch©m DiÖp.") 
Msg2Player("GÆp Tõ Mé, nhËn nhiÖm vô Ng« KiÕm, ®Õn ph¸i Hoa S¬n hËu s¬n ®¹ot lÊy Nhai Bİch Th¹ch, Thôc TuyÕt Chi Thñy, Th­¬ng Tïng Ch©m DiÖp.") 
end; 

function L20_get_no() 
end;

function L20_hs2() 
DelCommonItem(6,1,3945)
DelCommonItem(6,1,3946)
DelCommonItem(6,1,3947)
SetRank(84)
SetTask(169,30)
AddNote("Håi ®¸p Tõ Mé, hoµn thµnh nhiÖm vô Ngé KiÕm, §¹i hiÖp t¨ng cÊp thµnh T­ M¹c ®Ö tö, häc ®­îc vâ c«ng D­ìng Ng« KiÕm Ph¸i, H¶i N¹i B¸ch Xuyªn.") 
Msg2Player("Håi ®¸p Tõ Mé, hoµn thµnh nhiÖm vô Ngé KiÕm, §¹i hiÖp t¨ng cÊp thµnh T­ M¹c ®Ö tö, häc ®­îc vâ c«ng D­ìng Ng« KiÕm Ph¸i, H¶i N¹i B¸ch Xuyªn.") 
AddMagic(1350)
AddMagic(1375)
AddGoldItem(0, 4634)
AddGoldItem(0, 4644)
Msg2Player("NhËn ®­îc <color=yellow>trang bŞ hoµng kim cÊp Thanh C©u.")
end; 
