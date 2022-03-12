--½­ÄÏÇø\ÁÙ°²\ÁÙ°²\npc\Â·ÈË_ÕÅĞ¡Èª.lua 
--by xiaoyang (2004\4\20)

Include("\\script\\global\\repute_head.lua")

function main()
	Uworld121 = GetTask(121)
	Uworld38 = GetByte(GetTask(38),1)
	if (Uworld121 < 10) and (GetLevel() >= 90) and (GetReputeLevel(GetRepute()) >= 5) and (Uworld38 == 127) and (GetFaction() ~= "tianwang") then
		Talk(3,"Uworld121_get","Xin chµo vŞ b»ng h÷u!","T¹i h¹ ng­ìng mé tµi nghÖ lµm kĞo cña Tr­¬ng gia ®· l©u, h«m nay t­¬ng kiÕn, qu¶ lµ tiÕng ®ån kh«ng sai","Kh«ng biÕt c¸c h¹ cã thÓ gióp cho mét viÖc kh«ng?","S½n sµng!")
	elseif (Uworld121 == 10) and (HaveItem(373) == 0) then
		Talk(1,"","Ta còng rÊt phôc c¸c h¹! KĞo ch­a lÊy ®· véi ®i! GÆp thÇn tiªn còng ch­a ch¾c ®· véi nh­ vËy!")
		AddEventItem(373)
		Msg2Player("TiÕp nhËn lÊy kĞo cña Tr­¬ng TiÓu TuyÒn ")
	else
		if (random(0,1) == 0) then
			Talk(1,"","Nhµ ta 3 ®êi ®Òu rÌn kĞo, vèn còng cã chót tiÕng t¨m ë vïng nµy. Cha ta muèn ta kÕ thõa tæ nghiÖp, sau nµy sÏ më thªm mét x­ëng rÌn kĞo, nh­ng ta kh«ng ®ång ı ")
		else
			Talk(1,"","Nh÷ng ng­êi trong hä téc ®Òu kh«ng hiÓu chót g× vÒ chİ h­íng cña ta. Ta muèn ®i kh¶o thİ t×m chót c«ng danh,Sau nµy cã thÓ lµm ®­îc quan to. Ta kh«ng muèn suèt ®êi nµy ®Òu bŞ ng­êi ta coi khinh chØ lµ mét anh thî rÌn kĞo")
		end
	end
end

function Uworld121_get()
	if (GetCamp() == 0) and (GetTask(75) < 255) then		-- °×ÃûÎ´Ñ§Ò°ÇòÈ­µÄ£¬²»ÔÊĞí½ÓÈÎÎñ
		Talk(1,"","Kh«ng ®­îc! Xem c¸i bé d¹ng kh«ng c¶n ®­îc giã cña ng­¬i th× ch¾c kh«ng lµm ®­îc chuyÖn nµy")
	else
		Say("ë ®©y cã mét c©y kĞo ®· ®­îc tinh luyÖn. Mong nhê c¸c h¹ chuyÓn gióp ®Õn cho Sø gi¶ Hµ Mé TuyÕt ®¹i nh©n ë Thóy Yªn m«n",2,"Sím ®· nghe Danh tiÕng cña Hµ TiªnTö. LÇn nµy thËt lµm c¬ héi ngµn vµng ®Ó ®­îc t­¬ng kiÕn /Uworld121_getjd","Nh­ng ta v× c¸i g× mµ ph¶i ®i xa nh­ vËy? Huèng hå ta vµ c¸c h¹ l¹i ch­a tõng quen biÕt! Xin lçi! Ta thËt kh«ng thÓ gióp ®­îc! /Uworld121_no") --ÈÎÎñÆô¶¯
	end
end

function Uworld121_getjd()
	AddEventItem(373)
	Msg2Player("NhËn lÊy kĞo cña Tr­¬ng TiÓu TuyÒn ")
	AddNote("NhËn lÊy kĞo sau ®ã ®i th¼ng vÒ h­íng Thóy Yªn m«n ")
	SetTask(121,10) --ÉèÖÃÈÎÎñ±äÁ¿Îª10
end

function Uworld121_no()
end
