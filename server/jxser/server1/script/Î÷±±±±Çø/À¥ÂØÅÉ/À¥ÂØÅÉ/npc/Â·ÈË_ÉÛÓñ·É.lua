function main()
Uworld130 = GetTask(130)
	if (Uworld130 == 10)then
		Talk(14,"Uworld130_find","Phi ca! mçi lÇn xuèng nói lµ phong th¸i l¹i ®Ünh ®¹c h¬n tr­íc. Kh«ng biÕt ®· khiÕn bao c« g¸i xiªu hån göi méng.  ","TiÓu Ch©n, muéi l¹i cè lµm ta vui, vâ c«ng cña bän hä lµm g× mµ giái nh­ muéi!","Ha! Ha! Phi ca l¹i nãi ch¬i víi muéi råi, vâ c«ng cña muéi cã g× mµ giái.","Hi! Hi! NÕu kh«ng v× sù quyÕn rò nhÑ nhµng cña nµng, ca ca ®· kh«ng ngoan ngo·n vÒ nói sím nh­ vËy","Phi Ca nhí kh«ng ph¶i lµ tiÓu Ch©n, mµ lµ Cuång Phong SËu §iÖn ®ang n»m trong tay cña TiÓu Ch©n nµy!","Uhmm! Th«i kh«ng ®ïa n÷a! H·y ®­a nã cho ta. ","Ca h·y ®­a Ngò L«i ChÝnh Ph¸p cho TiÓu Ch©n ®äc tr­íc ®i!","He he! Ca…..Cã ng­êi ë gÇn ®©y. ","Lµ ai? Ra mau!","T¹i h¹ võa lóc ®i qua ®©y, nghe ®­îc 2 vÞ ®ang th¶o luËn nµo lµ L«i, nµo lµ ®iÖn, vËy ®ã thËt ra lµ g× vËy?","Ng­¬i nghe ®­îc l«i, ®iÖn g×?"," (NÕu bän hä biÕt ®­îc ta ®· nghe ®­îc toµn bé nh÷ng g× hä nãi, sî sÏ giÕt ng­êi bÞt miÖng) T¹i h¹ ch­a nghe râ, nªn rÊt hy väng c¸c h¹ cho biÕt râ!","µ! Chóng ta chØ ®ang th¶o luËn chuyÖn m­a giã mÊy h«m nay t¹i C«n L«n. ","Ng­¬i ®óng lµ ng­êi kh«ng biÕt tÕ nhÞ, mau mau tr¸ch khái ®©y!")
	elseif (Uworld130 == 30)then
		Talk(5,"Uworld130_jump","Sao l¹i lµ ng­¬i n÷a?","Nãi thËt nhÐ! ChuyÖn c¸c ng­¬i nãi lóc n·y ta ®Òu ®· nghe!","Hõm! C« n­¬ng ®©y còng ®· ®o¸n nh­ thÕ. H«m nay ng­¬i ®· quay l¹i ®©y, vËy th× ®õng hßng ®i ®©u n÷a!","TËp luyÖn vâ nghÖ quan träng tuÇn tù th¨ng tiÕn, vâ c«ng c¸c ng­êi luyÖn ®Òu kh¸c nhau, nÕu nãng lßng luyÖn cao lªn sÏ dÔ tÈu háa nhËp ma, lµm nh­ vËy cã Ých g× ®©u!","Nh¶m nhÝ! L·o tö ta kh«ng luyÖn, kh«ng lÏ ta chê ng­êi kh¸c luyÖn xong ®Õn giÕt ta sao? TiÓu tö! TiÕp chiªu ®i!")
	elseif (Uworld130 >= 30) and (Uworld130 <40) then
		Talk(1,"Uworld130_jump","H¶o tiÓu tö! Lóc n·y l·o gia ®· n­¬ng tay tha m¹ng, ng­¬ic ßn ch­a biÕt chÕt sèng lµ g× µ?")
	elseif (Uworld130 >10) and (Uworld130 < 40)then
		Talk(1,"","Con ng­êi cña ng­¬i sao kh«ng tÕ nhÞ nh­ thÕ? Tr¸nh ra tr¸nh ra!")
	else 
	   Talk(1,"","Hai ng­êi ®ang nãi chuyÖn g× bÝ mËt, th¸i ®é kh¸c th­êng!")
	end
end

function Uworld130_find()
	SetTask(130,20)
	Msg2Player("B¹n ph¸t hiÖn 2 tªn Ng­ ThiÖu to nhá bµn tÝnh, h×nh nh­ muèn trao ®æi bÝ kÝp g× ®ã ")
	AddNote("B¹n ph¸t hiÖn 2 tªn Ng­ ThiÖu to nhá bµn tÝnh, h×nh nh­ muèn trao ®æi bÝ kÝp g× ®ã ")
end

function Uworld130_jump()
	NewWorld(228,1600,3224)
end
