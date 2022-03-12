----------------------------------------------------------------
	--FileName:	juebi_xiancao.lua
	--Creater:	firefox
	--Date:		2005-12-19
	--Comment:	Ê¥µ®½Ú»î¶¯½±Àø¡ª¡ª¾ø±ÚÏÉ²İ
	--			¹¦ÄÜ£ºÃ¿Ìì¿ÉÊ¹ÓÃ10´Î£¬Ã¿Ê¹ÓÃÒ»´Î±ãÄÜ»ñµÃÒ»Æ¬ÏÉ²İÒ¶£¨·şÓÃ¿É»ñµÃ10·ÖÖÓ¾­ÑéË«±¶£©
-----------------------------------------------------------------
Uworld0001 = 2002
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
		Talk(1, "", "Tiªn Th¶o DiÖp trªn v¸ch ®¸ ®· bŞ b¹n h¸i s¹ch, ®µnh ph¶i ®îi ngµy mai th«i!")
	else
		--AddItem()ÏÉ²İÒ¶
		SetTask(Uworld0001, SetByte(GetTask(Uworld0001), 1, use_time + 1))
		Msg2Player("B¹n nhËn ®­îc 1 phiÕn Tiªn Th¶o DiÖp")
	end
	return 1
end