--Ê¯¹ÄÕò ÎäÊ¦ ĞÂÊÖÈÎÎñËÍ·¹¡¢Á·Çá¹¦
-- By: Dan_Deng(2003-09-04)
-- Update: Dan_Deng(2003-11-04)¸ÄÎªÄ£°å·½Ê½£¬È«·şÍ³Ò»µ÷ÓÃÒ»¸öº¯ÊıÒÔÀûÓÚÎ¬»¤¡¢À©Õ¹

Include("\\script\\global\\itemhead.lua")
Include("\\script\\global\\¸÷ÅÉ½ÓÒıµÜ×Ó\\Çá¹¦_ÎäÊ¦Ä£°å.lua")

function main(sel)
	UTask_world22 = GetTask(22)		-- ËÍ·¹ÈÎÎñ
	if (UTask_world22 == 5) and (HaveItem(233) == 1) then			-- ËÍ·¹ÈÎÎñÍê³É
		Talk(4,"W22_prise","LiÔu DiÖp Nhi nhê ng­¬i ®em c¬m cho ta? Nã nhá tuæi thÕ mµ ph¶i lo nhiÒu viÖc, ta kh«ng ph¶i lµ «ng néi tèt. Nhí n¨m x­a lóc nã 3 tuæi.....sau ®ã.....l¹i cßn.....","¤ng ¨n c¬m ®i!","C¸m ¬n! Ta cßn nhiÒu chuyÖn ng­¬i muèn nghe kh«ng?",".....Kh«ng cÇn!")
	else
		learn()
	end
end;

function W22_prise()
	Talk(1,"","ThÕ.....c¸m ¬n ng­¬i! H·y gi÷ lÊy vò khİ phßng th©n.")
	DelItem(233)
	SetTask(22,10)
	AddNote("§­a c¬m cho vâ s­, nhiÖm vô hoµn thµnh ")
	Msg2Player("§­a c¬m cho vâ s­, nhiÖm vô hoµn thµnh ")
	p1,p2,p3,p4,p5,p6 = RndItemProp(6,7)
	i = random(0,8)
	if(i <= 5) then
		AddItem(0, 0, i, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
	else
		i = i - 6
		AddItem(0, 0, i, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
	end
	Msg2Player("NhËn ®­îc mét mãn binh khİ ")
	AddRepute(3)
	Msg2Player("Danh väng cña b¹n t¨ng thªm 3 ®iÓm ")
end;
