-- ÉÙÁÖ Â·ÈËNPC Öª¿ÍÉ® ÈëÃÅÈÎÎñ
-- by£ºDan_Deng(2003-08-01)

Include("\\script\\global\\repute_head.lua")

function main()
	UTask_sl = GetTask(7)
	Uworld38 = GetByte(GetTask(38),2)
	if (Uworld38 == 20) and (HaveItem(219) == 1) then		-- ÈÎÎñÍê³É(Ö¤Ã÷ÊéĞÅ)
		Talk(1,"enroll_prise","Th× ra lµ giÊy tê tïy th©n cña huynh Êy, th«i còng ®­îc.")
	elseif (Uworld38 == 0) and (GetLevel() >=10) and (GetFaction() ~= "shaolin") then		--ÈëÃÅÈÎÎñ
		Say("§Ö tö bæn m«n cÇn ph¶i cã ®ñ bèn ®iÒu kiÖn, ph©n biÖt lµ: Anh dòng gan d¹, h¹o nhiªn ch¸nh khİ, kiªn nhÉn bÊt khuÊt vµ v« t­ v« ng·. Ng­¬i muèn lµm kı danh ®Ö tö cña bæn ph¸i cÇn ph¶i cã nh÷ng ®iÒu kiÖn nµy, ng­¬i tiÕp nhËn kh¶o nghiÖm kh«ng?",2,"Tu©n lÖnh!/enroll_get_yes","Kh«ng, ta chØ ®Õn tham quan. /enroll_get_no")
	elseif (GetFaction() == "shaolin") then
		Talk(1,"","S­ ®Ö cÇn ph¶i chó ı b¶o vÖ sù trang nghiªm cña bæn tù, kh«ng ®­îc ch¹y nh¶y lung tung, la lèi om sßm.")
	else							-- ³£¹æ¶Ô»°
		if (GetSex() == 0) then
			Talk(1,"","Thİ chñ ®õng nªn mang theo binh khİ vµo tù.")
		else
			Talk(1,"","N÷ kh¸ch kh«ng ®­îc vµo trong tù.")
		end
	end
end;

function enroll_get_yes()
	Talk(1, "", "§­îc! Ng­¬i h·y h¹ s¬n du ngo¹n, héi ®ñ bèn ®iÒu kiÖn xong råi míi trë l¹i ®©y ta sÏ nãi tiÕp.")
	Uworld38 = SetByte(GetTask(38),2,10)
	SetTask(38,Uworld38)
	AddNote("Chøng minh cho Tri Kh¸ch T¨ng cã c¸c phÈm chÊt: Xİch ®¶m trung t©m, h¹o nhiªn chİnh khİ, kiªn nhÉn bÊt b¹t vµ v« t­ v« ng·. ")
	Msg2Player("Chøng minh cho Tri Kh¸ch T¨ng cã c¸c phÈm chÊt: Xİch ®¶m trung t©m, h¹o nhiªn chİnh khİ, kiªn nhÉn bÊt b¹t vµ v« t­ v« ng·. ")
end;

function enroll_get_no()
end;

function enroll_prise()
	Talk(1,"","Xem ra ng­¬i ®· héi ®ñ bèn phÈm chÊt ®ã! Chóc mõng ng­¬i, tõ nµy vÒ sau ng­êi ®· trë thµnh ®Ö tö kı danh cña bæn ph¸i råi!")
	DelItem(219)
	i = ReturnRepute(12,29,2)		-- È±Ê¡ÉùÍû£¬×î´óÎŞËğºÄµÈ¼¶£¬Ã¿¼¶µİ¼õ
	AddRepute(i)
	Uworld38 = SetByte(GetTask(38),2,127)
	SetTask(38,Uworld38)
	Msg2Player("Hoµn thµnh nhiÖm vô kı danh ®Ö tö cña ThiÕu L©m ph¸i, trë thµnh ®Ö tö ThiÕu L©m, danh väng t¨ng lªn. "..i.."®iÓm.")
	AddNote("Hoµn thµnh nhiÖm vô kı danh ®Ö tö cña ThiÕu L©m ph¸i, trë thµnh ®Ö tö ThiÕu L©m. ")
end;
