--Edit by Youtube PGaming  --
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\awardtemplet.lua")

function main()
if (GetTask(169) == 42)  then
Talk(5,"L40_question_1","L­u Viªn Ngo¹i: Tù Cæ T­íng Qu©n ChiÕn Th­¬ng Tr­êng, dÞch gi¶ ®Êu trÝ thu b×nh gi¸n. S¸t ph¹t quyÕt ®o¹n tïy t©m ý, ng· tù s¬ cuång bÊt dÞ tiªn. ha ha!","Ng­êi ch¬i: §· nghe kú nghÖ cña v­¬ng ngo¹i tõ l©u, kh«ng biÕt t¹i h¹ cã thÓ thØnh gi¸o 1 v¸n kh«ng?","L­u Viªn Ngo¹i: Ha ha, trong ®êi ta thÝch nhÊt lµ ch¬i cê, chØ tiÕc lµ ng­êi ch¬i cê hay th× nhiÒu, nh­ng ng­êi hiÓu lý luËn vÒ cê rÊt Ýt, h«m nay ®­îc bµn luËn cïng c¸c h¹ thËt lµ tèt qu¸!","Ng­êi ch¬i: §­¬ng nhiªn lµ ®­îc.")
elseif (GetTask(169) == 43)then
Say("Tù cã Trung vµ HÒ, h·y nãi víi ®èi thñ, tiªn c­_____hÒ,_____Y Bµng.",3,"Thiªn Nguyªn, B¶o Gi¸c./L40_wrong","Tø §¹o, B¶o Gi¸c./L40_question_3","Tø Gi¸c, B¶o biªn./L40_wrong")
elseif (GetTask(169) == 44)then
Say("Phï K×_____, _____, ­íc khinh vu n¹i, n¹i khinh vu t?, gi¸p h÷u h­ thùc, ®¸ h÷u t×nh ngôy.",3,"Gi¸c bÊt nh­ biªn, biªn bÊt nh­ phóc./L40_wrong","Phóc bÊt nh­ biªn, biªn bÊt nh­ gi¸c./L40_wrong","Biªn bÊt nh­ gi¸c, gi¸c bÊt nh­ phóc./L40_correct")
else
Talk(1,"","L­u Viªn Ngo¹i: Ta thÝch nhÊt lµ cïng ng­êi kh¸c uèng r­îu ®èi Èm vµ ®¸nh cê.")
end
end;

function L40_question_1()
	Say("Ng­êi miÒn B¾c còng rÊt thÝch ®¸nh cê v©y. Côc TÊt Ph­¬ng ChÝnh, _____;_____, ThÇn Minh §øc D·; cê cã ph©n biÖt tr¾ng ®en, ©m d­¬ng, BiÒn la liÖt bè,_____.",3,"T­îng thiªn t¾c d·, ®¹o tÊt khóc chiÕt, hiÖu tinh h¸n d·./L40_wrong","T­îng ®Þa t¾c d·, ®¹o tÊt khóc chiÕt, hiÖu tinh h¸n d·./L40_wrong","T­îng ®Þa t¾c d·, ®¹o tÊt chÝnh trùc, hiÖu tinh v¨n d·./L40_question_2")
end;

function L40_question_2()
	SetTask(169,43)
	Say("Tù cã Trung vµ HÒ, h·y nãi víi ®èi thñ, tiªn c­_____hÒ,_____Y Bµng.",3,"Thiªn Nguyªn, B¶o Gi¸c./L40_wrong","Tø §¹o, B¶o Gi¸c./L40_question_3","Tø Gi¸c, B¶o biªn./L40_wrong")
end;

function L40_question_3()
SetTask(169,44)
	Say("Phï K×_____, _____, ­íc khinh vu n¹i, n¹i khinh vu tÞ, gi¸p h÷u h­ thùc, ®¸ h÷u t×nh ngôy.",3,"Gi¸c bÊt nh­ biªn, biªn bÊt nh­ phóc./L40_wrong","Phóc bÊt nh­ biªn, biªn bÊt nh­ gi¸c./L40_wrong","Biªn bÊt nh­ gi¸c, gi¸c bÊt nh­ phóc./L40_correct")
end;

function L40_wrong()
	Talk(1,"","L­u Viªn Ngo¹i: Kh«ng ®óng, c¸c h¹ h·y suy nghÜ l¹i.")
end;

function L40_correct()
SetTask(169,45)
tbAwardTemplet:GiveAwardByList({tbProp = {6,1,3950,0,0,0}, nBindState=-2}, "test", 1);
Talk(1,"","L­u Viªn Ngo¹i: Kh«ng sai, xem ra c¸c h¹ còng cã tµi n¨ng vµ phong th¸i, bé V©n Tö Tr¾c Thu B×nh nµy ta tÆng l¹i cho c¸c h¹ lµm quµ.")
AddNote("ChÝnh thøc tr¶ lêi 3 c©u hái cña L­u Viªn Ngo¹i nhËn ®­îc V©n Tö Tr¾c Thu B×nh.")
Msg2Player("ChÝnh thøc tr¶ lêi 3 c©u hái cña L­u Viªn Ngo¹i nhËn ®­îc V©n Tö Tr¾c Thu B×nh.")
end;
