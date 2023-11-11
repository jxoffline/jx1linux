--ÁúÈª´å Â·ÈË ¿×Ïş
--ÁúÈª´åĞÂÊÖÈÎÎñ£ººóµùºÃ²»ºÃ
-- By: Dan_Deng(2003-09-03)

function main(sel)
	UTask_world18 = GetTask(18)
	if (UTask_world18 == 3) then		-- ÈÎÎñÖĞ
		Talk(5,"W18_step","Khæng HiÓu! Cã ph¶i ng­¬i rÊt ghĞt ng­êi cha sau kh«ng?","T¹i sao ng­êi l¹i nãi nh­ vËy?","Kh«ng ph¶i sao?","§­¬ng nhiªn lµ kh«ng! ¤ng Êy lµ mét ng­êi tèt. §èi ®·i víi mÑ con ta rÊt tèt!","ThËt vËy ­? VËy th× tèt råi NÕu biÕt ®­îc nh­ vËy th× «ng Êy sÏ rÊt vui")
	else				-- ·ÇÈÎÎñ¶Ô»°
		Talk(1,"","MÑ con ta tr­íc ®©y ®Òu bŞ mäi ng­êi khinh rÎ,tõ khi ®­îc «ng Êy b¶o bäc th× mäi thø ®Òu ®· thËt sù thay ®æi")
	end
end;

function W18_step()
	SetTask(18,6)
	Talk(1,"","… ")
	AddNote("§· hiÓu ®­îc t©m t­ cña Khæng HiÓu, lËp tøc ®i nãi l¹i víi «ng chñ t¹p hãa cho «ng Êy yªn t©m ")
	Msg2Player("§· hiÓu ®­îc t©m t­ cña Khæng HiÓu, lËp tøc ®i nãi l¹i víi «ng chñ t¹p hãa cho «ng Êy yªn t©m ")
end
