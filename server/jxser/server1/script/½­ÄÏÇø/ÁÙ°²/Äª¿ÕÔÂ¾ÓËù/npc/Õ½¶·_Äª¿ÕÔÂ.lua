-- ½­ÄÏÇø ÁÙ°² Õ½¶·_Äª¿ÕÔÂ.lua £¨ÏûÃğ²É»¨ÔôÈÎÎñ£©
-- By: Dan_Deng(2004-05-28)

Include("\\script\\global\\repute_head.lua")

function OnDeath(sel)
	Uworld43 = GetTask(43)
	if (Uworld43 == 100) then
		Msg2Player("Vâ nghÖ cña b¹n trong trËn ®Êu víi M¹c Kh«ng NguyÖt ®· cã tiÕn triÓn kh¸ h¬n. Søc m¹nh, th©n ph¸p mçi thø t¨ng 1 ®iÓm.")
		Talk(4,"U43_prise", 10869, 10870, 10871, 10872)
	end
end;

function U43_prise()
	SetTask(43,255)
	AddProp(2)
	AddStrg(1)
	AddDex(1)
	Task88_1 = GetByte(GetTask(88),1) + 1
	Task88_2 = GetByte(GetTask(88),2) + 1
	if (Task88_1 > 255) then Task88_1 = 255 end
	if (Task88_2 > 255) then Task88_2 = 255 end
	Task88 = GetTask(88)
	Task88 = SetByte(Task88,1,Task88_1)
	Task88 = SetByte(Task88,2,Task88_2)
	SetTask(88,Task88)			-- ¼ÇÂ¼ÈÎÎñµÃÍâ¹¦µã×ÜÊı
	i = ReturnRepute(30,80,5)		-- È±Ê¡ÉùÍû£¬×î´óÎŞËğºÄµÈ¼¶£¬Ã¿¼¶µİ¼õ
	AddRepute(i)		-- ¼ÓÉùÍû
	Msg2Player("NhiÖm vô tiªu diÖt ®¹o tÆc h¸i hoa: GiÕt chÕt M¹c Kh«ng NguyÖt, nhiÖm vô hoµn thµnh. §iÓm danh väng ®­îc t¨ng lªn"..i.."®iÓm.")
	AddNote("NhiÖm vô tiªu diÖt ®¹o tÆc h¸i hoa: GiÕt chÕt M¹c Kh«ng NguyÖt, nhiÖm vô hoµn thµnh.")
end
