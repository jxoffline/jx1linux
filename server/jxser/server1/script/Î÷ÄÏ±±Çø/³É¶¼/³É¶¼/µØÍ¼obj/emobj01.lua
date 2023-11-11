--description: Î÷ÄÏ±±Çø ³É¶¼¸® ¶ëáÒÅÉ10¼¶ÈÎÎñÁÁÒø¿ó
--author: yuanlan	
--date: 2003/5/24

function main()
	SetPropState()
	AddEventItem(118)
	Msg2Player("NhÆt ®­îc mét miÕng L­îng Ng©n Kho¸ng. ")
	if (GetTask(1) > 10*256) and (GetTask(1) < 20*256) then
		AddNote("T×m thÊy mét miÕng L­îng Ng©n Kho¸ng trong khu rõng ë phİa t©y Thµnh §«. ")
	end
end;
