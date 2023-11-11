--description: ĞÂÊÖ´å_Ğ¡Áú
--author: wangzg	
--date: 2003/7/22
--update 2003/7/28 yuanlan
--Update: Dan_Deng(2003-08-07)
-- Update: Dan_Deng(2003-09-09) ĞŞ¸Ä×°±¸ÊôĞÔÉú³É·½Ê½

Include("\\script\\global\\itemhead.lua")

function main()
	UTask_world45=GetTask(73)
	if (UTask_world45 == 1) then
		Talk(4, "Fpay", "Ch¸u lµ TiÓu Long? ChŞ ch¸u ®ang t×m ®ã, mau vÒ ®i!", "Ta ch­a muèn vÒ, tû tû cho ch¸u 10 l­îng b¹c b¶o ta mua kÑo, nh­ng ®· ch¸u lµm mÊt tiÒn råi, tû sÏ m¾ng ch¸u th«i","Ch¸u t×m xung quanh rÊt l©u, còng kh«ng t×m ®­îc 10 l­îng vµng, hu hu hu!.....","Ch¸u ®õng lo, ta cho ch¸u 10 l­îng!")
	else
		Talk(1,"","Tû rÊt tèt víi ta, nh­ng ta rÊt sî tû Êy!")
	end
end

function Fpay()
	if (GetCash() < 10) then
		Talk(1,"","¸i chµ! Ta kh«ng cã tiÒn, kh«ng gióp ®­îc ch¸u råi!")
	else
		Pay(10)
		Talk(1,"","C¸m ¬n ng­¬i! Sîi yªu ®¸i nµy lµ ta kh«ng dïng ®Õn, tÆng ng­¬i!")
		SetTask(73,10)
		AddNote("T×m ®­îc tiÓu Long, ®­a cho nã tiÒn, thuyÕt phôc nã vÒ nhµ, nhiÖm vô hoµn thµnh. ")
		Msg2Player("T×m ®­îc tiÓu Long, ®­a cho nã tiÒn, thuyÕt phôc nã vÒ nhµ, nhiÖm vô hoµn thµnh. ")
		p1,p2,p3,p4,p5,p6 = RndItemProp(6,10)
		AddItem(0,6,0,1,random(0,4),GetLucky(), p1,p2,p3,p4,p5,p6)
		Msg2Player("Cã ®­îc 1 sîi th¾t l­ng b»ng da. ")
		AddRepute(5)
		Msg2Player("Danh väng cña b¹n t¨ng thªm 5 ®iÓm ")
	end				
end

function no()
end
