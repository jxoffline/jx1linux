--description: ÌìÈÌ½ÌÈÕÔÂÌ³Ö÷
--author: yuanlan	
--date: 2003/5/18
--Dan_Deng(2003-07-22), ¼ÓÈëÃÅÅÉÈÎÎñµÄµÈ¼¶ÒªÇó
-- Update: Dan_Deng(2003-08-14)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_tr = GetTask(4)
	Uworld51 = GetTask(51)
	if (Uworld51 == 50) then		-- Ï´ÇåÔ©ÇüÈÎÎñ½øĞĞÖĞ
		Talk(5,"Uworld51_55","Bän ph­¬ng Nam gian tr¸, lÇn nµy m­u kÕ ly gi¸n cña bän ta còng kh«ng kĞm. Ha ha, huynh ®Ö bän chóng t­¬ng tµn ®Ó lé tuyÖt häc cho chóng ta biÕt, Nam triÒu ®· hÕt nh©n tµi, cßn g× ®¸ng sî n÷a?","Nghe nãi lÇn tr­íc giÕt vµi tªn ThiÕu L©m lµm bän chóng vµ §­êng M«n l©m vµo khñng ho¶ng, lÇn nµy l¹i giÕt thªm.....õm, C¸i Bang tr­íc giê vÉn chèng ®èi bän ta, lÇn nµy sÏ xö ®Ö tö C¸i Bang. §óng råi, sÏ phôc kİch chóng ë TiÕn Cóc ®éng.","Ng­¬i lµ ai? §Õn ®©y lµm g×?","T¹i h¹ míi ®Õn, ®ét nhiªn gÆp ®­îc Thiªn h¹ ®Ö tø cao thñ oai phong lÉm liÖt NhËt NguyÖt §µn Chñ, nhÊt thêi kİch ®éng. L©u råi kh«ng gÆp §µn Chñ, ngµy cµng thÊy oai phong.","Ha ha, ha ha, ®­îc l¾m.")
	elseif (GetSeries() == 3) and (GetFaction() == "tianren") then
		if (UTask_tr == 20*256) and (GetLevel() >= 20) then
			AddNote("T¹i qu¶ng tr­êng Thiªn NhÉn gi¸o gÆp NhËt NguyÖt §µn chñ ¤ Hîp T¸t, tr¶ lêi c©u hái cña «ng ta. ")
			Msg2Player("T¹i qu¶ng tr­êng Thiªn NhÉn gi¸o gÆp NhËt NguyÖt §µn chñ ¤ Hîp T¸t, tr¶ lêi c©u hái cña «ng ta. ")
			Talk(8,"L20_get_test","Êy da…..MÊt hÕt råi! Kh«ng cßn mÆt mòi nµo n÷a.....","Cã chuyÖn g× vËy?","Ta, ta bŞ øc hiÕp råi!","¤ §µn Chñ vâ c«ng c¸i thÕ, ai d¸m øc hiÕp ngµi?","L¹i mét ®øa trÎ n÷a!","Mét ®øa trÎ?","Ta võa gÆp mét ®øa trÎ ë khu rõng phİa §«ng, tªn tiÓu quû ®ã hái ta mét c©u, nh­ng ta kh«ng c¸ch nµo tr¶ lêi ®­îc nªn ®· thua nã NhËt NguyÖt Song Lu©n! ChuyÖn nµy nÕu bŞ ®ån ra ngoµi ch¾c ch¾n sÏ bŞ ng­êi c­êi chª. Tuy ta vâ c«ng cao c­êng, nh­ng kh«ng thÓ lÊy l¹i ®­îc,lµm sao cßn cã thÓ nh×n mÆt ai trªn giang hå n÷a?","VÊn ®Ò lµ thÕ nµo?")
		elseif (UTask_tr == 20*256+10) then 
			L20_get_test()
		elseif (UTask_tr == 20*256+20) then 
			L20_get()
		elseif (UTask_tr == 20*256+80) and (HaveItem(58) == 1 ) then
			L20_prise()
		elseif (UTask_tr == 30*256+20) then	--½Óµ½30¼¶ÈÎÎñ£¬ÒªÖ±½ÓÇĞ»»µ½ÇØÊ¼»ÊÁê
			Say("Muèn ta ®­a ng­¬i ®Õn l¨ng TÇn Thñy Hoµng kh«ng? Kh«ng vÊn ®Ò g×, chØ cÇn 500 l­îng th«i!", 2, "Lµm phiÒn ®­a ta ®i /L30_deliver_yes", "Ta sÏ tù ®i! /L30_deliver_no")
		elseif (UTask_tr == 40*256+20) then	--½Óµ½40¼¶ÈÎÎñ£¬ÒªÖ±½ÓÇĞ»»µ½½£¸óÖĞÔ­
			Say("Muèn ta ®­a ng­¬i ®Õn l¨ng TÇn Thñy Hoµng kh«ng? Kh«ng vÊn ®Ò g×, chØ cÇn 700 l­îng th«i!", 2, "Lµm phiÒn ®­a ta ®i /L40_deliver_yes", "Ta sÏ tù ®i! /L40_deliver_no")
		elseif (UTask_tr >= 20*256+30) and (UTask_tr < 20*256+80) then					--ÒÑ¾­½Óµ½20¼¶ÈÎÎñ£¬ÉĞÎ´Íê³É
			Talk(1,"","Tªn tiÓu quû ®ã ë <color=Red>c¸nh rõng phİa §«ng<color>, phiÒn ng­¬i gi¸o huÊn nã!")
		elseif (UTask_tr >= 30*256) then					--ÒÑ¾­Íê³É20¼¶ÈÎÎñ£¬ÉĞÎ´³öÊ¦
			Talk(1,"","Tuy vâ c«ng ng­¬i kh«ng b»ng ta, nh­ng nÕu gióp ta lÊy l¹i ®­îc NhËt NguyÖt Song Lu©n, ta rÊt c¶m kİch!")
		else
			Talk(4, "", "BiÕt ta lµ ai kh«ng? Ta chİnh lµ Thiªn h¹ ®Ö tø cao thñ oai phong lÉm liÖt ¤ Hîp T¸t!", "Thiªn h¹ ®Ö tø th«i sao?", "§óng, ®Ö nhÊt chİnh lµ Gi¸o chñ, ngoµi Gi¸o chñ, Gia LuËt TŞ Ly vµ §oan Méc DuÖ ra, vâ c«ng cña ta lµ lîi h¹i nhÊt! ThÕ nµo? Ng­¬i cã phôc kh«ng? NÕu kh«ng phôc ta sÏ cho ng­¬i nÕm sù lîi h¹i cña NhËt NguyÖt Song Lu©n!", "§­îc råi! §­îc råi!")
		end
	elseif (GetTask(30) == 5) then		--½Óµ½ÓíÍõ½£ÈÎÎñ£¬ÒªÖ±½ÓÇĞ»»µ½»ªÉ½
		Say("Muèn ta ®­a ng­¬i ®Õn l¨ng TÇn Thñy Hoµng kh«ng? Kh«ng vÊn ®Ò g×, chØ cÇn 500 l­îng th«i!", 2, "Lµm phiÒn ®­a ta ®i /W30_deliver_yes", "Ta sÏ tù ®i! /W30_deliver_no")
	elseif (UTask_tr >= 70*256) then							--ÒÑ¾­³öÊ¦
		Talk(1,"","Ng­¬i muèn ®i µ? Ta sÏ nhí ng­¬i ®Êy, huhuhu….")
	else
		Talk(4, "", "BiÕt ta lµ ai kh«ng? Ta chİnh lµ Thiªn h¹ ®Ö tø cao thñ oai phong lÉm liÖt ¤ Hîp T¸t!", "Thiªn h¹ ®Ö tø th«i sao?", "§óng, ®Ö nhÊt chİnh lµ Gi¸o chñ, ngoµi Gi¸o chñ, Gia LuËt TŞ Ly vµ §oan Méc DuÖ ra, vâ c«ng cña ta lµ lîi h¹i nhÊt! ThÕ nµo? Ng­¬i cã phôc kh«ng? NÕu kh«ng phôc ta sÏ cho ng­¬i nÕm sù lîi h¹i cña NhËt NguyÖt Song Lu©n!", "§­îc råi! §­îc råi!")
	end
