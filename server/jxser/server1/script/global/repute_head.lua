-- ReputeHead.lua
-- By: Dan_Deng(2003-08-23) ÈÎÎñÉùÍûÏà¹Ø¹¤¾ß

function ReturnRepute(default_repute,max_level,reduce_rate)		-- ½ÓÊÕ±ê×¼ÉùÍû½±ÀøÓëÈÎÎñµÈ¼¶£¬È»ºó¸ù¾İÍæ¼ÒÊµ¼ÊµÈ¼¶¾ö¶¨Ó¦½±Àø¶àÉÙÉùÍû
	player_level = GetLevel()
	if (GetLevel() <= max_level) then		-- Èç¹ûÍæ¼ÒµÈ¼¶²»³¬¹ıÈÎÎñ±ê×¼µÈ¼¶10¼¶£¬Ôò¿ÉÒÔ»ñµÃÕı³£ÉùÍû½±Àø
		player_repute = default_repute
	else															-- ·ñÔòÔÚ10¼¶ÒÔÉÏÃ¿³¬¹ıÒ»¼¶¼õ3%ÉùÍû½±Àø
		player_repute = floor(default_repute * (1 - (player_level - max_level) * reduce_rate / 100))
		if (player_repute < 1) then				-- Èç¹ûÉùÍû½±ÀøĞ¡ÓÚ1£¬Ôò½±Àø1µãÉùÍû
			player_repute = 1 
		end
	end
	return player_repute				-- ·µ»ØÓ¦µÃÉùÍû½±Àø
end

function GetLevelRepute(i)			-- ·µ»ØÃ¿Ò»µÈ¼¶ËùĞèÉùÍû
	Repute_level = {0,8,30,75,150,240,450,750,1200,2250,3600}			-- Ã¿Ò»µÈ¼¶ÉùÍû¶¨Òå£¨×¢Òâ¸üĞÂ£©
	if (i <= 0) then
		return 0
	else
		return Repute_level[i + 1]
	end
end

function GetReputeLevel(i)			-- ·µ»ØÉùÍûµÈ¼¶£¨ÈÎÎñÖĞ¸ù¾İÉùÍûµÈ¼¶ÅĞ¶Ï£¬¶øµÈ¼¶¶¨ÒåÔòÔÚ´Ë´¦Í³Ò»¿ØÖÆ£©
	if (i >= 3600) then				-- È±Ê¡24000,10¼¶
		return 10
	elseif (i >= 2250) then		-- È±Ê¡15000,9¼¶
		return 9
	elseif (i >= 1200) then			-- È±Ê¡8000,8¼¶
		return 8
	elseif (i >= 750) then			-- È±Ê¡5000,7¼¶
		return 7
	elseif (i >= 450) then			-- È±Ê¡3000,6¼¶
		return 6
	elseif (i >= 240) then			-- È±Ê¡1800,5¼¶
		return 5
	elseif (i >= 150) then			-- È±Ê¡1000,4¼¶
		return 4
	elseif (i >= 75) then			-- È±Ê¡500,3¼¶
		return 3
	elseif (i >= 30) then			-- È±Ê¡200,2¼¶
		return 2
	elseif (i >= 8) then			-- È±Ê¡50,1¼¶
		return 1
	elseif (i >= 0) then			-- 0£¬0¼¶
		return 0
	else								-- ³ö´íÁË
		return -1
	end
end

function GetReputeStr(Repute_Level)
	if (Repute_Level == 1) then
		Repute_title = "S¬ XuÊt Giang Hå "
	elseif (Repute_Level == 2) then
		Repute_title = "V« Danh TiÓu Bèi"
	elseif (Repute_Level == 3) then
		Repute_title = "MÆc MÆc V« V¨n"
	elseif (Repute_Level == 4) then
		Repute_title = "S¬ HiÓn Phong Mang"
	elseif (Repute_Level == 5) then
		Repute_title = "TiÓu H÷u Danh Khİ "
	elseif (Repute_Level == 6) then
		Repute_title = "Danh §Çu H­ëng L­îng"
	elseif (Repute_Level == 7) then
		Repute_title = "Uy TrÊn NhÊt Ph­¬ng"
	elseif (Repute_Level == 8) then
		Repute_title = "Ng¹o ThŞ QuÇn Hïng"
	elseif (Repute_Level == 9) then
		Repute_title = "NhÊt §¹i T«ng s­ "
	elseif (Repute_Level == 10) then
		Repute_title = "TiÕu Ng¹o giang hå "
	else
		Repute_title = "B×nh d©n b¸ t¸nh"
	end
	return Repute_title
end

function nothing()
end
