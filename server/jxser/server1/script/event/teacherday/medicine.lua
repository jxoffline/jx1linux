function brew()
	Say("Kinh nghiÖm ®iÒu chÕ d­îc töu cña bæn tiÖm xa gÇn ®Òu biÕt tiÕng. Kh¸ch quan muèn ®iÒu chÕ lo¹i d­îc töu g×?", 6, "Tiªn Linh töu/god", "Hæ Cèt Töu/tiger", "Léc Nhung töu/antler", "Nh©n S©m töu/panax", "Ta muèn biÕt c¸ch thøc ®iÒu chÕ d­îc töu!/aboutbrewing", "Ta ph¶i ®i t×m thªm d­îc liÖu/no");
end

function god()
	Say("Tiªn Linh töu cÇn cã 3 Linh Chi th¶o. Kh¸ch quan ®· cã ®ñ d­îc liÖu ch­a?",2, "§ñ råi! S­ phô h·y chøng minh kinh nghiÖm gia truyÒn cña m×nh ®i!/godyes", "Ta ph¶i ®i t×m thªm d­îc liÖu/no");
end

function tiger()
	Say("Hæ Cèt töu cÇn cã 1 Linh Chi th¶o vµ 3 Hæ cèt. Kh¸ch quan ®· cã ®ñ d­îc liÖu ch­a?",2, "§ñ råi! S­ phô h·y chøng minh kinh nghiÖm gia truyÒn cña m×nh ®i!/tigeryes", "Ta ph¶i ®i t×m thªm d­îc liÖu/no");
end

function antler()
	Say("Léc Nhung töu cÇn cã 1 Linh Chi th¶o vµ 3 Léc Nhung. Kh¸ch quan ®· cã ®ñ d­îc liÖu ch­a?",2, "§ñ råi! S­ phô h·y chøng minh kinh nghiÖm gia truyÒn cña m×nh ®i!/antleryes", "Ta ph¶i ®i t×m thªm d­îc liÖu/no");
end

function panax()
	Say("Nh©n S©m töu cÇn cã 1 Linh Chi th¶o vµ 3 Nh©n S©m. Kh¸ch quan ®· cã ®ñ d­îc liÖu ch­a?",2, "§ñ råi! S­ phô h·y chøng minh kinh nghiÖm gia truyÒn cña m×nh ®i!/panaxyes", "Ta ph¶i ®i t×m thªm d­îc liÖu/no");
end

function godyes()
	if(GetItemCountEx(943) >= 3) then
		local i = random(1,4);
		if(i > 1) then
			for j=1, 3 do 
				DelItemEx(943);			
			end
			AddEventItem(947);
			Say("Linh Chi th¶o th­îng h¹ng céng víi kinh nghiÖm gia truyÒn cña ta, Tiªn Linh töu nµy kh«ng ai cã thÓ chª ®­îc!",0);
			Msg2Player("NhËn ®­îc 1 b×nh Tiªn Linh töu");
			WriteLog(date("%H%M%S")..": Tµi kho¶n"..GetAccount()..", nh©n vËt"..GetName().."£¬ÄğÖÆ³öÁË1Æ¿ÏÉÁé¾Æ¡£");
		else
			DelItemEx(943);
			Say("Cã 1 Linh chi ch­a ®ñ tuæi, phèi d­îc sÏ kĞm chÊt l­îng. Kh¸ch quan h·y chŞu khã ®i t×m c¸i kh¸c ®i! Ta ë ®©y chê!",0);
		end
	else
		Say("Kh¸ch quan vÉn ch­a ®ñ d­îc liÖu! Thø lçi ta kh«ng gióp ®­îc!",0);
	end
end

function tigeryes()
	if(GetItemCountEx(943) >= 1 and GetItemCountEx(944) >= 3) then
		local i = random(1, 5);
		if(i > 2) then
			for j=1, 3 do 
				DelItemEx(944);			
			end
			DelItemEx(943);	
			AddEventItem(948);
			Say("Linh Chi th¶o vµ Hæ cèt th­îng h¹ng céng víi kinh nghiÖm gia truyÒn cña ta, Hæ Cèt töu nµy kh«ng ai cã thÓ chª ®­îc!",0);
			Msg2Player("NhËn ®­îc 1 b×nh Hæ Cèt töu");
			WriteLog(date("%H%M%S")..": Tµi kho¶n"..GetAccount()..", nh©n vËt"..GetName().."£¬ÄğÖÆ³öÁË1Æ¿»¢¹Ç¾Æ¡£");	
		else
			local k = random(1, 4);
			if(k > 3) then
				DelItemEx(943);
				Say("Cã 1 Linh chi ch­a ®ñ tuæi, phèi d­îc sÏ kĞm chÊt l­îng. Kh¸ch quan h·y chŞu khã ®i t×m c¸i kh¸c ®i! Ta ë ®©y chê!",0);		
			else
				DelItemEx(944);
				Say("Hæ cèt nµy ch­a ®ñ tuæi, phèi d­îc sÏ kĞm chÊt l­îng. Kh¸ch quan h·y chŞu khã ®i t×m c¸i kh¸c ®i! Ta ë ®©y chê!",0);
			end		
		end					
	else
		Say("Kh¸ch quan vÉn ch­a ®ñ d­îc liÖu! Thø lçi ta kh«ng gióp ®­îc!",0);
	end
