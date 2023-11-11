--description: ĞÂÊÖ´å_´ºÏã
--author: wangzg	
--date: 2003/7/21
--update 2003/7/25 yuanlan
-- Update: Dan_Deng(2003-08-07)
-- Update: Dan_Deng(2003-09-20)

function main()
	UTask_world69=GetTask(69)
	if (UTask_world69 == 2) and (HaveItem(190) == 1) then
		Talk(4,"W69_step1","Xu©n H­¬ng c« n­¬ng! Cã ng­êi nhê ta mang giao cho c« mãn nµy","C¸i nµy...lµ ai ®­a cho ng­¬i vËy?","C« n­¬ng nghÜ nhí l¹i xem! NhÊt ®Şnh lµ sÏ biÕt ai lµ ng­êi ®­a mãn ®å nµy.","NÕu vËy th×...ng­êi Êy th­êng ®äc c©u th¬ 'Y ®íi thiÖn khoan chung bÊt hèi' nh­ng anh ta kh«ng biÕt t¸c gi¶ LiÔu VÜnh cã tªn gäi lµ g×, ®óng kh«ng?")
	elseif (UTask_world69 == 6) then
		Say("Anh ta sÏ tr¶ lêi thÕ nµo? T¸c gi¶ LiÔu VÜnh cña c©u th¬ 'Y ®íi thiÖn khoan chung bÊt hèi' cßn gäi lµ g×?",4,"LiÔu ThÊt BiÕn /W69_false","LiÔu BiÕn /W69_false","LiÔu ThÊt /W69_true","LiÔu Tam BiÕn /W69_false")
	else
		Talk(1,"","Ta tõ nhá ®· ë ®©y, lín lªn ë ®©y. Tr­íc giê ch­a biÕt thÕ giíi bªn ngoµi ra sao.")
	end
end;

function W69_step1()
	DelItem(190)
	SetTask(69,4)
	AddNote("Mang hoa sen giao cho Xu©n H­¬ng truyÒn ®¹t t©m ı cña Lı Dù ®èi víi nµng ta. Xu©n H­¬ng mét ®Ò thi: Y ®íi thiÖn khoan chung bÊt hèi, t¸c gi¶ LiÔu VÜnh cña c©u th¬ trªn cßn ®­îc gäi lµ g×?  ")
	Msg2Player("Mang hoa sen giao cho Xu©n H­¬ng truyÒn ®¹t t©m ı cña Lı Dù ®èi víi nµng ta. Xu©n H­¬ng mét ®Ò thi: Y ®íi thiÖn khoan chung bÊt hèi, t¸c gi¶ LiÔu VÜnh cña c©u th¬ trªn cßn ®­îc gäi lµ g×?  ")
end

function W69_true()
	Talk(1,"","§­îc råi! H·y nãi víi huynh Êy: ngµy mai ®Õn nhµ ta lµm kh¸ch!")
	SetTask(69,8)
	AddNote("Tr¶ lêi chİnh x¸c, Xu©n H­¬ng nhê chuyÓn lêi mêi Lı Dù mai ®Õn nhµ c« Êy ch¬i. ")
	Msg2Player("Tr¶ lêi chİnh x¸c, Xu©n H­¬ng nhê chuyÓn lêi mêi Lı Dù mai ®Õn nhµ c« Êy ch¬i. ")
end

function W69_false()
	Talk(1,"","Sai råi! Cho huynh Êy thêi gian ®Ó suy nghÜ!")
	Msg2Player("Ng­¬i tr¶ lêi sai råi, cè lªn, ®õng ®Ó mèi th©m t×nh cña Lı Dù bŞ bá lì. ")
end
