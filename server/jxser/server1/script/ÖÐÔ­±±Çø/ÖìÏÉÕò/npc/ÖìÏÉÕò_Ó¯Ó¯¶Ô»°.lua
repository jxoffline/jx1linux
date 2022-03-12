--description: ĞÂÊÖ´å_Ó¯Ó¯
--author: wangzg	
--date: 2003/7/22
--72	UTask_world44
--update 2003/7/28 yuanlan
-- Update: Dan_Deng(2003-08-07)
-- Update: Dan_Deng(2003-09-09) ĞŞ¸Ä×°±¸ÊôĞÔÉú³É·½Ê½

Include("\\script\\global\\itemhead.lua")

function main()
	UTask_world44=GetTask(72)
	if ((UTask_world44==0) and (GetLevel() >= 2)) then		-- ÈÎÎñÆô¶¯£¬ĞèÒª2¼¶ÒÔÉÏ
		Talk(3, "select", "Sao ®Çu ãc l¹i trèng rçng, nhøc b­ng b­ng thÕ nµy? 'Ph­îng l©u chØ xİch, giai kú yÓu v« ®Şnh. TriÓn chuyÓn v« miªn, x¸n chÈm b¨ng l·nh'. Lµ ai khiÕn ta bŞ nh­ vËy?", "…...C« n­¬ng x¶y ra chuyÖn g× vËy, v× sao l¹i tæn th­¬ng nh­ thÕ?", "Cã ai hiÓu ®­îc nçi ®au trong lßng ta. VŞ ®¹i hiÖp cã thÓ gióp ta ®­îc kh«ng?")
	elseif (UTask_world44==2)  then
		Talk(1,"","PhiÒn huynh nãi víi t×nh lang Tr­¬ng §¹i Nguyªn, canh ba ®ªm nay, t¹i chç cò, kh«ng gÆp kh«ng vÒ.")
	elseif (UTask_world44==4) then		-- ÈÎÎñÍê³É
		Talk(7,"prise","Tr­¬ng §¹i Nguyªn kia nãi kh«ng quen c« n­¬ng.","C¸i g×?.....§o¹n huyÒn v« tôc, n­íc ®æ khã thu, vÉn liªn hÖ víi ng­êi tr­íc ®©y. Nçi hèi tiÕc lu«n day døt. B©y giê biÕt lµm sao ®©y?","......C« n­¬ng thËt lµ ng­êi l·ng m¹n!","¤i, th«i ®i, håi øc nµy ta chØ gi÷ trong lßng th«i.", "§õng n¶n lßng, ®µn «ng trªn thÕ gian nµy cßn rÊt nhiÒu.", "§a t¹ c¸c h¹ ®· quan t©m, ®«i giµy nµy xin tÆng l¹i c¸c h¹. ¤i…...phßng kh«ng chiÕc bãng, thËt sÇu nÉu ruét.", "......")
	else
		Talk(1,"","Vî chång ng­êi ta cã ®«i cã cÆp, ta sao khæ thÕ nµy, chØ mét m×nh thui thñi?")
	end
end;

function select()
	Say("H·y gióp tiÓu n÷ ®em chiÕc kh¨n tay nµy ®Õn t×nh lang Tr­¬ng §¹i Nguyªn, vµ nãi víi huynh Êy canh ba ®ªm nay, chç cò, kh«ng gÆp kh«ng vÒ.", 2, "§­îc, ta sÏ gióp /yes", "Ta cßn viÖc kh¸c ph¶i lµm /no")
end

function yes()
	AddEventItem(192)
	SetTask(72,2)
	AddNote("NhËn nhiÖm vô: Gióp Doanh Doanh ®­a chiÕc kh¨n tay cho t×nh lang Tr­¬ng §¹i Nguyªn, chuyÓn l¹i lêi nh¾n. ")
	Msg2Player("NhËn nhiÖm vô: Gióp Doanh Doanh ®­a chiÕc kh¨n tay cho t×nh lang Tr­¬ng §¹i Nguyªn, chuyÓn l¹i lêi nh¾n. ")
	Msg2Player("LÊy ®­îc m«t chiÕc kh¨n tay. ")
end

function no()
end

function prise()
	DelItem(192)
	SetTask(72,10)
	AddRepute(5)
	AddNote("Nãi l¹i th¸i ®é cña Tr­¬ng §¹i Nguyªn cho Doanh Doanh biÕt, khuyªn nµng ta ®õng qóa ®au buån, hoµn thµnh nhiÖm vô. ")
	Msg2Player("Nãi l¹i th¸i ®é cña Tr­¬ng §¹i Nguyªn cho Doanh Doanh biÕt, khuyªn nµng ta ®õng qóa ®au buån, hoµn thµnh nhiÖm vô. ")
	p1,p2,p3,p4,p5,p6 = RndItemProp(6,10)
	if (GetSex()== 0) then
		AddItem(0,5,0,1,random(0,4),GetLucky(), p1,p2,p3,p4,p5,p6)
		Msg2Player("LÊy ®­îc ®«i giµy cá ")
	else
		AddItem(0,5,2,1,random(0,4),GetLucky(), p1,p2,p3,p4,p5,p6)
		Msg2Player("LÊy ®­¬c ®«i hµi thªu ")
	end
	Msg2Player("Danh väng cña b¹n t¨ng thªm 5 ®iÓm")
end;
