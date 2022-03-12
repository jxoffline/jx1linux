--description: ÌÆÃÅ³öÊ¦ÈÎÎñ ÖñË¿¶´µÚÈı²ã±¦Ïä
--author: yuanlan	
--date: 2003/3/13
-- Update: Dan_Deng(2003-08-13)

function main()
	UTask_tm = GetTask(2)
	if (UTask_tm == 60*256+60) then
		if (HaveItem(49) == 0) then 
			Say("Trong r­¬ng cã 1 thanh kiÕm bŞ sĞt ", 2, "CÇn /accept", "Kh«ng cÇn /refuse")
		else
			Talk(1,"","B¶o r­¬ng ®· rçng")
		end
	elseif (UTask_tm == 60*256+70) then 
		Talk(1,"","B¹n ®· më 1 r­¬ng kh¸c nªn kh«ng thÓ më l¹i r­¬ng nµy!")
	else
		Talk(1,"","B¹n thö më r­¬ng b¸u, nh­ng h×nh nh­ nã ®· bŞ rØ sĞt!")
	end
end;

function accept()
	AddEventItem(49)
	Msg2Player("§o¹t ®­îc ThÊt Tinh TuyÖt MÖnh KiÕm ")
--	SetTask(2, 67)
	AddNote("T¹i tÇng thø 3 cña Tróc T¬ §éng cã 2 r­¬ng b¸u ®¸nh vì 1 r­¬ng b¸u, sÏ ®­îc ThÊt Tinh TuyÖt MÖnh KiÕm. ")
end;

function refuse()
end;
