-- ÁÙ°²¡¡Ö°ÄÜ¡¡¾ÆµêÀÏ°å
-- by£ºDan_Deng(2003-09-16)

function main()
	i = random(0,2)
	if (i == 0) then
		Talk(1,"","Kh¸ch quan, xin mêi ngåi! Ngµi dïng g×?")
	elseif (i == 1) then
		Talk(1,"","Danh töu ®Æc s¶n thµnh L©m An chóng ta, mçi n¨m thuÕ r­îu ®Òu ®ãng nhiÒu nhÊt c¶ n­íc. R­îu L©m An chóng ta kh¸c víi nh÷ng n¬i kh¸c, n­íc nÊu r­îu lµ lÊy ë tËn T©y Hå, v× vËy mµ uèng vµo miÖng rÊt cay mµ ngät. ")
	else
		Talk(1,"","R­îu næi tiÕng nhÊt Tóy Tiªn lÇu chóng ta gäi lµ 'T©y Tö Ngäc Nh­ìng', kh¸ch quan cã muèn dïng thö kh«ng? ")
	end
end;
