----------------------------------------------------------------
	--FileName:	xunwu_hou.lua
	--Creater:	firefox
	--Date:		2005-12-19
	--Comment:	Ê¥µ®½Ú»î¶¯½±Àø¡ª¡ªÑ°Îïºï
	--			¹¦ÄÜ£ºÃ¿Ìì¿ÉÊ¹ÓÃ10´Î£¬Ã¿Ê¹ÓÃÒ»´Î±ãÄÜËæ»ú»ñµÃÒ»¼ş×°±¸
-----------------------------------------------------------------
Uworld0001 = 2001
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
		Talk(1, "", "Nh÷ng con khØ ®· ngñ say hÕt råi! B¹n h·y mau ®Õn b¾t nã!")
	else
		--AddItem()
		SetTask(Uworld0001, SetByte(GetTask(Uworld0001), 1, use_time + 1))
		Msg2Player("B¹n nhËn ®­îc 1 bé trang bŞ ngÉu nhiªn")
	end
	return 1
end