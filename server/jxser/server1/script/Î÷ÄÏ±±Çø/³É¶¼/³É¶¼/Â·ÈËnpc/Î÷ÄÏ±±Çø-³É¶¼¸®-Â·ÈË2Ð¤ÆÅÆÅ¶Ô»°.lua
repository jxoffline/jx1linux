--Î÷ÄÏ±±Çø ³É¶¼¸® Â·ÈË2Ğ¤ÆÅÆÅ¶Ô»°
-- update by xiaoyang(2004\4\16) ¶ğÃ¼90¼¶ÈÎÎñ

Include("\\script\\global\\repute_head.lua")

function main(sel)
	Uworld125 = GetTask(125)
	Uworld36 = GetByte(GetTask(36),1)
	if (Uworld125 < 10) and (Uworld36 == 127) and (GetReputeLevel(GetRepute()) >= 5) and (GetLevel() >= 90) and (GetFaction() ~= "emei") then
		Talk(8,"Uworld125_task","§µo lı xu©n phong nhÊt b«i töu, giang hå d¹ vò thËp niªn ®¨ng. C¸c h¹ l­u l¹c trong giang hå kh«ng thÊy mÖt sao?","ThÕ gian vÉn cßn nhiÒu khæ ¶i, dï cã mÖt mái còng ph¶i kiªn tr×. Ch¼ng lÏ ®øng nh×n xem thÕ ®¹o lu©n håi, cam t©m n­íc ch¶y bÌo tr«i, th©n nµy vâ c«ng kh«ng cßn ı nghÜa g× n÷a!","Tèt! Tuæi trÎ nh­ng cã chİ khİ! Ta cã mét nhiÖm vô nµy, ng­¬icã d¸m lµm kh«ng?","Lµ nhiÖm vô g×?","Nga Mi ph¸i s¸ng chÕ ra mét bé V« Tù Thiªn Th­ cã tuyÖt thÕ vâ c«ng ®· tõng ®­îc l­u truyÒn. Tr­íc ®©y kh«ng l©u ta nhËn ®­îc tin bé Thiªn Th­ nµy ®· xuÊt hiÖn ë gÇn khu vùc nói Thanh Thµnh, nh­ng ch­a cã ai t×m ®­îc. Ng­¬i cã thÓ ®i mét chuyÕn ®­îc kh«ng?","Bµ kh«ng sî sau khi lÊy ®­îc bİ kiÕp ta sÏ chiÕm lµm cña riªng sao?","Ha! Ha! Ha!...V« Tù Thiªn Th­ chØ ai cã duyªn míi ®äc ®­îc. Cho dï t×m ®­îc råi, kh«ng cã c¸ch ®Ó më ra còng chØ lµ uæng c«ng. C¶ thiªn h¹ nµy, e r»ng chØ cã bµ bµ ta míi ®äc ®­îc!","Hãa ra nh­ thÕ.")
   elseif (Uworld125 == 15) and (HaveItem(388) == 1) then
   	Talk(10,"Uworld125_fire","ThÕ nµo? Kh«ng uæng phİ c«ng søc chø?","§Ö tö ®· lÊy ®­îc råi.","§­a ta xem...Qu¶ lµ V« Tù Thiªn Th­ råi.","Xem ra t¹i h¹ lµ ng­êi thËt cã duyªn.","MËt tŞch mµ ng­¬i ®ang gi÷, giang hå kh«ng biÕt bao nhiªu ng­êi thÌm muèn!","Cuèi cïng còng ®­a vÒ an toµn.","VÉn ch­a xong! Ta nãi cho ng­¬i biÕt, ta chİnh lµ ®Ö tö cña Nga Mi ph¸i Èn n¸u t¹i Thµnh §« nµy. Ch­ëng m«n Thanh HiÓu S­ Th¸i võa cã mËt lÖnh giao nhiÖm vô míi cho ng­¬i! H·y mau thi hµnh!","Tßn bµ bµ th× sao?","Ta sÏ gióp ng­¬i ng¨n c¶n nh÷ng tªn ®¹o tÆc muèn c­íp mËt tŞch!","Tu©n lÖnh!")
   elseif (Uworld125 == 30) and (HaveItem(389) == 1) then
   	Talk(6,"Uworld125_change","Rèt cuéc ng­¬i còng ®· ®Õn?","Sao?","Võa nhËn ®­îc bå c©u ®­a th­ cña ch­ëng m«n, gäi ng­¬i lËp tøc quay vÒ Nga Mi","L¹i cã viÖc g× ­?","Trong th­ kh«ng nãi râ, nh­ng theo lëi cña Ch­ëng m«n, th× viÖc nµy rÊt cÇn kİp!","Ta lËp tøc ®i ngay!")
   elseif (Uworld125 == 10) then
   	Talk(2,"","ThÕ nµo? Kh«ng t×m ®­îc Thiªn Th­ h¶?","Xin ®õng tøc giËn! §Ö tö nhÊt ®Şnh sÏ t×m ®­îc!")
   elseif (Uworld125 == 20) and (HaveItem(388) == 0) then
   	Talk(1,"","Thiªn Th­ ph¶i giao vÒ cho ch­ëng m«n Thanh HiÓu s­ th¸i Nga Mi, kh«ng ph¶i giao cho l·o lµ xong viÖc")
		AddEventItem(388)
		Msg2Player("§o¹t ®­îc V« Tù Thiªn Th­ cña Nga Mi ")
   elseif (Uworld125 == 30) then
   	Talk(1,"","Ng­¬i kh«ng cã Nga mi lÖnh tiÔn,lµm sao chøng minh ng­¬i ®· giao cho ch­ëng m«n?")
   elseif (Uworld125 >= 50) then
   	Talk (1,"","TiÓu tö, giang hå hiÓm ¸c, cÇn ph¶i b¶o träng th©n m×nh. ")
   else
		Talk(1,"","TiÓu Hçn Hçn ®ã thËt lµ mét con ngùa lµm h¹i c¶ ®µn, kh«ng trém gµ b¾t chã, th× øc hiÕp n÷ nhi, g©y phiÒn phøc cho mäi ng­êi, gµ chã g×còng kh«ng yªn, còng kh«ng cã ng­êi qu¶n.")
	end
