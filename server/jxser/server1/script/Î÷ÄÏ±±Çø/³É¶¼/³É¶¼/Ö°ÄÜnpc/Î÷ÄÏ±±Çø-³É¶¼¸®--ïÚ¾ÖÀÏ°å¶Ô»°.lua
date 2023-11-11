--description: Î÷ÄÏ±±Çø³É¶¼¸®ïÚ¾ÖÀÏ°å 
--author: yuanlan	
--date: 2003/3/5
-- Update: Dan_Deng(2003-08-12)
Include("\\script\\task\\newtask\\branch\\zhongli\\branch_zhonglitasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
function main(sel)
	Say("Mét kiÕm däc ngang trêi ®Êt! Ch­a cã ai ®èi thñ! Ng­¬i ®Õn cã viÖc g×?",3,"Ta ®Õn lµm nhiÖm vô phô tuyÕn/branch_branchlengqiang","Ta ®Õn lµm nhiÖm vô cÊp 40 cña Nga My Ph¸i/emei_fourtytask","Kh«ng cã g×! Ng­ìng mé nªn ®Õn xem th«i!/no")
end;

function branch_branchlengqiang()
Uworld1055 = nt_getTask(1055)
	if ( Uworld1055 >= 60 and Uworld1055 <= 120 ) then
			branch_lengqiang()
	else
		Talk(1,"","Ai còng t­ëng nghÒ B¶o tiªu lµ sung s­íng! ThËt sù mçi lÇn ra ®i ®Òu kh«ng d¸m hÑn tr­íc ngµy vÒ!")
	end
end

function emei_fourtytask()
	UTask_em = GetTask(1);
	if (UTask_em == 40*256+40) then 							--¶ëáÒÅÉ40¼¶ÈÎÎñ
		Talk(6, "", "Nghe nãi quı Tiªu Côc cã mét bøc 'phï dung cÈm kª ®å'cña Tèng Huy T«ng, ta muèn mua, xin hái bao nhiªu tiÒn?", "KhÈu khİ lín nhØ! Ng­¬i biÕt gi¸ c¶ cña bøc tranh ®ã kh«ng? Bao nhiªu tiÒn còng kh«ng b¸n ®©u!", "C¸c ng­¬i vËn chuyÓn hµng hãa cÇn g× bøc tranh ®ã? Th«i ®Ó cho ta ®i, cÇn ®iÒu kiÖn g× cø nãi th¼ng ra!", "Ng­¬i rÊt kh¶ng kh¸i! §­îc! NÕu cã thÓ t×m ba mãn ®å th× ta sÏ d©ng hai tay bøc tranh 'Phï Dung CÈm Kª ®å' cho.", "Ba mãn g× vËy?", "<color=Red>Linh X¹ H­¬ng Nang<color>,<color=Red> ¦ng T×nh Hé Th©n phï<color> vµ <color=Red>Bİch Tû Giíi ChØ<color>, toµn lµ nh÷ng thø mang sù may m¾n b¶o vÖ viÖc lµm ¨n cña tiªu côc, nh­ng mµ khã t×m l¾m ®ã!")
		SetTask(1, 40*256+50)
		SetTask(29,0)				-- ¿ªÊ¼×ÓÈÎÎñÖ®Ç°ÏÈÇåÁã
		AddNote("§èi tho¹i víi «ng chñ Tiªu Côc, tiÕp nhËn nhiÖm vô, vµo thµnh t×m Linh X¹ H­¬ng Nang, ¦ng T×nh Hé Th©n phï vµ Bİch Tû Giíi chØ.")
		Msg2Player("Chñ tiªu côc yªu cÇu b¹n t×m Linh X¹ H­¬ng Nang, ¦ng T×nh Hé Th©n phï vµ Bİch Tû Giíi ChØ ®Ó ®èi lÊy 'Phï Dung CÈm Kª ®å'")
	elseif ((UTask_em == 40*256+60) and (HaveItem(21) == 0)) then		-- µÀ¾ß¶ªÊ§µÄ´¦Àí
		AddEventItem(21)
		Talk(1,"","Ta míi võa ®em tranh ra, ng­¬i ch¹y ®i ®©u vËy? May mµ ta gi÷ lêi høa!")
	elseif (UTask_em == 40*256+50) then	-- ¶ëáÒÅÉ40¼¶ÈÎÎñÖĞ
		if (HaveItem(166)== 1  and  HaveItem(167)== 1  and  HaveItem(168)== 1) then
			Talk(1,"","Ng­¬i trong giang hå ch÷ tİn ®i ®Çu, ban ®Çu ta chØ muèn ng­¬i thÊy khã ®Ó n¶n lßng, kh«ng ngê ng­¬i ®· t×m ®ñ ba mãn. Tèt! Ta giao 'Phï Dung CÈm Kª ®å' cho ng­¬i ®©y!")
			DelItem(166)
			DelItem(167)
			DelItem(168) 
			AddEventItem(21)
			Msg2Player("§­îc 'Phï Dung CÈm Kª ®å'.")
			SetTask(1, 40*256+60)
			SetTask(29,0)
			AddNote("giao Linh X¹ H­¬ng Nang, ¦ng T×nh Hé Th©n phï vµ Bİch Tû Giíi ChØ ®æi lÊy 'Phï Dung CÈm Kª §å' cña «ng chñ tiªu côc.")
		else									--Ã»ÓĞ×öÍêÈı¸öÈÎÎñ
			Talk(1,"","T×m ®ñ <color=Red>Linh X¹ H­¬ng Nang<color>, <color=Red>¦ng T×nh Hé Th©n phï <color> vµ <color=Red>Bİch Tû Giíi ChØ<color> ®i míi tİnh tiÕp.")
		end
	else
		Talk(1,"","Tiªu s­ cña tiªu côc chóng ta ai còng vâ nghÖ cao c­êng, ®¬n ®Æt hµng nhËn ®­îc nÕu ai d¸m ngang nhiªn ®Õn c­íp th× kh«ng biÕt l­îng søc tı nµo!")
	end
end

function no()
end
