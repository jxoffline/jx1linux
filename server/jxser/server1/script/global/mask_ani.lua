

ItemType	=	{{"Y phôc","NhÉn","D©y chuyÒn","Giµy","Th¾t l­ng","Nãn","Thñ Tr¹c","Ngäc Béi"},{1,2,1,1,1,1,1,1}}

function hello()

	Say("BiÕn! BiÕn! BiÕn! Muèn cã cÆp m¾t cña chim ­ng, ®«i tai cña loµi sãi, søc m¹nh cña loµi gÊu, muèn lµm vua cña loµi vËt? ë ®©y ta sÏ cho ng­¬i ­íc m¬ thµnh hiÖn thËt.",3,"Cã thÇn kú vËy kh«ng? §Ó ta thö xem/exchange_mask", "Hay thËt ®ã! Nãi ra xem thö ®i!/about","§õng x¹o n÷a, ta kh«ng tin ®©u!/no")

end

function exchange_mask()

	GiveItemUI( "Kú Tr©n b¶o vËt", "Ng­¬i ph¶i chuÈn bŞ ngoµi vò khİ lµ 9 bé <color=blue>trang bŞ mµu xanh <color> vµ <color=blue>20 v¹n <color>ng©n l­îng, th× cã c¬ héi nhËn ®­îc mét MÆt n¹ thÇn kú. Xin chó ı, khi ®æi MÆt n¹ cã thµnh c«ng hay kh«ng th× trang bŞ vµ ng©n l­îng còng sÏ biÕn mÊt!", "exchange_mask_Confirm", "onCancel" );
	
end

function exchange_mask_Confirm( nCount )

	isItemType = {0,0,0,0,0,0,0,0}
	if ( nCount ~= 9 ) then
		Say("Xin h·y kiÓm tra l¹i, trang bŞ ng­¬i ®­a ta kh«ng phï hîp víi yªu cÇu!",0)
		return 0
	else
		for i = 1, nCount do
			local nItemIndex = GetGiveItemUnit( i )
			ItemGenre, DetailType, ParticularType, Level, nSeries, Luck = GetItemProp(nItemIndex)
			magictype , p1, p2, p3 = GetItemMagicAttrib(nItemIndex, 1)
			if ( ItemGenre ~= 0 ) then
				Say("Xin h·y kiÓm tra l¹i, trang bŞ ng­¬i ®­a ta kh«ng phï hîp víi yªu cÇu!",0)
				return 0
			elseif ( DetailType == 0 ) then
				Say("B«n ba giang hå kh«ng ph¶i chuyÖn dÔ ®©u, thiÕu hiÖp h·y gi÷ lÊy vò khİ ®Ó phßng th©n ®i",0)
				return 0
			elseif ( DetailType == 10 ) then
				Say("§i ®­êng mÖt mái thÕ nµy, tr¸ng sÜ cÇn con ngùa nµy h¬n ta ®ã!",0)
				return 0
			elseif ( DetailType == 11 ) then
				Say("ë ®©y ta nhiÒu MÆt n¹ l¾m, ®Ó b¹n tù lÊy vËy!",0)
				return 0
			elseif ( DetailType > 11 ) then
				Say("Xin h·y kiÓm tra l¹i, trang bŞ ng­¬i ®­a ta kh«ng phï hîp víi yªu cÇu!",0)
				return 0
			else
				if ( magictype == 0 ) then
					Say("Víi kinh nghiÖm bu«n b¸n l©u n¨m cña Ta muèn ®em trang bŞ mµu tr¾ng qua mÆt ta µh, kh«ng dÔ ®©u!",0)
					return 0
				else
					isItemType[DetailType - 1] = isItemType[DetailType - 1] + 1
				end
			end
		end
	end
	if ( (ItemType[2][1] == isItemType[1]) and (ItemType[2][2] == isItemType[2]) and (ItemType[2][3] == isItemType[3]) and (ItemType[2][4] == isItemType[4]) and (ItemType[2][5] == isItemType[5]) and (ItemType[2][6] == isItemType[6]) and (ItemType[2][7] == isItemType[7]) and (ItemType[2][8] == isItemType[8]) ) then
		onPay = 200000
		if ( GetCash() < onPay ) then
			Say("MÆt n¹ cña ta kh«ng gièng nh­ c¸c thø kh¸c ®©u, 20 v¹n l­îng lµ rÏ råi ®Êy, cã tiÒn råi h·y ®Õn t×m ta ®i!",1,"§­îc! §Ó ta vÒ lÊy tiÒn, nhí ®Ó l¹i cho ta mét c¸i ®Êy!")
			return 0
		end
		for i = 1, nCount do
		
			nItemIndex = GetGiveItemUnit( i )
			k = RemoveItemByIndex( nItemIndex )
			if ( k ~= 1 ) then
				Say("ChuyÖn g× vËy, sao ng­¬i cã thÓ g¹t ta?",0)
				return 0
			end
			
		end
		Pay( onPay )
		iGive = random (1,400000)
		if ( iGive < 10000 ) then
			AddItem(0,11,23,0,0,0,0)     --¶«±±»¢
			Say("Tèt l¾m! Xin lÊy MÆt n¹ nµy!",0)
			
		elseif ( iGive < 20000 ) then
			AddItem(0,11,31,0,0,0,0)     --Ñ©ÀÇ
			Say("Tèt l¾m! Xin lÊy MÆt n¹ nµy!",0)
		elseif ( iGive < 40000 ) then
			AddItem(0,11,38,0,0,0,0)     --×ØĞÜ
			Say("Tèt l¾m! Xin lÊy MÆt n¹ nµy!",0)
		elseif ( iGive < 50000 ) then
			AddItem(0,11,61,0,0,0,0)     --½ğË¿ºï
			Say("Tèt l¾m! Xin lÊy MÆt n¹ nµy!",0)
		elseif ( iGive < 60000 ) then
			AddItem(0,11,63,0,0,0,0)     --Ñ©¹Ö
			Say("Tèt l¾m! Xin lÊy MÆt n¹ nµy!",0)
		elseif ( iGive < 70000 ) then
			AddItem(0,11,65,0,0,0,0)     --Ã·»¨Â¹
			Say("Tèt l¾m! Xin lÊy MÆt n¹ nµy!",0)
		elseif ( iGive < 80000 ) then
			AddItem(0,11,66,0,0,0,0)     --°×Öí
			Say("Tèt l¾m! Xin lÊy MÆt n¹ nµy!",0)
		else
			Say("Giê nµy tíi phiÒn ta, xem nh­ ng­¬i ®· uæng c«ng råi!",1,"Xem nh­ ta kh«ng may vËy! §Ó t©m tr¹ng ta tèt h¬n råi míi ®Õn t×m ng­¬i!/no")

		end
	else
		Talk(1,"","Xin h·y kiÓm tra l¹i, trang bŞ ng­¬i ®­a ta kh«ng phï hîp víi yªu cÇu!")
	end
	
end

function about()

	Say("Ng­¬i ph¶i chuÈn bŞ ngoµi vò khİ lµ 9 bé <color=blue>trang bŞ mµu xanh <color> vµ <color=blue>20 v¹n <color>ng©n l­îng, th× cã c¬ héi nhËn ®­îc mét MÆt n¹ thÇn kú. Xin chó ı, khi ®æi MÆt n¹ cã thµnh c«ng hay kh«ng th× trang bŞ vµ ng©n l­îng còng sÏ biÕn mÊt!",1,"Oh! Ta hiÓu råi, c¸m ¬n!/no")
end


function no()

end
