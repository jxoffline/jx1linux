--description: ĞÂÊÖ´å_ËÕÖÒ
--author: wangzg	
--date: 2003/7/22
-- Update: Dan_Deng(2003-08-11)

function main()
	UTask_world43=GetTask(71)
	if (UTask_world43==1) then
		Talk(3, "select", "Huynh lµ T« Trung? MÑ ng­¬i ®ang lo l¾ng cho ng­¬i!", "Ta còng kh«ng muèn mÑ ta bËn t©m, nh­ng ta ®· quyÕt ®Şnh tßng qu©n råi!", "T¹i sao vËy?")
	elseif (UTask_world43==2) then
		Talk(1,"","C¸m ¬n ng­¬i chØ ®iÓm! ")
	elseif (UTask_world43==3) then
		Talk(1,"","VËy phiÒn ng­¬i khuyªn mÑ ta! ")
	else	
		Talk(1,"","Cha ta chÕt d­íi tay ng­êi Kim, mèi thï nµy c¶ ®êi ta kh«ng quªn! ")
	end
end;

function select()
Say("HiÖn Quèc gia ®ang l©m n¹n, ta lµm sao chØ lo ®äc s¸ch ®­îc?",2,"Khuyªn can /against","T¸n ®ång /support")
end

function against()
	Talk(4,"","Nh­ng mµ tuæi ng­¬i cßn trÎ, qu©n tö b¸o thï 10 n¨m kh«ng muén, häc thªm chót b¶n lÜnh ngµy sau míi cã thÓ giÕt ®Şch! ", ".....Ng­¬i nãi còng rÊt cã ®¹o lı!", "Ng­¬i hiÓu th× tèt! Mau vÒ th¨m mÑ, bµ ta rÊt nhí ng­¬i!", "§­îc råi! C¸m ¬n!")
	SetTask(71,2)
	AddNote("Khuyªn T« Trung ë nhµ ®· thµnh c«ng. ")
	Msg2Player("Khuyªn T« Trung ë nhµ ®· thµnh c«ng. ")
end

function support()
	Talk(3,"","Nãi rÊt hay! Ng­¬i tuy trÎ tuæi nh­ng l¹i mang chİ lín.","Ta muèn nhËp ngò, nh­ng lo mÑ ta sÏ kh«ng cho ta ®i.","Ng­¬i yªn t©m! Ta ®· gióp ng­¬i khuyªn bµ ta råi")
	SetTask(71,3)		
	AddNote("ñng hé quyÕt ®Şnh cña T« Trung, gióp T« Trung khuyªn MÑ. ")
	MsgPlayer("ñng hé quyÕt ®Şnh cña T« Trung, gióp T« Trung khuyªn T« §¹i Ma")
end
