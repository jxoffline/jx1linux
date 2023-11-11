-- TimerHead.lua
-- By: Dan_Deng(2003-08-23) ¼ÆÊ±Æ÷Ïà¹Ø¹¤¾ß

FramePerSec = 18			-- Ã¿ÃëÖ¡Êıµ±×÷³£Á¿´¦Àí
CTime = 600					-- Ã¿¸öÊ±³½°´600Ãë£¨10·ÖÖÓ£©¼ÆËã

function GetRestSec(i)		-- Ö±½Ó·µ»Ø¼ÆÊ±Æ÷Ê£ÓàÃëÊı
	return floor(GetRestTime(i) / FramePerSec)
end;

function GetRestCTime(i)			-- »ñÈ¡¼ÆÊ±Æ÷Ê£ÓàÊ±¼ä£¬´óÓÚÒ»¸öÊ±³½Ê±°´ÖĞ¹úÊ±¼ä×ª»»
	x = floor(GetRestTime(i) / FramePerSec)
	if (x < CTime) then		-- ²»×ãÒ»¸öÊ±³½
		y = x.." gi©y"
	else
		y = floor(x / CTime).."mét giê "
	end
	return y
end;

function GetTimerTask(i)			-- Í¨¹ı¼ÆÊ±Æ÷IDºÅ½âÎöÏàÓ¦ÈÎÎñ
	
end