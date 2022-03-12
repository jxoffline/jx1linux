-- ÁÙ°²¡¡Â·ÈË¡¡ÂôË¿³ñµÄ
-- by£ºDan_Deng(2003-09-16)

function main()
	i = random(0,3)
	if (i == 0) then
		Talk(1,"","T¬ lôa th­îng h¹ng ®©y! T¬ lôa th­îng h¹ng ®©y! Kh«ng mua sÏ tiÕc hoµi ®©y!")
	elseif (i == 1) then
		Talk(1,"","Ta cã tÊt c¶ nh÷ng thø tuyÖt h¶o trªn ®êi ®©y: lôa, µ, t¬, gÊm, vãc, v¶i, ®Ünh...muèn t×m thø g× còng cã. Xin cø tïy ı lùa chän!")
	elseif (i == 2) then
		Talk(1,"","Nµo h·y nh×n ®©y! Thø nµy gäi lµ 'Tinh Quang §Ünh', Ng­¬i xem! ãng ¶ dŞu m¸t, m­ît mµ nh­ d·i ng©n hµ, quÇn tinh héi tô, tÇng tÇng ¸nh s¸ng. §©y chİnh lµ tuyÖt phÈm cña bæn gia!")
	else
		Talk(1,"","TÊm nµy lµ 'Cæ h­¬ng ®Ünh', ®­îc dÖt b»ng l«ng chim vµ tr¨m thø cá th¬m. Ng­êi cã phong th¸i ®Ünh ®¹c, kho¸c lªn l¹i cµng sang träng. Sao h¶? Thİch tÊm nµy chø?")
	end
end;
