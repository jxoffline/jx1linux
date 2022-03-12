-- ÉÙÁÖ Â·ÈËNPC ³ÎĞÄ£¨50¼¶ÈÎÎñ£©
-- by£ºDan_Deng(2003-08-04)

function main()
	UTask_sl = GetTask(7)
	if (UTask_sl == 50*256+10)then		-- 50¼¶ÈÎÎñ½øĞĞÖĞ
		Talk(1,"","Ta biÕt mét bİ mËt nhá vÒ TrÇn ViÔn s­ huynh, nÕu muèn biÕt th× mau mau lµm con gµ n­íng cho ta ¨n, ngµy nµo còng ¨n chay, thËt ch¸n chÕt ®i ®­îc!")
		SetTask(7,50*256+20)
		AddNote("Trõng T©m biÕt ®­îc bİ mËt cña Trõng ViÔn, nh­ng ph¶i hèi lé gµ quay th× míi nãi. ")
		Msg2Player("Trõng T©m biÕt ®­îc bİ mËt cña Trõng ViÔn, nh­ng ph¶i hèi lé gµ quay th× míi nãi. ")
	elseif (UTask_sl == 50*256+20) then
		if (HaveItem(123) == 1) then
			Talk(1,"","Oh, gµ n­íng ngon qu¸ ®i! GhĞ tai tíi ®©y ta nãi cho nghe bİ mËt: N¨m x­a tr­íc khi Tr×nh ViÔn s­ huynh chÕt ®· viÕt bèn sè lªn ®Êt lµ: 4, 5, 3. Nh­ng kh«ng ai hiÓu ®­îc ı nghÜa ®ã lµ g×!")
			Msg2Player("§em gµ quay cho Trõng T©m, ®­îc h¾n chØ: N¨m x­a Trõng ViÔn ®· viÕt ra trªn ®Êt ba con sè: 4, 5, 3. ")
			AddNote("§em gµ quay cho Trõng T©m, ®­îc h¾n chØ: N¨m x­a Trõng ViÔn ®· viÕt ra trªn ®Êt ba con sè: 4, 5, 3. ")
			DelItem(123)
			SetTask(7,50*256+30)
		else
			Talk(1,"","Ta biÕt mét bİ mËt nhá vÒ TrÇn ViÔn s­ huynh, nÕu muèn biÕt th× mau mau lµm con gµ n­íng cho ta ¨n, ngµy nµo còng ¨n chay, thËt ch¸n chÕt ®i ®­îc!")
		end
	else							-- ³£¹æ¶Ô»°
		Talk(1,"","Ph­¬ng tr­îng nhu nh­îc qu¸, nÕu cø tiÕp tôc nh­ vËy ng­êi Kim sÏ ®Ì ®Çu c­ìi cæ chóng ta mµ ®i ®ã.")
	end
end;
