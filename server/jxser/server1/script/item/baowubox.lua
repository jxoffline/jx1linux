-- Ëæ»ú±¦ÏäÎïÆ·£¨Ëæ»ú»ñµÃÒ»ÑùÎïÆ·£©
-- By: Yuning_liu(2005-03-21)

function main(sel)
	p=random(0,99)
	if (p < 1) then
		p = random(238,240)
		AddEventItem(p)			-- Ë®¾§
		Msg2Player("B¹n nhËn ®­îc mét viªn Thñy Tinh. ")
	elseif (p < 2) then
		AddEventItem(353)			-- ĞÉºì
		Msg2Player("B¹n nhËn ®­îc mét viªn Tinh Hång B¶o Th¹ch. ")
	elseif (p < 33) then
		AddItem(6,1,15,1,0,0,0)		-- Åû·ç
		Msg2Player("B¹n nhËn ®­îc mét tÊm ¸o kho¸c. ")
	elseif (p < 66) then
		AddItem(6,1,18,1,0,0,0)		-- ĞÄĞÄÏàÓ¡
		Msg2Player("B¹n nhËn ®­îc mét c¸i T©m T©m T­¬ng Ên phï! ")
	else
		AddItem(6,0,20,1,0,0,0)		-- Ãµ¹åÓê
		Msg2Player("B¹n nhËn ®­îc mét cµnh hoa hång. ")
	end
	return 0
end
