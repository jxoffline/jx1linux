--description: ÌÆÃÅ³öÊ¦ÈÎÎñ ÖñË¿¶´µÚÈı²ã±¦Ïä
--author: yuanlan	
--date: 2003/3/13
-- Update: Dan_Deng(2003-08-13)

function main()

	UTask_tm = GetTask(2)
	if (UTask_tm == 60*256+60) then
		if (HaveItem(49) == 0) then 
			Say("1 v¹n l­îng.", 2, "CÇn /accept", "Kh«ng cÇn /refuse")
		else
			Talk(1,"","B¹n ®· më 1 r­¬ng kh¸c nªn kh«ng thÓ më l¹i r­¬ng nµy!")
		end
	elseif (UTask_tm == 60*256+70) then
		Talk(1,"","B¶o r­¬ng ®· rçng")
	else
		Talk(1,"","B¹n thö më r­¬ng b¸u, nh­ng h×nh nh­ nã ®· bŞ rØ sĞt!")
	end
end;

function accept()
	Earn(10000)
	SetTask(2, 60*256+70)
	AddNote("LÊy ®­îc mét v¹n l­îng trong r­¬ng b¸u t¹i tÇng thø 3 cña Tróc T¬ §éng. ")
	Msg2Player("NhËn ®­îc mét v¹n l­îng b¹c ")
end;

function refuse()
end;
