-- Ø¤°ï Õ½¶·NPC ÃÏÔ¶²Å 20¼¶ÈÎÎñ
-- by£ºDan_Deng(2003-07-28)

function OnDeath()
	UTask_gb = GetTask(8);
	if (UTask_gb == 20*256+10) then			--´ø×Å20¼¶ÈÎÎñ
		Talk(2,"","Ta thay mÆt anh em trong bang gi¸o huÊn ng­¬i. Muèn ng­¬i ph¶i th­êng xuyªn nÕm ®­îc mïi vŞ cña sù gi¸o huÊn, nÕu nh­ ng­¬i vÉn cßn tiÕp tôc lµm cµn, ta sÏ kh«ng quan t©m ®Õn chuyÖn ng­¬i lµ th©n thİch cña ai, ®¸nh kh«ng th­¬ng tiÕc!","Ta sî råi! Sau nµy kh«ng d¸m n÷a!")
		SetTask(8,20*256+20)
		AddNote("§· gi¸o huÊn cho M¹nh ViÔn Tµi mét trËn nhí ®êi ")
		Msg2Player("§· gi¸o huÊn cho M¹nh ViÔn Tµi mét trËn nhí ®êi ")
	end
end;
