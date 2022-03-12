Include("\\script\\tong\\tong_header.lua");

Include("\\script\\global\\repute_head.lua")

function CheckLeaveTongPower()
	str, result = GetTong()		--ÅĞ¶ÏÊÇ·ñ´¦ÓÚ°ï»áÖĞ
	if (result == 1) and (str ~= "") then
		-- LLG_ALLINONE_TODO_20070802
--		need_money = {10000,100000,500000}
		need_money = {500000,100000,10000,10000,10000}
		figure = GetTongFigure()		--ÅĞ¶Ï½ÇÉ«ÔÚ°ï»áÖĞµÄÉí·İ
		if (figure == TONG_MASTER) then
			Msg2Player("Bang chñ kh«ng cho phĞp ph¶n béi bang héi ")
			return 0
		else
			if (GetCash() >= need_money[figure]) then
				SetTaskTemp(11,need_money[figure])
				Nrepute = check_repute(figure)		-- Í¨¹ı°ï»áÖĞµÄÖ°Î»ÅĞ¶ÏÓ¦¼õ¶àÉÙÉùÍû
				SetTaskTemp(12,Nrepute)
				Msg2Player("C¶nh c¸o: rêi khái bang héi sÏ bŞ trõ tiÒn"..need_money[figure].."Ph¹t tiÒn gÊp ®«i vµ ®iÓm danh väng còng h¹ t­¬ng øng"..Nrepute.."®iÓm!")
				return need_money[figure]		--¸ù¾İÉí·İÅĞ¶ÏÊÇ·ñ¹»Ç®
			else
				Msg2Player("C¶nh c¸o: rêi khái bang héi sÏ bŞ trõ tiÒn"..need_money[figure].."Ph¹t tiÒn gÊp ®«i, nh­ng b©y giê b¹n ch­a ®ñ tiÒn")
				return 0
			end
		end
	else
		Msg2Player("B¹n hiÖn giê kh«ng thuéc bang héi nµo!")
		return 0
	end
end;

function check_repute(Tong_title)		-- Í¨¹ıÔÚ°ï»áÖĞµÄÖ°Î»ÅĞ¶ÏÓ¦¼õ¶àÉÙÉùÍû
	Rep = GetRepute()
	Repute_Level = GetReputeLevel(Rep)
	if (Tong_title == TONG_ELDER) then			-- ³¤ÀÏ
		reduce_repute = GetLevelRepute(Repute_Level) - GetLevelRepute(Repute_Level - 1)			-- Ó¦¸Ã½µµÍµÄÉùÍû
	elseif (Tong_title == TONG_MANAGER) then		-- ¶Ó³¤
		reduce_repute = floor((GetLevelRepute(Repute_Level) - GetLevelRepute(Repute_Level - 1)) * 0.5)
	else								-- °ïÖÚ¡¢ÒşÊ¿
		reduce_repute = floor((GetLevelRepute(Repute_Level) - GetLevelRepute(Repute_Level - 1)) * 0.25)
	end
	if (Rep <= reduce_repute) then	-- Èç¹ûÉùÍû²»×ãÔò¼õÎª0
		reduce_repute = Rep 
	end
	return reduce_repute
end
