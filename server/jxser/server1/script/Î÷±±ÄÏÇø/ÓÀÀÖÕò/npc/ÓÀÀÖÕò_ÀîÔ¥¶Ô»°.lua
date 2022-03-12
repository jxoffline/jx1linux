--description: ĞÂÊÖ´å_ÀîÔ¥
--author: wangzg	
--date: 2003/7/21
--update 2003/7/25 yuanlan
-- Update: Dan_Deng(2003-08-09)
-- Update: Dan_Deng(2003-09-09) ĞŞ¸Ä×°±¸ÊôĞÔÉú³É·½Ê½
-- Update: Dan_Deng(2003-09-20) ÎªºÎVSSÉÏÎ´¸üĞÂ£¿ÖØĞ´ĞŞ¸ÄÈÎÎñÁ÷³Ì

Include("\\script\\global\\itemhead.lua")

function main()
	UTask_world69=GetTask(69)
	if ((UTask_world69 == 0) and (GetLevel() >= 5)) then
		Talk(3, "select", "Y ®íi thiÖn khoan dung bÊt hèi, vi y tiªu ®¾c nh©n tiÒu tuş ","VŞ huynh ®µi nµy, cã g× ®au lßng vËy?","ChØ tiÕc lµ tr­íc giê c« ta kh«ng cã biÓu hiÖn g× víi ta. T¹i sao trªn thÕ gian nµy cã ng­êi ®au khæ nh­ ta chø?")
	elseif (UTask_world69 == 4) then
		Talk(4,"W69_step2","Xu©n H­¬ng ra cho huynh mét ®Ò thi: 'Y ®íi thiÖn khoan chung bÊt hèi', t¸c gi¶ LiÔu VÜnh cña c©u th¬ trªn cßn ®­îc gäi lµ g×?","ThËt ®¸ng chÕt! Ta thËt nghÜ kh«ng ra!","Kh«ng biÕt… C©u hái ®¬n gi¶n nh­ thÕ mµ kh«ng biÕt?","ThËt ng¹i qu¸! Huynh cã thÓ gióp ta kh«ng?")
	elseif (UTask_world69 == 8) then
		Talk(2, "prise", "Xu©n H­¬ng c« n­¬ng ®· chÊp nhËn tİn vËt cña huynh, cßn mêi huynh ®Õn nhµ lµm kh¸ch! Chóc mõng chóc mõng!", "ChiÕc nhÉn nµy lµ thµnh ı cña ta tÆng ng­¬i! Xin nhËn cho!")
	elseif (UTask_world69 == 2) then
		Talk(1,"","C« ta tªn lµ Xu©n H­¬ng, ë phİa ®«ng trÊn, phiÒn ng­¬i mang qu¹t l¸ sen nµy tÆng cho c« ta.")
	elseif (UTask_world41==10) then
		Talk(1,"","Xu©n H­¬ng võa ®¶m ®ang võa hiÒn lµnh, lÊy ®­îc ng­êi vî nh­ thÕ th× cßn g× b»ng!")
	else
		Talk(1,"","§a t×nh…ThÕ gian nµy ai mµ ch¼ng vËy!")
	end
end

function select()
	Say("Ng­¬i cã thÓ gióp ta truyÒn ®¹t t©m ı ®Õn c« ta kh«ng?", 2, "Ta cã thÓ gióp ng­¬i nãi víi nµng. /yes", "ChuyÖn nµy ta kh«ng gióp næi ®©u. /no")
end;

function yes()
	Talk(1,"","C« ta tªn lµ Xu©n H­¬ng, ë phİa ®«ng trÊn, phiÒn ng­¬i mang qu¹t l¸ sen nµy tÆng cho c« ta.")
	AddEventItem(190)
	Msg2Player("NhËn nhiÖm vô: Gióp Lı Dù truyÒn ®¹t t×nh ı ®Õn Xu©n Hu¬ng, ®­a hoa sen nh­ lµ tİn vËt cña Lı Dù cho Xu©n H­¬ng. ")
	SetTask(69,2)
	AddNote("NhËn nhiÖm vô: Gióp Lı Dù truyÒn ®¹t t×nh ı ®Õn Xu©n Hu¬ng, ®­a hoa sen nh­ lµ tİn vËt cña Lı Dù cho Xu©n H­¬ng. ")
end

function no()
end

function W69_step2()
	Talk(1,"","Tu©n lÖnh!")
	SetTask(69,6)
	AddNote("Lı Dù kh«ng tr¶ lêi ®­îc c©u hái, nhê ng­¬i gióp Lı Dù tr¶ lêi c©u hái nµy. ")
	Msg2Player("Lı Dù kh«ng tr¶ lêi ®­îc c©u hái, nhê ng­¬i gióp Lı Dù tr¶ lêi c©u hái nµy. ")
end

function prise()
	SetTask(69,10)
	AddRepute(7)		-- ÉùÍû¼Ó7µã
	AddNote("Mang c©u tr¶ lêi cña Xu©n H­¬ng nãi víi Lı Dù, nhiÖm vô hoµn thµnh. ")
	Msg2Player("Mang c©u tr¶ lêi cña Xu©n H­¬ng nãi víi Lı Dù, nhiÖm vô hoµn thµnh. ")
	p1,p2,p3,p4,p5,p6 = RndItemProp(6,10)
	if (random(0,3) == 0) then
		AddItem(0, 3, 0, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
		Msg2Player("NhËn ®­îc chiÕc nhÉn Hoµng ngäc ")
	else
		AddItem(0, 3, 0, 2, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
		Msg2Player("NhËn ®­îc chiÕc nhÉn ®¸ oliu ")
	end
	Msg2Player("Danh tiÕng giang hå cña b¹n t¨ng thªm 7 ®iÓm ")
end
