--ÓÃ¸øÓè½çÃæÊµÏÖ£¬ÓÃÎå¼şÎäÆ÷£¬°üº¬½ğ¡¢Ä¾¡¢Ë®¡¢»ğ¡¢ÍÁÎåĞĞ¸÷Ò»¼ş£¬¿É»»È¡Ò»¸öÀ¬»ø½äÖ¸
--designed by yangqi
--written by renbin

function weapon_ring()

	Say("GÇn ®©y nhÉn quı trªn giang hå hiÕm, ta nh©n c¬ héi ®i häc ph­¬ng ph¸p lµm nhÉn, chØ cÇn ng­¬i chuÈn bŞ mét bé vô khİ cã ®ñ 5 thuéc tİnh ngò hµnh vµ 10 v¹n l­îng, ta sÏ gióp ®æi mét nhÉn thuéc tİnh mµu xanh, ng­¬i muèn ®æi kh«ng?",3,"§­îc, ta ®ang cÇn mét chiÕc nhÉn ®©y!/exchange_weapon","§Ó ta t×m hiÓu c¸i ®·!/weapon_help","Th«i bá ®i, ta cã nhÉn råi!/no")

end

function exchange_weapon()

	GiveItemUI( "Vò khİ ngò hµnh ®æi nhÉn", "B¹n cÇn chuÈn bŞ vò khİ ngò hµnh ph©n biÖt cã Kim, Méc, Thñy, Háa, Thæ, chØ cÇn <color=blue>®Çy ®ñ ngò hµnh<color>, ®ång thêi ph¶i cã<color=blue> thuéc tİnh mµu xanh<color>, th× cã thÓ ®æi ®­îc mét chiÕc nhÉn.<color=blue> §¼ng cÊp vò khİ vµ chñng lo¹i kh«ng cã h¹n chÕ, mçi lÇn nh­ vËy chØ tèn 10 v¹n l­îng, x¸c suÊt 100%.<color>", "weapon_ring_Confirm", "onCancel" );
	
end

function weapon_ring_Confirm( nCount )

	onSeries = {1,1,1,1,1}
	if ( nCount ~= 5 ) then						--are there 5 weapons
		Say("Xin kiÓm tra kü, vò khİ b¹n ®­a ta kh«ng phï hîp yªu cÇu!",0)
		return 0
	else
		for i = 1, nCount do
			local nItemIndex = GetGiveItemUnit( i )		--get itemindex
			ItemGenre, DetailType, ParticularType, Level, nSeries, Luck = GetItemProp(nItemIndex)
			magictype , p1, p2, p3 = GetItemMagicAttrib(nItemIndex, 1)	--get magic attrib
--			Msg2Player("nSeries = "..nSeries)
--			Msg2Player("magictype = "..magictype)
			if ( ItemGenre ~= 0 ) then
				Say("Xin kiÓm tra kü, vò khİ b¹n ®­a ta kh«ng phï hîp yªu cÇu!",0)
				return 0
			elseif ( DetailType ~= 0 and DetailType ~= 1) then					--is it weapon
				Say("Xin kiÓm tra kü, vò khİ b¹n ®­a ta kh«ng phï hîp yªu cÇu!",0)
				return 0
			elseif ( magictype == 0 ) then
				Say("Víi kinh nghiÖm bu«n b¸n l©u n¨m cña Ta muèn ®em trang bŞ mµu tr¾ng qua mÆt ta µh, kh«ng dÔ ®©u!",0)
				return 0
			elseif ( nSeries < 0 and nSeries > 4 ) then			--exception
				Say("Trang bŞ cña ng­¬i l¹ qu¸ ®i! Tr¶ l¹i cho ng­¬i!",0)
				return 0
			elseif ( onSeries[nSeries + 1] == 0 ) then				--ÎåĞĞÊôĞÔÊÇ·ñÆëÈ«
				Say("Xin kiÓm tra kü, vò khİ ng­¬i ®­a ta kh«ng ®ñ thuéc tİnh ngò hµnh!",0)
				return 0
			else
				onSeries[nSeries + 1] = 0
			end
		end
			onPay = 100000
			if ( GetCash() < onPay ) then
				Say("Kh«ng cã tiÒn th× kh«ng ®­îc råi, mÊy mãn ®å nµy sao ®æi ®­îc nhÉn ®©y!",0)
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
			local _nSeed = SetRandSeed(234)					--¹Ì¶¨µÄ½äÖ¸
			AddItem(0,3,0,1,0,0,1,0,0,0,0,0)     			--½äÖ¸
			SetRandSeed(_nSeed)
			Say("Uhm~®å cña ng­¬i ®· ®­îc x¸c ®Şnh, ta nhËn ®©y, chiÕc nhÉn nµy lµ cña ng­¬i!",0)
		
	end
	
end

function weapon_help()

	Say("B¹n cÇn chuÈn bŞ vò khİ ngò hµnh ph©n biÖt cã Kim, Méc, Thñy, Háa, Thæ, chØ cÇn <color=blue>®Çy ®ñ ngò hµnh<color>, ®ång thêi ph¶i cã<color=blue> thuéc tİnh mµu xanh<color>, th× cã thÓ ®æi ®­îc mét chiÕc nhÉn.<color=blue> §¼ng cÊp vò khİ vµ chñng lo¹i kh«ng cã h¹n chÕ, mçi lÇn nh­ vËy chØ tèn 10 v¹n l­îng, x¸c suÊt 100%.<color>",1,"Oh! Ta hiÓu råi, c¸m ¬n!/no")

end


function no()

end
