
-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµonline ×ªÉúÈÎÎñ ±±¶·³¤ÉúÊõ»ù´¡Æª µÀ¾ß
-- FileName: jiayi_shengong.lua
-- Edited: ×Ó·ÇÓã
-- 2007-03-30	20:14:00

-- ======================================================

Include("\\script\\task\\metempsychosis\\task_func.lua")

function main()
	
	if (check_zhuansheng_level() == 1) then
		
		if (GetTask(TSK_ZHUANSHENG_FLAG) == 0) then
			Msg2Player(format("§· häc ®­îc %s, vµ cÇn ph¶i häc %s míi cã thÓ c«ng thµnh danh to¹i ®­îc.", "<B¾c §Èu Tr­êng Sinh ThuËt - C¬ Së Thiªn>", "<B¾c §Èu Tr­êng Sinh ThuËt - T©m Ph¸p Thiªn>"));
			Say(format("§· häc ®­îc %s,  nh­ng vâ c«ng vÉn ch­a ®­îc n©ng cÊp, xem ra trong ®©y vÉn cã ®iÒu  bİ Èn vÉn ch­a kh¸m ph¸ ra. Cã thÓ ®Õn %s<color=yellow> %s<color> t×m hiÓu tin tøc thö xem.", 
							"<B¾c §Èu Tr­êng Sinh ThuËt - C¬ Së Thiªn>", "Minh NguyÖt TrÊn", "B¾c §Èu L·o Nh©n"), 0);
			
			SetTask(TSK_ZHUANSHENG_FLAG,1);
			
			WriteLog(format("[NhiÖm vô trïng sinh]\t%s\tName:%s\tAccount:%s\t CÊp bËc häc:%d, M«n ph¸i:%d",
						GetLocalDate("%Y-%m-%d %X"),GetName(), GetAccount(),
						GetLevel(), GetLastFactionNumber()));
			return 0;
		else
			Msg2Player("§· häc <B¾c §Èu Tr­êng Sinh ThuËt - C¬ Së Thiªn> råi, chØ cÇn häc thªm <B¾c §Èu Tr­êng Sinh ThuËt - T©m Ph¸p Thiªn> lµ cã thÓ c«ng thµnh danh to¹i ®­îc råi.");
			return 1;
		end
	
	end
	return 1;
end
