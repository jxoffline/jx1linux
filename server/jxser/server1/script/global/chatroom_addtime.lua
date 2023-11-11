MONEY_ADDLIFETIME = 1000000

function Checkup()
	-- ÒòÎªÍ¨¹ıÊ¹ÓÃÎïÆ·Ôö¼ÓÁÄÌìÊÒÊ±¼ä£¬¼ì²é½ğÇ®µÄ´úÂë·Åµ½\\item\\chatroom\\pay.luaÖĞ
	return 1
end

function Consume()
	if (DelCommonItem(6,1,1062) == 1) then
		Msg2Player("<#><color=green>Thªm giê thµnh c«ng<color>!")
		return 1
	end
	return 0
end
