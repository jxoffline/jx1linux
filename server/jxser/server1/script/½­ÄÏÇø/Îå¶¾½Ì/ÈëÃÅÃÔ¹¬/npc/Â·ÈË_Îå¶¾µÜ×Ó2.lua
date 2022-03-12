-- Îå¶¾ Â·ÈËNPC Îå¶¾µÜ×Ó2 ÈëÃÅÈÎÎñ£¨Íê³É£©
-- by£ºDan_Deng(2003-08-05)

Include("\\script\\global\\repute_head.lua")

function main()
	Uworld37 = GetByte(GetTask(37),2)
	if (Uworld37 == 10) then		-- ÈëÃÅÈÎÎñÍê³É
		if (HaveItem(227) == 1) and (HaveItem(223) == 1) and (HaveItem(224) == 1) and (HaveItem(225) == 1) and (HaveItem(226) == 1) then
			enroll_prise()
		else
			Talk(1,"","Thêi gian luyÖn c«ng vÉn ch­a ®ñ, t¹i sao ng­¬i l¹i ra ®©y?")
		end
	else							-- ³£¹æ¶Ô»°
		Talk(1,"","Trong ®éng Ngò §éc rÊt nguy hiÓm, ng­¬i chí cã ®i l¹i lung tung ")
	end
end;

function enroll_prise()
	Talk(1,"","N¨m Khæng t­íc vò ®· gom ®ñ. Hay l¾m! VËy lµ ng­¬i ®· chİnh thøc trë thµnh ®Ö tö kı danh cña bæn m«n råi")
	DelItem(227)
	DelItem(223)
	DelItem(224)
	DelItem(225)
	DelItem(226)
	i = ReturnRepute(25,29,5)		-- È±Ê¡ÉùÍû£¬×î´óÎŞËğºÄµÈ¼¶£¬Ã¿¼¶µİ¼õ
	AddRepute(i)
	Uworld37 = SetByte(GetTask(37),2,127)
	SetTask(37,Uworld37)
	AddNote("Hoµn thµnh nhiÖm vô luyÖn c«ng ë Ngò §éc ®éng, Chİnh thøc trë thµnh <color=red>Kı Danh ®Ö tö<color> cña bæn m«n. ")
	Msg2Player("Hoµn thµnh nhiÖm vô luyÖn c«ng ë Ngò §éc ®éng, Chİnh thøc trë thµnh Kı Danh ®Ö tö cña bæn m«n. ")
end;
