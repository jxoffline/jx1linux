
function talk_yulongtie()
	Say("§©y lµ thiÖp mêi mµ Ngäc Long Trang Chñ ®­a cho c¸c anh hïng hµo kiÖt  trong thiªn h¹, kh«ng ph¶i ai còng cã thÓ cã ®­îc nã.",
		2,
		"Ta sö dông Nh¹c V­¬ng Hån Th¹ch ®Ó ®æi/get_yulongtie",
		"§Ó ta suy nghÜ l¹i/Cancel")
end

-- ÓÃÔÀÍõ»êÖ®Ê¯»»È¡îÚÁúÓ¢ĞÛÌû
function get_yulongtie()
	if (CalcEquiproomItemCount(4, 507, 1, -1) < 1) then
		Say("Ng­¬i kh«ng cã Nh¹c V­¬ng Hån Th¹ch, tiÕp tôc ®i luyÖn thªm råi h·y ®Õn nhĞ.")
	else
		Say("Ng­¬i x¸c ®Şnh dïng Nh¹c V­¬ng Hån Th¹ch ®Ó ®æi lÊy Ngäc Long anh Hïng ThiÕp ®Ó ®i vµo KiÕm Gia Mª Cung chø?",
			2,
			"Muèn/exchange_yulongtie",
			"§Ó ta suy nghÜ l¹i/Cancel")	
	end
end

function exchange_yulongtie()
	if (CalcFreeItemCellCount() == 0) then
		Say("Chç trèng hµnh trang kh«ng ®ñ.")
	elseif (CalcEquiproomItemCount(4, 507, 1, -1) >= 1 and 
		ConsumeEquiproomItem(1, 4, 507, 1, -1) == 1) then
		AddItem(6, 1, 2622, 1, 0, 0)
		Msg2Player("Ng­¬i nhËn ®­îc 1 Ngäc Long Anh Hïng ThiÕp.")
	end
end
