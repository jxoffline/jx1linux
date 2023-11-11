--description: ĞÂÊÖ´å_»¨»¨
--author: wangzg	
--date: 2003/7/22
--73	UTask_world45
--update 2003/7/28 yuanlan
-- Update: Dan_Deng(2003-08-07)

function main()
	UTask_world45=GetTask(73)
	if (UTask_world45 == 0) then		-- ÈÎÎñÆô¶¯
		Say("Ng­¬i cã thÊy TiÓu Long em ta kh«ng? Ta nhê nã ®i mua kÑo, ®îi m·i kh«ng thÊy nã vÒ, ®Õn ®ã t×m còng kh«ng thÊy, ta lo l¾ng muèn chÕt! ", 2, "Ta gióp ng­¬i t×m /yes", "Ta gióp ng­¬i kh«ng ®­îc /no")
	elseif (UTask_world45 == 1) then
		Talk(1,"","PhiÒn ng­¬i gióp ta t×m xem!")
	elseif (UTask_world45 >= 10) then
		Talk(1,"","C¸m ¬n ng­¬i ®· t×m ®­îc em ta.")
	else				-- ·ÇÈÎÎñ¶Ô»°
		Talk(1,"","TiÓu Long em ta rÊt lµ tinh nghŞch!")
	end	
end

function yes()
	Talk(1,"","§· lµm phiÒn ng­¬i! ")
	SetTask(73,1)
	AddNote("NhËn nhiÖm vô: Gióp Hoa Hoa t×m em trai tiÓu Long. ")
	Msg2Player("NhËn nhiÖm vô: Gióp Hoa Hoa t×m em trai tiÓu Long. ")
end

function no()
end
