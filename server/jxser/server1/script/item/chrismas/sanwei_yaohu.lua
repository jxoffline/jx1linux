----------------------------------------------------------------
	--FileName:	sanwei_yaohu.lua
	--Creater:	firefox
	--Date:		2005-12-19
	--Comment:	Ê¥µ®½Ú»î¶¯½±Àø¡ª¡ªÈıÎ¶Ò©ºø
	--			¹¦ÄÜ£ºÃ¿Ìì¿ÉÊ¹ÓÃ10´Î£¬Ã¿Ê¹ÓÃÒ»´Î±ãÄÜ»ñµÃÒ»¿ÅÈıÎ¶ÏÉµ¤£¨·şÓÃ¿ÉÕÇ2Íò¾­Ñé£©
-----------------------------------------------------------------
Uworld0001 = 2000
MAX_USETIME = 10
--µÚÒ»×Ö½ÚÎª±¾ÈÕÊ¹ÓÃ´ÎÊı
--µÚ¶ş×Ö½ÚÎª×îºóÊ¹ÓÃµÄÈÕÆÚ
function main()
	use_day = GetByte(GetTask(Uworld0001), 2)
	
	nDay = tonumber(date("%d"))
	if (use_day ~= nDay) then
		SetTask(Uworld0001, SetByte(GetTask(Uworld0001), 1, 0))
	end
	use_time = GetByte(GetTask(Uworld0001), 1)
	if (use_time >= MAX_USETIME) then
		Talk(1, "", "B×nh Tam VŞ D­îc mçi ngµy chØ cã thÓ tinh luyÖn"..MAX_USETIME.."viªn ®¬n d­îc.")
	else
		--AddItem()ÈıÎ¶ÏÉµ¤
		SetTask(Uworld0001, SetByte(GetTask(Uworld0001), 1, use_time + 1))
		Msg2Player("B¹n nhËn ®­îc 1 viªn Tam VŞ Tiªn §¬n")
	end
	return 1
end