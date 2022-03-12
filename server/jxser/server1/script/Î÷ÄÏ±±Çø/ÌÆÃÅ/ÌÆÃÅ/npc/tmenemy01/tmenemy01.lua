--description: ÌÆÃÅÖñº£µÚÒ»¹ØµÐÈË
--author: yuanlan	
--date: 2003/3/10
-- Update: Dan_Deng(2003-08-13)

function OnDeath()
	Uworld37 = GetByte(GetTask(37),1)
	if (Uworld37 >= 20) and (Uworld37 < 127) and (HaveItem(33) == 0) and (random(0,99) < 50) then		--ÈÎÎñÖÐ£¬Ã»ÓÐÇàÉ«ÖñÕÈ£¬50%»úÂÊ
		AddEventItem(33)
		Msg2Player("Cã ®­îc gËy tre mµu xanh ")
		AddNote("T¹i ¶i thø nhÊt ®¸nh b¹i §¹i M· HÇu, cã ®­îc c©y gËy mµu xanh ")
	end
end;
