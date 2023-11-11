 Include("\\script\\task\\newtask\\newtask_head.lua")
 
function IsPickable( nItemIndex, nPlayerIndex )
	return 1
end
 
function PickUp( nItemIndex )
	local Uworld1065 = nt_getTask(1065)+1
	local Uworld1066 = nt_getTask(1066)
	local Uworld1000 = nt_getTask(1000)
	nt_setTask(1065,Uworld1065)
	if ( Uworld1000 == 10 ) and ( Uworld1065 >= 3 ) then 
		Msg2Player("B¹n ®· nhËn ®­îc 3 miÕng thŞt t­¬i, cã thÓ ®èi tho¹i víi Vâ s­..")
	elseif ( Uworld1000 == 180) and ( Uworld1065 >= 5 ) then
		Msg2Player("B¹n ®· nhËn ®­îc 5 miÕng thŞt t­¬i, cã thÓ ®èi tho¹i víi Vâ s­..")
	elseif ( Uworld1065 == 1 ) and ( Uworld1066 == 0 ) then
		Msg2Player("B¹n cã thÓ ®Õn c¸c Vâ s­ ë c¸c T©n Thñ Th«n nhËn 1 vµi nhiÖm vô mua b¸n thŞt t­¬i. Khi b¹n lµm nhiÖm vô nµy cã thÓ ®­îc tiÒn vµ danh väng.")
	elseif ( Uworld1066 ~= 0 ) then
		if ( Uworld1066 == Uworld1065 ) then
			Msg2Player("B¹n ®· nhËn ®­îc ®ñ thŞt t­¬i, cã thÓ trë vÒ t×m Vâ s­ giao nhiÖm vô.")
		end
	end
	return 0 ; --É¾³ıÎïÆ·
end