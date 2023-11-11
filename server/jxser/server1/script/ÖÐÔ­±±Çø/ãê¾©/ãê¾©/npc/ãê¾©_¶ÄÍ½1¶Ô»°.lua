--description: ÖĞÔ­±±Çø ãê¾©¸® ¶ÄÍ½1¶Ô»° ÌìÈÌ½Ì³öÊ¦ÈÎÎñ
--author: yuanlan	
--date: 2003/5/19
-- Update: Dan_Deng(2003-08-14)

function main(sel)
	UTask_tr = GetTask(4);
	if (UTask_tr == 60*256+20) and (HaveItem(129) == 0) then
		Talk(8, "select", "H«m tay ta thËt lµ xui xÎo! §Æt v¸n nµo thua v¸n ®ã! B©y giê bªn ng­êi chØ cßn c©y kiÕm cïn nµy th«i!", "§o¹n KiÕm! L·o huynh! C©y kiÕm nµy huynh cã b¸n kh«ng?", "B¸n! B¸n chø! Ng­oi thËt cã m¾t tinh t­êng ®ã! NhiÒu ng­êi hái råi mµ ta ch­a b¸n, v× hä kh«ng biÕt nh×n!", "CÇn bao nhiªu tiÒn?", "Kh«ng m¾c! ChØ cÇn 500 l­îng!", "Cã ®¸ng gi¸ vËy kh«ng?", "Ng­¬i xem ta ®· t¶ t¬i thÕ nµy råi! Th«i th× xem nh­ ng­¬i gióp ®ì kÎ khèn khã vËy!", "Th«i còng ®­îc! (Dï sao ta còng ®ang cÇn nã) ")
	elseif (UTask_tr > 60*256+20) then 
		Talk(1,"","Ta kh«ng cßn thø g× ®¸ng gi¸ ®Ó b¸n n÷a!")
	else
		Talk(1,"","MÊy ngµy nay ta kh«ng cã g× vµo bông! LÇn nµy vÒ thÕ nµo còng bŞ con s­ tö ë nhµ xĞ x¸c!")
	end
end;

function select()
	if (GetCash() >= 500) then
		Pay(500)
		AddEventItem(129)
		Msg2Player("LÊy ®­îc ®o¶n kiÕm ChuyÓn Hån ")
		AddNote("§i ®Õn sßng b¹c ë BiÖn Kinh, mua mét thanh ®o¶n kiÕm mÊt 500 l­îng ")
	else
		Talk(1,"","Ch¶ lÏ ng­¬i còng nghÌo m¹t gièng ta vËy sao?")
	end
end;
