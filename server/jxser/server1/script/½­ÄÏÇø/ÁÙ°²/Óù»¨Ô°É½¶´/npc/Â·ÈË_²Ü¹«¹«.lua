-- ÁÙ°²»Ê¹¬ÃØµÀ Â·ÈËNPC ²Ü¹«¹«£¨Ø¤°ï50¼¶ÈÎÎñ£©
-- by£ºDan_Deng(2003-07-28)

function main()
	UTask_gb = GetTask(8)
	if (UTask_gb == 50*256+20) and (HaveItem(199) == 1) then		-- 50¼¶ÈÎÎñ£¬µÚÒ»´Î½ø¹¬
		Talk(3,"L50_after1","VŞ c«ng c«ng nµy! Ta muèn vµo gÆp Hoµng th­îng. Cã mét vËt quan träng muèn giao cho Hoµng th­îng. "," Hoµng th­îng hiÖn ®ang nghØ ng¬i. Cø giao vËt ®ã cho ta. Ta sÏ chuyÓn ®Õn cho Hoµng th­îng","µ…chuyÖn nµy… ","Sao h¶? Kh«ng tin t­ëng ta µ? Còng kh«ng chŞu hái tr­íc xem Tµo c«ng c«ng ta lµ ng­êi nh­ thÕ nµo. Hoµng th­îng tõ nhá ®Õn lín ®Òu do ta s¨n sãc. LÏ nµo ta l¹i ®i g¹t ng­¬i sao? ","VËy còng ®­îc!")
	elseif (UTask_gb == 50*256+50) then		--50¼¶ÈÎÎñ£¬µÚ¶ş´Î½ø¹¬´ò°ÜÁËÎÀÊ¿Ö®ºó
		Talk(7,"L50_after2","Xin h·y tha m¹ng!","Nãi! Bøc ®Şa ®å Trung Nguyªn hiÖn ®ang ë ®©u?","ë chç ta! ë chç ta!","Ta vèn muèn ®Õn ®Ó giÕt ng­¬i ®©y!","Xin h·y tha m¹ng!","Nh­ng mµ ta l¹i kh«ng muèn khiÕn cho Hoµng th­îng kinh sînªn míi tha cho c¸i m¹ng cña ng­¬i. Ng­¬i h·y tù gi÷ lÊy c¸i m¹ng cña m×nh. NÕu nh­ cßn c©u kÕt víi bän ng­êi Kimm·i quèc cÇu vinh th× thiªn h¹ còng sÏ kh«ng tha cho ng­¬i. ","D¹! D¹!")
	elseif (UTask_gb == 50*256+40) then			-- 50¼¶ÈÎÎñ£¬µÚ¶ş´Î½øÎ´´òÎÀÊ¿
		Talk(1,"","Kh«ng ®­îc qua ®©y! VÖ sÜ! Mau ®Õn cøu mang!")
	else
		Talk(1,"","Cã thİch kh¸ch! VÖ sÜ!")
		SetFightState(0)
		NewWorld(176, 1627, 3206)
	end
end;

function L50_after1()
	AddNote("Giao bøc ®Şa ®å cho Tµo c«ng c«ng. ")
	Msg2Player("Giao bøc ®Şa ®å cho Tµo c«ng c«ng. ")
	DelItem(199)
	SetTask(8,50*256+30)
	SetFightState(0)
	NewWorld(176, 1627, 3206)
end

function L50_after2()
	AddEventItem(199)
	AddNote("§o¹t l¹i bøc ®Şa ®å Trung Nguyªn. ")
	Msg2Player("§o¹t l¹i bøc ®Şa ®å Trung Nguyªn. ")
	SetFightState(0)
	NewWorld(176, 1627, 3206)
end
