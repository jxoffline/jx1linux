-- ³¤½­Ô´Í· Â·ÈË_½çÎŞĞ°.lua¡¡Ø¤°ï90¼¶¼¼ÄÜÈÎÎñ
-- By£ºXiaoYang(2004-04-29)
-- Update£ºdan_deng(2004-05-20)

Include("\\script\\global\\repute_head.lua")
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(2) == 1 then
		allbrother_0801_FindNpcTaskDialog(2)
		return 0;
	end
	
	Uworld128 = GetTask(128)
	Uworld30 = GetByte(GetTask(30),2)
	if (Uworld128 < 10) and (GetReputeLevel(GetRepute()) >= 5) and (GetLevel() >= 90) and (GetFaction() ~="gaibang") and (Uworld30 ==127) then
		Talk(8,"Uworld128_get","Tr­êng Giang nguyªn ®Çu. B¹n nh×n thÊy mét thanh niªn tuÊn tó, ®ang thæi s¸o. TiÕng s¸o rÊt n·o nuét","TiÕng s¸o cña c¸c h¹ sao nghe thª l­¬ng,d­êng nh­ ®ang cã t©m sù?","Quèc gia chi n¹n, thÊt phu h÷u tr¸ch. Huynh ®Ö gia viªn ®ang bŞ qu©n kim chµ ®¹p tµn s¸t, t¹i h¹ lµm sao cã thÓ vui ®­îc?","Quan s¬n v¹n lı, kh«ng biÕt bao nhiªu hËn thï. ChØ tiÕc thÕ nh©n ngu muéi sai lÇm lÊy khãi hoa ®Ó ®æi lÊy sù phån vinh","T¹i h¹ lµ Giíi V« Tµ ë C¸i Bang, h«m nay gÆp ®­îc anh hïng, mang r­îu ra uèng mõng!","Trong thiªn h¹ anh hïng cã mÊy ng­êi… ","C¹n ly ","C¹n ly ")
   elseif (Uworld128 == 10) and (HaveItem(76) == 1) then
   	Talk(11,"Uworld128_envelop","Huynh ®µi qu¶ lµ ng­êi cã ch÷ tİn","Tri kû t­¬ng phïng thiªn b«i thiÓu. H«m nay nhÊt ®Şnh ph¶i uèng cho say… ","Trong thiªn h¹ anh hïng cã mÊy ng­êi… ","C¸c h¹ kh«ng biÕt ®ã th«i, nhiÒu khi chİnh thêi thÕ t¹o anh hïng!","T¹i sao nãi vËy?","T¹i h¹ tuy nhËp m«n kh«ng l©u nh­ng ®· tr¶i qua kh«ng İt trËn quyÕt chiÕn, nhiÒu ng­êi kh«ng nªn chÕt còng ®· chÕt råi, t¹i h¹ vÉn cßn sèng ®©y, bän hä ai còng cã cha mÑ, vî vµ con th¬ kh«ng lÏ nµo l¹i muèn chÕt,? ChØ t¹i thêi thÕ dån vµo ®­êng cïng kh«ng thÓ kh«ng lµm vËy","§¸ng tiÕc, nh÷ng ng­êi nh­ thÕ rÊt hiÕm!","Cã lÏ vËy! §Õn l­ît ta råi! Kh«ng nãi nh÷ng chuyÖn kh«ng vui n÷a! Nµo uèng r­îu ®i!","Giíi ®¹i ca h×nh nh­ cã chuyÖn g× khã nãi? NÕu ®¹i ca cã g× cÇn dÆn dß cø nãi víi ®Ö!","Ta vµ ng­¬i bÌo n­íc gÆp nhau nh­ng võa gÆp nh­ ®· quen tõ l©u! §­îc! Giíi mç ë ®©y cã mét bøc th­ nhê ng­¬i mang gióp bøc th­ nµy ®Õn C¸i bang giao cho tr­ëng l·o La Khu«ng Sinh!","§­îc!")
   elseif (Uworld128 == 40) then
   	Talk(7,"Uworld128_kill","G iíi ®¹i ca! Huynh kh«ng cã viÖc g× chø!","Yªn t©m! Ta kkh«ng sao!","Huynh lµm sao biÕt cã ng­êi s¾p giÕt h¹i huynh!","ChuyÖn nµy liªn quan ®Õn néi bé C¸i bang, nÕu ta kh«ng cã tin t×nh b¸o chİnh x¸c th× còng kh«ng d¸m bŞa ®Æt ra ®©u","VËy huynh ph¶i nªn cÈn thËn, ®Ö ph¶i ®i b¸o víi La tr­ëng l·o!","B»ng h÷u! Giíi mç kh«ng cã g× b¸o ®¸p! Sau nµy nÕu cã cÇn viÖc g× th× Giíi mç dï lµm tr©u ngùa còng quyÕt lµm!","§¹i ca kh«ng nªn nãi nh­ vËy, nÕu kh«ng t¹i h¹ thÊy rÊt Êy n¸y")
   elseif (Uworld128 == 10) then
   	Talk(1,"","§­êng tõ ®©y tíi D­¬ng Ch©u rÊt nguy hiÓm, trªn ®­êng ®i nhí cÈn thËn!")
   elseif (Uworld128 == 30) then
   	Talk(2,"","Giíi ®¹i ca còng cÈn thËn kÎo bŞ ¸m h¹i","§Õn thËt ®óng lóc! H·y cïng nhau giÕt s¹ch lò giÆc nµy!")
   elseif (Uworld128 == 20) and (HaveItem(390) == 0) then
   	AddEventItem(390)
   	Msg2Player("L¹i nhËn ®­îc bøc th­ cña Giíi V« Tµ ")
   	Talk(1,"","Sù viÖc rÊt träng ®¹i, nhê ng­¬i cÊp tèc mang bøc th­ nµy ®Õn bæn bang giao cho La tr­ëng l·o")
   else
   	Talk(1,"","Uèng r­îu ca h¸t!Nh©n sinh tri kû h÷u kû nh©n?")
   end
