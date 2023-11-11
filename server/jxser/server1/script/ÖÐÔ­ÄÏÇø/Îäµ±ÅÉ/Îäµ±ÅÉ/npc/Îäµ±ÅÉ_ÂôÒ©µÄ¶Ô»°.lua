--ÖĞÔ­ÄÏÇø Îäµ±ÅÉ ÂôÒ©µÄµÜ×Ó¶Ô»°
-- Update: Dan_Deng(2003-08-21) ¼ÓÈëÂôµÀ¾ßÖ»Âô¸ø±¾°ï

function main(sel)
	Uworld31 = GetByte(GetTask(31),1)
	if (GetFaction() == "wudang") or (Uworld31 == 127) then
		Say("C¸c läai thuèc nµy ®Òu dïng th¶o d­îc sinh tr­ëng trªn Vâ §ang s¬n chÕ thµnh, cã thÓ cÇm m¸u ch÷a th­¬ng, l¹i cã thÓ t¨ng c­êng søc kháe.", 2, "Giao dŞch/yes", "Kh«ng giao dŞch/no")
	else
		Talk(1,"","Ch­ëng m«n cã lÖnh,d­îc phÈm bæn gi¸o chØ cã thÓ b¸n cho m«n h¹ Vâ §ang.")
	end
end;

function yes()
Sale(65);  			
end;

function no()
end;