end;

function L20_get_test()
	Say("Cã mét con tr©u ë h­íng B¾c, tr­íc tiªn quay vÒ phİa ph¶i 3 vßng, råi quay ra phİa sau 3 vßng, sau ®ã l¹i quay vÒ phİa ph¶i, vËy lóc nµy ®u«i cña nã ë h­íng nµo?", 5, "H­íng ®«ng /L20_get_fail", "H­íng nam /L20_get_fail", "H­íng t©y /L20_get_fail", "H­íng B¾c /L20_get_fail", "H­íng xuèng ®Êt /L20_get_pre")
end;

function L20_get_fail()
	SetTask(4, 20*256+10)
	Talk(1,"","VËy lµ ng­¬i còng kh«ng biÕt µ, thËt lµ ngèc!")
end;

function L20_get_pre()
	SetTask(4,20*256+20)
	Talk(2, "L20_get", "Ha ha ha, c©u ®è nµy thËt ®¬n gi¶n! BÊt kÓ c¸i ®Çu h­íng vÒ h­íng nµo, th× c¸i ®u«i còng h­íng xuèng ®Êt th«i!", "¤i! Ng­¬i thËt th«ng minh! VËy ng­¬i gióp ta ®i gi¸o huÊn tªn nhãc Êy, lÊy <color=Red>NhËt NguyÖt Song Lu©n<color> gióp ta.")
end;

