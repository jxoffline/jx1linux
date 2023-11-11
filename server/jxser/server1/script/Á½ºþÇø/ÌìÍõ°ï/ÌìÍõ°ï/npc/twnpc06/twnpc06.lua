--description: ÌìÍõ°ïÓæ¸¾ºÉÉ©
--author: yuanlan	
--date: 2003/4/28
-- Update: Dan_Deng(2003-08-16)
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(205) == 1 then
		allbrother_0801_FindNpcTaskDialog(205)
		return 0;
	end
	UTask_tw = GetTask(3)
	if (UTask_tw == 40*256+50) then 		--40¼¶ÈÎÎñ
		UTask_tw40sub = GetTask(14)
		if (UTask_tw40sub == 3) then		-- ×ÓÈÎÎñÆô¶¯
			Talk(1,"","Chång ta ®· ra s«ng b¾t c¸ råi, gÇn s¾p trë vÒ. ¤ng ta thİch ¨n canh Ng©n NhÜ Liªn Tö nhÊt. Nh­ng kh«ng may lµ h¹t sen trong ngµy ta ®· dïng hÕt c¶ råi, ta ®ang bËn giÆt ®å, ng­¬icã thÓ ®i ®Õn tiÖm t¹p ho¸ ë Ba L¨ng huyÖn mua vÒ mét İt h¹t sen kh«ng ®­îc kh«ng?")
			SetTask(14, 5)
			AddNote("T¹i Thuû Tr¹i ë ®¶o Thiªn V­¬ng gÆp ®­îc ng­ phô Hµ TÈu gióp bµ ta ®Õn tiÖm t¹p ho¸ ë Ba L¨ng huyÖn, mua vÒ mét İt Liªn Tö ")
			Msg2Player("T¹i Thuû Tr¹i ë ®¶o Thiªn V­¬ng gÆp ®­îc ng­ phô Hµ TÈu gióp bµ ta ®Õn tiÖm t¹p ho¸ ë Ba L¨ng huyÖn, mua vÒ mét İt Liªn Tö ")
		elseif (UTask_tw40sub == 5) then
			if (HaveItem(148) == 1) then		-- ×ÓÈÎÎñÍê³É
				Talk(1,"","C¶m ¬n ng­¬i®· mua gióp ta mua h¹t sen vÒ, 3 qua trøng gµ nµy tÆng xin tÆng ng­¬i")
				DelItem(148)
				AddEventItem(149)
				Msg2Player("NhËn ®­îc 3 qu¶ trøng ")
				SetTask(14, 7)
				AddNote("Mang Liªn Tö giao cho Hµ tÈu, nhËn ®­îc 3 qu¶ trøng ")
			else
				Talk(1,"","H·t sen cã b¸n t¹i tiÖm t¹p ho¸ ë Ba L¨ng huyÖn")
			end
		elseif (UTask_tw40sub == 7) then
			if (HaveItem(149) == 0) then
				AddEventItem(149)
				Talk(2,"","Hµ tÈu! Ta kh«ng cÈn thËn ®· ®¸nh r¬i mÊt nh÷ng qu¶ trøng cña tÈu råi, tÈu cã thÓ cho ta l¹i mÊy qu¶ n÷a ®­îc kh«ng?","Xem thÊy ng­¬i rÊt lo l¾ng, ë ®©y cßn cã 3 qu¶ trøng, ta tÆng ng­¬i!")
			else
				Talk(1,"","Canh Ng©n NhÜ Liªn Tö nÊu gÇn xong råi, sao vÉn ch­a thÊy l·o ta vÒ chø?")
			end
		elseif (UTask_tw40sub == 0) then
			Talk(1,"","Ai cã thÓ gióp ta ®i mua h¹t sen vÒ th× tèt qu¸ ")
		else
			Talk(1,"","Chång ta sao b©y giê vÉn ch­a vÒ n÷a?")
		end
	else
		if (random(0,1) == 0) then
			Talk(1,"","Chång ta lµ mét ng­êi chÊt ph¸c, ®Õn b©y giê vÉn cßn lµ mét phã ®¹o lÜnh. Kh«ng biÕt khi nµo míi cã thÓ nê mµy në mÆt!")
		else
			Talk(1,"","Trong c¸c hé ph¸p cña bæn bang, Lé l·o hé ph¸p ®èi víi c¸c thuéc h¹ lµ ®é l­îng nhÊt, H¹ hé ph¸p lµ İt nãi nhÊt, V­¬ng tiÒn sø lµ ng­êi béc trùc nhÊt, D­¬ng H÷u sø lµ ng­êi th«ng minh s¸ng suèt nhÊt,")
		end
	end
end;
