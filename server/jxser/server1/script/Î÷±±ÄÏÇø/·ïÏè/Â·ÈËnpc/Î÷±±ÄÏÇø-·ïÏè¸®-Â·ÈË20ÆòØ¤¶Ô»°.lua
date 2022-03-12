--Î÷±±ÄÏÇø ·ïÏè¸® Â·ÈË20ÆòØ¤¶Ô»° ÊÀ½çÈÎÎñ

function main(sel)

--UTask_world36 = GetTask(64);

--if (UTask_world36 == 0) then 
--Talk(3, "select", "ÆòØ¤£º°¦¡­¡­", "Ğ¡¸ç£¬ÔõÃ´ÔÚÕâ°¦ÉùÌ¾ÆøµÄ£¿", "ÆòØ¤£º¿´ÄãÊÇÍâµØÀ´µÄ°É£¬Ã»¼ûµ½¹Ù¸®Ç°µÄ¸æÊ¾Âğ£¿Õâ¼¸Ìì³¯Í¢ÅÉÊàÃÜÊ¹´óÈËÀ´ÊÓ²ì£¬ËùÓĞÆòØ¤¶¼²»ÄÜÉÏ½ÖÆòÌÖ£¬ËµÊÇÓĞ°­ÊĞÈİ£¬ÄãËµÕâÊàÃÜÊ¹´óÈËÊÓ²ì¸ú°³ÃÇÕâĞ©Òª·¹µÄÓĞÊ²Ã´¹ØÏµ£¬Õâ¼¸Ìì×ö²»³ÉÉúÒâ£¬°³Ò»¼Ò´óĞ¡¿ÉÔõÃ´¹ı°¡¡£")
--return
--end;

--if (UTask_world36 == 1) then 
Say("Nh×n anh ch¾c lµ ng­êi n¬i kh¸c, anh kh«ng thÊy c¸o thŞ tr­íc cöa nha m«n sao? MÊy ngµy nµy triÒu ®×nh cö quan mËt sø ®Õn thŞ s¸t n¬i ®©y. V× vËy ¨n xin kh«ng ®­îc ra ®­êng. Quan mËt sø ®Õn víi viÖc chóng ta xin c¬m th× cã liªn quan g× chø? MÊy ngµy nay kh«ng lµm ®­îc g×, c¶ nhµ lÊy g× mµ sèng.", 0)
--end;

end;


function select()
Say("Nh×n anh ta thËt ®¸ng th­¬ng… ", 2, "Cho tiÒn /accept", "Kh«ng cho tiÒn /refuse");
end;


function accept()

if (GetCash() > 1000) then							--²Î¿¼Öµ
	Talk(2, "select1", "TiÓu ca! ®©y cã İt ng©n l­îng, huynh cÇm ®ì mµ dïng!", "Chóng ta bÌo n­íc t­¬ng phïng, ng­¬i l¹i cho ta nhiÒu ng©n l­îng nh­ vËy, thËt lµ mét ng­êi tr­îng nghÜa! ThÕ th×...ta l¨n lén trªn giang hå còng cã kh«ng İt kinh nghiÖm, ta sÏ truyÒn l¹i ®Ó ng­¬i phßng th©n")	
else
	Say("Xem ra ng­¬i còng kh«ng giµu cã g×, ta chØ nhËn h¶o ı cña ng­¬i th«i.", 0)
end;

end;


function refuse()
end;


function select1()
Pay(GetCash()/3)
AddOwnExp(1000)	
SetTask(64, 1)
end;