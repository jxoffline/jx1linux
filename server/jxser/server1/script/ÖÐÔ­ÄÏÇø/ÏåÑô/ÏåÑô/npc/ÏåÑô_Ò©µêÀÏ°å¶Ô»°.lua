--description: ÖĞÔ­ÄÏÇø ÏåÑô¸® Ò©µêÀÏ°å¶Ô»° Îäµ±ÅÉ³öÊ¦ÈÎÎñ
--author: yuanlan	
--date: 2003/5/17
-- Update: Dan_Deng(2003-08-17)

-- Á¶ÖÆ»ìÔªÁéÂ¶
function refine()
	DynamicExecute("\\script\\global\\jingli.lua", "dlg_entrance", PlayerIndex)
end

function main(sel)
	UTask_wd = GetTask(5)
	UTask_wd60sub = GetByte(GetTask(17),1)
	if (UTask_wd == 60*256+20) then
		if (UTask_wd60sub == 2) then 
			Talk(2, "", "HiÖn giê chiÕn tr­êng bÖnh dŞch kĞo dµi, xin hái cã c¸ch nµo hay kh«ng?", "Muèn trŞ ch÷a bÖnh dŞch cÇn 5 lo¹i thuèc: <color=Red> §­¬ng Quy, Hîp Hoan, HuyÒn S©m, Phßng Kû, Chu Sa <color>.H·y ®Õn <color=Red>§«ng Phôc Ng­u s¬n<color> ®Ó t×m!")
			SetTask(17, SetByte(GetTask(17),1,5))
			AddNote("Chñ d­îc ®iÕm (201,202) cho biÕt cÇn 5 lo¹i d­îc liÖu: Hîp Hoan, HuyÒn S©m, §­¬ng Quy, Phßng Kû, Chu Sa ë phİa §«ng Phôc Ng­u S¬n ®Ó chÕ thuèc")
		elseif (UTask_wd60sub == 5) then
			if ( HaveItem(107) == 1 and HaveItem(134) == 1 and HaveItem(135) == 1 and HaveItem(136) == 1 and HaveItem(137) == 1) then
				Talk(2, "", "Ta ®· t×m ®ñ 5 lo¹i d­îc phÈm, nhê «ng bµo chÕ d­îc hoµn ®­a cho quan phñ chuyÓn ®Õn chiÕn tr­êng!", "Quèc gia l©m nguy, lµ con d©n ph¶i cã tr¸ch nhiÖm víi ®Êt n­íc.Yªn t©m! Ta nhÊt ®Şnh bµo chÕ ngay ®Ó kŞp chuyÓn ra tiÒn tuyÕn!")
				DelItem(107)
				DelItem(134)
				DelItem(135)
				DelItem(136)
				DelItem(137)
				SetTask(17, SetByte(GetTask(17),1,8))
				AddNote("T×m ®ñ 5 lo¹i d­îc liÖu giao cho «ng chñ d­îc ®iÕm, ng¨n chÆn ®­îc sù l©y lan cña dŞch bÖnh.")
				Msg2Player("T×m ®ñ 5 lo¹i d­îc liÖu giao cho «ng chñ d­îc ®iÕm, ng¨n chÆn ®­îc sù l©y lan cña dŞch bÖnh.")
			else
				Say("Muèn trŞ ch÷a bÖnh dŞch cÇn 5 lo¹i thuèc: <color=Red> §­¬ng Quy, Hîp Hoan, HuyÒn S©m, Phßng Kû, Chu Sa <color>.H·y ®Õn <color=Red>§«ng Phôc Ng­u s¬n<color> ®Ó t×m!",
					2,
					"Ta ph¶i mua tr­íc İt d­îc phÈm/yes",
					"ta ®i t×m ngay ®©y/no")
			end
		else
			Say("C¸c lo¹i thuèc trŞ ®¶ th­¬ng, trËt th­¬ng, trµng th­¬ng, vÕt c¾t, báng ®Çy ®ñ h¬n chç kh¸c, ng­¬i muèn mua thuèc g×?",
				3,
				"Giao dŞch/yes",
				--"Ta muèn chÕ t¹o Hçn Nguyªn Linh Lé/refine",
				"Kh«ng giao dŞch/no")
		end
	else
		Say("C¸c lo¹i thuèc trŞ ®¶ th­¬ng, trËt th­¬ng, trµng th­¬ng, vÕt c¾t, báng ®Çy ®ñ h¬n chç kh¸c, ng­¬i muèn mua thuèc g×?",
			3,
			"Giao dŞch/yes",
			--"Ta muèn chÕ t¹o Hçn Nguyªn Linh Lé/refine",
			"Kh«ng giao dŞch/no")
	end
end

function yes()
	Sale(12)  			--µ¯³ö½»Ò×¿ò
end

function no()
end
