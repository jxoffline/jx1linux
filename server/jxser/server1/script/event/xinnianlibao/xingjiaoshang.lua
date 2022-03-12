-- ĞĞ½ÅÉÌÈË½Å±¾
-- 2005-12-07 for newyear gift

function main()

	Say("Kh¸ch quan cÇn b¶o vËt g× cø më <color=yellow>Kú Tr©n C¸c<color> chän lµ ®­îc. Cuèi cïng l·o phu còng cã thÓ nghØ ng¬i råi!", 0);
	return

--	Say("ĞĞ½ÅÉÌÈË£ºÕâÎ»¿Í¹Ù£¬¿ì¹ıÄêÁË×¼±¸Äê»õÊÇ°É£¿ÎÒÕâ¶ùĞÂ½øµÄÒ»ÅúÄê»õ<color=yellow>¡°¶¬ÈÕÅ¨Çé´óÀñ°ü¡±<color>£¬¾­¼ÃÊµ»İ£¬×ßÇ×´®ÓÑ»òÄúÁô×Å×Ô¼ºÓÃ¶¼ºÏÊÊ°¢£¬Ëæ±ã¿´¿´°É£¡", 
--	6,
--			"¹ºÂòÔªµ©µÀ¾ßÀñ°ü/buy_yuandan",
--			"¹ºÂòÍ¬°éÃæ¾ßÀñ°ü/buy_partnermask",
--			"¹ºÂòËæ»úÈÎÎñÀñ°ü/buy_randomtask",
--			"¹ºÂòÍ¬°é¼¼ÄÜÊéÀñ°ü/buy_skillbook",
--			"¹ºÂò°×¾ÔÍèÀñ°ü/buy_baijuwan",
--			"ÎÒ¾ÍÊÇ¿´¿´/OnCancel")
end

function OnCancel()
end

function buy_partnermask()
	Sale(132, 3)
end

function buy_randomtask()
	Sale(133, 3)
end

function buy_skillbook()
	Sale(134, 3)
end

function buy_baijuwan()
	Sale(135, 3)
end

function buy_yuandan()
	Sale(137, 3)
end