-- Î÷±±±±Çø\À¥ÂØÅÉ\npc\Â·ÈË_ÇğÓ¢.lua
-- by xiaoyang (2004\4\20)
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(6) == 1 then
		allbrother_0801_FindNpcTaskDialog(6)
		return 0;
	end
Uworld121 = GetTask(121)
	if (Uworld121 == 40 ) and (HaveItem(376) == 1 ) then
		Talk(7,"Uworld121_qiuying","Xin hái cã ph¶i lµ Kh©u Anh?","Ai d¸m gäi th¼ng ®¹i danh cña l·o?","T¹i h¹ phông lÖnh cña Hµ c« n­¬ng ®Õn ®©y","Mé TuyÕt? Ng­êi b¹n kia qua ®©y ngåi, uèng İt trµ dïng İt ®iÓm t©m. ","Kh«ng cÇn ®©u! ë ®©y cã 1 vËt giao cho ng­¬i","§©y chİnh lµ kh¨n lôa Mé TuyÕt lu«n mang bªn m×nh! Ng­êi b¹n bÌ,®a t¹!","Hµ c« n­¬ng nãi r»ng ng­¬i nh×n thÊy kh¨n lôa nµy tù nhiªn sÏ hiÓu râ!")
	elseif (Uworld121 == 40 ) and (HaveItem(376) == 0 ) then
		Talk(1,"","Ng­¬i kh«ng ®ang ®ïa víi ta chø? VËt g×®©u?")
	elseif (Uworld121 >= 50) then
		Talk(1,"","Mé TuyÕt cã nãi qua víi ng­¬i nh÷ng g× kh«ng? §¹i lo¹i nh­ bao giê th× ta cã thÓ gÆp nµng… ")
	else
		Talk(1,"","Kh«ng cã viÖc g× th× ®øng cã ®Õn quÊy rÇy ta!")
	end
end

function Uworld121_qiuying()
	Talk(3,"","Hmm...! C¸i l·o giµ D­¬ng Hå mµ xøng ®¸ng ®­îc Mé TuyÕt gióp ®ì nh­ thÕ sao. Nh­ng mµ Mé TuyÕt còng ®· ®­a kh¨n lôa cho ta, l¹i nhê ta gióp h¾n, tÊt nhiªn sÏ ph¶i cã nguyªn nh©n!","Th«i ®­îc ng­êi b¹n bÌ h·y nghe ®©y, ta sÏ nãi cho ng­¬i nghe kÕ ho¹ch lÇn nµy cña C«n L«n","Ta ®· hiÓu! C¸o tõ ")
	DelItem(376)
	Msg2Player("BiÕt ®­îc kÕ ho¹ch cña C«n L«n, quay vÒ b¸o c¸o D­¬ng Hå ")
	AddNote("BiÕt ®­îc kÕ ho¹ch cña C«n L«n, quay vÒ b¸o c¸o D­¬ng Hå ")
	SetTask(121,50) --ÉèÖÃÈÎÎñ±äÁ¿Îª50
end
