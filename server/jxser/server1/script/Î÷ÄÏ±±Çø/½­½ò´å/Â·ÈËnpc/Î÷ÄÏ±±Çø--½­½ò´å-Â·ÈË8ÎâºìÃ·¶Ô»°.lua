--Î÷ÄÏ±±Çø ½­½ò´å Â·ÈË8ÎâºìÃ·¶Ô»°
--½­½ò´åĞÂÊÖÈÎÎñ£ºÎâÀÏµùµÄÒ©
--suyu
-- Update: Dan_Deng(2003-08-11)
-- Update: Dan_Deng(2003-09-09) ĞŞ¸Ä×°±¸ÊôĞÔÉú³É·½Ê½

Include("\\script\\global\\itemhead.lua")

function main(sel)
	UTask_world21 = GetTask(49);
	if (UTask_world21 == 3) then
		Talk(1,"","§a t¹ ng­¬i ®· hèt thuèc cho cha ta! §©y lµ ®«i giµy ta míi võa may xong, nÕu ng­¬i kh«ng chª xin h·y cÇm lÊy!")
		SetTask(49, 10)
		AddRepute(6)
		AddNote("Hoµn thµnh nhiÖm vô gióp Ng« l·o gia bèc thuèc ")
		Msg2Player("Hoµn thµnh nhiÖm vô gióp Ng« l·o gia bèc thuèc ")
		p1,p2,p3,p4,p5,p6 = RndItemProp(6,10)
		if(GetSex() == 0)then
			AddItem(0,5,0,1,random(0,4),GetLucky(), p1,p2,p3,p4,p5,p6)
			Msg2Player("NhËn ®­îc mét ®«i giµy cá ")
		else
			AddItem(0,5,2,1,random(0,4),GetLucky(), p1,p2,p3,p4,p5,p6)
			Msg2Player("NhËn ®­îc mét ®«i giµy thªu ")
		end
		Msg2Player("Danh väng cña b¹n t¨ng thªm 6 ®iÓm ")
	else
		Talk(1,"","MÑ ta muèn ¨n thŞt heo luéc tái, nh­ng ng­êi b¸n thŞt h×nh nh­ ch­a dän ra, vËy ph¶i lµm thÕ nµo míi ®­îc ®©y!?")
	end
end;
