--ÖĞÔ­±±Çø ãê¾©¸® Â·ÈË18³ÂÈı±¦¶Ô»°

-- ĞŞ¸ÄºóÓëĞ°½ÌÖ÷ÏßÏà¹ØµÄãê¾©³ÂÈı±¦½Å±¾
-- Edited by peres
-- 2005/01/18

Include("\\script\\task\\newtask\\newtask_head.lua");
Include("\\script\\task\\newtask\\lib_setmembertask.lua");
Include("\\script\\task\\newtask\\master\\xiepai\\maintask.lua");

function main(sel)

-- ĞÂÈÎÎñÏµÍ³ÓëĞ°½ÌÖ÷ÏßÏà¹ØµÄ½Å±¾ --

local myTaskValue = GetTask(1003)
local myCamp = nt_getCamp()

	if (myTaskValue==310) then
		task_level50_05();
		return
	elseif (myTaskValue==329) then
		task_level50_06();
		return
	elseif (myTaskValue==330) then -- Íæ¼ÒÄÃµ½ÁËÀ¶»¨´ÉÆ¿ºó»ØÀ´Óë³ÂÈı±¦µÄ¶Ô»°
		Say("NÕu nh­ ng­¬i cã thÓ t×m gióp ta b×nh hoa ®ã th× xem nh­ ng­¬i lµ ©n nh©n cña c¶ gia téc ta!",0);
		return
	elseif (myTaskValue==340) then
		task_level50_10();
		return
	end

	
-- ĞÂÈÎÎñÏµÍ³ÓëĞ°½ÌÖ÷ÏßÏà¹ØµÄ½Å±¾ --

Say("Toµn lµ hµng sµnh sø h¶o h¹ng ®©y! Kim cæ ®Òu cã! Kh¸ch quan! Chjän 1 c¸i ®i!",0)

end;

