--Á½ºşÇø ÌìÍõ°ïÈëÃÅÈÎÎñÄğ¾Æ¼ÆÊ±½Å±¾
-- Update: Dan_Deng(2003-08-16)

function OnTimer()
	StopTimer()						--½áÊø¼ÆÊ±
	Msg2Player("Giê nÊu r­îu ®· ®Õn! ")
	SetTask(38,SetByte(GetTask(38),1,80))
end;
