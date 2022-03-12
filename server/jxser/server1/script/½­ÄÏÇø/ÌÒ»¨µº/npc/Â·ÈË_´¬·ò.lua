-- ½­ÄÏÇø ÌÒ»¨µº Â·ÈË_´¬·ò.lua
-- by: Dan_deng(2004-05-15)

Include("\\script\\missions\\autohang\\head.lua")
g_mapList = {235, 236, 237, 238, 239, 240, 241};
function main()
	-- Ãâ·ÑË«¾­Ñé
	if (AEXP_IsFreeTimeDoubleExp() == 1) then-- Ãâ·ÑË«¾­ÑéÈÕ×Ó
		Say("GÇn ®©y linh khİ cña §µo Hoa §¶o rÊt thŞnh. Kh«ng cÇn dïng ch¸o L¹p B¸t còng cã thÓ luyÖn c«ng. C¬ héi tèt thÕ nµy. CÇn ph¶i biÕt tËn dông. NÕu nh­ muèn trë vÒ ph¶i tr¶ 1800 ng©n l­îng. ", 2, "VÒ thµnh/go_yes", "Ch­a vÒ /no")		
		return 1;
	end
	
	nValue = GetTask(AEXP_TASKID);
	if (nValue > AEXP_TIME_UPDATE) then -- ÈÔÓĞ¹Ò»úÊ±¼ä
		Say("VŞ kh¸ch nµy! Xem thÇn khİ cña ng­êi nh­ vËy, nhÊt ®Şnh lµ ®· dïng thø ch¸o truyÒn thuyÕt L¹p B¸t ë ®©y råi ph¶i kh«ng? Nghe nãi ch¸o L¹p B¸t chØ cã ë §µo Hoa ®¶o nµy míi cã c«ng hiÖu. ChØ cã mét giê, cÇn ph¶i tËn dông. NÕu nh­ muèn vÒ thµnh th× ph¶i tr¶ 1800 ng©n l­îng.", 2, "VÒ thµnh/go_yes", "Ch­a vÒ /no")
	else 
		Say("VŞ kh¸ch nµy! Xem thÇn khİ cña ng­êi nh­ vËy, nhÊt ®Şnh lµ ®· dïng thø ch¸o truyÒn thuyÕt L¹p B¸t ë ®©y råi ph¶i kh«ng? Nghe nãi ch¸o L¹p B¸t chØ cã ë §µo Hoa ®¶o nµy míi cã c«ng hiÖu. ChØ cã mét giê, cÇn ph¶i tËn dông. NÕu nh­ muèn vÒ thµnh th× ph¶i tr¶ 1800 ng©n l­îng.",2,"VÒ thµnh/go_yes","Ch­a vÒ /no")
	end
end

function go_yes()
	if (GetCash() >= 1800) then
		Pay(1800)
		Msg2Player("Ngåi ch¾c nhĞ! Chóng ta vÒ thµnh ")
		SetAutoHangMapFlag(0) -- ÉèÖÃÍË³ö¹Ò»úµØÍ¼±ê¼Ç(·Å¿ªÔ­À´±»ÆÁ±ÎµÄ¹«ÁÄ¡¢»Ø³ÇµÈ¹¦ÄÜ)
		
		-- ¼ÇÂ¼Àë¿ªÊ±µÄÔÚÏßÊ±¼ä
		nOLTime = GetGameTime();
		SetTask(AEXP_OLTIME_TASKID, nOLTime);
		
		back_home();
		SetFightState(1)
	else
		Talk(1,"","Muèn vÒ thµnh ph¶i tr¶ 1800 ng©n l­îng. Mau lÊy tiÒn ra ®©y")
	end
end;

function back_home()
	nSubWorldID = SubWorldIdx2ID();

	if (nSubWorldID == g_mapList[1]) then
		NewWorld(176, 1614, 2561) -- ÁÙ°²
	elseif (nSubWorldID == g_mapList[2]) then
		NewWorld(80, 1345, 3359) -- ÑïÖİ
	elseif (nSubWorldID == g_mapList[3]) then
		NewWorld(78, 1299, 3483) -- ÏåÑô
	elseif (nSubWorldID == g_mapList[4]) then
		NewWorld(37, 1938, 2459) -- ãê¾©
	elseif (nSubWorldID == g_mapList[5]) then
		NewWorld(162, 1642, 2935) -- ´óÀí
	elseif (nSubWorldID == g_mapList[6]) then
		NewWorld(11,3100,4822) -- ³É¶¼
	elseif (nSubWorldID == g_mapList[7]) then
		NewWorld(1, 1528, 2733) -- ·ïÏè
	else
		Msg2Player("B¸o lçi! B¹n ®· ®i tõ thµnh thŞ nµo ®Õn §µo Hoa ®¶o? Xin lËp tøc liªn hÖ víi GM ®Ó ph¶n ¶nh!");
	end	
end;

function no()
end;