end

function antleryes()
	if(GetItemCountEx(943) >= 1 and GetItemCountEx(945) >= 3) then
		local i = random(1, 2);
		if(i == 1) then
			for j=1, 3 do 
				DelItemEx(945);			
			end
			DelItemEx(943);	
			AddEventItem(949);
			Say("Linh Chi th¶o vµ Léc Nhung th­îng h¹ng céng víi kinh nghiÖm gia truyÒn cña ta, Léc Nhung töu nµy kh«ng ai cã thÓ chª ®­îc!",0);
			Msg2Player("NhËn ®­îc 1 b×nh Léc Nhung töu");	
			WriteLog(date("%H%M%S")..": Tµi kho¶n"..GetAccount()..", nh©n vËt"..GetName().."£¬ÄğÖÆ³öÁË1Æ¿Â¹È×¾Æ¡£");	
		else
			local k = random(1, 4);
			if(k > 3) then
				DelItemEx(943);
				Say("Cã 1 Linh chi ch­a ®ñ tuæi, phèi d­îc sÏ kĞm chÊt l­îng. Kh¸ch quan h·y chŞu khã ®i t×m c¸i kh¸c ®i! Ta ë ®©y chê!",0);		
			else
				DelItemEx(945);
				Say("Cã 1 Léc Nhung ch­a ®ñ tuæi, phèi d­îc sÏ kĞm chÊt l­îng. Kh¸ch quan h·y chŞu khã ®i t×m c¸i kh¸c ®i! Ta ë ®©y chê!",0);
			end		
		end			
	else
		Say("Kh¸ch quan vÉn ch­a ®ñ d­îc liÖu! Thø lçi ta kh«ng gióp ®­îc!",0);
	end
end

function panaxyes()
	if(GetItemCountEx(943) >= 1 and GetItemCountEx(946) >= 3) then
		local i = random(1, 4);
		if(i > 1) then
			for j=1, 3 do 
				DelItemEx(946);			
			end
			DelItemEx(943);	
			AddEventItem(950);
			Say("Linh Chi th¶o vµ Nh©n s©m th­îng h¹ng céng víi kinh nghiÖm gia truyÒn cña ta, Nh©n S©m töu nµy kh«ng ai cã thÓ chª ®­îc!",0);
			Msg2Player("NhËn ®­îc 1 b×nh Nh©n S©m töu");
			WriteLog(date("%H%M%S")..": Tµi kho¶n"..GetAccount()..", nh©n vËt"..GetName().."£¬ÄğÖÆ³öÁË1Æ¿ÈË²Î¾Æ¡£");	
		else
			local k = random(1, 4);
			if(k > 3) then
				DelItemEx(943);
				Say("Cã 1 Linh chi ch­a ®ñ tuæi, phèi d­îc sÏ kĞm chÊt l­îng. Kh¸ch quan h·y chŞu khã ®i t×m c¸i kh¸c ®i! Ta ë ®©y chê!",0);		
			else
				DelItemEx(946);
				Say("Cã 1 Léc Nhung ch­a ®ñ tuæi, phèi d­îc sÏ kĞm chÊt l­îng. Kh¸ch quan h·y chŞu khã ®i t×m c¸i kh¸c ®i! Ta ë ®©y chê!",0);
			end			
		end
	else
		Say("Kh¸ch quan vÉn ch­a ®ñ d­îc liÖu! Thø lçi ta kh«ng gióp ®­îc!",0);
	end
end

function aboutbrewing()
	Say("Bæn tiÖm chØ cÊt D­îc töu khi ®· cã ®ñ c¸c d­îc liÖu th­îng thõa. <enter>Tiªn Linh töu cÇn cã 3 Linh Chi th¶o.<enter>Hæ Cèt töu cÇn cã 1 Linh Chi th¶o vµ 3 Hæ cèt.<enter>Léc Nhung töu cÇn cã 1 Linh Chi th¶o vµ 3 Léc Nhung.<enter>Nh©n S©m töu cÇn cã 1 Linh Chi th¶o vµ 3 Nh©n S©m.",0);
end