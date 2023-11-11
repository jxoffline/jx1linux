
-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonline Ò°ÛÅËÀÍö½Å±¾
-- Edited by peres
-- 2006/12/26 PM 15:39

-- æÌÊ¦½ãÎªÎÒ´©ÉÏÒÂ·şÊ±Í»È»Ğ¦×ÅËµµÀ£¬ÃÃÃÃ³öÂäµÃÔ½À´Ô½Ë®ÁéÁË¡£
-- ²»¶®ÕâÏÉÅ®°ãµÄÓñÌåÒÔºó»áÍĞ¸¶¸øÄÄ¸öÄĞÈËÄØ¡£
-- Å®×Ó³¤´óÒÔºóÒ»¶¨»á½«Éí×ÓÍĞ¸¶¸øÄĞÈËÂğ£¿ÎÒµÄÁ³Î¢Î¢ÕÇºìÁËÒ»ÏÂ¡£
-- æÌÊ¦½ãÍäÏÂÑü°ïÎÒ°ÑÈ¹´øÊøºÃ£¬ËıËµ£¬ÊÇµÄ¡£
-- ÒòÎª£¬ÕâÊÇÅ®×ÓÒ»ÉúµÄËŞÃü¡£

-- ======================================================

function OnDeath()
	DoTeamProcess(addSeasonnpcExp);
end;


-- ¶ÔËùÓĞ¶ÓÔ±Ö´ĞĞÍ¬Ò»¹ı³Ì
function DoTeamProcess(funProcess)

local nPreservedPlayerIndex = PlayerIndex;
local nMemCount = GetTeamSize();

	if (nMemCount == 0) then
		funProcess();
	else
		for i = 1, nMemCount do -- ÔÚÕâÀï¿ªÊ¼Ñ­»·±éÀúÃ¿¸öÍæ¼Ò
			PlayerIndex = GetTeamMember(i);
			funProcess();
		end;
		PlayerIndex = nPreservedPlayerIndex; -- Ñ­»·½áÊøºóÔÚÕâÀï¹é»¹Ö÷Íæ¼Ò ID
	end;
end;


function addSeasonnpcExp()
	AddOwnExp(50000);
	Msg2Player("Hoµn thµnh nhiÖm vô D· TÈu nhËn ®­îc <color=green>50000 ®iÓm kinh nghiÖm<color>!");
end;