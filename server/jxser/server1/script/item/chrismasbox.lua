-- Ëæ»úÊ¥µ®ÀñÆ·ºĞ£¨Ëæ»ú»ñµÃÒ»¸ö½ÚÈÕÃæ¾ß£©
-- By: zhengfei(2004-12-13)

function main(sel)
	p=random(0,99)
	if (p < 50) then
		AddItem(0,11,70,0,0,0,0)		-- Ê¥µ®ÀÏÈË
		Msg2Player("Gi¸ng Sinh vui vÎ! B¹n nhËn ®­îc 1 MÆt n¹ ¤ng giµ Noel!")
	else
		AddItem(0,11,71,0,0,0,0)	        -- Ê¥µ®ÌìÊ¹
		Msg2Player("Gi¸ng Sinh vui vÎ! B¹n nhËn ®­îc 1 MÆt n¹ Thiªn Sø Gi¸ng sinh!")
	end
	return 0
end
