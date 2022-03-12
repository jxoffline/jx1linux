-- ÁÙ°²¡¡Â·ÈË¡¡¶¡ÀÚ
-- by£ºDan_Deng(2003-09-16)

-- ¸÷¸ö¼¶±ğµÄÍ¬°é¾çÇéÈÎÎñÊµÌå´¦ÀíÎÄ¼ş
Include ("\\script\\task\\partner\\master\\partner_master_main_03.lua");

function main()

	-- ¾çÇéÆª
	if taskProcess_003_02:doTaskEntity()~=0 then return end;
	if taskProcess_003_04:doTaskEntity()~=0 then return end;

	-- ĞŞÁ¶Æª
	if rewindProcess_003_02:doTaskEntity()~=0 then return end;
	if rewindProcess_003_04:doTaskEntity()~=0 then return end;


	Talk(1,"","Lò ng­êi Kim chØ lµ mét ®¸m man di mäi rî, h÷u dòng v« m­u. Lµm sao chóng cã thÓ lµm ®èi thñ cña §¹i Tèng? ViÖc g× chóng ta cø ph¶i khinh sî chóng, tù hï däa m×nh? §· cã Hoµng Th­îng ë ®©y, ta tin t­ëng bän ng­êi Kim kia sÏ kh«ng thÓ tÊn c«ng ®Õn L©m An nµy. ")

end;
