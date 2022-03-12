-- ÁúÃÅÕò¡¡Â·ÈË¡¡Ëï¼ÒÉ©×Ó
-- by£ºDan_Deng(2003-09-16)

Include("\\script\\global\\repute_head.lua")

function main()
	Uworld41 = GetByte(GetTask(41),1)
	if (GetLevel() >= 40) and (GetReputeLevel(GetRepute()) >= 5) then		-- ·ûºÏÈÎÎñÌõ¼ş
		if (Uworld41 == 0) or (Uworld41 == 5) then			-- ÈÎÎñÆô¶¯
			Talk(4,""," (Khãc than) ","VŞ ®¹i tÈu nµy, cã chuyÖn g× mµ ®au buån thÕ.? "," (Khãc than) ","... ")
			SetTask(41,5)
		elseif (Uworld41 == 10) or (Uworld41 == 30) then	-- ÈÎÎñ½øĞĞÖĞ
			Talk(1,"","§¹i hiÖp muèn gióp chóng ta mang TiÓu Quyªn vÒ ph¶i kh«ng? V« cïng c¶m t¹! ")
		elseif (Uworld41 == 100) then					-- ÒÑ¾­¾È³öĞ¡¾ê£¬ÈÎÎñÎ´½»
			Talk(1,"","TiÓu Quyªn! Con ®· trë vÒ! ThËt khæ cho con qu¸. Con mau ®i gÆp cha ®Ó ng­êi khái lo l¾ng.")
		else		-- ÈÎÎñÒÑÍê³É
			Talk(1,""," ThËt c¶m t¹ ®¹i hiÖp! Ta vµ mÊy ng­êi kh¸c sÏ tÆng ®¹i hiÖp mét ph­¬ng thuèc tr­êng sinh.")
		end
	else
		Talk(1,"","§µn «ng nhµ nµy, tõ s¸ng ®Õn tèi cø m¬ t­ëng viÔn v«ng, c¸i g× lµ chİ khİ, c¸i g× lµ anh hïng? Tßan lµ ®å bá ®i, kh«ng lo cho cuéc sèng thùc t¹i!")
	end
end;
