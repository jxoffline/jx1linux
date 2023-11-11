function open_killplayer(tab)
	--dofile("script/miniskill/ui.lua")
	OpenBattleSelect()
	SetBattleSelectInfo(0, tab)
	SetBattleSelectInfo(1, "")
	SetBattleSelectInfo(2, "")
	SetBattleSelectInfo(3, "")
	--SetBattleSelectInfo(0, "<color=red>Bπn Æ∑ gi’t ai Æ„ \nBπn Æ∑ gi’t ai Æ„ \nBπn Æ∑ gi’t ai Æ„ \nBπn Æ∑ gi’t ai Æ„ \nBπn Æ∑ gi’t ai Æ„ \n")
end
--function open_miniskill(tab)
--	local final_buff = tab[1]
--	local  final_debuff = tab[2]
--	OpenBattleSelect()
--	SetBattleSelectInfo(2, final_buff)
--	SetBattleSelectInfo(3, final_debuff)	
--end
