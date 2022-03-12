-- ËşÁÖÃÔ¹¬ Õ½¶·NPC £¿£¿ 30¼¶ÈÎÎñ
-- by£ºDan_Deng(2003-08-01)

function OnDeath()
	UTask_sl = GetTask(7);
	if (UTask_sl == 30*256+10) and (random(0,99) < 50) then
		SetTask(7,30*256+20)
		Msg2Player("Th× ra kÎ hµnh tung bİ mËt nµy lµ tay ch©n cña ng­êi Kim, ®ång ®¶ng cña chóng ®· lÊy c¾p B¸t Nh· Ba La MËt §a T©m Kinh, ch¹y ®Õn Kim Quang ®éng phİa t©y B¾c KiÕm C¸c. ")
		AddNote("Ng­êi hµnh tung bİ mËt ë Th¸p L©m lµ tay ch©n cña ng­êi Kim, ®ång ®¶ng cña chóng ®· lÊy c¾p B¸t Nh· Ba La MËt §a T©m Kinh, ch¹y ®Õn Kim Quang ®éng phİa T©y B¾c KiÕm C¸c. ")
	end
end;
