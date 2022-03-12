--description: ÏåÑô³ÇÑÃÃÅÃØµÀµĞÈË
--author: yuanlan	
--date: 2003/5/17
-- Update: Dan_Deng(2003-08-17)

function OnDeath()
	UTask_wd = GetTask(5)
	UTask_wd60sub = GetByte(GetTask(17),3)
	if (UTask_wd == 60*256+20) and (UTask_wd60sub == 2) then
		Talk(2, "", "CÈu quan! Nhí lÊy, tõ nay ®õng bao giê hµ hiÕp d©n lµnh. NÕu kh«ng, anh hïng trong thiªn h¹ ®Òu kh«ng tha cho ng­¬i!", "T­íng thñ T­¬ng D­¬ng: Kh«ng d¸m! Ta sî l¾m!")
		Msg2Player("Gi¸o huÊn thµnh c«ng T­¬ng D­ong Thñ t­íng. ")
		SetTask(17, SetByte(GetTask(17),3,5))
		AddNote("TiÕn vµo ®­êng hÇm ë nha m«n, ®¸nh b¹i T­¬ng D­ong Thñ t­íng, tiªu diÖt chÕ ®é cai trŞ b¹o tµn ë T­¬ng D­¬ng ")
	end
end;
