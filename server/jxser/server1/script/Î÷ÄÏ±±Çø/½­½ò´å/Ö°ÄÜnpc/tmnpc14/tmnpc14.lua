--description: ÌÆÃÅ½­½ò´åÌÆÔª¾Ë¾Ë 50¼¶ÈÎÎñ 
--author: yuanlan	
--date: 2003/3/12
-- Update: Dan_Deng(2003-08-13)

function main()
	UTask_tm = GetTask(2)
	if (UTask_tm == 50*256+40) then
		Talk(1,"","….KhÆc…khÆc….§øa ch¸u nµy thËt hiÕu th¶o, ta võa l©m bÖnh, ®· lËp tøc tíi th¨m!")
	else
		Talk(1,"","Ta kh«ng cã con c¸i, chØ cã 1 ®øa ch¸u ngo¹i ®ang häc vâ t¹i §­êng M«n ")
	end
end;
