--description: ÎäÁêÉ½ °×Ë®¶´µĞÈË1¡¡ÌìÍõ20¼¶ÈÎÎñ
--author: yuanlan	
--date: 2003/4/25
-- Update: Dan_Deng(2003-08-16)

function OnDeath()
	UTask_tw = GetTask(3)
	if (UTask_tw == 20*256+50) then
		UTask_twtmp20 = SetBit(GetTaskTemp(10),1,1)
		SetTaskTemp(10,UTask_twtmp20)
		if (UTask_twtmp20 == 7) then		-- bin: 100 + 010
			Msg2Player("§¸nh b¹i thæ phØ, d©n chóng trong th«n phô cËn tÆng mét l¸ cê gÊm ®Ó t¹ ¬n. ")
			AddEventItem(92) 
--			SetTask(3, 28)
			AddNote("T¹i B¹ch Thñy ®éng Vò L¨ng s¬n, ®¸nh b¹i 3 tªn cÇm ®©u b¨ng thæ phØ m¹o nhËn Thiªn V­¬ng bang, ®­îc d©n chóng phô cËn tÆng mét l¸ cê gÊm. ")
		end
	end
end;
