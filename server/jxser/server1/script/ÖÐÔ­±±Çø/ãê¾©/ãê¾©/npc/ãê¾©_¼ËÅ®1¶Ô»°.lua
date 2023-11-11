--ÖĞÔ­±±Çø ãê¾©¸® ¼ËÅ®1¶Ô»°

-- ĞŞ¸ÄºóÓëĞ°½ÌÖ÷ÏßÏà¹ØµÄãê¾©ÈçÓñ½Å±¾
-- Edited by peres
-- 2005/01/18

Include("\\script\\task\\newtask\\newtask_head.lua");
Include("\\script\\task\\newtask\\lib_setmembertask.lua");
Include("\\script\\task\\newtask\\master\\xiepai\\maintask.lua");

function main(sel)

-- ĞÂÈÎÎñÏµÍ³ÓëĞ°½ÌÖ÷ÏßÏà¹ØµÄ½Å±¾ --

local myTaskValue = GetTask(1003)
local myCamp = nt_getCamp()

	if (myTaskValue==300) then -- ÔÚãê¾©ÓëÈçÓñµÄ¶Ô»°
		task_level50_03();
		return
	end

	
-- ĞÂÈÎÎñÏµÍ³ÓëĞ°½ÌÖ÷ÏßÏà¹ØµÄ½Å±¾ --

if ( GetSex() == 0 ) then      -- Íæ¼ÒĞÔ±ğÎªÄĞ
Say("C«ng tö! §­êng xa mâi mÖt! Vµo uèng víi tiÓu n÷ 1 ly r­îu ®i!",0)
else			       -- Íæ¼ÒĞÔ±ğÎªÅ®
Say("Xem d¸ng c«ng tö phong trÇn thanh nh·! Cho phĞp tiÓu n÷ ngåi c¹nh nhĞ!", 0)
end;

end;


