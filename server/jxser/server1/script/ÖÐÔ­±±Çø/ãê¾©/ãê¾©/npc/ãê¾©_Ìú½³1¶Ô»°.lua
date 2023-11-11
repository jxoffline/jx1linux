--description: ÖĞÔ­±±Çø ãê¾©¸® Ìú½³1¶Ô»° ÌìÈÌ½Ì³öÊ¦ÈÎÎñ
--author: yuanlan	
--date: 2003/5/19
-- Update: Dan_Deng(2003-08-14)
Include("\\script\\global\\global_tiejiang.lua")

TIEJIANG_DIALOG = "<dec><npc>Tr­íc kia tiÖm thî rÌn nµy rÊt ¨n nªn lµm ra, rÊt nhiÒu vâ l©m cao thñ ®Õn ®©y ®Æt lµm binh khİ, b©y giê th× …. Th«i kh«ng nãi cho xong! Muèn xem lo¹i binh khİ g×?"

function main(sel)
	UTask_tr = GetTask(4)
	if (UTask_tr == 60*256+20) then
		UTask_trsub60 = GetByte(GetTask(28),1)
		if (UTask_trsub60 == 0) then
			tiejiang_city("<dec><npc>Ta n¨m nay ®· trßn ba chôc råi mµ vÉn h­a lÊy ®­îc vî, t¹i sao vÉn ch­a cã ng­êi thİch ta nhØ? Kh«ng d¸m giÊu ®¹i hiÖp ta rÊt thİch Tr­¬ng gãa phô ë phİa ®«ng thµnh, nh­ng ta l¹i kh«ng d¸m më miÖng thæ lé sî c« Êy ghĞt ta.", "VËy ®Ó ta thö nãi gióp «ng nhĞ!/L60_sub_yes")
		elseif (UTask_trsub60 == 1) then
			if (HaveItem(63) == 1) then
				tiejiang_city("<dec><npc>PhiÒn ng­¬i gióp ta tÆng c« Êy c©y tr©m b¹c nµy ®­îc kh«ng?")
			else
				AddEventItem(63)
				Talk(1,"","Ng­¬i ch­a lÊy ng©n tr©m ®· véi bá ®i, rèt cuéc cã muèn gióp ta kh«ng?")
			end
		elseif (UTask_trsub60 == 2) and (HaveItem(64) == 1) then
			Talk(2, "", "ThËt ra Tr­¬ng qu¶ phô còng cã c¶m t×nh víi «ng, ®©y lµ H­¬ng Nang cña c« ta ®­a «ng!", "C¶m ¬n ng­¬i! NÕu kh«ng cã ng­¬i, chóng t«i kh«ng biÕt mÊt bao l©u míi hiÓu t©m ı cña nhau n÷a. Ta cã 1 thanh ®o¶n kiÕm, mÆc dï kh«ng ®¸ng gi¸ lµ bao, nh­ng lµ vËt tæ truyÒn cña ta, b©y giê tÆng ng­¬i coi nh­ t¹ lÔ.")
			DelItem(64)
			AddEventItem(127)
			SetTask(28, SetByte(GetTask(28),1,10))
			AddNote("Giao H­¬ng nang cho Khóc ThiÕt T­îng, nhËn ®­îc §o¹n KiÕm 'YÓm NhËt'.")
			Msg2Player("NhËn ®­îc §o¹n KiÕm 'YÓm NhËt'.")
		else
			if (HaveItem(127) == 1) then
				tiejiang_city("<dec><npc>§a t¹ ®¹i hiÖp ®· lµm mèi gióp ta víi Tr­¬ng gãa phô, cÇn xem lo¹i binh khİ g× ë ®©y?")
			else
				AddEventItem(127)
				Talk(1,"","MÆc dï ng­¬i thi ©n bÊt cÇu b¸o, nh­ng ng­¬i ®· gióp ta viÖc lín nh­ thÕ, thanh kiÕm nµy bÊt luËn thÕ nµo ng­¬i còng ph¶i nhËn lÊy.")
			end
		end
	elseif (UTask_tr > 60*256+20) then
		tiejiang_city("<dec><npc>§a t¹ ®¹i hiÖp ®· lµm mèi gióp ta víi Tr­¬ng gãa phô, cÇn xem lo¹i binh khİ g× ë ®©y?")
	else
		tiejiang_city()
	end
end;

function L60_sub_yes()
	Talk(1,"","VËy lµm phiÒn ng­¬i råi! C©y ng©n tr©m nµy chİnh tay ta lµm, ng­¬i gióp ta ®­a cho c« ta, nÕu c« ta nhËn chøng tá trong lßng c« Êy cã ta.")
	AddEventItem(63)
	SetTask(28, SetByte(GetTask(28),1,1))
	AddNote("§èi tho¹i víi Khóc ThiÕt T­îng, nhËn mang Ng©n tr©m tÆng cho Tr­¬ng qu¶ phô ")
	Msg2Player("NhËn ®­îc 1 c©y Ng©n tr©m.")
end;

function yes()
Sale(7);  			--µ¯³ö½»Ò×¿ò
end;

