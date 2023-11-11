function givemedicine()
	Say("Ha! Ha! Ha! Kh«ng uæng c«ng ta ®· d¹y dç ng­¬i! §Ó xem ng­¬i mêi ta uèng r­îu g× nµo!",5, "D©ng Tiªn Linh Töu/givegod", "D©ng Hæ Cèt töu/givetiger", "D©ng Léc Nhung töu/giveantler", "D©ng Nh©n S©m töu/givepanax", "S­ phô! Mïi vŞ thÕ nµo?/no");
end

function givegod()
	if(GetItemCountEx(947) >= 1) then
		local i = random(1,3)
		if(i > 1) then
			DelItemEx(947);	
			AddItem(6,1,73,1,0,0);
			Say("H¶o töu! H¶o töu! B¸ch Qu¶ Lé nµy tÆng cho ng­¬i! C¶m ¬n ng­¬i ®· tÆng ta h¶o töu! Ha! Ha! Ha!",0);
			Msg2Player("NhËn ®­îc 1 B¸ch Qu¶ Lé ");
			WriteLog(date("%H%M%S")..": Tµi kho¶n"..GetAccount()..", nh©n vËt"..GetName().."£¬ÓÚ½ÌÊ¦½Ú»î¶¯µÃµ½1¸ö°Ù¹ûÂ¶¡£");				
		else
			DelItemEx(947);
			Say("B×nh r­îc nµy h×nh nh­ cÊt ch­a ®ñ l©u. Cã lÏ ta ph¶i ®em vÒ ch«n thªm 1 n¨m n÷a míi ph¸t huy ®­îc d­îc tİnh",0);
		end
	else
		Say("Tiªn Linh töu ®©u? Tiªn Linh töu ®©u? §õng nãi lµ ng­¬i ®· lĞn uèng hÕt råi nhĞ!", 0);
	end
end

function givetiger()
	if(GetItemCountEx(948) >= 1) then
		local i = random(1,12)
		if(i > 7) then
			DelItemEx(948);	
			AddItem(6,1,72,1,0,0);
			Say("H¶o töu! H¶o töu! Tiªn S¬n B¶o Lé nµy tÆng cho ng­¬i! C¶m ¬n ng­¬i ®· tÆng ta h¶o töu! Ha! Ha! Ha!",0);
			Msg2Player("NhËn ®­îc 1 Tiªn S¬n B¶o Lé ");
			WriteLog(date("%H%M%S")..": Tµi kho¶n"..GetAccount()..", nh©n vËt"..GetName().."£¬ÓÚ½ÌÊ¦½Ú»î¶¯µÃµ½1¸öÌìÉ½ÓñÂ¶¡£");			
		else
			DelItemEx(948);
			Say("B×nh r­îc nµy h×nh nh­ cÊt ch­a ®ñ l©u. Cã lÏ ta ph¶i ®em vÒ ch«n thªm 1 n¨m n÷a míi ph¸t huy ®­îc d­îc tİnh",0);
		end	
	else
		Say("Hæ Cèt töu ®©u? Hæ Cèt töu ®©u? §õng nãi lµ ng­¬i ®· lĞn uèng hÕt råi nhĞ!", 0);
	end
end

function giveantler()
	if(GetItemCountEx(949) >= 1) then
		local i = random(1,4)
		if(i > 1) then
			DelItemEx(949);	
			AddItem(6,1,125,1,0,0);
			Say("H¶o töu! H¶o töu! QuÕ hoa töu nµy tÆng cho ng­¬i! C¶m ¬n ng­¬i ®· tÆng ta h¶o töu! Ha! Ha! Ha!",0);
			Msg2Player("NhËn ®­îc 1 b×nh QuÕ Hoa töu");
			WriteLog(date("%H%M%S")..": Tµi kho¶n"..GetAccount()..", nh©n vËt"..GetName().."£¬ÓÚ½ÌÊ¦½Ú»î¶¯µÃµ½1Æ¿¹ğ»¨¾Æ¡£");			
		else
			DelItemEx(949);
			Say("B×nh r­îc nµy h×nh nh­ cÊt ch­a ®ñ l©u. Cã lÏ ta ph¶i ®em vÒ ch«n thªm 1 n¨m n÷a míi ph¸t huy ®­îc d­îc tİnh",0);
		end		
	else
		Say("Léc Nhung töu ®©u? Léc Nhung töu ®©u? §õng nãi lµ ng­¬i ®· lĞn uèng hÕt råi nhĞ!", 0);
	end
end

function givepanax()
	if(GetItemCountEx(950) >= 1) then
		local i = random(1,5)
		if(i > 1) then
			DelItemEx(950);	
			AddItem(6,1,71,1,0,0);
			Say("H¶o töu! H¶o töu! Tiªn Th¶o Lé nµy tÆng cho ng­¬i! C¶m ¬n ng­¬i ®· tÆng ta h¶o töu! Ha! Ha! Ha!",0);
			Msg2Player("NhËn ®­îc 1 Tiªn Th¶o Lé ");
			WriteLog(date("%H%M%S")..": Tµi kho¶n"..GetAccount()..", nh©n vËt"..GetName().."£¬ÓÚ½ÌÊ¦½Ú»î¶¯µÃµ½1Æ¿ÏÉ²İÂ¶¡£");			
		else
			DelItemEx(950);
			Say("B×nh r­îc nµy h×nh nh­ cÊt ch­a ®ñ l©u. Cã lÏ ta ph¶i ®em vÒ ch«n thªm 1 n¨m n÷a míi ph¸t huy ®­îc d­îc tİnh",0);
		end	
	else
		Say("Nh©n S©m töu ®©u? Nh©n S©m töu ®©u? §õng nãi lµ ng­¬i ®· lĞn uèng hÕt råi nhĞ!", 0);
	end
end