function L20_get()
	Say("Xem nh­ ta cÇu xin ng­¬i ®Êy, ng­¬i cã gióp kh«ng?", 2, "§­îc, ®Ó ta thö /L20_get_yes", "Ta cßn cã viÖc kh¸c. /L20_get_no")
end;

function L20_get_yes()
	Talk(1,"","Tèt qu¸! Tªn nhãc ®ã ë <color=Red>c¸nh rõng phİa §«ng<color>, h·y thay ta gi¸o huÊn nã!")
	SetTask(4, 20*256+30)
	AddNote("NhËn nhiÖm vô '§øa trÎ th«ng minh': T×m ®øa trÎ lÊy l¹i cÆp NhËt NguyÖt Song Lu©n cho ¤ Hîp T¸t. ")
	Msg2Player("NhËn nhiÖm vô '§øa trÎ th«ng minh': T×m ®øa trÎ lÊy l¹i cÆp NhËt NguyÖt Song Lu©n cho ¤ Hîp T¸t. ")
end;

function L20_get_no()
	Talk(1,"","NÕu ng­¬i kh«ng gióp ta, ta biÕt t×m ai ®©y, huhuhu…..")
end;

function L20_prise()
	Talk(1,"","Ng­¬i gióp ta lÊy l¹i NhËt NguyÖt Song Lu©n, thËt ®óng lµ ©n nh©n cøu m¹ng cña ta! Kh«ng, kh«ng, ng­êi lµ phô mÉu t¸i sinh cña ta!")
	SetRank(57)
	DelItem(58)
	SetTask(4, 30*256)
--	AddMagic(137)
	add_tr(30)			-- µ÷ÓÃskills_table.luaÖĞµÄº¯Êı£¬²ÎÊıÎªÑ§µ½¶àÉÙ¼¶¼¼ÄÜ¡£
	Msg2Player("B¹n ®­îc th¨ng cÊp Thiªn NhÉn Tö SÜ! Häc ®­îc vâ c«ng ¶o ¶nh Phi Hå. ")
	AddNote("§­a cÆp NhËt NguyÖt Song Lu©n cho NhËt NguyÖt §µn chñ ¤ Hîp T¸t, hoµn thµnh nhiÖm vô §øa trÎ th«ng minh. Th¨ng cÊp Tö SÜ. ")
end;

function W30_deliver_yes()		--ÓíÍõ½£ÈÎÎñ£¬ÒªÖ±½ÓÇĞ»»µ½»ªÉ½
	if (GetCash() >= 300) then
		Pay(300)
		NewWorld(2, 2288, 4091)
	else
		Talk(1,"","Kh«ng tiÒn b¹c nµo cã thÓ mua ®­îc ta, Thiªn h¹ ®Ö tø cao thñ oai phong lÉm liÖt NhËt NguyÖt §µn Chñ ¤ Hîp T¸t.")
	end
end;

function W30_deliver_no()
	Talk(1,"","Chót tiÒn thÕ nµy th× mua ®­îc g×?")
end;

function L30_deliver_yes()	--ÌìÈÌ30¼¶ÈÎÎñ£¬ÒªÖ±½ÓÇĞ»»µ½ÇØÊ¼»ÊÁê
	if (GetCash() >= 500) then
		Pay(500)
		NewWorld(7, 2235, 2847)
	else
		Talk(1,"","Ai còng biÕt, kh«ng tiÒn b¹c nµo cã thÓ mua ®­îc ta, Thiªn h¹ ®Ö tø cao thñ oai phong lÉm liÖt NhËt NguyÖt §µn Chñ ¤ Hîp S¸t.")
	end
end;

function L30_deliver_no()
	Talk(1,"","§· nghe qua c©u ph¸ tµi tiªu tai ch­a? Chót tiÒn thÕ nµy th× mua ®­îc g×? CÈn thËn kÎo mÊt m¹ng trªn ®­êng ®Êy!")
end;

function L40_deliver_yes()	--40¼¶ÈÎÎñ£¬ÒªÖ±½ÓÇĞ»»µ½½£¸óÖĞÔ­
	if (GetCash() >= 700) then
		Pay(700)
		NewWorld(43, 1695, 3200)
	else
		Talk(1,"","Ai còng biÕt, kh«ng tiÒn b¹c nµo cã thÓ mua ®­îc ta, Thiªn h¹ ®Ö tø cao thñ oai phong lÉm liÖt NhËt NguyÖt §µn Chñ ¤ Hîp S¸t.")
	end
end;

function L40_deliver_no()
	Talk(1,"","§i ®­êng cÈn thËn nhĞ, ha ha!")
end;

----------------------- ÊÀ½çÈÎÎñ --------------------------
function Uworld51_55()
	SetTask(51,55)
	Msg2Player("Nghe lĞn ¤ Hîp T¸t tù nãi chuyÖn. ChuyÖn nµy qu¶ nhiªn lµ do Thiªn NhÉn gi¸o lµm. Nhanh chãng quay l¹i b¸o c¸o tin tøc. ")
end