end

function Uworld125_task()
	if (GetCamp() == 0) and (GetTask(75) < 255) then		-- °×ÃûÎ´Ñ§Ò°ÇòÈ­µÄ£¬²»ÔÊĞí½ÓÈÎÎñ
		Talk(1,"","Xem d¸ng ng­¬i nhu nh­îc yÕu ®uèi, kh«ng chŞu næi giã s­¬ng! Ta chØ nãi ®ïa th«i, ng­êi nªn luyÖn vâ c«ng, sau ®ã råi h·y nãi. ")
	else
		Say("Sau khi xong viÖc, ta sÏ hËu t¹! Ra giang hå cÇn ph¶i cã lé phİ.",2,"§­îc, ®Ö tö sÏ ®i mét chuyÕn ®Õn Thanh Thµnh. /Uworld125_yes","KÎ hÌn nµy cßn cã viÖc, e r»ng khã mµ tu©n mÖnh ®­îc. /Uworld125_no")
	end
end

function Uworld125_yes()
	SetTask(125,10)
	Msg2Player("Tu©n lÖnh Tiªu bµ bµ ®i thanh Thµnh t×m bİ kiÕp ")
	AddNote("Tu©n lÖnh Tiªu bµ bµ ®i thanh Thµnh t×m bİ kiÕp ")
end

function Uworld125_no()
end

function Uworld125_fire()
	SetTask(125,20)
	Earn(10000)
	Msg2Player("Tiªu bµ bµ ®¸p t¹ b¹n 10000 l­îng b¹c, ®ång thêi nhê b¹n h·y ®em Thiªn Th­ ®Õn tÆng cho Nga Mi. ")
	AddNote("Thay Tiªu bµ bµ tÆng Thiªn Th­ cho Nga Mi ")
end

function Uworld125_change()
	SetTask(125,40)
	DelItem(389)
	Msg2Player("NhËn ®­îc chim bå c©u ®­a th­ cña Thanh HiÕu s­ th¸i, trë lªn Nga Mi ")
	AddNote("NhËn ®­îc chim bå c©u ®­a th­ cña Thanh HiÕu s­ th¸i, trë lªn Nga Mi ")
end