end

function Uworld128_get()
	if (GetCamp() == 0) and (GetTask(75) < 255) then		-- °×ÃûÎ´Ñ§Ò°ÇòÈ­µÄ£¬²»ÔÊĞí½ÓÈÎÎñ
		Talk(1,"","H«m nay ta vµ c¸c h¹ ph¶i uèng r­îu ®µm ®¹o tíi tèi! S¸ng mai xin kİp lªn ®­êng!")
	else
		Say("§¸ng tiÕc lµ h«m nay t¹i h¹ kh«ng biÕt sÏ gÆp ®­îc tri ©m nªn ch­a kŞp chuÈn bŞ r­îu ngon",2,"T¹i h¹ biÕt ë D­¬ng Ch©u cã mét töu lÇu b¸n r­îu TuÖ TuyÒn rÊt ngon, ®Ó t¹i h¹ lËp tøc ®i mua. /Uworld128_wait","Huynh ®Ö ta bÌo n­íc gÆp nhau, t¹i h¹ kh«ng biÕt con ®­êng phİa tr­íc råi sÏ vÒ ®©u /Uworld128_no")
	end
end

function Uworld128_wait()
	SetTask(128,10)
--	Uworld135 = GetGameTime()
   Msg2Player("B¹n vµ Giíi V« Tµ cã giao ­íc ®Õn D­¬ng Ch©u th­ëng thøc r­îu ngon ")
   AddNote("B¹n vµ Giíi V« Tµ cã giao ­íc ®Õn D­¬ng Ch©u th­ëng thøc r­îu ngon ")
end

function Uworld128_no()
end

function Uworld128_envelop()
	DelItem(76)
	AddEventItem(390)
	Msg2Player("NhËn ®­îc bøc th­ cña Giíi V« Tµ ®Õn C¸i bang t×m La tr­ëng l·o ")
	AddNote("NhËn ®­îc bøc th­ cña Giíi V« Tµ ®Õn C¸i bang t×m La tr­ëng l·o ")
	SetTask(128,20)
end

function Uworld128_kill()
	SetTask(128,50)
	Msg2Player("Cøu tho¸t Giíi V« Tµ, trë vÒ håi b¸o La tr­ëng l·o ")
	AddNote("Cøu tho¸t Giíi V« Tµ, trë vÒ håi b¸o La tr­ëng l·o ")
end
