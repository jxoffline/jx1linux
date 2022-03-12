-- Ø¤°ï Â·ÈËNPC Ø¤°ïµÜ×Ó1 20¼¶ÈÎÎñ
-- by£ºDan_Deng(2003-07-28)

function main()
	UTask_gb = GetTask(8)
	if (UTask_gb == 20*256) and (GetLevel() >= 20) and (GetFaction() == "gaibang") then		--20¼¶ÈÎÎñ
		Say("C¸i tªn M¹nh ViÔn Tµi ®ã vèn cho m×nh lµ con ch¸u cña Tr­ëng l·o C¸i Bang. Ngµy th­êng hay ng«ng nghªnh kho¸c l¸c víi huynh ®Ö trong bang. H¾n biÕt râ m×nh sai, nh­ng vÉn cè chÊp. KÕt qu¶ lµ bŞ ®¸nh cho mét trËn, thËt lµ ®¸ng ®êi! ",2,"D¹y dç nghŞch tö /L20_get_yes","Chİnh nh©n hµnh ®¹o /L20_get_no")
	elseif (UTask == 20*256+10) then
		Talk(1,"","Ng­¬i nhÊt ®Şnh ph¶i cÈn thËn! C¸i tªn M¹nh ViÔn Tµi û thóc thóc h¾n lµ Tr­ëng l·o C¸i Bang míi d¸m b¾t n¹t ng­êi nh­ thÕ!")
	else
		Talk(1,"","M¹nh ViÔn Tµi th­êng b¾t n¹t ®Ö tö cÊp thÊp, thËt lµ tåi tÖ! ")
	end
end;

function L20_get_yes()
	Talk(3,"after_get","Lı nµo nh­ vËy! M¹nh ViÔn Tµi hiÖn ®ang ë ®©u?","H×nh nh­ ë phİa T©y rõng, ng­¬i nhí ®õng g©y chuyÖn víi h¾n, nÕu ®¾c téi víi M¹nh tr­ëng l·o th× phiÒn phøc l¾m! "," Ng­¬i yªn t©m! Ta nhÊt ®Şnh sÏ 'gióp h¾n' thÊy l¹i chİnh ®¹o! ")
end;

function after_get()
	SetTask(8,20*256+10)
	AddNote("NhËn nhiÖm vô cÊp 20: Gi¸o huÊn M¹nh ViÔn Tµi ")
	Msg2Player("NhËn nhiÖm vô cÊp 20: Gi¸o huÊn M¹nh ViÔn Tµi ")
end

function L20_get_no()
	Talk(2,"","Huynh ®Ö! NhÉn nhôc chót ®i! Nh­ vËy ch¼ng tèt h¬n sao?","Çy! ")
end;
