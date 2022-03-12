--Î÷ÄÏ±±Çø ½­½ò´å Â·ÈË5»¢×Óµù¶Ô»°
--½­½ò´åĞÂÊÖÈÎÎñ£º»¢×Ó°İÊ¦
--suyu
-- Update: Dan_Deng(2003-08-11)
-- Update: Dan_Deng(2003-09-09) ĞŞ¸Ä×°±¸ÊôĞÔÉú³É·½Ê½

Include("\\script\\global\\itemhead.lua")

function main(sel)
--	UTask_world20 = GetTask(48);
	UTask_world44 = GetTask(44)
	if (UTask_world44 == 0) then		-- ÈÎÎñÆô¶¯£¨1¼¶¼´¿É½ÓÈÎÎñ)
		Say("Vâ s­ bªn ngoµi th«n rÊt cã danh tiÕng. Hæ Tö nhµ ta tõ nhá ®· rÊt mª vâ häc. NÕu cã thÓ b¸i vŞ vâ s­ ®ã lµm thÇy th× thËt tèt qu¸! Nhµ ta lµ gia ®×nh rÊt b×nh th­êng, kh«ng biÕt häc vâ cã ph¶i tèn mÊt bao nhiªu tiÒn, ng­¬i cã thÓ ®i hái vŞ vâ s­ ®ã dïm ta!?", 2, "Gióp /yes", "Kh«ng gióp /no")
	elseif(UTask_world44 == 10) then
		Talk(1,"","VŞ Vâ s­ ®ang ë ng«i nhµ tranh ë mĞ §«ng cña th«n.")
	elseif(UTask_world44 == 20) then
		Talk(1,"","Sao? ¤ng Êy ®· ®ång ı råi µ? ¸i da! ThËt tèt qu¸! C¸i mò nµy lµ nhµ ta lµm ra! Tuy kh«ng ®¸ng gi¸ bao nhiªu nh­ng bµy tá lßng biÕt ¬n!")
		SetTask(44, 100)
		AddRepute(5)
		AddNote("Th«ng b¸o tin vŞ s­ phô ®ã ®ång ı nhËn Hæ tö lµm häc trß cho cha Hæ tö nghe, nhiÖm vô hoµn thµnh ")
		Msg2Player("Th«ng b¸o tin vŞ s­ phô ®ã ®ång ı nhËn Hæ tö lµm häc trß cho cha Hæ tö nghe, nhiÖm vô hoµn thµnh ")
		p1,p2,p3,p4,p5,p6 = RndItemProp(6,10)
		if(GetSex() == 0) then
			AddItem(0,7,6,1,random(0,4),GetLucky(), p1,p2,p3,p4,p5,p6)
			Msg2Player("NhËn ®­îc mét tÊm kh¨n v¶i ")
		else
			AddItem(0,7,8,1,random(0,4),GetLucky(), p1,p2,p3,p4,p5,p6)
			Msg2Player("NhËn ®­îc mét c¸i ng©n thoa ")
		end
		Msg2Player("Danh väng cña b¹n t¨ng thªm 5 ®iÓm")
	else			-- ·ÇÈÎÎñ¶Ô»°
		Talk(1,"","VÒ ¨n nãi nhµ ta ai ai còng giái, rÊt thİch lµm mai mèi cho ng­êi ta!")
	end
end;

function yes()
	Talk(1,"","VŞ Vâ s­ ®ang ë ng«i nhµ tranh ë mĞ §«ng cña th«n.")
	SetTask(44, 10)
	AddNote("TiÕp nhËn nhiÖm vô: §i xin cho Hæ Tö häc vâ ")
	Msg2Player("TiÕp nhËn nhiÖm vô: §i xin cho Hæ Tö häc vâ ")
end;

function no()
end;
