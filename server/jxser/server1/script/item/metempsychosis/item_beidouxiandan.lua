-- ====================== ÎÄ¼þÐÅÏ¢ ======================

-- ½£ÏÀÇéÔµÍøÂç°æÔ½ÄÏ - ±±¶·ÏÉµ¤
-- ÎÄ¼þÃû¡¡£ºitem_beidouxiandan.lua
-- ´´½¨Õß¡¡£º×Ó·Çô~
-- ´´½¨Ê±¼ä£º2009-02-26 13:30:12

-- ======================================================

Include("\\script\\task\\metempsychosis\\task_func.lua");	-- ×ªÉúÍ·ÎÄ¼þ
Include("\\script\\task\\task_addplayerexp.lua");			-- ¼Óµþ¼Ó¾­Ñé

function main(nItemIndex)
	local nphase = GetTask(TSK_ZHUANSHENG_XIANDAN);
	
	if (nphase == 1) then
		if (ST_IsTransLife() == 1) then
			local n_itemexp = GetItemParam(nItemIndex, 1);
			if (n_itemexp > 0 and n_itemexp <= 19900) then
				tl_addPlayerExp(n_itemexp*10000000);
				
				SetTask(TSK_ZHUANSHENG_XIANDAN, 2);
				
				Msg2Player(format("Thu ®­îc %d ngµn v¹n kinh nghiÖm.", n_itemexp));
				WriteLog(format("[%s]\t%s\tName:%s\tAccount:%s\tUsed,LEVEL:%d,FACTION:%d,AddExp:%d0000000",
						"B¾c §Èu Tiªn §¬n",
						GetLocalDate("%Y-%m-%d %X"),GetName(), GetAccount(),
						GetLevel(), GetLastFactionNumber(), n_itemexp));
			else
				return 1;
			end
		else
			Say("VÉn ch­a trïng sinh th× kh«ng thÓ sö dông B¾c §Èu Tiªn §¬n ®­îc.", 0);
			return 1;
		end
	else
		Say("B¾c §Èu Tiªn §¬n nµy kh«ng ph¶i cña ®¹i hiÖp nªn kh«ng thÓ sö dông ®­îc.", 0);
		return 1;
	end
end

function GetDesc(nItemIndex)
	local n_itemexp = GetItemParam(nItemIndex, 1);
	return format("Trong Tiªn §¬n cã : %d ngµn v¹n kinh nghiÖm.", n_itemexp);
end
