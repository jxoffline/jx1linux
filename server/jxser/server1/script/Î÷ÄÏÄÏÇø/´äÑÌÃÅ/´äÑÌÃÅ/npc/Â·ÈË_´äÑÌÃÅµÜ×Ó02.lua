-- ´äÑÌÃÅ ´äÑÌÃÅµÜ×Ó2 ÈëÃÅÈÎÎñ
-- by£ºDan_Deng(2003-07-25)

Include("\\script\\global\\repute_head.lua")

function main()
	UTask_cy = GetTask(6)
	Uworld36 = GetByte(GetTask(36),2)
	if (Uworld36 == 10) then		--ÈëÃÅÈÎÎñ
		if (HaveItem(106) == 1) then
			enroll_prise()
		else
			Say("Kh«ng cã <color=Red>Hoa T×nh<color>, kh«ng thÓ v­ît qua Hoa Kh«i trËn. Tû thËt sù muèn qua trËn?",2,"LÇn nµy ta kh«ng cã chuÈn bŞ tèt /U36_uncompleted","Ta tiÕp tôc x«ng trËn /no")
		end
	elseif (GetFaction() == "cuiyan") then			-- ±¾ÃÅµÜ×Ó
		Say("S­ muéi luyÖn c«ng trong Hoa Kh«i trËn? Cã muèn rêi khái Hoa Kh«i trËn kh«ng?",2,"§­îc, ®a t¹ tû tû /U36_leave","Kh«ng cÇn, ta cßn ph¶i tiÕp tôc luyÖn c«ng /no")
	elseif (UTask_cy == 70*256) then			-- ÒÑ³öÊ¦
		Talk(1,"","Th× ra lµ S­ tû, l©u qu¸ kh«ng gÆp!")
	else
		Talk(1,"","Hoan nghªnh ®Õn Thóy Yªn m«n.")
	end
end;

function enroll_prise()
	Talk(1,"U36_leave","Chóc mõng! B¹n ®· v­ît qua thö th¸ch cña Bæn ph¸i, tõ b©y giê chóng ta lµ tû muéi tèt! ")
	DelItem(106)			-- Çé»¨
	i = ReturnRepute(20,29,5)		-- È±Ê¡ÉùÍû£¬×î´óÎŞËğºÄµÈ¼¶£¬Ã¿¼¶µİ¼õ
	AddRepute(i)
	Uworld36 = SetByte(GetTask(36),2,127)
	SetTask(36,Uworld36)
	AddNote("Hoµn thµnh nhiÖm vô Hoa Kh«i trËn, trë thµnh <color=Red>Kı Danh ®Ö tö<color> cña Thóy Yªn m«n ")
	Msg2Player("Hoµn thµnh nhiÖm vô Hoa Kh«i trËn, trë thµnh Kı Danh ®Ö tö cña Thóy Yªn m«n ")
end;

function U36_uncompleted()
	Talk(1,"U36_leave","Hoan nghªnh tû muéi x«ng trËn bÊt cø lóc nµo!")
end

function U36_leave()
--	SetPos(304,1498)
	SetPos(340,1456)
end

function no()
end
