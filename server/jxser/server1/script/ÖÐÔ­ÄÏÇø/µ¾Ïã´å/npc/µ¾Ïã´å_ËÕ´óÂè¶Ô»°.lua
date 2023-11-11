--description: ĞÂÊÖ´å_ËÕ´óÂè
--author: wangzg	
--date: 2003/7/22
--71	UTask_world43
--update 2003/7/28 yuanlan
--Update: Dan_Deng(2003-08-07)

function main()
	UTask_world43=GetTask(71)
	if ((UTask_world43==0) and (GetLevel() >= 3)) then		-- ¼ÓÈëµÈ¼¶ÏŞÖÆ
		Talk(2, "select", "Hõ! §øa con ngç nghŞch cña ta, ng­¬i muèn ta ph¶i thÕ nµo?","Cã chuyÖn g× vËy?")
	elseif (UTask_world43==2) then
		Talk(2, "", "Ta ®· khuyªn T« ®Ö cè g¾ng häc hµnh, ng­êi kh«ng nªn lo l¾ng.", "Tèt qu¸! L·o th©n kh«ng biÕt lÊy g× ®Ó c¶m ¬n, ®©y lµ Kim S¸ng D­îc, ng­¬i nhËn ®i!")
		AddItem(1,0,0,1,0,0,0)
		AddItem(1,0,0,1,0,0,0)
		AddItem(1,0,0,1,0,0,0)
		SetTask(71,4)
		AddNote("Nãi víi T« §¹i Ma, ®· thuyÕt phôc thµnh c«ng T« Trung ë nhµ, nhiÖm vô hoµn thµnh. ")
		Msg2Player("Nãi víi T« §¹i Ma, ®· thuyÕt phôc thµnh c«ng T« Trung ë nhµ, nhiÖm vô hoµn thµnh. ")
		Msg2Player("Cã 3 bao Kim S¸ng d­îc. ")
		AddRepute(6)
		Msg2Player("Thanh thÕ giang hå cña b¹n ®­îc gia t¨ng 6 ®iÓm. ")
	elseif (UTask_world43==3) then
		Talk(2, "", "§¹i Ma! Ta biÕt T« Trung cã chİ khİ, huynh Êy muèn giÕt ®Şch trªn chiÕn tr­êng, nam nhi chİ t¹i bèn ph­¬ng. H·y ®Ó huynh Êy lµm theo lı t­ëng cña m×nh.", "¤i, con ®· lín ta kh«ng thÓ gi÷ ®­îc! Nã cã chİ lín, ta lµm mÑ còng kh«ng thÓ ng¨n c¶n, c¸m ¬n ng­¬i ®· gióp ta hiÓu nã, Kim S¸ng D­îc nµy ng­¬i lÊy ®i!")
		Msg2Player("Cã 3 bao Kim S¸ng d­îc. ")
		AddItem(1,0,0,1,0,0,0)
		AddItem(1,0,0,1,0,0,0)
		AddItem(1,0,0,1,0,0,0)
		SetTask(71,5)
		AddNote("Gióp T« §¹i Ma lı gi¶i sù lùa chän cña T« Trung, hoµn thµnh nhiÖm vô. ")
		Msg2Player("Gióp T« §¹i Ma lı gi¶i sù lùa chän cña T« Trung, hoµn thµnh nhiÖm vô. ")
		Msg2Player("Cã 3 bao Kim S¸ng d­îc. ")
		AddRepute(4)
		Msg2Player("Thanh thÕ giang hå cña b¹n ®· t¨ng lªn 4 ®iÓm. ")
	else	
		Say("MÊy n¨m nay hai mÑ con ta vÊt v¶ sèng qua ngµy. Cø nghÜ ®Õn T­íng c«ng ®· tö trËn lµ ta chØ muèn khãc! Hy väng con ta ®­îc b×nh an v« sù!", 0)	
	end
end;

function select()
Say("Nã vèn lµ ®øa nghiªm tóc miÖt mµi ®Ìn s¸ch,gÇn ®©y l¹i muèn tßng qu©n giÕt giÆc, rèt cuéc kh«ng biÕt nã nghÜ g× n÷a?", 2, "Ta gióp bµ ®i hái nã /yes", "ViÖc nµy ta còng kh«ng biÕt /no")
end

function yes()
SetTask(71,1)
AddNote("NhËn nhiÖm vô: Gióp T« §¹i Ma t×m hiÓu suy nghÜ cña con trai. ")
Msg2Player("NhËn nhiÖm vô: Gióp T« §¹i Ma t×m hiÓu suy nghÜ cña con trai. ")
end 

function no()
end
