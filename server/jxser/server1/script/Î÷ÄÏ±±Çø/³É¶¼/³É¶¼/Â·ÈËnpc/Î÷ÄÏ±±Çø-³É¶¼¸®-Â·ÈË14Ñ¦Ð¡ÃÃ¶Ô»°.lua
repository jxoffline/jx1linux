--Î÷ÄÏ±±Çø ³É¶¼¸® Â·ÈË14Ñ¦Ğ¡ÃÃ¶Ô»°  ¶ëáÒÅÉ40¼¶ÈÎÎñ
--author: yuanlan	
--date: 2003/5/23
-- Update: Dan_Deng(2003-08-12)
-- ĞŞ¸ÄDan_Deng µÄ´íÎó£ºQBJ(2003-10-3)

function main(sel)
	UTask_em = GetTask(1)
	UTask_emsub01 = GetByte(GetTask(29),1)
	if (UTask_em == 40*256+50) then		-- 40¼¶ÈÎÎñÖĞ
		if (UTask_emsub01 == 0) then
			Talk(5, "", "VŞ ®¹i tû nµy, ë cïng víi muéi, cã phiÒn kh«ng? ", "Kh«ng tiÖn! V× trªn ng­êi muéi cã mét mïi kú l¹,nªn… ", "A! Tû ngöi ®­îc µ? Muéi dïng Linh X¹ H­¬ng Nan, h­¬ng liÖu nµy chØ ë T©y Vùc míi cã!", "Th× ra lµ Linh X¹ H­¬ng Nang! Th¶o nµo mïi th¬m quyÕn rò! Muéi cã thÓ b¸n cho ta tói Linh X¹ H­¬ng Nang nµy ®­îc kh«ng? Ta ®ang cÇn ®Ó cøu ng­êi!", "B¸n th× kh«ng b¸n! Nh­ng muéi nghe nãi tiÖm t¹p ho¸ ë trong thµnh gÇn ®©y cã mét c©y tr©m b¹c ®Ñp, tû lÊy c©y tr©m ®ã ®Õn ®æi víi ta")
			SetTask(29,SetByte(UTask_emsub01,1,1))			-- ÉèÖÃtask(29)µÚ1¸ö×Ö½ÚÎª1
--			SetTask(29, 2)	
			AddNote("GÆp TiÕt TiÓu muéi (383, 315) t×m ®­îc Linh X¹ H­¬ng Nang, nh­ng ph¶i lÊy Ng©n Tr©m ®æi. ")
			Msg2Player("TiÕt TiÓu muéi xin ®Ò nghŞ lÊy Ng©n Tr©m ®Ó ®æi lÊy Linh X¹ H­¬ng Nang ")
		elseif ((UTask_emsub01 == 1) and (HaveItem(63) == 1)) then
			Say("Tr©m b¹c nµy ®Ñp qu¸! H­¬ng nang nµy ®æi cho tû ®©y!", 1, "T×m ®­îc Linh X¹ H­¬ng Nang /get")
			DelItem(63)
			AddEventItem(166)
			SetTask(29,SetByte(UTask_emsub01,1,10))
--			SetTask(29, 2)
			AddNote("NhËn ®­îc Linh X¹ H­¬ng Nang tõ chç TiÕt TiÓu muéi ")
			Msg2Player("T×m ®­îc Linh X¹ H­¬ng Nang ")
		elseif (UTask_emsub01 == 10) and (HaveItem(166) == 0) then
			AddEventItem(166)
			Talk(1,"","CÇm lÊy nµy! H­¬ng Nang ch­a lÊy ®· véi vµng ch¹y ®i!")
		else
			Talk(1,"","§¹i tû! §õng cã c¶n trë viÖc lµm ¨n cña muéi cã ®­îc kh«ng?")
		end
	else
		Talk(1,"","§¹i tû! §õng cã c¶n trë viÖc lµm ¨n cña muéi cã ®­îc kh«ng?")
	end
end;

function get()
end;
